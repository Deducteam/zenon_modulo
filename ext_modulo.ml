(*  Copyright 2006 INRIA  *)

(* Extension for modulo
*)

open Printf;;

open Expr;;
open Misc;;
open Mlproof;;
open Node;;
open Phrase;;
open Llproof;;


let rec assoc_expr x = function
  | [] -> raise Not_found
  | (a,b)::l -> if (Expr.equal a x) then b else assoc_expr x l
;;

let rec mem_assoc_expr x = function
  | [] -> false
  | (a, b)::l -> (Expr.equal a x) || mem_assoc_expr x l
;;

let rec mem_expr x = function
  | [] -> false
  | a :: l -> (Expr.equal a x) || mem_expr x l
;;

let rec find_sym t = 
  match t with 
 (*   | Evar (sym, _) -> sym *)
    | Eapp (Evar(sym, _), _, _) -> sym
    | Enot (t1, _) -> find_sym t1
    | _ -> ""
;;

let is_literal fm = 
  match fm with 
  | Eapp(Evar(sym, _), _, _) -> true
  | Enot(Eapp(Evar(sym, _), _, _), _) -> true
  | _ -> false
;;

let rec find_best_match incr left_rule fm = 
  match left_rule, fm with 
  | Evar _ , Evar _ 
    -> let new_incr = incr + 1 in 
       new_incr
  | Eapp (Evar(sym1, _), args1, _), Eapp (Evar(sym2, _), args2, _) 
       when sym1 = sym2 && List.length args1 = List.length args2
    -> let new_incr = incr + 3 in 
       List.fold_left2 find_best_match new_incr args1 args2
  | Eapp _, _ 
    -> let new_incr = incr - 1 in 
       new_incr
  | _, _ -> incr
;; 

let ordering_rules fm (n1, (l1, r1)) (n2, (l2, r2)) =
  match fm with 
  | Enot (r_fm, _) 
    -> 
     begin
       if find_best_match 0 l1 r_fm = find_best_match 0 l2 r_fm 
       then 0
       else if find_best_match 0 l1 r_fm < find_best_match 0 l2 r_fm 
       then 1
       else -1
     end
  | _  -> 
     begin
       if find_best_match 0 l1 fm = find_best_match 0 l2 fm 
       then 0
       else if find_best_match 0 l1 fm < find_best_match 0 l2 fm 
       then 1
       else -1
     end
;; 

exception Unif_failed;;

let rec unif_aux l e1 e2 =
  match e1, e2 with

    | Evar (_, _), _ ->
      if  not(mem_assoc_expr e1 l) then (e1, e2)::l
      else if (assoc_expr e1 l) = e2 then l
      else raise Unif_failed

    | Eapp (Evar(f1, _), args1, _), Eapp (Evar(f2, _), args2, _) when f1 = f2 
         -> (try 
	      List.fold_left2 unif_aux l args1 args2
	     with 
	       | Invalid_argument _ -> raise Unif_failed)

    | Enot (x1, _), Enot (y1, _) 
      -> unif_aux l x1 y1
    | Eand (x1, x2, _), Eand (y1, y2, _) 
      -> List.fold_left2 unif_aux l [x1;x2] [y1;y2]
    | Eor (x1, x2, _), Eor (y1, y2, _) 
      -> List.fold_left2 unif_aux l [x1;x2] [y1;y2]
    | Eimply (x1, x2, _), Eimply (y1, y2, _) 
      -> List.fold_left2 unif_aux l [x1;x2] [y1;y2]
    | Eequiv (x1, x2, _), Eequiv (y1, y2, _) 
      -> List.fold_left2 unif_aux l [x1;x2] [y1;y2]

    | _, _ when (Expr.equal e1 e2) -> (e1, e2)::l
    | _, _ -> raise Unif_failed
;;

let unif t1 t2 = unif_aux [] t1 t2;; 

let rec rewrite_prop (l, r) fm = 
  try 
    let subst = unif l fm in 
    Expr.substitute subst r
  with 
  | Unif_failed -> 
     (match fm with 
      | Enot (fm2, _) -> 
	 enot (rewrite_prop (l, r) fm2)
      | _ -> fm)
;;

let rec norm_prop rules fm g accu = 
  match rules with 
  | [] -> (accu, fm)
  | (name, (l, r)) :: tl -> 
     let nfm = rewrite_prop (l, r) fm in 
     if (Expr.equal fm nfm) then
       norm_prop tl fm g accu
     else 
       let node = 
	 Node { 
	     nconc = [fm];
	     nrule = Ext ("modulo", name, [fm; l; r]);
	     nprio = Arity;
	     ngoal = g;
	     nbranches = [| [nfm] |];
	   } in 
       (node :: accu, nfm)
;;
  
let newnodes_rwrt_prop fm g accu = 
  let rules = Hashtbl.find_all !Expr.tbl_prop (find_sym fm) in
  let rules = List.sort (ordering_rules fm) rules in
  norm_prop rules fm g accu
;;
  
let rec rewrite_term (l, r) t = 
  try 
    let subst = unif l t in 
    Expr.substitute subst r
  with
  | Unif_failed -> t
;;
  
let rec norm_term rules t g accu = 
  match rules with 
  | [] -> (accu, t)
  | (name, (l, r)) :: tl -> 
     let nt = rewrite_term (l, r) t in 
     if (Expr.equal t nt) then 
       norm_term tl t g accu
     else
       let node = 
	 Node { 
	     nconc = [t];
	     nrule = Ext ("modulo", name, [t; l; r]);
	     nprio = Arity;
	     ngoal = g;
	     nbranches = [| [nt] |];
	   } in 
       norm_term tl nt g (node :: accu)
;;

let rec newnodes_rwrt_term t g accu = 
  let rules = Hashtbl.find_all !Expr.tbl_term (find_sym t) in 
  let rules = List.sort (ordering_rules t) rules in 
  let (nodes, nt) = norm_term rules t g [] in 
  if not (Expr.equal t nt) then 
    (assert (List.length nodes <> 0);
     newnodes_rwrt_term nt g (nodes @ accu))
  else
  (*  begin 
      match t with 
      | Eapp (sym, args, _) -> 
	 let f x y = newnodes_rwrt_term y g x in
	 List.fold_left f accu args
      | Enot (t1, _) -> 
	enot (f t1)
      | Eand (t1, t2, _) -> 
	eand (f t1, f t2)
      | Eor (t1, t2, _) -> 
	eor (f t1, f t2)
      | Eimply (t1, t2, _) -> 
	eimply (f t1, f t2)
      | Eequiv (t1, t2, _) -> 
	eequiv (f t1, f t2)
      | _ -> (accu, t)
    end *)
    (accu, t)
;;

let rec add_norm_nodes e g accu = 
  if is_literal e then 
    begin
      let (accu, et) = newnodes_rwrt_term e g accu in 
      let (accu, ep) = newnodes_rwrt_prop et g accu in 
      if (Expr.equal ep e) then 
        accu
      else
	add_norm_nodes ep g accu
    end
  else
    accu
;;

let newnodes e g _ = 
  add_norm_nodes e g []
;;

let make_inst m term g = assert false;;
let add_formula e = ();;
let remove_formula e = ();;
let preprocess l = Rewrite.select_rwrt_rules l;; 
let add_phrase x = ();;
let postprocess l = l;;

let to_llproof tr_expr mlp args = Array.get args 0
;;

let declare_context_coq oc =
  fprintf oc "Require Import zenon_record.\n";;

let p_rule_coq oc r = ();;

let predef () = [];;

Extension.register {
  Extension.name = "modulo";
  Extension.newnodes = newnodes;
  Extension.make_inst = make_inst;
  Extension.add_formula = add_formula;
  Extension.remove_formula = remove_formula;
  Extension.iter_open = (fun x -> false);
  Extension.preprocess = preprocess;
  Extension.add_phrase = add_phrase;
  Extension.postprocess = postprocess;
  Extension.to_llproof = to_llproof;
  Extension.declare_context_coq = declare_context_coq;
  Extension.p_rule_coq = p_rule_coq;
  Extension.predef = predef;
};;
