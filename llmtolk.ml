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
	sceqsym (v2, e2, [c1; eq]), addhyp [c2] (f b1 true b3))
    | false, _, _ ->
      sccut (
	eapp ("=", [e1; v1]),
	sceqsym (v1, e1, [c2; eq]), addhyp [c1] (f true b2 b3))
  in
  sccut (
    enot eq,
    addhyp (rm (enot ax) gamma) (
      scrnot (eq, sclnot (ax, (f b1 b2 b3)))),
    addhyp [c1; c2] proof)

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

and useful e proof =
  let g, c, rule = proof in
  match rule with
  | SCeqsym (a, b) ->
    equal e (eapp ("=", [a; b])) && not (List.mem e (rm e g))
  | SCeqref (a) -> false
  | SCtrue -> false
  | SCaxiom (a) -> equal e a && not (List.mem e (rm e g))
  | SCfalse -> equal e efalse && not (List.mem e (rm e g))
  | SCeqprop (Eapp (p, ts, _) as f1, Eapp (_, us, _)) ->
    let x = equal e f1 in
    List.fold_left2
      (fun x t u -> (x || equal e (eapp ("=", [t; u]))))
      x ts us
  | SCeqprop _ -> assert false
  | SCeqfunc (Eapp (p, ts, _), Eapp (_, us, _)) ->
    List.fold_left2
      (fun x t u -> (x || equal e (eapp ("=", [t; u]))))
      false ts us
  | SCeqfunc _ -> assert false
  | SClcontr (f, _)
      when (equal e f && not (List.mem e (rm e g))) -> true
  | SClor (a, b, _, _)
      when (equal e (eor (a, b))
	    && not (List.mem e (rm e g))) -> true
  | SCland (a, b, _)
      when (equal e (eand (a, b))
	    && not (List.mem e (rm e g))) -> true
  | SClex (f, _, _)
      when (equal e f && not (List.mem e (rm e g))) -> true
  | SClall (f, _, _)
      when (equal e f && not (List.mem e (rm e g))) -> true
  | SClnot (f, _)
      when (equal e (enot f) && not (List.mem e (rm e g))) -> true
  | SClimply (a, b, _, _)
      when (equal e (eimply (a, b))
	    && not (List.mem e (rm e g))) -> true
  | SClcontr _ | SClor _ | SCland _ | SClex _
  | SClall _ | SClnot _ | SClimply _ | SCcut _
  | SCrimply _ | SCrnot _ | SCrex _ | SCrall _
  | SCrand _ | SCrorr _ | SCrorl _ | SCrweak _ | SCcnot _
    -> List.exists (useful e) (hypsofrule rule)
  | SCext _ -> true (* à corriger ? *)

let rec lefttoright e proof =
  let g, c, rule = proof in
  let ne = enot e in
  assert (List.mem ne g);
  if not (useful ne proof)
  then scrweak (e, clean ne proof)
  else
    match e with
    | Enot (f, _) ->
       optimize (scrnot (f, rmdblnot f proof))
    | _ ->
       assert (equal c efalse);
       assert (ingamma ne proof);
       match rule with
       | SClnot (f, prf)
	    when (equal f e) -> prf
       | SClcontr (f, _)
	    when (equal ne f) -> sccnot (e, proof)
       | SClimply (a, b, prf1, prf2)
	    when (not (useful ne prf1)) ->
	  sclimply (a, b, clean ne prf1, lefttoright e prf2)
       | SCcut (a, prf1, prf2)
	    when (not (useful ne prf1)) ->
	  sccut (a, clean ne prf1, lefttoright e prf2)
       | SClnot _ | SCcut _ | SClimply _
       | SCext _ ->
	  sccnot (e, proof)
       | SCaxiom _ | SCfalse ->
		      scfalse (rm efalse (rm ne g), e)
       | SClcontr _ | SClor _ | SCland _ | SClex _ | SClall _
						     -> applytohyps (lefttoright e) proof
       | SCrex _ | SCrall _ | SCrand _ | SCrorr _ | SCrorl _
       | SCrimply _ | SCrnot _ | SCeqfunc _ | SCeqprop _
       | SCeqsym _ | SCeqref _ | SCtrue | SCcnot _ | SCrweak _
						     -> assert false

and righttoleft e proof =
  let g, c, rule = proof in
  let ne = enot e in
  match rule with
  | SCcnot (f, prf) -> prf
  | SClnot _ -> assert false
  | SClimply (f1, f2, prf1, prf2) ->
    sclimply (f1, f2, xaddhyp ne prf1, righttoleft e prf2)
  | SCcut (f, prf1, prf2) ->
    sccut (f, xaddhyp ne prf1, righttoleft e prf2)
  | SCland _ | SClor _ | SClall _ | SClex _
    -> applytohyps (righttoleft e) proof
  | SCaxiom _ | SCfalse | SCtrue | SCeqref _ | SCeqsym _
  | SCeqprop _ | SCeqfunc _ | SCrweak _
    -> sclnot (e, proof)
  | SCrand _ | SCrorl _ | SCrorr _
  | SCrimply _ | SCrnot _ | SCrall _ | SCrex _ | SClcontr _
  | SCext _
    -> sclnot (e, proof)

and optimize proof =
  let g, c, rule = proof in
  match rule with
  | SCcnot (e, prf) ->
    lefttoright e prf
  | SClnot (e, prf) ->
    righttoleft e prf
  | _ -> applytohyps optimize proof

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
  | Evar _ | Etau _ -> sceqref (t, [eq])
  | Eapp (f, args, _) ->
    sceqfuncbis (
      substitute [(x, a)] t, substitute [(x, b)] t,
      List.map (fun t -> xrmcongruence s x t a b) args, [eq])
  | _ -> assert false

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

let xlltolkrule distincts rule hyps gamma =
  match rule, hyps with
  | Rfalse, [] ->
    scfalse (gamma, efalse)
  | Rnottrue, [] ->
    righttoleft etrue (sctrue (gamma))
  | Raxiom (p), [] ->
    righttoleft p (scaxiom (p, gamma))
  | Rcut (p), [proof1; proof2] ->
    sccut (enot p, scrnot (p, proof1), proof2)
  | Rnoteq (a), [] ->
    righttoleft (eapp ("=", [a; a])) (sceqref (a, gamma));
  | Reqsym (a, b), [] ->
    righttoleft (eapp ("=", [b; a]))
      (sceqsym (a, b, gamma))
  | Rnotnot (p), [proof] ->
    righttoleft (enot (p))
      (scrnot (p, proof))
  | Rconnect (And, p, q), [proof] ->
    scland (p, q, proof)
  | Rconnect (Or, p, q), [proof1; proof2] ->
    sclor (p, q, proof1, proof2)
  | Rconnect (Imply, p, q), [proof1; proof2] ->
    assert (ingamma (enot p) proof1);
    sclimply (p, q, lefttoright p proof1, proof2)
  | Rconnect (Equiv, p, q), [proof1; proof2] ->
    assert (ingamma (enot q) proof1);
    assert (ingamma (enot p) (sclimply (
      q, p,
      lefttoright q proof1,
      righttoleft p (scaxiom (p, gamma)))));
    scland (
      eimply (p, q), eimply (q, p),
      sclimply (
	p, q,
	lefttoright p
	  (sclimply (
	    q, p,
	    lefttoright q proof1,
	    righttoleft p (scaxiom (p, gamma)))),
	sclimply (
	  q, p,
	  scaxiom (q, gamma), proof2)))
  | Rnotconnect (And, p, q), [proof1; proof2] ->
    assert (ingamma (enot p) proof1);
    assert (ingamma (enot q) proof2);
    righttoleft (eand (p, q))
      (scrand (p, q, lefttoright p proof1, lefttoright q proof2))
  | Rnotconnect (Or, p, q), [proof] ->
    assert (ingamma (enot q) proof);
    assert (ingamma (enot p)
	      (righttoleft (eor (p, q)) (
		scrorr (
		  p, q,
		  lefttoright q proof))));
    if not (useful (enot p) proof)
    then
      righttoleft (eor (p, q)) (
	scrorr (
	  p, q,
	  lefttoright q (clean (enot p) proof)))
    else if not (useful (enot q) proof)
    then
      righttoleft (eor (p, q)) (
	scrorl (
	  p, q,
	  lefttoright p (clean (enot q) proof)))
    else
    begin match q with
    | Enot _ ->
      sclcontr (
	enot (eor (p, q)),
	righttoleft (eor (p, q)) (
	  scrorr (
	    p, q,
	    lefttoright q (
	      righttoleft (eor (p, q)) (
		scrorl (
		  p, q,
		  lefttoright p proof))))))
    | _ ->
      sclcontr (
	enot (eor (p, q)),
	righttoleft (eor (p, q)) (
	  scrorl (
	    p, q,
	    lefttoright p (
	      righttoleft (eor (p, q)) (
		scrorr (
		  p, q,
		  lefttoright q proof)))))) end
  | Rnotconnect (Imply, p, q), [proof] ->
    righttoleft (eimply (p, q))
      (scrimply (p, q, lefttoright q proof))
  | Rnotconnect (Equiv, p, q), [proof1; proof2] ->
    assert (ingamma (enot q) proof2);
    assert (ingamma (enot p) proof1);
    righttoleft (eand (eimply (p, q), eimply (q, p)))
      (scrand (eimply (p, q), eimply (q, p),
	       scrimply (p, q, lefttoright q proof2),
	       scrimply (q, p, lefttoright p proof1)))
  | Rex (ep, v), [proof] ->
    sclex (ep, v, proof)
  | Rall (ap, t), [proof] ->
    sclall (ap, t, proof)
  | Rnotex (Eex(x, ty, p, _) as ep, t), [proof] ->
    assert (ingamma (enot (substitute [(x, t)] p)) proof);
    righttoleft ep
      (screx (ep, t, lefttoright (substitute [(x, t)] p) proof))
  | Rnotall (Eall(x, ty, p, _) as ap, v), [proof] ->
    assert (ingamma (enot (substitute [(x, v)] p)) proof);
    righttoleft ap (
      scrall (
	ap, v,
	lefttoright (substitute [(x, v)] p) proof))
  | Rpnotp (Eapp (_, ts, _) as e1,
	    Enot (Eapp (_, us, _) as e2, _)), proofs ->
    let prf = sceqprop (e1, e2, gamma) in
    let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in
    let _, proof =
      List.fold_left2
	(fun (l, prf) eq proof ->
	  assert (List.mem eq l);
	  let hyps = rm eq l in
	  assert (gamma_length prf =
	     gamma_length (addhyp hyps (lefttoright eq proof)) + 1);
	  hyps, sccut (eq, addhyp hyps (lefttoright eq proof), prf))
	(e1 :: eqs, prf) eqs proofs in
    righttoleft e2 proof
  | Rnotequal (Eapp (_, ts, _) as e1,
	       (Eapp (_, us, _) as e2)), proofs ->
    let prf = sceqfunc (e1, e2, gamma) in
    let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in
    let _, proof =
      List.fold_left2
	(fun (l, prf) eq proof ->
	  assert (List.mem eq l);
	  let hyps = rm eq l in
	  assert (gamma_length prf =
	     gamma_length (addhyp hyps (lefttoright eq proof)) + 1);
	  hyps, sccut (eq, addhyp hyps (lefttoright eq proof), prf))
	(eqs, prf) eqs proofs in
    righttoleft (eapp ("=", [e1; e2])) proof
  | RcongruenceLR (p, a, b), [proof] ->
    let g, c, rule = proof in
    begin match p with
    | Elam (x, ty, e, _) ->
      let prf1 =
	addhyp (rm (apply p b) g) (rmcongruence true x e a b) in
      let prf2 = addhyp [apply p a; eapp ("=", [a; b])] proof in
      assert (gamma_length prf2 =
	  gamma_length prf1 + 1);
      sccut (
	apply p b,
	addhyp (rm (apply p b) g) (rmcongruence true x e a b),
	addhyp [apply p a; eapp ("=", [a; b])] proof)
    | _ -> assert false end
  | RcongruenceLR (p, a, b), _ -> assert false
  | RcongruenceRL (p, a, b), [proof] ->
    let g, c, rule = proof in
    begin match p with
    | Elam (x, ty, e, _) ->
      let prf1 =
	addhyp (rm (apply p b) g) (rmcongruence false x e a b) in
      let prf2 = addhyp [apply p a; eapp ("=", [a; b])] proof in
      assert (gamma_length prf2 =
	  gamma_length prf1 + 1);
      sccut (
	apply p b,
	addhyp (rm (apply p b) g) (rmcongruence false x e a b),
	addhyp [apply p a; eapp ("=", [a; b])] proof)
    | _ -> assert false end
  | Rdefinition (name, sym, args, body, recarg, fld, unf), [proof]
    -> assert false
  | Rextension (
    "", "zenon_notallex", [Elam (v, t, p, _)],
    [Enot (Eall (x, s, e, _) as ap, _)], [[ep]]), [proof] ->
    let g, c, rule = proof in
    begin match rule with
    | SClex (exp, y, prf)
	when (equal exp ep) ->
      let q = substitute [(v, y)] p in
      assert (ingamma (enot q) prf);
      righttoleft ap
	(scrall (
	  ap, y, lefttoright q prf))
    | _ ->
      let z = new_var () in
      let q = substitute [(v, z)] p in
      righttoleft ap
	(scrall (
	  ap, z, lefttoright q (
	    sccut (
	      ep,
	      screx (
		ep, z, scaxiom (
		  enot q, gamma)), addhyp [enot q]  proof)))) end
  | Rextension ("", "zenon_stringequal", [s1; s2], [c], []), [] ->
    let v1 = eapp ("$string", [s1]) in
    let v2 = eapp ("$string", [s2]) in
    let n1 = List.assoc v1 distincts in
    let n2 = List.assoc v2 distincts in
    let c = eapp ("=", [v1; v2]) in
    if n1 < n2
    then righttoleft c (scaxiom (c, rm (enot c) gamma))
    else righttoleft c (sceqsym (v1, v2, rm (enot c) gamma))
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
     let prooof =
       scext(ext, name, args, cons, hyps, proofs) in Lkproof.p_debug_proof "applying extension\n" prooof;
     List.iter (Lkproof.p_debug_proof "hypo") proofs;
     prooof

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
  let contrshyps =
    List.map2 (lltolkrule distincts) proof.hyps
      (List.map (List.rev_append list) hypslist) in
  let contrs, prehyps = List.split contrshyps in
  let maincontr, remainders = union contrs in
  let hyps = List.map2 addhyp remainders prehyps in
  let preproof = xlltolkrule distincts proof.rule hyps (maincontr@list) in
  (* Now try to contract requested contrs *)
  let (newlist, newproof) =
  List.fold_left
    (fun (cs, prf) c ->
      if List.mem c conclist
      then cs, sclcontr (c, prf)
      else c :: cs, prf)
    (newcontr, preproof) maincontr in
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

let rec lltolk env proof goal righthandside =
  let lkproof2 = match righthandside with
  | true ->
    let l, lkproof = lltolkrule env.distincts proof (enot goal :: env.hypotheses) in
    check_empty_remaining_proofs l; (* maincontr subset conclist subset gamma *)
    lefttoright goal lkproof
  | false ->
    let l, lkproof = lltolkrule env.distincts proof env.hypotheses in
    check_empty_remaining_proofs l; lkproof in
  let _, lkproof3 = 
    List.fold_left
      (fun (conc, rule) stmt ->
	eimply (stmt, conc),
	scrimply (stmt, conc, rule))  
      (goal, lkproof2) env.hypotheses in
  lkproof3
