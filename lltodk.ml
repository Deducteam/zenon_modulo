(*  Copyright 2004 INRIA  *)
Version.add "$Id$";;

open Printf;;

open Expr;;
open Llproof;;
open Dkterm;;



let rec trexpr_dktype e =
  Log.debug 10 "dktype %a" Print.pp_expr e;
  match e with 
  | e when (Expr.equal e type_type) -> 
     mk_type
  | e when (Expr.equal e type_prop) -> 
     mk_prop
  | e when (Expr.equal e type_none) -> 
     assert false
  | Evar (s, _) -> 
     mk_var (s, trexpr_dktype (get_type e))
  | Eapp (Evar(s, _) as s', args, _) -> 
     let nvar = mk_var (s, trexpr_dktype (get_type s')) in 
     let nargs = List.map trexpr_dktype args in 
     mk_app (nvar, nargs)
  | Earrow (args, ret, _) 
       when (Expr.equal ret type_type) -> 
     let nret = trexpr_dktype ret in 
     let nargs = List.map trexpr_dktype args in 
     mk_arrow (nargs @ [nret])
  | Eall (Evar(v, _) as v', p, _) 
       when Expr.equal (get_type v') type_type -> 
     let nvar = mk_var (v, mk_type) in 
     let np = 
       match p with 
       | Eapp (Evar(s, _) as s', args, _) -> 
	  let nvar = mk_var (s, trexpr_dktype (get_type s')) in 
	  let nargs = List.map trexpr_dktype args in
	  mk_term (mk_app (nvar, nargs))
       | Earrow (args, ret, _) when (Expr.equal ret type_prop) -> 
	  let nret = trexpr_dktype ret in 
	  let nargs = List.map (fun x -> mk_term (trexpr_dktype x)) args in 
	  mk_arrow (nargs @ [nret])
       | Earrow (args, ret, _) -> 
	  let nret = mk_term (trexpr_dktype ret) in 
	  let nargs = List.map (fun x -> mk_term (trexpr_dktype x)) args in 
	  mk_arrow (nargs @ [nret])
       | Eall (Evar (v2, _) as v2', p2, _) 
	      when Expr.equal (get_type v2') type_type -> 
	  trexpr_dktype p
       | _ -> assert false
     in
     mk_pi (nvar, np)
  | Etau _ as e 
    when Expr.equal (get_type e) type_type -> 
     let v = Printf.sprintf "Tau_%d" (Index.get_number e) in 
     mk_var (v, mk_type)
  | Etau _ as e -> 
     let v = Printf.sprintf "Tau_%d" (Index.get_number e) in 
     let ty = mk_term (trexpr_dktype (get_type e)) in 
     mk_var (v, ty)
  | _ -> assert false
;;

let trexpr_dkvartype e = 
  Log.debug 15 "dkvartype %a" Print.pp_expr e;
  match e with
  | Evar (s, _) when (Expr.equal (get_type e) type_type) -> 
     mk_var (s, mk_type) 
  | Evar (s, _) -> 
     mk_var (s, mk_term (trexpr_dktype (get_type e)))
  | _ -> assert false
;;

let rec translate_sigs_aux s accu = 
  match s with 
  | [] -> List.rev accu
  | (v, s) :: tl -> 
     let ns = trexpr_dktype s in 
     translate_sigs_aux tl ((v, ns) :: accu)
;;

let translate_sigs s = 
  translate_sigs_aux s []
;;

let rec get_freevars_aux accu e = 
  match e with 
  | Evar _ when (List.exists (fun x -> (Expr.equal x e)) accu) -> 
     accu
  | Evar _ -> (e :: accu)
  | Eapp (_, args, _) -> 
     List.fold_left get_freevars_aux accu args
  | _ -> assert false
;;

let get_freevars e = 
  get_freevars_aux [] e
;;

let tr_list_vars rule = 
  match rule with 
  | (l, r) -> 
     let vars = get_freevars l in 
     let nvars = List.map trexpr_dkvartype vars in 
     List.rev nvars
;;

let rec trexpr_dkprop e = 
  Log.debug 10 "dkprop %a" Print.pp_expr e;
  match e with 
  | e when (Expr.equal e type_type) -> 
     mk_type
  | e when (Expr.equal e type_prop) -> 
     mk_prop
  | e when (Expr.equal e type_none) -> 
     assert false  
  | Evar _ -> 
     trexpr_dkvartype e 
  | Emeta _ -> 
     assert false
  | Eapp (Evar(s, _) as s', args, _) -> 
     let nvar = trexpr_dkvartype s' in 
     let nargs = List.map trexpr_dkprop args in 
     mk_app (nvar, nargs)
  | Eapp _ -> assert false
  | Earrow (args, ret, _)  -> 
     let nret = trexpr_dkprop ret in 
     let nargs = List.map trexpr_dkprop args in 
     mk_arrow (nargs @ [nret])
  | Enot (e1, _) -> mk_not (trexpr_dkprop e1)
  | Eand (e1, e2, _) -> mk_and (trexpr_dkprop e1, trexpr_dkprop e2)
  | Eor (e1, e2, _) -> mk_or (trexpr_dkprop e1, trexpr_dkprop e2)
  | Eimply (e1, e2, _) -> mk_imply (trexpr_dkprop e1, trexpr_dkprop e2)
  | Eequiv (e1, e2, _) -> mk_equiv (trexpr_dkprop e1, trexpr_dkprop e2)
  | Etrue -> mk_true
  | Efalse -> mk_false
  | Eall (Evar (v, _) as v', p, _) 
       when Expr.equal (get_type v') type_type -> 
     mk_foralltype (mk_lam (trexpr_dkvartype v', trexpr_dkprop p))
  | Eall (Evar (v, _) as v', p, _) -> 
     let nv = trexpr_dkvartype v' in 
     let tnv = get_dkvar_type nv in 
     mk_forall (tnv, (mk_lam (nv, trexpr_dkprop p)))
  | Eall _ -> assert false
  | Eex (Evar (v, _) as v', p, _) 
       when Expr.equal (get_type v') type_type -> 
     mk_existstype (mk_lam (trexpr_dkvartype v', trexpr_dkprop p))
  | Eex (Evar (v, _) as v', p, _) -> 
     let nv = trexpr_dkvartype v' in 
     let tnv = get_dkvar_type nv in 
     mk_exists (tnv, (mk_lam (nv, trexpr_dkprop p)))
  | Eex _ -> assert false
  | Etau _ as e 
       when Expr.equal (get_type e) type_type -> 
     let v = Printf.sprintf "Tau_%d" (Index.get_number e) in 
     mk_var (v, mk_type)
  | Etau _ as e -> 
     let v = Printf.sprintf "Tau_%d" (Index.get_number e) in 
     let ty = mk_term (trexpr_dktype (get_type e)) in 
     mk_var (v, ty)
  | Elam (Evar (v, _) as v', p, _) -> 
     let nv = trexpr_dkvartype v' in 
     mk_lam (nv, trexpr_dkprop p)
  | Elam _ -> assert false
;;

let build_dkrwrt rule = 
  match rule with 
  | (l, r) -> 
     let vars = tr_list_vars rule in 
     let t1 = trexpr_dkprop l in 
     let t2 = trexpr_dkprop r in 
     mk_rwrt (vars, t1, t2)
;;

let select_goal_aux accu phrase = 
  match phrase with 
  | Phrase.Hyp (name, body, flag) when flag == 0 -> 
     (name, body) :: accu
  | _ -> accu
;;

let select_goal phrases = 
  List.fold_left select_goal_aux [] phrases
;;

let trexpr_dkgoal e = 
  assert (List.length e == 1);
  let goal = List.hd e in 
  mk_proof (trexpr_dkprop goal)
;;

let get_type_binder e = 
  match e with 
  | Eex (v, _, _) 
  | Eall (v, _, _) 
  | Enot (Eex (v, _, _), _) 
  | Enot (Eall (v, _, _), _) -> 
     get_type v 
  | Elam (v, _, _) -> 
     get_type v
  | _ -> assert false
;;

let is_binder_of_type_var e = 
  Expr.equal (get_type_binder e) type_type
;;

let extract_prooftree lemmas = 
  match lemmas with 
  | [] -> assert false
  | [lemma] -> 
     let prooftree = match lemma with 
       | {proof = p} -> p
     in
     prooftree
  | _ -> assert false
;;

let trexpr_quant_to_dklam p = 
  match p with 
  | Eall (v, body, _) -> 
     let nv = trexpr_dkvartype v in 
     let nbody = trexpr_dkprop body in 
     mk_lam (nv, nbody)
  | _ -> assert false
;;

let is_equal_mod e1 e2 =
  Log.debug 9 " |- is equal mod";
  Log.debug 9 "   |- e1 : %a" Print.pp_expr e1;
  Log.debug 9 "   |- e2 : %a" Print.pp_expr e2;
  Log.debug 9 "   |- normalize e1 : %a" 
	    Print.pp_expr (Rewrite.normalize_fm e1);
  Expr.equal (Rewrite.normalize_fm e1) e2
;;

let mk_var_prfObj p = 
  let v = "prf_"^(Expr.newname()) in 
  mk_var (v, mk_proof p)
;;

let rec trproof_dk p = 
  match p with 
  | {conc = lconc; 
     rule = llrule;
     hyps = proofs;} 
    -> 
     Log.debug 7 "Proof step %a" Print.pr_llrule llrule;
     Log.debug 8 " |- conc";
     List.iter (fun x -> Log.debug 8 "  |- %a" Print.pp_expr x) lconc;
     match llrule with 
     | Rfalse -> 
	assert (List.length proofs == 0);
	mk_DkRfalse
     | Rnottrue -> 
	assert (List.length proofs == 0);
	mk_DkRnottrue
     | Raxiom (p) -> 
	assert (List.length proofs == 0);
	let np = trexpr_dkprop p in 
	mk_DkRaxiom (np)
     | Rcut (p) -> 
	assert (List.length proofs == 2);
	let np = trexpr_dkprop p in 
	mk_DkRcut (np, 
		   trproof_dk (List.nth proofs 0), 
		   trproof_dk (List.nth proofs 1))
     | Rnoteq (t) ->  
	assert (List.length proofs == 0);
	let a = trexpr_dktype (get_type t) in 
	let nt = trexpr_dkprop t in 
	mk_DkRnoteq (a, nt)
     | Reqsym (t, u) -> 
	assert (List.length proofs == 0);
	let a = trexpr_dktype (get_type t) in 
	let nt = trexpr_dkprop t in 
	let nu = trexpr_dkprop u in 
	mk_DkReqsym  (a, nt, nu)
     | Rnotnot (p) -> 
	assert (List.length proofs == 1);
	let np = trexpr_dkprop p in 
	mk_DkRnotnot (np, 
		      trproof_dk (List.nth proofs 0))
     | Rconnect (And, p, q) -> 
	assert (List.length proofs == 1);
	let np = trexpr_dkprop p in 
	let nq = trexpr_dkprop q in 
	let param = 
	  if (List.length (List.nth proofs 0).conc == 2) then 
	    trproof_dk (List.nth proofs 0)
	  else if (List.length (List.nth proofs 0).conc == 1) then
	    let prf_P = mk_var_prfObj np in
	    let prf_Q = mk_var_prfObj nq in
	    let conc = List.nth (List.nth proofs 0).conc 0 in
	    if (is_equal_mod p conc) then 
	      mk_lam (prf_P, 
		      mk_lam (prf_Q, mk_app (trproof_dk (List.nth proofs 0), 
					     [prf_P])))
	    else if (is_equal_mod q conc) then 
	      mk_lam (prf_P, trproof_dk (List.nth proofs 0))
	    else assert false
	  else assert false
	in
	mk_DkRand (np, nq, param)
     | Rconnect (Or, p, q) -> 
	assert (List.length proofs == 2);
        let np = trexpr_dkprop p in 
	let nq = trexpr_dkprop q in 
	mk_DkRor (np, nq, 
		  trproof_dk (List.nth proofs 0), 
		  trproof_dk (List.nth proofs 1))
     | Rconnect (Imply, p, q) -> 
	assert (List.length proofs == 2);
        let np = trexpr_dkprop p in 
	let nq = trexpr_dkprop q in 
	mk_DkRimply (np, nq, 
		     trproof_dk (List.nth proofs 0), 
		     trproof_dk (List.nth proofs 1))
     | Rconnect (Equiv, p, q) -> 
	assert (List.length proofs == 2);
        let np = trexpr_dkprop p in 
	let nq = trexpr_dkprop q in 
	let prf_P = mk_var_prfObj np in 
	let prf_nP = mk_var_prfObj (mk_not np) in 
	let prf_Q = mk_var_prfObj nq in 
	let prf_nQ = mk_var_prfObj (mk_not nq) in 
	let param0 =  
	  if (List.length (List.nth proofs 0).conc == 2) then 
	    trproof_dk (List.nth proofs 0)
	  else if (List.length (List.nth proofs 0).conc == 1) then
	    let conc0 = List.nth (List.nth proofs 0).conc 0 in
	    if (is_equal_mod (enot p) conc0) then 
	      mk_lam (prf_nP, 
		      mk_lam (prf_nQ, 
			      mk_app (trproof_dk (List.nth proofs 0), 
				      [prf_nP])))
	    else if (is_equal_mod (enot q) conc0) then 
	      mk_lam (prf_nP, 
		      trproof_dk (List.nth proofs 0))
	    else assert false
	  else assert false
	in
	let param1 = 
	  if (List.length (List.nth proofs 1).conc == 2) then 
	    trproof_dk (List.nth proofs 1)
	  else if (List.length (List.nth proofs 1).conc == 1) then
	    let conc1 = List.nth (List.nth proofs 1).conc 0 in
	    if (is_equal_mod p conc1) then 
	      mk_lam (prf_P, 
		      mk_lam (prf_Q, 
			    mk_app (trproof_dk (List.nth proofs 1),
				    [prf_P])))
	    else if (is_equal_mod q conc1) then 
	      mk_lam (prf_P, 
		      trproof_dk (List.nth proofs 1))
	    else assert false
	  else assert false 
	in 
        mk_DkRequiv (np, nq, param0, param1)
     | Rnotconnect (And, p, q) -> 
	assert (List.length proofs == 2);
	let np = trexpr_dkprop p in 
	let nq = trexpr_dkprop q in 
	mk_DkRnotand (np, nq, 
		      trproof_dk (List.nth proofs 0),
		      trproof_dk (List.nth proofs 1))
     | Rnotconnect (Or, p, q) -> 
	assert (List.length proofs == 1);
        let np = trexpr_dkprop p in 
	let nq = trexpr_dkprop q in
	let param = 
	  if (List.length (List.nth proofs 0).conc == 2) then 
	    trproof_dk (List.nth proofs 0)
	  else if (List.length (List.nth proofs 0).conc == 1) then
	    let prf_nP = mk_var_prfObj (mk_not np) in
	    let prf_nQ = mk_var_prfObj (mk_not nq) in 
	    let conc = List.nth (List.nth proofs 0).conc 0 in
	    if (is_equal_mod (enot p) conc) then 
	      mk_lam (prf_nP, 
		      mk_lam (prf_nQ, mk_app (trproof_dk (List.nth proofs 0), 
					      [prf_nP])))
	    else if (is_equal_mod (enot q) conc) then 
	      mk_lam (prf_nP, trproof_dk (List.nth proofs 0))
	    else assert false
	  else assert false
	in
	mk_DkRnotor (np, nq, param) 
     | Rnotconnect (Imply, p, q) -> 
	assert (List.length proofs == 1);
        let np = trexpr_dkprop p in 
	let nq = trexpr_dkprop q in
	let param = 
	  if (List.length (List.nth proofs 0).conc == 2) then 
	    trproof_dk (List.nth proofs 0)
	  else if (List.length (List.nth proofs 0).conc == 1) then
	    let prf_P = mk_var_prfObj np in
	    let prf_nQ = mk_var_prfObj (mk_not nq) in 
	    let conc = List.nth (List.nth proofs 0).conc 0 in
	    if (is_equal_mod p conc) then 
	      mk_lam (prf_P, 
		      mk_lam (prf_nQ, mk_app (trproof_dk (List.nth proofs 0), 
					      [prf_P])))
	    else if (is_equal_mod (enot q) conc) then 
	      mk_lam (prf_P, trproof_dk (List.nth proofs 0))
	    else assert false
	  else assert false
	in
	mk_DkRnotimply (np, nq, param)
     | Rnotconnect (Equiv, p, q) -> 
	assert (List.length proofs == 2);
	let np = trexpr_dkprop p in 
	let nq = trexpr_dkprop q in 
	let prf_P = mk_var_prfObj np in 
	let prf_nP = mk_var_prfObj (mk_not np) in 
	let prf_Q = mk_var_prfObj nq in 
	let prf_nQ = mk_var_prfObj (mk_not nq) in 
	let param0 = 
	  if (List.length (List.nth proofs 0).conc == 2) then 
	    trproof_dk (List.nth proofs 0)
	  else if (List.length (List.nth proofs 0).conc == 1) then
	    let conc0 = List.nth (List.nth proofs 0).conc 0 in
	    if (is_equal_mod (enot p) conc0) then 
	      mk_lam (prf_nP, 
		      mk_lam (prf_Q, 
			      mk_app (trproof_dk (List.nth proofs 0), 
				      [prf_nP])))
	    else if (is_equal_mod q conc0) then 
	      mk_lam (prf_nP, 
		      trproof_dk (List.nth proofs 0))
	    else assert false
	  else assert false
	in
	let param1 = 
	  if (List.length (List.nth proofs 1).conc == 2) then 
	    trproof_dk (List.nth proofs 1)
	  else if (List.length (List.nth proofs 1).conc == 1) then
	    let conc1 = List.nth (List.nth proofs 1).conc 0 in 
	    if (is_equal_mod p conc1) then 
	      mk_lam (prf_P, 
		      mk_lam (prf_nQ, 
			      mk_app (trproof_dk (List.nth proofs 1),
				      [prf_P])))
	    else if (is_equal_mod (enot q) conc1) then 
	      mk_lam (prf_P, 
		      trproof_dk (List.nth proofs 1))
	    else assert false
	  else assert false 
	in 
        mk_DkRnotequiv (np, nq, param0, param1)
     | Rex (p, t) -> 
	Log.debug 8 "Rex with";
	Log.debug 8 " |- p = %a" Print.pp_expr p;
	Log.debug 8 " |- t = %a" Print.pp_expr t;
	assert (List.length proofs == 1);
	if (is_binder_of_type_var p) then
	  let a = trexpr_dktype t in
	  let np = trexpr_dkprop p in 
	  mk_DkRextype (np, mk_lam (a, trproof_dk (List.nth proofs 0)))
	else	  
	  let a = trexpr_dktype (get_type_binder p) in
	  let np = trexpr_dkprop p in 
	  let nt = trexpr_dkprop t in 
	  mk_DkRex (a, np, mk_lam (nt, trproof_dk (List.nth proofs 0)))
     | Rall (p, t) -> 
	Log.debug 8 "Rall with";
	Log.debug 8 " |- p = %a" Print.pp_expr p;
	Log.debug 8 " |- t = %a" Print.pp_expr t;
	assert (List.length proofs == 1);
	if (is_binder_of_type_var p) then
	  let a = trexpr_dktype t in 
	  let np = trexpr_dkprop p in 
	  mk_DkRalltype (np, a, trproof_dk (List.nth proofs 0))
	else
	  let a = trexpr_dktype (get_type_binder p) in 
	  let np = trexpr_dkprop p in 
	  let nt = trexpr_dkprop t in 
	  mk_DkRall (a, np, nt, trproof_dk (List.nth proofs 0))
     | Rnotex (p, t) -> 
	Log.debug 8 "Rnotex with";
	Log.debug 8 " |- p = %a" Print.pp_expr p;
	Log.debug 8 " |- t = %a" Print.pp_expr t;
	assert (List.length proofs == 1);
	if (is_binder_of_type_var p) then 
	  let a = trexpr_dktype t in 
	  let np = trexpr_dkprop p in 
	  mk_DkRnotextype (np, a, trproof_dk (List.nth proofs 0))
	else
	  let a = trexpr_dktype (get_type_binder p) in 
	  let np = trexpr_dkprop p in 
	  let nt = trexpr_dkprop t in 
	  mk_DkRnotex (a, np, nt, trproof_dk (List.nth proofs 0))
     | Rnotall (p, t) -> 
	Log.debug 8 "Rnotall with";
	Log.debug 8 " |- p = %a" Print.pp_expr p;
	Log.debug 8 " |- t = %a" Print.pp_expr t;
	assert (List.length proofs == 1);
	if (is_binder_of_type_var p) then 
	  let a = trexpr_dktype t in 
	  let np = trexpr_quant_to_dklam p in 
	  mk_DkRnotalltype (np, mk_lam (a, trproof_dk (List.nth proofs 0)))
	else
	  let a = trexpr_dktype (get_type_binder p) in
	  let np = trexpr_quant_to_dklam p in 
	  let nt = trexpr_dkprop t in 
	  mk_DkRnotall (a, np, mk_lam (nt, trproof_dk (List.nth proofs 0)))
     | Rextension (_, "zenon_notallex", _, _, _) -> 
	assert false
     | RcongruenceLR (p, t1, t2) -> 
	assert (List.length proofs == 1);
	let a = trexpr_dktype (get_type t1) in 
	let np = trexpr_dkprop p in 
	let nt1 = trexpr_dkprop t1 in 
	let nt2 = trexpr_dkprop t2 in 
	mk_DkRconglr (a, np, nt1, nt2, trproof_dk (List.nth proofs 0))
     | RcongruenceRL (p, t1, t2) -> 
	assert (List.length proofs == 1);
	let a = trexpr_dktype (get_type t1) in 
	let np = trexpr_dkprop p in 
	let nt1 = trexpr_dkprop t1 in 
	let nt2 = trexpr_dkprop t2 in 
	mk_DkRcongrl (a, np, nt1, nt2, trproof_dk (List.nth proofs 0))
     | _ -> assert false
;;

let output oc phrases llp =
  let sigs = Expr.get_defs () in
  let dksigs = translate_sigs sigs in 
  let dksigs = List.map (fun (x,y) -> mk_decl (x, y)) dksigs in
  let dep_graph = create 42 in
  List.iter (add_sym_graph dep_graph) dksigs;
  let dksigs = topo_sort dep_graph in

  let rules = Hashtbl.fold (fun x y z -> y :: z) !tbl_term [] in
  let rules = List.append rules 
			  (Hashtbl.fold (fun x y z -> y :: z) !tbl_prop []) in
  let dkrules = List.map build_dkrwrt rules in
  let (name, goal) = List.split (select_goal phrases) in 
  let dkgoal = trexpr_dkgoal goal in 
  let dkname = List.hd name in 
  let prooftree = extract_prooftree llp in 
  let dkproof = trproof_dk prooftree in 
  

  fprintf oc "#NAME tocheck";
  fprintf oc ".\n";
  List.iter (print_line oc) dksigs;
  fprintf oc "\n";
  List.iter (print_line oc) dkrules;
  fprintf oc "\n";
  print_goal_type oc dkname dkgoal;
  fprintf oc "\n";
  print_proof oc dkname dkproof;
  

  []
;;
