open Printf
open Expr 

type lkproof = 
| SCaxiom of expr
| SCweak of expr list * expr list * lkproof
| SClcontr of expr * lkproof
| SCrcontr of expr * lkproof
| SCfalse
| SCtrue
| SClnot of expr * lkproof
| SCrnot of expr * lkproof
| SClimply of expr * expr * lkproof * lkproof
| SCrimply of expr * expr * lkproof
| SCland of expr * expr * lkproof
| SCrand of expr * expr * lkproof * lkproof
| SClor of expr * expr * lkproof * lkproof
| SCror of expr * expr * lkproof
| SClall of expr * expr * lkproof
| SCrall of expr * expr * lkproof
| SClex of expr * expr * lkproof
| SCrex of expr * expr * lkproof

type typed_lkproof = Expr.expr list * Expr.expr list * lkproof
;;

let reduce_flag = ref false
  
let lkproof (gamma, delta, proof) = proof
let sequent (gamma, delta, proof) = (gamma, delta)
  
let p_debug s es =
  eprintf "%s |" s;
  List.iter
    (eprintf " %a |"
       (fun oc x -> Print.expr (Print.Chan oc) x)
    ) es;
  eprintf "\n"

let rec print proof =
  let printexpr = fun oc e -> Print.expr (Print.Chan oc) e in
  let printlist = fun oc l -> List.iter (fun e -> Print.expr (Print.Chan oc) e) l in
  match proof with
  | SCaxiom p ->
     eprintf "Axiom (%a)" printexpr p
  | SCweak (left, right, proof) ->
     eprintf "Weak (%a | %a\n" printlist left printlist right;
     print proof;
     eprintf ")"
  | SCfalse ->
     eprintf "False";
  | SCtrue ->
     eprintf "True";
  | SClnot (p, proof) ->
     eprintf "Lnot (%a \n" printexpr p;
     print proof;
     eprintf ")"
  | SCrnot (p, proof) ->
     eprintf "Rnot (%a \n" printexpr p;
     print proof;
     eprintf ")"
  | SClimply (p, q, proof1, proof2) ->
     eprintf "Limply (%a %a \n" printexpr p printexpr q;
     print proof1;
     eprintf "\n";
     print proof2;
     eprintf ")"
  | SCrimply (p, q, proof) ->
     eprintf "Rimply (%a %a \n" printexpr p printexpr q;
     print proof;
     eprintf ")"
  | SCland (p, q, proof) ->
     eprintf "Land (%a %a \n" printexpr p printexpr q;
     print proof;
     eprintf ")"
  | SCrand (p, q, proof1, proof2) ->
     eprintf "Rand (%a %a \n" printexpr p printexpr q;
     print proof1;
     eprintf "\n";
     print proof2;
     eprintf ")"
  | SClor (p, q, proof1, proof2) ->
     eprintf "Lor (%a %a \n" printexpr p printexpr q;
     print proof1;
     eprintf "\n";
     print proof2;
     eprintf ")"
  | SCror (p, q, proof) ->
     eprintf "Ror (%a %a \n" printexpr p printexpr q;
     print proof;
     eprintf ")"
  | SClcontr (e, proof) ->
     eprintf "Lcontr (%a \n" printexpr e;
     print proof;
     eprintf ")"
  | SCrcontr (e, proof) ->
     eprintf "Rcontr (%a \n" printexpr e;
     print proof;
     eprintf ")"
  | SClall (e, t, proof) ->
     eprintf "Lall (%a %a \n" printexpr e printexpr t;
     print proof;
     eprintf ")"
  | SCrall (e, v, proof) ->
     eprintf "Rall (%a %a \n" printexpr e printexpr v;
     print proof;
     eprintf ")"
  | SClex (e, v, proof) ->
     eprintf "Lex (%a %a \n" printexpr e printexpr v;
     print proof;
     eprintf ")"
  | SCrex (e, t, proof) ->
     eprintf "Rex (%a %a \n" printexpr e printexpr t;
     print proof;
     eprintf ")"
			   
let rec rm a list =
  match list with
  | x :: list when equal x a -> list
  | x :: list -> x :: (rm a list)
  | [] -> assert false
		 
let rec included l1 l2 =
  match l1 with
  | [] -> true
  | a :: l1 ->
     if List.mem a l2
     then included l1 (rm a l2)
     else false

let scweak (wgamma, wdelta, (gamma, delta, proof)) =
  match wgamma, wdelta with
  | [], [] -> gamma, delta, proof
  | _, _ ->
     wgamma@gamma, wdelta@delta,
     match proof with
     | SCweak (ngamma, ndelta, proof) ->
	SCweak (wgamma @ ngamma, wdelta @ ndelta, proof)
     | _ ->
	SCweak (wgamma, wdelta, proof)     

let rec merge contexts =
  let gammas, deltas = List.split contexts in
  match contexts with
  | [] -> assert false
  | (gamma, delta) :: _ ->
     let maingamma, restgamma =
       List.fold_left
	 (fun (maingamma, restgamma) hyp ->
	  if List.for_all (List.mem hyp) restgamma
	  then (hyp :: maingamma, List.map (rm hyp) restgamma)
	  else (maingamma, restgamma))
	 ([], gammas) gamma in
     let maindelta, restdelta =
       List.fold_left
	 (fun (maindelta, restdelta) hyp ->
	  if List.for_all (List.mem hyp) restdelta
	  then (hyp :: maindelta, List.map (rm hyp) restdelta)
	  else (maindelta, restdelta))
	 ([], deltas) delta in
     maingamma, maindelta, List.combine restgamma restdelta

(* à ne pas faire avant de créer les contractions, cf SYN357+1.p *)
let rec reduce_weakenings typed_proofs contexts hypotheses =
  if (not !reduce_flag)
  then None
  else 
    match typed_proofs, contexts, hypotheses with
    | [], [], [] -> None
    | typed_proof :: typed_proofs,
      (wgamma, wdelta) :: contexts,
      (hgamma, hdelta) :: hypotheses ->
       if included hgamma wgamma && included hdelta wdelta
       then
	 let wgamma = List.fold_left (fun list e -> rm e list) wgamma hgamma in
	 let wdelta = List.fold_left (fun list e -> rm e list) wdelta hdelta in
	 Some (scweak (wgamma, wdelta, typed_proof))
       else
	 reduce_weakenings typed_proofs contexts hypotheses
    | _, _, _ -> assert false

let remove_weakenings typed_proofs =
  List.split
    (List.map
       (fun (gamma, delta, proof) ->
	match proof with
	| SCweak (wgamma, wdelta, proof) ->
	   (wgamma, wdelta),
	   (List.fold_left (fun list e -> rm e list) gamma wgamma,
	    List.fold_left (fun list e -> rm e list) delta wdelta,
	    proof)
	| _ ->
	   ([], []),
	   (gamma, delta, proof))
       typed_proofs)

let rec premises_weakening typed_proofs contexts hypotheses =
  match typed_proofs, contexts, hypotheses with
  | [], [], [] -> []
  | (gamma, delta, proof) :: typed_proofs,
    (wgamma, wdelta) :: contexts,
    (hgamma, hdelta) :: hypotheses ->
     let _, mgamma =
       List.fold_left
	 (fun (gamma, mgamma) hyp ->
	  if List.mem hyp gamma
	  then rm hyp gamma, mgamma
	  else gamma, hyp :: mgamma)
	 (gamma, []) hgamma in
     let _, mdelta =
       List.fold_left
	 (fun (delta, mdelta) hyp ->
	  if List.mem hyp delta
	  then rm hyp delta, mdelta
	  else delta, hyp :: mdelta)
	 (delta, []) hdelta in
     ((List.fold_left (fun list e -> rm e list) wgamma mgamma,
       List.fold_left (fun list e -> rm e list) wdelta mdelta),
      scweak (mgamma, mdelta, (gamma, delta, proof)))
     :: premises_weakening typed_proofs contexts hypotheses
  | _, _, _ -> assert false

let add_weakenings typed_proofs hypotheses (gammaconc, deltaconc) applyrule =
  (* let [(_, _, result)] = typed_proofs in *)
  (* print result; *)
  let contexts, typed_proofs = remove_weakenings typed_proofs in
  match reduce_weakenings typed_proofs contexts hypotheses with
  | Some (proof) ->
     scweak (gammaconc, deltaconc, proof)
  | None ->
     let contexts, typed_proofs = List.split (premises_weakening typed_proofs contexts hypotheses) in
     let wgamma, wdelta, rest = merge contexts in
     let premises =
       (List.map2
	  (fun typed_proof (wgamma, wdelta) ->
	   scweak (wgamma, wdelta, typed_proof))
	  typed_proofs rest) in
     let pgamma, pdelta, _ = List.hd premises in
     let hgamma, hdelta = List.hd hypotheses in
     let ngamma = gammaconc @ List.fold_left (fun list e -> rm e list) pgamma hgamma in
     let ndelta = deltaconc @ List.fold_left (fun list e -> rm e list) pdelta hdelta in
     (* let (_, _, result) = scweak (wgamma, wdelta, (ngamma, ndelta, applyrule premises)) in *)
     (* print result; *)
     scweak (wgamma, wdelta, (ngamma, ndelta, applyrule premises))
	    
let scaxiom e =
  [e], [e], SCaxiom e

let scfalse =
  [efalse], [], SCfalse

let sctrue =
  [], [etrue], SCtrue

let sclcontr (e, typed_proof) =
  let [wgamma, wdelta], [(gamma, delta, proof) as typed_proof] = remove_weakenings [typed_proof] in
  if List.mem e wgamma
  then scweak (rm e wgamma, wdelta, typed_proof)
  else scweak (wgamma, wdelta, (rm e gamma, delta, SClcontr (e, proof)))

let scrcontr (e, typed_proof) =
  let [wgamma, wdelta], [(gamma, delta, proof) as typed_proof] = remove_weakenings [typed_proof] in
  if List.mem e wdelta
  then scweak (wgamma, rm e wdelta, typed_proof)
  else scweak (wgamma, wdelta, (gamma, rm e delta, SCrcontr (e, proof)))
		 
let sclnot (e, typed_proof) =
  let hypotheses = [([], [e])] in
  let conclusion = ([enot e], []) in
  add_weakenings [typed_proof] hypotheses conclusion
		 (fun [(_, _, proof)] -> SClnot (e, proof))

let scrnot (e, typed_proof) =
  let hypotheses = [([e], [])] in
  let conclusion = ([], [enot e]) in
  add_weakenings [typed_proof] hypotheses conclusion
		 (fun [(_, _, proof)] -> SCrnot (e, proof))

let sclimply (e1, e2, typed_proof1, typed_proof2) =
  let hypotheses = [([], [e1]); ([e2], [])] in
  let conclusion = ([eimply (e1, e2)], []) in
  add_weakenings [typed_proof1; typed_proof2] hypotheses conclusion
		 (fun [(_, _, proof1); (_, _, proof2)] -> SClimply (e1, e2, proof1, proof2))

let scrimply (e1, e2, typed_proof) =
  let hypotheses = [([e1], [e2])] in
  let conclusion = ([], [eimply (e1, e2)]) in
  add_weakenings [typed_proof] hypotheses conclusion
		 (fun [(_, _, proof)] -> SCrimply (e1, e2, proof))

let scland (e1, e2, typed_proof) =
  let hypotheses = [([e1; e2], [])] in
  let conclusion = ([eand (e1, e2)], []) in
  add_weakenings [typed_proof] hypotheses conclusion
		 (fun [(_, _, proof)] -> SCland (e1, e2, proof))

let scrand (e1, e2, typed_proof1, typed_proof2) =
  let hypotheses = [([], [e1]); ([], [e2])] in
  let conclusion = ([], [eand (e1, e2)]) in
  add_weakenings [typed_proof1; typed_proof2] hypotheses conclusion
		 (fun [(_, _, proof1); (_, _, proof2)] -> SCrand (e1, e2, proof1, proof2))

let sclor (e1, e2, typed_proof1, typed_proof2) =
  let hypotheses = [([e1], []); ([e2], [])] in
  let conclusion = ([eor (e1, e2)], []) in
  add_weakenings [typed_proof1; typed_proof2] hypotheses conclusion
		 (fun [(_, _, proof1); (_, _, proof2)] -> SClor (e1, e2, proof1, proof2))

let scror (e1, e2, typed_proof) =
  let hypotheses = [([], [e1; e2])] in
  let conclusion = ([], [eor (e1, e2)]) in
  add_weakenings [typed_proof] hypotheses conclusion
		 (fun [(_, _, proof)] -> SCror (e1, e2, proof))

let sclall (Eall (x, _, p, _) as ap, t, typed_proof) =
  let hypotheses = [([substitute [(x, t)] p], [])] in
  let conclusion = ([ap], []) in
  add_weakenings [typed_proof] hypotheses conclusion
		 (fun [(_, _, proof)] -> SClall (ap, t, proof))

let sclex (Eex (x, _, p, _) as ep, v, typed_proof) =
  let hypotheses = [([substitute [(x, v)] p], [])] in
  let conclusion = ([ep], []) in
  add_weakenings [typed_proof] hypotheses conclusion
		 (fun [(_, _, proof)] -> SClex (ep, v, proof))

let scrall (Eall (x, _, p, _) as ap, v, typed_proof) =
  let hypotheses = [([], [substitute [(x, v)] p])] in
  let conclusion = ([], [ap]) in
  add_weakenings [typed_proof] hypotheses conclusion
		 (fun [(_, _, proof)] -> SCrall (ap, v, proof))

let screx (Eex (x, _, p, _) as ep, t, typed_proof) =
  let hypotheses = [([], [substitute [(x, t)] p])] in
  let conclusion = ([], [ep]) in
  add_weakenings [typed_proof] hypotheses conclusion
		 (fun [(_, _, proof)] -> SCrex (ep, t, proof))

let new_var =
  let r = ref 0 in
  fun () ->
    let n = !r in
    incr r;
    evar (sprintf "v%d" n)

let untyped_premises proof =
  match proof with
  | SCaxiom _ -> []
  | SCweak (_, _, proof) -> [proof]
  | SCfalse -> []
  | SCtrue -> []
  | SClnot (p, proof) -> [proof]
  | SCrnot (p, proof) -> [proof]
  | SClimply (p, q, proof1, proof2) -> [proof1; proof2]
  | SCrimply (p, q, proof) -> [proof]
  | SCland (p, q, proof) -> [proof]
  | SCrand (p, q, proof1, proof2) -> [proof1; proof2]
  | SClor (p, q, proof1, proof2) -> [proof1; proof2]
  | SCror (p, q, proof) -> [proof]
  | SClcontr (e, proof) -> [proof]
  | SCrcontr (e, proof) -> [proof]
  | SClall (e, t, proof) -> [proof]
  | SCrall (e, v, proof) -> [proof]
  | SClex (e, v, proof) -> [proof]
  | SCrex (e, t, proof) -> [proof]

let hypotheses proof =
  match proof with
  | SCaxiom p -> []
  | SCweak (left, right, proof) -> [([],[])]
  | SCfalse -> []
  | SCtrue -> []
  | SClnot (p, proof) ->  [([],[p])]
  | SCrnot (p, proof) -> [([p],[])]
  | SClimply (p, q, proof1, proof2) -> [([],[p]); ([q],[])]
  | SCrimply (p, q, proof) -> [([p],[q])]
  | SCland (p, q, proof) -> [([p; q],[])]
  | SCrand (p, q, proof1, proof2) -> [([],[p]); ([],[q])]
  | SClor (p, q, proof1, proof2) -> [([p],[]); ([q],[])]
  | SCror (p, q, proof) -> [([],[p; q])]
  | SClcontr (e, proof) -> [([e; e],[])]
  | SCrcontr (e, proof) -> [([],[e; e])]
  | SClall (Eall (x, _, e, _), t, proof) -> [([substitute [(x, t)] e],[])]
  | SCrall (Eall (x, _, e, _), v, proof) -> [([],[substitute [(x, v)] e])]
  | SClex (Eex (x, _, e, _), v, proof) -> [([substitute [(x, v)] e],[])]
  | SCrex (Eex (x, _, e, _), t, proof) -> [([],[substitute [(x, t)] e])]

let conclusion proof =
  match proof with
  | SCaxiom p -> [p],[p]
  | SCweak (left, right, proof) -> left,right
  | SCfalse -> [efalse],[]
  | SCtrue -> [],[etrue]
  | SClnot (p, proof) -> [enot p],[]
  | SCrnot (p, proof) -> [],[enot p]
  | SClimply (p, q, proof1, proof2) -> [eimply (p, q)], []
  | SCrimply (p, q, proof) -> [], [eimply (p, q)]
  | SCland (p, q, proof) -> [eand (p, q)], []
  | SCrand (p, q, proof1, proof2) -> [], [eand (p, q)]
  | SClor (p, q, proof1, proof2) -> [eor (p, q)], []
  | SCror (p, q, proof) -> [], [eor (p, q)]
  | SClcontr (e, proof) -> [e], []
  | SCrcontr (e, proof) -> [], [e]
  | SClall (e, t, proof) -> [e], []
  | SCrall (e, v, proof) -> [], [e]
  | SClex (e, v, proof) -> [e], []
  | SCrex (e, t, proof) -> [], [e]		

let premises (gamma, delta, proof) =
  let (cgamma, cdelta) = conclusion proof in
  let (gamma, delta) =
    (List.fold_left (fun gamma hyp -> assert (List.mem hyp gamma); rm hyp gamma) gamma cgamma,
     List.fold_left (fun delta hyp -> assert (List.mem hyp delta); rm hyp delta) delta cdelta) in
  List.map2
    (fun (hgamma, hdelta) proof ->
     (hgamma @  gamma, hdelta @ delta, proof))
    (hypotheses proof)
    (untyped_premises proof)
      
let applytopremises application (gamma, delta, proof) =
  match proof, premises (gamma, delta, proof) with
  | SCaxiom p, [] -> scaxiom p
  | SCweak (left, right, _), [proof] -> scweak (left, right, application proof)
  | SCfalse, [] -> scfalse
  | SCtrue, [] -> sctrue
  | SClnot (p, _), [proof] -> sclnot (p, application proof)
  | SCrnot (p, _), [proof] -> scrnot (p, application proof)
  | SClimply (p, q, _, _), [proof1; proof2] -> sclimply (p, q, application proof1, application proof2)
  | SCrimply (p, q, _), [proof] -> scrimply (p, q, application proof)
  | SCland (p, q, _), [proof] -> scland (p, q, application proof)
  | SCrand (p, q, _, _), [proof1; proof2] -> scrand (p, q, application proof1, application proof2)
  | SClor (p, q, _, _), [proof1; proof2] -> sclor (p, q, application proof1, application proof2)
  | SCror (p, q, _), [proof] -> scror (p, q, application proof)
  | SClcontr (e, _), [proof] -> sclcontr (e, application proof)
  | SCrcontr (e, _), [proof] -> scrcontr (e, application proof)
  | SClall (e, t, _), [proof] -> sclall (e, t, application proof)
  | SCrall (e, v, _), [proof] -> scrall (e, v, application proof)
  | SClex (e, v, _), [proof] -> sclex (e, v, application proof)
  | SCrex (e, t, _), [proof] -> screx (e, t, application proof)
  | _ , _-> assert false

(* les réductions sont ordonnées (cf cas weak) d'où un type pour réunir les réductions
à gauche et à droite *)
(* les réduits sont nécessaires (cf instanciations) *)
type reduction =
  | Left of expr * expr list * expr list
  | Right of expr * expr list * expr list

let remove_right p reds =
  let rec remove_right_aux p reds aux =
    match reds with
    | [] -> None
    | (Right (e, gamma, delta) as red) :: reds ->
       if equal e p
       then Some (aux, reds)
       else remove_right_aux p reds (red :: aux)
    | red :: reds ->
       remove_right_aux p reds (red :: aux)
  in
  match remove_right_aux p reds [] with
  | Some (l1, l2) -> Some (List.rev_append l1 l2)
  | None -> None
    
let rec reduce (gamma, delta, proof) reductions =
  match proof, premises (gamma, delta, proof) with
  | SCaxiom p, [] ->
     assert (reductions = []);
     scaxiom p
  | SCweak (left, right, _), [proof] ->
     let revreductions, nleft, nright =
       List.fold_left
	 (fun (reds, left, right) reduction ->
	  match reduction with
	  | Left (e, rgamma, rdelta) ->
	     if List.memq e left
	     then (reds, rgamma @ (rm e left), rdelta @ right)
	     else (reduction :: reds, left, right)
	  | Right (e, rgamma, rdelta) ->
	     if List.memq e right
	     then (reds, rgamma @ left, rdelta @ (rm e right))
	     else (reduction :: reds, left, right))
	 ([], left, right) reductions in
     scweak (nleft, nright, reduce proof (List.rev revreductions))
  | SCfalse, [] ->
     assert (reductions = []);
     scfalse
  | SCtrue, [] ->
     assert (reductions = []);
     sctrue
  | SClnot (p, _), [proof] ->
     sclnot (p, reduce proof reductions)
  | SCrnot (p, _), [proof] ->
     begin
       match remove_right (enot p) reductions with
       | Some (reductions) -> reduce proof reductions
       | None -> scrnot (p, reduce proof reductions)
     end
  | SClimply (p, q, _, _), [proof1; proof2] ->
     sclimply (p, q, reduce proof1 reductions, reduce proof2 reductions)
  | SCrimply (p, q, _), [proof] ->
     scrimply (p, q, reduce proof reductions)
  | SCland (p, q, _), [proof] ->
     scland (p, q, reduce proof reductions)
  | SCrand (p, q, _, _), [proof1; proof2] ->
     scrand (p, q, reduce proof1 reductions, reduce proof2 reductions)
  | SClor (p, q, _, _), [proof1; proof2] ->
     sclor (p, q, reduce proof1 reductions, reduce proof2 reductions)
  | SCror (p, q, _), [proof] ->
     scror (p, q, reduce proof reductions)
  | SClcontr (e, _), [proof] ->
     sclcontr (e, reduce proof reductions)
  | SCrcontr (e, _), [proof] ->
     scrcontr (e, reduce proof reductions)
  | SClall (e, t, _), [proof] ->
     sclall (e, t, reduce proof reductions)
  | SCrall (e, v, _), [proof] ->
     scrall (e, v, reduce proof reductions)
  | SClex (e, v, _), [proof] ->
     sclex (e, v, reduce proof reductions)
  | SCrex (e, t, _), [proof] ->
     screx (e, t, reduce proof reductions)
  | _ , _-> assert false

		   
