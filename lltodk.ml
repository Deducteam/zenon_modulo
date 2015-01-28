(*  Copyright 2004 INRIA  *)
Version.add "$Id$";;

open Printf;;

open Expr;;
open Llproof;;
open Dkterm;;

let rec trexpr_dktype e =
  Log.debug 15 "dktype %a" Print.pp_expr e;
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
       | _ -> assert false
     in
     mk_pi (nvar, np)
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
     assert false
  | Eex (Evar (v, _) as v', p, _) -> 
     let nv = trexpr_dkvartype v' in 
     let tnv = get_dkvar_type nv in 
     mk_exists (tnv, (mk_lam (nv, trexpr_dkprop p)))
  | Eex _ -> assert false
  | Etau _ -> assert false
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

let output oc phrases llp =
  let sigs = Expr.get_defs () in
  let dksigs = translate_sigs sigs in 
  let dksigs = List.map (fun (x,y) -> mk_decl (x, y)) dksigs in
  let rules = Hashtbl.fold (fun x y z -> y :: z) !tbl_term [] in
  let rules = List.append rules 
			  (Hashtbl.fold (fun x y z -> y :: z) !tbl_prop []) in
  let dkrules = List.map build_dkrwrt rules in

  fprintf oc "#NAME tocheck";
  fprintf oc ".\n";
  List.iter (print_line oc) dksigs;
  fprintf oc "\n";
  List.iter (print_line oc) dkrules;
  fprintf oc "\n";
  
  []
;;
