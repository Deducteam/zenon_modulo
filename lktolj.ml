open Printf
open Expr
open Ljproof
       
let rec rm a list =
  match list with
  | x :: list when equal x a -> list
  | x :: list -> x :: (rm a list)
  | [] -> assert false

(* let rec lktolj_aux e proof = *)
(*   match e with *)
(*   | Efalse -> *)
(*      sccut (enot efalse, *)
(* 	    scrnot (efalse, scfalse), *)
(* 	    proof) *)
(*   | Etrue -> *)
(*      sctrue *)
(*   | Enot (e, _) -> *)
(*      scrnot (e, *)
(* 	     sccut (enot (enot e), *)
(* 		    scrnot (enot e, *)
(* 			    sclnot (e, scaxiom e)), *)
(* 		    proof)) *)
(*   | Eand (e1, e2, _) -> *)
(*      sccut (enot (enot e), *)
(* 	    scrnot (enot e, *)
(* 		    proof), *)
(* 	    scrand (e1, e2, *)
(* 		    lktolj_aux *)
(* 		      e1 *)
(* 		      (sclnot (enot e, *)
(* 			       scrnot (e, *)
(* 				       scland (e1, e2, *)
(* 					       sclnot (e1, scaxiom e1))))), *)
(* 		    lktolj_aux *)
(* 		      e2 *)
(* 		      (sclnot (enot e, *)
(* 			       scrnot (e, *)
(* 				       scland (e1, e2, *)
(* 					       sclnot (e2, scaxiom e2))))))) *)
(*   | Eimply (e1, e2, _) -> *)
(*      scrimply (e1, e2, *)
(* 	       lktolj_aux *)
(* 		 e2 *)
(* 		 (sccut (enot (eimply (e1, e2)), *)
(* 			 scrnot (eimply (e1, e2), *)
(* 				 sclnot (e2, *)
(* 					 sclimply (e1, e2, *)
(* 						   scaxiom e1, *)
(* 						   scaxiom e2))), *)
(* 			 proof))) *)
(*   | Eall (x, s, p, _) ->  *)
(*      let z = Llmtolk.new_tau () in *)
(*      let ez = substitute [(x, z)] p in *)
(*      scrall (e, z, *)
(*   	     lktolj_aux *)
(*   	       ez *)
(*   	       (sccut (enot e, *)
(*   		       scrnot (e, *)
(*   			       sclnot (ez, *)
(*   				       sclall (e, z, scaxiom ez))), *)
(*   		       proof))) *)
(*   | Evar _ *)
(*   | Eapp _ *)
(*   | Eor _ *)
(*   | Eex _ -> *)
(*      assert false *)
(*   | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false *)

let constructive_fail () =
  assert false
	 
let rec rm a list =
  match list with
  | x :: list when equal x a -> list
  | x :: list -> x :: (rm a list)
  | [] -> assert false
  
(* and lktolj1 proof goal = *)
(*   match proof with *)
(*   | Lkproof.SCaxiom p when equal p goal -> *)
(*      scaxiom p, (fun [proof] -> proof) *)
(*   | Lkproof.SCaxiom p -> *)
(*      let () = *)
(*        match p with *)
(*        | Evar _ *)
(*        | Eapp _ -> () *)
(*        | _ -> assert false in *)
(*      sclimply (p, goal, *)
(*   	       scaxiom (p), *)
(*   	       scaxiom (goal)) *)
(*   | Lkproof.SCweak (left, right, proof) when List.memq goal right -> *)
(*      constructive_fail () *)
(*   | Lkproof.SCweak (left, right, proof) -> *)
(*      lktolj1 proof goal *)
(*   | Lkproof.SCfalse -> *)
(*      scfalse *)
(*   | Lkproof.SCtrue when equal goal etrue -> *)
(*      sctrue *)
(*   | Lkproof.SCtrue -> *)
(*      sclimply (etrue, goal, *)
(*   	       sctrue, *)
(*   	       scaxiom (goal)) *)
(*   | Lkproof.SClnot (p, proof) -> *)
(*      sccut (eimply (p, goal), *)
(*   	    scrimply (p, goal, scrweak (goal, sclnot (p, scaxiom (p)))), *)
(*   	    lktolj1 proof goal) *)
(*   | Lkproof.SCrnot (p, proof) when equal goal (enot p) -> *)
(*      constructive_fail () *)
(*   | Lkproof.SCrnot (p, proof) -> *)
(*      constructive_fail () *)
(*   | Lkproof.SClimply (p, q, proof1, proof2) -> *)
(*      sccut (eimply (p, goal), *)
(*   	    scrimply (p, goal, sclimply (p, q, scaxiom (p), lktolj1 proof2 goal)), *)
(*   	    lktolj1 proof1 goal) *)
(*   | Lkproof.SCrimply (p, q, proof) when equal goal (eimply (p, q))-> *)
(*      constructive_fail () *)
(*   | Lkproof.SCrimply (p, q, proof) -> *)
(*      constructive_fail () *)
(*   | Lkproof.SCland (p, q, proof) -> *)
(*      scland (p, q, lktolj1 proof goal) *)
(*   | Lkproof.SCrand (p, q, proof1, proof2) when equal goal (eand (p, q)) -> *)
(*      constructive_fail () *)
(*   | Lkproof.SCrand (p, q, proof1, proof2) -> *)
(*      sccut (eimply (p, goal), *)
(*   	    scrimply (p, goal, *)
(*   		      sccut (eimply (q, goal), *)
(*   			     scrimply (q, goal, *)
(*   				       sclimply (eand (p, q), goal, *)
(*   						 (scrand (p, q, scaxiom p, scaxiom q)), *)
(*   						 (scaxiom goal))), *)
(*   			     lktolj1 proof2 goal)), *)
(*   	    lktolj1 proof1 goal) *)
(*   | Lkproof.SClor (p, q, proof1, proof2) -> *)
(*      sclor (p, q, lktolj1 proof1 goal, lktolj1 proof2 goal) *)
(*   | Lkproof.SCror (p, q, proof) when equal goal (eor (p, q)) -> *)
(*      constructive_fail () *)
(*   | Lkproof.SCror (p, q, proof) -> *)
(*      sccut (eimply (p, goal), *)
(*      	    scrimply (p, goal, *)
(*      		      sclimply (eor (p, q), goal, *)
(*      				scrorl (p, q, scaxiom p), *)
(*      				scaxiom goal)), *)
(*      	    sccut (eimply (q, goal), *)
(*      		   scrimply (q, goal, *)
(*      			     sclimply (eor (p, q), goal, *)
(*      				       scrorr (p, q, scaxiom q), *)
(*      				       scaxiom goal)), *)
(*      		   lktolj1 proof goal)) *)
(*   | Lkproof.SClall (ap, t, proof) -> *)
(*      sclall (ap, t, lktolj1 proof goal) *)
(*   | Lkproof.SCrall (Eall (x, ty, p, _) as ap, v, proof) when equal goal ap -> *)
(*      let pv = substitute [(x, v)] p in *)
(*      constructive_fail () *)
(*   | Lkproof.SCrall (Eall (x, ty, p, _) as ap, v, proof) -> *)
(*      constructive_fail () *)
(*   | Lkproof.SClex (ep, v, proof) -> *)
(*      sclex (ep, v, lktolj1 proof goal) *)
(*   | Lkproof.SCrex (Eex (x, ty, p, _) as ep, t, proof) when equal goal ep -> *)
(*      constructive_fail () *)
(*   | Lkproof.SCrex (Eex (x, ty, p, _) as ep, t, proof) -> *)
(*      let pt = substitute [(x, t)] p in *)
(*      sccut (eimply (pt, goal), *)
(*   	    scrimply (pt, goal, *)
(*   		      sclimply (ep, goal, *)
(*   				screx (ep, t, scaxiom pt), *)
(*   				scaxiom goal)), *)
(*   	    lktolj1 proof goal) *)
(*   | Lkproof.SClcontr (e, proof) -> *)
(*      sclcontr (e, lktolj1 proof goal) *)
(*   | Lkproof.SCrcontr (e, proof) when equal goal e -> *)
(*      constructive_fail () *)
(*   | Lkproof.SCrcontr (e, proof) -> *)
(*      constructive_fail () *)
(*   (\* sclcontr (eimply (e, goal), lktolj1 proof goal) *\) *)
(*   | _ -> *)
(*      assert false *)

(* une formule, pas de delta *)		 
and lktolj1 proof =  
  let (gamma, [goal]) = Lkproof.sequent proof in
  match Lkproof.lkproof proof, Lkproof.premises proof with
  | Lkproof.SCaxiom p, [] ->
     let () =
       match p with
       | Evar _
       | Eapp _ -> ()
       | _ -> assert false in
     scaxiom (p)
  | Lkproof.SCweak (left, right, _), [proof] ->
     begin
       match right with
       | [] -> lktolj1 proof
       | [e] -> scrweak(e, lktolj2 proof)
       | _ -> assert false
     end
  | Lkproof.SCfalse, [] ->
     assert false
  | Lkproof.SCtrue, [] ->
     sctrue
  | Lkproof.SClnot (p, _), [proof] ->
     constructive_fail ()
  | Lkproof.SCrnot (p, _), [proof] ->
     scrnot (p, lktolj2 proof)
  | Lkproof.SClimply (p, q, _, _), [proof1; proof2] ->
     begin
       match Lkproof.lkproof proof1 with
       | SCweak (left, right, _) when (List.memq goal right) ->
       	  let [proof] = Lkproof.premises proof1 in
	    sclimply (p, q,
       		    lktolj1 (Lkproof.scweak (left, rm goal right, proof)),
       		    lktolj1 proof2)
       | _ -> constructive_fail ()
     end
  | Lkproof.SCrimply (p, q, _), [proof] ->
     scrimply (p, q, lktolj1 proof)
  | Lkproof.SCland (p, q, _), [proof] ->
     scland (p, q, lktolj1 proof)
  | Lkproof.SCrand (p, q, _, _), [proof1; proof2] ->
     scrand (p, q, lktolj1 proof1, lktolj1 proof2)
  | Lkproof.SClor (p, q, _, _), [proof1; proof2] ->
     sclor (p, q, lktolj1 proof1, lktolj1 proof2)
  | Lkproof.SCror (p, q, _), [proof] ->
     begin
       match Lkproof.lkproof proof with
       | SCweak (left, right, _) when (List.memq p right) ->
       	  let [proof] = Lkproof.premises proof in
	  scrorr (p, q,
       		  lktolj1 (Lkproof.scweak (left, rm p right, proof)))
       | SCweak (left, right, _) when (List.memq q right) ->
       	  let [proof] = Lkproof.premises proof in
	  scrorl (p, q,
       		  lktolj1 (Lkproof.scweak (left, rm q right, proof)))
       | _ -> constructive_fail ()
     end
  | Lkproof.SClall (ap, t, _), [proof] ->
     sclall (ap, t, lktolj1 proof)
  | Lkproof.SCrall (Eall (x, _, p, _) as ap, v, _), [proof] ->
     let pv = substitute [(x, v)] p in
     scrall (ap, v, lktolj1 proof)
  | Lkproof.SClex (ep, v, _), [proof] ->
     sclex (ep, v, lktolj1 proof)
  | Lkproof.SCrex (Eex (x, _, p, _) as ep, t, _), [proof] ->
     let pt = substitute [(x, t)] p in
     screx (ep, t, lktolj1 proof)
  | Lkproof.SClcontr (e, _), [proof] ->
     sclcontr (e, lktolj1 proof)
  | Lkproof.SCrcontr (e, _), [proof] ->
     constructive_fail ()
  | _, _ ->
     assert false

(* pas de formule, pas de delta *)
and lktolj2 proof =
  match Lkproof.lkproof proof, Lkproof.premises proof with
  | Lkproof.SCaxiom p, [] ->
     assert false
  | Lkproof.SCweak (left, right, _), [proof] ->
     assert (right = []);
     lktolj2 proof
  | Lkproof.SCfalse, [] ->
     scfalse
  | Lkproof.SCtrue, [] ->
     assert false
  | Lkproof.SClnot (p, _), [proof] ->
     (* LJ pur -> lktolj1, LJG -> lktolj2 *)
     sclnot (p, lktolj1 proof) (* LJ pur *)
  (*    sccut (eimply (p, goal), *)
  (* 	    scrimply (p, goal, scrweak (goal, sclnot (p, scaxiom (p)))), *)
  (* 	    lktolj2 proof goal) *)
  | Lkproof.SCrnot (p, _), [proof] ->
     assert false
  | Lkproof.SClimply (p, q, _, _), [proof1; proof2] ->
     (* LJ pur -> lktolj1, LJG -> lktolj2 *)
     sclimply (p, q, lktolj1 proof1, lktolj2 proof2) (* LJ pur *)
  (*    sccut (eimply (p, goal), *)
  (* 	    scrimply (p, goal, sclimply (p, q, scaxiom (p), lktolj2 proof2 goal)), *)
  (* 	    lktolj2 proof1 goal) *)
  | Lkproof.SCrimply (p, q, _), [proof] ->
     assert false
  | Lkproof.SCland (p, q, _), [proof] ->
     scland (p, q, lktolj2 proof)
  | Lkproof.SCrand (p, q, _, _), [proof1; proof2] ->
     assert false
  | Lkproof.SClor (p, q, _, _), [proof1; proof2] ->
     sclor (p, q, lktolj2 proof1, lktolj2 proof2)
  | Lkproof.SCror (p, q, _), [proof] ->
     assert false
  | Lkproof.SClall (ap, t, _), [proof] ->
     sclall (ap, t, lktolj2 proof)
  | Lkproof.SCrall (Eall (x, _, p, _) as ap, v, _), [proof] ->
     assert false
  | Lkproof.SClex (ep, v, _), [proof] ->
     sclex (ep, v, lktolj2 proof)
  | Lkproof.SCrex (Eex (x, _, p, _) as ep, t, _), [proof] ->
     assert false
  | Lkproof.SClcontr (e, _), [proof] ->
     sclcontr (e, lktolj2 proof)
  | Lkproof.SCrcontr (e, _), [proof] ->
     assert false
  | _, _ ->
     assert false

			   
(* let rec select_aux n l1 l2 = *)
(*   if n = 0 *)
(*   then l1, l2 *)
(*   else *)
(*     match l1 with *)
(*     | e :: l2 -> select_aux (n-1) (e :: l1) l2 *)
(*     | _ -> assert false *)
(* let select n list = *)
(*   let l1, l2 = select_aux n [] list in *)
(*   List.rev_append l1 [], l2 *)
  
(* let rec kleene goal = *)
(*   match goal with *)
(*   | Enot (e1, _) -> assert false *)
(*   | Eimply (e1, e2, _) -> assert false *)
(*   | Eand (e1, e2, _) -> *)
(*      let subgoals1, n1, conclusion1 = kleene e1 in *)
(*      let subgoals2, n2, conclusion2 = kleene e2 in *)
(*      subgoals1 @ subgoals2, *)
(*      n1 + n2, *)
(*      (fun subgoals -> *)
(*       let subgoals1, subgoals2 = select n1 subgoals in *)
(*       Lkproof.scrand (e1, e2, conclusion1 subgoals1, conclusion2 subgoals2)) *)
(*   | Eall (x, ty, e, _) -> assert false *)
(*   | _ -> assert false *)
		
(* Gödel Gentzen positif*)
let rec lktolj lkproof gamma goal =
  (* let subgoals, _, conclusion = *)
  (*   kleene goal in *)
  (* assert false *)
  (* print (lktolj2 lkproof goal); *)
  lktolj1 lkproof
