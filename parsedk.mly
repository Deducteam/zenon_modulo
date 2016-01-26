/*  Copyright 2005 INRIA  */
/*  Copyright 2014 Ali Assaf */
/*  Copyright 2014 Raphaël Cauderlier */
%{
Version.add "$Id: parsedk.mly,v 1.34 2012-04-11 18:27:26 doligez Exp $";;

open Expr
open Printf

let mk_const s ty = eapp (tvar s ty, []);;
let mk_const_t s = mk_const s type_type;;

(* Global list of type aliases *)
let ty_aliases = ref [];;

(* Needed for parsing number literals *)
let type_nat = mk_const_t "dk_nat.nat";;

exception Unknown_builtin of string;;
exception Bad_arity of string * int;;

exception Application_head_is_not_a_var of expr;;

let rec get_params e =
  match e with
  | Elam (v, body, _) ->
      let (p, e1) = get_params body in
      (v :: p, e1)
  | _ -> ([], e)
;;

let rec mk_app l =
  match l with
  | [] -> assert false
  | [e] -> e
  | Elam (v, body, _) :: arg :: tail ->
     mk_app (substitute_2nd_unsafe [(v, arg)] body :: tail)
  | head :: tail ->
     match head with
     | Evar _ ->
        eapp (head, tail)
     | Eapp (v, l, _) ->
        eapp (v, l @ tail)
     | e ->
        Log.debug 15 "Parse Error: head is %a"
                  Print.pp_expr head;
        raise Parse_error

(* Transform free variables not occuring in vars into constants.  This
   is needed because we can not distinguish variables and constants
   when we see them deep inside terms but we can call this function on
   terms which are known to be toplevel. *)
let rec close_term vars = function
  | e when Expr.equal e type_type -> type_type (* To avoid trying to type type *)
  | e when Expr.equal e type_prop -> type_prop (* Because reconstructing type_prop leads to a non-convertible term *)
  | Evar (s, _) as v ->
     let ty = close_term vars (get_type v) in
     let x = tvar s ty in
     if List.mem s vars then x else eapp (x, [])
  | Eapp (Evar (s, _) as f, l, _) ->
     let ty = close_term vars (get_type f) in
     let f' = tvar s ty in
     eapp (f', List.map (close_term vars) l)
  | Etrue | Efalse as e -> e
  | Enot (e, _) -> enot (close_term vars e)
  | Eand (a, b, _) -> eand (close_term vars a, close_term vars b)
  | Eor (a, b, _) -> eor (close_term vars a, close_term vars b)
  | Eimply (a, b, _) -> eimply (close_term vars a, close_term vars b)
  | Eequiv (a, b, _) -> eequiv (close_term vars a, close_term vars b)
  | Earrow (a, b, _) -> earrow (List.map (close_term vars) a) (close_term vars b)
  | Elam (Evar (s, _) as v, b, _) ->
     let ty = close_term vars (get_type v) in
     let x = tvar s ty in
     elam (x, close_term (s :: vars) b)
  | Eall (Evar (s, _) as v, b, _) ->
     let ty = close_term vars (get_type v) in
     let x = tvar s ty in
     eall (x, close_term (s :: vars) b)
  | Eex (Evar (s, _) as v, b, _) ->
     let ty = close_term vars (get_type v) in
     let x = tvar s ty in
     eex (x, close_term (s :: vars) b)
  | Eapp _ -> assert false (* Application heads are function symbols *)
  | Elam _
  | Eall _
  | Eex _ -> assert false (* Binders bind over variables *)
  | Etau _
  | Emeta _ -> assert false (* parser never produces a meta or a tau *)

let rec close_params vars = function
  | [] -> []
  | (Evar (s, _) as v) :: l ->
     tvar s (close_term vars (get_type v)) :: close_params (s :: vars) l
  | _ -> assert false (* params are lists of variables *)

let close_term vars e =
  Log.debug 1 "Closing vars {%a} in %a" (Print.pp_lst (fun b -> Printf.bprintf b "%s") ", ") vars Print.pp_expr e;
  let result = close_term vars e in
  Log.debug 1 "Result: %a" Print.pp_expr result;
  result
%}
%token <string> ID QID NUMBER
%token COLON DOT DOUBLE_ARROW DEF ARROW
%token TYPE TERM PROOF CCARR PROP
%token LPAREN RPAREN EOF
%token LBRACK COMMA RBRACK REW DEFKW
%token TRUE FALSE NOT AND OR IMP EQV ALL EX ALL_TYPE EX_TYPE ISTRUE EQUAL

%token MUSTUSE
%token RECURSIVE
%token BEGINPROOF
%token BEGIN_TYPEALIAS
%token BEGIN_TY
%token BEGIN_VAR
%token BEGIN_HYP
%token END_TYPEALIAS
%token END_VAR
%token END_HYP
%token <string> BEGINNAME
%token BEGINHEADER
%token ENDPROOF

%start file
%type <string * (Phrase.phrase * bool) list> file
%type <expr> typ
%type <expr> term
%type <expr> term_simple

%%

file:
| body EOF                       { $1 }
| proof_head body ENDPROOF EOF   { $2 }

body:
| ID COLON PROOF closed_term DOT
     { ($1,
        [Phrase.Hyp (Namespace.goal_name, Expr.enot $4, 0),
         false]) }
| dep_hyp_def body
              { let (n, l) = $2 in (n, List.rev_append ($1) l) }

proof_head:
| BEGINPROOF proofheaders
             { () }

proofheaders:
  | /* empty */
      { () }
  | BEGINNAME proofheaders
      { () }
  | BEGINHEADER proofheaders
      { () }
  | BEGIN_TY ID proofheaders
      { Typer.declare_constant ($2, type_type) }
  | BEGIN_TYPEALIAS ID DEF type_simple END_TYPEALIAS proofheaders
      { (* Type aliases are substituted in the parser *)
        (* This does not work because it does not substitute
           the alias in already-parsed input.
           TODO: give it to the typer. *)
        Log.debug 15 "Registering alias %s := %a"
                  $2 Print.pp_expr $4;
        ty_aliases := ($2, close_term [] $4) :: !ty_aliases }
  | BEGIN_VAR ID COLON typ END_VAR proofheaders
      { () }
  | BEGIN_HYP ID COLON PROOF term_simple END_HYP proofheaders
      { () }

qid:
| QID
      { (* Qualified IDs cannot be variables *)
        if List.mem_assoc $1 !ty_aliases then
          List.assoc $1 !ty_aliases else
          mk_const $1 type_none }
| ID
    { (* Unqualified IDs can be either variables or constants. It
           would be hard to determine it here so we parse them as
           variables and let the close_term function do the necessary
           scoping *)
        (* Also unfold type aliases because types can be passed as arguments
           to polymorphic functions *)
     if List.mem_assoc $1 !ty_aliases then
        List.assoc $1 !ty_aliases else
        tvar_none $1 }
term_simple:
| qid { $1 }
| NUMBER { Typer.declare_constant ($1, type_nat); mk_const $1 type_nat }
| TRUE { etrue }
| FALSE { efalse }
| NOT term_simple { enot $2 }
| AND term_simple term_simple { eand   ($2, $3) }
| OR  term_simple term_simple { eor    ($2, $3) }
| IMP term_simple term_simple { eimply ($2, $3) }
| EQV term_simple term_simple { eequiv ($2, $3) }
| ALL type_simple LPAREN ID COLON typ DOUBLE_ARROW term_simple RPAREN
      { eall (tvar $4 $6, $8)}
| EX type_simple LPAREN ID COLON typ DOUBLE_ARROW term_simple RPAREN
      { eex (tvar $4 $6, $8)}
| ALL_TYPE LPAREN ID COLON TYPE DOUBLE_ARROW term_simple RPAREN
      { eall (tvar $3 type_type, $7)}
| EX_TYPE LPAREN ID COLON TYPE DOUBLE_ARROW term_simple RPAREN
      { eex (tvar $3 type_type, $7)}
| ISTRUE term_simple {eapp (tvar "Is_true" (earrow [mk_const_t "basics.bool__t"] type_prop), [$2])}
| EQUAL type_simple term_simple term_simple { eeq $3 $4 }
| LPAREN term RPAREN { $2 }
| ID COLON typ DOUBLE_ARROW term_simple
     { elam (tvar $1 type_none, $5) }
| ID DEF term DOUBLE_ARROW term_simple
     { substitute_2nd_unsafe [(tvar $1 type_none, $3)] $5 }
| CCARR type_simple type_simple
        { match $3 with
          | Earrow (tys, ty, _) -> earrow ($2 :: tys) ty
          | ty -> earrow [$2] ty }
terms:
| term_simple { [$1] }
| terms term_simple { $2 :: $1 }
term:
| terms {
      (* The "applicatives" rules contains a list of
         arguments in reverse order.
         This list is not empty. *)
      mk_app (List.rev $1)
    }
closed_term:
| term { close_term [] $1 }

type_qid:
| ID { if List.mem_assoc $1 !ty_aliases then
        List.assoc $1 !ty_aliases else
        tvar $1 type_type }
| QID { if List.mem_assoc $1 !ty_aliases then
        List.assoc $1 !ty_aliases else
        mk_const_t $1 }
type_simple:
| type_qid { $1 }
| PROP { type_prop }
| LPAREN pre_typ RPAREN { $2 }
typs:
| type_simple { [$1] }
| typs type_simple { $2 :: $1 }
pre_typ:
| typs { match List.rev $1 with
         | [] -> assert false
         | [ ty ] -> ty
         | (Eapp (Evar (head, _), [], _)) :: tail ->
            let tys = List.map (fun _ -> type_type) tail in
            eapp (tvar head (earrow tys type_type), tail)
         | head :: tail ->
            Log.debug 0 "Error: application head is not a constant %a @ [%a]\n"
                      Print.pp_expr head
                      (Print.pp_lst Print.pp_expr "; ") tail;
            raise Parse_error
       }
| CCARR type_simple type_simple
        { match $3 with
          | Earrow (tys, ty, _) -> earrow ($2 :: tys) ty
          | ty -> earrow [$2] ty }

typ:
| TERM type_simple { $2 }

complex_type :
| typ {$1}
| TERM type_simple ARROW complex_type {match $4 with Earrow (tys, ty, _) -> earrow ($2 :: tys) ty | ty -> earrow [$2] ty}
| LPAREN complex_type RPAREN ARROW complex_type {match $5 with Earrow (tys, ty, _) -> earrow ($2 :: tys) ty | ty -> earrow [$2] ty}
| ID COLON TYPE ARROW complex_type {eall (tvar $1 type_type, $5)}

closed_complex_type :
| complex_type { close_term [] $1 }

declared_or_defined_id:
| ID { $1 }
| QID { $1 }

hyp_def:
| ID COLON TYPE DOT { Typer.declare_constant ($1, type_type); [] }
| QID COLON TYPE DOT { Typer.declare_constant ($1, type_type); [] }
| ID COLON PROOF closed_term DOT { [Phrase.Hyp ($1, $4, 1)] }
| QID COLON PROOF closed_term DOT { [Phrase.Hyp ($1, $4, 1)] }
| ID COLON TERM type_simple DOT { Typer.declare_constant ($1, close_term [] $4); [] }
| QID COLON TERM type_simple DOT { Typer.declare_constant ($1, close_term [] $4); [] }
| DEFKW ID COLON closed_complex_type DOT { Typer.declare_constant ($2, $4); [] }
| DEFKW QID COLON closed_complex_type DOT { Typer.declare_constant ($2, $4); [] }
| ID COLON typ DEF closed_term DOT
     { (* Definition without argument.
          We don't add the rewrite rule now because the definition
          has not yet been scoped and typed. *)
       let (other_params, expr) = get_params $5 in
       [ Phrase.Def (DefReal ($1,
                              $1,
                              close_term [] $3,
                              other_params,
                              expr,
                              None)) ]
     }
| QID COLON typ DEF closed_term DOT
     { (* Definition without argument.
          We don't add the rewrite rule now because the definition
          has not yet been scoped and typed. *)
       let (other_params, expr) = get_params $5 in
       [ Phrase.Def (DefReal ($1,
                              $1,
                              close_term [] $3,
                              other_params,
                              expr,
                              None)) ]
     }
| declared_or_defined_id compact_args COLON typ DEF term DOT
     { (* Definition with arguments *)
       let (other_params, expr) = get_params $6 in
       let closed_params = close_params [] ($2 @ other_params) in
       let expr = close_term (List.map (function Evar (s, _) -> s | _ -> assert false) closed_params) expr in
       let args_tys = List.map get_type (close_params [] $2) in
       let ty = earrow args_tys (close_term [] $4) in
       [ Phrase.Def (DefReal ($1,
                              $1,
                              ty,
                              closed_params,
                              expr,
                              None)) ]
     }
| RECURSIVE declared_or_defined_id compact_args COLON typ DEF term DOT
     { (* Recursive definition *)
       let (other_params, expr) = get_params $7 in
       let closed_params = close_params [] ($3 @ other_params) in
       let expr = close_term (List.map (function Evar (s, _) -> s | _ -> assert false) closed_params) expr in
       let args_tys = List.map get_type (close_params [] $3) in
       let ty = earrow args_tys (close_term [] $5) in
       [ Phrase.Def (DefRec (None,
                             $2,
                             ty,
                             closed_params,
                             expr)) ]
     }
| env term REW term DOT
         {                      (* Rewrite rule, assumed to be at term level *)
           let rec aux = function
             | [] -> eeq $2 $4
             | decl :: env -> eall (decl, aux env)
           in
           let e = close_term [] (aux $1) in
           [ (* Phrase.Hyp ("rew", e, 1); *)
             Phrase.Rew ("rew", e, 0) ]
         }

compact_args:
| LPAREN ID COLON typ RPAREN
         {
           (* Arguments of definitions.
              These variables must be typed now
              because they are bound now. *)
           [tvar $2 $4] }
| LPAREN ID COLON typ RPAREN compact_args
         { (tvar $2 $4) :: $6 }

env_decl:
| ID COLON complex_type
     { tvar $1 $3 }
| ID COLON TYPE
     { tvar $1 type_type }
| ID
    { tvar $1 type_none }
env_decls:
| env_decl { [$1] }
| env_decl COMMA env_decls { $1 :: $3 }
env:
| LBRACK RBRACK { [] }
| LBRACK env_decls RBRACK { $2 }


dep_hyp_def:
| MUSTUSE hyp_def            { List.map (fun a -> (a, true)) $2 }
| hyp_def                    { List.map (fun a -> (a, false)) $1 }

%%
