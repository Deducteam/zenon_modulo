/*  Copyright 2005 INRIA  */
/*  Copyright 2014 Ali Assaf */
/*  Copyright 2014 Raphaël Cauderlier */
%{
Version.add "$Id: parsedk.mly,v 1.34 2012-04-11 18:27:26 doligez Exp $";;

open Expr
open Printf

let pos () = (Parsing.symbol_start_pos (), Parsing.symbol_end_pos ())

let ttype = eapp (tvar "cc.uT" type_type, []);;
let eps ty = eapp (tvar "cc.eT" (earrow [ttype] type_type), [ty]);;
let arr ty1 ty2 = match ty2 with
  | Earrow (l, ret, _) ->
     earrow (ty1 :: l) ret
  | _ -> earrow [ty1] ty2
;;

let rec mk_type e = match e with
  | Evar ("dk_logic.Prop", _) -> type_prop
  | Evar (s, _) -> eapp (tvar s type_type, []) (* See coq parser *)
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

let rec mk_pat (constr : string) (arity : int) (body : expr) : expr =
  if arity = 0
  then eapp (evar "$match-case", [evar constr; body])
  else
    (match body with
     | Elam (x, e, _) ->
        elam (x, mk_pat constr (arity - 1) e)
     | _ -> failwith "Bad pattern : not a lambda")
;;

(* create an expression application,
   applications of logical connectives
   produce the corresponding formulae *)
let mk_eapp : string * expr list -> expr =
  function
  | "dk_tuple.pair", [t1; t2; e1; e2] ->
     eapp (evar "@", [evar "dk_tuple.pair"; t1; t2; e1; e2])
  | "dk_tuple.match__pair", [t1; t2; x; rt; pat; fail] ->
     eapp (evar "$match", x :: mk_pat "dk_tuple.pair" 2 pat :: [])

  | "dk_fail.fail", [t] -> eapp (evar "dk_fail.fail", [t])

  | "dk_logic.and", [e1; e2] -> eand (e1, e2)
  | "dk_logic.or", [e1; e2] -> eor (e1, e2)
  | "dk_logic.imp", [e1; e2] -> eimply (e1, e2)
  | "dk_logic.eqv", [e1; e2] -> eequiv (e1, e2)
  | "dk_logic.not", [e1] -> enot (e1)
  | "dk_logic.forall", [_; Elam (x, e, _)] -> eall (x, e)
  | "dk_logic.forall", [_; _] -> assert false
  | "dk_logic.forall", l -> raise (Bad_arity ("forall", List.length l))
  | "dk_logic.exists", [_; Elam (x, e, _)] -> eex (x, e)
  | "dk_logic.ebP", [e1] -> eapp (evar "Is_true", [e1]) (* dk_logic.ebP is the equivalent of Coq's coq_builtins.Is_true *)
  | "dk_logic.eP", [e] -> e                        (* eP is ignored *)
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
          mk_apply (substitute_2nd [(x, arg)] body, tail)
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

%token MUSTUSE
%token BEGINPROOF
%token BEGIN_TY
%token BEGIN_VAR
%token BEGIN_HYP
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
  | BEGIN_VAR ID COLON typ END_VAR proofheaders
              { (Phrase.Def (DefReal ("Typing declaration",
                                      $2,
                                      $4,
                                      [],
                                      etrue, None)), true)
                :: $6 }
  | BEGIN_HYP ID COLON STRING END_HYP proofheaders
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
| TYPE { evar "Type" }
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
