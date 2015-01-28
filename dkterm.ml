open Printf
open Expr

type var = string

type dkterm =
  | Dktype                                     (* type type *)
  | Dkprop                                     (* type prop *)
  | Dkseq                                      (* type seq *)
  | Dkproof       of dkterm                    (* type proof of prop *)
  | Dkterm        of dkterm                    (* type term of type *)
  | Dkarrow       of dkterm list               (* type arrow of type alphas list *)
  | Dkpi          of dkterm * dkterm           (* vartype -> arrow *)

  | Dkvar         of var  * dkterm             (* vartype alpha *)
  | Dklam         of dkterm * dkterm           (* vartype alpha => prop of var *)
  | Dkapp         of dkterm * dkterm list      (* app term apply to term list *)

  | Dknot         of dkterm                    (* not of prop *)
  | Dkand         of dkterm * dkterm           (* and of 2 prop *)
  | Dkor          of dkterm * dkterm           (* or of 2 prop *)
  | Dkimply       of dkterm * dkterm           (* imply of 2 prop *)
  | Dkequiv       of dkterm * dkterm           (* equiv of 2 prop *)
  | Dkforall      of dkterm * dkterm           (* forall type lambda *)
  | Dkexists      of dkterm * dkterm           (* exists type lambda *)
  | Dkforalltype  of dkterm                    (* foralltype prop lambda *)
  | Dkexiststype  of dkterm                    (* existstype prop lambda *)
  | Dktrue                                     (* true *)
  | Dkfalse                                    (* false *)
  | Dkequal       of dkterm * dkterm * dkterm  (* equal type term term *)
;;

type line =
  | Dkdecl of var * dkterm                     (* declaration of symbols *)
  | Dkrwrt of dkterm list * dkterm * dkterm    (* rewrite rules *)
;;

let get_dkvar_type var = 
  match var with 
  | Dkvar (v, Dktype) -> Dktype
  | Dkvar (v, Dkterm (t)) -> t
  | _ -> assert false
;;

let mk_type                    = Dktype
let mk_prop                    = Dkprop
let mk_seq                     = Dkseq
let mk_proof      t            = Dkproof t
let mk_term       t            = Dkterm t
let mk_arrow      l            = Dkarrow l
let mk_pi         (t1, t2)     = Dkpi (t1, t2)
let mk_var        (v, t)       = Dkvar (v, t)
let mk_lam        (t1, t2)     = Dklam (t1, t2)
let mk_app        (t, l)       = Dkapp (t, l)
let mk_not        t            = Dknot t
let mk_and        (t1, t2)     = Dkand (t1, t2)
let mk_or         (t1, t2)     = Dkor (t1, t2)
let mk_imply      (t1, t2)     = Dkimply (t1, t2)
let mk_equiv      (t1, t2)     = Dkequiv (t1, t2)
let mk_forall     (t1, t2)     = Dkforall (t1, t2)
let mk_exists     (t1, t2)     = Dkexists (t1, t2)
let mk_foralltype t            = Dkforalltype t
let mk_existstype t            = Dkexiststype t
let mk_true                    = Dktrue
let mk_false                   = Dkfalse
let mk_equal      (t1, t2, t3) = Dkequal (t1, t2, t3)

let mk_decl       (v, t)       = Dkdecl (v, t)
let mk_rwrt       (l, t1, t2)  = Dkrwrt (l, t1, t2)

let rec print_dk o t = 
  match t with 
  | Dktype -> fprintf o "zen.type"
  | Dkprop -> fprintf o "zen.prop"
  | Dkseq  -> fprintf o "zen.seq"
  | Dkproof (t) ->  fprintf o "zen.proof %a" print_dk t
  | Dkterm (t) -> fprintf o "zen.term %a" print_dk t
  | Dkarrow (l) -> print_dk_list_arrow o l
  | Dkpi (Dkvar (v, t1), t2) -> 
     fprintf o "%s : %a -> %a" v print_dk t1 print_dk t2
  | Dkpi _ -> assert false
  | Dkvar (v, _) -> fprintf o "%s" v
  | Dklam (Dkvar (v, t1), t2) ->
     fprintf o "(%s : %a => %a)" v print_dk t1 print_dk t2
  | Dklam _ -> assert false
  | Dkapp (t, l) -> 
     fprintf o "(%a %a)" print_dk t print_dk_list_app l
  | Dknot (t) -> 
     fprintf o "(zen.not %a)" print_dk t
  | Dkand (t1, t2) -> 
     fprintf o "(zen.and %a %a)" print_dk t1 print_dk t2
  | Dkor (t1, t2) -> 
     fprintf o "(zen.or %a %a)" print_dk t1 print_dk t2
  | Dkimply (t1, t2) -> 
     fprintf o "(zen.imp %a %a)" print_dk t1 print_dk t2
  | Dkequiv (t1, t2) -> 
     fprintf o "(zen.eqv %a %a)" print_dk t1 print_dk t2
  | Dkforall (t1, t2) -> 
     fprintf o "(zen.forall %a %a)" print_dk t1 print_dk t2
  | Dkexists (t1, t2) -> 
     fprintf o "(zen.exists %a %a)" print_dk t1 print_dk t2
  | Dkforalltype (t) -> 
     fprintf o "(zen.foralltype %a)" print_dk t
  | Dkexiststype (t) -> 
     fprintf o "(zen.existstype %a)" print_dk t
  | Dktrue -> fprintf o "zen.True"
  | Dkfalse -> fprintf o "zen.False"
  | Dkequal (t1, t2, t3) -> 
     fprintf o "(zen.equal %a %a %a)" 
	     print_dk t1 
	     print_dk t2 
	     print_dk t3 

and print_dk_list_arrow o t = 
  match t with 
  | [] -> ()
  | [h] -> fprintf o "%a" print_dk h 
  | h :: tl -> fprintf o "%a -> %a" print_dk h print_dk_list_arrow tl

and print_dk_list_app o t = 
  match t with 
  | [] -> ()
  | [h] -> fprintf o "%a" print_dk h
  | h :: tl -> fprintf o "%a %a" print_dk h print_dk_list_app tl
;;

let rec pr_list_var o l = 
  match l with 
  | [] -> () 
  | [Dkvar (v, t)] -> fprintf o "%s : %a" v print_dk t
  | (Dkvar (v, t)) :: tl -> 
     fprintf o "%s : %a, %a" v print_dk t pr_list_var tl
  | _ -> assert false
;;

let print_line o line = 
  match line with 
  | Dkdecl (v, t) -> 
     fprintf o "%s : %a.\n" v print_dk t
  | Dkrwrt (l, t1, t2) -> 
     fprintf o "[%a]\n %a --> %a.\n" pr_list_var l print_dk t1 print_dk t2
;;



