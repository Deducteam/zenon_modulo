open Printf
open Expr

type var = string
type ty = Expr.expr

type term =
  | Dkvar of var
  | Dklam of term * term * term
  | Dkpi of term * term * term
  | Dkapp of term list
  | Dkarrow of term * term
  | Dkprf
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
  | DkeqTerm
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
  | DkeqcTerm
  | Dkeqc
  | Dkequiv
  | Dkterm
  | Dknnpp

type line =
  | Dkdecl of term * term
  | Dkdeftype of term * term * term
  | Dkprelude of string
  | Dkrewrite of (term * term) list * term * term

let rec term_of_ty ty =
  if ty == type_none
  then Dkvar "logic.Term"
  else match ty with
       | Evar (s, _) -> Dkvar s
       | Eapp (s, l, _) -> Dkapp (List.map term_of_ty (s :: l))
       | Earrow ([], ret, _) -> term_of_ty ret
       | Earrow (hd :: tl, ret, _) ->
          Dkarrow (term_of_ty hd, term_of_ty (earrow tl ret))
       | e -> Dkvar (Print.sexpr e)

let mk_var var = Dkvar var
let mk_lam var ty term = Dklam (var, ty, term)
let mk_lams vars types e =
  List.fold_left2 (fun term var t -> mk_lam var t term) e (List.rev vars) (List.rev types)
let mk_app t ts = Dkapp (t :: ts)
let mk_app2 t1 t2 = mk_app t1 [t2]
let mk_app3 t1 t2 t3 = mk_app t1 [t2; t3]
let mk_arrow t1 t2 = Dkarrow (t1, t2)
let mk_prf t = mk_app2 Dkprf t
let mk_term ty = ty
let mk_pi var ty term = Dkpi (var, mk_term ty, term)
let mk_termtype = mk_var "logic.Term"
let mk_proptype = mk_var "logic.Prop"
let mk_anyterm = Dkanyterm
let mk_not term = mk_app2 Dknot term
let mk_and p q = mk_app3 Dkand p q
let mk_or p q = mk_app3 Dkor p q
let mk_imply p q = mk_app3 Dkimply p q
let mk_forall x ty p =
  mk_app3 Dkforall ty (mk_lam x ty p)
let mk_exists x ty p =
  mk_app3 Dkexists ty (mk_lam x ty p)
let mk_true = Dktrue
let mk_false = Dkfalse

let mk_eq ty t1 t2 =
  if ty = mk_termtype then
    mk_app3 DkeqTerm t1 t2
  else
    mk_app Dkeq [ty; t1; t2]

let mk_notc term = mk_app2 Dknotc term
let mk_andc p q = mk_app3 Dkandc p q
let mk_orc p q = mk_app3 Dkorc p q
let mk_implyc p q = mk_app3 Dkimplyc p q
let mk_forallc x ty p =
  mk_app3 Dkforallc ty (mk_lam x ty p)
let mk_existsc x ty p =
  mk_app3 Dkexistsc ty (mk_lam x ty p)
let mk_truec = Dktruec
let mk_falsec = Dkfalsec
let mk_eqc ty t1 t2 =
  if ty = mk_termtype then
    mk_app3 DkeqcTerm t1 t2
  else
    mk_app Dkeqc [ty; t1; t2]

let mk_equiv p q = mk_app3 Dkequiv p q

let mk_decl t term = Dkdecl (t, term)
let mk_deftype t termtype term = Dkdeftype (t, termtype, term)
let mk_prelude name = Dkprelude (name)
let mk_rewrite env t1 t2 = Dkrewrite (env, t1, t2)
let mk_nnpp a = mk_app2 Dknnpp a

let print_var out var = fprintf out "%s" var

let rec print_term out term =
  match term with
  | Dkvar (var) -> print_var out var
  | Dklam (var, t, term) ->
    fprintf out "%a: %a =>\n %a"
      print_term var print_term_p t print_term term
  | Dkpi (var, t, term) ->
    fprintf out "%a: %a -> %a"
      print_term var print_term_p t print_term_p term
  | Dkapp (Dkapp ts1 :: ts2) -> print_term out (Dkapp (ts1 @ ts2))
  | Dkapp (ts) -> print_terms out ts
  | Dkarrow (t1, t2) ->
    fprintf out "%a -> %a"
      print_term_p t1 print_term_p t2
  | Dkprf -> fprintf out "logic.prf"
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
  | DkeqTerm -> fprintf out "logic.equal"
  | Dkeq -> fprintf out "dk_logic.equal"
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
  | DkeqcTerm -> fprintf out "logic.equalc"
  | Dkeqc -> fprintf out "dk_logic.equalc"
  | Dkequiv -> fprintf out "logic.equiv"
  | Dkterm -> fprintf out "logic.term"
  | Dknnpp -> fprintf out "classic.nnpp"

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
    fprintf out "%a : %a:= %a.\n"
      print_term t
      print_term typeterm
      print_term term
  | Dkprelude (name) -> fprintf out "#NAME %s.\n" name
  | Dkrewrite (env, t1, t2) ->
    fprintf out "[%a] " print_env env;
    fprintf out "%a " print_term t1;
    fprintf out "--> %a.\n" print_term t2

