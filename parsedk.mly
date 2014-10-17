/*  Copyright 2005 INRIA  */
/*  Copyright 2014 Ali Assaf */
/*  Copyright 2014 Raphaël Cauderlier */
%{
Version.add "$Id: parsedk.mly,v 1.34 2012-04-11 18:27:26 doligez Exp $";;

open Expr
open Printf

let pos () = (Parsing.symbol_start_pos (), Parsing.symbol_end_pos ())

let rec mk_type_string e = match e with
  | Evar (s, _) -> s
  | Emeta _ -> assert false
  | Eapp (s, args, _) ->
     let inside =
       List.fold_left (fun s a -> sprintf "%s %s" s (mk_type_string a)) s args
     in
     sprintf "(%s)" inside
  | Eimply (e1, e2, _) ->
     sprintf "(%s -> %s)" (mk_type_string e1) (mk_type_string e2)
  | _ -> assert false (* FIXME TODO *)
;;

let mk_eapp : string * expr list -> expr =
  function
  | "dk_logic.and", [e1; e2] -> eand (e1, e2)
  | "dk_logic.or", [e1; e2] -> eor (e1, e2)
  | "dk_logic.eqv", [e1; e2] -> eequiv (e1, e2)
  | "dk_logic.not", [e1] -> enot (e1)
  | "dk_logic.forall", [_; Elam (x, ty, e, _)] -> eall (x, ty, e)
  | "dk_logic.exists", [_; Elam (x, ty, e, _)] -> eex (x, ty, e)
  | "dk_logic.ebP", [e1] -> eapp ("Is_true", [e1]) (* dk_logic.ebP is the equivalent of Coq's coq_builtins.Is_true *)
  | s, args -> eapp (s, args)
;;

let mk_apply (e, l) =
  match e with
  | Eapp (s, args, _) -> mk_eapp (s, args @ l)
  | Evar (s, _) -> mk_eapp (s, l)
  | _ -> raise Parse_error
;;

let mk_all var ty e =
  eall (evar var, ty, e)
;;

let mk_ex var ty e =
  eex (evar var, ty, e)
;;

let mk_lam var ty e =
  elam (evar var, ty, e)
;;

let rec get_params e =
  match e with
  | Elam (v, _, body, _) ->
      let (p, e1) = get_params body in
      (v :: p, e1)
  | _ -> ([], e)
;;

let add_global_ty id =
  Expr.var_declarations :=
    Expr.Type id :: !Expr.var_declarations
;;

let add_global_var id ty =
  Expr.var_declarations :=
    Expr.Var (id, ty) :: !Expr.var_declarations
;;

let add_global_hyp id hyp =
  Expr.var_declarations :=
    Expr.Hyp (id, hyp) :: !Expr.var_declarations
;;


%}
%token <string> ID QID
%token TYPE COLON DOT ARROW DOUBLE_ARROW LONG_ARROW DEF
%token LPAREN RPAREN EOF

%token PARAMETER
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
| proof_head body ENDPROOF EOF   { $2 }

body:
| ID COLON term DOT
     { ($1,
        [Phrase.Hyp (Namespace.goal_name, Expr.enot $3, 0),
         false]) }
| dep_hyp_def body
              { let (n, l) = $2 in (n, $1 :: l) }

proof_head:
| BEGINPROOF proofheaders BEGINNAME proofheaders
             { $3 }
| BEGINPROOF proofheaders
             { "theorem" }

proofheaders:
  | /* empty */
      { () }
  | BEGINHEADER proofheaders
      { $2 }
  | BEGIN_TY ID proofheaders
      { $3; add_global_ty $2 }
  | BEGIN_VAR ID COLON typ END_VAR proofheaders
      { $6; add_global_var $2 $4 }
  | BEGIN_HYP ID COLON term END_HYP proofheaders
      { $6; add_global_hyp $2 $4 }

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
| simple { $1 }
| applicative simple { mk_apply ($1, [$2]) }
simple:
| TYPE { evar "Type" }
| qid { evar $1 }
| LPAREN term RPAREN { $2 }
typ:
| applicative { mk_type_string $1 }

hyp_def:
| ID COLON term DOT { Phrase.Hyp ($1, $3, 1) }
| ID COLON term DEF term DOT
     {
       let compact_params = [] in
       let (other_params, expr) = get_params $5 in
       Phrase.Def (DefReal ($1,
                            $1,
                            compact_params @ other_params,
                            expr,
                            None))
     }
| ID compact_args COLON term DEF term DOT
     {
       let compact_params = $2 in
       let (other_params, expr) = get_params $6 in
       Phrase.Def (DefReal ($1,
                            $1,
                            compact_params @ other_params,
                            expr,
                            None))
     }

compact_args:
| LPAREN ID COLON term RPAREN { [evar $2] }
| LPAREN ID COLON term RPAREN compact_args
          { (evar $2) :: $6 }

dep_hyp_def:
| MUSTUSE hyp_def            { ($2, true) }
| hyp_def                    { ($1, false) }

%%
