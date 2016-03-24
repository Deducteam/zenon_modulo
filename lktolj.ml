open Printf
open Expr
open Ljproof
       
type constructivisation =
  | LJ
  | LJN
  | LJG

let choice = ref LJ

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

let rec included l1 l2 =
  match l1 with
  | [] -> true
  | a :: l1 ->
     if List.memq a l2
     then included l1 (rm a l2)
     else false

let todo () =
  assert false	    

(* une formule active, LJ -> pas de delta, autres -> delta *)
let rec lktolj1 proof goal =
  let (gamma, delta) = Lkproof.sequent proof in
  let delta = rm goal delta in
  match Lkproof.lkproof proof, Lkproof.premises proof with
  (* choice != LK dans cette premiere partie *)
  | Lkproof.SCaxiom p, [] when (List.memq p delta) ->
     assert false
     (* let () = *)
     (*   match p with *)
     (*   | Evar _ *)
     (*   | Eapp _ -> () *)
     (*   | _ -> assert false in *)
     (* scaxiom (p) *)
  | Lkproof.SCweak (left, right, _), [proof] when (included right delta) ->
     lktolj1 proof goal
  | Lkproof.SCtrue, [] when (List.memq etrue delta) ->
     assert false
     (* sctrue *)
  | Lkproof.SCrnot (p, _), [proof] when (List.memq (enot p) delta) ->
     constructive_fail ()
  | Lkproof.SCrimply (p, q, _), [proof] when (List.memq (eimply (p, q)) delta) ->
     constructive_fail ()
  | Lkproof.SCrand (p, q, _, _), [proof1; proof2] when (List.memq (eand (p, q)) delta) ->
     begin
       match Lkproof.lkproof proof1, Lkproof.lkproof proof2 with
       | SCweak (left1, right1, _) , _ when (List.memq goal right1) ->
       	  assert false
       | _, SCweak (left2, right2, _) when (List.memq goal right2) ->
	  sccut (enot p,
       		 scrnot (p,
       			 sccut (enot q,
       				scrnot (q,
       					sclnot (eand (p, q),
       						scrand (p, q, scaxiom p, scaxiom q))),
       				lktolj2 proof2)),
       		 lktolj1 proof1 goal)
       | _ ->
	  begin
	    match !choice with
	    | LJ -> assert false
	    | LJN ->  constructive_fail ()
	    | LJG -> assert false
	  end
     end
  | Lkproof.SCror (p, q, _), [proof] when (List.memq (eor (p, q)) delta) ->
     sccut (enot p,
	    scrnot (p, sclnot (eor (p, q), scrorl (p, q, scaxiom p))) ,
	    sccut (enot q,
		   scrnot (q, sclnot (eor (p, q), scrorr (p, q, scaxiom q))),
		   lktolj1 proof goal))
  | Lkproof.SCrall (Eall (x, _, p, _) as ap, v, _), [proof] when (List.memq ap delta) ->
     constructive_fail ()
     (* let pv = substitute [(x, v)] p in *)
     (* scrall (ap, v, lktolj1 proof goal) *)
  | Lkproof.SCrex (Eex (x, _, p, _) as ep, t, _), [proof] when (List.memq ep delta) ->
     let pt = substitute [(x, t)] p in
     sccut (enot pt,
	    scrnot (pt, sclnot (ep, screx (ep, t, scaxiom pt))),
	    lktolj1 proof goal)
  | Lkproof.SCrcontr (e, _), [proof] when (List.memq e delta) ->
     assert false
	    
  | Lkproof.SCaxiom p, [] ->
     let () =
       match p with
       | Evar _
       | Eapp _ -> ()
       | _ -> assert false in
     scaxiom (p)
  | Lkproof.SCweak (left, right, _), [proof] ->
     scrweak(goal, lktolj2 proof)
  | Lkproof.SCfalse, [] ->
     assert false
  | Lkproof.SCtrue, [] ->
     sctrue
  | Lkproof.SClnot (p, _), [proof] ->
     begin
       match !choice with
       | LJ -> constructive_fail ()
       | LJN -> lktolj1 proof goal
       | LJG -> lktolj1 proof goal
     end
  | Lkproof.SCrnot (p, _), [proof] ->
     scrnot (p, lktolj2 proof)
  | Lkproof.SClimply (p, q, _, _), [proof1; proof2] ->
     begin
       match Lkproof.lkproof proof1 with
       | SCweak (left, right, _) when (List.memq goal right) ->
       	  let [proof1] = Lkproof.premises proof1 in
	  sclimply (p, q,
       		    lktolj1 proof1 p,
       		    lktolj1 proof2 goal)
       | _ ->
	  begin
	    match !choice with
	    | LJ -> constructive_fail ()
	    | _ ->
	       begin
		 match Lkproof.lkproof proof2 with
		 | SCweak (left, right, _) when (List.memq goal right) ->
       		    sccut (enot p,
			   scrnot (p, sclimply (p, q, scaxiom p, lktolj2 proof2)),
			   lktolj1 proof1 goal)
		 | _ ->
		    begin
		      match !choice with
		      | LJG ->
			 sccut (eimply (p, goal),
		      		scrimply (p, goal,
		      			  sclimply (p, q, scaxiom p, lktolj1 proof2 goal)),
		      		sccut (eimply (goal, goal),
		      		       scrimply (goal, goal, scaxiom goal),
		      		       lktolj3 proof1 goal [p; goal]))
		      | _ -> constructive_fail ()
		    end
	       end
	  end
     end
  | Lkproof.SCrimply (p, q, _), [proof] ->
     scrimply (p, q, lktolj1 proof q)
  | Lkproof.SCland (p, q, _), [proof] ->
     scland (p, q, lktolj1 proof goal)
  | Lkproof.SCrand (p, q, _, _), [proof1; proof2] ->
     scrand (p, q, lktolj1 proof1 p, lktolj1 proof2 q)
  | Lkproof.SClor (p, q, _, _), [proof1; proof2] ->
     sclor (p, q, lktolj1 proof1 goal, lktolj1 proof2 goal)
  | Lkproof.SCror (p, q, _), [proof] ->
     begin
       match Lkproof.lkproof proof with
       | SCweak (left, right, _) when (List.memq p right) ->
       	  let [proof] = Lkproof.premises proof in
	  scrorr (p, q,
       		  lktolj1 (Lkproof.scweak (left, rm p right, proof)) q)
       | SCweak (left, right, _) when (List.memq q right) ->
       	  let [proof] = Lkproof.premises proof in
	  scrorl (p, q,
       		  lktolj1 (Lkproof.scweak (left, rm q right, proof)) p)
       | _ ->
	  begin
	    match !choice with
	    | LJ -> constructive_fail ()
	    | LJN -> constructive_fail ()
	    | LJG ->
	       sccut (eimply (p, eor (p, q)),
		      scrimply (p, eor (p, q), scrorl (p, q, scaxiom p)),
		      sccut (eimply (q, eor (p, q)),
			     scrimply (q, eor (p, q), scrorr (p, q, scaxiom q)),
			     lktolj3 proof goal [p; q]))
	  end
     end
  | Lkproof.SClall (ap, t, _), [proof] ->
     sclall (ap, t, lktolj1 proof goal)
  | Lkproof.SCrall (Eall (x, _, p, _) as ap, v, _), [proof] ->
     let pv = substitute [(x, v)] p in
     scrall (ap, v, lktolj1 proof pv)
  | Lkproof.SClex (ep, v, _), [proof] ->
     sclex (ep, v, lktolj1 proof goal)
  | Lkproof.SCrex (Eex (x, _, p, _) as ep, t, _), [proof] ->
     let pt = substitute [(x, t)] p in
     screx (ep, t, lktolj1 proof pt)
  | Lkproof.SClcontr (e, _), [proof] ->
     sclcontr (e, lktolj1 proof goal)
  | Lkproof.SCrcontr (e, _), [proof] ->
     begin
       match !choice with
       | LJ -> constructive_fail ()
       | LJN -> constructive_fail ()
       | LJG ->
	  sccut (eimply (goal, goal),
		 scrimply (goal, goal, scaxiom goal),
		 sccut (eimply (goal, goal),
		      	scrimply (goal, goal, scaxiom goal),
		      	lktolj3 proof goal [goal; goal]))
     end
  | _, _ ->
     assert false

(* pas de formule, LJ -> pas de delta, autre -> delta *)
and lktolj2 proof =
  let (gamma, delta) = Lkproof.sequent proof in
  match Lkproof.lkproof proof, Lkproof.premises proof with
  | Lkproof.SCaxiom p, [] ->
     assert (!choice != LJ);
     sclnot (p, scaxiom (p))
  | Lkproof.SCweak (left, right, _), [proof] ->
     assert (!choice != LJ || right = []);
     lktolj2 proof
  | Lkproof.SCfalse, [] ->
     scfalse
  | Lkproof.SCtrue, [] ->
     assert (!choice != LJ);
     sclnot (etrue, sctrue)
  | Lkproof.SClnot (p, _), [proof] ->
     begin
       match !choice with
       | LJ -> sclnot (p, lktolj1 proof p)
       | LJN ->
	  lktolj2 proof
       | LJG ->
	  lktolj2 proof
     end
  | Lkproof.SCrnot (p, _), [proof] ->
     assert (!choice != LJ);
     sclnot (enot p, scrnot (p, lktolj2 proof))
  | Lkproof.SClimply (p, q, _, _), [proof1; proof2] ->
     begin
       match !choice with
       | LJ -> sclimply (p, q, lktolj1 proof1 p, lktolj2 proof2)
       | LJN ->
	  sccut (enot p,
   	  	 scrnot (p, sclimply (p, q, scaxiom (p), lktolj2 proof2)),
   	  	 lktolj2 proof1)
       | LJG ->
	  sccut (enot p,
   	  	 scrnot (p, sclimply (p, q, scaxiom (p), lktolj2 proof2)),
   	  	 lktolj2 proof1)
     end
  | Lkproof.SCrimply (p, q, _), [proof] ->
     assert (!choice != LJ);
     sccut (enot q,
     	    scrnot (q, sclnot (eimply (p, q), scrimply (p, q, scaxiom (q)))),
     	    sclnot (eimply (p, q), scrimply (p, q, scrweak (q, lktolj2 proof))))
  | Lkproof.SCland (p, q, _), [proof] ->
     scland (p, q, lktolj2 proof)
  | Lkproof.SCrand (p, q, _, _), [proof1; proof2] ->
     assert (!choice != LJ);
     sccut (enot p,
	    scrnot (p,
		    sccut (enot q,
			   scrnot (q,
				   sclnot (eand (p, q),
					   scrand (p, q, scaxiom p, scaxiom q))),
			   lktolj2 proof2)),
	    lktolj2 proof1)
  | Lkproof.SClor (p, q, _, _), [proof1; proof2] ->
     sclor (p, q, lktolj2 proof1, lktolj2 proof2)
  | Lkproof.SCror (p, q, _), [proof] ->
     assert (!choice != LJ);
     sccut (enot p,
	    scrnot (p, sclnot (eor (p, q), scrorl (p, q, scaxiom p))) ,
	    sccut (enot q,
		   scrnot (q, sclnot (eor (p, q), scrorr (p, q, scaxiom q))),
		   lktolj2 proof))
  | Lkproof.SClall (ap, t, _), [proof] ->
     sclall (ap, t, lktolj2 proof)
  | Lkproof.SCrall (Eall (x, _, p, _) as ap, v, _), [proof] ->
     let pv = substitute [(x, v)] p in
     assert (!choice != LJ);
     begin
       match delta with
       | [e] -> sclnot (ap, scrall (ap, v, lktolj1 proof pv))
       | _ -> constructive_fail ()
     end
  | Lkproof.SClex (ep, v, _), [proof] ->
     sclex (ep, v, lktolj2 proof)
  | Lkproof.SCrex (Eex (x, _, p, _) as ep, t, _), [proof] ->
     assert (!choice != LJ);
     let pt = substitute [(x, t)] p in
     sccut (enot pt,
	    scrnot (pt, sclnot (ep, screx (ep, t, scaxiom pt))),
	    lktolj2 proof)
  | Lkproof.SClcontr (e, _), [proof] ->
     sclcontr (e, lktolj2 proof)
  | Lkproof.SCrcontr (e, _), [proof] ->
     assert (!choice != LJ);
     sclcontr (enot e, lktolj2 proof)
  | _, _ ->
     assert false
	    
(* une formule passive, apparait seulement pour LJG *)
and lktolj3 proof goal branchs =
  if List.length branchs < 2
  then
    match branchs with
    | [] ->
       lktolj2 proof
    | [ngoal] ->
       sclimply (ngoal, goal,
       		 lktolj1 proof ngoal,
       		 scaxiom goal)
  else
    let (gamma, delta) = Lkproof.sequent proof in
    let delta = List.fold_left (fun delta branch -> rm branch delta) delta branchs in
    match Lkproof.lkproof proof, Lkproof.premises proof with
    (* | Lkproof.SCaxiom p, [] when (List.memq p delta) -> *)
    (* let () = *)
    (*   match p with *)
    (*   | Evar _ *)
    (*   | Eapp _ -> () *)
    (*   | _ -> assert false in *)
    (* scaxiom (p) *)
    (* | Lkproof.SCtrue, [] when (List.memq etrue delta) -> *)
    (*    assert false *)
    (*    (\* sctrue *\) *)
    (* | Lkproof.SCrand (p, q, _, _), [proof1; proof2] when (List.memq (eand (p, q)) delta) -> *)
    (*    begin *)
    (*      match Lkproof.lkproof proof1, Lkproof.lkproof proof2 with *)
    (*      | SCweak (left1, right1, _) , _ when (List.memq goal right1) -> *)
    (*      	  assert false *)
    (*      | _, SCweak (left2, right2, _) when (List.memq goal right2) -> *)
    (* 	  sccut (enot p, *)
    (*      		 scrnot (p, *)
    (*      			 sccut (enot q, *)
    (*      				scrnot (q, *)
    (*      					sclnot (eand (p, q), *)
    (*      						scrand (p, q, scaxiom p, scaxiom q))), *)
    (*      				lktolj2 proof2)), *)
    (*      		 lktolj3 proof1 goal) *)
    (*      | _ -> *)
    (* 	  begin *)
    (* 	    match !choice with *)
    (* 	    | LJ -> assert false *)
    (* 	    | LJN ->  constructive_fail () *)
    (* 	    | LJG -> assert false *)
    (* 	  end *)
    (*    end *)
    (* | Lkproof.SCror (p, q, _), [proof] when (List.memq (eor (p, q)) delta) -> *)
    (*    sccut (enot p, *)
    (* 	    scrnot (p, sclnot (eor (p, q), scrorl (p, q, scaxiom p))) , *)
    (* 	    sccut (enot q, *)
    (* 		   scrnot (q, sclnot (eor (p, q), scrorr (p, q, scaxiom q))), *)
    (* 		   lktolj3 proof goal)) *)
    (* | Lkproof.SCrex (Eex (x, _, p, _) as ep, t, _), [proof] when (List.memq ep delta) -> *)
    (*    let pt = substitute [(x, t)] p in *)
    (*    sccut (enot pt, *)
    (* 	    scrnot (pt, sclnot (ep, screx (ep, t, scaxiom pt))), *)
    (* 	    lktolj3 proof goal) *)
    (* | Lkproof.SCrcontr (e, _), [proof] when (List.memq e delta) -> *)
    (*    assert false *)
      
    (* | Lkproof.SCaxiom p, [] -> *)
    (*    todo () *)
    (* let () = *)
    (*   match p with *)
    (*   | Evar _ *)
    (*   | Eapp _ -> () *)
    (*   | _ -> assert false in *)
    (* scaxiom (p) *)
    | Lkproof.SCweak (left, right, _), [proof] ->
       let nbranchs =
	 List.fold_left
	   (fun branchs e ->
	    if List.mem e branchs
	    then rm e branchs
	    else branchs)
	   branchs right in
       lktolj3 proof goal nbranchs
    (* | Lkproof.SCfalse, [] -> *)
    (*    todo () *)
    (*    assert false *)
    (* | Lkproof.SCtrue, [] -> *)
    (*    todo () *)
    (*    sctrue *)
    | Lkproof.SClnot (p, _), [proof] ->
       lktolj3 proof goal branchs
    | Lkproof.SCrnot (p, _), [proof] ->
       constructive_fail ()
    | Lkproof.SClimply (p, q, _, _), [proof1; proof2] ->
       begin
	 match Lkproof.lkproof proof2 with
	 | SCweak (left, right, _) when (included branchs right) ->
       	    sccut (enot p,
	 	   scrnot (p, sclimply (p, q, scaxiom p, lktolj2 proof2)),
	 	   lktolj3 proof1 goal branchs)
	 | _ ->
	    sccut (eimply (p, goal),
	 	   scrimply (p, goal, sclimply (p, q, scaxiom p, lktolj3 proof2 goal branchs)),
	 	   lktolj3 proof1 goal (p :: branchs))
       end
    | Lkproof.SCrimply (p, q, _), [proof] ->
       constructive_fail ()
    | Lkproof.SCland (p, q, _), [proof] ->
       scland (p, q, lktolj3 proof goal branchs)
    (* | Lkproof.SCrand (p, q, _, _), [proof1; proof2] -> *)
    (*    todo () *)
    | Lkproof.SClor (p, q, _, _), [proof1; proof2] ->
       sclor (p, q, lktolj3 proof1 goal branchs, lktolj3 proof2 goal branchs)
    (* | Lkproof.SCror (p, q, _), [proof] -> *)
    (*    todo () *)
    (*    begin *)
    (*      match Lkproof.lkproof proof with *)
    (*      | SCweak (left, right, _) when (List.memq p right) -> *)
    (*      	  let [proof] = Lkproof.premises proof in *)
    (* 	  scrorr (p, q, *)
    (*      		  lktolj3 (Lkproof.scweak (left, rm p right, proof)) q) *)
    (*      | SCweak (left, right, _) when (List.memq q right) -> *)
    (*      	  let [proof] = Lkproof.premises proof in *)
    (* 	  scrorl (p, q, *)
    (*      		  lktolj3 (Lkproof.scweak (left, rm q right, proof)) p) *)
    (*      | _ -> *)
    (* 	  begin *)
    (* 	    match !choice with *)
    (* 	    | LJ -> constructive_fail () *)
    (* 	    | LJN -> constructive_fail () *)
    (* 	    | LJG -> *)
    (* 	       sccut (eimply (p, eor (p, q)), *)
    (* 		      scrorl (p, q, scaxiom p), *)
    (* 		      sccut (eimply (q, eor (p, q)), *)
    (* 			     scrorr (p, q, scaxiom q), *)
    (* 			     lktolj3 proof goal [p; q])) *)
    (* 	  end *)
    (*    end *)
    | Lkproof.SClall (ap, t, _), [proof] ->
       sclall (ap, t, lktolj3 proof goal branchs)
    | Lkproof.SCrall (Eall (x, _, p, _) as ap, v, _), [proof] ->
       constructive_fail ()
    | Lkproof.SClex (ep, v, _), [proof] ->
       sclex (ep, v, lktolj3 proof goal branchs)
    (* | Lkproof.SCrex (Eex (x, _, p, _) as ep, t, _), [proof] -> *)
    (*    todo () *)
    (*    let pt = substitute [(x, t)] p in *)
    (*    screx (ep, t, lktolj3 proof pt) *)
    | Lkproof.SClcontr (e, _), [proof] ->
       sclcontr (e, lktolj3 proof goal branchs)
    (* | Lkproof.SCrcontr (e, _), [proof] -> *)
    (*    todo () *)
    (*    begin *)
    (*      match !choice with *)
    (*      | LJ -> constructive_fail () *)
    (*      | LJN -> constructive_fail () *)
    (*      | LJG -> assert false *)
    (*    end *)
    | _, _ ->
       todo ()

	    
(* let rec kleene goal proof = *)
(*   (\* Lkproof.print (Lkproof.lkproof proof); *\) *)
(*   match goal with *)
(*   | Enot (e, _) -> *)
(*      Lkproof.scrnot (e, Lkproof.reduce proof [Lkproof.Right(enot e, [e],[])]) *)
(*   (\* | Eimply (e1, e2, _) -> constructive_fail () *\) *)
(*   (\* | Eand (e1, e2, _) -> constructive_fail () *\) *)
(*   (\*    (\\* let subgoals1, n1, conclusion1 = kleene e1 in *\\) *\) *)
(*   (\*    (\\* let subgoals2, n2, conclusion2 = kleene e2 in *\\) *\) *)
(*   (\*    (\\* subgoals1 @ subgoals2, *\\) *\) *)
(*   (\*    (\\* n1 + n2, *\\) *\) *)
(*   (\*    (\\* (fun subgoals -> *\\) *\) *)
(*   (\*    (\\*  let subgoals1, subgoals2 = select n1 subgoals in *\\) *\) *)
(*   (\*    (\\*  Lkproof.scrand (e1, e2, conclusion1 subgoals1, conclusion2 subgoals2)) *\\) *\) *)
(*   (\* | Eall (x, ty, e, _) -> constructive_fail () *\) *)
(*   | _ -> proof *)
		
(* Gödel Gentzen positif*)
let rec lktolj lkproof gamma goal =
  choice := LJG;
  (* let lkproof = kleene goal lkproof in *)
  (* let subgoals, _, conclusion = *)
  (*   kleene goal in *)
  (* assert false *)
  (* print (lktolj2 lkproof goal); *)
  lktolj1 lkproof goal
