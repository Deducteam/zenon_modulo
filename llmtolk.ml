open Llproof
open Lkproof
open Expr
open Printf

type env = {hypotheses : Expr.expr list; 
	    distincts : (Expr.expr * int) list;}

let new_terms = ref []
	 
let p_debug s es =
  eprintf "%s |" s;
  List.iter
    (eprintf " %a |"
       (fun oc x -> Print.expr (Print.Chan oc) x)
    ) es;
  eprintf "\n"

let p_debug_proof s (g, c, rule) =
  eprintf "%s : gamma = |" s;
  List.iter
    (eprintf " %a |"
       (fun oc x -> Print.expr (Print.Chan oc) x)) g;
  eprintf "\n and conc = |";
  eprintf " %a |"
    (fun oc x -> Print.expr (Print.Chan oc) x) c;
  eprintf "\n"

let ingamma e proof =
  let g, c, rule = proof in
  let b = List.exists (equal e) g in
  if not b then
    (p_debug "Error: expression" [e];
     p_debug_proof "not found in proof context" proof);
  b

let rec rm a list =
  match list with
  | x :: list when equal x a -> list
  | x :: list -> x :: (rm a list)
  | [] -> assert false
	  
(* let sceqpropbis (e1, e2, proofs, gamma) = *)
(*   match e1, e2 with *)
(*   | Eapp (_, ts, _), Eapp (_, us, _) -> *)
(*     let prf = sceqprop (e1, e2, gamma) in *)
(*     let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in *)
(*     let _, proof = *)
(*       List.fold_left2 *)
(* 	(fun (l, prf) eq proof -> *)
(* 	  assert (List.mem eq l); *)
(* 	  let hyps = rm eq l in *)
(* 	  hyps, sccut (eq, scweak (hyps, None, proof), prf)) *)
(* 	(e1 :: eqs, prf) eqs proofs in *)
(*     proof *)
(*   | _, _ -> assert false *)

(* let sceqfuncbis (e1, e2, proofs, gamma) = *)
(*   match e1, e2 with *)
(*   | Eapp (_, ts, _), Eapp (_, us, _) -> *)
(*     let prf = sceqfunc (e1, e2, gamma) in *)
(*     let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in *)
(*     let _, proof = *)
(*       List.fold_left2 *)
(* 	(fun (l, prf) eq proof -> *)
(* 	  assert (List.mem eq l); *)
(* 	  let hyps = rm eq l in *)
(* 	  hyps, sccut (eq, scweak (hyps, None, proof), prf)) *)
(* 	(eqs, prf) eqs proofs in *)
(*     proof *)
(*   | _, _ -> assert false *)

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

(* let rec xrmcongruence s x t a b = *)
(*   let eq = *)
(*     if s *)
(*     then eapp ("=", [a; b]) *)
(*     else eapp ("=", [b; a]) in *)
(*   match t with *)
(*   | Evar (v, _) when (equal x t) -> *)
(*     if s *)
(*     then scaxiom (eapp ("=", [a; b]), []) *)
(*     else sceqsym (b, a, []) *)
(*   | Eapp (f, args, _) -> *)
(*     sceqfuncbis ( *)
(*       substitute [(x, a)] t, substitute [(x, b)] t, *)
(*       List.map (fun t -> xrmcongruence s x t a b) args, [eq]) *)
(*   | Evar _ | Etau _ -> *)
(* 	      sctheory ("refl", eapp ("=", [t; t]), *)
(* 	     		scaxiom (eapp ("=", [t; t]), [eq])) *)
(*   | _ -> *)
(*      let print_expr out = Print.expr (Print.Chan out) in *)
(*      Printf.eprintf "Warning: unexpected use of xrmcongruence %b (%a) (%a) (%a) (%a).\n" *)
(*                     s print_expr x print_expr t print_expr a print_expr b; *)
(*      sctheory ("refl", eapp ("=", [t; t]), *)
(* 	       scaxiom (eapp ("=", [t; t]), [eq])) *)

(* let rec rmcongruence s x e a b = *)
(*   let eq = *)
(*     if s *)
(*     then eapp ("=", [a; b]) *)
(*     else eapp ("=", [b; a]) in *)
(*   match e with *)
(*   | Etrue | Efalse | Evar _ -> scaxiom (e, []) *)
(*   | Eapp (f, args, _) -> *)
(*     sceqpropbis ( *)
(*       substitute [(x, a)] e, substitute [(x, b)] e, *)
(*       List.map (fun t -> xrmcongruence s x t a b) args, [eq]) *)
(*   | Eand (e1, e2, _) -> *)
(*     scland ( *)
(*       substitute [(x, a)] e1, substitute [(x, a)] e2, *)
(*       scrand ( *)
(* 	substitute [(x, b)] e1, substitute [(x, b)] e2, *)
(* 	scweak ([substitute [(x, b)] e2], None, rmcongruence s x e1 a b), *)
(* 	scweak ([substitute [(x, b)] e1], None, rmcongruence s x e2 a b))) *)
(*   | Eor (e1, e2, _) -> *)
(*     sclor ( *)
(*       substitute [(x, a)] e1, substitute [(x, a)] e2, *)
(*       scrorl ( *)
(* 	substitute [(x, b)] e1, substitute [(x, b)] e2, *)
(* 	rmcongruence s x e1 a b), *)
(*       scrorr ( *)
(* 	substitute [(x, b)] e1, substitute [(x, b)] e2, *)
(* 	rmcongruence s x e2 a b)) *)
(*   | Eimply (e1, e2, _) -> *)
(*     scrimply ( *)
(*       substitute [(x, b)] e1, substitute [(x, b)] e2, *)
(*       sclimply ( *)
(* 	substitute [(x, a)] e1, substitute [(x, a)] e2, *)
(* 	rmcongruence (not s) x e1 b a, *)
(* 	scweak ([substitute [(x, b)] e1], None, rmcongruence s x e2 a b))) *)
(*   | Enot (e0, _) -> *)
(*     scrnot ( *)
(*       substitute [(x, b)] e0, *)
(*       sclnot ( *)
(* 	substitute [(x, a)] e0, *)
(* 	rmcongruence (not s) x e0 b a)) *)
(*   | Eall (y, ty, e0, _) -> *)
(*     let z = new_var () in *)
(*     scrall ( *)
(*       substitute [(x, b)] e, *)
(*       substitute [(x, b)] z, *)
(*       sclall ( *)
(* 	substitute [(x, a)] e, *)
(* 	substitute [(x, a)] z, *)
(* 	rmcongruence s x *)
(* 	  (substitute [(y, z)] e0) a b)) *)
(*   | Eex (y, ty, e0, _) -> *)
(*     let z = new_var () in *)
(*     screx ( *)
(*       substitute [(x, b)] e, *)
(*       substitute [(x, b)] z, *)
(*       sclex ( *)
(* 	substitute [(x, a)] e, *)
(* 	substitute [(x, a)] z, *)
(* 	rmcongruence s x *)
(* 	  (substitute [(y, z)] e0) a b)) *)
(*     | Etau _ | Elam _ | Emeta _ | Eequiv _ -> *)
(*     assert false *)

let new_tau =
  let r = ref 0 in
  fun () ->
    let n = !r in
    incr r;
    evar (sprintf "tau%d" n)	 

let third (a, b, c) = c
	 
let xllmtolkrule distincts rule hyps gamma delta =
  match rule, hyps with
  | Rfalse, [] ->
     scweak (gamma, delta, scfalse)
  | Rnottrue, [] ->
     scweak (gamma, delta, sctrue)
  | Raxiom (p), [] ->
     begin
       match p with
       | Evar _
       | Eapp _ ->
	  scweak (gamma, delta, scaxiom p)
       | _ -> assert false
     end
  | Rcut (p), [proof1; proof2] ->
     assert false
  (* | Rnoteq (a), [] -> *)
  (*    sclnot (eapp ("=", [a; a]), *)
  (* 	     sctheory ("refl", eapp ("=", [a; a]), *)
  (* 		       scaxiom (eapp ("=", [a; a]), gamma))) *)
  (* | Reqsym (a, b), [] -> *)
  (*    sclnot (eapp ("=", [b; a]), sceqsym (a, b, gamma)) *)
  | Rnotnot (p), [proof] ->
     let proof =
       match p with
       | Enot (p, _) -> sclnot (p, proof)
       | _ -> proof in
     scrnot (p, proof)
  | Rconnect (And, p, q), [proof] ->
     let proof =
       match p with
       | Enot (p, _) -> sclnot (p, proof)
       | _ -> proof in
     let proof =
       match q with
       | Enot (q, _) -> sclnot (q, proof)
       | _ -> proof in
     scland (p, q, proof)
  | Rconnect (Or, p, q), [proof1; proof2] ->
     let proof1 =
       match p with
       | Enot (p, _) -> sclnot (p, proof1)
       | _ -> proof1 in
     let proof2 =
       match q with
       | Enot (q, _) -> sclnot (q, proof2)
       | _ -> proof2 in
     sclor (p, q, proof1, proof2)
  | Rconnect (Imply, p, q), [proof1; proof2] ->
     let proof2 =
       match q with
       | Enot (q, _) -> sclnot (q, proof2)
       | _ -> proof2 in
     sclimply (p, q, proof1, proof2)
  | Rconnect (Equiv, p, q), [proof1; proof2] ->
     assert false
  | Rnotconnect (And, p, q), [proof1; proof2] ->
     scrand (p, q, proof1, proof2)
  | Rnotconnect (Or, p, q), [proof] ->
     scror (p, q, proof)
  | Rnotconnect (Imply, p, q), [proof] ->
     let proof =
       match p with
       | Enot (p, _) -> sclnot (p, proof)
       | _ -> proof in
     (* print (lkproof proof); *)
     (* eprintf "\n\n"; *)
     (* print (lkproof (scrimply (p, q, proof))); *)
     (* eprintf "\n\n"; *)
     scrimply (p, q, proof)
  | Rnotconnect (Equiv, p, q), [proof1; proof2] ->
     assert false
  | Rex (Eex(x, ty, p, _) as ep, v), [proof] ->
     let pv = substitute [(x, v)] p in
     let proof =
       match pv with
       | Enot (pv, _) -> sclnot (pv, proof)
       | _ -> proof in
     sclex (ep, v, proof)
  | Rall (Eall(x, _, p, _) as ap, t), [proof] ->
     let pt = substitute [(x, t)] p in
     let proof =
       match pt with
       | Enot (pt, _) -> sclnot (pt, proof)
       | _ -> proof in
     sclall (ap, t, proof)
  | Rnotex (Eex(x, ty, p, _) as ep, t), [proof] ->
     screx (ep, t, proof)
  | Rnotall (ap, v), [proof] ->
     scrall (ap, v, proof)
  (* | Rpnotp (Eapp (_, ts, _) as e1, *)
  (* 	    Enot (Eapp (_, us, _) as e2, _)), proofs -> *)
  (*    let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in *)
  (*    let prf = sclnot (e2, sceqprop (e1, e2, gamma)) in *)
  (*    let _, proof = *)
  (*      List.fold_left2 *)
  (* 	 (fun (l, prf) eq prfneq -> *)
  (* 	  let hyps = rm eq l in *)
  (* 	  let wprf = scweak (hyps, None, prfneq) in *)
  (* 	  hyps, sccut (enot eq, *)
  (* 		       scrnot (eq, prf), *)
  (* 		       wprf)) *)
  (* 	 (e1 :: enot e2 :: eqs, prf) eqs proofs in *)
  (*    proof *)
  (* | Rnotequal (Eapp (_, ts, _) as e1, *)
  (* 	       (Eapp (_, us, _) as e2)), proofs -> *)
  (*    let feq = eapp ("=", [e1; e2]) in *)
  (*    let eqs = List.map2 (fun t u -> eapp ("=", [t; u])) ts us in *)
  (*    let prf = sclnot (feq, sceqfunc (e1, e2, gamma)) in *)
  (*    let _, proof = *)
  (*      List.fold_left2 *)
  (* 	 (fun (l, prf) eq prfneq -> *)
  (* 	  let hyps = rm eq l in *)
  (* 	  let wprf = scweak (hyps, None, prfneq) in *)
  (* 	  hyps, sccut (enot eq, *)
  (* 		       scrnot (eq, prf), *)
  (* 		       wprf)) *)
  (* 	 (enot feq :: eqs, prf) eqs proofs in *)
  (*    proof *)
  (* | RcongruenceLR (Elam (x, _, e, _) as p, a, b), [proof] -> *)
  (*    let cpa, cpb, ce = ctrexpr_chi (apply p a), ctrexpr_chi (apply p b), ctrexpr_chi e in *)
  (*    sccut (cpb, *)
  (* 	    scweak (gamma, None, rmcongruence true x ce a b), *)
  (* 	    scweak ([cpa; eapp ("=", [a; b])], None, proof)) *)
  (* | RcongruenceRL (Elam (x, _, e, _) as p, a, b), [proof] -> *)
  (*    let cpa, cpb, ce = ctrexpr_chi (apply p a), ctrexpr_chi (apply p b), ctrexpr_chi e in      *)
  (*    sccut (cpb, *)
  (* 	    scweak (gamma, None, rmcongruence false x ce a b), *)
  (* 	    scweak ([cpa; eapp ("=", [b; a])], None, proof)) *)
  | Rextension (ext, name, args, cons, hyps), proofs ->  assert false
  | Rlemma _, _ -> assert false (* no lemma after use_defs *)
  | Rdefinition _, _ -> assert false (* no definition after use_defs *)
  | _ -> assert false

(* merge [l_i] = Merge [l_i], [Merge[l_i]\l_j]_j*)
(* length (snd(merge l)) = length l *)
let rec merge lists =
  match lists with
  | [] -> [], []
  | [list] -> list, [[]]
  | [] :: lists ->
    let main, remainders = merge lists in
    main, main :: remainders
  | (x :: l) :: lists ->
    let main, remainders = merge (l :: lists) in
    match remainders with
    | remainder :: remainders ->
      if List.mem x remainder
      then
	main, (rm x remainder) :: remainders
      else
	x :: main, remainder :: (List.map (fun xs -> x :: xs) remainders)
    | _ -> assert false
		
(* let rec lltolkcheck proof = *)
(*   let hypslist, conclist = hypstoadd proof.rule in *)
(*   (\* list = gamma - (conclist inter gamma) *\) *)
(*   (\* newcontr = conclist - (conclist inter gamma) *\) *)
(*   (\* newcontr : list of things to be contracted later *\) *)
(*   let pregammalist = List.map lltolkcheck proof.hyps in *)
(*   let gammalist = *)
(*     List.map2 *)
(*       (fun g h -> *)
(*        List.fold_left *)
(* 	 (fun g hyp -> *)
(* 	  if List.mem hyp g *)
(* 	  then rm hyp g *)
(* 	  else g) *)
(* 	 g h) *)
(*       pregammalist hypslist in *)
(*   let gamma, _ = merge gammalist in *)
(*   conclist@gamma *)


(* let rec lltolkcheckbis proof e = *)
(*   if List.for_all (fun prf -> lltolkcheckbis prf e) proof.hyps  *)
(*   then true *)
(*   else *)
(*     let hypslist, conclist = hypstoadd proof.rule in *)
(*     List.mem e conclist *)

(* (\* Check that the list of remaining formulae to prove l is empty. *)
(*    Print it otherwise *\) *)
(* let check_empty_remaining_proofs l = *)
(*   if not (l = []) then ( *)
(*     Lkproof.p_debug "Error while translating from LL to LK, : " l; *)
(*     assert false *)
(*   ) *)

let rec separate list = 
  match list with
  | [] -> ([], [])
  | p :: list ->
     let (l1, l2) = separate list in
     match p with
     | Enot (q, _) -> (l1, q :: l2)
     | _ -> (p :: l1, l2)
  
(* Invariant : pas de proposition commençant par une négation à gauche *)
let rec llmtolkrule distincts proof =
  let prelist = List.map (llmtolkrule distincts) proof.hyps in
  let hypslist, conclist = hypstoadd proof.rule in
  (* Soit inter_i = prelist_i inter hypslist_i *)
  (* Soit hypslist_i = missing_i, inter_i *)
  (* Soit prelist_i = context_i, inter_i *)
  (* On affaiblit par missing_i pour prouver *)
  (*    prelist_i, missing_i = context_i, hypslist_i *)
  let contextlist, missinglist =
    List.split
      (List.map2
	 (fun precontext hyps ->
	  List.fold_left
	    (fun (context, missing) hyp ->
	     if List.mem hyp context
	     then rm hyp context, missing
	     else context, hyp :: missing)
	    (precontext, []) hyps)
	 (List.map fst prelist) hypslist) in
  let premises =
    List.map2
      (fun premise missing ->
	let gamma, delta = separate missing in
	scweak (gamma, delta, premise))
      (List.map snd prelist) missinglist in
  (* Soit context = context_i, remaining_i *)
  let context, remaininglist = merge contextlist in
  let premises =
    List.map2
      (fun premise remaining ->
       let gamma, delta = separate remaining in
       scweak (gamma, delta, premise))
      premises remaininglist in
  let gamma, delta = separate context in
  (* print (xllmtolkrule distincts proof.rule premises gamma delta); *)
  (* eprintf "\n\n"; *)
  conclist@context,
  xllmtolkrule distincts proof.rule premises gamma delta

(* faire remonter les contractions le plus haut *)
let rec contract_right hyp typed_proof =
  assert (not (premises typed_proof = []));
    match lkproof typed_proof with
    | SCweak (wgamma, wdelta, _) when (List.mem hyp wdelta) ->
       let [proof] = premises typed_proof in
       scweak (wgamma, rm hyp wdelta, proof)
    | _ ->
       let (gamma, delta) = sequent typed_proof in
       if (List.mem hyp delta && List.mem hyp (rm hyp delta))
	  && not (List.for_all
		    (fun typed_proof ->
		     let (gamma, delta) = sequent typed_proof in
		     (List.mem hyp delta && List.mem hyp (rm hyp delta)))
		    (premises typed_proof))
       then
	 scrcontr (hyp, typed_proof)
       else
	 applytopremises (contract_right hyp) typed_proof

(* faire remonter les contractions le plus haut *)
let rec contract_left hyp typed_proof =
  assert (not (premises typed_proof = []));
    match lkproof typed_proof with
    | SCweak (wgamma, wdelta, _) when (List.mem hyp wgamma) ->
       let [proof] = premises typed_proof in
       scweak (rm hyp wgamma, wdelta, proof)
    | _ ->
       let (gamma, delta) = sequent typed_proof in
       if (List.mem hyp gamma && List.mem hyp (rm hyp gamma))
	  && not (List.for_all
		    (fun typed_proof ->
		     let (gamma, delta) = sequent typed_proof in
		     (List.mem hyp gamma && List.mem hyp (rm hyp gamma)))
		    (premises typed_proof))
       then
	 sclcontr (hyp, typed_proof)
       else
	 applytopremises (contract_left hyp) typed_proof

(* let rec candidates proof = *)
(*   match lkproof proof, List.map candidates (premises proof) with *)
(*   | _, [] -> *)
(*      [] *)
(*   | SClall (ap, t, _), [list] -> *)
(*      if List.mem_assq ap list *)
(*      then *)
(*        let l = List.assq ap list in *)
(*        let nl = if List.memq t l then l else t :: l in *)
(*        (ap, nl) :: (List.remove_assq ap list) *)
(*      else (ap, [t]) :: list *)
(*   | SCrex (ep, t, _), [list] -> *)
(*      if List.mem_assq ep list *)
(*      then *)
(*        let l = List.assq ep list in *)
(*        let nl = if List.memq t l then l else t :: l in *)
(*        (ep, nl) :: (List.remove_assq ep list) *)
(*      else (ep, [t]) :: list *)
(*   | SCrall (ap, (Evar (s, _) as v), _), [list] -> *)
(*      List.map *)
(*        (fun (e, l) -> *)
(* 	(e, List.filter (fun t -> not (List.mem s (get_fv t))) l)) *)
(*        list *)
(*   | SClex (ep, (Evar (s, _) as v), _), [list] -> *)
(*      List.map *)
(*        (fun (e, l) -> *)
(* 	(e, List.filter (fun t -> not (List.mem s (get_fv t))) l)) *)
(*        list *)
(*   | _, [list] -> *)
(*      list *)
(*   | _, [list1; list2] -> *)
(*      List.fold_left *)
(*        (fun list (e, l) -> *)
(* 	if List.mem_assq e list *)
(* 	then *)
(* 	  let nl = *)
(* 	    List.fold_left *)
(* 	      (fun ts t -> if List.memq t ts then ts else t :: ts) *)
(* 	      (List.assq e list) l in *)
(* 	  (e, nl) :: (List.remove_assq e list) *)
(* 	else (e, l) :: list) list1 list2 *)
(*   | _, _ -> *)
(*      assert false *)

(* let rec substitute_proof x t proof = *)
(*   let subst = substitute [(x, t)] in *)
(*   match lkproof proof, List.map (substitute_proof x t) (premises proof) with *)
(*   | SCaxiom p, [] -> *)
(*      scaxiom (subst p) *)
(*   | SCweak (left, right, _), [proof] -> *)
(*      scweak (List.map subst left, List.map subst right, proof) *)
(*   | SCfalse, [] -> *)
(*      scfalse *)
(*   | SCtrue, [] -> *)
(*      sctrue *)
(*   | SClnot (p, _), [proof] -> *)
(*      sclnot (subst p, proof) *)
(*   | SCrnot (p, _), [proof] -> *)
(*      scrnot (subst p, proof) *)
(*   | SClimply (p, q, _, _), [proof1; proof2] -> *)
(*      sclimply (subst p, subst q, proof1, proof2) *)
(*   | SCrimply (p, q, _), [proof] -> *)
(*      scrimply (subst p, subst q, proof) *)
(*   | SCland (p, q, _), [proof] -> *)
(*      scland (subst p, subst q, proof) *)
(*   | SCrand (p, q, _, _), [proof1; proof2] -> *)
(*      scrand (subst p, subst q, proof1, proof2) *)
(*   | SClor (p, q, _, _), [proof1; proof2] -> *)
(*      sclor (subst p, subst q, proof1, proof2) *)
(*   | SCror (p, q, _), [proof] -> *)
(*      scror (subst p, subst q, proof) *)
(*   | SClall (Eall (x, _, p, _) as ap, t, _), [proof] -> *)
(*      sclall (subst ap, subst t, proof) *)
(*   | SCrall (ap, (Evar (s, _) as v), _), [proof] -> *)
(*      scrall (subst ap, subst v, proof) *)
(*   | SClex (ep, (Evar (s, _) as v), _), [proof] -> *)
(*      sclex (subst ep, subst v, proof) *)
(*   | SCrex (Eex (x, _, p, _) as ep, t, _), [proof] -> *)
(*      screx (subst ep, subst t, proof)        *)
(*   | SClcontr (e, _), [proof] -> *)
(*      sclcontr (subst e, proof) *)
(*   | SCrcontr (e, _), [proof] -> *)
(*      scrcontr (subst e, proof) *)
(*   | _, _ -> *)
(*      assert false *)
	    
let rec reduce proof =
  let (gamma, delta) = sequent proof in
  match lkproof proof, premises proof with
  | SCaxiom p, [] ->
     scaxiom p
  | SCweak (left, right, _), [proof] ->
     scweak (left, right, reduce proof)
  | SCfalse, [] ->
     scfalse
  | SCtrue, [] ->
     sctrue
  | SClnot (p, _), [proof] ->
     sclnot (p, reduce proof)
  | SCrnot (p, _), [proof] ->
     scrnot (p, reduce proof)
  | SClimply (p, q, _, _), [proof1; proof2] ->
     sclimply (p, q, reduce proof1, reduce proof2)
  | SCrimply (p, q, _), [proof] ->
     scrimply (p, q, reduce proof)
  | SCland (p, q, _), [proof] ->
     scland (p, q, reduce proof)
  | SCrand (p, q, _, _), [proof1; proof2] ->
     scrand (p, q, reduce proof1, reduce proof2)
  | SClor (p, q, _, _), [proof1; proof2] ->
     sclor (p, q, reduce proof1, reduce proof2)
  | SCror (p, q, _), [proof] ->
     scror (p, q, reduce proof)
  | SClall (Eall (x, _, p, _) as ap, (Evar (v, _) as t), _), [premise] ->
     (* let list = candidates premise in *)
     (* let ts = if List.mem_assq ap list then List.assq ap list else [] in *)
     (* let ts = List.filter (fun e -> not (equal e t)) ts in *)
     (* assert (List.for_all (fun e -> equal e (substitute [(t, etrue)] e)) (gamma@delta)); *)
     (* if *)
     (*   List.for_all (fun (tau, var) -> not (equal var t)) !new_terms *)
     (*   && ts != [] *)
     (*   && List.for_all (fun e -> equal e (substitute [(t, etrue)] e)) (gamma@delta) *)
     (* then *)
     (*   let _ = assert false in *)
     (*   let nt = List.hd ts in *)
     (*   reduce (substitute_proof t nt proof) *)
     (* else *)
       sclall (ap, t, reduce premise)       
  | SClall (Eall (x, _, p, _) as ap, t, _), [proof] ->
     sclall (ap, t, reduce proof)
  | SCrall (ap, (Evar (s, _) as v), _), [proof] ->
     scrall (ap, v, reduce proof)
  | SClex (ep, (Evar (s, _) as v), _), [proof] ->
     sclex (ep, v, reduce proof)
  | SCrex (Eex (x, _, p, _) as ep, (Evar (v, _) as t), _), [premise] ->
     (* let list = candidates premise in *)
     (* let ts = if List.mem_assq ep list then List.assq ep list else [] in *)
     (* let ts = List.filter (fun e -> not (equal e t)) ts in *)
     (* assert (List.for_all (fun e -> equal e (substitute [(t, etrue)] e)) (gamma@delta)); *)
     (* if *)
     (*   List.for_all (fun (tau, var) -> not (equal var t)) !new_terms *)
     (*   && ts != [] *)
     (*   && List.for_all (fun e -> equal e (substitute [(t, etrue)] e)) (gamma@delta) *)
     (* then        *)
     (*   let _ = assert false in *)
     (*   let nt = List.hd ts in *)
     (*   reduce (substitute_proof t nt proof) *)
     (* else *)
       screx (ep, t, reduce premise)       
  | SCrex (Eex (x, _, p, _) as ep, t, _), [proof] ->
     screx (ep, t, reduce proof)       
  | SClcontr (e, _), [proof] ->
     sclcontr (e, reduce proof)
  | SCrcontr (e, _), [proof] ->
     scrcontr (e, reduce proof)
  | _, _ ->
     assert false

let rec llmtolk env proof goal contextoutput =
  let precontext, preproof =
    llmtolkrule env.distincts proof in
  let missing, contr =
    List.fold_left
      (fun (missing, contr) hyp ->
       if List.mem hyp missing
       then rm hyp missing, contr
       else missing, hyp :: contr)
      (enot goal :: env.hypotheses, []) precontext in
  let mgamma, mdelta = separate missing in
  let proof = scweak (mgamma, mdelta, preproof) in
  let _, delta = separate env.hypotheses in
  let proof =
    List.fold_left
      (fun proof hyp ->
       sclnot (hyp, proof))
      proof delta in
  let contr_left, contr_right = separate contr in
  (* print (lkproof proof); *)
  (* p_debug "contr_left" contr_left; *)
  (* p_debug "contr_right" contr_right; *)
  let proof =
    List.fold_left
      (fun typed_proof hyp ->
       match hyp with
       | Enot (hyp, _) -> contract_right hyp typed_proof
       | _ -> contract_left hyp typed_proof)
      proof contr in
  (* print (lkproof proof); *)
  reduce_flag := true;
  reduce proof
	 
(* FIN *)
       
let rec check_first_order_right p =
  match p with
  | Evar _ | Eapp _
  | Etrue ->
     ()
  | Efalse ->
     ()
  | Enot (e, _) ->
     assert false
  | Eand (e1, e2, _) ->
     check_first_order_right e1;
     check_first_order_right e2
  | Eor (e1, e2, _) ->
     check_first_order_right e1;
     check_first_order_right e2
  | Eimply (e1, e2, _) ->
     assert false
  | Eall (e1, s, e2, _) ->
     check_first_order_right e2
  | Eex (e1, s, e2, _) ->
     check_first_order_right e2     
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false

let rec check_first_order_left p =
  match p with
  | Evar _ | Eapp _
  | Etrue ->
     ()
  | Efalse ->
     ()
  | Enot (e, _) ->
     check_first_order_right e
  | Eand (e1, e2, _) ->
     check_first_order_left e1;
     check_first_order_left e2
  | Eor (e1, e2, _) ->
     assert false
  | Eimply (e1, e2, _) ->
     check_first_order_right e1;
     check_first_order_left e2
  | Eall (e1, s, e2, _) ->
     check_first_order_left e2
  | Eex (e1, s, e2, _) ->
     check_first_order_left e2
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false
						   
let rec check_constructive_right_aux p =
  check_first_order_right p

let rec check_constructive_left_aux p =
  check_first_order_left p
						   
let rec check_constructive_left p =
  match p with
  | Evar _ | Eapp _
  | Etrue ->
     check_constructive_left_aux p;
  | Efalse ->
     check_constructive_left_aux p;
  | Enot (e, _) ->
     check_constructive_left_aux p;
  | Eand (e1, e2, _) ->
     check_constructive_left e1;
     check_constructive_left e2
  | Eor (e1, e2, _) ->
     check_constructive_left e1;
     check_constructive_left e2
  | Eimply (e1, e2, _) ->
     check_constructive_left_aux p
  | Eall (e1, s, e2, _) ->
     check_constructive_left_aux p
  | Eex (e1, s, e2, _) ->
     check_constructive_left e2
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false
						   
let rec check_constructive_right p =
  match p with
  | Evar _ | Eapp _
  | Etrue ->
     check_constructive_right_aux p
  | Efalse ->
     check_constructive_right_aux p
  | Enot (e, _) ->
     check_constructive_left e
  | Eand (e1, e2, _) ->
     check_constructive_right e1;
     check_constructive_right e2
  | Eor (e1, e2, _) ->
     check_constructive_right_aux p
  | Eimply (e1, e2, _) ->
     check_constructive_left e1;
     check_constructive_right e2
  | Eall (e1, s, e2, _) ->
     check_constructive_right e2
  | Eex (e1, s, e2, _) ->
     check_constructive_right_aux p
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false
      
