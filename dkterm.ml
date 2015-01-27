open Printf
open Expr

type var = string

type term =
  | Dktype                                  (* type type *)
  | Dkprop                                  (* type prop *)
  | Dkseq                                   (* type seq *)
  | Dkproof       of term                   (* type proof of prop *)
  | Dkterm        of term                   (* type term of type *)
  | Dkarrow       of term list              (* type arrow of type alphas list *)
  | Dkpi          of term * term            (* vartype -> arrow *)

  | Dkvar         of var  * term            (* vartype alpha *)
  | Dklam         of term * term            (* vartype alpha => prop of var *)
  | Dkapp         of term * term list       (* app term apply to term list *)

  | Dknot         of term                   (* not of prop *)
  | Dkand         of term * term            (* and of 2 prop *)
  | Dkor          of term * term            (* or of 2 prop *)
  | Dkimply       of term * term            (* imply of 2 prop *)
  | Dkequiv       of term * term            (* equiv of 2 prop *)
  | Dkforall      of term * term            (* forall type prop *)
  | Dkexists      of term * term            (* exists type prop *)
  | Dkforalltype  of term                   (* foralltype prop lambda *)
  | Dkexiststype  of term                   (* existstype prop lambda *)
  | Dktrue                                  (* true *)
  | Dkfalse                                 (* false *)
  | Dkequal       of term * term * term     (* equal type term term *)
;;

type line =
  | Dkdecl of var * term                    (* declaration of symbols *)
  | Dkrwrt of term list * term * term       (* rewrite rules *)
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

let rec pr_type_decl o t = 
  match t with 
  | Dktype -> fprintf o "ml.type"
  | Dkprop -> fprintf o "ml.prop"
  | Dkseq  -> fprintf o "ml.seq"
  | Dkproof (t) ->  fprintf o "ml.proof (%a)" pr_type_decl t
  | Dkterm (t) -> fprintf o "ml.term (%a)" pr_type_decl t
  | Dkarrow (l) -> pr_type_decl_list_arrow o l
  | Dkpi (Dkvar (v, t1), t2) -> 
     fprintf o "%s : %a -> %a" v pr_type_decl t1 pr_type_decl t2
  | Dkpi _ -> assert false
  | Dkvar (v, _) -> fprintf o "%s" v
  | Dklam (Dkvar (v, t1), t2) ->
     fprintf o "(%s : %a => %a)" v pr_type_decl t1 pr_type_decl t2
  | Dklam _ -> assert false
  | Dkapp (t, l) -> 
     fprintf o "(%a %a)" pr_type_decl t pr_type_decl_list_app l
  | Dknot (t) -> 
     fprintf o "(ml.not %a)" pr_type_decl t
  | Dkand (t1, t2) -> 
     fprintf o "(ml.and %a %a)" pr_type_decl t1 pr_type_decl t2
  | Dkor (t1, t2) -> 
     fprintf o "(ml.or %a %a)" pr_type_decl t1 pr_type_decl t2
  | Dkimply (t1, t2) -> 
     fprintf o "(ml.imp %a %a)" pr_type_decl t1 pr_type_decl t2
  | Dkequiv (t1, t2) -> 
     fprintf o "(ml.eqv %a %a)" pr_type_decl t1 pr_type_decl t2
  | Dkforall (t1, t2) -> 
     fprintf o "(ml.forall %a %a)" pr_type_decl t1 pr_type_decl t2
  | Dkexists (t1, t2) -> 
     fprintf o "(ml.exists %a %a)" pr_type_decl t1 pr_type_decl t2
  | Dkforalltype (t) -> 
     fprintf o "(ml.foralltype %a)" pr_type_decl t
  | Dkexiststype (t) -> 
     fprintf o "(ml.existstype %a)" pr_type_decl t
  | Dktrue -> fprintf o "ml.True"
  | Dkfalse -> fprintf o "ml.False"
  | Dkequal (t1, t2, t3) -> 
     fprintf o "(ml.equal %a %a %a)" 
	     pr_type_decl t1 
	     pr_type_decl t2 
	     pr_type_decl t3 

and pr_type_decl_list_arrow o t = 
  match t with 
  | [] -> ()
  | [h] -> fprintf o "%a" pr_type_decl h 
  | h :: tl -> fprintf o "%a -> %a" pr_type_decl h pr_type_decl_list_arrow tl

and pr_type_decl_list_app o t = 
  match t with 
  | [] -> ()
  | [h] -> fprintf o "%a" pr_type_decl h
  | h :: tl -> fprintf o "%a %a" pr_type_decl h pr_type_decl_list_app tl
;;



let print_line o line = 
  match line with 
  | Dkdecl (v, t) -> 
     fprintf o "%s : %a." v pr_type_decl t
  | _ -> assert false
;;



