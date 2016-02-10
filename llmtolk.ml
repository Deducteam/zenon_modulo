open Llproof
open Lkproof
open Expr
open Printf

type env = {hypotheses : Expr.expr list; 
	    distincts : (Expr.expr * int) list;}

let gamma_length (g, c, rule) = List.length g

let rec xaddhyp h lkproof =
  let g, c, lkrule = lkproof in
  match lkrule with
  | SCaxiom _ | SCfalse
  | SCtrue | SCeqref _ | SCeqsym _
  | SCeqprop _ | SCeqfunc _ ->
    h :: g, c, lkrule
  | _ -> applytohyps (xaddhyp h) lkproof

and addhyp hyps lkproof =
  List.fold_left (fun pf h -> xaddhyp h pf) lkproof hyps

(* union [l_i] = Union [l_i], [Union[l_i]\l_j]_j*)
(* length (snd(union l)) = length l *)
let rec union lists =
  match lists with
  | [] -> [], []
  | [list] -> list, [[]]
  | [] :: lists ->
    let main, remainders = union lists in
    main, main :: remainders
  | (x :: l) :: lists ->
    let main, remainders = union (l :: lists) in
    match remainders with
    | remainder :: remainders ->
      if List.mem x main
      then
	if List.mem x remainder
	then main, (rm x remainder) :: remainders
	else main, remainder :: remainders
      else
	x :: main,
	remainder :: (List.map (fun xs -> x :: xs) remainders)
    | _ -> assert false

let sceqpropbis (e1, e2, proofs, gamma) =
  match e1, e2 with
  | Eapp (_, ts, _), Eapp (_, us, _) ->
    let prf = sceqprop (e1, e2, gamma) in
    let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in
    let _, proof =
      List.fold_left2
	(fun (l, prf) eq proof ->
	  assert (List.mem eq l);
	  let hyps = rm eq l in
	  assert (gamma_length prf =
	     gamma_length (addhyp hyps proof) + 1);
	  hyps, sccut (eq, addhyp hyps proof, prf))
	(e1 :: eqs, prf) eqs proofs in
    proof
  | _, _ -> assert false

let sceqfuncbis (e1, e2, proofs, gamma) =
  match e1, e2 with
  | Eapp (_, ts, _), Eapp (_, us, _) ->
    let prf = sceqfunc (e1, e2, gamma) in
    let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in
    let _, proof =
      List.fold_left2
	(fun (l, prf) eq proof ->
	  assert (List.mem eq l);
	  let hyps = rm eq l in
	  assert (gamma_length prf =
	     gamma_length (addhyp hyps proof) + 1);
	  hyps, sccut (eq, addhyp hyps proof, prf))
	(eqs, prf) eqs proofs in
    proof
  | _, _ -> assert false

(* Returns hypotheses and conclusions of rule *)
let rec hypstoadd rule =
  match rule with
  | Rfalse -> [], [efalse]
  | Rnottrue -> [], [enot etrue]
  | Raxiom (p) -> [], [p; enot p]
  | Rcut (p) -> [[p]; [enot p]], []
  | Rnoteq (a) -> [], [enot (eapp ("=", [a; a]))]
  | Reqsym (a, b) ->
    [], [eapp ("=", [a; b]); enot (eapp ("=", [b; a]))]
  | Rnotnot (p) -> [[p]], [enot (enot p)]
  | Rconnect (b, p, q) ->
    begin match b with
    | And -> [[p; q]], [eand (p, q)]
    | Or -> [[p]; [q]], [eor (p, q)]
    | Imply -> [[enot p]; [q]], [eimply (p, q)]
    | Equiv ->
      [[enot p; enot q]; [p; q]],
      [eand (eimply (p, q), eimply (q, p))]  end
  | Rnotconnect (b, p, q) ->
    begin match b with
    | And -> [[enot p]; [enot q]], [enot (eand (p, q))]
    | Or -> [[enot p; enot q]], [enot (eor (p, q))]
    | Imply -> [[p; enot q]], [enot (eimply (p, q))]
    | Equiv ->
      [[enot p; q]; [p; enot q]],
      [enot (eand (eimply (p, q), eimply (q, p)))]  end
  | Rex (ep, v) ->
    begin match ep with
    | Eex (x, ty, p, _) -> [[substitute [(x, v)] p]], [ep]
    | _ -> assert false end
  | Rall (ap, t) ->
    begin match ap with
    | Eall (x, ty, p, _) -> [[substitute [(x, t)] p]], [ap]
    | _ -> assert false end
  | Rnotex (ep, t) ->
    begin match ep with
    | Eex (x, ty, p, _) ->
      [[enot (substitute [(x, t)] p)]], [enot ep]
    | _ -> assert false end
  | Rnotall (ap, v) ->
    begin match ap with
    | Eall (x, ty, p, _) ->
      [[enot (substitute [(x, v)] p)]], [enot ap]
    | _ -> assert false end
  | Rpnotp (e1, e2) ->
    begin match e1, e2 with
    | Eapp (p, ts, _), Enot (Eapp (q, us, _), _) ->
      List.map2
	(fun x y -> [enot (eapp ("=", [x; y]))]) ts us,
      [e1; e2]
    | _ -> assert false end
  | Rnotequal (e1, e2) ->
    begin match e1, e2 with
    | Eapp (p, ts, _), Eapp (q, us, _) ->
      List.map2
	(fun x y -> [enot (eapp ("=", [x; y]))]) ts us,
      [enot (eapp ("=", [e1; e2]))]
    | _ -> assert false end
  | RcongruenceLR (p, a, b) ->
    [[apply p b]], [apply p a; eapp ("=", [a; b])]
  | RcongruenceRL (p, a, b) ->
    [[apply p b]], [apply p a; eapp ("=", [b; a])]
  | Rextension (ext, name, args, concs, hyps) ->
    hyps, concs
  | Rlemma (name, args) ->
    assert false
  | _ -> assert false (* no more Rdefinition after use_defs *)

let rec xrmdblnot e proof =
  let g, c, rule = proof in
  match rule with
  | SCaxiom (Enot (f, _)) ->
    assert (equal f e);
    sclnot (f, scaxiom (f, rm (enot f) g))
  | SCeqprop _ | SCeqfunc _ | SCtrue | SCeqref _ | SCeqsym _
  | SCrimply _ | SCrand _ | SCrorl _ | SCrorr _
  | SCrall _ | SCrex _ -> assert false
  | SCfalse -> scfalse (e :: (rm efalse g), efalse)
  | SClnot (f, prf) -> addhyp [e] prf
  | SCrnot (f, prf) -> assert (equal f e); prf
  | _ -> assert false

let rec rmdblnot e proof =
  let g, c, rule = proof in
  match rule with
  | SClnot (Enot (f, _), prf) when equal f e ->
    xrmdblnot e prf
  | SCaxiom (Enot (Enot (f, _), _)) when equal f e ->
    scrnot (
      enot e, sclnot (e, scaxiom (e, rm (enot (enot e)) g)))
  | SCaxiom (f) -> scaxiom (f, e :: (rm f (rm (enot (enot e)) g)))
  | SCfalse -> scfalse (e :: rm (enot (enot e)) g, c)
  | SCtrue -> sctrue (e :: rm (enot (enot e)) g)
  | SCeqref (a) -> sceqref (a, e :: rm (enot (enot e)) g)
  | SCeqsym (a, b) -> sceqsym (a, b, e :: rm (enot (enot e)) g)
  | SCeqprop (a, b) -> sceqprop (a, b, e :: rm (enot (enot e)) g)
  | SCeqfunc (a, b) -> sceqfunc (a, b, e :: rm (enot (enot e)) g)
  | SClcontr (Enot (Enot (f, _), _), prf) when equal f e ->
    sclcontr (f, rmdblnot e (rmdblnot e prf))
  | SCcut (_, prf1, prf2) -> applytohyps (rmdblnot e) proof
  | _ -> applytohyps (rmdblnot e) proof

let rec clean f prf =
  let g, c, rule = prf in
  match rule with
  | SCeqsym _ | SCeqref _
  | SCtrue | SCaxiom _ | SCfalse
  | SCeqprop _ | SCeqfunc _ ->
    assert (List.mem f g);
    rm f g, c, rule
  | _ -> applytohyps (clean f) prf

let rec xrmcongruence s x t a b =
  let eq =
    if s
    then eapp ("=", [a; b])
    else eapp ("=", [b; a]) in
  match t with
  | Evar (v, _) when (equal x t) ->
    if s
    then scaxiom (eapp ("=", [a; b]), [])
    else sceqsym (b, a, [])
  | Eapp (f, args, _) ->
    sceqfuncbis (
      substitute [(x, a)] t, substitute [(x, b)] t,
      List.map (fun t -> xrmcongruence s x t a b) args, [eq])
  | Evar _ | Etau _ -> sceqref (t, [eq])
  | _ ->
     let print_expr out = Print.expr (Print.Chan out) in
     Printf.eprintf "Warning: unexpected use of xrmcongruence %b (%a) (%a) (%a) (%a).\n"
                    s print_expr x print_expr t print_expr a print_expr b;
     sceqref (t, [eq])

let rec rmcongruence s x e a b =
  let eq =
    if s
    then eapp ("=", [a; b])
    else eapp ("=", [b; a]) in
  match e with
  | Etrue | Efalse | Evar _ -> scaxiom (e, [])
  | Eapp (f, args, _) ->
    sceqpropbis (
      substitute [(x, a)] e, substitute [(x, b)] e,
      List.map (fun t -> xrmcongruence s x t a b) args, [eq])
  | Eand (e1, e2, _) ->
    scland (
      substitute [(x, a)] e1, substitute [(x, a)] e2,
      scrand (
	substitute [(x, b)] e1, substitute [(x, b)] e2,
	addhyp [substitute [(x, b)] e2] (rmcongruence s x e1 a b),
	addhyp [substitute [(x, b)] e1] (rmcongruence s x e2 a b)))
  | Eor (e1, e2, _) ->
    sclor (
      substitute [(x, a)] e1, substitute [(x, a)] e2,
      scrorl (
	substitute [(x, b)] e1, substitute [(x, b)] e2,
	rmcongruence s x e1 a b),
      scrorr (
	substitute [(x, b)] e1, substitute [(x, b)] e2,
	rmcongruence s x e2 a b))
  | Eimply (e1, e2, _) ->
    scrimply (
      substitute [(x, b)] e1, substitute [(x, b)] e2,
      sclimply (
	substitute [(x, a)] e1, substitute [(x, a)] e2,
	rmcongruence (not s) x e1 b a,
	addhyp [substitute [(x, b)] e1] (rmcongruence s x e2 a b)))
  | Enot (e0, _) ->
    scrnot (
      substitute [(x, b)] e0,
      sclnot (
	substitute [(x, a)] e0,
	rmcongruence (not s) x e0 b a))
  | Eall (y, ty, e0, _) ->
    let z = new_var () in
    scrall (
      substitute [(x, b)] e,
      substitute [(x, b)] z,
      sclall (
	substitute [(x, a)] e,
	substitute [(x, a)] z,
	rmcongruence s x
	  (substitute [(y, z)] e0) a b))
  | Eex (y, ty, e0, _) ->
    let z = new_var () in
    screx (
      substitute [(x, b)] e,
      substitute [(x, b)] z,
      sclex (
	substitute [(x, a)] e,
	substitute [(x, a)] z,
	rmcongruence s x
	  (substitute [(y, z)] e0) a b))
    | Etau _ | Elam _ | Emeta _ | Eequiv _ ->
    assert false
		      
let rec ctrexpr_pos e =
  match e with
  | Evar _
  | Eapp _ -> enot (enot e) (* e MUST BE ALWAYS A PROPOSITION *)
  | Etrue
  | Efalse -> e
  | Enot (e, _) ->
     enot (ctrexpr_neg e)
  | Eand (e1, e2, _) ->
     eand (ctrexpr_pos e1, ctrexpr_pos e2)
  | Eor (e1, e2, _) ->
     enot (enot (eor (ctrexpr_pos e1, ctrexpr_pos e2)))
  | Eimply (e1, e2, _) ->
     eimply (ctrexpr_neg e1, ctrexpr_pos e2)
  | Eall (e1, s, e2, _) ->
     eall (e1, s, ctrexpr_pos e2)
  | Eex (e1, s, e2, _) ->
     enot (enot (eex (e1, s, ctrexpr_pos e2)))
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false

and ctrexpr_neg e =
  match e with
  | Evar _
  | Eapp _ -> e (* e MUST BE ALWAYS A PROPOSITION *)
  | Etrue
  | Efalse -> e
  | Enot (e, _) ->
     enot (ctrexpr_pos e)
  | Eand (e1, e2, _) ->
     eand (ctrexpr_neg e1, ctrexpr_neg e2)
  | Eor (e1, e2, _) ->
     enot (enot (eor (ctrexpr_neg e1, ctrexpr_neg e2)))
  | Eimply (e1, e2, _) ->
     eimply (ctrexpr_pos e1, ctrexpr_neg e2)
  | Eall (e1, s, e2, _) ->
     eall (e1, s, ctrexpr_neg e2)
  | Eex (e1, s, e2, _) ->
     enot (enot (eex (e1, s, ctrexpr_neg e2)))
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false

						   
(* e MUST BE A TRANSLATION OF A PROPOSITION *)
let rec rmdblnegation e =
  match e with
  | Etrue -> sctrue ([enot (enot etrue)])
  | Efalse ->
     sclnot (enot efalse,
	     scrnot (efalse, scfalse ([], efalse)))
  | Eand (e1, e2, _) ->
     scrand (e1, e2,
	     sccut (enot (enot e1),
		    scrnot (enot e1,
			    sclnot (enot e,
				    scrnot (e,
					    scland (e1, e2, sclnot (e1, scaxiom (e1, [e2])))))),
		    sclweak (enot (enot e), rmdblnegation e1)),
	     sccut (enot (enot e2),
		    scrnot (enot e2,
			    sclnot (enot e,
				    scrnot (e,
					    scland (e1, e2, sclnot (e2, scaxiom (e2, [e1])))))),
		    sclweak (enot (enot e), rmdblnegation e2)))
  | Eimply (e1, e2, _) ->
     scrimply (e1, e2,
	       sccut (enot (enot e2),
		      scrnot (enot e2,
			      sclnot (enot e,
				      scrnot (e,
					      sclnot (e2,
						      sclimply (e1, e2,
								scaxiom (e1, []),
								scaxiom (e2, [e1])))))),
		      sclweak (enot (enot e), sclweak (e1, rmdblnegation e2))))
  | Eall (x, ty, p, _) ->
     let z = new_var () in
     let pz = substitute [(x, z)] p in
     scrall (e, z,
	     sccut (enot (enot pz),
		    scrnot (enot pz,
			    sclnot (enot e,
				    scrnot (e,
					    sclnot (pz,
						    sclall (e, z, scaxiom (pz, [])))))),
		    sclweak (enot (enot e), rmdblnegation pz)))
  | Enot (e', _) ->
     scrnot (e',
	     sclnot (enot (enot e'),
		     scrnot (enot e',
			     sclnot (e', scaxiom (e', [])))))
  | Eequiv (e1, e2, _) ->
     assert false    (* Should have been unfolded earlier *)
  | Etau _ -> assert false                    (* Should have been unfolded *)
  | Elam (e1, s, e2, _) ->
     assert false
  (* Dk.mk_lam (trexpr e1) (Dk.mk_var s) (trexpr e2) *)
  | Emeta _ -> assert false                   (* Meta are forbidden earlier *)			    
  | Evar _
  | Eapp _
  | Eor _
  | Eex _ -> assert false

(* e MUST BE A TRANSLATION OF A PROPOSITION *)
let rmnegation e proof =
  (* p_debug "e" [e]; *)
  (* p_debug_proof "proof" proof; *)
  let g, c, rule = proof in
  let gamma = rm (enot e) g in
  let prf =
    List.fold_left (fun prf h -> sclweak (h, prf)) (rmdblnegation e) gamma in
  sccut (enot (enot e),
	 scrnot (enot e, proof),
	 prf)
	
let rec deduce_inequality e1 e2 v1 v2 c1 c2 b1 b2 gamma proof distincts =
  let n1 = List.assoc v1 distincts in
  let n2 = List.assoc v2 distincts in
  let eq = eapp ("=", [e1; e2]) in
  let b3 = n1 < n2 in
  let ax =
    if b3
    then eapp ("=", [v1; v2])
    else eapp ("=", [v2; v1]) in
  let rec f b1 b2 b3 =
    match b1, b2, b3 with
    | true, true, true -> sceqprop (eq, ax, [])
    | _, _, false ->
      sccut (
	eapp ("=", [v1; v2]),
	f b1 b2 true, sceqsym (v1, v2, [c1; c2; eq]))
    | _, false, _ ->
      sccut (
	eapp ("=", [e2; v2]),
	sceqsym (v2, e2, [c1; eq]), sclweak (c2, f b1 true b3))
    | false, _, _ ->
      sccut (
	eapp ("=", [e1; v1]),
	sceqsym (v1, e1, [c2; eq]), sclweak (c1, f true b2 b3))
  in
  sccut (
      enot (enot (enot eq)),
      scrnot (enot (enot eq),
	      sclnot (enot eq, 
		      List.fold_left (fun prf e -> sclweak (e, prf))
				     (scrnot (eq, sclnot (ax, f b1 b2 b3)))
				     (rm (enot (enot (enot ax))) gamma))),
      sclweak (c1, sclweak (c2, proof)))

let xlltolkrule distincts rule hyps gamma =
  match rule, hyps with
  | Rfalse, [] ->
     scfalse (gamma, efalse)
  | Rnottrue, [] ->
     sclnot (etrue, sctrue (gamma))
  | Raxiom (p), [] ->
     begin
       match p with
       | Evar _
       | Eapp _ ->
	  sclnot (enot (enot p),
		  scrnot (enot p,
			  sclnot (p, scaxiom (p, gamma))))
       | _ -> assert false
     end
  | Rcut (p), [proof1; proof2] ->
     assert false
  | Rnoteq (a), [] ->
     sclnot (enot (enot (eapp ("=", [a; a]))),
	     scrnot (enot (eapp ("=", [a; a])),
		     sclnot (eapp ("=", [a; a]), sceqref (a, gamma))));
  | Reqsym (a, b), [] ->
     sclnot (enot (enot (eapp ("=", [b; a]))),
	     scrnot (enot (eapp ("=", [b; a])),
		     sclnot (eapp ("=", [b; a]), sceqsym (a, b, gamma))))
  | Rnotnot (p), [proof] ->
     let cp = ctrexpr_neg p in
     sclnot (enot (cp), scrnot (cp, proof))
  | Rconnect (And, p, q), [proof] ->
     let cp, cq = ctrexpr_neg p, ctrexpr_neg q in
     scland (cp, cq, proof)
  | Rconnect (Or, p, q), [proof1; proof2] ->
     let cp, cq = ctrexpr_neg p, ctrexpr_neg q in
     sclnot (enot (eor (cp, cq)),
	     scrnot (eor (cp, cq),
		     sclor (cp, cq, proof1, proof2)))
  | Rconnect (Imply, p, q), [proof1; proof2] ->
     let cp, cq = ctrexpr_pos p, ctrexpr_neg q in
     sclimply (cp, cq,
	       rmnegation cp proof1,
	       proof2)
  | Rconnect (Equiv, p, q), [proof1; proof2] ->
     assert false
  | Rnotconnect (And, p, q), [proof1; proof2] ->
     let cp, cq = ctrexpr_pos p, ctrexpr_pos q in
     (* assert (ingamma (enot p) proof1); *)
     (* assert (ingamma (enot q) proof2); *)
     sclnot (eand (cp, cq),
	     scrand (cp, cq,
		     rmnegation cp proof1,
		     rmnegation cq proof2))
  | Rnotconnect (Or, p, q), [proof] ->
     let cp, cq = ctrexpr_pos p, ctrexpr_pos q in
     sclnot (enot (enot (eor (cp, cq))),
	     scrnot (enot (eor (cp, cq)),
		     sccut (enot cp,
			    scrnot (cp,
				    sclnot (eor (cp, cq),
					    scrorl (cp, cq,
						    scaxiom (cp, gamma)))),
			    sccut (enot cq,
				   scrnot (cq,
					   sclnot (eor (cp, cq),
						   scrorr(cp, cq,
							  scaxiom (cq, enot cp :: gamma)))),
				   sclweak (enot (eor (cp, cq)), proof)))))	    
  | Rnotconnect (Imply, p, q), [proof] ->
     let cp, cq = ctrexpr_neg p, ctrexpr_pos q in
     sclnot (eimply (cp, cq),
	     scrimply (cp, cq,
		       rmnegation cq proof))
  | Rnotconnect (Equiv, p, q), [proof1; proof2] ->
     assert false
  | Rex (Eex(x, ty, p, _) as ep, v), [proof] ->
     let cp = ctrexpr_neg p in
     sclnot (enot (eex (x, ty, cp)),
	     scrnot (eex (x, ty, cp),
		     sclex (eex (x, ty, cp), v, proof)))
  | Rall (Eall(x, _, p, _) as ap, t), [proof] ->
     let cap = ctrexpr_neg ap in
     let cpt = substitute [(x, t)] (ctrexpr_neg p) in
     sclall (cap, t, proof)	     
  | Rnotex (Eex(x, ty, p, _) as ep, t), [proof] ->
     let cp = ctrexpr_pos p in
     let cpt = substitute [(x, t)] (ctrexpr_pos p) in
     sclnot (enot (enot (eex (x, ty, cp))),
	     scrnot (enot (eex (x, ty, cp)),
		     sclnot (eex (x, ty, cp),
			     screx (eex (x, ty, cp), t,
				    rmnegation cpt proof))))
  | Rnotall (Eall(x, _, p, _) as ap, v), [proof] ->
     let cap = ctrexpr_pos ap in
     let cpv = substitute [(x, v)] (ctrexpr_pos p) in
     sclnot (cap,
	     scrall (cap, v,
		     rmnegation cpv proof))
  | Rpnotp (Eapp (_, ts, _) as e1,
  	    Enot (Eapp (_, us, _) as e2, _)), proofs ->
     let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in
     let prf = sclnot (e2, sceqprop (e1, e2, gamma)) in
     let _, proof =
       List.fold_left2
  	 (fun (l, prf) eq prfneq ->
  	  let hyps = rm eq l in
	  let wprf = List.fold_left (fun prf e -> sclweak (e, prf)) prfneq hyps in
  	  hyps, sccut (enot (enot (enot eq)),
		       scrnot (enot (enot eq),
			       sclnot (enot eq,
				       scrnot (eq, prf))),
		       wprf))
  	 (e1 :: enot e2 :: eqs, prf) eqs proofs in
     sclnot (enot (enot e2),
	     scrnot (enot e2, proof))
  | Rnotequal (Eapp (_, ts, _) as e1,
  	       (Eapp (_, us, _) as e2)), proofs ->
     let feq = eapp ("=", [e1; e2]) in
     let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in
     let prf = sclnot (feq, sceqfunc (e1, e2, gamma)) in
     let _, proof =
       List.fold_left2
  	 (fun (l, prf) eq prfneq ->
  	  let hyps = rm eq l in
	  let wprf = List.fold_left (fun prf e -> sclweak (e, prf)) prfneq hyps in
	  hyps, sccut (enot (enot (enot eq)),
		       scrnot (enot (enot eq),
			       sclnot (enot eq,
				       scrnot (eq, prf))),
		       wprf))
  	 (enot feq :: eqs, prf) eqs proofs in
     sclnot (enot (enot feq),
	     scrnot (enot feq, proof))
  | RcongruenceLR (Elam (x, _, e, _) as p, a, b), [proof] ->
     let cpa, cpb, ce = ctrexpr_neg (apply p a), ctrexpr_neg (apply p b), ctrexpr_neg e in
     sccut (cpb,
  	    List.fold_left (fun prf e -> sclweak (e, prf))
			   (rmcongruence true x ce a b) gamma,
  	    sclweak (cpa, sclweak (eapp ("=", [a; b]), proof)))
  | RcongruenceRL (Elam (x, _, e, _) as p, a, b), [proof] ->
     let cpa, cpb, ce = ctrexpr_neg (apply p a), ctrexpr_neg (apply p b), ctrexpr_neg e in     
     sccut (cpb,
  	    List.fold_left (fun prf e -> sclweak (e, prf))
			   (rmcongruence false x ce a b) gamma,
  	    sclweak (cpa, sclweak (eapp ("=", [b; a]), proof)))
  | Rextension (
  	"", "zenon_notallex", [Elam (x, t, p, _)], [ap], [[ep]]), [proof] ->
     let z = new_var () in
     let cp = ctrexpr_pos p in
     let cpz = substitute [(x, z)] cp in
     sccut (enot (enot (eex (x, t, enot cp))),
	    scrnot (enot (eex (x, t, enot cp)),
		    sclnot (eall (x, t, cp),
			    scrall (eall (x, t, cp), z,
				    rmnegation cpz
					       (sclnot (eex (x, t, enot cp),
							screx (eex (x, t, enot cp), z,
							       scaxiom (enot cpz, gamma))))))),
	    sclweak (enot (eall (x, t, cp)), proof))
  | Rextension ("", "zenon_stringequal", [s1; s2], [c], []), [] ->
     let v1 = eapp ("$string", [s1]) in
     let v2 = eapp ("$string", [s2]) in
     let n1 = List.assoc v1 distincts in
     let n2 = List.assoc v2 distincts in
     let c12 = eapp ("=", [v1; v2]) in
     let c21 = eapp ("=", [v2; v1]) in
     if n1 < n2
     then
       sclnot (enot (enot c12),
	       scrnot (enot c12,
		       sclnot (c12,
			       scaxiom (c12, rm (enot(enot(enot c12))) gamma))))
     else
       sclnot (enot (enot c21),
	       scrnot (enot c21,
		       sclnot (c21,
			       sceqsym (v1, v2, rm (enot(enot(enot c21))) gamma))))
  | Rextension (
  	"", "zenon_stringdiffll", [e1; v1; e2; v2],
  	[c1; c2], [[h]]), [proof] ->
     deduce_inequality e1 e2 v1 v2 c1 c2 true true gamma proof distincts
  | Rextension (
  	"", "zenon_stringdifflr", [e1; v1; e2; v2],
  	[c1; c2], [[h]]), [proof] ->
     deduce_inequality e1 e2 v1 v2 c1 c2 true false gamma proof distincts
  | Rextension (
  	"", "zenon_stringdiffrl", [e1; v1; e2; v2],
  	[c1; c2], [[h]]), [proof] ->
     deduce_inequality e1 e2 v1 v2 c1 c2 false true gamma proof distincts
  | Rextension (
  	"", "zenon_stringdiffrr", [e1; v1; e2; v2],
  	[c1; c2], [[h]]), [proof] ->
     deduce_inequality e1 e2 v1 v2 c1 c2 false false gamma proof distincts
  | Rextension (ext, name, args, cons, hyps), proofs ->
     assert false
  (* scext(ext, name, args, cons, hyps, proofs) *)
  | Rlemma _, _ -> assert false (* no lemma after use_defs *)
  | Rdefinition _, _ -> assert false (* no definition after use_defs *)
  | _ -> assert false

let rec lltolkrule distincts proof gamma =
  let hypslist, conclist = hypstoadd proof.rule in
  (* list = gamma - (conclist inter gamma) *)
  (* newcontr = conclist - (conclist inter gamma) *)
  (* newcontr : list of things to be contracted later *)
  let newcontr, list =
    List.fold_left (fun (cs, es) e ->
      if (List.mem e es)
      then
	cs, rm e es
      else
	e :: cs, es)
      ([], gamma) conclist in
  let contrshyps = 		(* result with classical connectives *)
    List.map2 (lltolkrule distincts) proof.hyps
      (List.map (List.rev_append list) hypslist) in
  let contrs, prehyps = List.split contrshyps in (* result with classical connectives *)
  let maincontr, remainders = union contrs in (* result with classical connectives *)
  let hyps = List.map2 addhyp remainders prehyps in (* result with classical connectives *)
  let preproof =
    xlltolkrule distincts proof.rule hyps
		(maincontr@(List.map ctrexpr_neg list))
		(* (maincontr@list) *)
  in
  (* Lkproof.p_debug_proof "coucou" preproof;   *)
  (* Now try to contract requested contrs *)
  let cconclist = List.map ctrexpr_neg conclist in
  let (newlist, newproof) =
  List.fold_left
    (fun (cs, prf) c ->
      if List.mem c cconclist
      then cs, sclcontr (c, prf)
      else c :: cs, prf)
    (List.map ctrexpr_neg newcontr, preproof) maincontr in
  if !Globals.debug_flag then (
    (* Display them *)
    Printf.eprintf
      "\n\nlltolkrule: LLproof: (%a),\n"
      (fun oc -> Print.llproof (Print.Chan oc))
      [{name="mytho"; params = []; proof = proof}];
    Lkproof.p_debug "Gamma = " gamma;
    if newlist = [] then
      Printf.eprintf "No remaining formula to prove."
    else
      Lkproof.p_debug "Remaining formulae to prove:" newlist;
    (* Lkproof.p_debug "\nNew proof:" newproof; *)
    Printf.eprintf "lltolkrule: DONE\n\n");
  (newlist, newproof)

(* Check that the list of remaining formulae to prove l is empty.
   Print it otherwise *)
let check_empty_remaining_proofs l =
  if not (l = []) then (
    Lkproof.p_debug "Error while translating from LL to LK, : " l;
    assert false
  )
			 
let rec lltolk env proof goal righthandside contextoutput =
  let lkproof = match righthandside with
    | true ->
       let l, lkproof = lltolkrule env.distincts proof (enot goal :: env.hypotheses) in
       check_empty_remaining_proofs l; (* maincontr subset conclist subset gamma *) lkproof
    | false ->
       (* does not happen ? *)
       let l, lkproof = lltolkrule env.distincts proof env.hypotheses in
       check_empty_remaining_proofs l; lkproof in
  (* Lkproof.p_debug_proof "coucou" lkproof; *)
  let cgoal = ctrexpr_pos goal in
  let lkproof2 = rmnegation cgoal lkproof in
  let _, lkproof3 =
    List.fold_left
      (fun (conc, rule) stmt ->
       eimply (stmt, conc),
       scrimply (stmt, conc, rule))
      (cgoal, lkproof2) (List.map ctrexpr_neg env.hypotheses)
  in lkproof3
