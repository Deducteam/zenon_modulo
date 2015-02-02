(* This module defines operations for translating expressions and
   ljproofs to the Dedukti ASTs defined in Dkterm *)

open Printf
open Expr
open Termsig

module Translate(Dk : TermSig) =
struct

  (* Same as get_type but when the type is of the form "cc.eT ty"
     return ty instead *)
  let get_type_no_epsilon e =
    match get_type e with
    | Eapp (Evar ("cc.eT", _), [ty], _) -> ty
    | ty -> ty

  (* Translation function from expressions *)
  let rec trexpr e =
    match e with
    (* Formulae *)
    (* We first fold the definitions of logical equivalence
       and classical connectors: *)
    | Eand (Eimply (e1, e2, _), Eimply (e3, e4, _), _)
        when (equal e3 e2 && equal e4 e1) -> Dk.mk_equiv (trexpr e1) (trexpr e2)
    | Enot (Enot (Enot (Enot (Enot (e, _), _), _), _), _) ->
       Dk.mk_notc (trexpr e)
    | Enot (Enot (Eand (
      Enot (Enot (e1, _), _), Enot (Enot (e2, _), _), _), _), _) ->
       Dk.mk_andc (trexpr e1) (trexpr e2)
    | Enot (Enot (Eor (
      Enot (Enot (e1, _), _), Enot (Enot (e2, _), _), _), _), _) ->
       Dk.mk_orc (trexpr e1) (trexpr e2)
    | Enot (Enot ( Eimply (
      Enot (Enot (e1, _), _), Enot (Enot (e2, _), _), _), _), _) ->
       Dk.mk_implyc (trexpr e1) (trexpr e2)
    | Enot (Enot (Etrue, _), _) -> Dk.mk_truec
    | Enot (Enot (Efalse, _), _) -> Dk.mk_falsec
    | Enot (Enot (
      Eall (e1, Enot (Enot (e2, _), _), _), _), _) ->
       Dk.mk_forallc (trexpr e1)
                     (Dk.term_of_ty (get_type_no_epsilon e1))
                     (trexpr e2)
    | Enot (Enot (
      Eex (e1, Enot (Enot (e2, _), _), _), _), _) ->
       Dk.mk_existsc (trexpr e1) (Dk.term_of_ty (get_type_no_epsilon e1)) (trexpr e2)
    | Enot (Enot (Eapp (Evar("=", _), [e1;e2], _), _), _) ->
       Dk.mk_eqc (Dk.term_of_ty (get_type_no_epsilon e1)) (trexpr e1) (trexpr e2)
    (* Terms *)
    | Evar (v, _) when Mltoll.is_meta v ->
       Dk.mk_anyterm (Dk.term_of_ty (get_type_no_epsilon e))
    | Evar (v, _) ->
       Dk.mk_var v
    | Eapp (Evar("$string", _), [Evar (v, _)], _) ->
       Dk.mk_var ("S"^v)
    | Eapp (Evar("$string", _), _, _) -> assert false
    | Eapp (Evar("=", _), [e1;e2], _) ->
       Dk.mk_eq (Dk.term_of_ty (get_type_no_epsilon e1)) (trexpr e1) (trexpr e2)
    | Eapp (t, args, _) ->
       Dk.mk_app (trexpr t) (List.map trexpr args)
    (* Intuitionistic connectors *)
    | Enot (e, _) ->
       Dk.mk_not (trexpr e)
    | Eand (e1, e2, _) ->
       Dk.mk_and (trexpr e1) (trexpr e2)
    | Eor (e1, e2, _) ->
       Dk.mk_or (trexpr e1) (trexpr e2)
    | Earrow _ -> assert false
    | Eimply (e1, e2, _) ->
       Dk.mk_imply (trexpr e1) (trexpr e2)
    | Etrue -> Dk.mk_true
    | Efalse -> Dk.mk_false
    | Eall (e1, e2, _) ->
       Dk.mk_forall (trexpr e1)
                    (Dk.term_of_ty (get_type_no_epsilon e1))
                    (trexpr e2)
    | Eex (e1, e2, _) ->
       Dk.mk_exists (trexpr e1)
                    (Dk.term_of_ty (get_type_no_epsilon e1))
                    (trexpr e2)
    | Eequiv _ -> assert false                  (* Should have been unfolded earlier *)
    | Etau _ -> assert false                    (* Should have been unfolded *)
    | Elam (e1, e2, _) ->
       Dk.mk_lam (trexpr e1)
                 (Dk.term_of_ty (get_type e1))
                 (trexpr e2)
    | Emeta _ -> assert false                   (* Meta are forbidden earlier *)
end
