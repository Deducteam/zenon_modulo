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

  | Enot of expr * private_info
  | Eand of expr * expr * private_info
  | Eor of expr * expr * private_info
  | Eimply of expr * expr * private_info
  | Eequiv of expr * expr * private_info
  | Etrue
  | Efalse

  | Eall of expr  * expr * private_info
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
  typ : expr;
};;

type definition =
  | DefReal of string * string * expr list * expr * string option
  | DefPseudo of (expr * int) * string * expr list * expr
  | DefRec of expr * string * expr list * expr
;;

exception Higher_order;;
exception Type_Mismatch of expr * expr;;
exception Bad_Arity of expr * expr list;;


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


let mkpriv skel fv sz taus metas typ = {
  hash = Hashtbl.hash (skel, fv);
  skel_hash = skel;
  free_vars = fv;
  size = sz;
  taus = taus;
  metas = metas;
  typ = typ;
};;

(* Base types *)
let rec v_type_type = Evar("$tType", {
    hash = Hashtbl.hash (0, ["$tType"]);
    skel_hash  = 0;
    free_vars = [];
    size = 1;
    taus = 0;
    metas = [];
    typ = type_type;
})

and type_type =
    Eapp(v_type_type, [], {
    hash = Hashtbl.hash (0, []);
    skel_hash  = 0;
    free_vars = [];
    size = 1;
    taus = 0;
    metas = [];
    typ = type_type;
})

let v_type_prop = Evar("$o", mkpriv 0 ["$o"] 1 0 [] type_type)
let type_prop = Eapp(v_type_prop, [], mkpriv 0 [] 1 0 [] type_type)

let v_type_none = Evar("$none", mkpriv 0 ["$none"] 1 0 [] type_type)
let type_none = Eapp(v_type_none, [], mkpriv 0 [] 1 0 [] type_type)

(* Expr creation *)
let priv_true = mkpriv k_true [] 1 0 [] type_prop;;
let priv_false = mkpriv k_false [] 1 0 [] type_prop;;

let get_priv = function
  | Evar (_, h) -> h
  | Emeta (_, h) -> h
  | Eapp (_, _, h) -> h

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
let get_type e = (get_priv e).typ;;

let get_meta_type = function
    | Eall (v, _, _) | Eex (v, _, _) -> get_type v
    | _ -> assert false
;;

let get_name = function
    | Evar (s, _) -> s
    | _ -> assert false
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

let prop_app l =
    let aux l =
        try raise (Type_Mismatch (type_prop, (List.find (fun e -> not (e == type_prop)) l)))
        with Not_found -> type_prop
    in
    if List.memq type_none l then
        type_none
    else
        aux l

let priv_var s t = mkpriv 0 [s] 1 0 [] t;;
let priv_meta e =
  mkpriv (combine k_meta (get_skel e)) [] 1 0 [e] (get_meta_type e)
;;
let priv_not e =
  mkpriv (combine k_not (get_skel e)) (get_fv e) (get_size e + 1)
         (get_taus e) (get_metas e) (prop_app [get_type e])
;;
let priv_and e1 e2 =
  mkpriv (combine k_and (combine (get_skel e1) (get_skel e2)))
         (str_union (get_fv e1) (get_fv e2))
         (get_size e1 + get_size e2 + 1)
         (max (get_taus e1) (get_taus e2))
         (union (get_metas e1) (get_metas e2))
         (prop_app [get_type e1; get_type e2])
;;
let priv_or e1 e2 =
  mkpriv (combine k_or (combine (get_skel e1) (get_skel e2)))
         (str_union (get_fv e1) (get_fv e2))
         (get_size e1 + get_size e2 + 1)
         (max (get_taus e1) (get_taus e2))
         (union (get_metas e1) (get_metas e2))
         (prop_app [get_type e1; get_type e2])
;;
let priv_imply e1 e2 =
  mkpriv (combine k_imply (combine (get_skel e1) (get_skel e2)))
         (str_union (get_fv e1) (get_fv e2))
         (get_size e1 + get_size e2 + 1)
         (max (get_taus e1) (get_taus e2))
         (union (get_metas e1) (get_metas e2))
         (prop_app [get_type e1; get_type e2])
;;
let priv_equiv e1 e2 =
  mkpriv (combine k_equiv (combine (get_skel e1) (get_skel e2)))
         (str_union (get_fv e1) (get_fv e2))
         (get_size e1 + get_size e2 + 1)
         (max (get_taus e1) (get_taus e2))
         (union (get_metas e1) (get_metas e2))
         (prop_app [get_type e1; get_type e2])
;;
let priv_all v e =
  mkpriv (combine k_all (combine (get_hash (get_type v)) (get_skel e)))
         (remove v (get_fv e)) (1 + get_size e) (get_taus e) (get_metas e)
         (prop_app [get_type e])
;;
let priv_ex v e =
  mkpriv (combine k_ex (combine (get_hash (get_type v)) (get_skel e)))
         (remove v (get_fv e)) (1 + get_size e) (get_taus e) (get_metas e)
         (prop_app [get_type e])
;;
let priv_tau v e =
  mkpriv (combine k_tau (combine (get_hash (get_type v)) (get_skel e)))
         (remove v (get_fv e)) 1 (1 + get_taus e) (get_metas e)
         (get_type v)
;;
let priv_lam v e =
  mkpriv (combine k_lam (combine (get_hash (get_type v)) (get_skel e)))
         (remove v (get_fv e)) 1 (get_taus e) (get_metas e)
         (get_type e)
;;

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
      | Eapp (sym1, args1, _), Eapp (sym2, args2, _) ->
          sym1 =%= sym2 && List.length args1 =%= List.length args2
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

  let opt_equal a b = match a, b with
  | None, None -> true
  | Some t1, Some t2 -> Type.equal t1 t2
  | _ -> false

  let equal e1 e2 =
    match e1, e2 with
    | Evar (v1, _), Evar (v2, _) -> v1 =%= v2 && get_type e1 == get_type e2
    | Emeta (f1, _), Emeta (f2, _) -> f1 == f2
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

let evar s = he_merge (Evar (s, priv_var s type_none))
let tvar s t = he_merge (Evar (s, priv_var s t))
let emeta (e) = he_merge (Emeta (e, priv_meta e))
let enot (e) = he_merge (Enot (e, priv_not e))
let eand (e1, e2) = he_merge (Eand (e1, e2, priv_and e1 e2))
let eor (e1, e2) = he_merge (Eor (e1, e2, priv_or e1 e2))
let eimply (e1, e2) = he_merge (Eimply (e1, e2, priv_imply e1 e2))
let etrue = Etrue
let efalse = Efalse
let eequiv (e1, e2) = he_merge (Eequiv (e1, e2, priv_equiv e1 e2))
let eall (v, e) = he_merge (Eall (v, e, priv_all v e))
let eex (v, e) = he_merge (Eex (v, e, priv_ex v e))
let etau (v, e) = he_merge (Etau (v, e, priv_tau v e))
let elam (v, e) = he_merge (Elam (v, e, priv_lam v e))

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

let rec xpreunify accu e1 e2 =
  match e1, e2 with
  | _, _ when e1 == e2 -> accu
  | Eapp (s1, a1, _), Eapp (s2, a2, _) when s1 =%= s2 ->
      List.fold_left2 xpreunify accu a1 a2
  | Emeta (m1, _), _ -> (m1, e2) :: accu
  | _, Emeta (m2, _) -> (m2, e1) :: accu
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

let occurs_as_meta e f = List.exists ((==) e) (get_metas f);;
let size = get_size;;
let has_metas e = get_metas e <> [];;
let count_metas e = List.length (get_metas e);;

let cursym = ref var_prefix;;

let rec incr_sym n =
  if n >= String.length !cursym
  then cursym := !cursym ^ "a"
  else match !cursym.[n] with
  | 'z' -> !cursym.[n] <- 'a'; incr_sym (n+1)
  | c -> !cursym.[n] <- Char.chr (1 + Char.code c)
;;

let newname () =
  incr_sym (String.length var_prefix);
  String.copy !cursym
;;

let newvar () = evar (newname ());;

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

let rec priv_app s args =
  let comb_skel accu e = combine (get_skel e) accu in
  let skel = combine k_app (List.fold_left comb_skel (get_hash s) args) in
  let fv = List.fold_left (fun a e -> str_union a (get_fv e)) [] args in
  let sz = List.fold_left (fun a e -> a + get_size e) 1 args in
  let taus = List.fold_left (fun a e -> max (get_taus e) a) 0 args in
  let metas = List.fold_left (fun a e -> union (get_metas e) a) [] args in
  let typ = type_app (get_type s) args in
  mkpriv skel fv sz taus metas typ

and eapp (s, args) = he_merge (Eapp (s, args, priv_app s args))

and inst_app map s args = match s, args with
  | Eall(v, e, _), a :: r ->
          assert (get_type v == type_type);
          if get_type a == type_type then
            inst_app ((v, a) :: map) e r
          else
            raise (Type_Mismatch(type_type, get_type a))
  | _ -> substitute map s, args

and type_app s args =
    match inst_app [] s args with
    | Eapp(Evar("<-", _), ret :: l, _), args' ->
            let l' = List.map get_type args' in
            begin try
                let t, t' = find2 (fun t t' -> not (t == t')) l l' in
                raise (Type_Mismatch (t, t'))
            with
            | Invalid_argument "find2" ->
                raise (Bad_Arity (s, args))
            | Not_found ->
                ret
            end
    | t, [] -> t
    | _ -> assert false

and substitute map e =
  let aux f map v body =
      let t = substitute map (get_type v) in
      let map1 = rm_binding v map in
      let nv =
          if conflict v map1 then
            tvar (newname ()) t
          else
            tvar (get_name v) t
      in
      if v <> nv then
        f (nv, substitute ((v, nv) :: map1) body)
      else
        f (v, substitute map1 body)
  in
  match e with
  | _ when disj (get_fv e) map -> e
  | Evar (v, _) -> (try List.assq e map with Not_found -> e)
  | Emeta _ -> e
  | Eapp (s, args, _) -> eapp (s, List.map (substitute map) args)
  | Enot (f, _) -> enot (substitute map f)
  | Eand (f, g, _) -> eand (substitute map f, substitute map g)
  | Eor (f, g, _) -> eor (substitute map f, substitute map g)
  | Eimply (f, g, _) -> eimply (substitute map f, substitute map g)
  | Eequiv (f, g, _) -> eequiv (substitute map f, substitute map g)
  | Etrue | Efalse -> e
  | Eall (v, f, _) -> aux eall map v f
  | Eex (v, f, _) -> aux eex map v f
  | Etau (v, f, _) -> aux etau map v f
  | Elam (v, f, _) -> aux elam map v f
;;

let rec substitute_2nd map e =
  match e with
  | Evar (v, _) -> (try List.assq e map with Not_found -> e)
  | Emeta _ -> e
  | Eapp (s, args, _) ->
     let acts = List.map (substitute_2nd map) args in
     begin try
      let lam = List.assq (evar (get_name s)) map in
      match lam, acts with
      | Elam (v, _, body, _), [a] -> substitute [(v,a)] body
      | Evar (v, _), _ -> eapp (lam, acts)
      | Eapp (s1, args1, _), _ -> eapp (s1, args1 @ acts)
      | _ -> raise Higher_order
     with Not_found -> eapp (s, acts)
     end
  | Enot (f, _) -> enot (substitute_2nd map f)
  | Eand (f, g, _) -> eand (substitute_2nd map f, substitute_2nd map g)
  | Eor (f, g, _) -> eor (substitute_2nd map f, substitute_2nd map g)
  | Eimply (f, g, _) -> eimply (substitute_2nd map f, substitute_2nd map g)
  | Eequiv (f, g, _) -> eequiv (substitute_2nd map f, substitute_2nd map g)
  | Etrue | Efalse -> e
  | Eall (v, t, f, _) ->
      let map1 = rm_binding v map in
      if conflict v map1 then
        let nv = newvar () in
        eall (nv, t, substitute_2nd ((v, nv) :: map1) f)
      else
        eall (v, t, substitute_2nd map1 f)
  | Eex (v, t, f, _) ->
      let map1 = rm_binding v map in
      if conflict v map1 then
        let nv = newvar () in
        eex (nv, t, substitute_2nd ((v, nv) :: map1) f)
      else
        eex (v, t, substitute_2nd map1 f)
  | Etau (v, t, f, _) ->
      let map1 = rm_binding v map in
      if conflict v map1 then
        let nv = newvar () in
        etau (nv, t, substitute_2nd ((v, nv) :: map1) f)
      else
        etau (v, t, substitute_2nd map1 f)
  | Elam (v, t, f, _) ->
      let map1 = rm_binding v map in
      if conflict v map1 then
        let nv = newvar () in
        elam (nv, t, substitute_2nd ((v, nv) :: map1) f)
      else
        elam (v, t, substitute_2nd map1 f)
;;

let apply f a =
  match f with
  | Elam (v, _, body, _) -> substitute [(v, a)] body
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
  | Eapp (f, args, _) -> e
  | Enot (e1, _) -> enot (remove_scope e1)
  | Eand (e1, e2, _) -> eand (remove_scope e1, remove_scope e2)
  | Eor (e1, e2, _) -> eor (remove_scope e1, remove_scope e2)
  | Eimply (e1, e2, _) -> eimply (remove_scope e1, remove_scope e2)
  | Eequiv (e1, e2, _) -> eequiv (remove_scope e1, remove_scope e2)
  | Eall (v, t, e1, _) -> eall (v, t, remove_scope e1)
  | Eex (v, t, e1, _) -> eex (v, t, remove_scope e1)
  | Evar _ | Emeta _ | Etrue | Efalse | Etau _ | Elam _
  -> e
;;

type goalness = int;;

