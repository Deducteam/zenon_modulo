(*  Copyright 2004 INRIA  *)
Version.add "$Id$";;

open Printf;;

open Expr;;
open Llproof;;
open Dkterm;;
open Namespace;;

let hyp_prefix = "H";;

let context = ref (Hashtbl.create 997);;
let metactx = ref (Hashtbl.create 9);;
let rawname e = sprintf "%s%x" hyp_prefix (Index.get_number e);;
let rawname_prf e = sprintf "%s%s%x" "prf_" hyp_prefix (Index.get_number e);;
let rawname_meta e = sprintf "%s%x" "const_" (Index.get_number e);;

exception No_proof of string
;;

exception No_meta of string
;;

let add_context e dke =
  Log.debug 4 " |- Add context %s ::  %a"
	    (match dke with
	     | Dkvar (name, _) -> name
	     | Dkapp (name, _, []) -> name
	     | _ -> assert false)
	    Print.pp_expr e;
  Hashtbl.add !context e dke
;;

let get_context e =
  try
    let dke = Hashtbl.find !context e in
    Log.debug 5 " |- Get context %s :: %a"
	      (match dke with
	       | Dkvar (name, _) -> name
	       | Dkapp (name, _, []) -> name
	       | _ -> assert false)
	      Print.pp_expr e;
    dke
  with Not_found ->
    raise (No_proof (Printf.sprintf "for expr %s"
				    (Print.sexpr e)))
;;

let add_metactx e dke =
  Log.debug 3 " |- Add metactx %a" Print.pp_expr e;
  Hashtbl.add !metactx e dke
;;

let get_metactx e =
  Log.debug 3 " |- Get metactx %a" Print.pp_expr e;
  try
    Hashtbl.find !metactx e
  with Not_found ->
    raise (No_meta (Printf.sprintf "for meta %s"
				   (Print.sexpr e)))
;;

let mk_zterm =
  mk_term (mk_app ("Z", mk_typetype, []))
;;

let predefined_sym =
  [("Z", ("Z", mk_typetype));
   ("$less", ("less", mk_arrow ([mk_zterm; mk_zterm; mk_typeprop])));
   ("$lesseq", ("lesseq", mk_arrow ([mk_zterm; mk_zterm; mk_typeprop])));
   ("$greater", ("greater", mk_arrow ([mk_zterm; mk_zterm; mk_typeprop])));
   ("$greatereq", ("greatereq", mk_arrow ([mk_zterm; mk_zterm; mk_typeprop])));
   ("$uminus", ("uminus", mk_arrow ([mk_zterm; mk_zterm])));
   ("$sum", ("sum", mk_arrow ([mk_zterm; mk_zterm; mk_zterm])));
   ("$difference", ("difference", mk_arrow ([mk_zterm; mk_zterm; mk_zterm])));
   ("$product", ("product", mk_arrow ([mk_zterm; mk_zterm; mk_zterm])));
   ("$is_int", ("is_int", mk_arrow ([mk_zterm; mk_typeprop])));
   ("$is_rat", ("is_rat", mk_arrow ([mk_zterm; mk_typeprop])));
   ("$to_int", ("to_int", mk_arrow ([mk_zterm; mk_zterm])));
   ("$to_rat", ("to_rat", mk_arrow ([mk_zterm; mk_zterm])));
   ("$to_real", ("to_real", mk_arrow ([mk_zterm; mk_zterm])))
  ]
;;

let rec trexpr_dktype_aux e =
  Log.debug 14 " |- dktype aux %a" Print.pp_expr e;
  match e with
  | e when (Expr.equal e type_type) ->
     mk_typetype
  | e when (Expr.equal e type_prop) ->
     mk_typeprop
  | e when (Expr.equal e type_iota) ->
     mk_typeiota
  | Evar (s, _) ->
     mk_var (s, trexpr_dktype_aux (get_type e))
  | Eapp (Evar(s, _) as s', args, _) ->
     let type_app = trexpr_dktype_aux (get_type s') in
     let nargs = List.map trexpr_dktype_aux args in
     mk_app (s, type_app, nargs)
  | Earrow (args, ret, _) ->
     let nret = trexpr_dktype_aux ret in
     let nargs = List.map trexpr_dktype_aux args in
     mk_arrow (nargs @ [nret])
  | Eall (Evar(v, _) as v', p, _)
       when Expr.equal (get_type v') type_type ->
     let nvar = mk_var (v, mk_typetype) in
     let np =
       match p with
       | Eapp (Evar(s, _) as s', args, _) ->
	  let type_app = trexpr_dktype_aux (get_type s') in
	  let nargs = List.map trexpr_dktype_aux args in
	  mk_term (mk_app (s, type_app, nargs))
       | Earrow (args, ret, _) when (Expr.equal ret type_prop) ->
	  let nret = mk_typeprop in
	  let nargs =
	    List.map (fun x -> mk_term (trexpr_dktype_aux x)) args in
	  mk_arrow (nargs @ [nret])
       | Earrow (args, ret, _) ->
	  let nret = mk_term (trexpr_dktype_aux ret) in
	  let nargs =
	    List.map (fun x -> mk_term (trexpr_dktype_aux x)) args in
	  mk_arrow (nargs @ [nret])
       | Eall (Evar (v2, _) as v2', p2, _)
	    when Expr.equal (get_type v2') type_type ->
	  trexpr_dktype_aux p
       | _ -> assert false
     in
     mk_pi (nvar, np)
  | Etau _ as e
       when Expr.equal (get_type e) type_type ->
     let v = Index.make_tau_name e in
     mk_app (v, mk_typetype, [])
  | Etau _ as e ->
     let v = Index.make_tau_name e in
     let ty = trexpr_dktype_aux (get_type e) in
     mk_app (v, ty, [])
  | _ -> assert false
;;

let rec trexpr_dktype e =
  Log.debug 14 " |- dktype %a" Print.pp_expr e;
  match e with
  | e when (Expr.equal e type_type) ->
     mk_typetype
  | e when (Expr.equal e type_prop) ->
     mk_typeprop
  | e when (Expr.equal e type_iota) ->
     mk_typeiota
  | Evar (s, _) ->
     mk_term (mk_var (s, trexpr_dktype_aux (get_type e)))
  | Eapp (Evar(s, _) as s', args, _) ->
     let type_app = trexpr_dktype_aux (get_type s') in
     let nargs = List.map trexpr_dktype_aux args in
     mk_term (mk_app (s, type_app, nargs))
  | Earrow (args, ret, _)
       when (Expr.equal ret type_type) ->
     let nret = mk_typetype in
     let nargs = List.map trexpr_dktype_aux args in
     mk_arrow (nargs @ [nret])
  | Earrow (args, ret, _)
       when (Expr.equal ret type_prop) ->
     let nret = mk_typeprop in
     let nargs = List.map (fun x -> mk_term (trexpr_dktype_aux x)) args in
     mk_arrow (nargs @ [nret])
  | Earrow (args, ret, _) ->
     let nret = mk_term (trexpr_dktype_aux ret) in
     let nargs = List.map (fun x -> mk_term (trexpr_dktype_aux x)) args in
     mk_arrow (nargs @ [nret])
  | Eall (Evar(v, _) as v', p, _)
       when Expr.equal (get_type v') type_type ->
     let nvar = mk_var (v, mk_typetype) in
     let np = trexpr_dktype p in
     mk_pi (nvar, np)
  | Etau _ as e
       when Expr.equal (get_type e) type_type ->
     let v = Index.make_tau_name e in
     mk_app (v, mk_typetype, [])
  | Etau _ as e ->
     let v = Index.make_tau_name e in
     let ty = mk_term (trexpr_dktype_aux (get_type e)) in
     mk_app (v, ty, [])
  | _ -> assert false
;;

let trexpr_dkvartype e =
  Log.debug 14 "dkvartype %a" Print.pp_expr_t e;
  match e with
  | Evar (s, _) when (Expr.equal (get_type e) type_type) ->
     mk_var (s, mk_typetype)
  | Evar (s, _) when (Expr.equal (get_type e) type_iota) ->
     mk_var (s, mk_term (mk_typeiota))
  | Evar (s, _) ->
     mk_var (s, mk_term (trexpr_dktype_aux (get_type e)))
  | _ -> assert false
;;


let rec translate_sigs_aux s accu =
  match s with
  | [] -> List.rev accu
  | (v, s) :: tl ->
     Log.debug 19 "translate sig %s : %a" v Print.pp_expr s;
     let ns =
       match s with
       | e when (Expr.equal e type_type) -> mk_typetype
       | e when (Expr.equal e type_iota) -> mk_term (mk_typeiota)
       | _ -> trexpr_dktype s
     in
     translate_sigs_aux tl ((v, ns) :: accu)
;;

let translate_sigs s =
  Log.debug 13 " |- Length of Sigs = %i" (List.length s);
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
     Log.debug 4 " |- Tr list var %a" Print.pp_expr l;
     let vars = get_freevars l in
     let nvars = List.map trexpr_dkvartype vars in
     List.rev nvars
;;

let rec trexpr_dkprop e =
  Log.debug 10 "dkprop %a" Print.pp_expr e;
  match e with
  | e when (Expr.equal e type_type) ->
     mk_typetype
  | e when (Expr.equal e type_prop) ->
     mk_typeprop
  | e when (Expr.equal e type_iota) ->
     mk_typeiota
  | Evar _ ->
     trexpr_dkvartype e
  | Emeta _ ->
     assert false
  | Eapp (Evar(s, _) as s', [], _) ->
     let nvar = trexpr_dkvartype s' in
     let type_app = get_dkvar_type (nvar) in
     mk_app (s, type_app, [])
  | Eapp (Evar("=", _), [e1; e2], _) ->
     let ne1 = trexpr_dkprop e1 in
     let ne2 = trexpr_dkprop e2 in
     let ty = trexpr_dktype_aux (get_type e1) in
     mk_equal (ty, ne1, ne2)
  | Eapp (Evar(s, _) as s', args, _)
     when (List.mem_assoc s predefined_sym) ->
     let nvar =
       trexpr_dkvartype (tvar (fst (List.assoc s predefined_sym)) (get_type s'))
     in
     let type_app = get_dkvar_type (nvar) in
     let nargs = List.map trexpr_dkprop args in
     mk_app (s, type_app, nargs)
  | Eapp (Evar(s, _) as s', args, _) ->
     let nvar = trexpr_dkvartype s' in
     let type_app = get_dkvar_type (nvar) in
     let nargs = List.map trexpr_dkprop args in
     mk_app (s, type_app, nargs)
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
     let v = Index.make_tau_name e in
     mk_app (v, mk_typetype, [])
  | Etau _ as e ->
     let v = Index.make_tau_name e in
     let ty = mk_term (trexpr_dktype_aux (get_type e)) in
     mk_app (v, ty, [])
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
  | _ ->
     begin
       Log.debug 9 " |- Get Type Binder : %a" Print.pp_expr e;
       assert false
     end
;;

let is_binder_of_type_var e =
  Expr.equal (get_type_binder e) type_type
;;

let extract_prooftree lemmas =
  Log.debug 8 " Number of Lemmas : %i" (List.length lemmas);
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
     let dkv = trexpr_dkvartype v in
     let dkbody = trexpr_dkprop body in
     mk_lam (dkv, dkbody)
  | Eex (v, body, _) ->
     let dkv = trexpr_dkvartype v in
     let dkbody = trexpr_dkprop body in
     mk_lam (dkv, dkbody)
(*  | Elam (v, body, _) ->
     let dkv = trxpr_dkvartype v in
     let dkbody = trexpr_dkprop body in
     mk_lam (dkv, dkbody) *)
  | _ -> assert false
;;

let mk_pr_var e =
  let norm_e = Rewrite.normalize_fm e in
  try
    Hashtbl.find !context norm_e
  with Not_found ->
       begin
	 let dke = mk_var (rawname_prf norm_e,
			   mk_proof (trexpr_dkprop norm_e)) in
	 add_context norm_e dke;
	 dke
       end
;;

let get_pr_var e =
  let norm_e = Rewrite.normalize_fm e in
  get_context norm_e
;;

let rec trproof_dk p =
  Log.debug 4 " ||-- trproof ";
  Log.debug 4 "    > %a" Print.llproof_rule_db p.rule;
  match p with
  | {conc = pconc;
     rule = prule;
     hyps = phyps;}
    ->
     List.iter (fun x -> Log.debug 6 "   >> conc : %a" Print.pp_expr x)
	       pconc;
     match prule with
     | Rfalse ->
	Log.debug 7 "     false";
	let conc = get_pr_var efalse in
	mk_DkRfalse conc
     | Rnottrue ->
	Log.debug 7 "     not true";
	let conc = get_pr_var (enot etrue) in
	mk_DkRnottrue conc
     | Raxiom (p) ->
	Log.debug 7 "     axiom %a" Print.pp_expr p;
	let dkp = trexpr_dkprop p in
	let concp = get_pr_var p in
	let concnp = get_pr_var (enot p) in
	mk_DkRaxiom (dkp, concp, concnp)
     | Rcut (p) ->
	Log.debug 7 "     cut %a" Print.pp_expr p;
	let dkp = trexpr_dkprop p in
	let pr0 = mk_pr_var p in
	let pr1 = mk_pr_var (enot p) in
	let sub0 = trproof_dk (List.nth phyps 0) in
	let sub1 = trproof_dk (List.nth phyps 1) in
	let lam0 = mk_lam (pr0, sub0) in
	let lam1 = mk_lam (pr1, sub1) in
	mk_DkRcut (dkp, lam0, lam1)
     | Rnoteq (t) ->
	Log.debug 7 "     noteq %a" Print.pp_expr t;
	let a = trexpr_dktype_aux (get_type t) in
	let dkt = trexpr_dkprop t in
	let conc = get_pr_var (enot (eeq t t)) in
	mk_DkRnoteq (a, dkt, conc)
     | Reqsym (t, u) ->
	Log.debug 7 "     eqsym %a %a" Print.pp_expr t Print.pp_expr u;
	let a = trexpr_dktype_aux (get_type t) in
	let dkt = trexpr_dkprop t in
	let dku = trexpr_dkprop u in
	let conc0 = get_pr_var (eeq t u) in
	let conc1 = get_pr_var (enot (eeq u t)) in
	mk_DkReqsym  (a, dkt, dku, conc0, conc1)
     | Rnotnot (p) ->
	let dkp = trexpr_dkprop p in
	let pr = mk_pr_var p in
	let sub = trproof_dk (List.nth phyps 0) in
	let lam = mk_lam (pr, sub) in
	let conc = get_pr_var (enot (enot p)) in
	mk_DkRnotnot (dkp, lam, conc)
     | Rconnect (And, p, q) ->
	let dkp = trexpr_dkprop p in
	let dkq = trexpr_dkprop q in
	let prp = mk_pr_var p in
	let prq = mk_pr_var q in
	let sub = trproof_dk (List.nth phyps 0) in
	let lam = mk_lam (prp, mk_lam (prq, sub)) in
	let conc = get_pr_var (eand (p, q)) in
	mk_DkRand (dkp, dkq, lam, conc)
     | Rconnect (Or, p, q) ->
        let dkp = trexpr_dkprop p in
	let dkq = trexpr_dkprop q in
	let prp = mk_pr_var p in
	let prq = mk_pr_var q in
	let subp = trproof_dk (List.nth phyps 0) in
	let subq = trproof_dk (List.nth phyps 1) in
	let lamp = mk_lam (prp, subp) in
	let lamq = mk_lam (prq, subq) in
	let conc = get_pr_var (eor (p, q)) in
	mk_DkRor (dkp, dkq, lamp, lamq, conc)
     | Rconnect (Imply, p, q) ->
        let dkp = trexpr_dkprop p in
	let dkq = trexpr_dkprop q in
	let prnp = mk_pr_var (enot p) in
	let prq = mk_pr_var q in
	let subp = trproof_dk (List.nth phyps 0) in
	let subq = trproof_dk (List.nth phyps 1) in
	let lamp = mk_lam (prnp, subp) in
	let lamq = mk_lam (prq, subq) in
	let conc = get_pr_var (eimply (p, q)) in
	mk_DkRimply (dkp, dkq, lamp, lamq, conc)
     | Rconnect (Equiv, p, q) ->
        let dkp = trexpr_dkprop p in
	let dkq = trexpr_dkprop q in
	let prp = mk_pr_var p in
	let prnp = mk_pr_var (enot p) in
	let prq = mk_pr_var q in
	let prnq = mk_pr_var (enot q) in
	let sub0 = trproof_dk (List.nth phyps 0) in
	let sub1 = trproof_dk (List.nth phyps 1) in
	let lam0 = mk_lam (prnp, mk_lam (prnq, sub0)) in
	let lam1 = mk_lam (prp, mk_lam (prq, sub1)) in
	let conc = get_pr_var (eequiv (p, q)) in
	mk_DkRequiv (dkp, dkq, lam0, lam1, conc)
     | Rnotconnect (And, p, q) ->
	let dkp = trexpr_dkprop p in
	let dkq = trexpr_dkprop q in
	let prnp = mk_pr_var (enot p) in
	let prnq = mk_pr_var (enot q) in
	let sub0 = trproof_dk (List.nth phyps 0) in
	let sub1 = trproof_dk (List.nth phyps 1) in
	let lam0 = mk_lam (prnp, sub0) in
	let lam1 = mk_lam (prnq, sub1) in
	let conc = get_pr_var (enot (eand (p, q))) in
	mk_DkRnotand (dkp, dkq, lam0, lam1, conc)
     | Rnotconnect (Or, p, q) ->
        let dkp = trexpr_dkprop p in
	let dkq = trexpr_dkprop q in
	let prnp = mk_pr_var (enot p) in
	let prnq = mk_pr_var (enot q) in
	let sub = trproof_dk (List.nth phyps 0) in
	let lam = mk_lam (prnp, mk_lam (prnq, sub)) in
	let conc = get_pr_var (enot (eor (p, q))) in
	mk_DkRnotor (dkp, dkq, lam, conc)
     | Rnotconnect (Imply, p, q) ->
	let dkp = trexpr_dkprop p in
	let dkq = trexpr_dkprop q in
	let prp = mk_pr_var p in
	let prnq = mk_pr_var (enot q) in
	let sub = trproof_dk (List.nth phyps 0) in
	let lam = mk_lam (prp, mk_lam (prnq, sub)) in
	let conc = get_pr_var (enot (eimply (p, q))) in
	mk_DkRnotimply (dkp, dkq, lam, conc)
     | Rnotconnect (Equiv, p, q) ->
	let dkp = trexpr_dkprop p in
	let dkq = trexpr_dkprop q in
	let prp = mk_pr_var p in
	let prnp = mk_pr_var (enot p) in
	let prq = mk_pr_var q in
	let prnq = mk_pr_var (enot q) in
	let sub0 = trproof_dk (List.nth phyps 0) in
	let sub1 = trproof_dk (List.nth phyps 1) in
	let lam0 = mk_lam (prnp, mk_lam (prq, sub0)) in
	let lam1 = mk_lam (prp, mk_lam (prnq, sub1)) in
	let conc = get_pr_var (enot (eequiv (p, q))) in
	mk_DkRnotequiv (dkp, dkq, lam0, lam1, conc)
     | Rex (Eex (Evar (x, _) as vx, px, _) as exp, z) ->
	if (is_binder_of_type_var exp) then
	  let dkp = trexpr_quant_to_dklam exp in
	  let zz = etau (vx, px) in
	  let dkzz = trexpr_dkprop zz in
	  let pzz = substitute [(vx, zz)] px in
	  let prpzz = mk_pr_var pzz in
	  let sub = trproof_dk (List.nth phyps 0) in
	  let lam = mk_lam (dkzz, mk_lam (prpzz, sub)) in
	  let conc = get_pr_var exp in
	  mk_DkRextype (dkp, lam, conc)
	else
	  let dkp = trexpr_quant_to_dklam exp in
	  let a = trexpr_dktype_aux (get_type_binder exp) in
	  let zz = etau (vx, px) in
	  let dkzz = trexpr_dkprop zz in
	  let pzz = substitute [(vx, zz)] px in
	  let prpzz = mk_pr_var pzz in
	  let sub = trproof_dk (List.nth phyps 0) in
	  let lam = mk_lam (dkzz, mk_lam (prpzz, sub)) in
	  let conc = get_pr_var exp in
	  mk_DkRex (a, dkp, lam, conc)
     | Rall (Eall (Evar (x, _) as vx, px, _) as allp, t) ->
	if (is_binder_of_type_var allp) then
	  let dkp = trexpr_quant_to_dklam allp in
	  let dkt = trexpr_dkprop t in
	  let pt = substitute [(vx, t)] px in
	  let prpt = mk_pr_var pt in
	  let sub = trproof_dk (List.nth phyps 0) in
	  let lam = mk_lam (prpt, sub) in
	  let conc = get_pr_var allp in
	  mk_DkRalltype (dkp, dkt, lam, conc)
	else
	  let a = trexpr_dktype_aux (get_type_binder allp) in
	  let dkp = trexpr_quant_to_dklam allp in
	  let dkt = trexpr_dkprop t in
	  let pt = substitute [(vx, t)] px in
	  let prpt = mk_pr_var pt in
	  let sub = trproof_dk (List.nth phyps 0) in
	  let lam = mk_lam (prpt, sub) in
	  let conc = get_pr_var allp in
	  mk_DkRall (a, dkp, dkt, lam, conc)
     | Rnotex (Eex (Evar (x, _) as vx, px, _) as exp, t) ->
	if (is_binder_of_type_var exp) then
	  let dkp = trexpr_quant_to_dklam exp in
	  let dkt = trexpr_dkprop t in
	  let pt = enot (substitute [(vx, t)] px) in
	  let prpt = mk_pr_var pt in
	  let sub = trproof_dk (List.nth phyps 0) in
	  let lam = mk_lam (prpt, sub) in
	  let conc = get_pr_var (enot exp) in
	  mk_DkRnotextype (dkp, dkt, lam, conc)
	else
	  let a = trexpr_dktype_aux (get_type_binder exp) in
	  let dkp = trexpr_quant_to_dklam exp in
	  let dkt = trexpr_dkprop t in
	  let pt = enot (substitute [(vx, t)] px) in
	  let prpt = mk_pr_var pt in
	  let sub = trproof_dk (List.nth phyps 0) in
	  let lam = mk_lam (prpt, sub) in
	  let conc = get_pr_var (enot exp) in
	  mk_DkRnotex (a, dkp, dkt, lam, conc)
     | Rnotall (Eall (Evar (x, _) as vx, px, _) as allp, t) ->
	if (is_binder_of_type_var allp) then
	  let dkp = trexpr_quant_to_dklam allp in
	  let zz = etau (vx, enot (px)) in
	  let dkzz = trexpr_dkprop zz in
	  let pzz = substitute [(vx, zz)] px in
	  let prpzz = mk_pr_var (enot pzz) in
	  let sub = trproof_dk (List.nth phyps 0) in
	  let lam = mk_lam (dkzz, mk_lam (prpzz, sub)) in
	  let conc = get_pr_var (enot allp) in
	  mk_DkRnotalltype (dkp, lam, conc)
	else
	  let dkp = trexpr_quant_to_dklam allp in
	  let a = trexpr_dktype_aux (get_type_binder allp) in
	  let zz = etau (vx, enot (px)) in
	  let dkzz = trexpr_dkprop zz in
	  let pzz = substitute [(vx, zz)] px in
	  let prpzz = mk_pr_var (enot pzz) in
	  let sub = trproof_dk (List.nth phyps 0) in
	  let lam = mk_lam (dkzz, mk_lam (prpzz, sub)) in
	  let conc = get_pr_var (enot allp) in
	  mk_DkRnotall (a, dkp, lam, conc)
     | Rpnotp ((Eapp (Evar (p, _), args1, _) as pp),
	       (Enot (Eapp (Evar (q, _), args2, _) as qq, _))) ->
	assert (p == q);
	assert (List.length args1 == List.length args2);
	let (_, argspp) = Expr.split_list (Expr.nb_tvar pp) args1 in
	let (_, argsnqq) = Expr.split_list (Expr.nb_tvar qq) args2 in
	mk_pnotp_subst pp argspp argsnqq phyps
     | Rnotequal ((Eapp (Evar (f, _), args1, _) as ff),
		  (Eapp (Evar (g, _), args2, _) as gg)) ->
	assert (f == g);
	assert (List.length args1 == List.length args2);
	let (_, argsff) = Expr.split_list (Expr.nb_tvar ff) args1 in
	let (_, argsgg) = Expr.split_list (Expr.nb_tvar gg) args2 in
	mk_notequal_subst ff gg argsff argsgg phyps
     | Rextension (_, "zenon_notallex", _, _, _) ->
	assert false
     | RcongruenceLR (p, t1, t2) ->
	let a = trexpr_dktype_aux (get_type t1) in
	let dkp = trexpr_dkprop p in
	let dkt1 = trexpr_dkprop t1 in
	let dkt2 = trexpr_dkprop t2 in
	let prp = mk_pr_var (apply p t2) in
	let sub = trproof_dk (List.nth phyps 0) in
	let lam = mk_lam (prp, sub) in
	let conc1 = get_pr_var (apply p t1) in
	let conc2 = get_pr_var (eeq t1 t2) in
	mk_DkRconglr (a, dkp, dkt1, dkt2, lam, conc1, conc2)
     | RcongruenceRL (p, t1, t2) ->
	let a = trexpr_dktype_aux (get_type t1) in
	let dkp = trexpr_dkprop p in
	let dkt1 = trexpr_dkprop t1 in
	let dkt2 = trexpr_dkprop t2 in
	let prp = mk_pr_var (apply p t2) in
	let sub = trproof_dk (List.nth phyps 0) in
	let lam = mk_lam (prp, sub) in
	let conc1 = get_pr_var (apply p t1) in
	let conc2 = get_pr_var (eeq t2 t1) in
	mk_DkRcongrl (a, dkp, dkt1, dkt2, lam, conc1, conc2)
     | Rextension (ext, name, args, concs, hyps) ->
	Log.debug 7 "  |- Extension Proof Step >> %s" name;
	List.iter (fun x -> Log.debug 7 "    args : %a" Print.pp_expr x)
		  args;
	List.iter (fun x -> Log.debug 7 "    conc : %a" Print.pp_expr x)
		  concs;
	List.iter (fun x -> Log.debug 7 "    hyps : %a" Print.pp_expr x)
		  (List.flatten hyps);
        let ext = if ext = "" then "focal" else ext in
        (*List.iter (fun e -> ignore (mk_pr_var e)) (List.flatten hyps);*)
	let tr_args = List.map trexpr_dkprop args in
	assert ((List.length hyps) = (List.length phyps));
	let build_lam hyps phyp =
	  let prp = List.map mk_pr_var hyps in
	  let sub = trproof_dk phyp in
	  let lam =
	    if (List.length prp > 1)
	    then
	      List.fold_left (fun lam pr -> mk_lam (pr, lam))
			     (mk_lam (List.hd prp, sub)) (List.tl prp)
	    else
	      begin
		assert (List.length prp = 1);
		mk_lam (List.hd prp, sub)
	      end
	  in
	  lam
	in
	let lambdas = List.map2 build_lam hyps phyps in
	let tr_concs = List.map get_pr_var concs in
        mk_app (ext ^ "." ^ name,
		mk_typeiota,
                List.append tr_args (List.append lambdas tr_concs))
     | Rdefinition _ ->
        (match phyps with
        | [ next ] -> trproof_dk next
        | _ -> assert false)
     | _ -> assert false

  and mk_pnotp_subst pp argspp argsnqq phyps =
    Log.debug 6 " |- Pred %a" Print.pp_expr pp;
    match pp, argspp, argsnqq with
    | Eapp _, [], [] ->
       assert (List.length phyps == 0);
       let dkp = trexpr_dkprop pp in
       let concp = get_pr_var pp in
       let concnp = get_pr_var (enot pp) in
       mk_DkRaxiom (dkp, concp, concnp)
    | Eapp _, h1 :: tl1, h2 :: tl2 ->
       let app_to_lam p e =
	 match p with
	 | Eapp (sym, args, _) ->
	    assert (List.mem e args);
	    let v = tvar (newname()) (get_type e) in
	    let idx = (List.length args)
		      - (List.length argspp)
	    in
	    assert (Expr.equal (List.nth args idx) e);
	    let rec f accu l i =
	      match l with
	      | [] -> assert false
	      | h :: tl ->
		 if (i == 0)
		    && (Expr.equal h e) then
		   List.append (List.rev accu) (v :: tl)
		 else f (h :: accu) tl (i - 1)
	    in
	    let nargs = f [] args idx in
	    let np = eapp (sym, nargs) in
	    elam (v, np)
	 | _ -> assert false
       in
       assert (Expr.equal (get_type h1) (get_type h2));
       let a = trexpr_dktype_aux (get_type h1) in
       let p_lam = app_to_lam pp h1 in
       let (dkvv, dkpp) =
	 match p_lam with
	 | Elam (v, np, _) ->
	    (trexpr_dkvartype v, trexpr_dkprop np)
	 | _ -> assert false
       in
       let dkpp = mk_lam (dkvv, dkpp) in
       let dkt1 = trexpr_dkprop h1 in
       let dkt2 = trexpr_dkprop h2 in
       let p_subst = apply p_lam h2 in
       let notequalt1t2 = enot (eeq h1 h2) in
       let prnotequalt1t2 = mk_pr_var notequalt1t2 in
       let prpt2 = mk_pr_var p_subst in
       let (sub, phyps_new) =
	 match phyps with
	 | hhyp :: tlhyps -> (trproof_dk hhyp, tlhyps)
	 | _ -> assert false
       in
       let lam0 = mk_lam (prnotequalt1t2, sub) in
       let conc = get_pr_var pp in
       mk_DkRsubst (a, dkpp, dkt1, dkt2, lam0,
		    mk_lam (prpt2,
			    mk_pnotp_subst p_subst tl1 tl2 phyps_new),
		    conc)
    | _, _, _ -> assert false

  and mk_notequal_subst ff gg argsff argsgg phyps =
    Log.debug 6 "   |- Fun %a /= %a" Print.pp_expr ff Print.pp_expr gg;
    List.iter (fun x -> Log.debug 7 "    > argsff %a" Print.pp_expr x) argsff;
    List.iter (fun x -> Log.debug 7 "    > argsgg %a" Print.pp_expr x) argsgg;
    match ff, gg, argsff, argsgg with
    | Eapp _, Eapp _, [], [] ->
       assert (List.length phyps == 0);
       assert (Expr.equal ff gg);
       let a = trexpr_dktype_aux (get_type ff) in
       let dkff = trexpr_dkprop ff in
       let conc = get_pr_var (enot (eeq ff ff)) in
       mk_DkRnoteq (a, dkff, conc)
    | Eapp _, Eapp _, h1 :: tl1, h2 :: tl2 ->
       let app_to_lam p e =
	 match p with
	 | Eapp (sym, args, _) ->
	    assert (List.mem e args);
	    let v = tvar (newname()) (get_type e) in
	    let idx = (List.length args)
		      - (List.length argsff)
	    in
	    assert (Expr.equal (List.nth args idx) e);
	    let rec f accu l i =
	      match l with
	      | [] -> assert false
	      | h :: tl ->
		 if (i == 0)
		    && (Expr.equal h e) then
		   List.append (List.rev accu) (v :: tl)
		 else f (h :: accu) tl (i - 1)
	    in
	    let nargs = f [] args idx in
	    let np = eapp (sym, nargs) in
	    elam (v, np)
	 | _ -> assert false
       in
       assert (Expr.equal (get_type h1) (get_type h2));
       Log.debug 7 " ff = %a" Print.pp_expr ff;
       Log.debug 7 " h2 = %a" Print.pp_expr h2;
       let a = trexpr_dktype_aux (get_type h1) in
       let ff_lam = app_to_lam ff h1 in
       Log.debug 7 " ff_lam = %a" Print.pp_expr ff_lam;
       let ff_subst = apply ff_lam h2 in
       Log.debug 7 " ff_subst = %a" Print.pp_expr ff_subst;
       let (dkvv, dkp) =
	 match ff_lam with
	 | Elam (v, nf, _) ->
	    (trexpr_dkvartype v, trexpr_dkprop (enot (eeq nf gg)))
	 | _ -> assert false
       in
       let dkp = mk_lam (dkvv, dkp) in
       let dkt1 = trexpr_dkprop h1 in
       let dkt2 = trexpr_dkprop h2 in
       let prneqt1t2 = mk_pr_var (enot (eeq h1 h2)) in
       let prpt2 = mk_pr_var (enot (eeq ff_subst gg)) in
       let (sub, phyps_new) =
	 match phyps with
	 | hhyp :: tlhyps -> (trproof_dk hhyp, tlhyps)
	 | _ -> assert false
       in
       let lam0 = mk_lam (prneqt1t2, sub) in
       let conc = get_pr_var (enot (eeq ff gg)) in
       mk_DkRsubst (a, dkp, dkt1, dkt2, lam0,
		    mk_lam (prpt2,
			    mk_notequal_subst ff_subst gg tl1 tl2 phyps_new),
		    conc)
    | _, _, _, _ -> assert false
;;

let make_proof_term goal prooftree =
  let pr = mk_pr_var goal in
  let sub = trproof_dk prooftree in
  mk_lam (pr, sub)
;;

let rec mk_prf_var_def_aux accu phrases =
  match phrases with
  | [] -> accu
  | Phrase.Hyp (name, _, _) :: tl
       when name == goal_name ->
     mk_prf_var_def_aux accu tl
  | Phrase.Hyp (name, fm, _) :: tl ->
     let norm_fm = Rewrite.normalize_fm fm in
     if Hashtbl.mem !context norm_fm then
       mk_prf_var_def_aux accu tl
     else
       (*let v = rawname_prf norm_fm in*)
       let t = mk_proof (trexpr_dkprop norm_fm) in
       let dkfm = mk_app (name, t, []) in
       add_context norm_fm dkfm;
       mk_prf_var_def_aux (mk_decl (name, t) :: accu) tl
  | _ :: tl -> mk_prf_var_def_aux accu tl
;;

let mk_prf_var_def phrases =
  mk_prf_var_def_aux [] phrases
;;

let rec get_sigs_fm_type accu ty =
  match ty with
  | e when (Expr.equal e type_type)
	   || (Expr.equal e type_prop)
	   || (Expr.equal e type_iota) -> accu
  | Evar _ -> accu
  | Emeta _ -> assert false
  | Eapp (Evar (v, _) as v', args, _) ->
     if (List.mem_assoc v accu)
     then
       List.fold_left (fun x y -> get_sigs_fm_type x y) accu args
     else
       begin
	 Log.debug 13 " |- Type Sigs %s :: %a" v Print.pp_expr (get_type v');
	 let accu = (v, get_type v') :: accu in
	 List.fold_left (fun x y -> get_sigs_fm_type x y) accu args
       end
  | Earrow (args, ret, _) ->
     let accu = List.fold_left (fun x y -> get_sigs_fm_type x y)
			       accu args in
     get_sigs_fm_type accu ret
  | Enot _
  | Eand _
  | Eor _
  | Eimply _
  | Eequiv _
  | Etrue
  | Efalse -> assert false
  | Eall (_, p, _)
  | Eex (_, p, _)
  | Elam (_, p, _) -> get_sigs_fm_type accu p
  | Etau _ -> accu
  | _ -> assert false
;;

let rec get_sigs_fm accu fm =
  match fm with
  | Evar (v, _) as v' when Mltoll.is_meta v ->
     if (List.mem_assoc v accu)
     then
       let accu = get_sigs_fm_type accu (get_type v') in
       accu
     else
       let accu = get_sigs_fm_type accu (get_type v') in
       Log.debug 13 " |- Evar Sigs %s :: %a" v Print.pp_expr (get_type v');
       let accu = (v, get_type v') :: accu in
       accu
  | Evar _ as v ->
     let accu = get_sigs_fm_type accu (get_type v) in
     accu
  | Emeta _ -> assert false
  | Eapp (Evar (v, _) as v', [], _) ->
     if (List.mem_assoc (v) accu)
     then
       let accu = get_sigs_fm_type accu (get_type v') in
       accu
     else
       let accu = (v, get_type v') :: accu in
       let accu = get_sigs_fm_type accu (get_type v') in
       accu
  | Eapp (Evar ("=", _), args, _) ->
     List.fold_left (fun x y -> get_sigs_fm x y) accu args
  | Eapp (Evar (v, _) as v', args, _)
       when (List.mem_assoc v predefined_sym) ->
     let v = fst (List.assoc v predefined_sym) in
     let v' = tvar v (get_type v') in
     if (List.mem_assoc v accu)
     then
       let accu = get_sigs_fm_type accu (get_type v') in
       List.fold_left (fun x y -> get_sigs_fm x y) accu args
     else
       let accu = get_sigs_fm_type accu (get_type v') in
       let accu = (v, get_type v') :: accu in
       List.fold_left (fun x y -> get_sigs_fm x y) accu args
  | Eapp (Evar (v, _) as v', args, _) ->
     if (List.mem_assoc v accu)
     then
       let accu = get_sigs_fm_type accu (get_type v') in
       List.fold_left (fun x y -> get_sigs_fm x y) accu args
     else
       begin
	 Log.debug 13 " |- Eapp Sigs %s :: %a" v Print.pp_expr (get_type v');
	 let accu = (v, get_type v') :: accu in
	 let accu = get_sigs_fm_type accu (get_type v') in
	 List.fold_left (fun x y -> get_sigs_fm x y) accu args
       end
  | Earrow _ -> assert false
  | Enot (e, _) -> get_sigs_fm accu e
  | Eand (e1, e2, _)
  | Eor (e1, e2, _)
  | Eimply (e1, e2, _)
  | Eequiv (e1, e2, _) ->
     List.fold_left (fun x y -> get_sigs_fm x y) accu [e1; e2]
  | Etrue
  | Efalse -> accu
  | Eall (_, p, _)
  | Eex (_, p, _)
  | Elam (_, p, _) ->
     get_sigs_fm accu p
  | Etau _ ->
     accu
  | _ -> assert false
;;

let rec get_sigs_phrases_aux accu phrases =
  match phrases with
  | [] -> accu
  | Phrase.Hyp (_, fm, _) :: tl ->
     let accu = get_sigs_fm accu fm in
     get_sigs_phrases_aux accu tl
  | Phrase.Rew (_, fm, _) :: tl ->
     let accu = get_sigs_fm accu fm in
     get_sigs_phrases_aux accu tl
  | Phrase.Def (DefReal (_, _, _, _, body, _)) :: tl ->
     let accu = get_sigs_fm accu body in
     get_sigs_phrases_aux accu tl
  | _ :: tl ->
     get_sigs_phrases_aux accu tl
;;

let get_sigs_phrases sigs phrases =
  get_sigs_phrases_aux sigs phrases
;;

let rec get_sigs_proof_aux accu llp =
  match llp with
  | {conc = pconc;
     rule = prule;
     hyps = phyps;}
    ->
     let accu = List.fold_left (fun x y -> get_sigs_fm x y)
			       accu pconc in
     List.fold_left (fun x y -> get_sigs_proof_aux x y) accu phyps
;;

let get_sigs_proof sigs llp =
  get_sigs_proof_aux sigs llp
;;

let output oc phrases llp =
  Log.debug 2 "=========== Generate Dedukti Term =============";
  let sigs = Expr.get_defs () in
  Log.debug 13 " |- length Sigs = %i" (List.length sigs);
  let sigs = get_sigs_phrases sigs phrases in
  Log.debug 13 " |- length Sigs = %i" (List.length sigs);
  let sigs = get_sigs_proof sigs (extract_prooftree llp) in
  Log.debug 13 " |- length Sigs = %i" (List.length sigs);
  let dksigs = translate_sigs sigs in
  let dksigs = List.map (fun (x, y) -> mk_decl (x, y)) dksigs in
  let dep_graph = create 1337 in
  List.iter (add_sym_graph dep_graph) dksigs;
  let dksigs = topo_sort dep_graph in
  let dkctx = mk_prf_var_def phrases in
  let rules = Hashtbl.fold (fun x y z -> y :: z) !tbl_term [] in
  let rules = List.append rules
			  (Hashtbl.fold (fun x y z -> y :: z) !tbl_prop []) in
  let dkrules = List.map build_dkrwrt rules in
  let (name, goal) = List.split (select_goal phrases) in
  let dkgoal = trexpr_dkgoal goal in
  let dkname = List.hd name in
  let prooftree = extract_prooftree llp in
  let dkproof = make_proof_term (List.hd goal) prooftree in

  fprintf oc "#NAME tocheck";
  fprintf oc ".\n";
  List.iter (print_line oc) dksigs;
  fprintf oc "\n";
  List.iter (print_line oc) dkctx;
  fprintf oc "\n";
  List.iter (print_line oc) dkrules;
  fprintf oc "\n";
  print_goal_type oc dkname dkgoal;
  fprintf oc "\n";
  print_proof oc dkname dkproof;
  []
;;

let output_term oc phrases ppphrases llp =
  Log.debug 2 "=========== Generate Dedukti Term =============";
  (* register hypothesis in the context *)
  let _ = mk_prf_var_def phrases in
  let (_, goal) = List.split (select_goal phrases) in
  assert (List.length goal = 1);
  let ngoal = match (List.hd goal) with
    | Enot (ng, _) -> ng
    | _ -> assert false
  in
  let dkgoal = trexpr_dkprop ngoal in
  let prooftree = extract_prooftree llp in
  let dkproof = make_proof_term (List.hd goal) prooftree in

  fprintf oc "zen.nnpp (%a)\n\n(%a)" print_dk dkgoal print_dk dkproof;
  []
;;
