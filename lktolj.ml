open Printf
open Expr
open Llproof
open Namespace
open Lkproof

let rec unify e1 e2 =
  match e1, e2 with
  | Enot (Enot (f1, _), _), Enot (Enot (f2, _), _) ->
    enot (enot (unify f1 f2))
  | Enot (Enot (f1, _), _), _ -> enot (enot (unify f1 e2))
  | _, Enot (Enot (f2, _), _) -> enot (enot (unify e1 f2))
  | Etrue, Etrue -> etrue
  | Efalse, Efalse -> efalse
  | Evar (x, _), Evar (y, _) when (x = y) -> evar (x)
  | Eapp (x, args1, _), Eapp (y, args2, _)
    when (x = y && List.for_all2 equal args1 args2) ->
    eapp (x, args1)
  | Eand (f1, f2, _), Eand (f3, f4, _) ->
    eand (unify f1 f3, unify f2 f4)
  | Eor (f1, f2, _), Eor (f3, f4, _) ->
    eor (unify f1 f3, unify f2 f4)
  | Eimply (f1, f2, _), Eimply (f3, f4, _) ->
    eimply (unify f1 f3, unify f2 f4)
  | Enot (f1, _), Enot (f2, _) -> enot (unify f1 f2)
  | Eall (x, ty1, f1, _), Eall (y, _, f2, _) ->
    eall (x, ty1, unify f1 (substitute [(y, x)] f2))
  | Eex (x, ty1, f1, _), Eex (y, _, f2, _) ->
    eex (x, ty1, unify f1 (substitute [(y, x)] f2))
  | _, _ -> p_debug "fail unify" [e1; e2]; assert false

let rec merge assocs =
  match assocs with
  | l1 :: l2 :: assocs ->
    let _,l = List.fold_left
      (fun (q, r) (a, b) ->
	List.remove_assoc a q, (a, unify b (List.assoc a q)) :: r)
      (l1, []) l2 in
    merge (l :: assocs)
  | [l] -> l;
  | _ -> assert false

let replace l1 l2 =
  let _, l = List.fold_left
    (fun (q, r) (a, b) ->
      List.remove_assoc a q, (b, List.assoc a q) :: r)
    (l1, []) l2 in l

let newcut l aplus proof1 proof2 =
  let (g1, c1, rule1) = proof1 in
  let (g2, c2, rule2) = proof2 in
  if equal aplus c1
  then
    l, sccut (aplus, proof1, proof2)
  else
    match c1 with
    | Enot (Enot (c, _), _) when equal c aplus ->
      if equal c2 efalse
      then
	l, sccut (
	  c1, proof1,
	  sclnot (enot c, scrnot (c, proof2)))
      else
	l, sccut (
	  c1, proof1,
	  scrnot (
	    enot c2, sclnot (
	      enot c, scrnot (
		c, sclnot (c2, proof2)))))
    | _ ->
      p_debug "\nfail cut" [c1; aplus];
      assert false              (* /!\ Raised by SYN919+1.p *)

let rec adaptaxiom g e1 e2 =
  match e1, e2 with
  | Etrue, Etrue | Efalse, Efalse
  | Evar _, Evar _ | Eapp _, Eapp _
    -> scaxiom (e1, g)
  | Enot (f1, _), Enot (f2, _) ->
    scrnot (
      f2, sclnot (
	f1, adaptaxiom g f2 f1))
  | Eand (f1, f2, _), Eand (f3, f4, _) ->
    scland (f1, f2, scrand (
      f3, f4,
      adaptaxiom (f2 :: g) f1 f3,
      adaptaxiom (f1 :: g) f2 f4))
  | Eor (f1, f2, _), Eor (f3, f4, _) ->
    sclor (
      f1, f2,
      scrorl (f3, f4, adaptaxiom g f1 f3),
      scrorr (f3, f4, adaptaxiom g f2 f4))
  | Eimply (f1, f2, _), Eimply (f3, f4, _) ->
   scrimply (f3, f4, sclimply (
     f1, f2,
     adaptaxiom g f3 f1,
     adaptaxiom (f3 :: g) f2 f4))
  | Eall (x, ty, f1, _), Eall (y, _, f2, _) ->
    let z = new_var () in
    scrall (
      e2, z, sclall (
	e1, z, adaptaxiom g
	  (substitute [(x, z)] f1)
	  (substitute [(y, z)] f2)))
  | Eex (x, ty, f1, _), Eex (y, _, f2, _) ->
    let z = new_var () in
    sclex (
      e1, z, screx (
	e2, z, adaptaxiom g
	  (substitute [(x, z)] f1)
	  (substitute [(y, z)] f2)))
  | _, Enot (Enot (f2, _), _) ->
    scrnot (
      enot (f2), sclnot (
	f2, adaptaxiom g e1 f2))
  | _, _ -> assert false

let rec ladapt proof (u, v) =
  if equal u v then proof else
    let g, c, rule = proof in
    let result = match rule, v with
    | SClor (a, b, proof1, proof2), Eor (sa, sb, _)
      when (equal u (eor (a, b))) ->
      sclor (sa, sb, ladapt proof1 (a, sa), ladapt proof2 (b, sb))
    | SClimply (a, b, proof1, proof2), Eimply (sa, sb, _)
      when (equal u (eimply (a, b))) ->
      sclimply (
	sa, sb, radapt proof1 (a, sa), ladapt proof2 (b, sb))
    | SClcontr (a, proof), _
      when (equal a u) ->
      sclcontr (v, ladapt (ladapt proof (a, v)) (a, v))
    | SCland (a, b, proof), Eand (sa, sb, _)
      when (equal u (eand (a, b))) ->
      scland (sa, sb, ladapt (ladapt proof (a, sa)) (b, sb))
    | SClnot (a, proof), Enot (sa, _)
      when (equal u (enot a)) ->
      sclnot (sa, radapt proof (a, sa))
    | SClall (Eall (var, ty, e, _) as ap, t, proof),
	Eall (svar, _, se, _)
	  when (equal u ap) ->
      let z = substitute [(var, t)] e in
      let sz = substitute [(svar, t)] se in
      sclall (eall (svar, ty, se), t, ladapt proof (z, sz))
    | SClex (Eex (var, ty, e, _) as ep, v, proof),
      Eex (svar, _, se, _)
	when (equal u ep) ->
      let z = substitute [(var, v)] e in
      let sz = substitute [(svar, v)] se in
      sclex (eex (svar, ty, se), v, ladapt proof (z, sz))
    | SCaxiom (a), _ when equal u a -> adaptaxiom (rm u g) v u
    | SCext _, _
    | SClnot _, _ | SClimply _, _ | SClor _, _ | SCland _, _
    | SClcontr _, _ | SCcut _, _ | SClex _, _ | SClall _, _
    | SCrweak _, _ | SCrnot _, _ | SCrand _, _ | SCrimply _, _
    | SCrorl _, _ | SCrorr _, _ | SCrall _, _ | SCrex _, _
      -> applytohyps (fun proof -> ladapt proof (u, v)) proof
    | SCeqfunc _, _ | SCeqprop _, _
    | SCaxiom _, _ | SCfalse, _
    | SCtrue, _ | SCeqref _, _
    | SCeqsym _, _ -> v :: (rm u g), c, rule
    | SCcnot _, _ -> assert false in
    let resultg, _, _ = result in
    assert (List.length resultg = List.length g);
    result

and radapt proof (a, b) =
  let rec xadapt proof (u, v) =
    let g, c, rule = proof in
    match rule, v with
    | SCcut (a, proof1, proof2), _ ->
      sccut (a, proof1, radapt proof2 (u, v))
    | SClimply (a, b, proof1, proof2), _ ->
      sclimply (a, b, proof1, radapt proof2 (u, v))
    | SCrand (a, b, proof1, proof2), Eand (xa, xb, _) ->
      scrand (xa, xb, radapt proof1 (a, xa), radapt proof2 (b, xb))
    | SCrweak (a, proof), _ -> scrweak (v, proof)
    | SClnot (a, proof), _ -> sclnot (a, proof)
    | SCrorl (a, b, proof), Eor (xa, xb, _) ->
      scrorl (xa, xb, radapt proof (a, xa))
    | SCrorr (a, b, proof), Eor (xa, xb, _) ->
      scrorr (xa, xb, radapt proof (b, xb))
    | SCrimply (a, b, proof), Eimply (xa, xb, _) ->
      scrimply (xa, xb, radapt (ladapt proof (a, xa)) (b, xb))
    | SCrnot (a, proof), Enot (xa, _) ->
      scrnot (xa, ladapt proof (a, xa))
    | SCrall (Eall (var, ty, e, _), v, proof),
      Eall (xvar, _, xe, _) ->
      let z = substitute [(var, v)] e in
      let xz = substitute [(xvar, v)] xe in
      scrall (eall (xvar, ty, xe), v, radapt proof (z, xz))
    | SCrex (Eex (var, ty, e, _), t, proof),
      Eex (xvar, _, xe, _) ->
      let z = substitute [(var, t)] e in
      let xz = substitute [(xvar, t)] xe in
      screx (eex (xvar, ty, xe), t, radapt proof (z, xz))
    | SCtrue, _ | SCeqref _, _ | SCeqsym _, _
    | SCeqfunc _, _ | SCeqprop _, _  -> proof
    | SCaxiom _, _ -> adaptaxiom (rm u g) u v
    | SCfalse, _ -> g, v, rule
    | SClcontr _, _ | SClor _, _ | SCland _, _
    | SClall _, _ | SClex _, _
      -> applytohyps (fun proof -> radapt proof (u, v)) proof
    | SCcnot _, _ -> assert false
    | _, _ -> assert false in    (* /!\ raised by CSR057+1.p *)
  let rec headnots e1 e2 =
    match e1, e2 with
    | Enot (Enot (f1, _), _), Enot (Enot (f2, _), _) ->
      headnots f1 f2
    | _, Enot (Enot (f2, _), _) -> true
    | _, _ -> false in
  if equal a b
  then proof
  else
    if headnots a b
    then
      match b with
      | Enot (Enot (e, _), _) ->
	scrnot (enot (e), sclnot (e, radapt proof (a, e)))
      | _ -> assert false;
    else
      xadapt proof (a, b)

let rec weaken ex et =
  match ex, et with
  | Enot (Enot (fx, _), _), Enot (Enot (ft, _), _) ->
    enot (enot (weaken fx ft))
  | _, Enot (Enot (ft, _), _) -> enot (enot (weaken ex ft))
  | Etrue, _ | Efalse, _
  | Evar _, _ | Eapp _, _-> ex
  | Eand (fx1, fx2, _), Eand (ft1, ft2, _) ->
    eand (weaken fx1 ft1, weaken fx2 ft2)
  | Eor (fx1, fx2, _), Eor (ft1, ft2, _) ->
    eor (weaken fx1 ft1, weaken fx2 ft2)
  | Eimply (fx1, fx2, _), Eimply (ft1, ft2, _) ->
    eimply (weaken fx1 ft1, weaken fx2 ft2)
  | Enot (fx, _), Enot (ft, _) -> enot (weaken fx ft)
  | Eall (x, tyx, fx, _), Eall (y, _, ft, _) ->
    eall (x, tyx, weaken fx (substitute [(y, x)] ft))
  | Eex (x, tyx, fx, _), Eex (y, _, ft, _) ->
    eex (x, tyx, weaken fx (substitute [(y, x)] ft))
  | _, _ -> assert false

let rec lltoljrule lkproof =
  let lkg, lkc, rule = lkproof in
  let assocs, proofs =
    List.split (List.map lltoljrule (hypsofrule rule)) in
  let ljlist, ljprf =
  match rule, assocs, proofs with
    | SCcut (a, lklkprf1, lklkprf2), [l1; l2],
      [(g1, c1, _) as proof1; (g2, c2, _) as proof2] ->
      let l = merge [l1; List.remove_assoc a l2] in
      let q1 = replace l l1 in
      let q2 = replace l (List.remove_assoc a l2) in
      newcut l (List.assoc a l2)
	(List.fold_left ladapt proof1 q1)
	(List.fold_left ladapt proof2 q2)
    | SClor (a, b, _, _), [l1; l2],
      [(g1, c1, _) as proof1; (g2, c2, _) as proof2] ->
      let l =
	merge [List.remove_assoc a l1; List.remove_assoc b l2] in
      let q1 = replace l (List.remove_assoc a l1) in
      let q2 = replace l (List.remove_assoc b l2) in
      let c3 = unify c1 c2 in
      (eor (a, b), eor (List.assoc a l1, List.assoc b l2)) :: l,
      sclor (
	List.assoc a l1, List.assoc b l2,
	radapt (List.fold_left ladapt proof1 q1) (c1, c3),
	radapt (List.fold_left ladapt proof2 q2) (c2, c3))
    | SClimply (a, b, _, _), [l1; l2],
      [(g1, c1, _) as proof1; (g2, c2, _) as proof2] ->
      let l = merge [l1; List.remove_assoc b l2] in
      let b2 = List.assoc b l2 in
      let q1 = replace l l1 in
      let q2 = replace l (List.remove_assoc b l2) in
      (eimply (a, b), eimply (c1, List.assoc b l2)) :: l,
      sclimply (
	c1, b2,
	List.fold_left ladapt proof1 q1,
	List.fold_left ladapt proof2 q2)
    | SCrand (a, b, _, _), [l1; l2],
      [(g1, c1, _) as proof1; (g2, c2, _) as proof2] ->
      let l = merge [l1; l2] in
      let q1 = replace l l1 in
      let q2 = replace l l2 in
      l, scrand (
	c1, c2,
	List.fold_left ladapt proof1 q1,
	List.fold_left ladapt proof2 q2)
    | SClcontr (a, _), [l], [(g, c, _) as proof] ->
      let a1 = List.assoc a l in
      let a2 = List.assoc a (List.remove_assoc a l) in
      let a3 = unify
	(List.assoc a l)
	(List.assoc a (List.remove_assoc a l)) in
      (a, a3)
      :: List.remove_assoc a (List.remove_assoc a l),
      sclcontr (a3, ladapt (ladapt proof (a1, a3)) (a2, a3))
    | SCaxiom _, _, _ | SCfalse, _, _
    | SCtrue, _, _ | SCeqref _, _, _ | SCeqsym _, _, _
    | SCeqfunc _, _, _
      -> List.map (fun x -> (x, x)) lkg, lkproof
    | SCeqprop _, _ , _
      ->
	List.map (fun x -> (x, x)) lkg, lkproof
    | SCrweak (a, _), [l], [(g, c, _) as proof] ->
      l, scrweak (a, proof)
    | SCland (a, b, _), [l], [(g, c, _) as proof] ->
      (eand (a, b), eand (List.assoc a l,List.assoc b l))
      :: (List.remove_assoc a (List.remove_assoc b l)),
      scland (List.assoc a l, List.assoc b l, proof)
    | SClnot (e, _), [l], [(g, c, _) as proof] ->
      (enot e, enot c) :: l, sclnot (c, proof)
    | SCrorl (a, b, _), [l], [(g, c, _) as proof] ->
      l, scrorl (c, b, proof)
    | SCrorr (a, b, _), [l], [(g, c, _) as proof] ->
      l, scrorr (a, c, proof)
    | SCrimply (a, b, _), [l], [(g, c, _) as proof] ->
      List.remove_assoc a l, scrimply (List.assoc a l, c, proof)
    | SCrnot (a, _), [l], [(g, c, _) as proof] ->
      List.remove_assoc a l,
      scrnot (List.assoc a l, proof)
    | SClall (Eall (x, ty, e, _) as ap, t, _),
      [l], [(g, c, _) as proof] ->
      let h = eall (
	x, ty,
	weaken e (List.assoc (substitute [(x, t)] e) l)) in
      (ap, h) :: (List.remove_assoc (substitute [(x, t)] e) l),
      sclall (h, t, proof)
    | SClex (Eex (x, ty, e, _) as ep, v, _),
      [l], [(g, c, _) as proof] ->
      let h = eex (
	x, ty,
	weaken e (List.assoc (substitute [(x, v)] e) l)) in
      (ep, h) :: (List.remove_assoc (substitute [(x, v)] e) l),
      sclex (h, v, proof)
    | SCrall (Eall (x, ty, e, _), v, _), [l],
      [(g, c, _) as proof] ->
      l, scrall (eall (x, ty, weaken e c), v, proof)
    | SCrex (Eex (x, ty, e, _), t, _), [l], [(g, c, _) as proof] ->
      l, screx (eex (x, ty, weaken e c), t, proof)
    | SCcnot (e, _), [l], [(g, c, _) as proof] ->
      List.remove_assoc (enot e) l,
      scrnot (List.assoc (enot e) l, proof)
    | SCext (extension_name, args, conc, hyps, proofs), assocs, assocs_proofs ->
       assert false
    | _, _, _ -> assert false in
  let ljg, _, _ = ljprf in
  assert (List.length lkg = List.length ljg);
  assert (List.length ljlist = List.length ljg);
  ljlist, ljprf

let lktolj lkproof =
  let _, ljproof = lltoljrule lkproof in
  ljproof
