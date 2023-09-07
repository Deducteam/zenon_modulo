open Printf
open Dkterm

let forbidden_idents = ["abort";"admit";"admitted";"apply";"as";"assert";"assertnot";
                        "associative";"assume";"begin";"builtin";"commutative";"compute";
                        "constant";"debug";"end";"fail";"flag";"focus";"have";"generalize";
                        "in";"induction";"inductive";"infix";"injective";"left";"let";
                        "notation";"off";"on";"opaque";"open";"prefix";"print";"private";
                        "proofterm";"protected";"prover";"prover_timeout";"quantifier";
                        "refine";"reflexivity";"require";"rewrite";"right";"rule";"sequential";
                        "simplify";"solve";"symbol";"symmetry";"type";"TYPE";"unif_rule";
                        "verbose";"why3";"with"; "_"]

let escape_name s =
  let id_regex = Str.regexp "^[a-zA-Z_][a-zA-Z0-9_]*$" in
  if Str.string_match id_regex s 0 
    && List.for_all ((<>) s) forbidden_idents 
    then s else "{|" ^ s ^ "|}"

   
let check_pvar v l = if List.mem v l then "&" ^ v else v
let delete_pvar v l = List.filter (fun x -> x <> v) l

let rec print_dk_type_aux o (t, l_rule) =
  match t with
  | Dktypetype -> fprintf o "Type"
  | Dktypeprop -> fprintf o "Prop"
  | Dkarrow (l, r) ->
     begin
       List.iter (fun x -> fprintf o "%a → " print_dk_type_aux (x, l_rule)) l;
       print_dk_type_aux o (r, l_rule);
     end
  | Dkpi (Dkvar (v, t1) as var, t2) ->
  let pvar = escape_name (get_var_newname var) in
      fprintf o "Π (%s : %a),\n %a"
	      pvar print_dk_type_aux (t1, l_rule) print_dk_type_aux (t2, delete_pvar pvar l_rule)
  | Dkpi _ -> assert false
  | Dkproof (t) ->
     fprintf o "ϵ (%a)" print_dk_term_aux (t, l_rule)
  | t -> fprintf o "τ (%a)" print_dk_zentype_aux (t, l_rule)
and print_dk_type o t = print_dk_type_aux o (t, [])
and print_dk_zentype_aux o (t, l) =
  match t with
  | Dktypeiota -> fprintf o "ι"
  | t -> print_dk_term_aux o (t, l)
and print_dk_zentype o t = print_dk_zentype_aux o (t, [])
and print_dk_cst o t =
  match t with
  | "Is_true" -> fprintf o "dk_logic.ebP"
  | "FOCAL.ifthenelse" -> fprintf o "dk_bool.ite"
  | s -> if !Globals.signature_name = "" then fprintf o "%s" (escape_name s) else
    if Mltoll.is_meta s then fprintf o "select ι" else
    if s = !Globals.neg_conj then fprintf o "%s" s else
      begin
        fprintf o "S.%s" (escape_name s);
        if not !Globals.check_axiom && Typetptp.is_axiom s then
          fprintf o " %s" !Globals.neg_conj
      end

and print_dk_term_aux o (t, l_rule) =
  match t with
  | Dkvar (v, _) as var ->
      let pvar = (escape_name (get_var_newname var)) in
      fprintf o "%s" (check_pvar pvar l_rule)
 | Dklam (Dkvar (v, t1) as var, t2) ->
      let pvar = (escape_name (get_var_newname var)) in
     fprintf o "λ (%s : %a),\n %a"
	     pvar
	     print_dk_type_aux (t1, l_rule) print_dk_term_aux (t2, (delete_pvar pvar l_rule))
  | Dklam (Dkapp (v, t1, []), t2) ->
      let pvar = escape_name v in
     fprintf o "λ (%s : %a),\n %a"
	     pvar print_dk_type_aux (t1, l_rule) print_dk_term_aux (t2, (delete_pvar pvar l_rule))
  | Dklam _ -> assert false
  | Dkapp (v, _, l) ->
     begin
       print_dk_cst o v;
       List.iter (fun x -> fprintf o " (%a)" print_dk_term_aux (x, l_rule)) l;
(*       fprintf o "\n ";*)
     end
  | Dkseq -> fprintf o "ϵ ⊥"
  | Dknot (t) ->
     fprintf o "¬\n (%a)" print_dk_term_aux  (t, l_rule)
  | Dkand (t1, t2) ->
     fprintf o "(%a)\n∧\n(%a)\n" print_dk_term_aux (t1, l_rule) print_dk_term_aux (t2, l_rule)
  | Dkor (t1, t2) ->
     fprintf o "(%a)\n∨\n(%a)\n" print_dk_term_aux (t1, l_rule) print_dk_term_aux (t2, l_rule)
  | Dkimply (t1, t2) ->
     fprintf o "(%a)\n⇒\n(%a)\n" print_dk_term_aux (t1, l_rule) print_dk_term_aux (t2, l_rule)
  | Dkequiv (t1, t2) ->
     fprintf o "(%a)\n⇔\n(%a)\n" print_dk_term_aux (t1, l_rule) print_dk_term_aux (t2, l_rule)
  | Dkforall (_, t2) ->
     fprintf o "∀α (%a)" print_dk_term_aux (t2, l_rule)
     (* fprintf o "@∀ (%a)\n (%a)" print_dk_zentype_aux (t1, l_rule) print_dk_term_aux (t2, l_rule) *)
  | Dkexists (_, t2) ->
     fprintf o "∃α (%a)" print_dk_term_aux (t2, l_rule)
     (* fprintf o "@∃ (%a)\n (%a)" print_dk_zentype_aux  (t1, l_rule) print_dk_term_aux (t2, l_rule) *)
  | Dkforalltype (t) ->
     fprintf o "foralltype\n (%a)" print_dk_term_aux (t, l_rule)
  | Dkexiststype (t) ->
     fprintf o "existstype\n (%a)" print_dk_term_aux (t, l_rule)
  | Dktrue -> fprintf o "⊤"
  | Dkfalse -> fprintf o "⊥"
  | Dkequal (t1, t2, t3) ->
     fprintf o "(%a) =α (%a)"
	     print_dk_term_aux (t2, l_rule)
	     print_dk_term_aux (t3, l_rule)
  | DkRfalse (pr) -> fprintf o "Rfalse\n (%a)" print_dk_term_aux (pr, l_rule)
  | DkRnottrue (pr) -> fprintf o "Rnottrue\n (%a)" print_dk_term_aux (pr, l_rule)
  | DkRaxiom (p, pr1, pr2) ->
     fprintf o "Raxiom\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRnoteq (a, t, pr) ->
     fprintf o "Rnoteq\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, l_rule)
	     print_dk_term_aux (t, l_rule)
	     print_dk_term_aux (pr, l_rule)
  | DkReqsym (a, t, u, pr1, pr2) ->
     fprintf o "Reqsym\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, l_rule)
	     print_dk_term_aux (t, l_rule)
	     print_dk_term_aux (u, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRcut (p, pr1, pr2) ->
     fprintf o "Rcut\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRnotnot (p, pr1, pr2) ->
     fprintf o "Rnotnot\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRand (p, q, pr1, pr2) ->
     fprintf o "Rand\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (q, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRor (p, q, pr1, pr2, pr3) ->
     fprintf o "Ror\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (q, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
	     print_dk_term_aux (pr3, l_rule)
  | DkRimply (p, q, pr1, pr2, pr3) ->
     fprintf o "Rimply\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (q, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
	     print_dk_term_aux (pr3, l_rule)
  | DkRequiv (p, q, pr1, pr2, pr3) ->
     fprintf o "Requiv\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (q, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
	     print_dk_term_aux (pr3, l_rule)
  | DkRnotand (p, q, pr1, pr2, pr3) ->
     fprintf o "Rnotand\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (q, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
	     print_dk_term_aux (pr3, l_rule)
  | DkRnotor (p, q, pr1, pr2) ->
     fprintf o "Rnotor\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (q, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRnotimply (p, q, pr1, pr2) ->
     fprintf o "Rnotimply\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (q, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRnotequiv (p, q, pr1, pr2, pr3) ->
     fprintf o "Rnotequiv\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (q, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
	     print_dk_term_aux (pr3, l_rule)
  | DkRex (a, p, pr1, pr2) ->
     fprintf o "Rex\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, l_rule)
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRall (a, p, t, pr1, pr2) ->
     fprintf o "Rall\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, l_rule)
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (t, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRnotex (a, p, t, pr1, pr2) ->
     fprintf o "Rnotex\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, l_rule)
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (t, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRnotall (a, p, pr1, pr2) ->
     fprintf o "Rnotall\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, l_rule)
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRextype (p, pr1, pr2) ->
     fprintf o "Rextype\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRalltype (p, a, pr1, pr2) ->
     fprintf o "Ralltype\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_zentype_aux (a, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRnotextype (p, a, pr1, pr2) ->
     fprintf o "Rnotextype\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_zentype_aux (a, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRnotalltype (p, pr1, pr2) ->
     fprintf o "Rnotalltype\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
  | DkRsubst  (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "Rsubst\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, l_rule)
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (t1, l_rule)
	     print_dk_term_aux (t2, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
	     print_dk_term_aux (pr3, l_rule)
  | DkRconglr (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "Rconglr\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, l_rule)
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (t1, l_rule)
	     print_dk_term_aux (t2, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
	     print_dk_term_aux (pr3, l_rule)
  | DkRcongrl (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "Rcongrl\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, l_rule)
	     print_dk_term_aux (p, l_rule)
	     print_dk_term_aux (t1, l_rule)
	     print_dk_term_aux (t2, l_rule)
	     print_dk_term_aux (pr1, l_rule)
	     print_dk_term_aux (pr2, l_rule)
	     print_dk_term_aux (pr3, l_rule)
  | _ -> assert false
 and print_dk_term o t = print_dk_term_aux o (t, [])


let rec pr_list_var o l =
  match l with
  | [] -> ()
  | [Dkvar (v, t) as var] ->
     fprintf o "%s : %a" (get_var_newname var) print_dk_type t
  | (Dkvar (v, t) as var) :: tl ->
     fprintf o "%s : %a, %a"
	     (get_var_newname var)
	     print_dk_type t
	     pr_list_var tl
  | _ -> assert false


let rec get_var_names l =
  match l with
  | [] -> []
  | (Dkvar (v, t) as var) :: l' -> (escape_name (get_var_newname var)) :: (get_var_names l')
  | _ -> assert false



let print_line o line =
  match line with
  | Dkdecl (v, _) when String.contains v '.' ->
     ()
  | Dkdecl (v, t) ->

     fprintf o "symbol %s : %a;\n\n" (escape_name v) print_dk_type t
  | Dkrwrt (_, Dkapp (s, _, _), _) when String.contains s '.' || s = "Is_true" ->
     ()
  | Dkrwrt (l, t1, t2) ->
      (* fprintf o "[%a]\n %a \n → %a\n\n"
	     pr_list_var l print_dk_term_aux (t1, get_var_names l) print_dk_term_aux (t2, get_var_names l) *)
       fprintf o "rule %a \n ↪ %a;\n\n"
	      print_dk_term_aux (t1, get_var_names l) print_dk_term_aux (t2, get_var_names l)


let print_goal_type o name goal =
  fprintf o "symbol %s :\n %a\n → %a\n"
	 (escape_name name) print_dk_type goal print_dk_term mk_seq


let print_proof o name proof =
  fprintf o "%a\n"
	  print_dk_term proof

