open Printf
open Dkterm

(* taken on 25/06/24 from
https://github.com/Deducteam/lambdapi/blob/master/src/parsing/lpLexer.ml *)
let forbidden_idents = [
  "abort"
  ; "admit"
  ; "admitted"
  ; "apply"
  ; "as"
  ; "assert"
  ; "assertnot"
  ; "associative"
  ; "assume"
  ; "begin"
  ; "builtin"
  ; "coerce_rule"
  ; "commutative"
  ; "compute"
  ; "constant"
  ; "debug"
  ; "end"
  ; "fail"
  ; "flag"
  ; "generalize"
  ; "have"
  ; "in"
  ; "induction"
  ; "inductive"
  ; "infix"
  ; "injective"
  ; "left"
  ; "let"
  ; "notation"
  ; "off"
  ; "on"
  ; "opaque"
  ; "open"
  ; "postfix"
  ; "prefix"
  ; "print"
  ; "private"
  ; "proofterm"
  ; "protected"
  ; "prover"
  ; "prover_timeout"
  ; "quantifier"
  ; "refine"
  ; "reflexivity"
  ; "remove"
  ; "require"
  ; "rewrite"
  ; "right"
  ; "rule"
  ; "search"
  ; "sequential"
  ; "simplify"
  ; "solve"
  ; "symbol"
  ; "symmetry"
  ; "try"
  ; "type"
  ; "TYPE"
  ; "unif_rule"
  ; "verbose"
  ; "why3"
  ; "with"
  ; "`"
  ; ","
  ; ":"
  ; "|"
  ; "_"
  ]

let escape_name s =
  let id_regex = Str.regexp "^[a-zA-Z_][a-zA-Z0-9_]*$" in
  if Str.string_match id_regex s 0
    && List.for_all ((<>) s) forbidden_idents
    then s else "{|" ^ s ^ "|}"

let rec print_dk_type_aux o (t, var_context) =
  match t with
  | Dktypetype -> fprintf o "Set"
  | Dktypeprop -> fprintf o "Prop"
  | Dkarrow (l, r) ->
     begin
       List.iter (fun x -> fprintf o "%a → " print_dk_type_aux (x, var_context)) l;
       print_dk_type_aux o (r, var_context);
     end
  | Dkpi (Dkvar (_, t1) as var, t2) ->
  let pvar = escape_name (get_var_newname var) in
      fprintf o "Π (%s : %a),\n %a"
	      pvar print_dk_type_aux (t1, var_context) print_dk_type_aux (t2, pvar::var_context)
  | Dkpi _ -> assert false
  | Dkproof (t) ->
     fprintf o "π (%a)" print_dk_term_aux (t, var_context)
  | t -> fprintf o "τ (%a)" print_dk_zentype_aux (t, var_context)
and print_dk_type o t = print_dk_type_aux o (t, [])
and print_dk_zentype_aux o (t, l) =
  match t with
  | Dktypeiota -> fprintf o "ι"
  | t -> print_dk_term_aux o (t, l)
(* and print_dk_zentype o t = print_dk_zentype_aux o (t, []) *)
and print_dk_cst o t =
  match t with
  | "Is_true" -> fprintf o "dk_logic.ebP"
  | "FOCAL.ifthenelse" -> fprintf o "dk_bool.ite"
  | s ->
     if Mltoll.is_meta s then fprintf o "select ι"
     else
       begin
         if !Globals.signature_name = "" then fprintf o "%s" (escape_name s)
         else fprintf o "S.%s" (escape_name s);
         if !Globals.conjecture <> ""
            && not !Globals.check_axiom && Typetptp.is_axiom s then
           fprintf o " __negated_conjecture_proof__"
       end

and print_dk_term_aux o (t, var_context) =
  match t with
  | Dkvar (v, _) as var ->
    let pvar = (escape_name (get_var_newname var)) in
    if not (List.mem pvar var_context)
    then fprintf o "select ι"
    else fprintf o "%s" pvar
 | Dklam (Dkvar (_, t1) as var, t2) ->
      let pvar = (escape_name (get_var_newname var)) in
     fprintf o "λ (%s : %a),\n %a"
	     pvar
	     print_dk_type_aux (t1, var_context) print_dk_term_aux (t2, (pvar::var_context))
  | Dklam (Dkapp (v, t1, []), t2) ->
      let pvar = escape_name v in
     fprintf o "λ (%s : %a),\n %a"
	     pvar print_dk_type_aux (t1, var_context) print_dk_term_aux (t2, (pvar::var_context))
  | Dklam _ -> assert false
  | Dkapp (v, _, l) ->
     begin
       print_dk_cst o v;
       List.iter (fun x -> fprintf o " (%a)" print_dk_term_aux (x, var_context)) l;
(*       fprintf o "\n ";*)
     end
  | Dkseq -> fprintf o "π ⊥"
  | Dknot (t) ->
     fprintf o "¬\n (%a)" print_dk_term_aux  (t, var_context)
  | Dkand (t1, t2) ->
     fprintf o "(%a)\n∧\n(%a)\n" print_dk_term_aux (t1, var_context) print_dk_term_aux (t2, var_context)
  | Dkor (t1, t2) ->
     fprintf o "(%a)\n∨\n(%a)\n" print_dk_term_aux (t1, var_context) print_dk_term_aux (t2, var_context)
  | Dkimply (t1, t2) ->
     fprintf o "(%a)\n⇒\n(%a)\n" print_dk_term_aux (t1, var_context) print_dk_term_aux (t2, var_context)
  | Dkequiv (t1, t2) ->
     fprintf o "(%a)\n⇔\n(%a)\n" print_dk_term_aux (t1, var_context) print_dk_term_aux (t2, var_context)
  | Dkforall (_, t2) ->
     fprintf o "∀ (%a)" print_dk_term_aux (t2, var_context)
     (* fprintf o "@∀ (%a)\n (%a)" print_dk_zentype_aux (t1, var_context) print_dk_term_aux (t2, var_context) *)
  | Dkexists (_, t2) ->
     fprintf o "∃ (%a)" print_dk_term_aux (t2, var_context)
     (* fprintf o "@∃ (%a)\n (%a)" print_dk_zentype_aux  (t1, var_context) print_dk_term_aux (t2, var_context) *)
  | Dkforalltype (t) ->
     fprintf o "foralltype\n (%a)" print_dk_term_aux (t, var_context)
  | Dkexiststype (t) ->
     fprintf o "existstype\n (%a)" print_dk_term_aux (t, var_context)
  | Dktrue -> fprintf o "⊤"
  | Dkfalse -> fprintf o "⊥"
  | Dkequal (_, t2, t3) ->
     fprintf o "(%a) = (%a)"
	     print_dk_term_aux (t2, var_context)
	     print_dk_term_aux (t3, var_context)
  | DkRfalse (pr) -> fprintf o "Rfalse\n (%a)" print_dk_term_aux (pr, var_context)
  | DkRnottrue (pr) -> fprintf o "Rnottrue\n (%a)" print_dk_term_aux (pr, var_context)
  | DkRaxiom (p, pr1, pr2) ->
     fprintf o "Raxiom\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRnoteq (a, t, pr) ->
     fprintf o "Rnoteq\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, var_context)
	     print_dk_term_aux (t, var_context)
	     print_dk_term_aux (pr, var_context)
  | DkReqsym (a, t, u, pr1, pr2) ->
     fprintf o "Reqsym\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, var_context)
	     print_dk_term_aux (t, var_context)
	     print_dk_term_aux (u, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRcut (p, pr1, pr2) ->
     fprintf o "Rcut\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRnotnot (p, pr1, pr2) ->
     fprintf o "Rnotnot\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRand (p, q, pr1, pr2) ->
     fprintf o "Rand\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (q, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRor (p, q, pr1, pr2, pr3) ->
     fprintf o "Ror\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (q, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
	     print_dk_term_aux (pr3, var_context)
  | DkRimply (p, q, pr1, pr2, pr3) ->
     fprintf o "Rimply\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (q, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
	     print_dk_term_aux (pr3, var_context)
  | DkRequiv (p, q, pr1, pr2, pr3) ->
     fprintf o "Requiv\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (q, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
	     print_dk_term_aux (pr3, var_context)
  | DkRnotand (p, q, pr1, pr2, pr3) ->
     fprintf o "Rnotand\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (q, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
	     print_dk_term_aux (pr3, var_context)
  | DkRnotor (p, q, pr1, pr2) ->
     fprintf o "Rnotor\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (q, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRnotimply (p, q, pr1, pr2) ->
     fprintf o "Rnotimply\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (q, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRnotequiv (p, q, pr1, pr2, pr3) ->
     fprintf o "Rnotequiv\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (q, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
	     print_dk_term_aux (pr3, var_context)
  | DkRex (a, p, pr1, pr2) ->
     fprintf o "Rex\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, var_context)
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRall (a, p, t, pr1, pr2) ->
     fprintf o "Rall\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, var_context)
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (t, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRnotex (a, p, t, pr1, pr2) ->
     fprintf o "Rnotex\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, var_context)
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (t, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRnotall (a, p, pr1, pr2) ->
     fprintf o "Rnotall\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, var_context)
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRextype (p, pr1, pr2) ->
     fprintf o "Rextype\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRalltype (p, a, pr1, pr2) ->
     fprintf o "Ralltype\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_zentype_aux (a, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRnotextype (p, a, pr1, pr2) ->
     fprintf o "Rnotextype\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_zentype_aux (a, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRnotalltype (p, pr1, pr2) ->
     fprintf o "Rnotalltype\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
  | DkRsubst  (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "Rsubst\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, var_context)
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (t1, var_context)
	     print_dk_term_aux (t2, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
	     print_dk_term_aux (pr3, var_context)
  | DkRconglr (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "Rconglr\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, var_context)
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (t1, var_context)
	     print_dk_term_aux (t2, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
	     print_dk_term_aux (pr3, var_context)
  | DkRcongrl (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "Rcongrl\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype_aux (a, var_context)
	     print_dk_term_aux (p, var_context)
	     print_dk_term_aux (t1, var_context)
	     print_dk_term_aux (t2, var_context)
	     print_dk_term_aux (pr1, var_context)
	     print_dk_term_aux (pr2, var_context)
	     print_dk_term_aux (pr3, var_context)
  | _ -> assert false
 and print_dk_term o t = print_dk_term_aux o (t, [])


(* let rec pr_list_var o l =
  match l with
  | [] -> ()
  | [Dkvar (v, t) as var] ->
     fprintf o "%s : %a" (get_var_newname var) print_dk_type t
  | (Dkvar (v, t) as var) :: tl ->
     fprintf o "%s : %a, %a"
	     (get_var_newname var)
	     print_dk_type t
	     pr_list_var tl
  | _ -> assert false *)


let rec get_var_names l =
  match l with
  | [] -> []
  | (Dkvar (_, _) as var) :: l' -> (escape_name (get_var_newname var)) :: (get_var_names l')
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


let print_proof o _ proof =
  fprintf o "%a\n"
	  print_dk_term proof
