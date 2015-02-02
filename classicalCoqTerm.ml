open Printf
open Expr

type var = string
type ty = Expr.expr

type term =
  | Coqvar of var
  | Coqlam of term * term * term
  | Coqpi of term * term * term
  | Coqapp of term list
  | Coqarrow of term * term
  | Coqtermtype
  | Coqproptype
  | Coqanyterm of term
  | Coqnot of term
  | Coqand of term * term
  | Coqor of term * term
  | Coqimply of term * term
  | Coqforall of (term list * term option) list * term
  | Coqexists of term * term option * term
  | Coqtrue
  | Coqfalse
  | Coqeq of term * term
  | Coqequiv of term * term

type line =
  | Coqdecl of term * term
  | Coqdeftype of term * term * term
  | Coqprelude of string
  | Coqrewrite of (term * term) list * term * term

let rec term_of_ty = function
  | Evar (s, _) -> Coqvar s
  | Eapp (s, l, _) -> Coqapp (List.map term_of_ty (s :: l))
  | Earrow ([], ret, _) -> term_of_ty ret
  | Earrow (hd :: tl, ret, _) ->
     Coqarrow (term_of_ty hd, term_of_ty (earrow tl ret))
  | e -> Coqvar (Print.sexpr e)

let mk_var var = Coqvar var
let mk_lam var t term = Coqlam (var, t, term)
let mk_lams vars types e =
  List.fold_left2 (fun term var t -> mk_lam var t term) e (List.rev vars) (List.rev types)
let mk_pi var ty term = Coqpi (var, ty, term)
let mk_app t ts = Coqapp (t :: ts)
let mk_app2 t1 t2 = mk_app t1 [t2]
let mk_app3 t1 t2 t3 = mk_app t1 [t2; t3]
let mk_arrow t1 t2 = Coqarrow (t1, t2)
let mk_prf t = t
let mk_termtype = Coqtermtype
let mk_proptype = Coqproptype
let mk_anyterm t = Coqanyterm t
let mk_not term = Coqnot term
let mk_and p q = Coqand (p, q)
let mk_or p q = Coqor (p, q)
let mk_imply p q = Coqimply (p, q)
let mk_forall x ty p = Coqforall ([[x], Some Coqtermtype], p)
let mk_exists x ty p = Coqexists (x, Some Coqtermtype, p)
let mk_true = Coqtrue
let mk_false = Coqfalse
let mk_eq _ t1 t2 = Coqeq (t1, t2)

let dnot t = Coqnot (Coqnot t)

let mk_notc term = dnot (Coqnot (dnot term))
let mk_andc p q = dnot (Coqand (dnot p, dnot q))
let mk_orc p q = dnot (Coqor (dnot p, dnot q))
let mk_implyc p q = dnot (Coqimply (dnot p, dnot q))
let mk_forallc x ty p = dnot (Coqforall ([[x], Some Coqtermtype], dnot p))
let mk_existsc x ty p = dnot (Coqexists (x, Some Coqtermtype, dnot p))
let mk_truec = dnot Coqtrue
let mk_falsec = dnot Coqfalse
let mk_eqc _ t1 t2 = dnot (Coqeq (t1, t2))
let mk_equiv p q = Coqequiv (p, q)
let mk_term t = t
let mk_nnpp t = assert false

let mk_decl t term = Coqdecl (t, term)
let mk_deftype t termtype term = Coqdeftype (t, termtype, term)
let mk_prelude name = Coqprelude (name)
let mk_rewrite env t1 t2 = Coqrewrite (env, t1, t2)

let print_var out var = fprintf out "%s" var

let rec print_term out term =
  match term with
  | Coqvar (var) -> print_var out var
  | Coqlam (var, t, term) ->
     fprintf out "function %a: %a => %a"
       print_term var print_term_p t print_term_p term
  | Coqpi (var, t, term) ->
     fprintf out "forall %a: %a, %a"
       print_term var print_term_p t print_term_p term
  | Coqapp (ts) -> print_terms out ts
  | Coqarrow (t1, t2) ->
     fprintf out "%a -> %a"
       print_term_p t1 print_term_p t2
  | Coqtermtype -> fprintf out "_TType"
  | Coqproptype -> fprintf out "Prop"
  | Coqanyterm t -> print_term out (Coqapp [Coqvar "_anyterm"; t])
  | Coqnot p -> fprintf out "~ %a" print_term_p p
  | Coqand (p, q) ->
     fprintf out "%a /\\ %a"
       print_term_p p
       print_term_p q
  | Coqor (p, q) ->
     fprintf out "%a \\/ %a"
       print_term_p p
       print_term_p q
  | Coqimply (p, q) ->
     fprintf out "%a -> %a"
       print_term_p p
       print_term_p q
  | Coqforall (l, p) ->
     fprintf out "forall %a, %a"
       (fun out ->
         List.iter (fun (l, topt) ->
           List.iter (fun v -> print_term out v; fprintf out " ") l;
           match topt with None -> () | Some ty -> fprintf out " : %a" print_term ty
         )) l
       print_term p
  | Coqexists (v, None, p) ->
     fprintf out "exists %a, %a"
       print_term v
       print_term p
  | Coqexists (v, Some ty, p) ->
     fprintf out "exists %a : %a, %a"
       print_term v
       print_term ty
       print_term p
  | Coqtrue -> fprintf out "True"
  | Coqfalse -> fprintf out "False"
  | Coqeq (t1, t2) ->
     fprintf out "%a = %a"
       print_term_p t1
       print_term_p t2
  | Coqequiv (p, q) ->
     fprintf out "%a <-> %a"
       print_term_p p
       print_term_p q

and print_term_p out term =
  match term with
  | Coqvar _
  | Coqtermtype
  | Coqproptype
  | Coqtrue
  | Coqfalse
      ->
     print_term out term
  | Coqanyterm _
  | Coqlam _
  | Coqpi _
  | Coqapp _
  | Coqarrow _
  | Coqnot _
  | Coqand _
  | Coqor _
  | Coqimply _
  | Coqforall _
  | Coqexists _
  | Coqeq _
  | Coqequiv _
    ->
     fprintf out "(%a)" print_term term

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
  | Coqdecl (t, term) ->
    fprintf out "Parameter %a: %a.\n"
      print_term t
      print_term term
  | Coqdeftype (t, typeterm, term) ->
    fprintf out "Definition %a: %a := %a.\n"
      print_term t
      print_term typeterm
      print_term term
  | Coqprelude (name) ->
     fprintf out
       "Parameter _TType : Set.\nParameter _anyterm : _TType.\n"
  | Coqrewrite (env, t1, t2) ->
     fprintf out "Definition %a := %a."
       print_term t1
       print_term t2;
