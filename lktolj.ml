open Printf
open Expr
open Ljproof
       
let rec rm a list =
  match list with
  | x :: list when equal x a -> list
  | x :: list -> x :: (rm a list)
  | [] -> assert false

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
     eor (ctrexpr_neg e1, ctrexpr_neg e2)
  | Eimply (e1, e2, _) ->
     eimply (ctrexpr_pos e1, ctrexpr_neg e2)
  | Eall (e1, s, e2, _) ->
     eall (e1, s, ctrexpr_neg e2)
  | Eex (e1, s, e2, _) ->
     eex (e1, s, ctrexpr_neg e2)
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false

let rec lktolj_aux e proof =
  match e with
  | Efalse ->
     sccut (enot efalse,
	    scrnot (efalse, scfalse),
	    proof)
  | Etrue ->
     sctrue
  | Enot (e, _) ->
     scrnot (e,
	     sccut (enot (enot e),
		    scrnot (enot e,
			    sclnot (e, scaxiom e)),
		    proof))
  | Eand (e1, e2, _) ->
     sccut (enot (enot e),
	    scrnot (enot e,
		    proof),
	    scrand (e1, e2,
		    lktolj_aux
		      e1
		      (sclnot (enot e,
			       scrnot (e,
				       scland (e1, e2,
					       sclnot (e1, scaxiom e1))))),
		    lktolj_aux
		      e2
		      (sclnot (enot e,
			       scrnot (e,
				       scland (e1, e2,
					       sclnot (e2, scaxiom e2)))))))
  | Eimply (e1, e2, _) ->
     scrimply (e1, e2,
	       lktolj_aux
		 e2
		 (sccut (enot (eimply (e1, e2)),
			 scrnot (eimply (e1, e2),
				 sclnot (e2,
					 sclimply (e1, e2,
						   scaxiom e1,
						   scaxiom e2))),
			 proof)))
  | Eall (x, s, p, _) -> 
     let z = Llmtolk.new_tau () in
     let ez = substitute [(x, z)] p in
     scrall (e, z,
  	     lktolj_aux
  	       ez
  	       (sccut (enot e,
  		       scrnot (e,
  			       sclnot (ez,
  				       sclall (e, z, scaxiom ez))),
  		       proof)))
  | Evar _
  | Eapp _
  | Eor _
  | Eex _ ->
     assert false
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false

and xlktolj proof =
  match proof with
  | Lkproof.SCaxiom p ->
     let () =
       match p with
       | Evar _
       | Eapp _ -> ()
       | _ -> assert false in
     sclnot (enot (enot p),
	     scrnot (enot p,
		     sclnot (p, scaxiom p)))
  | Lkproof.SCweak (left, right, proof) ->
     xlktolj proof
  | Lkproof.SCfalse -> scfalse
  | Lkproof.SCtrue -> sclnot (etrue, sctrue)
  | Lkproof.SClnot (p, proof) ->
     xlktolj proof
  | Lkproof.SCrnot (p, proof) ->
     let p = ctrexpr_neg p in
     sclnot (enot p,
	    scrnot (p, xlktolj proof))
  | Lkproof.SClimply (p, q, proof1, proof2) ->
     let p = ctrexpr_pos p in
     let q = ctrexpr_neg q in
     sccut (enot p,
            scrnot (p,
                    sclimply (p, q,
			      scaxiom p,
			      xlktolj proof2)),
            xlktolj proof1)
  | Lkproof.SCrimply (p, q, proof) ->
     let p = ctrexpr_neg p in
     let q = ctrexpr_pos q in
     sccut (enot q,
	    scrnot (q,
		    sclnot (eimply (p, q),
			    scrimply (p, q, scaxiom q))),
	    sclnot (eimply (p, q),
		    scrimply (p, q,
			      scrweak (q, xlktolj proof))))
  | Lkproof.SCland (p, q, proof) ->
     let p = ctrexpr_neg p in
     let q = ctrexpr_neg q in
     scland (p, q, xlktolj proof)
  | Lkproof.SCrand (p, q, proof1, proof2) ->
     let p = ctrexpr_pos p in
     let q = ctrexpr_pos q in
     sccut (enot p,
	    scrnot (p,
		    sccut (enot q,
			   scrnot (q,
				   sclnot (eand (p, q),
					   scrand (p, q,
						   scaxiom p,
						   scaxiom q))),
			   xlktolj proof2)),
	    xlktolj proof1)    
  | Lkproof.SClor (p, q, proof1, proof2) ->
     let p = ctrexpr_neg p in
     let q = ctrexpr_neg q in
     sclor (p, q, xlktolj proof1, xlktolj proof2)
  | Lkproof.SCror (p, q, proof) ->
     let p = ctrexpr_pos p in
     let q = ctrexpr_pos q in
     sclnot (enot (enot (eor (p, q))),
	 scrnot (enot (eor (p, q)),
	     sccut (enot p,
		    scrnot (p,
			    sclnot (eor (p, q),
				    scrorl (p, q,
					    scaxiom p))),
		    sccut (enot q,
			   scrnot (q,
				   sclnot (eor (p, q),
					   scrorr(p, q,
						  scaxiom q))),
			   xlktolj proof))))
  (* | Lkproof.SClall of expr * expr * lkproof *)
  | Lkproof.SCrall (Eall (x, ty, p, _) as ap, v, proof) ->
     let ap = ctrexpr_pos ap in
     let p = ctrexpr_pos p in
     let pv = substitute [(x, v)] p in
     sclnot (ap,
	     scrall (ap, v,
		    lktolj_aux pv (xlktolj proof)))
  (* | Lkproof.SClex of expr * expr * lkproof *)
  | Lkproof.SCrex (Eex (x, ty, p, _), t, proof) ->
     let p = ctrexpr_pos p in
     let ep = eex (x, ty, p) in
     let pt = substitute [(x, t)] p in
     sclnot (enot (enot ep),
	 scrnot (enot ep,
		 sccut (enot pt,
			scrnot (pt,
				sclnot (ep,
					screx (ep, t, scaxiom pt))),
			xlktolj proof)))
  | Lkproof.SClcontr (e, proof) ->
     let e = ctrexpr_neg e in
     sclcontr (e, xlktolj proof)
  | Lkproof.SCrcontr (e, proof) ->
     let e = ctrexpr_pos e in
     sclcontr (enot e, xlktolj proof)
  | _ -> assert false
  
(* Gödel Gentzen positif*)
let lktolj lkproof goal = 
  (* Lkproof.print lkproof; *)
  let ljproof = xlktolj lkproof in
  (* print (lktolj_aux (ctrexpr_pos goal) ljproof); *)
  lktolj_aux (ctrexpr_pos goal) ljproof
