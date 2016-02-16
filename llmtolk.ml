open Llproof
open Lkproof
open Expr
open Printf

type env = {hypotheses : Expr.expr list; 
	    distincts : (Expr.expr * int) list;}

let gamma_length (g, c, rule) = List.length g

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
	     gamma_length (sclweak (hyps, proof)) + 1);
	  hyps, sccut (eq, sclweak (hyps, proof), prf))
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
	     gamma_length (sclweak (hyps, proof)) + 1);
	  hyps, sccut (eq, sclweak (hyps, proof), prf))
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
	sclweak ([substitute [(x, b)] e2], (rmcongruence s x e1 a b)),
	sclweak ([substitute [(x, b)] e1], (rmcongruence s x e2 a b))))
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
	sclweak ([substitute [(x, b)] e1], (rmcongruence s x e2 a b))))
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
     enot e
  | Eand (e1, e2, _) ->
     eand (ctrexpr_phi e1, ctrexpr_phi e2)
  | Eor (e1, e2, _) ->
     enot (enot (eor (e1, e2)))
  | Eimply (e1, e2, _) ->
     eimply (e1, ctrexpr_phi e2)
  | Eall (e1, s, e2, _) ->
     eall (e1, s, ctrexpr_phi e2)
  | Eex (e1, s, e2, _) ->
     enot (enot (eex (e1, s, e2)))
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false

let new_tau =
  let r = ref 0 in
  fun () ->
    let n = !r in
    incr r;
    evar (sprintf "tau%d" n)	 
						   
(* not not p |-  ---->  |- not p *)
let kleene_not_not p proof =
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
		    sclweak ([p], proof)))

(* not false |-  ---->  |- false *)
let kleene_not_false proof =
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
let kleene_not_true proof =
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
	    sclweak ([enot (enot etrue)], sctrue (gamma)))

(* not (p and q) |-  ---->  (not p |-, not q |-) *)
let kleene_not_and p q proof =
  let g, c, rule = proof in
  assert (equal c efalse);
  assert (List.mem (enot (eand (p, q))) g);
  let gamma = rm (enot (eand (p, q))) g in
  match rule with
  | SClnot (e, (_, _, rule')) when (equal e (eand (p, q))) ->
     begin
       match rule' with
       | SCrand (e1, e2, prf1, prf2) when (equal (eand (e1, e2)) (eand (p, q))) ->
	  Some (sclnot (e1, prf1), sclnot (e2, prf2))
       | _ ->
	  None
     end
  | _ ->
     None
	
(* not (p imply q) |-  ---->  p, not q |- *)
let kleene_not_imply p q proof =
  let g, c, rule = proof in
  assert (equal c efalse);
  assert (List.mem (enot (eimply (p, q))) g);
  let gamma = rm (enot (eimply (p, q))) g in
  match rule with
  | SClnot (e, (_, _, rule')) when (equal e (eimply (p, q))) ->
     begin
       match rule' with
       | SCrimply (e1, e2, prf) when (equal (eimply (e1, e2)) (eimply (p, q))) ->
          sclnot (e2, prf)
       | _ ->
	  sccut (enot (eimply (p, q)),
		 scrnot (eimply (p, q),
			 sclnot (q,
				 sclimply (p, q,
					   scaxiom (p, gamma),
					   scaxiom (q, p :: gamma)))),
		 sclweak ([p; enot q], proof))
     end
  | _ ->
     sccut (enot (eimply (p, q)),
	    scrnot (eimply (p, q),
		    sclnot (q,
			    sclimply (p, q,
				      scaxiom (p, gamma),
				      scaxiom (q, p :: gamma)))),
	    sclweak ([p; enot q], proof))

(* not (forall x p(x)) |-  ---->  not p(z) |- *)
let kleene_not_forall ap proof =
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

let rec not_to_phi e proof =
  let g, c, rule = proof in
  let gamma = rm (enot e) g in
  match e with
  | Evar _
  | Eapp _ ->
     scrnot (enot e, proof)
  | Efalse ->
     kleene_not_false proof
  | Etrue ->
     kleene_not_true proof
  | Enot (e, _) ->
     kleene_not_not e proof
  | Eand (e1, e2, _) ->
     begin match kleene_not_and e1 e2 proof with
	   | Some (prf1, prf2) ->
	      scrand (ctrexpr_phi e1, ctrexpr_phi e2,
	              not_to_phi e1 prf1,
	              not_to_phi e2 prf2)
	   | None ->
	      sccut (enot (enot e),
		     scrnot (enot e,
			     proof),
		     scrand (ctrexpr_phi e1, ctrexpr_phi e2,
			     not_to_phi
			       e1
			       (sclnot (enot e,
					scrnot (e,
						scland (e1, e2,
							sclnot (e1,
								scaxiom (e1, e2 :: gamma)))))),
			     not_to_phi
			       e2
			       (sclnot (enot e,
					scrnot (e,
						scland (e1, e2,
							sclnot (e2,
								scaxiom (e2, e1 :: gamma))))))))
     end
  | Eor (e1, e2, _) ->
     scrnot (enot e, proof)     
  | Eimply (e1, e2, _) ->
     scrimply (e1, ctrexpr_phi e2,
	       not_to_phi e2 (kleene_not_imply e1 e2 proof))
  | Eall (e1, s, e2, _) ->
     begin
       match kleene_not_forall e proof with
       | Some (prf, var) -> 
	  scrall (ctrexpr_phi e, var,
		  not_to_phi
		    (substitute [(e1, var)] e2)
		    prf)
       | None -> 
	  let z = new_tau () in
	  let ez = substitute [(e1, z)] e2 in
	  scrall (ctrexpr_phi e, z,
		  not_to_phi
		    ez
		    (sccut (enot e,
			    scrnot (e,
				    sclnot (ez,
					    sclall (e, z, scaxiom (ez, gamma)))),
			    sclweak ([enot ez], proof))))
     end
  | Eex (e1, s, e2, _) ->
     scrnot (enot e, proof)
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false
						   
let rec deduce_inequality e1 e2 v1 v2 c1 c2 b1 b2 gamma proof distincts =
  assert false
  (* let n1 = List.assoc v1 distincts in *)
  (* let n2 = List.assoc v2 distincts in *)
  (* let eq = eapp ("=", [e1; e2]) in *)
  (* let b3 = n1 < n2 in *)
  (* let ax = *)
  (*   if b3 *)
  (*   then eapp ("=", [v1; v2]) *)
  (*   else eapp ("=", [v2; v1]) in *)
  (* let rec f b1 b2 b3 = *)
  (*   match b1, b2, b3 with *)
  (*   | true, true, true -> sceqprop (eq, ax, []) *)
  (*   | _, _, false -> *)
  (*     sccut ( *)
  (* 	eapp ("=", [v1; v2]), *)
  (* 	f b1 b2 true, sceqsym (v1, v2, [c1; c2; eq])) *)
  (*   | _, false, _ -> *)
  (*     sccut ( *)
  (* 	eapp ("=", [e2; v2]), *)
  (* 	sceqsym (v2, e2, [c1; eq]), sclweak (c2, f b1 true b3)) *)
  (*   | false, _, _ -> *)
  (*     sccut ( *)
  (* 	eapp ("=", [e1; v1]), *)
  (* 	sceqsym (v1, e1, [c2; eq]), sclweak (c1, f true b2 b3)) *)
  (* in *)
  (* sccut ( *)
  (*     enot eq, *)
  (*     List.fold_left (fun prf e -> sclweak (e, prf)) *)
  (* 		     (scrnot (eq, sclnot (ax, f b1 b2 b3))) *)
  (* 		     (rm (enot ax) gamma), *)
  (*     sclweak (c1, sclweak (c2, proof))) *)

let derive_imply p q proof1 proof2 =
  let g1, c1, rule1 = proof1 in
  let g2, c2, rule2 = proof2 in
  assert (equal c1 efalse);
  assert (equal c2 efalse);
  assert (List.length g2 = List.length g1);
  assert (List.mem (enot p) g1);
  assert (List.mem q g2);
  let gamma = rm (enot p) g1 in
  match rule1 with
  | SClnot (e, prf) when (equal e p) ->
     sclimply (p, q, prf, proof2)
  | _ ->
     sccut (enot p,
            scrnot (p,
                    sclimply (p, q,
                              scaxiom (p, gamma),
                              sclweak ([p], proof2))),
            sclweak ([eimply (p, q)], proof1))
	
let derive_not_and p q proof1 proof2 =
  let g1, c1, rule1 = proof1 in
  let g2, c2, rule2 = proof2 in
  assert (equal c1 efalse);
  assert (equal c2 efalse);
  assert (List.length g2 = List.length g1);
  assert (List.mem (enot p) g1);
  assert (List.mem (enot q) g2);
  let gamma = rm (enot p) g1 in
  match rule1 with
  | SClnot (e1, prf1) when (equal e1 p) ->
     begin
       match rule2 with
       | SClnot (e2, prf2) when (equal e2 q) ->
	  sclnot (eand (p, q),
		  scrand (p, q, prf1, prf2))
       | _ ->
	  sccut (enot p,
		 scrnot (p,
			 sccut (enot q,
				scrnot (q,
					sclnot (eand (p, q),
						scrand (p, q,
							scaxiom (p, q :: gamma),
							scaxiom (q, p :: gamma)))),
				sclweak ([p; enot (eand (p, q))], proof2))),
		 sclweak ([enot (eand (p, q))], proof1))
     end
  | _ ->
     sccut (enot p,
	    scrnot (p,
		    sccut (enot q,
			   scrnot (q,
				   sclnot (eand (p, q),
					   scrand (p, q,
						   scaxiom (p, q :: gamma),
						   scaxiom (q, p :: gamma)))),
			   sclweak ([p; enot (eand (p, q))], proof2))),
	    sclweak ([enot (eand (p, q))], proof1))
	
let derive_not_or p q proof =
  let g, c, rule = proof in
  assert (equal c efalse);
  assert (List.mem (enot p) g);
  assert (List.mem (enot q) (rm (enot p) g));
  let gamma = rm (enot q) (rm (enot p) g) in
  sccut (enot p,
	 scrnot (p,
		 sclnot (eor (p, q),
			 scrorl (p, q,
				 scaxiom (p, gamma)))),
	 sccut (enot q,
		scrnot (q,
			sclnot (eor (p, q),
				scrorr(p, q,
				       scaxiom (q, enot p :: gamma)))),
		sclweak ([enot (eor (p, q))], proof)))

let derive_not_imply p q proof =
  let g, c, rule = proof in
  assert (equal c efalse);
  assert (List.mem p g);
  assert (List.mem (enot q) (rm p g));
  let gamma = rm (enot q) (rm p g) in
  match rule with
  | SClnot (e, prf) when (equal e q) ->
     sclnot (eimply (p, q),
	     scrimply (p, q, prf))
  | _ ->
     sccut (enot q,
	    scrnot (q,
		    sclnot (eimply (p, q),
			    scrimply (p, q, scaxiom (q, p :: gamma)))),
	    sclnot (eimply (p, q),
		    scrimply (p, q, scrweak (q, proof))))

let derive_not_ex ep t proof =
  let x, p =
    match ep with
    | Eex(x, _, p, _) -> x, p
    | _ -> assert false in
  let pt = substitute [(x, t)] p in
  let g, c, rule = proof in
  assert (equal c efalse);
  assert (List.mem (enot pt) g);
  let gamma = rm (enot pt) g in
  match rule with
  | SClnot (e, prf) when (equal e pt) ->
     sclnot (ep,
     	     screx (ep, t, prf))
  | _ ->
     sccut (enot pt,
	    scrnot (pt,
		    sclnot (ep,
			    screx (ep, t,
				   scaxiom (pt, gamma)))),
	    sclweak ([enot ep], proof))

(* let rec check_constructive_aux p proof = *)
(*   let g, c, rule = proof in *)
(*   match rule with *)
(*   | SClnot (e, prf) when (equal e p) -> () *)
(*   | SClweak (e, prf) when (equal e (enot p)) -> () *)
(*   | SClcontr (e, prf) when (equal e (enot p)) -> assert false *)
(*   | SClnot _ *)
(*   | SCcut _ *)
(*   | SClimply _ -> *)
(*      assert false *)
(* 	 (\* debut cas sans interférence *\) *)
(*   | SClweak _ *)
(*   | SClcontr _ *)
(*   | SCfalse *)
(*   | SCland _ *)
(*   | SClor _ *)
(*   | SClex _ *)
(*   | SClall _ -> *)
(*      List.iter (check_constructive_aux p) (hypsofrule rule) *)
(* 	 (\* debut cas impossibles *\) *)
(*   | SCrand _ *)
(*   | SCrorl _ *)
(*   | SCrorr _ *)
(*   | SCrimply _ *)
(*   | SCrnot _ *)
(*   | SCrall _ *)
(*   | SCaxiom _ *)
(*   | SCtrue _ *)
(*   | SCeqref _ *)
(*   | SCeqsym _ *)
(*   | SCeqprop _ *)
(*   | SCeqfunc _ *)
(*   | SCrex _ *)
(*   | SCrweak _ -> *)
(*      assert false *)
(*   | SCcnot _ *)
(*   | SCext _ -> *)
(*      assert false *)
(*   | _ *)
(*     -> assert false *)
	   
(* let rec check_constructive ap v proof = *)
(*   let str = *)
(*     match v with *)
(*     | Evar (str, _) -> str in *)
(*   let x, p = *)
(*     match ap with *)
(*     | Eall (x, _, p, _) -> x, p *)
(*     | _ -> assert false in *)
(*   let pv = substitute [(x, v)] p in *)
(*   let g, c, rule = proof in *)
(*   match rule with *)
(*   | SClnot (e, prf) when (equal e pv) -> () *)
(*   | SClcontr (e, prf) when (equal e (enot pv)) -> assert false *)
(*   | SClweak (e, prf) when (equal e (enot pv)) -> () *)
(* 	 (\* debut cas sans interférence *\)  *)
(*   | SClweak _ *)
(*   | SClcontr _ *)
(*   | SCfalse *)
(*   | SClnot _ *)
(*   | SCcut _ *)
(*   | SCland _ *)
(*   | SClor _ *)
(*   | SClimply _ *)
(*   | SClex _ *)
(*   | SCrand _ *)
(*   | SCrorl _ *)
(*   | SCrorr _ *)
(*   | SCrimply _ *)
(*   | SCrnot _ *)
(*   | SCrall _ *)
(*   | SCaxiom _ *)
(*   | SCtrue _ *)
(*   | SCeqref _ *)
(*   | SCeqsym _ *)
(*   | SCeqprop _ *)
(*   | SCeqfunc _ *)
(*   | SCrweak _ -> *)
(*      List.iter (check_constructive ap v) (hypsofrule rule) *)
(* 	 (\* fin cas sans interférence *\)  *)
(*   | SClall (_, t, prf) -> *)
(*      if (equal c efalse) *)
(*      then *)
(*        begin *)
(* 	 if (not (List.mem str (get_fv t))) *)
(* 	 then *)
(* 	   check_constructive_aux pv prf *)
(* 	 else *)
(* 	   check_constructive ap v prf *)
(*        end *)
(*      else *)
(*        begin *)
(* 	 assert (not (List.mem str (get_fv t))); *)
(* 	 check_constructive ap v prf *)
(*        end *)
(*   | SCrex (_, t, prf) -> *)
(*      assert (not (List.mem str (get_fv t))); *)
(*      check_constructive ap v prf *)
(*   | SCcnot _ *)
(*   | SCext _ -> *)
(*      assert false *)
(*   | _ *)
(*     -> assert false *)
	      
let fail_constructive () =
  assert false

let rec not_to_not_forall ap v proof =
  let str =
    match v with
    | Evar (str, _) -> str
    | _ -> assert false in
  let x, p =
    match ap with
    | Eall (x, _, p, _) -> x, p
    | _ -> assert false in
  let pv = substitute [(x, v)] p in
  let g, c, rule = proof in
  match rule with
  | SClnot (e, prf) when (equal e pv) ->
     sclnot (ap,
	     scrall (ap, v, prf))
  | SClcontr (e, prf) when (equal e (enot pv)) ->
     fail_constructive ()	    
  (* | SClweak (e, prf) when (equal e (enot pv)) -> *)
  (* (\* debut cas sans interférence *\) *)
  (* | SClweak _ *)
  (* | SClcontr _ *)
  (* | SCfalse *)
  (* | SClnot _ *)
  (* | SCcut _ *)
  (* | SCland _ *)
  (* | SClor _ *)
  (* | SClimply _ *)
  (* | SClex _ *)
  (* | SCrand _ *)
  (* | SCrorl _ *)
  (* | SCrorr _ *)
  (* | SCrimply _ *)
  (* | SCrnot _ *)
  (* | SCrall _ *)
  (* | SCaxiom _ *)
  (* | SCtrue _ *)
  (* | SCeqref _ *)
  (* | SCeqsym _ *)
  (* | SCeqprop _ *)
  (* | SCeqfunc _ *)
  (* | SCrweak _ -> *)
  (*    List.iter (check_constructive ap v) (hypsofrule rule) *)
  (* 	 (\* fin cas sans interférence *\) *)
  | _ ->
     fail_constructive ()
  (* | SClall (_, t, prf) -> *)
  (*    if (equal c efalse) *)
  (*    then *)
  (*      begin *)
  (* 	 if (not (List.mem str (get_fv t))) *)
  (* 	 then *)
  (* 	   check_constructive_aux pv prf *)
  (* 	 else *)
  (* 	   check_constructive ap v prf *)
  (*      end *)
  (*    else *)
  (*      begin *)
  (* 	 assert (not (List.mem str (get_fv t))); *)
  (* 	 check_constructive ap v prf *)
  (*      end *)
  (* | SCrex (_, t, prf) -> *)
  (*    assert (not (List.mem str (get_fv t))); *)
  (*    check_constructive ap v prf *)
  (* | SCcnot _ *)
  (* | SCext _ -> *)
  (*    assert false *)

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
     sclnot (enot p, scrnot (p, proof))
  | Rconnect (And, p, q), [proof] ->
     scland (p, q, proof)
  | Rconnect (Or, p, q), [proof1; proof2] ->
     sclor (p, q, proof1, proof2)
  | Rconnect (Imply, p, q), [proof1; proof2] ->
     derive_imply p q proof1 proof2
  | Rconnect (Equiv, p, q), [proof1; proof2] ->
     assert false
  | Rnotconnect (And, p, q), [proof1; proof2] ->
     derive_not_and p q proof1 proof2
  | Rnotconnect (Or, p, q), [proof] ->
     derive_not_or p q proof
  | Rnotconnect (Imply, p, q), [proof] ->
     derive_not_imply p q proof
  | Rnotconnect (Equiv, p, q), [proof1; proof2] ->
     assert false
  | Rex (Eex(x, ty, p, _) as ep, v), [proof] ->
     sclex (ep, v, proof)
  | Rall (Eall(x, _, p, _) as ap, t), [proof] ->
     sclall (ap, t, proof)	     
  | Rnotex (Eex(x, ty, p, _) as ep, t), [proof] ->
     derive_not_ex ep t proof
  | Rnotall (Eall(x, s, p, _) as ap, v), [proof] ->
     not_to_not_forall ap v proof
  | Rpnotp (Eapp (_, ts, _) as e1,
  	    Enot (Eapp (_, us, _) as e2, _)), proofs ->
     let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in
     let prf = sclnot (e2, sceqprop (e1, e2, gamma)) in
     let _, proof =
       List.fold_left2
  	 (fun (l, prf) eq prfneq ->
  	  let hyps = rm eq l in
	  let wprf = sclweak (hyps, prfneq) in
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
	  let wprf = sclweak (hyps, prfneq) in
	  hyps, sccut (enot eq,
		       scrnot (eq, prf),
		       wprf))
  	 (enot feq :: eqs, prf) eqs proofs in
     proof
  | RcongruenceLR (Elam (x, _, e, _) as p, a, b), [proof] ->
     let pa, pb = apply p a, apply p b in
     sccut (pb,
  	    sclweak (gamma, (rmcongruence true x e a b)),
  	    sclweak ([pa; eapp ("=", [a; b])], proof))
  | RcongruenceRL (Elam (x, _, e, _) as p, a, b), [proof] ->
     let pa, pb = apply p a, apply p b in     
     sccut (pb,
  	    sclweak (gamma, (rmcongruence false x e a b)),
  	    sclweak ([pa; eapp ("=", [b; a])], proof))
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
  let hyps = List.map2 (fun list proof -> sclweak (list, proof))
		       remainders prehyps in (* result with classical connectives *)
  let preproof =
    xlltolkrule distincts proof.rule hyps
		(maincontr@list)
		(* (maincontr@list) *)
  in
  (* Lkproof.p_debug_proof "coucou" preproof;   *)
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

let rec lltolk env proof goal righthandside contextoutput =
  let lkproof = match righthandside with
    | true ->
       let l, lkproof = lltolkrule env.distincts proof (enot goal :: env.hypotheses) in
       check_empty_remaining_proofs l; (* maincontr subset conclist subset gamma *) lkproof
    | false ->
       (* does not happen ? *)
       let l, lkproof = lltolkrule env.distincts proof env.hypotheses in
       check_empty_remaining_proofs l; lkproof in
  let lkproof2 = not_to_phi goal lkproof in
  let _, lkproof3 =
    List.fold_left
      (fun (conc, rule) stmt ->
       eimply (stmt, conc),
       scrimply (stmt, conc, rule))
      (ctrexpr_phi goal, lkproof2) env.hypotheses
  in lkproof3
