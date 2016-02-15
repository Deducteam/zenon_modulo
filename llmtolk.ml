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

let rec ctrexpr_phi e =
  match e with
  | Evar _
  | Eapp _ -> enot (enot e) (* e MUST BE ALWAYS A PROPOSITION *)
  | Etrue
  | Efalse -> e
  | Enot (e, _) ->
     enot (ctrexpr_chi e)
  | Eand (e1, e2, _) ->
     eand (ctrexpr_phi e1, ctrexpr_phi e2)
  | Eor (e1, e2, _) ->
     enot (enot (eor (ctrexpr_psi e1, ctrexpr_psi e2)))
  | Eimply (e1, e2, _) ->
     eimply (ctrexpr_chi e1, ctrexpr_phi e2)
  | Eall (e1, s, e2, _) ->
     eall (e1, s, ctrexpr_phi e2)
  | Eex (e1, s, e2, _) ->
     enot (enot (eex (e1, s, ctrexpr_psi e2)))
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false

and ctrexpr_psi e =
  match e with
  | Evar _
  | Eapp _ -> e (* e MUST BE ALWAYS A PROPOSITION *)
  | Etrue
  | Efalse -> e
  | Enot (e, _) ->
     enot (ctrexpr_chi e)
  | Eand (e1, e2, _) ->
     eand (ctrexpr_psi e1, ctrexpr_psi e2)
  | Eor (e1, e2, _) ->
     eor (ctrexpr_psi e1, ctrexpr_psi e2)
  | Eimply (e1, e2, _) ->
     eimply (ctrexpr_chi e1, ctrexpr_psi e2)
  | Eall (e1, s, e2, _) ->
     eall (e1, s, ctrexpr_phi e2)
  | Eex (e1, s, e2, _) ->
     eex (e1, s, ctrexpr_psi e2)
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false
						   
and ctrexpr_chi e =
  match e with
  | Evar _
  | Eapp _ -> e (* e MUST BE ALWAYS A PROPOSITION *)
  | Etrue
  | Efalse -> e
  | Enot (e, _) ->
     enot (ctrexpr_psi e)
  | Eand (e1, e2, _) ->
     eand (ctrexpr_chi e1, ctrexpr_chi e2)
  | Eor (e1, e2, _) ->
     eor (ctrexpr_chi e1, ctrexpr_chi e2)
  | Eimply (e1, e2, _) ->
     eimply (ctrexpr_psi e1, ctrexpr_chi e2)
  | Eall (e1, s, e2, _) ->
     eall (e1, s, ctrexpr_chi e2)
  | Eex (e1, s, e2, _) ->
     eex (e1, s, ctrexpr_chi e2)
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false


let new_tau =
  let r = ref 0 in
  fun () ->
    let n = !r in
    incr r;
    evar (sprintf "tau%d" n)	 
						   
(* not not p |-  ---->  |- not p *)
let kleene_left_not p proof =
  let g, c, rule = proof in
  assert (equal c efalse);
  assert (List.mem (enot (enot p)) g);
  let gamma = rm (enot (enot p)) g in
  match rule with
  | SClnot (p', prf) when (equal p' (enot p)) ->
     prf
  | _ ->
     scrnot (p,
	     sccut (enot (enot p),
		    scrnot (enot p,
			    sclnot (p,
				    scaxiom (p, gamma))),
		    sclweak (p, proof)))

(* not false |-  ---->  |- false *)
let kleene_left_false proof =
  let g, c, rule = proof in
  assert (equal c efalse);
  assert (List.mem (enot efalse) g);
  let gamma = rm (enot efalse) g in
  match rule with
  | SClnot (p', prf) when (equal p' efalse) ->
     prf
  | _ ->
     sccut (enot efalse,
	    scrnot (efalse, scfalse (gamma, efalse)),
	    proof)

(* not true |-  ---->  |- true *)
let kleene_left_true proof =
  let g, c, rule = proof in
  assert (equal c efalse);
  assert (List.mem (enot etrue) g);
  let gamma = rm (enot etrue) g in
  match rule with
  | SClnot (p', prf) when (equal p' etrue) ->
     prf
  | _ ->
     sccut (enot (enot etrue),
	    scrnot (enot etrue, proof),
	    sclweak (enot (enot etrue), sctrue (gamma)))

(* (\* not (p and q) |-  ---->  not p |- *\) *)
(* let kleene_left_and_l p q proof = *)
(*   let g, c, rule = proof in *)
(*   assert (equal c efalse); *)
(*   assert (List.mem (enot (eand (p, q))) g); *)
(*   let gamma = rm (enot (eand (p, q))) g in *)
(*   sccut (enot (eand (p, q)), *)
(* 	 (scrnot (eand (p, q), *)
(* 		  sclnot (p, *)
(* 			  scland (p, q, *)
(* 				  (scaxiom (p, q :: gamma)))))), *)
(* 	 sclweak (enot p, proof)) *)

(* (\* not (p and q) |-  ---->  not q |- *\) *)
(* let kleene_left_and_r p q proof = *)
(*   let g, c, rule = proof in *)
(*   assert (equal c efalse); *)
(*   assert (List.mem (enot (eand (p, q))) g); *)
(*   let gamma = rm (enot (eand (p, q))) g in *)
(*   sccut (enot (eand (p, q)), *)
(* 	 (scrnot (eand (p, q), *)
(* 		  sclnot (q, *)
(* 			  scland (p, q, *)
(* 				  (scaxiom (q, p :: gamma)))))), *)
(* 	 sclweak (enot q, proof)) *)

	
(* not (p imply q) |-  ---->  p, not q |- *)
let kleene_left_imply p q proof =
  let g, c, rule = proof in
  assert (equal c efalse);
  assert (List.mem (enot (eimply (p, q))) g);
  let gamma = rm (enot (eimply (p, q))) g in
  match rule with
  (* | SClnot (e, prf) when (equal e (eimply (p, q))) -> *)
  (*    assert false *)
  | _ ->
     sccut (enot (eimply (p, q)),
	    scrnot (eimply (p, q),
		    sclnot (q,
			    sclimply (p, q,
				      scaxiom (p, gamma),
				      scaxiom (q, p :: gamma)))),
	    sclweak (p, (sclweak (enot q, proof))))

(* not (forall x p(x)) |-  ---->  not p(z) |- *)
let kleene_left_forall ap proof =
  let x, p =
    match ap with
    | Eall (x, _, p, _) -> (x, p)
    | _ -> assert false in
  let g, c, rule = proof in
  assert (equal c efalse);
  assert (List.mem (enot ap) g);
  let gamma = rm (enot ap) g in
  match rule with
  | SClnot (e, (_, _, rule')) when (equal e ap) ->
     begin
       match rule' with
       | SCrall (e, v, prf) when (equal e ap) ->
	  Some (sclnot (substitute [(x, v)] p, prf), v)
       | _ ->
	  None
     end
  | _ -> None

let rec not_phi_to_phi e proof =
  let g, c, rule = proof in
  let gamma = rm (enot (ctrexpr_phi e)) g in
  match e with
  | Evar _
  | Eapp _ ->
     kleene_left_not (enot e) proof
  | Efalse ->
     kleene_left_false proof
  | Etrue ->
     kleene_left_true proof
  | Enot (e, _) ->
     kleene_left_not (ctrexpr_chi e) proof
  | Eand (e1, e2, _) ->
     let ce1 = ctrexpr_phi e1 in
     let ce2 = ctrexpr_phi e2 in
     let ce = eand (ce1, ce2) in
     (* scrand (ce1, ce2, *)
     (*         not_psi_to_phi e1 (kleene_left_and_l ce1 ce2 proof), *)
     (*         not_psi_to_phi e2 (kleene_left_and_r ce1 ce2 proof)) *)
     sccut (enot (enot ce),
	    scrnot (enot ce,
		    proof),
	    scrand (ce1, ce2,
		    not_phi_to_phi
		      e1
		      (sclnot (enot ce,
			       scrnot (ce,
				       scland (ce1, ce2,
					       sclnot (ce1,
						       scaxiom (ce1, ce2 :: gamma)))))),
		    not_phi_to_phi
		      e2
		      (sclnot (enot ce,
			       scrnot (ce,
				       scland (ce1, ce2,
					       sclnot (ce2,
						       scaxiom (ce2, ce1 :: gamma))))))))
  | Eor (e1, e2, _) ->
     kleene_left_not (enot (ctrexpr_psi e)) proof
  | Eimply (e1, e2, _) ->
     let ce1 = ctrexpr_chi e1 in
     let ce2 = ctrexpr_phi e2 in
     let ce = ctrexpr_phi e in
     scrimply (ce1, ce2,
	       not_phi_to_phi e2 (kleene_left_imply ce1 ce2 proof))
  | Eall (e1, s, e2, _) ->
     let ce = (ctrexpr_phi e) in
     begin
       match kleene_left_forall ce proof with
       | Some (prf, var) ->
	  scrall (ctrexpr_phi e, var,
		  not_phi_to_phi
		    (substitute [(e1, var)] e2)
		    prf)
       | None -> 
	  let z = new_tau () in
	  let ez = substitute [(e1, z)] e2 in
	  let cez = (ctrexpr_phi ez) in
	  scrall (ctrexpr_phi e, z,
		  not_phi_to_phi
		    ez
		    (sccut (enot ce,
			    scrnot (ce,
				    sclnot (cez,
					    sclall (ce, z, scaxiom (cez, gamma)))),
			    sclweak (enot cez, proof))))
     end
  | Eex (e1, s, e2, _) ->
     kleene_left_not (enot (ctrexpr_psi e)) proof
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false

let rec not_psi_to_phi e proof =
  let g, c, rule = proof in
  let gamma = rm (enot (ctrexpr_psi e)) g in
  match e with
  | Evar _
  | Eapp _ ->
     scrnot (enot e, proof)
  | Efalse ->
     kleene_left_false proof
  | Etrue ->
     kleene_left_true proof
  | Enot (e, _) ->
     kleene_left_not (ctrexpr_chi e) proof
  | Eand (e1, e2, _) ->
     let ce1 = ctrexpr_psi e1 in
     let ce2 = ctrexpr_psi e2 in
     let ce = eand (ce1, ce2) in
     (* scrand (ctrexpr_phi e1, ctrexpr_phi e2, *)
     (*         not_psi_to_phi e1 (kleene_left_and_l ce1 ce2 proof), *)
     (*         not_psi_to_phi e2 (kleene_left_and_r ce1 ce2 proof)) *)
     sccut (enot (enot ce),
	    scrnot (enot ce,
		    proof),
	    scrand (ctrexpr_phi e1, ctrexpr_phi e2,
		    not_psi_to_phi
		      e1
		      (sclnot (enot ce,
			       scrnot (ce,
				       scland (ce1, ce2,
					       sclnot (ce1,
						       scaxiom (ce1, ce2 :: gamma)))))),
		    not_psi_to_phi
		      e2
		      (sclnot (enot ce,
			       scrnot (ce,
				       scland (ce1, ce2,
					       sclnot (ce2,
						       scaxiom (ce2, ce1 :: gamma))))))))
  | Eor (e1, e2, _) ->
     scrnot (enot (ctrexpr_psi e), proof)     
  | Eimply (e1, e2, _) ->
     let ce = ctrexpr_psi e in
     scrimply (ctrexpr_chi e1, ctrexpr_phi e2,
	       not_psi_to_phi e2 (kleene_left_imply (ctrexpr_chi e1) (ctrexpr_psi e2) proof))
  | Eall (e1, s, e2, _) ->
     let ce = (ctrexpr_phi e) in
     begin
       match kleene_left_forall ce proof with
       | Some (prf, var) -> 
	  scrall (ctrexpr_phi e, var,
		  not_phi_to_phi
		    (substitute [(e1, var)] e2)
		    prf)
       | None -> 
	  let z = new_tau () in
	  let ez = substitute [(e1, z)] e2 in
	  let cez = (ctrexpr_phi ez) in
	  scrall (ctrexpr_phi e, z,
		  not_phi_to_phi
		    ez
		    (sccut (enot ce,
			    scrnot (ce,
				    sclnot (cez,
					    sclall (ce, z, scaxiom (cez, gamma)))),
			    sclweak (enot cez, proof))))
     end
  | Eex (e1, s, e2, _) ->
     scrnot (enot (ctrexpr_psi e), proof)
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false
						   
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
      enot eq,
      List.fold_left (fun prf e -> sclweak (e, prf))
		     (scrnot (eq, sclnot (ax, f b1 b2 b3)))
		     (rm (enot ax) gamma),
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
	  sclnot (p, scaxiom (p, gamma))
       | _ -> assert false
     end
  | Rcut (p), [proof1; proof2] ->
     assert false
  | Rnoteq (a), [] ->
     sclnot (eapp ("=", [a; a]), sceqref (a, gamma));
  | Reqsym (a, b), [] ->
     sclnot (eapp ("=", [b; a]), sceqsym (a, b, gamma))
  | Rnotnot (p), [proof] ->
     let cp = ctrexpr_chi p in
     sclnot (enot (cp), scrnot (cp, proof))
  | Rconnect (And, p, q), [proof] ->
     let cp, cq = ctrexpr_chi p, ctrexpr_chi q in
     scland (cp, cq, proof)
  | Rconnect (Or, p, q), [proof1; proof2] ->
     let cp, cq = ctrexpr_chi p, ctrexpr_chi q in
     sclor (cp, cq, proof1, proof2)
  | Rconnect (Imply, p, q), [proof1; proof2] ->
     let cp, cq = ctrexpr_psi p, ctrexpr_chi q in
     sccut (enot cp,
            scrnot (cp,
                    sclimply (cp, cq,
                              scaxiom (cp, gamma),
                              sclweak (cp, proof2))),
            sclweak (eimply (cp, cq), proof1))
  | Rconnect (Equiv, p, q), [proof1; proof2] ->
     assert false
  | Rnotconnect (And, p, q), [proof1; proof2] ->
     let cp, cq = ctrexpr_psi p, ctrexpr_psi q in
     sccut (enot cp,
	    scrnot (cp,
		    sccut (enot cq,
			   scrnot (cq,
				   sclnot (eand (cp, cq),
					   scrand (cp, cq,
						   scaxiom (cp, cq :: gamma),
						   scaxiom (cq, cp :: gamma)))),
			   sclweak (cp, sclweak (enot (eand (cp, cq)), proof2)))),
	    sclweak (enot (eand (cp, cq)), proof1))
  | Rnotconnect (Or, p, q), [proof] ->
     let cp, cq = ctrexpr_psi p, ctrexpr_psi q in
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
		   sclweak (enot (eor (cp, cq)), proof)))
  | Rnotconnect (Imply, p, q), [proof] ->
     let cp, cq = ctrexpr_chi p, ctrexpr_psi q in
     sccut (enot cq,
	    scrnot (cq,
		    sclnot (eimply (cp, cq),
			   scrimply (cp, cq, scaxiom (cq, cp :: gamma)))),
	    sclnot (eimply (cp, cq),
		   scrimply (cp, cq, scrweak (cq, proof))))
  | Rnotconnect (Equiv, p, q), [proof1; proof2] ->
     assert false
  | Rex (Eex(x, ty, p, _) as ep, v), [proof] ->
     let cp = ctrexpr_chi p in
     sclex (eex (x, ty, cp), v, proof)
  | Rall (Eall(x, _, p, _) as ap, t), [proof] ->
     let cap = ctrexpr_chi ap in
     let cpt = substitute [(x, t)] (ctrexpr_chi p) in
     sclall (cap, t, proof)	     
  | Rnotex (Eex(x, ty, p, _) as ep, t), [proof] ->
     let cp = ctrexpr_psi p in
     let cpt = substitute [(x, t)] (ctrexpr_psi p) in
     sccut (enot cpt,
	    scrnot (cpt,
		    sclnot (eex (x, ty, cp),
			    screx (eex (x, ty, cp), t,
				   scaxiom (cpt, gamma)))),
	    sclweak (enot (eex (x, ty, cp)), proof))
  | Rnotall (Eall(x, _, p, _) as ap, v), [proof] ->
     let cap = ctrexpr_psi ap in
     let pv = substitute [(x, v)] p in
     sclnot (cap,
	     scrall (cap, v,
		     not_psi_to_phi pv proof))
  | Rpnotp (Eapp (_, ts, _) as e1,
  	    Enot (Eapp (_, us, _) as e2, _)), proofs ->
     let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in
     let prf = sclnot (e2, sceqprop (e1, e2, gamma)) in
     let _, proof =
       List.fold_left2
  	 (fun (l, prf) eq prfneq ->
  	  let hyps = rm eq l in
	  let wprf = List.fold_left (fun prf e -> sclweak (e, prf)) prfneq hyps in
  	  hyps, sccut (enot eq,
		       scrnot (eq, prf),
		       wprf))
  	 (e1 :: enot e2 :: eqs, prf) eqs proofs in
     proof
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
	  hyps, sccut (enot eq,
		       scrnot (eq, prf),
		       wprf))
  	 (enot feq :: eqs, prf) eqs proofs in
     proof
  | RcongruenceLR (Elam (x, _, e, _) as p, a, b), [proof] ->
     let cpa, cpb, ce = ctrexpr_chi (apply p a), ctrexpr_chi (apply p b), ctrexpr_chi e in
     sccut (cpb,
  	    List.fold_left (fun prf e -> sclweak (e, prf))
			   (rmcongruence true x ce a b) gamma,
  	    sclweak (cpa, sclweak (eapp ("=", [a; b]), proof)))
  | RcongruenceRL (Elam (x, _, e, _) as p, a, b), [proof] ->
     let cpa, cpb, ce = ctrexpr_chi (apply p a), ctrexpr_chi (apply p b), ctrexpr_chi e in     
     sccut (cpb,
  	    List.fold_left (fun prf e -> sclweak (e, prf))
			   (rmcongruence false x ce a b) gamma,
  	    sclweak (cpa, sclweak (eapp ("=", [b; a]), proof)))
  | Rextension (
  	"", "zenon_notallex", [Elam (x, t, p, _)], [ap], [[ep]]), [proof] ->
     assert false;
  | Rextension ("", "zenon_stringequal", [s1; s2], [c], []), [] ->
     let v1 = eapp ("$string", [s1]) in
     let v2 = eapp ("$string", [s2]) in
     let n1 = List.assoc v1 distincts in
     let n2 = List.assoc v2 distincts in
     let c12 = eapp ("=", [v1; v2]) in
     let c21 = eapp ("=", [v2; v1]) in
     if n1 < n2
     then
       sclnot (c12, scaxiom (c12, rm (enot c12) gamma))
     else
       sclnot (c21, sceqsym (v1, v2, rm (enot c21) gamma))
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
		(maincontr@(List.map ctrexpr_chi list))
		(* (maincontr@list) *)
  in
  (* Lkproof.p_debug_proof "coucou" preproof;   *)
  (* Now try to contract requested contrs *)
  let cconclist = List.map ctrexpr_chi conclist in
  let (newlist, newproof) =
  List.fold_left
    (fun (cs, prf) c ->
      if List.mem c cconclist
      then cs, sclcontr (c, prf)
      else c :: cs, prf)
    (List.map ctrexpr_chi newcontr, preproof) maincontr in
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
  let lkproof2 = not_psi_to_phi goal lkproof in
  let _, lkproof3 =
    List.fold_left
      (fun (conc, rule) stmt ->
       eimply (stmt, conc),
       scrimply (stmt, conc, rule))
      (ctrexpr_phi goal, lkproof2) (List.map ctrexpr_chi env.hypotheses)
  in lkproof3
