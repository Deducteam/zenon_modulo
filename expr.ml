(*  Copyright 2002 INRIA  *)
Version.add "$Id$";;

open Misc;;
open Namespace;;

let ( =%= ) = ( = );;
let ( = ) = ();;

type expr =
  | Evar of string * private_info
  | Emeta of expr * private_info
  | Eapp of expr * expr list * private_info

  | Earrow of expr list * expr * private_info

  | Enot of expr * private_info
  | Eand of expr * expr * private_info
  | Eor of expr * expr * private_info
  | Eimply of expr * expr * private_info
  | Eequiv of expr * expr * private_info
  | Etrue
  | Efalse

  | Eall of expr * expr * private_info
  | Eex of expr * expr * private_info
  | Etau of expr * expr * private_info
  | Elam of expr * expr * private_info

and private_info = {
  hash : int;
  skel_hash : int;
  free_vars : string list;
  size : int;
  taus : int;           (* depth of tau nesting *)
  metas : expr list;
  submetas : expr list; (* all metas for all subterms *)
  typ : expr option;
};;

type definition =
  | DefReal of string * string * expr * expr list * expr * string option
  | DefPseudo of (expr * int) * string * expr * expr list * expr
  | DefRec of expr * string * expr * expr list * expr
;;

type rwrt_tbl = (string, expr * expr) Hashtbl.t;;
type rwrt_tbls = rwrt_tbl * rwrt_tbl;;


exception Higher_order;;
exception Type_Mismatch of expr * expr * string;;
exception Bad_Arity of expr * expr list;;
exception Trying_to_type_type;;
exception Ill_typed_substitution of (expr * expr) list;;


(************************)
(* help for defined symbols in coq proofs *)
let defs = ref ([] : (string * expr) list)
let add_defs l =
    defs := l @ !defs
let get_defs () = !defs

(************************)
(* small sets of formulas (represented as lists) *)

let rec diff l1 l2 =
  match l1 with
  | [] -> []
  | e::t -> if List.exists ((==) e) l2
            then diff t l2
            else e :: (diff t l2)
;;

let union l1 l2 = (diff l1 l2) @@ l2;;

let rec disjoint l1 l2 =
  match l1 with
  | [] -> true
  | h::t -> if List.exists ((==) h) l2
            then false
            else disjoint t l2
;;

(*******************)

let k_true  = 0xb063cd7
and k_false = 0xd5ab9f0
and k_meta  = 0x33d092c
and k_app   = 0x33b9c25
and k_arrow = 0x0123456 (* TODO: fixme *)
and k_not   = 0x7c3e7d2
and k_and   = 0xccdc15b
and k_or    = 0x49b55b9
and k_imply = 0x7ebfa6f
and k_equiv = 0xb0f18f7
and k_all   = 0xfb437ff
and k_ex    = 0x0716b52
and k_tau   = 0x4ae7fad
and k_lam   = 0x24adcb3
;;


let mkpriv skel fv sz taus metas submetas typ = {
  hash = Hashtbl.hash (skel, fv);
  skel_hash = skel;
  free_vars = fv;
  size = sz;
  taus = taus;
  metas = metas;
  submetas = submetas;
  typ = Some typ;
};;

(* Base types *)
(* Variables version of the types should not be used (nor exported) as these
 * types should be considered constants*)
let rec v_type_type = Evar("$tType", {
    hash = Hashtbl.hash (0, ["$tType"]);
    skel_hash  = 0;
    free_vars = [];
    size = 1;
    taus = 0;
    metas = [];
    submetas = [];
    typ = None;
});;

let type_type =
    Eapp(v_type_type, [], {
    hash = Hashtbl.hash (0, []);
    skel_hash  = 0;
    free_vars = [];
    size = 1;
    taus = 0;
    metas = [];
    submetas = [];
    typ = None;
})

let v_type_prop = Evar("Prop", mkpriv 0 ["$o"] 1 0 [] [] type_type)
let type_prop = Eapp(v_type_prop, [], mkpriv 0 [] 1 0 [] [] type_type)

let v_type_iota = Evar("Iota", mkpriv 0 ["$i"] 1 0 [] [] type_type)
let type_iota = Eapp(v_type_iota, [], mkpriv 0 [] 1 0 [] [] type_type)

let v_type_none = Evar("$none", mkpriv 0 ["$none"] 1 0 [] [] type_type)
let type_none = Eapp(v_type_none, [], mkpriv 0 [] 1 0 [] [] type_type)

(* Expr creation *)
let priv_true = mkpriv k_true [] 1 0 [] [] type_prop;;
let priv_false = mkpriv k_false [] 1 0 [] [] type_prop;;

let get_priv = function
  | Evar (_, h) -> h
  | Emeta (_, h) -> h
  | Eapp (_, _, h) -> h

  | Earrow (_, _, h) -> h

  | Enot (_, h) -> h
  | Eand (_, _, h) -> h
  | Eor (_, _, h) -> h
  | Eimply (_, _, h) -> h
  | Eequiv (_, _, h) -> h
  | Etrue -> priv_true
  | Efalse -> priv_false

  | Eall (_, _, h) -> h
  | Eex (_, _, h) -> h
  | Etau (_, _, h) -> h
  | Elam (_, _, h) -> h
;;

let get_hash e = (get_priv e).hash;;
let get_skel e = (get_priv e).skel_hash;;
let get_fv e = (get_priv e).free_vars;;
let get_size e = (get_priv e).size;;
let get_taus e = (get_priv e).taus;;
let get_metas e = (get_priv e).metas;;
let get_submetas e = (get_priv e).submetas;;
let get_unsafe_type e =
  if e == v_type_type then assert false
  else match (get_priv e).typ with
       | Some ty -> ty
       | None -> type_type
;;
let get_type e =
  if e == type_type || e == v_type_type
  then raise Trying_to_type_type
  else match (get_priv e).typ with
       | Some ty -> ty
       | None -> assert false
;;

let get_meta_type = function
    | Eall (v, _, _) | Eex (v, _, _) -> get_type v
    | _ -> assert false
;;

let get_name = function
    | Evar (s, _) -> s
    | _ -> assert false
;;

let var_equal e1 e2 = match (e1, e2) with
  | Evar (v1, _), Evar (v2, _) -> v1 =%= v2
  | _ -> raise (Invalid_argument "var_equal")
;;

let list_var_equal l1 l2 =
  List.length l1 =%= List.length l2 && (
    List.for_all2 var_equal l1 l2)
;;

let rec str_union l1 l2 =
  match l1, l2 with
  | [], _ -> l2
  | _, [] -> l1
  | h::t, _ when List.exists ((=%=) h) l2 -> str_union t l2
  | h::t, _ -> str_union t (h :: l2)
;;

let rec remove x l =
  match x, l with
  | _, [] -> []
  | Evar (v, _), h::t when v =%= h -> t
  | _, h::t -> h :: (remove x t)
;;

let combine x y = x + y * 131 + 1;;

let rec make_list c acc = function
    | 0 -> acc
    | n when n > 0 -> make_list c (c :: acc) (n - 1)
    | _ -> assert false

let prop_app l =
    let aux l =
        try raise (Type_Mismatch (type_prop, (List.find (fun e -> not (e == type_prop)) l), "Expr.prop_app"))
        with Not_found -> type_prop
    in
    if List.memq type_iota l then 
      type_iota
    else if List.memq type_none l then
      type_none
    else
      aux l

(* Meta-data constructors *)
(* Since expressions are hashconsed, actual constructors are defined a bit later *)
(* Additionally, the application needs more work and is defined together with substitution *)
let priv_var s t =
  mkpriv 0 [s] 1 0 [] [] t
;;
let rec priv_arrow args ret =
  let comb_skel accu e = combine (get_skel e) accu in
  let skel = combine k_app (List.fold_left comb_skel (get_hash ret) args) in
  let fv = List.fold_left (fun a e -> str_union a (get_fv e)) [] args in
  let sz = List.fold_left (fun a e -> a + get_size e) 1 args in
  let taus = List.fold_left (fun a e -> max (get_taus e) a) 0 args in
  let metas = List.fold_left (fun a e -> union (get_metas e) a) [] args in
  let submetas = List.fold_left (fun a e -> union (get_submetas e) a) [] args in
  mkpriv skel fv sz taus metas submetas type_type
;;
let priv_meta e =
  mkpriv (combine k_meta (get_skel e)) [] 1 0 [e]
	 (get_metas e) (get_meta_type e)
;;
let priv_not e =
  mkpriv (combine k_not (get_skel e)) (get_fv e) (get_size e + 1)
         (get_taus e) (get_metas e) (get_submetas e) (prop_app [get_type e])
;;
let priv_and e1 e2 =
  mkpriv (combine k_and (combine (get_skel e1) (get_skel e2)))
         (str_union (get_fv e1) (get_fv e2))
         (get_size e1 + get_size e2 + 1)
         (max (get_taus e1) (get_taus e2))
         (union (get_metas e1) (get_metas e2))
         (union (get_submetas e1) (get_submetas e2))
         (prop_app [get_type e1; get_type e2])
;;
let priv_or e1 e2 =
  mkpriv (combine k_or (combine (get_skel e1) (get_skel e2)))
         (str_union (get_fv e1) (get_fv e2))
         (get_size e1 + get_size e2 + 1)
         (max (get_taus e1) (get_taus e2))
         (union (get_metas e1) (get_metas e2))
         (union (get_submetas e1) (get_submetas e2))
         (prop_app [get_type e1; get_type e2])
;;
let priv_imply e1 e2 =
  mkpriv (combine k_imply (combine (get_skel e1) (get_skel e2)))
         (str_union (get_fv e1) (get_fv e2))
         (get_size e1 + get_size e2 + 1)
         (max (get_taus e1) (get_taus e2))
         (union (get_metas e1) (get_metas e2))
         (union (get_submetas e1) (get_submetas e2))
         (prop_app [get_type e1; get_type e2])
;;
let priv_equiv e1 e2 =
  mkpriv (combine k_equiv (combine (get_skel e1) (get_skel e2)))
         (str_union (get_fv e1) (get_fv e2))
         (get_size e1 + get_size e2 + 1)
         (max (get_taus e1) (get_taus e2))
         (union (get_metas e1) (get_metas e2))
         (union (get_submetas e1) (get_submetas e2))
         (prop_app [get_type e1; get_type e2])
;;
let priv_all v e =
  mkpriv (combine k_all (combine (get_hash (get_type v)) (get_skel e)))
         (remove v (get_fv e)) (1 + get_size e) (get_taus e) (get_metas e)
	 (get_submetas e)
         (if get_type e == type_type then type_type
          else if get_type e == type_prop then type_prop
          else if get_type e == type_iota then type_iota
          else if get_type e == type_none then type_none
          else raise (Type_Mismatch (type_prop, get_type e, "priv_all")))
         (* forall is used for both universal quantification and polymorphism *)
;;
let priv_ex v e =
  mkpriv (combine k_ex (combine (get_hash (get_type v)) (get_skel e)))
         (remove v (get_fv e)) (1 + get_size e) (get_taus e) (get_metas e)
         (get_submetas e) (prop_app [get_type e])
;;
let priv_tau v e =
  mkpriv (combine k_tau (combine (get_hash (get_type v)) (get_skel e)))
         (remove v (get_fv e)) 1 (1 + get_taus e) (get_metas e)
         (get_submetas e) (get_type v)
;;

(************************)
(* temp printer *)
let rec print b ex =
  match ex with
  | Evar (v, _) -> Printf.bprintf b "%s" v;
  | Emeta (e, _) -> Printf.bprintf b "Meta.(%a)" print e;
  | Earrow (args, ret, _) ->
      Printf.bprintf b "(%a -> %a)"
      (fun b l -> List.iteri (fun i x -> if i > 0 then Printf.bprintf b " * "; Printf.bprintf b "%a" print x) l) args print ret;
  | Eapp (s, es, _) ->
      Printf.bprintf b "(%a%a)" print s
      (fun b l -> List.iter (fun x -> Printf.bprintf b " %a" print x) l) es
  | Enot (e, _) ->
      Printf.bprintf b "~ %a" print e
  | Eand (e1, e2, _) ->
      Printf.bprintf b "(%a /\\ %a)" print e1 print e2
  | Eor (e1, e2, _) ->
      Printf.bprintf b "(%a \\/ %a)" print e1 print e2
  | Eimply (e1, e2, _) ->
      Printf.bprintf b "(%a => %a)" print e1 print e2
  | Eequiv (e1, e2, _) ->
      Printf.bprintf b "(%a <=> %a)" print e1 print e2
  | Etrue -> Printf.bprintf b "True";
  | Efalse -> Printf.bprintf b "False";
  | Eall (v, e, _) ->
      Printf.bprintf b "(All.(%a : %a): %a)" print v print (get_type v) print e
  | Eex (v, e, _) ->
      Printf.bprintf b "(Exi.(%a : %a): %a)" print v print (get_type v) print e
  | Etau (v, e, _) ->
      Printf.bprintf b "(Tau.(%a : %a): _)" print v print (get_type v) (*print e*)
  | Elam (v, e, _) ->
      Printf.bprintf b "(Lam.(%a : %a): %a)" print v print (get_type v) print e


(************************)
(* Hashconsing module for expressions *)
module HashedExpr = struct
  type t = expr;;

  let hash = get_hash;;

  type binding = Bound of int | Free of expr;;

  let get_binding env v =
    let rec index i v env =
      match env with
      | x :: _ when x == v -> Bound i
      | _ :: t -> index (i+1) v t
      | [] -> Free v
    in
    index 0 v env
  ;;

  let same_binding env1 v1 env2 v2 =
    match (get_binding env1 v1), (get_binding env2 v2) with
    | Bound i1, Bound i2 -> i1 == i2
    | Free w1, Free w2 -> w1 == w2
    | _, _ -> false
  ;;

  let var_name v =
    match v with
    | Evar (name, _) -> name
    | _ -> assert false
  ;;

  let intersects env l =
    let eq x e = match e with Evar (s, _) -> s =%= x | _ -> assert false in
    List.exists (fun v -> List.exists (eq v) env) l
  ;;

  let rec equal_in_env env1 env2 e1 e2 =
    let m1 = intersects env1 (get_fv e1) in
    let m2 = intersects env2 (get_fv e2) in
    not m1 && not m2 && e1 == e2
    || m1 && m2 && begin
      match e1, e2 with
      | Evar _, Evar _ -> same_binding env1 e1 env2 e2
      | Emeta (n1, _), Emeta (n2, _) -> n1 == n2
      | Earrow (args1, ret1, _), Earrow (args2, ret2, _) ->
          equal_in_env env1 env2 ret1 ret2
          && List.length args1 =%= List.length args2
          && List.for_all2 (equal_in_env env1 env2) args1 args2
      | Eapp (sym1, args1, _), Eapp (sym2, args2, _) ->
          equal_in_env env1 env2 sym1 sym2
          && List.length args1 =%= List.length args2
          && List.for_all2 (equal_in_env env1 env2) args1 args2
      | Enot (f1, _), Enot (f2, _) -> equal_in_env env1 env2 f1 f2
      | Eand (f1, g1, _), Eand (f2, g2, _)
      | Eor (f1, g1, _), Eor (f2, g2, _)
      | Eimply (f1, g1, _), Eimply (f2, g2, _)
      | Eequiv (f1, g1, _), Eequiv (f2, g2, _)
        -> equal_in_env env1 env2 f1 f2 && equal_in_env env1 env2 g1 g2
      | Efalse, Efalse
      | Etrue, Etrue
        -> true
      | Eall (v1, f1, _), Eall (v2, f2, _)
      | Eex (v1, f1, _), Eex (v2, f2, _)
      | Etau (v1, f1, _), Etau (v2, f2, _)
      | Elam (v1, f1, _), Elam (v2, f2, _)
        -> (List.mem (var_name v1) (get_fv f1))
           =%= (List.mem (var_name v2) (get_fv f2))
           && equal_in_env (v1::env1) (v2::env2) f1 f2
      | _, _ -> false
    end
  ;;

  let equal_in_env1 v1 v2 f1 f2 =
    let m1 = List.mem (var_name v1) (get_fv f1) in
    let m2 = List.mem (var_name v2) (get_fv f2) in
    not m1 && not m2 && f1 == f2
    || m1 && m2 && equal_in_env [v1] [v2] f1 f2
  ;;

  let equal e1 e2 = get_type e1 == get_type e2 &&
    match e1, e2 with
    | Evar (v1, _), Evar (v2, _) -> v1 =%= v2 && get_type e1 == get_type e2
    | Emeta (f1, _), Emeta (f2, _) -> f1 == f2
    | Earrow(args1, ret1, _), Earrow(args2, ret2, _) ->
        ret1 == ret2 && List.length args1 =%= List.length args2
        && List.for_all2 (==) args1 args2
    | Eapp (sym1, args1, _), Eapp (sym2, args2, _) ->
        sym1 == sym2 && List.length args1 =%= List.length args2
        && List.for_all2 (==) args1 args2
    | Enot (f1, _), Enot (f2, _) -> f1 == f2
    | Eand (f1, g1, _), Eand (f2, g2, _)
    | Eor (f1, g1, _), Eor (f2, g2, _)
    | Eimply (f1, g1, _), Eimply (f2, g2, _)
    | Eequiv (f1, g1, _), Eequiv (f2, g2, _)
      -> f1 == f2 && g1 == g2
    | Eall (v1, f1, _), Eall (v2, f2, _)
    | Eex (v1, f1, _), Eex (v2, f2, _)
    | Etau (v1, f1, _), Etau (v2, f2, _)
    | Elam (v1, f1, _), Elam (v2, f2, _)
      when v1 == v2
      -> f1 == f2
    | Eall (v1, f1, _), Eall (v2, f2, _)
    | Eex (v1, f1, _), Eex (v2, f2, _)
    | Etau (v1, f1, _), Etau (v2, f2, _)
    | Elam (v1, f1, _), Elam (v2, f2, _)
      -> get_type v1 == get_type v2 && equal_in_env1 v1 v2 f1 f2
    | _, _ -> false
  ;;
end;;

(* Weak table version *)

module HE = Weak.Make (HashedExpr);;
let tbl = HE.create 999997;;

let he_merge k =
  try HE.find tbl k
  with Not_found ->
    incr Globals.num_expr;
    HE.add tbl k;
    k
;;

let print_stats oc =
  let (tbllen, entries, bucklen, least, median, largest) = HE.stats tbl in
  Printf.fprintf oc "tbl:%d ent:%d buc:%d sml:%d med:%d lrg:%d\n"
    tbllen entries bucklen least median largest
;;

(* Normal table version (faster but uses more memory) *)
(*
  module HE = Hashtbl.Make (HashedExpr);;
  let tbl = HE.create 999997;;

  let he_merge k =
    try HE.find tbl k
    with Not_found ->
      incr Globals.num_expr;
      HE.add tbl k k;
      k
  ;;
*)

(* Expression constructors (except eapp, see substitutions) *)
let evar s = he_merge (Evar (s, priv_var s type_iota));;
let tvar s t = he_merge (Evar (s, priv_var s t));;
let emeta (e) = he_merge (Emeta (e, priv_meta e));;
let earrow args ret =
  match ret with
  | Earrow _ -> assert false
  | _ -> begin match args with
    | [] -> ret
    | _ ->
        he_merge (Earrow (args, ret, priv_arrow args ret))
    end
;;
let add_arg ty1 ty2 =
  match ty2 with
  | Earrow (l, ret, _) -> earrow (ty1 :: l) ret
  | _ -> earrow [ty1] ty2
;;
let enot (e) = he_merge (Enot (e, priv_not e));;
let eand (e1, e2) = he_merge (Eand (e1, e2, priv_and e1 e2));;
let eor (e1, e2) = he_merge (Eor (e1, e2, priv_or e1 e2));;
let eimply (e1, e2) = he_merge (Eimply (e1, e2, priv_imply e1 e2));;
let etrue = Etrue;;
let efalse = Efalse;;
let eequiv (e1, e2) = he_merge (Eequiv (e1, e2, priv_equiv e1 e2));;
let eall (v, e) = he_merge (Eall (v, e, priv_all v e));;
let eex (v, e) = he_merge (Eex (v, e, priv_ex v e));;
let etau (v, e) = he_merge (Etau (v, e, priv_tau v e));;

let exor (e1,e2) = eor (eand (e1, enot e2), eand (enot e1, e2));;

let priv_lam v e =
  mkpriv (combine k_lam (combine (get_hash (get_type v)) (get_skel e)))
         (remove v (get_fv e)) 1 (get_taus e) (get_metas e) (get_submetas e)
         (add_arg (get_type v) (get_type e))

let elam (v, e) = he_merge (Elam (v, e, priv_lam v e))
;;

let estring = evar "$string";;

let rec all_list vs body =
  match vs with
  | [] -> body
  | h::t -> eall (h, all_list t body)
;;

let rec ex_list vs body =
  match vs with
  | [] -> body
  | h::t -> eex (h, ex_list t body)
;;

type t = expr;;
let hash = get_hash;;
let equal = (==);;
let compare x y =
  match Pervasives.compare (hash x) (hash y) with
  | 0 -> if equal x y then 0 else Pervasives.compare x y
  | x when x < 0 -> -1
  | _ -> 1
;;

(************************)

exception Mismatch;;
exception Ununifiable;;

let rec xpreunify accu e1 e2 =
  match e1, e2 with
  | _, _ when e1 == e2 -> accu
  | Eapp (s1, a1, _), Eapp (s2, a2, _) when s1 =%= s2 ->
      List.fold_left2 xpreunify accu a1 a2
  | Earrow (a1, r1, _), Earrow (a2, r2, _) ->
      List.fold_left2 xpreunify accu (r1 :: a1) (r2 :: a2)
  | Emeta (m1, _), e
  | e, Emeta (m1, _) ->
     begin
       try
     if not (e == List.assq m1 accu) then
       raise Mismatch
     else
       accu
       with Not_found -> begin match e with
       | Emeta(m2, _) when get_size m1 > get_size m2 -> (m2, e) :: accu
       | _ -> (m1, e) :: accu
       end
     end
  | _, _ -> raise Mismatch
;;

let preunify e1 e2 =
  try xpreunify [] e1 e2
  with Mismatch -> []
;;

let preunifiable e1 e2 =
  try ignore (xpreunify [] e1 e2);
      true
  with Mismatch -> false
;;

let preunify_list l1 l2 =
  try List.fold_left2 xpreunify [] l1 l2
  with Invalid_argument _ -> raise Mismatch
;;

let occurs_as_meta e f = List.exists ((==) e) (get_metas f);;
let size = get_size;;
let has_metas e = get_metas e <> [];;
let count_metas e = List.length (get_metas e);;

let cursym = ref (Bytes.of_string var_prefix)

let rec incr_sym n =
  assert (n <= String.length !cursym);
  if (n =%= Bytes.length !cursym) then begin
      cursym := Bytes.extend !cursym 0 1;
      Bytes.set !cursym n 'a'
  end else match Bytes.get !cursym n with
  | 'z' -> Bytes.set !cursym n 'a'; incr_sym (n+1)
  | c -> Bytes.set !cursym n (Char.chr (1 + Char.code c))
;;

let newname () =
  incr_sym (String.length var_prefix);
  Bytes.to_string !cursym
;;

let newvar () = evar (newname ());;
let newtvar ty = tvar (newname ()) ty;;

let rec rm_binding v map =
  match map with
  | [] -> []
  | (w, _) :: t when w == v -> t
  | h :: t -> h :: (rm_binding v t)
;;

let conflict v map =
  match v with
  | Evar (vv, _) ->
      List.exists (fun (w, e) -> List.mem vv (get_fv e)) map
  | _ -> assert false
;;

let disj vars map =
  let diff_var v e =
    match e with
    | Evar (w, _), _ -> not (v =%= w)
    | _ -> assert false
  in
  let irrelevant v = List.for_all (diff_var v) map in
  List.for_all irrelevant vars
;;

let rec find2 p l l' = match l, l' with
  | a :: r, b :: r' -> if p a b then (a, b) else find2 p r r'
  | [], [] -> raise Not_found
  | _ -> invalid_arg "find2"

(* Substitution and application need to be defined recursively, since we need
 * substitution for application of polymorphic functions *)
let rec priv_app s args =
  let comb_skel accu e = combine (get_skel e) accu in
  let skel = combine k_app (List.fold_left comb_skel (get_hash s) args) in
  let fv = List.fold_left (fun a e -> str_union a (get_fv e)) [] args in
  let sz = List.fold_left (fun a e -> a + get_size e) 1 args in
  let taus = List.fold_left (fun a e -> max (get_taus e) a) 0 args in
  let metas = List.fold_left (fun a e -> union (get_metas e) a) [] args in
  let submetas = List.fold_left (fun a e -> union (get_submetas e) a) [] args in
  Log.debug 15 "Typing %a ::: %a" print s print (get_type s);
  List.iter (fun x -> Log.debug 15 " |- %a ::: %a" print x print (get_unsafe_type x)) args;
  let typ = type_app (get_type s) args in
  mkpriv skel fv sz taus metas submetas typ

and eapp (s, args) = he_merge (Eapp (s, args, priv_app s args))

(* Delay the actual substitution of type arguments so that the complexity stays linear *)
and inst_app map s args = match s, args with
  | Eall(v, e, _), a :: r ->
          assert (get_type v == type_type);
          if get_type a == type_type then
            inst_app ((v, a) :: map) e r
          else
            raise (Type_Mismatch(type_type, get_type a, "Expr.inst_app"))
  | _ -> substitute_safe map s, args

and type_app s args =
(*    if s == type_none || List.memq type_none (List.map get_type args) then
        type_none
    else*) if s == type_iota || List.memq type_iota (List.map get_type args) then
        type_iota
    else if s == type_none || List.memq type_none (List.map get_type args) then
        type_none
    else match inst_app [] s args with
    | Earrow(l, ret, _), args' ->
            let l' = List.map get_type args' in
            begin try
                let t, t' = find2 (fun t t' -> not (t == t')) l l' in
                raise (Type_Mismatch (t, t', "Expr.type_app"))
            with
            | Invalid_argument "find2" ->
                raise (Bad_Arity (s, args))
            | Not_found ->
                ret
            end
    | t, [] -> t
    | _ -> assert false

and eeq a b =
    let t = get_type a in
    let s = tvar "=" (earrow [t; t] type_prop) in
    eapp (s, [a; b])

and substitute_unsafe map e =
  let aux f map v body =
      let t = substitute_unsafe map (get_type v) in
      let map1 = rm_binding v map in
      let nv =
          if conflict v map1 then
            tvar (newname ()) t
          else
            tvar (get_name v) t
      in
      if v <> nv then
        f (nv, substitute_unsafe ((v, nv) :: map1) body)
      else
        f (v, substitute_unsafe map1 body)
  in
  match e with
  | _ when disj (get_fv e) map -> e
  | Evar (v, _) -> (try List.assq e map with Not_found -> e)
  | Emeta _ -> e
  | Earrow(args, ret, _) ->
     earrow (List.map (substitute_unsafe map) args) (substitute_unsafe map ret)
  (* Equality symbol need to be re-generated with correct type,
     in case we have substituted a type argument *)
  | Eapp (Evar ("=", _) as s, ([a; b] as args), _) ->
    begin try
        eapp (s, List.map (substitute_unsafe map) args)
    with Type_Mismatch _ ->
        eeq (substitute_unsafe map a) (substitute_unsafe map b)
    end
  | Eapp (s, args, _) ->
     eapp (s, List.map (substitute_unsafe map) args)
  | Enot (f, _) ->
     enot (substitute_unsafe map f)
  | Eand (f, g, _) ->
     eand (substitute_unsafe map f, substitute_unsafe map g)
  | Eor (f, g, _) ->
     eor (substitute_unsafe map f, substitute_unsafe map g)
  | Eimply (f, g, _) ->
     eimply (substitute_unsafe map f, substitute_unsafe map g)
  | Eequiv (f, g, _) ->
     eequiv (substitute_unsafe map f, substitute_unsafe map g)
  | Etrue | Efalse -> e
  | Eall (v, f, _) -> aux eall map v f
  | Eex (v, f, _) -> aux eex map v f
  | Etau (v, f, _) -> aux etau map v f
  | Elam (v, f, _) -> aux elam map v f

and substitute_safe map e =
  if (List.for_all (fun (a, b) -> get_type a == get_type b) map)
  then
    substitute_unsafe map e
  else
    raise (Ill_typed_substitution map)
;;

let substitute = substitute_unsafe;;

let rec substitute_meta map e =
  match e with
  | Evar (v, _) -> e
  | Emeta (e', _) -> let (meta, v) = map in if e' == meta then v else e
  | Earrow(args, ret, _) -> earrow (List.map (substitute_meta map) args) (substitute_meta map ret)
  | Eapp (s, args, _) -> eapp (s, List.map (substitute_meta map) args)
  | Enot (f, _) -> enot (substitute_meta map f)
  | Eand (f, g, _) -> eand (substitute_meta map f, substitute_meta map g)
  | Eor (f, g, _) -> eor (substitute_meta map f, substitute_meta map g)
  | Eimply (f, g, _) -> eimply (substitute_meta map f, substitute_meta map g)
  | Eequiv (f, g, _) -> eequiv (substitute_meta map f, substitute_meta map g)
  | Etrue | Efalse -> e
  | Eall (v, f, _) -> eall (v, substitute_meta map f)
  | Eex (v, f, _) -> eex (v, substitute_meta map f)
  | Etau (v, f, _) -> etau (v, substitute_meta map f)
  | Elam (v, f, _) -> elam (v, substitute_meta map f)
;;

(*
let rec substitute_expr map e =
  match e with
  | _ when e == (fst map) -> snd map
  | Evar (v, _) -> e
  | Emeta (e', _) -> e
  | Earrow(args, ret, _) -> earrow (List.map (substitute_expr map) args) (substitute_expr map ret)
  | Eapp (s, args, _) -> eapp (s, List.map (substitute_expr map) args)
  | Enot (f, _) -> enot (substitute_expr map f)
  | Eand (f, g, _) -> eand (substitute_expr map f, substitute_expr map g)
  | Eor (f, g, _) -> eor (substitute_expr map f, substitute_expr map g)
  | Eimply (f, g, _) -> eimply (substitute_expr map f, substitute_expr map g)
  | Eequiv (f, g, _) -> eequiv (substitute_expr map f, substitute_expr map g)
  | Etrue | Efalse -> e
  | Eall (v, f, _) -> eall (v, substitute_expr map f)
  | Eex (v, f, _) -> eex (v, substitute_expr map f)
  | Etau (v, f, _) -> etau (v, substitute_expr map f)
  | Elam (v, f, _) -> elam (v, substitute_expr map f)
;;
*)

let rec substitute_2nd_unsafe map e =
  match e with
  | Evar (v, _) -> (try List.assq e map with Not_found -> e)
  | Emeta _ -> e
  | Earrow _ -> assert false
  | Eapp (s, args, _) ->
     let acts = List.map (substitute_2nd_unsafe map) args in
     begin try
      let lam = List.assq (evar (get_name s)) map in
      match lam, acts with
      | Elam (v, body, _), [a] -> substitute [(v,a)] body
      | Evar (v, _), _ -> eapp (lam, acts)
      | Eapp (s1, args1, _), _ -> eapp (s1, args1 @ acts)
      | _ -> raise Higher_order
     with Not_found -> eapp (s, acts)
     end
  | Enot (f, _) ->
     enot (substitute_2nd_unsafe map f)
  | Eand (f, g, _) ->
     eand (substitute_2nd_unsafe map f, substitute_2nd_unsafe map g)
  | Eor (f, g, _) ->
     eor (substitute_2nd_unsafe map f, substitute_2nd_unsafe map g)
  | Eimply (f, g, _) ->
     eimply (substitute_2nd_unsafe map f, substitute_2nd_unsafe map g)
  | Eequiv (f, g, _) ->
     eequiv (substitute_2nd_unsafe map f, substitute_2nd_unsafe map g)
  | Etrue | Efalse -> e
  | Eall (v, f, _) ->
      let map1 = rm_binding v map in
      if conflict v map1 then
        let nv = newvar () in
        eall (nv, substitute_2nd_unsafe ((v, nv) :: map1) f)
      else
        eall (v, substitute_2nd_unsafe map1 f)
  | Eex (v, f, _) ->
      let map1 = rm_binding v map in
      if conflict v map1 then
        let nv = newvar () in
        eex (nv, substitute_2nd_unsafe ((v, nv) :: map1) f)
      else
        eex (v, substitute_2nd_unsafe map1 f)
  | Etau (v, f, _) ->
      let map1 = rm_binding v map in
      if conflict v map1 then
        let nv = newvar () in
        etau (nv, substitute_2nd_unsafe ((v, nv) :: map1) f)
      else
        etau (v, substitute_2nd_unsafe map1 f)
  | Elam (v, f, _) ->
      let map1 = rm_binding v map in
      if conflict v map1 then
        let nv = newvar () in
        elam (nv, substitute_2nd_unsafe ((v, nv) :: map1) f)
      else
        elam (v, substitute_2nd_unsafe map1 f)

and substitute_2nd_safe map e =
  if (List.for_all (fun (a, b) -> get_type a == get_type b) map)
  then
    substitute_2nd_unsafe map e
  else
    raise (Ill_typed_substitution map)

let substitute_2nd = substitute_2nd_unsafe;;

let apply f a =
  match f with
  | Elam (v, body, _) -> substitute [(v, a)] body
  | _ -> raise Higher_order
;;

let add_argument f a =
  match f with
  | Elam _ -> apply f a
  | Evar (s, _) -> eapp (f, [a])
  | Eapp (s, args, _) -> eapp (s, args @ [a])
  | _ -> raise Higher_order
;;

let rec remove_scope e =
  match e with
  | Eapp (f, e1 :: t :: vals, _) when get_name f =%= "$scope" -> remove_scope (apply e1 t)
  | Earrow _ -> assert false
  | Eapp (f, args, _) -> e
  | Enot (e1, _) -> enot (remove_scope e1)
  | Eand (e1, e2, _) -> eand (remove_scope e1, remove_scope e2)
  | Eor (e1, e2, _) -> eor (remove_scope e1, remove_scope e2)
  | Eimply (e1, e2, _) -> eimply (remove_scope e1, remove_scope e2)
  | Eequiv (e1, e2, _) -> eequiv (remove_scope e1, remove_scope e2)
  | Eall (v, e1, _) -> eall (v, remove_scope e1)
  | Eex (v, e1, _) -> eex (v, remove_scope e1)
  | Evar _ | Emeta _ | Etrue | Efalse | Etau _ | Elam _
  -> e
;;

let nb_tvar e =
  match e with
  | Eapp (s, _, _) ->
     let rec aux count ee =
       match ee with
       | Eall (_, ee', _) -> aux (count + 1) ee'
       | _ -> count
     in
     aux 0 (get_type s)
  | _ -> assert false
;;

exception Unsplitable;;

let rec split_list_aux n l accu =
  match n, l with
  | 0, _  -> (List.rev accu), l
  | _, [] -> raise Unsplitable
  | _, h :: tl -> split_list_aux (n - 1) tl (h :: accu)
;;

let split_list n l =
  split_list_aux n l []
;;

let rec get_tvar_aux accu e =
  match e with
  | Evar _
  | Emeta _ -> if get_type e == type_type && not (List.memq e accu)
           then e :: accu
           else accu
  | Eapp (_, args, _) ->
     List.fold_left get_tvar_aux accu args
  | Enot (e1, _) -> get_tvar_aux accu e1
  | Etau _ -> accu

  | Earrow _
  | Eand _
  | Eor _
  | Eimply _
  | Eequiv _
  | Etrue
  | Efalse
  | Eall _
  | Eex _
  | Elam _ -> assert false
;;

let get_tvar e =
  List.rev (get_tvar_aux [] e)
;;


type goalness = int;;

let tbl_term = ref (Hashtbl.create 42);;
let tbl_prop = ref (Hashtbl.create 42);;
