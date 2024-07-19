open Printf
open Dkterm

(* taken on 19/07/24 from
https://github.com/Deducteam/Dedukti/blob/master/parsing/lexer.mll *)
let forbidden_idents = [
  "(;"
  ; ";)"
  ; "."
  ; ","
  ; ":"
  ; "=="
  ; "["
  ; "]"
  ; "{"
  ; "}"
  ; "("
  ; ")"
  ; "-->"
  ; "->"
  ; "=>"
  ; ":="
  ; "Type"
  ; "def"
  ; "defac"
  ; "defacu"
  ; "injective"
  ; "thm"
  ; "private"
  ; "require"
  ; "assert"
  ; "#NAME"
  ; "#REQUIRE"
  ; "#EVAL"
  ; "#INFER"
  ; "#CHECK"
  ; "#CHECKNOT"
  ; "#ASSERT"
  ; "#ASSERTNOT"
  ; "#PRINT"
  ; "#GDT"
  ]

let escape_name s =
  let id_regex = Str.regexp "^[a-zA-Z_][a-zA-Z0-9_]*$" in
  if Str.string_match id_regex s 0
    && List.for_all ((<>) s) forbidden_idents
    then s else "{|" ^ s ^ "|}"

let rec print_dk_type o t =
  match t with
  | Dktypetype -> fprintf o "zenon.type"
  | Dktypeprop -> fprintf o "zenon.prop"
  | Dkarrow (l, r) ->
     begin
       List.iter (fun x -> fprintf o "%a -> " print_dk_type x) l;
       print_dk_type o r;
     end
  | Dkpi (Dkvar (_, t1) as var, t2) ->
     fprintf o "%s : %a\n -> %a"
	     (get_var_newname var) print_dk_type t1 print_dk_type t2
  | Dkpi _ -> assert false
  | Dkproof (t) ->
     fprintf o "zenon.proof (%a)" print_dk_term t
  | t -> fprintf o "zenon.term (%a)" print_dk_zentype t

and print_dk_zentype o t =
  match t with
  | Dktypeiota -> fprintf o "zenon.iota"
  | t -> print_dk_term o t

and print_dk_cst o t =
  match t with
  | "Is_true" -> fprintf o "dk_logic.ebP"
  | "FOCAL.ifthenelse" -> fprintf o "dk_bool.ite"
  | s ->
     if Mltoll.is_meta s then fprintf o "zenon.select (zenon.iota)"
     else
       begin
         if !Globals.signature_name = "" then fprintf o "%s" (escape_name s)
         else fprintf o "%s.%s" !Globals.signature_name (escape_name s);
         if !Globals.conjecture <> ""
            && not !Globals.check_axiom && Typetptp.is_axiom s then
           fprintf o " __negated_conjecture_proof__"
       end

and print_dk_term o t =
  match t with
  | Dkvar (_, _) as var ->
     fprintf o "%s" (get_var_newname var)
  | Dklam (Dkvar (_, t1) as var, t2) ->
     fprintf o "%s : (%a)\n => %a"
	     (get_var_newname var)
	     print_dk_type t1 print_dk_term t2
  | Dklam (Dkapp (v, t1, []), t2) ->
     fprintf o "%s : (%a)\n => %a"
	     v print_dk_type t1 print_dk_term t2
  | Dklam _ -> assert false
  | Dkapp (v, _, l) ->
     begin
       print_dk_cst o v;
       List.iter (fun x -> fprintf o " (%a)" print_dk_term x) l;
(*       fprintf o "\n ";*)
     end
  | Dkseq -> fprintf o "zenon.seq"
  | Dknot (t) ->
     fprintf o "zenon.not\n (%a)" print_dk_term t
  | Dkand (t1, t2) ->
     fprintf o "zenon.and\n (%a) (%a)" print_dk_term t1 print_dk_term t2
  | Dkor (t1, t2) ->
     fprintf o "zenon.or\n (%a) (%a)" print_dk_term t1 print_dk_term t2
  | Dkimply (t1, t2) ->
     fprintf o "zenon.imp\n (%a) (%a)" print_dk_term t1 print_dk_term t2
  | Dkequiv (t1, t2) ->
     fprintf o "zenon.eqv\n (%a) (%a)" print_dk_term t1 print_dk_term t2
  | Dkforall (t1, t2) ->
     fprintf o "zenon.forall (%a)\n (%a)" print_dk_zentype t1 print_dk_term t2
  | Dkexists (t1, t2) ->
     fprintf o "zenon.exists (%a)\n (%a)" print_dk_zentype t1 print_dk_term t2
  | Dkforalltype (t) ->
     fprintf o "zenon.foralltype\n (%a)" print_dk_term t
  | Dkexiststype (t) ->
     fprintf o "zenon.existstype\n (%a)" print_dk_term t
  | Dktrue -> fprintf o "zenon.True"
  | Dkfalse -> fprintf o "zenon.False"
  | Dkequal (t1, t2, t3) ->
     fprintf o "zenon.equal (%a)\n (%a)\n (%a)"
	     print_dk_zentype t1
	     print_dk_term t2
	     print_dk_term t3
  | DkRfalse (pr) -> fprintf o "zenon.Rfalse\n (%a)" print_dk_term pr
  | DkRnottrue (pr) -> fprintf o "zenon.Rnottrue\n (%a)" print_dk_term pr
  | DkRaxiom (p, pr1, pr2) ->
     fprintf o "zenon.Raxiom\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnoteq (a, t, pr) ->
     fprintf o "zenon.Rnoteq\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype a
	     print_dk_term t
	     print_dk_term pr
  | DkReqsym (a, t, u, pr1, pr2) ->
     fprintf o "zenon.Reqsym\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype a
	     print_dk_term t
	     print_dk_term u
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRcut (p, pr1, pr2) ->
     fprintf o "zenon.Rcut\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotnot (p, pr1, pr2) ->
     fprintf o "zenon.Rnotnot\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRand (p, q, pr1, pr2) ->
     fprintf o "zenon.Rand\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRor (p, q, pr1, pr2, pr3) ->
     fprintf o "zenon.Ror\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRimply (p, q, pr1, pr2, pr3) ->
     fprintf o "zenon.Rimply\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRequiv (p, q, pr1, pr2, pr3) ->
     fprintf o "zenon.Requiv\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRnotand (p, q, pr1, pr2, pr3) ->
     fprintf o "zenon.Rnotand\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRnotor (p, q, pr1, pr2) ->
     fprintf o "zenon.Rnotor\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotimply (p, q, pr1, pr2) ->
     fprintf o "zenon.Rnotimply\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotequiv (p, q, pr1, pr2, pr3) ->
     fprintf o "zenon.Rnotequiv\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRex (a, p, pr1, pr2) ->
     fprintf o "zenon.Rex\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype a
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRall (a, p, t, pr1, pr2) ->
     fprintf o "zenon.Rall\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype a
	     print_dk_term p
	     print_dk_term t
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotex (a, p, t, pr1, pr2) ->
     fprintf o "zenon.Rnotex\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype a
	     print_dk_term p
	     print_dk_term t
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotall (a, p, pr1, pr2) ->
     fprintf o "zenon.Rnotall\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype a
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRextype (p, pr1, pr2) ->
     fprintf o "zenon.Rextype\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRalltype (p, a, pr1, pr2) ->
     fprintf o "zenon.Ralltype\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_zentype a
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotextype (p, a, pr1, pr2) ->
     fprintf o "zenon.Rnotextype\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_zentype a
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotalltype (p, pr1, pr2) ->
     fprintf o "zenon.Rnotalltype\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRsubst  (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "zenon.Rsubst\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype a
	     print_dk_term p
	     print_dk_term t1
	     print_dk_term t2
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRconglr (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "zenon.Rconglr\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype a
	     print_dk_term p
	     print_dk_term t1
	     print_dk_term t2
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRcongrl (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "zenon.Rcongrl\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_zentype a
	     print_dk_term p
	     print_dk_term t1
	     print_dk_term t2
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | _ -> assert false


let rec pr_list_var o l =
  match l with
  | [] -> ()
  | [Dkvar (_, t) as var] ->
     fprintf o "%s : %a" (get_var_newname var) print_dk_type t
  | (Dkvar (_, t) as var) :: tl ->
     fprintf o "%s : %a, %a"
	     (get_var_newname var)
	     print_dk_type t
	     pr_list_var tl
  | _ -> assert false


let print_line o line =
  match line with
  | Dkdecl (v, _) when String.contains v '.' ->
     ()
  | Dkdecl (v, t) ->
     fprintf o "def %s : %a.\n\n" v print_dk_type t
  | Dkrwrt (_, Dkapp (s, _, _), _) when String.contains s '.' || s = "Is_true" ->
     ()
  | Dkrwrt (l, t1, t2) ->
     fprintf o "[%a]\n %a \n --> %a.\n\n"
	     pr_list_var l print_dk_term t1 print_dk_term t2


let print_goal_type o name goal =
  fprintf o "def %s :\n %a\n -> %a.\n"
	  name print_dk_type goal print_dk_term mk_seq


let print_proof o name proof =
  fprintf o "[] %s -->\n %a.\n"
	  name print_dk_term proof
