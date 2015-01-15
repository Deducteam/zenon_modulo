(* This module defines operations for translating expressions and
   ljproofs to the Dedukti ASTs defined in Dkterm *)

open Printf
open Expr
       
(* Translation function from expressions *)
let rec trexprdk e =
  match e with
  | Evar (v, _) ->
     Dkterm.mk_var v
  | Eapp (Evar("=", _), [e1;e2], _) ->
     Dkterm.mk_eq (Dkterm.term_of_ty (get_type e1)) (trexprdk e1) (trexprdk e2)
  | Eapp (t, args, _) ->
     Dkterm.mk_app (trexprdk t) (List.map trexprdk args)
  | Enot (e, _) ->
     Dkterm.mk_not (trexprdk e)
  | Eand (e1, e2, _) ->
     Dkterm.mk_and (trexprdk e1) (trexprdk e2)
  | Eor (e1, e2, _) ->
     Dkterm.mk_or (trexprdk e1) (trexprdk e2)
  | Earrow _ -> assert false
  | Eimply (e1, e2, _) ->
     Dkterm.mk_imply (trexprdk e1) (trexprdk e2)
  | Eequiv (e1, e2, _) -> 
     Dkterm.mk_equiv (trexprdk e1) (trexprdk e2)
  | Etrue -> Dkterm.mk_true
  | Efalse -> Dkterm.mk_false
  | Eall (e1, e2, _) ->
     Dkterm.mk_forall (trexprdk e1)
                  (Dkterm.term_of_ty (get_type e1))
                  (trexprdk e2)
  | Eex (e1, e2, _) ->
     Dkterm.mk_exists (trexprdk e1)
                  (Dkterm.term_of_ty (get_type e1))
                  (trexprdk e2)
  | Etau _ -> assert false                    (* Should have been unfolded *)
  | Elam (e1, e2, _) ->
     Dkterm.mk_lam (trexprdk e1)
               (Dkterm.term_of_ty (get_type e1))
               (trexprdk e2)
  | Emeta _ -> assert false                   (* Meta are forbidden earlier *)
;;
