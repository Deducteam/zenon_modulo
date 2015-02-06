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
  | DkRfalse (pr) -> fprintf o "zen.Rfalse\n (%a)" print_dk pr
  | DkRnottrue (pr) -> fprintf o "zen.Rnottrue\n (%a)" print_dk pr
  | DkRaxiom (p, pr1, pr2) -> 
     fprintf o "zen.Raxiom\n (%a) (%a) (%a)" 
	     print_dk p
	     print_dk pr1
	     print_dk pr2
  | DkRnoteq (a, t, pr) -> 
     fprintf o "zen.Rnoteq\n (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk t
	     print_dk pr
  | DkReqsym (a, t, u, pr1, pr2) -> 
     fprintf o "zen.Reqsym\n (%a) (%a) (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk t 
	     print_dk u
	     print_dk pr1
	     print_dk pr2
  | DkRcut (p, pr1, pr2) -> 
     fprintf o "zen.Rcut\n (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk pr1 
	     print_dk pr2
  | DkRnotnot (p, pr1, pr2) -> 
     fprintf o "zen.Rnotnot\n (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk pr1
	     print_dk pr2
  | DkRand (p, q, pr1, pr2) -> 
     fprintf o "zen.Rand\n (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk pr1
	     print_dk pr2
  | DkRor (p, q, pr1, pr2, pr3) -> 
     fprintf o "zen.Ror\n (%a) (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk pr1 
	     print_dk pr2
	     print_dk pr3
  | DkRimply (p, q, pr1, pr2, pr3) -> 
     fprintf o "zen.Rimply\n (%a) (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk pr1 
	     print_dk pr2
	     print_dk pr3
  | DkRequiv (p, q, pr1, pr2, pr3) -> 
     fprintf o "zen.Requiv\n (%a) (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk pr1 
	     print_dk pr2
	     print_dk pr3
  | DkRnotand (p, q, pr1, pr2, pr3) -> 
     fprintf o "zen.Rnotand\n (%a) (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk pr1 
	     print_dk pr2
	     print_dk pr3
  | DkRnotor (p, q, pr1, pr2) -> 
     fprintf o "zen.Rnotor\n (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk pr1
	     print_dk pr2
  | DkRnotimply (p, q, pr1, pr2) -> 
     fprintf o "zen.Rnotimply\n (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk pr1
	     print_dk pr2
  | DkRnotequiv (p, q, pr1, pr2, pr3) -> 
     fprintf o "zen.Rnotequiv\n (%a) (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk q 
	     print_dk pr1 
	     print_dk pr2
	     print_dk pr3
  | DkRex (a, p, pr1, pr2) -> 
     fprintf o "zen.Rex\n (%a) (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk pr1
	     print_dk pr2
  | DkRall (a, p, t, pr1, pr2) -> 
     fprintf o "zen.Rall\n (%a) (%a) (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk t 
	     print_dk pr1
	     print_dk pr2
  | DkRnotex (a, p, t, pr1, pr2) -> 
     fprintf o "zen.Rnotex\n (%a) (%a) (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk t 
	     print_dk pr1
	     print_dk pr2
  | DkRnotall (a, p, pr1, pr2) -> 
     fprintf o "zen.Rnotall\n (%a) (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk pr1
	     print_dk pr2
  | DkRextype (p, pr1, pr2) -> 
     fprintf o "zen.Rextype\n (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk pr1
	     print_dk pr2
  | DkRalltype (p, a, pr1, pr2) -> 
     fprintf o "zen.Ralltype\n (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk a 
	     print_dk pr1
	     print_dk pr2
  | DkRnotextype (p, a, pr1, pr2) -> 
     fprintf o "zen.Rnotextype\n (%a) (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk a 
	     print_dk pr1
	     print_dk pr2
  | DkRnotalltype (p, pr1, pr2) -> 
     fprintf o "zen.Rnotalltype\n (%a) (%a) (%a)" 
	     print_dk p 
	     print_dk pr1
	     print_dk pr2
  | DkRsubst  (a, p, t1, t2, pr1, pr2, pr3) -> 
     fprintf o "zen.Rsubst\n (%a) (%a) (%a) (%a) (%a) (%a) (%a)"
	     print_dk a 
	     print_dk p 
	     print_dk t1 
	     print_dk t2 
	     print_dk pr1
	     print_dk pr2
	     print_dk pr3
  | DkRconglr (a, p, t1, t2, pr1, pr2, pr3) -> 
     fprintf o "zen.Rconglr\n (%a) (%a) (%a) (%a) (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk t1 
	     print_dk t2 
	     print_dk pr1
	     print_dk pr2
	     print_dk pr3
  | DkRcongrl (a, p, t1, t2, pr1, pr2, pr3) -> 
     fprintf o "zen.Rcongrl\n (%a) (%a) (%a) (%a) (%a) (%a) (%a)" 
	     print_dk a 
	     print_dk p 
	     print_dk t1 
	     print_dk t2 
	     print_dk pr1
	     print_dk pr2
	     print_dk pr3

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
  | Dktype | Dkprop | Dkseq -> accu
  | Dkterm (t) -> get_var_list_aux env accu t
  | Dkarrow (l) -> List.fold_left (get_var_list_aux env) accu l
  | Dkpi (Dkvar(v, _), t) -> get_var_list_aux (v :: env) accu t
  | Dkvar (v, _) -> 
     if List.mem v env then accu
     else v :: accu
  | Dkapp (Dkvar (v, _), l) -> 
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
  test_graph gr;
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
