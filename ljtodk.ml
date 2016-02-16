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
    | Lkproof.SCland (e1, e2, lkrule) ->
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
    | Lkproof.SClnot (e, lkrule) ->
       Dk.mk_app2 (trhyp (enot e)) (trproof (lkrule, e, gamma))
    | Lkproof.SClall (Eall (x, ty, p, _) as ap, t, lkrule) ->
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
    | Lkproof.SClex (Eex (x, s, p, _) as ep, v, lkrule) ->
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
    | Lkproof.SCrall (Eall (x, s, p, _), v, lkrule) ->
       let ty =
         if s = "zenon_U"
         then Dk.mk_termtype
         else (Dk.mk_term (Dk.mk_var s))
       in
       let q = substitute [(x, v)] p in
       Dk.mk_lam (trexpr v) ty
         (trproof (lkrule, q, gamma))
    | Lkproof.SCrex (Eex (x, s, p, _), t, lkrule) ->
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
    | Lkproof.SCcnot (e, lkrule) ->
       assert false
       (* 	      if !Globals.keepclassical = false then assert false; *)
       (* let var = new_hypo () in *)
       (* let dkvar = Dk.mk_var var in *)
       (* Dk.mk_app2 *)
       (* 	 (Dk.mk_nnpp (trexpr e)) *)
       (* 	 (Dk.mk_lam  *)
       (* 	    dkvar (Dk.mk_prf (Dk.mk_not (trexpr e)))  *)
       (* 	    (trproof (lkrule, efalse, (enot e, dkvar) :: gamma))) *)
    | Lkproof.SClcontr (e, lkrule) ->
       trproof (lkrule, goal, gamma)
    | Lkproof.SCweak (_, o, lkrule) ->
       begin
	 match o with
	 | None -> trproof (lkrule, goal, gamma)
	 | Some e -> Dk.mk_app2 (trproof (lkrule, efalse, gamma)) (trexpr e)
       end
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
       (* let ext = if ext = "" then "focal" else ext in *)
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
