(* This module defines operations for translating expressions and
   ljproofs to the Dedukti ASTs defined in Dkterm *)

open Printf
open Expr
open Termsig

module Translate(Dk : TermSig) =
struct

  module TrExpr = Exprtodk.Translate(Dk)

  let trexpr = TrExpr.trexpr

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

  let rec trproof (proof, goal, gamma) =
    let trhyp e =
      try (List.assoc e gamma)
      with Not_found -> assert false in
    match proof with
    | Ljproof.SCaxiom (e) ->
       trhyp e
    | Ljproof.SCfalse ->
       Dk.mk_app2 (trhyp efalse) (trexpr goal)
    | Ljproof.SCtrue ->
       let prop = new_prop () in
       let dkprop = Dk.mk_var prop in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_lam dkprop Dk.mk_proptype (Dk.mk_lam dkvar (Dk.mk_prf dkprop) dkvar)
    (* | Ljproof.SCeqsym (a, b) -> *)
    (*    let term = new_term () in *)
    (*    let dkterm = Dk.mk_var term in *)
    (*    Dk.mk_app3 (trhyp (eapp ("=", [a; b]))) *)
    (*      (Dk.mk_lam dkterm Dk.mk_termtype (trexpr (eapp ("=", [evar term; a])))) *)
    (*      (trproof (Ljproof.sctheory ("refl", eapp ("=", [a; a]), *)
    (* 				     Ljproof.scaxiom (eapp ("=", [a; a]), [])), *)
    (* 		   eapp ("=", [a; a]), *)
    (* 		   gamma)) *)
    | Ljproof.SCcut (e, lkrule1, lkrule2) ->
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_app2
	 (Dk.mk_lam dkvar
		    (Dk.mk_prf (trexpr e))
		    (trproof (lkrule2, goal, (e, dkvar) :: gamma)))
	 (trproof (lkrule1, e, gamma))
       (* trproof *)
       (*   (lkrule2, goal, *)
       (*    (e, trproof (lkrule1, e, gamma)) :: gamma) *)
    | Ljproof.SCland (e1, e2, lkrule) ->
       let var1 = new_hypo () in
       let dkvar1 = Dk.mk_var var1 in
       let var2 = new_hypo () in
       let dkvar2 = Dk.mk_var var2 in
       (* Dk.mk_app3  *)
       (* 	 (Dk.mk_lam dkvar1 *)
       (* 		    (Dk.mk_prf (trexpr e1)) *)
       (* 		    (Dk.mk_lam dkvar2 *)
       (* 			       (Dk.mk_prf (trexpr e2)) *)
       (* 			       (trproof (lkrule, goal, (e1, dkvar1) :: (e2, dkvar2) :: gamma)))) *)
       (* 	 (Dk.mk_app3 (trhyp (eand (e1, e2))) *)
       (* 		     (trexpr e1) *)
       (* 		     (Dk.mk_lam dkvar1 *)
       (* 				(Dk.mk_prf (trexpr e1)) *)
       (* 				(Dk.mk_lam dkvar2 (Dk.mk_prf (trexpr e2)) dkvar1))) *)
       (* 	 (Dk.mk_app3 (trhyp (eand (e1, e2))) *)
       (* 		     (trexpr e2) *)
       (* 		     (Dk.mk_lam dkvar1 *)
       (* 				(Dk.mk_prf (trexpr e1)) *)
       (* 				(Dk.mk_lam dkvar2 (Dk.mk_prf (trexpr e2)) dkvar2)))	  *)
       Dk.mk_app3 (trhyp (eand (e1, e2)))
         (trexpr goal)
         (Dk.mk_lam dkvar1
       	    (Dk.mk_prf (trexpr e1))
       	    (Dk.mk_lam dkvar2
       	       (Dk.mk_prf (trexpr e2))
       	       (trproof (lkrule, goal, (e1, dkvar1) :: (e2, dkvar2) :: gamma))))
    | Ljproof.SClor (e1, e2, lkrule1, lkrule2) ->
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
    | Ljproof.SClimply (e1, e2, lkrule1, lkrule2) ->
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_app2
	 (Dk.mk_lam dkvar
		    (Dk.mk_prf (trexpr e2))
		    (trproof (lkrule2, goal, (e2, dkvar) :: gamma)))
	 (Dk.mk_app2 (trhyp (eimply (e1, e2))) (trproof (lkrule1, e1, gamma)))
       (* let traux = *)
       (*   Dk.mk_app2 (trhyp (eimply (e1, e2))) (trproof (lkrule1, e1, gamma)) in *)
       (* trproof (lkrule2, goal, (e2, traux) :: gamma) *)
    | Ljproof.SClnot (e, lkrule) ->
       Dk.mk_app2 (trhyp (enot e)) (trproof (lkrule, e, gamma))
    | Ljproof.SClall (Eall (x, ty, p, _) as ap, t, lkrule) ->
       let pt = substitute [(x, t)] p in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_app2
	 (Dk.mk_lam dkvar
		    (Dk.mk_prf (trexpr pt))
		    (trproof (lkrule, goal, (pt, dkvar) :: gamma)))
	 (Dk.mk_app2 (trhyp ap) (trexpr t))
       (* let traux = *)
       (*   Dk.mk_app2 (trhyp ap) (trexpr t) in *)
       (* trproof *)
       (*   (lkrule, goal, (substitute [(x, t)] p, traux) :: gamma) *)
    | Ljproof.SClex (Eex (x, s, p, _) as ep, v, lkrule) ->
       let ty =
         if s = "zenon_U"
         then Dk.mk_termtype
         else (Dk.mk_term (Dk.mk_var s))
       in
       let q = substitute [(x, v)] p in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_app3 (trhyp ep)
         (trexpr goal)
         (Dk.mk_lam (trexpr v) ty
	    (Dk.mk_lam dkvar
	       (Dk.mk_prf (trexpr q))
	       (trproof  (lkrule, goal, (q,dkvar) :: gamma))))
    | Ljproof.SCrand (e1, e2, lkrule1, lkrule2) ->
       let prop = new_prop () in
       let dkprop = Dk.mk_var prop in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_lam dkprop Dk.mk_proptype
         (Dk.mk_lam dkvar
	    (Dk.mk_arrow (Dk.mk_prf (trexpr e1))
	       (Dk.mk_arrow (Dk.mk_prf (trexpr e2)) (Dk.mk_prf dkprop)))
	    (Dk.mk_app3 dkvar (trproof (lkrule1, e1, gamma)) (trproof (lkrule2, e2, gamma))))
    | Ljproof.SCrorl (e1, e2, lkrule) ->
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
    | Ljproof.SCrorr (e1, e2, lkrule) ->
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
    | Ljproof.SCrimply (e1, e2, lkrule) ->
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_lam dkvar (Dk.mk_prf (trexpr e1))
         (trproof (lkrule, e2, (e1, dkvar) :: gamma))
    | Ljproof.SCrnot (e, lkrule) ->
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_lam dkvar (Dk.mk_prf (trexpr e))
         (trproof (lkrule, efalse, (e, dkvar) :: gamma))
    | Ljproof.SCrall (Eall (x, s, p, _), v, lkrule) ->
       let ty =
         if s = "zenon_U"
         then Dk.mk_termtype
         else (Dk.mk_term (Dk.mk_var s))
       in
       let q = substitute [(x, v)] p in
       Dk.mk_lam (trexpr v) ty
         (trproof (lkrule, q, gamma))
    | Ljproof.SCrex (Eex (x, s, p, _), t, lkrule) ->
       let ty =
         if s = "zenon_U"
         then Dk.mk_termtype
         else (Dk.mk_term (Dk.mk_var s))
       in
       let prop = new_prop () in
       let dkprop = Dk.mk_var prop in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_lam dkprop Dk.mk_proptype
         (Dk.mk_lam dkvar
	    (Dk.mk_pi (trexpr x) ty
	       (Dk.mk_arrow (Dk.mk_prf (trexpr p)) (Dk.mk_prf dkprop)))
	    (Dk.mk_app3 dkvar (trexpr t) (trproof (lkrule, substitute [(x, t)] p, gamma))))
    | Ljproof.SClcontr (e, lkrule) ->
       trproof (lkrule, goal, gamma)
    | Ljproof.SCrweak (e, lkrule) ->
       Dk.mk_app2 (trproof (lkrule, efalse, gamma)) (trexpr e)
    | Ljproof.SCeqfunc (Eapp (p, ts, _), Eapp (_, us, _)) ->
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
    | Ljproof.SCeqprop (Eapp (p, ts, _), Eapp (_, us, _)) ->
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
    (* | Ljproof.SCtheory (str, e, lkrule) -> *)
    (*    let dkproof =  *)
    (* 	 match str with *)
    (* 	 | "refl" -> *)
    (* 	    let a = *)
    (* 	      match e with *)
    (* 	      | Eapp ("=", a :: _, _) -> a *)
    (* 	      | _ -> assert false in *)
    (* 	    let prop = new_prop () in *)
    (* 	    let dkprop = Dk.mk_var prop in *)
    (* 	    Dk.mk_lam dkprop (Dk.mk_arrow Dk.mk_termtype Dk.mk_proptype) *)
    (* 		      (trproof ( *)
    (* 			   Ljproof.scrimply ( *)
    (* 			       eapp (prop, [a]), *)
    (* 			       eapp (prop, [a]), *)
    (* 			       Ljproof.scaxiom (eapp (prop, [a]), [])), *)
    (* 			   eimply (eapp (prop, [a]), eapp (prop, [a])), gamma)) *)
    (* 	 | _ -> assert false *)
    (*    in *)
    (*    trproof (lkrule, goal, (e, dkproof) :: gamma) *)
    | _ -> assert false

end
