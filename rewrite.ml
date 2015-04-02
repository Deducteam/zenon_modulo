(*  Copyright 2003 INRIA  *)
Version.add "$Id$";;



open Expr;;
open Print;;
open Node;;
open Mlproof;;
open Phrase;;


let printer e = expr_soft (Chan stdout) e;;

let rec find_first_sym t =
  match t with
 (*   | Evar (sym, _) -> sym *)
    | Eapp (Evar(sym, _), _, _) -> sym
    | Enot (t1, _) -> find_first_sym t1
    | _ -> ""
;;

let b_axiom_to_rwrt_prop = [
  "infix_eqeq_def";
  "subset_def";
  "subsetnoteq_def";
  "empty1";
  "mem_singleton";
  "all_def";
  "mem_union";
  "mem_inter";
  "mem_diff";
  "mem_b_bool";
  "mem_times";
  "mem_power";
  "mem_relation";
  "mem_inverse";
  "mem_dom";
  "mem_ran";
  "mem_semicolon";
  "mem_id";
  "mem_domain_restriction";
  "mem_range_restriction";
  "mem_domain_substraction";
  "mem_range_substraction";
  "mem_image";
  "mem_overriding";
  "mem_direct_product";
  "mem_proj_op_1";
  "mem_proj_op_2";
  "mem_parallel_product";
  "mem_partial_function_set";
  "mem_total_function_set";
  "mem_partial_injection_set";
  "mem_total_injection_set";
  "mem_partial_surjection_set";
  "mem_total_surjection_set";
  "mem_partial_bijection_set";
  "mem_total_bijection_set";

  "abs_le";
  "abs_pos";
  "is_empty_def";
  "empty_def1";
  "add_def1";
  "remove_def1";
  "mem_natural";
  "mem_natural1";
  "mem_nat";
  "mem_nat1";
  "mem_bounded_int";
  "mem_interval";
  "mem_non_empty_power";
  "is_finite_subset";
  "is_finite_subset_def";
  "non_empty_finite_subsets";
  "closure_def";
  "closure1_def";
  "generalized_union_def";
  "seq_def";

  "mem_integer";
  "empty2";
  "finite_subsets_def";
  "non_empty_finite_subsets_def";
];;

let b_axiom_to_rwrt_term = [
  "tuple2_proj_1_def";
  "tuple2_proj_2_def";
  "tuple2_inversion";
  "semicolon_back1";
  "power_1";
  "seq_length_def";
  "div_1";
  "mod_1";
];;

(* new assoc and mem_assoc functions
   with the Expr.equal equality
   replacing =
*)

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

let ordering_two fm (l1, r1) (l2, r2) =
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

 let ordering (l1, r1) (l2, r2) =
  let fv_l1 = get_fv l1 in
  let fv_l2 = get_fv l2 in
  if List.length fv_l1 = List.length fv_l2 then 0
  else if List.length fv_l1 > List.length fv_l2 then 1
  else -1
;;

let restore_equal fm =
  match fm with
(*  | Eapp ("B_equal_set", [a1; a2], _)
       when (Expr.equal a1 a2)
    -> eapp ("=", [a1; a2])
  | Enot (Eapp ("B_equal_set", [a1; a2], _), _)
       when (Expr.equal a1 a2)
    -> enot (eapp ("=", [a1; a2]))*)
  | Eapp (Evar("B_equal_set", _), [a1; a2], _)
    ->
     begin
       match a1, a2 with
       | Evar _, Evar _
       | Evar _, Emeta _
       | Emeta _, Evar _
       | Emeta _, Emeta _
       | Etau _, Etau _
       | Evar _, Etau _
       | Etau _, Evar _
       | Emeta _, Etau _
       | Etau _, Emeta _
	 -> eeq a1 a2
       | _, _ -> fm
     end
  | Enot (Eapp (Evar("B_equal_set", _), [a1; a2], _), _)
    ->
     begin
       match a1, a2 with
       | Evar _, Evar _
       | Evar _, Emeta _
       | Emeta _, Evar _
       | Emeta _, Emeta _
       | Etau _, Etau _
       | Evar _, Etau _
       | Etau _, Evar _
       | Emeta _, Etau _
       | Etau _, Emeta _
	 -> enot (eeq a1 a2)
       | _, _ -> fm
     end
  | _ -> fm
;;


let rec rewrite_prop (l, r) p =
  try
    let subst = unif l p in
    Expr.substitute subst r
  with
  | Unif_failed ->
    (match p with
      | Enot (p2, _) ->
	enot (rewrite_prop (l, r) p2)
      | _ -> p)
;;

let rec norm_prop_aux rules fm =
  match rules with
    | [] -> fm
    | (l, r) :: tl ->
      begin
	let new_fm = rewrite_prop (l, r) fm in
	if (Expr.equal fm new_fm)
	then norm_prop_aux tl fm
	else
	  begin
	   (* Globals.compteur_rwrt_p := !Globals.compteur_rwrt_p + 1;*)
	    if !Globals.debug_flag || !Globals.debug_rwrt
	    then
	      begin
		print_endline "";
		print_endline " -- Rewriting Prop -- ";
		print_string "Fm : ";
		printer fm;
		print_string " --> ";
		printer new_fm;
		print_endline "";
		print_endline "";
	      end;
	    new_fm
	  end
      end
;;

let norm_prop fm =
  let rules = Hashtbl.find_all !Expr.tbl_prop (find_first_sym fm) in
  let rules_sort = List.sort (ordering_two fm) rules in
  norm_prop_aux rules_sort fm
;;

let rec rewrite_term (l, r) p =
  try
    let subst = unif l p in
    Expr.substitute subst r
  with
  | Unif_failed -> p
;;

let rec norm_term_aux rules t =
  match rules with
    | [] -> t
    | (l, r) :: tl ->
      norm_term_aux tl (rewrite_term (l, r) t)
;;

let rec norm_term t =
  let rules = Hashtbl.find_all !Expr.tbl_term (find_first_sym t) in
(*  let rules_sort = List.sort ordering rules in *)
  let rules_sort = List.sort (ordering_two t) rules in
  let new_t = norm_term_aux rules_sort t in
  if not (Expr.equal t new_t)
  then
    begin
      if !Globals.debug_flag || !Globals.debug_rwrt
      then
	begin
	  print_endline "";
	  print_endline " -- Rewriting Term -- ";
	  print_string "t : ";
	  printer t;
	  print_string " --> ";
	  printer new_t;
	  print_endline "";
	  print_endline "";
	end;
      norm_term new_t
    end
  else
    begin
      match t with
      | Eapp (f, args, _) ->
	eapp (f, (List.map norm_term args))
      | Enot (t1, _) ->
	enot (norm_term t1)
      | Eand (t1, t2, _) ->
	eand (norm_term t1, norm_term t2)
      | Eor (t1, t2, _) ->
	eor (norm_term t1, norm_term t2)
      | Eimply (t1, t2, _) ->
	eimply (norm_term t1, norm_term t2)
      | Eequiv (t1, t2, _) ->
	eequiv (norm_term t1, norm_term t2)

      | _ -> t
    end
;;

let is_literal fm =
  match fm with
  | Eapp(Evar(sym, _), _, _) -> true
  | Enot(Eapp(Evar(sym, _), _, _), _) -> true
  | _ -> false
;;


let rec normalize_fm fm =
(*  let fm = restore_equal fm in*)
  if is_literal fm then
    begin
      let fm_t = norm_term fm in
      let fm_p = norm_prop fm_t in
      if (Expr.equal fm_p fm)
      then fm
      else normalize_fm fm_p
    end
  else
    fm
;;

let rec normalize_list_aux accu list =
  match list with
  | [] -> List.rev accu
  | h :: t ->
    let new_accu = (normalize_fm h) :: accu in
    normalize_list_aux new_accu t
;;

let normalize_list list =
  normalize_list_aux [] list
;;


(* heuristic *)

let is_commut_term body =
  match body with
  | Eapp (Evar("=", _), [t1; t2], _) ->
     begin
      match t1, t2 with
      | Eapp (Evar(sym1, _), [e11; e12], _), Eapp (Evar(sym2, _), [e21; e22], _)
	  when
	    (sym1 = sym2)
	    && (Expr.equal e11 e22)
	    && (Expr.equal e12 e21)
	    -> true
      | _ -> false
    end

  | _ -> false
;;

let is_assoc_term body =
  match body with
  | Eapp (Evar("=", _), [t1; t2], _) ->
    begin
      match t1, t2 with
      | Eapp (Evar(sym11, _), [e11; Eapp (Evar(sym12, _), [e12; e13], _)], _),
        Eapp (Evar(sym21, _), [Eapp (Evar(sym22, _), [e21; e22], _); e23], _)
	  when
	    (sym11 = sym12)
	    && (sym12 = sym21)
	    && (sym21 = sym22)
	    && (Expr.equal e11 e21)
	    && (Expr.equal e12 e22)
	    && (Expr.equal e13 e23)
	    -> true
      | Eapp (Evar(sym11, _), [Eapp (Evar(sym12, _), [e11; e12], _); e13], _),
	Eapp (Evar(sym21, _), [e21; Eapp (Evar(sym22, _), [e22; e23], _)], _)
	  when
	    (sym11 = sym12)
	    && (sym12 = sym21)
	    && (sym21 = sym22)
	    && (Expr.equal e11 e21)
	    && (Expr.equal e12 e22)
	    && (Expr.equal e13 e23)
	    -> true
      | _ -> false
    end
  | _ -> false
;;

let rec test_fv l1 l2 =
  match l2 with
  | [] -> true
  | h :: tl when List.mem h l1 -> test_fv l1 tl
  | _ -> false
;;

let is_literal_noteq body =
  match body with
  | Eapp(Evar(sym, _), _, _) when (sym <> "=") -> true
  | Enot(Eapp(Evar(sym, _), _, _), _) when (sym <> "=")-> true
  | _ -> false
;;

let is_literal_eq body =
  match body with
  | Eapp(Evar(sym, _), _, _)  -> true
  | Enot(Eapp(Evar(sym, _), _, _), _)  -> true
  | _ -> false
;;

let rec is_equal_term body =
  match body with
  | Eapp (Evar("=", _), [t1; t2], _)
      when not (is_commut_term body) ->
     begin
       match t1, t2 with
       | Eapp _, _ -> test_fv (get_fv t1) (get_fv t2)
       | _, Eapp _ -> test_fv (get_fv t2) (get_fv t1)
       | _, _ -> false
     end
  | _ -> false
;;

(*let rec is_conj_term body =
  match body with
  | Eand (e1, e2, _) -> is_conj_term e1 && is_conj_term e2
  | _ -> is_equal_term body
;;*)

let rec is_heuri_rwrt_term body =
  match body with
  | Eall (_, pred, _) -> is_heuri_rwrt_term pred
  | _ -> is_equal_term body
;;

let rec is_equiv_prop body =
  if is_literal_noteq body
  then true
  else
    begin
      match body with
      | Eequiv (e1, e2, _) ->
	 begin
	   (is_literal_noteq e1
	    && test_fv (get_fv e1) (get_fv e2))
(*	   ||
	     (is_literal_noteq e2
	      && test_fv (get_fv e2) (get_fv e1)) *)
	 end
      | _ -> false
    end
;;

(*let rec is_conj_prop body =
  match body with
  | Eand (e1, e2, _) -> is_conj_prop e1 && is_conj_prop e2
  | _ -> is_equiv_prop body
;;*)

let rec is_heuri_rwrt_prop body =
  match body with
  | Eall (_, pred, _) -> is_heuri_rwrt_prop pred
  | _ -> is_equiv_prop body
;;

let split_to_prop_rule body =
  let parse_equiv body =
    match body with
    | Eequiv (expr1, expr2, _)
	 when is_literal_noteq expr1
	      && test_fv (get_fv expr1) (get_fv expr2)
      -> (expr1, expr2)
    | Eapp (Evar(sym, _), _, _) as expr
	 when sym <> "="
      -> (expr, etrue)
    | Enot (Eapp (Evar(sym, _), _, _) as expr, _)
	 when sym <> "="
      -> (expr, efalse)
    | _ -> assert false
  in
  let rec parse body =
    match body with
    | Eall (_, expr, _) -> parse expr
    | _ -> parse_equiv body
  in
  parse body
;;

let split_to_term_rule body =
  let parse_equal body =
    match body with
    | Eapp (Evar(sym, _), [expr1; expr2], _)
	 when sym = "="
      ->
       begin
	 match expr1, expr2 with
	 | Eapp _, _ when test_fv (get_fv expr1) (get_fv expr2)
	   -> (expr1, expr2)
	 | _, Eapp _ when test_fv (get_fv expr2) (get_fv expr1)
	   -> (expr2, expr1)
	 | _, _ -> assert false
       end
    | _ -> assert false
  in
  let rec parse body =
    match body with
    | Eall (_, expr, _) -> parse expr
    | _ -> parse_equal body
  in
  parse body
;;

let add_rwrt_term name body  =
  let (x, y) = split_to_term_rule body in
  Hashtbl.add !Expr.tbl_term (find_first_sym x) (x, y)
;;

let add_rwrt_prop name body =
  let (x, y) = split_to_prop_rule body in
  Hashtbl.add !Expr.tbl_prop (find_first_sym x) (x, y)
;;

let get_rwrt_from_def = function
  | DefReal (name, id, ty, args, body, _) ->
     (name, eeq (eapp (tvar id ty, args)) body)
  | DefPseudo (_, id, ty, args, body) ->  
     ("pseudoDef_"^id, eeq (eapp (tvar id ty, args)) body)
  | DefRec _ -> failwith "Recursive definitions not supported"
;;

let rec select_rwrt_rules_aux accu phrase =
  match phrase with
  | Hyp (name, body, flag)
       when (flag = 2) || (flag = 1) (*|| (flag = 12) || (flag = 11) *)
    ->
     begin
       if !Globals.build_rwrt_sys_B
	  && List.mem name b_axiom_to_rwrt_term
       then (add_rwrt_term name body; (Rew (name, body, 0) :: accu))
       else if !Globals.build_rwrt_sys_B
	       && List.mem name b_axiom_to_rwrt_prop
       then (add_rwrt_prop name body; (Rew (name, body, 1) :: accu))
       else if !Globals.build_rwrt_sys
	       && is_heuri_rwrt_prop body
       then (add_rwrt_prop name body; (Rew (name, body, 1) :: accu))
  (*     else if !Globals.build_rwrt_sys
	       && is_heuri_rwrt_term body
       then (add_rwrt_term name body; (Rew (name, body, 0) :: accu)) *)
       else if !Globals.build_rwrt_sys_casc
	       && is_heuri_rwrt_prop body
       then (add_rwrt_prop name body; (Rew (name, body, 1) :: accu))

       else phrase :: accu;
     end
  | Def d -> 
     let (name, body) = get_rwrt_from_def d in
     add_rwrt_term name body;
     phrase :: accu
  | _ -> phrase :: accu
;;

let select_rwrt_rules phrases =
  List.rev (List.fold_left select_rwrt_rules_aux [] phrases)
;;
