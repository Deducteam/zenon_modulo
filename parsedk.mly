/*  Copyright 2005 INRIA  */
/*  Copyright 2014 Ali Assaf */
/*  Copyright 2014 Raphaël Cauderlier */
%{
Version.add "$Id: parsedk.mly,v 1.34 2012-04-11 18:27:26 doligez Exp $";;

open Expr

let mk_const s ty = eapp (tvar s ty, []);;
let mk_const_t s = mk_const s type_type;;

(* Global list of type aliases *)
let ty_aliases = ref [("dk_tuple.prod", mk_const_t "basics.prod")];;

(* exception Unknown_builtin of string;; *)
(* exception Bad_arity of string * int;; *)

(* exception Application_head_is_not_a_var of expr;; *)

let rec get_params e =
  match e with
  | Elam (v, body, _) ->
      let (p, e1) = get_params body in
      (v :: p, e1)
  | _ -> ([], e)
;;

%}
%token <string> ID QID
%token COLON DOT DOUBLE_ARROW DEF
%token TYPE TERM PROOF CCARR PROP
%token LPAREN RPAREN EOF
%token LBRACK COMMA RBRACK REW
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
| ID COLON PROOF term_simple DOT
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
        ty_aliases := ($2, $4) :: !ty_aliases }
  | BEGIN_VAR ID COLON typ END_VAR proofheaders
      { () }
  | BEGIN_HYP ID COLON PROOF term_simple END_HYP proofheaders
      { () }

qid:
| QID
      { (* Qualified IDs cannot be variables *)
        mk_const $1 type_none }
| ID
      { (* Unqualified IDs can be either variables or
           constants. It would be hard to determine it here
           so we parse them as variables and let the typer
           do the necessary scoping (see Typer.ml) *)
        (* Also unfold type aliases because types can be passed as arguments
           to polymorphic functions *)
     if List.mem_assoc $1 !ty_aliases then
        List.assoc $1 !ty_aliases else
        tvar_none $1 }
term_simple:
| qid { $1 }
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
terms:
| term_simple { [$1] }
| terms term_simple { $2 :: $1 }
term:
| terms {
      (* The "applicatives" rules contains a list of
         arguments in reverse order.
         This list is not empty. *)
  match List.rev $1 with
  | [] -> assert false
  | [e] -> e
  | head :: tail ->
     match head with
                   | Evar _ ->
                      eapp (head, tail)
                   | Eapp (v, l, _) ->
                      eapp (v, l @ tail)
                   | _ ->
                      Log.debug 15 "Parse Error: head is %a"
                                Print.pp_expr head;
                      raise Parse_error
}

type_qid:
| ID { (* We don't support type variables in the input *)
      if List.mem_assoc $1 !ty_aliases then
        List.assoc $1 !ty_aliases else
        mk_const_t $1 }
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

declared_or_defined_id:
| ID { $1 }
| QID { $1 }

hyp_def:
| ID COLON TYPE DOT { Typer.declare_constant ($1, type_type); [] }
| QID COLON TYPE DOT { Typer.declare_constant ($1, type_type); [] }
| ID COLON PROOF term_simple DOT { [Phrase.Hyp ($1, $4, 1)] }
| QID COLON PROOF term_simple DOT { [Phrase.Hyp ($1, $4, 1)] }
| ID COLON TERM type_simple DOT { Typer.declare_constant ($1, $4); [] }
| QID COLON TERM type_simple DOT { Typer.declare_constant ($1, $4); [] }
| ID COLON typ DEF term DOT
     { (* Definition without argument.
          We don't add the rewrite rule now because the definition
          has not yet been scoped and typed. *)
       let (other_params, expr) = get_params $5 in
       [ Phrase.Def (DefReal ($1,
                              $1,
                              $3,
                              other_params,
                              expr,
                              None)) ]
     }
| QID COLON typ DEF term DOT
     { (* Definition without argument.
          We don't add the rewrite rule now because the definition
          has not yet been scoped and typed. *)
       let (other_params, expr) = get_params $5 in
       [ Phrase.Def (DefReal ($1,
                              $1,
                              $3,
                              other_params,
                              expr,
                              None)) ]
     }
| declared_or_defined_id compact_args COLON typ DEF term DOT
     { (* Definition with arguments *)
       let (other_params, expr) = get_params $6 in
       let args_tys = List.map get_type $2 in
       let ty = earrow args_tys $4 in
       [ Phrase.Def (DefReal ($1,
                              $1,
                              ty,
                              $2 @ other_params,
                              expr,
                              None)) ]
     }
| RECURSIVE declared_or_defined_id compact_args COLON typ DEF term DOT
     { (* Recursive definition *)
       let (other_params, expr) = get_params $7 in
       let args_tys = List.map get_type $3 in
       let ty = earrow args_tys $5 in
       [ Phrase.Def (DefRec (None,
                             $2,
                             ty,
                             $3 @ other_params,
                             expr)) ]
     }
| env term REW term_simple DOT
         {                      (* Rewrite rule, assumed to be at term level *)
           let rec aux = function
             | [] -> eeq $2 $4
             | decl :: env -> eall (decl, aux env)
           in
           let e = aux $1 in
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
| ID COLON typ
    { tvar $1 $3 }
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
