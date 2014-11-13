open Printf

type var = string

type term =
  | Dkvar of var
  | Dklam of term * term * term
  | Dkpi of term * term * term
  | Dkapp of term list
  | Dkarrow of term * term
  | Dkprf
  | Dktermtype
  | Dkproptype
  | Dkanyterm
  | Dknot
  | Dkand
  | Dkor
  | Dkimply
  | DkforallTerm
  | Dkforall
  | DkexistsTerm
  | Dkexists
  | Dktrue
  | Dkfalse
  | Dkeq
  | Dknotc
  | Dkandc
  | Dkorc
  | Dkimplyc
  | DkforallcTerm
  | Dkforallc
  | DkexistscTerm
  | Dkexistsc
  | Dktruec
  | Dkfalsec
  | Dkeqc
  | Dkequiv
  | Dkterm

type line =
  | Dkdecl of term * term
  | Dkdeftype of term * term * term
  | Dkprelude of string
  | Dkrewrite of (term * term) list * term * term

let mk_var var = Dkvar var
let mk_lam var t term = Dklam (var, t, term)
let mk_lams vars types e =
  List.fold_left2 (fun term var t -> mk_lam var t term) e (List.rev vars) (List.rev types)
let mk_pi var t term = Dkpi (var, t, term)
let mk_app t ts = Dkapp (t :: ts)
let mk_app2 t1 t2 = mk_app t1 [t2]
let mk_app3 t1 t2 t3 = mk_app t1 [t2; t3]
let mk_arrow t1 t2 = Dkarrow (t1, t2)
let mk_prf t = mk_app2 Dkprf t
let mk_term ty = mk_app2 Dkterm ty
let mk_termtype = Dktermtype
let mk_proptype = Dkproptype
let mk_anyterm = Dkanyterm
let mk_not term = mk_app2 Dknot term
let mk_and p q = mk_app3 Dkand p q
let mk_or p q = mk_app3 Dkor p q
let mk_imply p q = mk_app3 Dkimply p q
let mk_forall x s p =
  if s = "zenon_U" then
    mk_app2 DkforallTerm (mk_lam x Dktermtype p)
  else
    let ty = mk_var s in
    mk_app3 Dkforall ty (mk_lam x (mk_term ty) p)
let mk_exists x s p =
  if s = "zenon_U" then
    mk_app2 DkexistsTerm (mk_lam x Dktermtype p)
  else
    let ty = mk_var s in
    mk_app3 Dkexists ty (mk_lam x (mk_term ty) p)
let mk_true = Dktrue
let mk_false = Dkfalse
let mk_eq t1 t2 = mk_app3 Dkeq t1 t2
let mk_notc term = mk_app2 Dknotc term
let mk_andc p q = mk_app3 Dkandc p q
let mk_orc p q = mk_app3 Dkorc p q
let mk_implyc p q = mk_app3 Dkimplyc p q
let mk_forallc x s p =
    if s = "zenon_U" then
    mk_app2 DkforallcTerm (mk_lam x Dktermtype p)
  else
    let ty = mk_var s in
    mk_app3 Dkforallc ty (mk_lam x (mk_term ty) p)
let mk_existsc x s p =
    if s = "zenon_U" then
    mk_app2 DkexistscTerm (mk_lam x Dktermtype p)
  else
    let ty = mk_var s in
    mk_app3 Dkexistsc ty (mk_lam x (mk_term ty) p)
let mk_truec = Dktruec
let mk_falsec = Dkfalsec
let mk_eqc t1 t2 = mk_app3 Dkeqc t1 t2
let mk_equiv p q = mk_app3 Dkequiv p q

let mk_decl t term = Dkdecl (t, term)
let mk_deftype t termtype term = Dkdeftype (t, termtype, term)
let mk_prelude name = Dkprelude (name)
let mk_rewrite env t1 t2 = Dkrewrite (env, t1, t2)

let print_var out var = fprintf out "%s" var

let rec print_term out term =
  match term with
  | Dkvar (var) -> print_var out var
  | Dklam (var, t, term) ->
    fprintf out "%a: %a => %a"
      print_term var print_term_p t print_term_p term
  | Dkpi (var, t, term) ->
    fprintf out "%a: %a -> %a"
      print_term var print_term_p t print_term_p term
  | Dkapp (ts) -> print_terms out ts
  | Dkarrow (t1, t2) ->
    fprintf out "%a -> %a"
      print_term_p t1 print_term_p t2
  | Dkprf -> fprintf out "logic.prf"
  | Dktermtype -> fprintf out "logic.Term"
  | Dkproptype -> fprintf out "logic.Prop"
  | Dkanyterm -> fprintf out "logic.anyterm"
  | Dknot -> fprintf out "logic.not"
  | Dkand -> fprintf out "logic.and"
  | Dkor -> fprintf out "logic.or"
  | Dkimply -> fprintf out "logic.imply"
  | Dkforall -> fprintf out "dk_logic.forall"
  | DkforallTerm -> fprintf out "logic.forall"
  | Dkexists -> fprintf out "dk_logic.exists"
  | DkexistsTerm -> fprintf out "logic.exists"
  | Dktrue -> fprintf out "logic.True"
  | Dkfalse -> fprintf out "logic.False"
  | Dkeq -> fprintf out "logic.equal"
  | Dknotc -> fprintf out "logic.noc"
  | Dkandc -> fprintf out "logic.andc"
  | Dkorc -> fprintf out "logic.orc"
  | Dkimplyc -> fprintf out "logic.implyc"
  | Dkforallc -> fprintf out "dk_logic.forallc"
  | DkforallcTerm -> fprintf out "logic.forallc"
  | Dkexistsc -> fprintf out "dk_logic.existsc"
  | DkexistscTerm -> fprintf out "logic.existsc"
  | Dktruec -> fprintf out "logic.Truec"
  | Dkfalsec -> fprintf out "logic.Falsec"
  | Dkeqc -> fprintf out "logic.equalc"
  | Dkequiv -> fprintf out "logic.equiv"
  | Dkterm -> fprintf out "logic.term"

and print_term_p out term =
  match term with
  | Dklam _ | Dkpi _ | Dkapp _ | Dkarrow _ ->
    fprintf out "(%a)" print_term term
  | _ -> print_term out term

and print_terms out terms =
  match terms with
  | [] -> ()
  | [t] -> print_term_p out t
  | t :: q ->
    fprintf out "%a %a"
      print_term_p t print_terms q

let print_env out env =
  let print_type out (x, t) =
    fprintf out "%a: %a"
      print_term x
      print_term t in
  match env with
  | e1 :: e2 :: env ->
    fprintf out "%a, %a"
      print_type e1
      print_type e2
  | _ -> List.iter (print_type out) env

let print_line out line =
  match line with
  | Dkdecl (t, term) ->
    fprintf out "%a: %a.\n"
      print_term t
      print_term term
  | Dkdeftype (t, typeterm, term) ->
    fprintf out "%a: %a:= %a.\n"
      print_term t
      print_term typeterm
      print_term term
  | Dkprelude (name) -> fprintf out "#NAME %s.\n" name
  | Dkrewrite (env, t1, t2) ->
    fprintf out "[%a] " print_env env;
    fprintf out "%a " print_term t1;
    fprintf out "--> %a.\n" print_term t2;
