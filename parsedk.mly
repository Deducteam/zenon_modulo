/*  Copyright 2005 INRIA  */
/*  Copyright 2014 Ali Assaf */
/*  Copyright 2014 Raphaël Cauderlier */
%{
Version.add "$Id: parsedk.mly,v 1.34 2012-04-11 18:27:26 doligez Exp $";;

open Expr
open Printf

let pos () = (Parsing.symbol_start_pos (), Parsing.symbol_end_pos ())

let arr ty1 ty2 = match ty2 with
  | Earrow (l, ret, _) ->
     earrow (ty1 :: l) ret
  | _ -> earrow [ty1] ty2
;;
let eps ty = eapp (tvar "cc.eT" (arr type_type type_type), [ty]);;
let bool_t = tvar "basics.bool__t" type_type;;
let bool1 = eapp (bool_t, []);;

let mk_const_t s = eapp (tvar s type_type, []);;

(* Global list of type aliases *)
let ty_aliases = ref [];;

let rec mk_type e = match e with
  (* Alias unfolding *)
  | Eapp (Evar ("cc.eT", _), [Evar (x, _)], _) when List.mem_assoc x !ty_aliases ->
     mk_type (eps (List.assoc x !ty_aliases))

  | Evar ("dk_logic.Prop", _) -> type_prop
  | Evar (s, _) -> mk_const_t s (* See coq parser *)
  (* (eT (Arrow t1 t2)) is convertible with (eT t1 -> eT t2) *)
  | Eapp (Evar ("cc.eT", _), [Eapp (Evar ("cc.Arrow", _), [t1; t2], _)], _) ->
     arr (mk_type (eps t1)) (mk_type (eps t2))
  | Eapp (Evar ("cc.eT", _), [Evar ("dk_builtins.prop", _)], _) ->
     type_prop
  | Eapp (s, args, _) ->
     eapp (s, List.map mk_type args)
  | Eimply (e1, e2, _) ->
     arr (mk_type e1) (mk_type e2)
  | e -> e
;;

let startwith pref s =
  String.length pref <= String.length s &&
    String.sub s 0 (String.length pref) = pref
;;

exception Unknown_builtin of string;;
exception Bad_arity of string * int;;

let rec mk_pat (constr : string) (arity : int) (body : expr) ret_ty : expr =
  if arity = 0
  then
    let ret_ty_arr = eall (tvar "__dummy" type_type, arr ret_ty ret_ty) in
    eapp (tvar "$match-case" ret_ty_arr, [tvar constr type_type; body])
  else
    (match body with
     | Elam (x, e, _) ->
        elam (x, mk_pat constr (arity - 1) e ret_ty)
     | _ -> failwith "Bad pattern : not a lambda")
;;

let mk_prod a b =
  eps (eapp (tvar "dk_tuple.prod" (earrow [type_type; type_type] type_type), [a; b]))
;;

(* create an expression application,
   applications of logical connectives
   produce the corresponding formulae *)
let mk_eapp : string * expr list -> expr =
  function
  | "cc.Arrow", [t1 ; t2] ->
     eapp (tvar "cc.Arrow" (earrow [type_type; type_type] type_type), [t1; t2])
  | "cc.eT", [t] ->
     eapp (tvar "cc.eT" (arr type_type type_type), [t])

  | "dk_tuple.prod", [t1; t2] ->
     eapp (tvar "dk_tuple.prod" (earrow [type_type; type_type] type_type), [mk_type t1; mk_type t2])

  | "dk_tuple.pair", [t1; t2; e1; e2] ->
     let ty =
       let a = newtvar type_type in
       let b = newtvar type_type in
       eall (a, eall (b, earrow [eps a; eps b] (mk_prod a b)))
     in
     eapp (tvar "dk_tuple.pair" ty, [mk_type t1; mk_type t2; e1; e2])

  | "basics.fst", [t1; t2; e] ->
     let ty =
       let a = newtvar type_type in
       let b = newtvar type_type in
       eall (b, eall (a, earrow [mk_prod a b] (eps a)))
     in
     eapp (tvar "basics.fst" ty, [mk_type t1; mk_type t2; e])

  | "basics.snd", [t1; t2; e] ->
     let ty =
       let a = newtvar type_type in
       let b = newtvar type_type in
       eall (b, eall (a, earrow [mk_prod a b] (eps b)))
     in
     eapp (tvar "basics.snd" ty, [mk_type t1; mk_type t2; e])

  | "dk_tuple.match__pair", [t1; t2; rt; x; pat; fail] ->
     let t1 = eps (mk_type t1) in
     let t2 = eps (mk_type t2) in
     let rt = eps (mk_type rt) in
     let ty = earrow [mk_prod t1 t2; earrow [t1; t2] rt] rt in
     eapp (tvar "$match" ty, [x; mk_pat "dk_tuple.pair" 2 pat rt])

  | "dk_fail.fail", [t] -> eapp (tvar "dk_fail.fail"
                                     (let x = tvar "_failvar" type_type in
                                      eall (x, eps x)), [mk_type t])

  | "dk_logic.and", [e1; e2] -> eand (e1, e2)
  | "dk_logic.or", [e1; e2] -> eor (e1, e2)
  | "dk_logic.imp", [e1; e2] -> eimply (e1, e2)
  | "dk_logic.eqv", [e1; e2] -> eequiv (e1, e2)
  | "dk_logic.not", [e1] -> enot (e1)
  | "dk_logic.forall", [_; Elam (x, e, _)] -> eall (x, e)
  | "dk_logic.forall", [_; _] -> assert false
  | "dk_logic.forall", l -> raise (Bad_arity ("forall", List.length l))
  | "dk_logic.exists", [_; Elam (x, e, _)] -> eex (x, e)
  | "dk_logic.ebP", [e1] -> eapp (tvar "Is_true" (arr bool1 type_prop), [e1]) (* dk_logic.ebP is the equivalent of Coq's coq_builtins.Is_true *)
  | "dk_logic.eP", [e] -> e                        (* eP is ignored *)
  | "dk_bool.ite", [ty1; c; t; e] ->
     let v = newtvar type_type in
     let ty = eall (v, earrow [bool1; eps v; eps v] (eps v)) in
     eapp (tvar "FOCAL.ifthenelse" ty, [mk_type ty1; c; t; e])
  (* There should not be any other logical connectives *)
  | s, args ->
     if (startwith "dk_" s)
     then raise (Unknown_builtin s)
     else
       (if args = []
        then evar s
        else eapp (evar s, args))
;;

exception Application_head_is_not_a_var of expr;;

let rec mk_apply (e, l) =
  match l with
  | [] -> e
  | arg :: tail ->
     begin
       match e with
       | Eapp (Evar(s, _), args, _) -> mk_eapp (s, args @ l)
       | Evar (s, _) -> mk_eapp (s, l)
       | Elam (x, body, _) ->
          mk_apply (substitute_2nd_unsafe [(x, arg)] body, tail)
       | _ ->
          Printf.eprintf "Error: application head is not a variable %a @ [%a]\n"
                         (fun oc -> Print.expr (Print.Chan oc)) e
                         (fun oc -> List.iter (fun e ->
                                            Print.expr (Print.Chan oc) e;
                                            Printf.fprintf oc ";\n")) l;
          raise Parse_error
     end
;;

let mk_all var ty e =
  eall (tvar var ty, e)
;;

let mk_lam var ty e =
  elam (tvar var ty, e)
;;

let rec get_params e =
  match e with
  | Elam (v, body, _) ->
      let (p, e1) = get_params body in
      (v :: p, e1)
  | _ -> ([], e)
;;

%}
%token <string> ID QID STRING
%token TYPE COLON DOT ARROW DOUBLE_ARROW LONG_ARROW DEF
%token LPAREN RPAREN EOF
%token TRUE FALSE

%token MUSTUSE
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
%type <expr> term
%type <expr> applicative
%type <expr> simple

%%

file:
| body EOF                       { $1 }
| proof_head body ENDPROOF EOF   { let (n, l) = $2 in (n, List.rev_append ($1) l) }

body:
| ID COLON term DOT
     { ($1,
        [Phrase.Hyp (Namespace.goal_name, Expr.enot $3, 0),
         false]) }
| dep_hyp_def body
              { let (n, l) = $2 in (n, List.rev_append ($1) l) }

proof_head:
| BEGINPROOF proofheaders BEGINNAME proofheaders
             { $2 @ $4 }
| BEGINPROOF proofheaders
             { [] }

proofheaders:
  | /* empty */
      { [] }
  | BEGINHEADER proofheaders
      { $2 }
  | BEGIN_TY ID proofheaders
      { $3 }
  | BEGIN_TYPEALIAS ID DEF typ END_TYPEALIAS proofheaders
      { ty_aliases := ($2, $4) :: !ty_aliases; $6 }
  | BEGIN_VAR ID COLON typ END_VAR proofheaders
              { (Phrase.Def (DefReal ("Typing declaration",
                                      $2,
                                      $4,
                                      [],
                                      etrue, None)), true)
                :: $6 }
  | BEGIN_HYP ID COLON term END_HYP proofheaders
      { $6 }

qid:
| QID { $1 }
| ID { $1 }

term:
| domain ARROW term
         { let (x, a) = $1 in mk_all x a $3 }
| ID COLON typ DOUBLE_ARROW term
     { mk_lam $1 $3 $5 }
| applicative { $1 }
domain:
| ID COLON typ { ($1, $3) }
| typ { ("", $1) }

applicative:
| applicatives {
  match List.rev $1 with
  | [] -> raise Parse_error
  | head :: tail -> mk_apply (head, tail)
}

applicatives:
| simple { [$1] }
| applicatives simple { $2 :: $1 }
simple:
| TYPE { type_type }
| TRUE { tvar "true" bool1 }
| FALSE { tvar "false" bool1 }
| qid { evar $1 }
| LPAREN term RPAREN { $2 }
typ:
| applicative { mk_type $1 }

hyp_def:
| ID COLON term DOT { [Phrase.Hyp ($1, $3, 1)] }
| ID COLON typ DEF term DOT
     {
       let (other_params, expr) = get_params $5 in
       [ Phrase.Def (DefReal ($1,
                              $1,
                              $3,
                              other_params,
                              expr,
                              None)) ]
     }
| ID compact_args COLON typ DEF term DOT
     {
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

compact_args:
| LPAREN ID COLON typ RPAREN
         {
           (* Arguments of definitions.
              These variables must be typed now
              because they are bound now. *)
           [tvar $2 $4] }
| LPAREN ID COLON typ RPAREN compact_args
         { (tvar $2 $4) :: $6 }

dep_hyp_def:
| MUSTUSE hyp_def            { List.map (fun a -> (a, true)) $2 }
| hyp_def                    { List.map (fun a -> (a, false)) $1 }

%%
