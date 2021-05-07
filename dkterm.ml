open Printf
open Expr

let forbidden_idents = ["require"; "open"; "as"; "let"; "in"; "symbol"; "definition"; "theorem"; "rule"; "and"; "assert"; "assertnot"; "const"; "injective"; "TYPE"; "pos"; "neg"; "proof"; "refine"; "intro"; "apply"; "simpl"; "rewrite"; "reflexivity"; "symmetry"; "focus"; "print"; "proofterm"; "qed"; "admit"; "abort"; "set"; "_"];;

let escape_name s =
  let id_regex = Str.regexp "^[a-zA-Z_][a-zA-Z0-9_]*$" in
  if Str.string_match id_regex s 0 
    && List.for_all ((<>) s) forbidden_idents 
    then s else "{|" ^ s ^ "|}"

type var = string

type dkterm =
  | Dktypetype                                  (* type type *)
  | Dktypeprop                                  (* type prop *)
  | Dktypeiota                                  (* type iota *)
  | Dkseq                                       (* type seq *)
  | Dkproof       of dkterm                     (* type proof of prop *)
(*  | Dkterm        of dkterm                *)     (* type term of app *)
  | Dkarrow       of dkterm list * dkterm       (* type arrow of type list *)
  | Dkpi          of dkterm * dkterm            (* type pi of var*arrow *)

  | Dkvar         of var  * dkterm              (* term var of string*type *)
  | Dklam         of dkterm * dkterm            (* term lam of var*prop *)
  | Dkapp         of var * dkterm * dkterm list (* term app of string*type*args *)

  | Dknot         of dkterm                    (* not of prop *)
  | Dkand         of dkterm * dkterm           (* and of 2 prop *)
  | Dkor          of dkterm * dkterm           (* or of 2 prop *)
  | Dkimply       of dkterm * dkterm           (* imply of 2 prop *)
  | Dkequiv       of dkterm * dkterm           (* equiv of 2 prop *)
  | Dkforall      of dkterm * dkterm           (* forall of type*lambda *)
  | Dkexists      of dkterm * dkterm           (* exists of type*lambda *)
  | Dkforalltype  of dkterm                    (* foralltype of lambda *)
  | Dkexiststype  of dkterm                    (* existstype of lambda *)
  | Dktrue                                     (* true *)
  | Dkfalse                                    (* false *)
  | Dkequal       of dkterm * dkterm * dkterm  (* equal type*term*term *)

  | DkRfalse        of dkterm
  | DkRnottrue      of dkterm
  | DkRaxiom        of dkterm * dkterm * dkterm
  | DkRnoteq        of dkterm * dkterm * dkterm
  | DkReqsym        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRcut          of dkterm * dkterm * dkterm
  | DkRnotnot       of dkterm * dkterm * dkterm
  | DkRand          of dkterm * dkterm * dkterm * dkterm
  | DkRor           of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRimply        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRequiv        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotand       of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotor        of dkterm * dkterm * dkterm * dkterm
  | DkRnotimply     of dkterm * dkterm * dkterm * dkterm
  | DkRnotequiv     of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRex           of dkterm * dkterm * dkterm * dkterm
  | DkRall          of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotex        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotall       of dkterm * dkterm * dkterm * dkterm
  | DkRextype       of dkterm * dkterm * dkterm
  | DkRalltype      of dkterm * dkterm * dkterm * dkterm
  | DkRnotextype    of dkterm * dkterm * dkterm * dkterm
  | DkRnotalltype   of dkterm * dkterm * dkterm
  | DkRsubst        of dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRconglr       of dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRcongrl       of dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm
;;

type line =
  | Dkdecl of var * dkterm                     (* declaration of symbols *)
  | Dkrwrt of dkterm list * dkterm * dkterm    (* rewrite rules *)
;;

let get_dkvar_type var =
  match var with
  | Dkvar (_, t) -> t
  | _ -> assert false
;;

let tbl_var_newname = ref (Hashtbl.create 42);;

let newname () =
  let s = Expr.newname () in
  let res = "v"^(String.sub s 5 (String.length s - 5)) in
(*  Log.debug 4 " |- Var Newname : %s" res; *)
  res
;;

let get_var_newname var =
  try
    match var with
    | Dkvar (v, _) ->
       let nv = Hashtbl.find !tbl_var_newname var in
       nv
    | _ -> assert false
  with Not_found ->
    begin
      match var with
      | Dkvar (v, _) ->
	 let nv = newname () in
	 Hashtbl.add !tbl_var_newname var nv;
	 nv
      | _ -> assert false
    end
;;

let mk_typetype                = Dktypetype
let mk_typeprop                = Dktypeprop
let mk_typeiota                = Dktypeiota
let mk_seq                     = Dkseq
let mk_proof      (t)          = Dkproof t
(*let mk_term       (t)          = Dkterm t*)
let mk_arrow      (l, r)       = Dkarrow (l, r)
let mk_pi         (t1, t2)     = Dkpi (t1, t2)
let mk_var        (v, t)       = Dkvar (v, t)
let mk_lam        (t1, t2)     = Dklam (t1, t2)
let mk_app        (v, t, l)    = Dkapp (v, t, l)
let mk_not        (t)          = Dknot t
let mk_and        (t1, t2)     = Dkand (t1, t2)
let mk_or         (t1, t2)     = Dkor (t1, t2)
let mk_imply      (t1, t2)     = Dkimply (t1, t2)
let mk_equiv      (t1, t2)     = Dkequiv (t1, t2)
let mk_forall     (t1, t2)     = Dkforall (t1, t2)
let mk_exists     (t1, t2)     = Dkexists (t1, t2)
let mk_foralltype (t)          = Dkforalltype t
let mk_existstype (t)          = Dkexiststype t
let mk_true                    = Dktrue
let mk_false                   = Dkfalse
let mk_equal      (t1, t2, t3) = Dkequal (t1, t2, t3)

let mk_DkRfalse        (pr)                      = DkRfalse (pr)
let mk_DkRnottrue      (pr)                      = DkRnottrue (pr)
let mk_DkRaxiom        (p, pr1, pr2)             = DkRaxiom (p, pr1, pr2)
let mk_DkRnoteq        (a, t, pr)                = DkRnoteq (a, t, pr)
let mk_DkReqsym        (a, t, u, pr1, pr2)       = DkReqsym (a, t, u, pr1, pr2)
let mk_DkRcut          (p, pr1, pr2)             = DkRcut (p, pr1, pr2)
let mk_DkRnotnot       (p, pr1, pr2)             = DkRnotnot (p, pr1, pr2)
let mk_DkRand          (p, q, pr1, pr2)          = DkRand (p, q, pr1, pr2)
let mk_DkRor           (p, q, pr1, pr2, pr3)     = DkRor (p, q, pr1, pr2, pr3)
let mk_DkRimply        (p, q, pr1, pr2, pr3)     = DkRimply (p, q, pr1, pr2, pr3)
let mk_DkRequiv        (p, q, pr1, pr2, pr3)     = DkRequiv (p, q, pr1, pr2, pr3)
let mk_DkRnotand       (p, q, pr1, pr2, pr3)     = DkRnotand (p, q, pr1, pr2, pr3)
let mk_DkRnotor        (p, q, pr1, pr2)          = DkRnotor (p, q, pr1, pr2)
let mk_DkRnotimply     (p, q, pr1, pr2)          = DkRnotimply (p, q, pr1, pr2)
let mk_DkRnotequiv     (p, q, pr1, pr2, pr3)     = DkRnotequiv (p, q, pr1, pr2, pr3)
let mk_DkRex           (a, p, pr1, pr2)          = DkRex (a, p, pr1, pr2)
let mk_DkRall          (a, p, t, pr1, pr2)       = DkRall (a, p, t, pr1, pr2)
let mk_DkRnotex        (a, p, t, pr1, pr2)       = DkRnotex (a, p, t, pr1, pr2)
let mk_DkRnotall       (a, p, pr1, pr2)          = DkRnotall (a, p, pr1, pr2)
let mk_DkRextype       (p, pr1, pr2)             = DkRextype (p, pr1, pr2)
let mk_DkRalltype      (p, a, pr1, pr2)          = DkRalltype (p, a, pr1, pr2)
let mk_DkRnotextype    (p, a, pr1, pr2)          = DkRnotextype (p, a, pr1, pr2)
let mk_DkRnotalltype   (p, pr1, pr2)             = DkRnotalltype (p, pr1, pr2)
let mk_DkRsubst        (a, p, t1, t2, pr1, pr2, pr3)  = DkRsubst (a, p, t1, t2, pr1, pr2, pr3)
let mk_DkRconglr       (a, p, t1, t2, pr1, pr2, pr3)  = DkRconglr (a, p, t1, t2, pr1, pr2, pr3)
let mk_DkRcongrl       (a, p, t1, t2, pr1, pr2, pr3)  = DkRcongrl (a, p, t1, t2, pr1, pr2, pr3)

let mk_decl       (v, t)       = Dkdecl (v, t)
let mk_rwrt       (l, t1, t2)  = Dkrwrt (l, t1, t2)

let check_pvar v l = if List.mem v l then "&" ^ v else v;;
let delete_pvar v l = List.filter (fun x -> x <> v) l;;

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
      fprintf o "%s.%s" !Globals.signature_name (escape_name s)

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
     fprintf o "∀ (%a)" print_dk_term_aux (t2, l_rule)
     (* fprintf o "@∀ (%a)\n (%a)" print_dk_zentype_aux (t1, l_rule) print_dk_term_aux (t2, l_rule) *)
  | Dkexists (_, t2) ->
     fprintf o "∃ (%a)" print_dk_term_aux (t2, l_rule)
     (* fprintf o "@∃ (%a)\n (%a)" print_dk_zentype_aux  (t1, l_rule) print_dk_term_aux (t2, l_rule) *)
  | Dkforalltype (t) ->
     fprintf o "foralltype\n (%a)" print_dk_term_aux (t, l_rule)
  | Dkexiststype (t) ->
     fprintf o "existstype\n (%a)" print_dk_term_aux (t, l_rule)
  | Dktrue -> fprintf o "⊤"
  | Dkfalse -> fprintf o "⊥"
  | Dkequal (t1, t2, t3) ->
     fprintf o "(%a) = (%a)"
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
;;

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
;;

let rec get_var_names l =
  match l with
  | [] -> []
  | (Dkvar (v, t) as var) :: l' -> (escape_name (get_var_newname var)) :: (get_var_names l')
  | _ -> assert false
;;


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
;;

let print_goal_type o name goal =
  fprintf o "symbol %s :\n %a\n → %a\n"
	 (escape_name name) print_dk_type goal print_dk_term mk_seq
;;

let print_proof o name proof =
  fprintf o "%a\n"
	  print_dk_term proof
;;

(* to manage dependances of symbols definitions *)

type declaration =
  | Some of line       (* line is a Dkdecl here *)
  | None
;;

type vertex = {
  mutable decl : declaration;
  mutable edge : var list;
}

type graph = (var, vertex) Hashtbl.t
;;

let create i = Hashtbl.create i
;;

let rec get_var_list_aux env accu ty =
  match ty with
  | Dktypetype
  | Dktypeprop
  | Dktypeiota
  | Dkseq -> accu
(*  | Dkterm (t) -> get_var_list_aux env accu t *)
  | Dkarrow (l, r) ->
     List.fold_left (get_var_list_aux env) accu (List.append l [r])
  | Dkpi (Dkvar(v, _), t) -> get_var_list_aux (v :: env) accu t
  | Dkvar (v, _) ->
     if List.mem v env then accu
     else v :: accu
  | Dkapp (v, _, l) ->
     if List.mem v env
     then List.fold_left (get_var_list_aux env) accu l
     else List.fold_left (get_var_list_aux env) (v :: accu) l
  | _ -> assert false
;;

let get_var_list ty =
  get_var_list_aux [] [] ty
;;

let mk_vertex d =
  match d with
  | Dkdecl (v, ty) ->
     let var_list = get_var_list ty in
     {decl = Some d;
      edge = var_list;}
  | _ -> assert false
;;

let mk_vertex_none =
  {decl = None; edge = [];}
;;

let add_none_dep gr v =
  try
    match (Hashtbl.find gr v) with
    | _ -> ()
  with Not_found ->
    Hashtbl.add gr v mk_vertex_none
;;

let add_sym_graph gr d =
  match d with
  | Dkdecl (v, ty) ->
     begin
       Log.debug 13 " |- Add Sym Graph %s" v;
       try
	 match Hashtbl.find gr v with
	 | {decl = Some _; edge = _;} -> assert false
	 | {decl = None; edge = _;} ->
	    Hashtbl.replace gr v (mk_vertex d)
       with Not_found ->
	 let ver = mk_vertex d in
	 Hashtbl.add gr v ver;
	 List.iter (add_none_dep gr) ver.edge;
     end
  | _ -> assert false
;;

let rm_sym_graph gr v =
  Hashtbl.replace gr v mk_vertex_none
;;

let get_vertex_name v =
  match v with
  | {decl = Some Dkdecl(v, _); edge = _;} -> v
  | _ -> assert false
;;

let select_no_incoming gr =
  let f x y z =
    let is_some a =
      match a with
      | {decl = Some _; edge = _;} -> true
      | _ -> false
    in
    let find_sym t =
      try
	match Hashtbl.find gr t with
	| {decl = Some _; edge = _;} -> true
	| _ -> false
      with Not_found -> false
    in
    if (is_some y) &&
	 not (List.exists find_sym y.edge)
    then (y :: z)
    else z
  in
  Hashtbl.fold f gr []
;;

let test_graph gr =
  let f x y =
    match y with
    | {decl = Some _; edge = _;} -> ()
    | {decl = None; edge = _;} -> assert false
  in
  Hashtbl.iter f gr
;;

let topo_sort gr =
(*  test_graph gr; *)
  let rec f accu gr =
    match select_no_incoming gr with
    | [] -> accu
    | h :: tl ->
       let name = get_vertex_name h in
       rm_sym_graph gr name;
       let dec = match h.decl with
	 | Some d -> d | None -> assert false
       in
       f (dec :: accu) gr
  in
  let res = f [] gr in
  List.rev res
;;
