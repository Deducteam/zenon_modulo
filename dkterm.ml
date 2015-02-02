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

  | DkRfalse 
  | DkRnottrue
  | DkRaxiom        of dkterm                              (* p *)
  | DkRnoteq        of dkterm * dkterm                     (* a -> t:a *)
  | DkReqsym        of dkterm * dkterm * dkterm            (* a -> t:a -> u a *)
  | DkRcut          of dkterm * dkterm * dkterm            (* p -> prf -> prf *)
  | DkRnotnot       of dkterm * dkterm                     (* p -> prf *)
  | DkRand          of dkterm * dkterm * dkterm            (* p -> q -> prf *)
  | DkRor           of dkterm * dkterm * dkterm * dkterm   (* p -> q -> prf -> prf *)
  | DkRimply        of dkterm * dkterm * dkterm * dkterm   (* p -> q -> prf -> prf *)
  | DkRequiv        of dkterm * dkterm * dkterm * dkterm   (* p -> q -> prf -> prf *)
  | DkRnotand       of dkterm * dkterm * dkterm * dkterm   (* p -> q -> prf -> prf *)
  | DkRnotor        of dkterm * dkterm * dkterm            (* p -> q -> prf *)
  | DkRnotimply     of dkterm * dkterm * dkterm            (* p -> q -> prf *)
  | DkRnotequiv     of dkterm * dkterm * dkterm * dkterm   (* p -> q -> prf -> prf *)
  | DkRex           of dkterm * dkterm * dkterm            (* a -> p -> (t:a -> prf) *)
  | DkRall          of dkterm * dkterm * dkterm * dkterm   (* a -> p -> t:a -> prf *)
  | DkRnotex        of dkterm * dkterm * dkterm * dkterm   (* a -> p -> t:a -> prf *)
  | DkRnotall       of dkterm * dkterm * dkterm            (* a -> p -> (t:a -> prf) *)
  | DkRextype       of dkterm * dkterm                     (* p -> (a -> prf) *)
  | DkRalltype      of dkterm * dkterm * dkterm            (* p -> a -> prf *)
  | DkRnotextype    of dkterm * dkterm * dkterm            (* p -> a -> prf *)
  | DkRnotalltype   of dkterm * dkterm                     (* p -> (a -> prf) *)
  | DkRconglr       of dkterm * dkterm * dkterm * dkterm * dkterm 
  | DkRcongrl       of dkterm * dkterm * dkterm * dkterm * dkterm 
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
let mk_proof      (t)          = Dkproof t
let mk_term       (t)          = Dkterm t
let mk_arrow      (l)          = Dkarrow l
let mk_pi         (t1, t2)     = Dkpi (t1, t2)
let mk_var        (v, t)       = Dkvar (v, t)
let mk_lam        (t1, t2)     = Dklam (t1, t2)
let mk_app        (t, l)       = Dkapp (t, l)
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

let mk_DkRfalse                              = DkRfalse
let mk_DkRnottrue                            = DkRnottrue
let mk_DkRaxiom        (p)                   = DkRaxiom (p)
let mk_DkRnoteq        (a, t)                = DkRnoteq (a, t)
let mk_DkReqsym        (a, t, u)             = DkReqsym (a, t, u)
let mk_DkRcut          (p, prf1, prf2)       = DkRcut (p, prf1, prf2)
let mk_DkRnotnot       (p, prf1)             = DkRnotnot (p, prf1)
let mk_DkRand          (p, q, prf1)          = DkRand (p, q, prf1)
let mk_DkRor           (p, q, prf1, prf2)    = DkRor (p, q, prf1, prf2)
let mk_DkRimply        (p, q, prf1, prf2)    = DkRimply (p, q, prf1, prf2)
let mk_DkRequiv        (p, q, prf1, prf2)    = DkRequiv (p, q, prf1, prf2)
let mk_DkRnotand       (p, q, prf1, prf2)    = DkRnotand (p, q, prf1, prf2)
let mk_DkRnotor        (p, q, prf1)          = DkRnotor (p, q, prf1)
let mk_DkRnotimply     (p, q, prf1)          = DkRnotimply (p, q, prf1)
let mk_DkRnotequiv     (p, q, prf1, prf2)    = DkRnotequiv (p, q, prf1, prf2)
let mk_DkRex           (a, p, prf1)          = DkRex (a, p, prf1)
let mk_DkRall          (a, p, t, prf1)       = DkRall (a, p, t, prf1)
let mk_DkRnotex        (a, p, t, prf1)       = DkRnotex (a, p, t, prf1)
let mk_DkRnotall       (a, p, prf1)          = DkRnotall (a, p, prf1)
let mk_DkRextype       (p, prf1)             = DkRextype (p, prf1)
let mk_DkRalltype      (p, a, prf1)          = DkRalltype (p, a, prf1)
let mk_DkRnotextype    (p, a, prf1)          = DkRnotextype (p, a, prf1)
let mk_DkRnotalltype   (p, prf1)             = DkRnotalltype (p, prf1)
let mk_DkRconglr       (a, p, t1, t2, prf1)  = DkRconglr (a, p, t1, t2, prf1)
let mk_DkRcongrl       (a, p, t1, t2, prf1)  = DkRcongrl (a, p, t1, t2, prf1)

let mk_decl       (v, t)       = Dkdecl (v, t)
let mk_rwrt       (l, t1, t2)  = Dkrwrt (l, t1, t2)

let rec print_dk o t = 
  match t with 
  | Dktype -> fprintf o "zen.type"
  | Dkprop -> fprintf o "zen.prop"
  | Dkseq  -> fprintf o "zen.seq"
  | Dkproof (t) ->  fprintf o "zen.proof (%a)" print_dk t
  | Dkterm (t) -> fprintf o "zen.term (%a)" print_dk t
  | Dkarrow (l) -> print_dk_list_arrow o l
  | Dkpi (Dkvar (v, t1), t2) -> 
     fprintf o "%s : %a -> %a" v print_dk t1 print_dk t2
  | Dkpi _ -> assert false
  | Dkvar (v, _) -> fprintf o "%s" v
  | Dklam (Dkvar (v, t1), t2) ->
     fprintf o "%s : (%a)\n => %a" v print_dk t1 print_dk t2
  | Dklam _ -> assert false
  | Dkapp (t, l) -> 
     fprintf o "%a %a" print_dk t print_dk_list_app l
  | Dknot (t) -> 
     fprintf o "zen.not\n (%a)" print_dk t
  | Dkand (t1, t2) -> 
     fprintf o "zen.and\n (%a) (%a)" print_dk t1 print_dk t2
  | Dkor (t1, t2) -> 
     fprintf o "zen.or\n (%a) (%a)" print_dk t1 print_dk t2
  | Dkimply (t1, t2) -> 
     fprintf o "zen.imp\n (%a) (%a)" print_dk t1 print_dk t2
  | Dkequiv (t1, t2) -> 
     fprintf o "zen.eqv\n (%a) (%a)" print_dk t1 print_dk t2
  | Dkforall (t1, t2) -> 
     fprintf o "zen.forall (%a)\n (%a)" print_dk t1 print_dk t2
  | Dkexists (t1, t2) -> 
     fprintf o "zen.exists (%a)\n (%a)" print_dk t1 print_dk t2
  | Dkforalltype (t) -> 
     fprintf o "zen.foralltype\n (%a)" print_dk t
  | Dkexiststype (t) -> 
     fprintf o "zen.existstype (%a)" print_dk t
  | Dktrue -> fprintf o "zen.True"
  | Dkfalse -> fprintf o "zen.False"
  | Dkequal (t1, t2, t3) -> 
     fprintf o "zen.equal (%a) (%a) (%a)" 
	     print_dk t1 
	     print_dk t2 
	     print_dk t3 
  | DkRfalse -> fprintf o "zen.Rfalse"
  | DkRnottrue -> fprintf o "zen.Rnottrue"
  | DkRaxiom (p) -> 
     fprintf o "zen.Raxiom\n (%a)" 
	     print_dk p
  | DkRnoteq (a, t) -> 
     fprintf o "zen.Rnoteq\n (%a) (%a)" 
	     print_dk a 
	     print_dk t
  | DkReqsym (a, t, u) -> 
     fprintf o "zen.Reqsym\n (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk t 
	     print_dk u
  | DkRcut (p, prf1, prf2) -> 
     fprintf o "zen.Rcut\n (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk prf1 
	     print_dk prf2
  | DkRnotnot (p, prf1) -> 
     fprintf o "zen.Rnotnot\n (%a) (%a)" 
	     print_dk p 
	     print_dk prf1
  | DkRand (p, q, prf1) -> 
     fprintf o "zen.Rand\n (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk prf1
  | DkRor (p, q, prf1, prf2) -> 
     fprintf o "zen.Ror\n (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk prf1 
	     print_dk prf2
  | DkRimply (p, q, prf1, prf2) -> 
     fprintf o "zen.Rimply\n (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk prf1 
	     print_dk prf2
  | DkRequiv (p, q, prf1, prf2) -> 
     fprintf o "zen.Requiv\n (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk prf1 
	     print_dk prf2
  | DkRnotand (p, q, prf1, prf2) -> 
     fprintf o "zen.Rnotand\n (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk prf1 
	     print_dk prf2
  | DkRnotor (p, q, prf1) -> 
     fprintf o "zen.Rnotor\n (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk prf1
  | DkRnotimply (p, q, prf1) -> 
     fprintf o "zen.Rnotimply\n (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk prf1
  | DkRnotequiv (p, q, prf1, prf2) -> 
     fprintf o "zen.Rnotequiv\n (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk prf1 
	     print_dk prf2
  | DkRex (a, p, prf1) -> 
     fprintf o "zen.Rex\n (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk prf1
  | DkRall (a, p, t, prf1) -> 
     fprintf o "zen.Rall\n (%a) (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk t 
	     print_dk prf1
  | DkRnotex (a, p, t, prf1) -> 
     fprintf o "zen.Rnotex\n (%a) (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk t 
	     print_dk prf1
  | DkRnotall (a, p, prf1) -> 
     fprintf o "zen.Rnotall\n (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk prf1
  | DkRextype (p, prf1) -> 
     fprintf o "zen.Rextype\n (%a) (%a)" 
	     print_dk p 
	     print_dk prf1
  | DkRalltype (p, a, prf1) -> 
     fprintf o "zen.Ralltype\n (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk a 
	     print_dk prf1
  | DkRnotextype (p, a, prf1) -> 
     fprintf o "zen.Rnotextype\n (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk a 
	     print_dk prf1
  | DkRnotalltype (p, prf1) -> 
     fprintf o "zen.Rnotalltype\n (%a) (%a)" 
	     print_dk p 
	     print_dk prf1
  | DkRconglr (a, p, t1, t2, prf1) -> 
     fprintf o "zen.Rconglr\n (%a) (%a) (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk t1 
	     print_dk t2 
	     print_dk prf1
  | DkRcongrl (a, p, t1, t2, prf1) -> 
     fprintf o "zen.Rcongrl\n (%a) (%a) (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk t1 
	     print_dk t2 
	     print_dk prf1

and print_dk_list_arrow o t = 
  match t with 
  | [] -> ()
  | [h] -> fprintf o "%a" print_dk h 
  | h :: tl -> fprintf o "%a -> %a" print_dk h print_dk_list_arrow tl

and print_dk_list_app o t = 
  match t with 
  | [] -> ()
  | [h] -> fprintf o "(%a)" print_dk h
  | h :: tl -> fprintf o "(%a) %a" print_dk h print_dk_list_app tl
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
     fprintf o "[%a]\n %a \n --> %a.\n" pr_list_var l print_dk t1 print_dk t2
;;

let print_goal_type o name goal = 
  fprintf o "%s :\n %a\n -> %a.\n" name print_dk goal print_dk mk_seq
;;

let print_proof o name proof = 
  fprintf o "[] %s -->\n %a.\n" name print_dk proof
;;
