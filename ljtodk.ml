(* This module defines operations for translating expressions and
   ljproofs to the Dedukti ASTs defined in Dkterm *)

open Printf
open Expr

module type TermSig =
sig
  type var = string

  type term
  type line

  (* constructor functions *)
  val mk_var : var -> term
  val mk_lam : term -> term -> term -> term
  val mk_lams : term list -> term list -> term -> term
  val mk_pi : term -> term -> term -> term
  val mk_app : term -> term list -> term
  val mk_app2 : term -> term -> term
  val mk_app3 : term -> term -> term -> term
  val mk_arrow : term -> term -> term
  val mk_prf : term -> term
  val mk_termtype : term
  val mk_proptype : term
  val mk_anyterm : term
  val mk_not : term -> term
  val mk_and : term -> term -> term
  val mk_or : term -> term -> term
  val mk_imply : term -> term -> term
  val mk_forall : term -> term -> term
  val mk_exists : term -> term -> term
  val mk_true : term
  val mk_false : term
  val mk_eq : term -> term -> term
  val mk_notc : term -> term
  val mk_andc : term -> term -> term
  val mk_orc : term -> term -> term
  val mk_implyc : term -> term -> term
  val mk_forallc : term -> term -> term
  val mk_existsc : term -> term -> term
  val mk_truec : term
  val mk_falsec : term
  val mk_eqc : term -> term -> term
  val mk_equiv : term -> term -> term

  val mk_decl : term -> term -> line
  val mk_deftype : term -> term -> term -> line
  val mk_prelude : string -> line
  val mk_rewrite : (term * term) list -> term -> term -> line

  (* print functions *)
  val print_term : out_channel -> term -> unit
  val print_terms : out_channel -> term list -> unit
  val print_line : out_channel -> line -> unit
end

module Translate(Dk : TermSig) =
struct

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
      Eall (e1, s, Enot (Enot (e2, _), _), _), _), _) ->
       Dk.mk_forallc (trexpr e1) (trexpr e2)
    | Enot (Enot (
      Eex (e1, s, Enot (Enot (e2, _), _), _), _), _) ->
       Dk.mk_existsc (trexpr e1) (trexpr e2)
    | Enot (Enot (Eapp ("=", [e1;e2], _), _), _) ->
       Dk.mk_eqc (trexpr e1) (trexpr e2)
    (* Terms *)
    | Evar (v, _) when Mltoll.is_meta v ->
       Dk.mk_anyterm
    | Evar (v, _) ->
       Dk.mk_var v
    | Eapp ("$string", [Evar (v, _)], _) ->
       Dk.mk_var ("S"^v)
    | Eapp ("$string", _, _) -> assert false
    | Eapp ("=", [e1;e2], _) ->
       Dk.mk_eq (trexpr e1) (trexpr e2)
    | Eapp (s, args, _) ->
       Dk.mk_app (Dk.mk_var s) (List.map trexpr args)
    (* Intuitionistic connectors *)
    | Enot (e, _) ->
       Dk.mk_not (trexpr e)
    | Eand (e1, e2, _) ->
       Dk.mk_and (trexpr e1) (trexpr e2)
    | Eor (e1, e2, _) ->
       Dk.mk_or (trexpr e1) (trexpr e2)
    | Eimply (e1, e2, _) ->
       Dk.mk_imply (trexpr e1) (trexpr e2)
    | Etrue -> Dk.mk_true
    | Efalse -> Dk.mk_false
    | Eall (e1, s, e2, _) ->
       Dk.mk_forall (trexpr e1) (trexpr e2)
    | Eex (e1, s, e2, _) ->
       Dk.mk_exists (trexpr e1) (trexpr e2)
    | Eequiv _ -> assert false                  (* Should have been unfolded earlier *)
    | Etau _ -> assert false                    (* Should have been unfolded *)
    | Elam _ -> assert false                    (* Not first order *)
    | Emeta _ -> assert false                   (* Meta are forbidden earlier *)

  let new_name =
    let r = ref 0 in
    fun () ->
      let n = !r in
      incr r; n

  let new_hypo () = sprintf "H%d" (new_name ())
  let new_prop () = sprintf "P%d" (new_name ())
  let new_term () = sprintf "X%d" (new_name ())

  (* the left part of sequents can only grow: the left part of the conclusion is always
     contained in the left part of the hypothesis
     weakening is implicit*)

  let rec trproof (lkproof, goal, gamma) =
    let g, d, lkrule = lkproof in
    let trhyp e =
      try (List.assoc e gamma)
      with Not_found -> assert false in
    match lkrule with
    | Lkproof.SCaxiom (e) ->
       trhyp e
    | Lkproof.SCfalse ->
       Dk.mk_app2 (trhyp efalse) (trexpr goal)
    | Lkproof.SCtrue ->
       let prop = new_prop () in
       let dkprop = Dk.mk_var prop in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_lam dkprop Dk.mk_proptype (Dk.mk_lam dkvar (Dk.mk_prf dkprop) dkvar)
    | Lkproof.SCeqref (a) ->
       let prop = new_prop () in
       let dkprop = Dk.mk_var prop in
       Dk.mk_lam dkprop (Dk.mk_arrow Dk.mk_termtype Dk.mk_proptype)
         (trproof (
	   Lkproof.scrimply (
	     eapp (prop, [a]),
	     eapp (prop, [a]),
	     Lkproof.scaxiom (eapp (prop, [a]), [])),
	   eimply (eapp (prop, [a]), eapp (prop, [a])), gamma))
    | Lkproof.SCeqsym (a, b) ->
       let term = new_term () in
       let dkterm = Dk.mk_var term in
       Dk.mk_app3 (trhyp (eapp ("=", [a; b])))
         (Dk.mk_lam dkterm Dk.mk_termtype (trexpr (eapp ("=", [evar term; a]))))
         (trproof (Lkproof.sceqref (a, []), eapp ("=", [a; a]), gamma))
    | Lkproof.SCcut (e, lkrule1, lkrule2) ->
       trproof
         (lkrule2, goal,
          (e, trproof (lkrule1, e, gamma)) :: gamma)
    | Lkproof.SCland (e1, e2, lkrule) ->
       let var1 = new_hypo () in
       let dkvar1 = Dk.mk_var var1 in
       let var2 = new_hypo () in
       let dkvar2 = Dk.mk_var var2 in
       Dk.mk_app3 (trhyp (eand (e1, e2)))
         (trexpr goal)
         (Dk.mk_lam dkvar1
	    (Dk.mk_prf (trexpr e1))
	    (Dk.mk_lam dkvar2
	       (Dk.mk_prf (trexpr e2))
	       (trproof (lkrule, goal, (e1, dkvar1) :: (e2, dkvar2) :: gamma))))
    | Lkproof.SClor (e1, e2, lkrule1, lkrule2) ->
       let var1 = new_hypo () in
       let dkvar1 = Dk.mk_var var1 in
       let var2 = new_hypo () in
       let dkvar2 = Dk.mk_var var2 in
       Dk.mk_app (trhyp (eor (e1, e2)))
         [trexpr goal;
          Dk.mk_lam dkvar1
	    (Dk.mk_prf (trexpr e1))
	    (trproof (lkrule1, goal, (e1, (Dk.mk_var var1)) :: gamma));
          Dk.mk_lam dkvar2
	    (Dk.mk_prf (trexpr e2))
	    (trproof (lkrule2, goal, (e2, (Dk.mk_var var2)) :: gamma))]
    | Lkproof.SClimply (e1, e2, lkrule1, lkrule2) ->
       let traux =
         Dk.mk_app2 (trhyp (eimply (e1, e2))) (trproof (lkrule1, e1, gamma)) in
       trproof (lkrule2, goal, (e2, traux) :: gamma)
    | Lkproof.SClnot (e, lkrule) ->
       Dk.mk_app2 (trhyp (enot e)) (trproof (lkrule, e, gamma))
    | Lkproof.SClall (Eall (x, ty, p, _) as ap, t, lkrule) ->
       let traux =
         Dk.mk_app2 (trhyp ap) (trexpr t) in
       trproof
         (lkrule, goal, (substitute [(x, t)] p, traux) :: gamma)
    | Lkproof.SClex (Eex (x, ty, p, _) as ep, v, lkrule) ->
       let q = substitute [(x, v)] p in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_app3 (trhyp ep)
         (trexpr goal)
         (Dk.mk_lam (trexpr v) Dk.mk_termtype
	    (Dk.mk_lam dkvar
	       (Dk.mk_prf (trexpr q))
	       (trproof  (lkrule, goal, (q,dkvar) :: gamma))))
    | Lkproof.SCrand (e1, e2, lkrule1, lkrule2) ->
       let prop = new_prop () in
       let dkprop = Dk.mk_var prop in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_lam dkprop Dk.mk_proptype
         (Dk.mk_lam dkvar
	    (Dk.mk_arrow (Dk.mk_prf (trexpr e1))
	       (Dk.mk_arrow (Dk.mk_prf (trexpr e2)) (Dk.mk_prf dkprop)))
	    (Dk.mk_app3 dkvar (trproof (lkrule1, e1, gamma)) (trproof (lkrule2, e2, gamma))))
    | Lkproof.SCrorl (e1, e2, lkrule) ->
       let prop = new_prop () in
       let dkprop = Dk.mk_var prop in
       let var1 = new_hypo () in
       let dkvar1 = Dk.mk_var var1 in
       let var2 = new_hypo () in
       let dkvar2 = Dk.mk_var var2 in
       Dk.mk_lam dkprop Dk.mk_proptype
         (Dk.mk_lam dkvar1
	    (Dk.mk_arrow (Dk.mk_prf (trexpr e1)) (Dk.mk_prf dkprop))
	    (Dk.mk_lam dkvar2
	       (Dk.mk_arrow (Dk.mk_prf (trexpr e2)) (Dk.mk_prf dkprop))
	       (Dk.mk_app2 dkvar1 (trproof (lkrule, e1, gamma)))))
    | Lkproof.SCrorr (e1, e2, lkrule) ->
       let prop = new_prop () in
       let dkprop = Dk.mk_var prop in
       let var1 = new_hypo () in
       let dkvar1 = Dk.mk_var var1 in
       let var2 = new_hypo () in
       let dkvar2 = Dk.mk_var var2 in
       Dk.mk_lam dkprop Dk.mk_proptype
         (Dk.mk_lam dkvar1
	    (Dk.mk_arrow (Dk.mk_prf (trexpr e1)) (Dk.mk_prf dkprop))
	    (Dk.mk_lam dkvar2
	       (Dk.mk_arrow (Dk.mk_prf (trexpr e2)) (Dk.mk_prf dkprop))
	       (Dk.mk_app2 dkvar2 (trproof (lkrule, e2, gamma)))))
    | Lkproof.SCrimply (e1, e2, lkrule) ->
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_lam dkvar (Dk.mk_prf (trexpr e1))
         (trproof (lkrule, e2, (e1, dkvar) :: gamma))
    | Lkproof.SCrnot (e, lkrule) ->
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_lam dkvar (Dk.mk_prf (trexpr e))
         (trproof (lkrule, efalse, (e, dkvar) :: gamma))
    | Lkproof.SCrall (Eall (x, ty, p, _), v, lkrule) ->
       let q = substitute [(x, v)] p in
       Dk.mk_lam (trexpr v) Dk.mk_termtype
         (trproof (lkrule, q, gamma))
    | Lkproof.SCrex (Eex (x, ty, p, _), t, lkrule) ->
       let prop = new_prop () in
       let dkprop = Dk.mk_var prop in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_lam dkprop Dk.mk_proptype
         (Dk.mk_lam dkvar
	    (Dk.mk_pi (trexpr x) (Dk.mk_termtype)
	       (Dk.mk_arrow (Dk.mk_prf (trexpr p)) (Dk.mk_prf dkprop)))
	    (Dk.mk_app3 dkvar (trexpr t) (trproof (lkrule, substitute [(x, t)] p, gamma))))
    | Lkproof.SCcnot (e, lkrule) -> assert false
    | Lkproof.SClcontr (e, lkrule) ->
       trproof (lkrule, goal, gamma)
    | Lkproof.SCrweak (e, lkrule) ->
       Dk.mk_app2 (trproof (lkrule, efalse, gamma)) (trexpr e)
    | Lkproof.SCeqfunc (Eapp (p, ts, _), Eapp (_, us, _)) ->
       let pred = new_prop () in
       let dkpred = Dk.mk_var pred in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       let rec itereq (xts, ts, us) =
         match ts, us with
         | [], [] -> Dk.mk_var var
         | t :: ts, u :: us ->
	    let term = new_term () in
	    let dkterm = Dk.mk_var term in
	    Dk.mk_app3 (trhyp (eapp ("=", [t; u])))
	      (Dk.mk_lam dkterm Dk.mk_termtype
	         (trexpr (eapp (pred, [eapp (p, xts @ ((evar term) :: us))]))))
	      (itereq ((xts@[t]), ts, us))
         | _ -> assert false in
       Dk.mk_lam dkpred (Dk.mk_arrow Dk.mk_termtype Dk.mk_proptype)
         (Dk.mk_lam dkvar (Dk.mk_prf (trexpr (eapp (pred, [eapp (p, ts)]))))
	    (itereq ([], ts, us)))
    | Lkproof.SCeqprop (Eapp (p, ts, _), Eapp (_, us, _)) ->
       let rec itereq (xts, ts, us) =
         match ts, us with
         | [], [] -> trhyp (eapp (p, xts))
         | t :: ts, u :: us ->
	    let term = new_term () in
	    let dkterm = Dk.mk_var term in
	    Dk.mk_app3 (trhyp (eapp ("=", [t; u])))
	      (Dk.mk_lam dkterm Dk.mk_termtype ((trexpr (eapp (p, xts @ ((evar term) :: us))))))
	      (itereq ((xts@[t]), ts, us))
         | _ -> assert false;
       in
       itereq ([], ts, us)
    | Lkproof.SCext (ext, name, args, [conc], [[hyp]], [proof]) ->
       let ext = if ext = "" then "focal" else ext in
       assert (goal = efalse);
       (* Create a fresh variable for hypothesis *)
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_app
         (Dk.mk_var (ext ^ "." ^ name))
         (List.map trexpr args @ [
             Dk.mk_lam dkvar
                        (Dk.mk_prf (trexpr hyp))
                        (trproof (proof, efalse, (hyp, dkvar) :: gamma)) ; trhyp conc]
         )
    | _ -> assert false

end
