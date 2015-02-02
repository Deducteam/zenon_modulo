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

  let new_hypo () = sprintf "zenon_H%d" (new_name ())
  let new_prop () = sprintf "zenon_P%d" (new_name ())
  let new_term () = sprintf "zenon_X%d" (new_name ())

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
       Dk.mk_lam dkprop
                 Dk.mk_proptype
                 (Dk.mk_lam dkvar (Dk.mk_prf dkprop) dkvar)
    | Lkproof.SCeqref (a) ->
       let prop = new_prop () in
       let dkprop = Dk.mk_var prop in
       let ty = get_type a in
       Dk.mk_lam dkprop (Dk.mk_arrow (TrExpr.trexpr ty) Dk.mk_proptype)
         (trproof (
	   Lkproof.scrimply (
	     eapp (evar prop, [a]),
	     eapp (evar prop, [a]),
	     Lkproof.scaxiom (eapp (evar prop, [a]), [])),
	   eimply (eapp (evar prop, [a]), eapp (evar prop, [a])), gamma))
    | Lkproof.SCeqsym (a, b) ->
       let term = new_term () in
       let dkterm = Dk.mk_var term in
       let ty = get_type a in
       Dk.mk_app3 (trhyp (eeq a b))
         (Dk.mk_lam dkterm (TrExpr.trexpr ty) (trexpr (eeq (tvar term ty) a)))
         (trproof (Lkproof.sceqref (a, []), eeq a a, gamma))
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
    | Lkproof.SClall (Eall (x, p, _) as ap, t, lkrule) ->
       let traux =
         Dk.mk_app2 (trhyp ap) (trexpr t) in
       trproof
         (lkrule, goal, (substitute [(x, t)] p, traux) :: gamma)
    | Lkproof.SClex (Eex (x, p, _) as ep, v, lkrule) ->
       let ty = get_type x in
       let q = substitute [(x, v)] p in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_app3 (trhyp ep)
         (trexpr goal)
         (Dk.mk_lam
            (trexpr v)
            (Dk.term_of_ty ty)
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
    | Lkproof.SCrall (Eall (x, p, _), v, lkrule) ->
       let ty = get_type x in
       let q = substitute [(x, v)] p in
       Dk.mk_lam
         (trexpr v)
         (Dk.term_of_ty ty)
         (trproof (lkrule, q, gamma))
    | Lkproof.SCrex (Eex (x, p, _), t, lkrule) ->
       let ty = get_type x in
       let prop = new_prop () in
       let dkprop = Dk.mk_var prop in
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_lam
         dkprop
         Dk.mk_proptype
         (Dk.mk_lam
            dkvar
	    (Dk.mk_pi
               (trexpr x)
               (Dk.term_of_ty ty)
	       (Dk.mk_arrow (Dk.mk_prf (trexpr p)) (Dk.mk_prf dkprop)))
	    (Dk.mk_app3 dkvar (trexpr t) (trproof (lkrule, substitute [(x, t)] p, gamma))))
    | Lkproof.SCcnot (e, lkrule) ->
       if !Globals.keepclassical = false then assert false;
       let var = new_hypo () in
       let dkvar = Dk.mk_var var in
       Dk.mk_app2
	 (Dk.mk_nnpp (trexpr e))
	 (Dk.mk_lam 
	    dkvar (Dk.mk_prf (Dk.mk_not (trexpr e))) 
	    (trproof (lkrule, efalse, (enot e, dkvar) :: gamma)))
    | Lkproof.SClcontr (e, lkrule) ->
       trproof (lkrule, goal, gamma)
    | Lkproof.SCrweak (e, lkrule) ->
       Dk.mk_app2 (trproof (lkrule, efalse, gamma)) (trexpr e)
    | Lkproof.SCeqfunc (Eapp (p, ts, _) as a, Eapp (_, us, _)) ->
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
            let ty = get_type t in
	    Dk.mk_app3 (trhyp (eeq t u))
	      (Dk.mk_lam dkterm (TrExpr.trexpr ty)
	         (trexpr (eapp (evar pred, [eapp (p, xts @ ((tvar term ty) :: us))]))))
	      (itereq ((xts@[t]), ts, us))
         | _ -> assert false in
       let ty = get_type a in
       Dk.mk_lam dkpred (Dk.mk_arrow (TrExpr.trexpr ty) Dk.mk_proptype)
         (Dk.mk_lam dkvar (Dk.mk_prf (trexpr (eapp (evar pred, [eapp (p, ts)]))))
	    (itereq ([], ts, us)))
    | Lkproof.SCeqprop (Eapp (p, ts, _), Eapp (_, us, _)) ->
       let rec itereq (xts, ts, us) =
         match ts, us with
         | [], [] -> trhyp (eapp (p, xts))
         | t :: ts, u :: us ->
            let ty = get_type t in
	    let term = new_term () in
	    let dkterm = Dk.mk_var term in
	    Dk.mk_app3 (trhyp (eeq t u))
                       (Dk.mk_lam dkterm (TrExpr.trexpr ty) ((trexpr (eapp (p, xts @ ((tvar term ty) :: us))))))
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
    | Lkproof.SCext (ext, name, args, [conc], [], []) ->
       let ext = if ext = "" then "focal" else ext in
       assert (goal = efalse);
       Dk.mk_app
         (Dk.mk_var (ext ^ "." ^ name))
         (List.map trexpr args)
    | Lkproof.SCext (ext, name, _, _, _, _) ->
       failwith ("Don't know how to translate extension rule " ^ ext ^ "." ^ name)
    | _ -> assert false

end
