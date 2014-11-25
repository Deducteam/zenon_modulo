(*  Copyright 2014 INRIA  *)

(* Base types *)
type base =
    | Bool                       (* Booleans *)
    | App of string * base list  (* Constructors types *)
    | Arrow of base list * base  (* Functions from argument list to return type *)
    | Ttype                      (* The type of types (used for type constructors and such...) *)
type binders = string list
type t = binders * base         (* A polymorphic type, with the type variables, and then the type *)

(* Exceptions *)
exception Some_expected

exception Mismatch of t * t
exception Base_expected
exception Not_enough_args
exception Function_expected

(* Type constructors *)
let base t = [], t

let atomic s = base (App (s, []))

let mk_poly b = function
    | [], t -> b, t
    | _ -> raise Base_expected

let mk_constr constr args =
    let aux = function | [], t -> t | _ -> raise Base_expected in
    base (App (constr, List.map aux args))

let mk_arrow args ret =
    let aux = function | [], t -> t | _ -> raise Base_expected in
    if List.length args = 0 then
        base (aux ret)
    else
        base (Arrow (List.map aux args, aux ret))

(* Usual types *)
let type_bool = base Bool
let type_int = atomic "Int"
let type_rat = atomic "Rat"
let type_real = atomic "Real"
let type_tff_i = atomic "$i"
let type_scope = atomic "Scope"

let type_type = base Ttype

(* Type comparison *)
let _to_int = function
    | Bool -> 0
    | App _ -> 1
    | Arrow _ -> 2
    | Ttype -> 3

let rec _compare x y = match x, y with
    | Bool, Bool -> 0
    | App (s, l), App (s', l') -> begin match Pervasives.compare s s' with
        | 0 -> _compare_list l l'
        | x -> x
        end
    | Arrow (args, ret), Arrow (args', ret') -> begin match _compare ret ret' with
        | 0 -> _compare_list args args'
        | x -> x
        end
    | Ttype, Ttype -> 0
    | _ -> _to_int x - _to_int y

and _compare_list l l' = match l, l' with
    | [], [] -> 0
    | [], _ -> -1
    | _, [] ->  1
    | x :: r, y :: r' -> begin match _compare x y with
        | 0 -> _compare_list r r'
        | x -> x
        end

let _equal x y = _compare x y = 0
let _neq x y = _compare x y <> 0

let rec subs map = function
    | Bool -> Bool
    | App (s, l) -> begin match l with
        | [] -> (try List.assoc s map with Not_found -> App (s, l))
        | _ -> App(s, List.map (subs map) l)
        end
    | Arrow (args, ret) -> Arrow (List.map (subs map) args, subs map ret)
    | Ttype -> Ttype

let compare (b, t) (b', t') =
    let b'' = List.map (fun s -> App(s, [])) b' in
    match List.combine b b'' with
    | [] -> _compare t t'
    | l -> _compare (subs l t) t'

let equal t t' = compare t t' = 0
let neq t t' = compare t t' <> 0

let nbind (b, t) = List.length b

(* Useful comparisons *)
let _nums = [ type_int; type_rat; type_real ]
let is_type_num t = List.exists (equal t) _nums

(* Printing *)
let to_string_atomic = function
    | "Int" -> "Z"
    | "Rat" -> "Q"
    | "Real" -> "R"
    | s -> s

let rec to_string_base = function
    | Bool -> "Prop"
    | App (s, []) -> to_string_atomic s
    | App (s, l) -> "(" ^ s ^ " " ^ (String.concat " " (List.map to_string_base l)) ^ ")"
    | Arrow (args, ret) -> "(" ^ (String.concat " -> " (List.map to_string_base args)) ^ " -> " ^ (to_string_base ret) ^ ")"
    | Ttype -> "$tType"

let to_string_binders l =
    if l = [] then "" else
        let tvars = List.map (fun s -> s ^ " : $tType") l in
        let tvars = String.concat ", " tvars in
        "!>[" ^ tvars ^ "]: "

let to_string (b, t) = (to_string_binders b) ^ (to_string_base t)
let opt_string = function
    | None -> ""
    | Some t -> to_string t

(* Convenience functions *)
let to_base (b, t) = if b = [] then t else raise Base_expected

let substitute l (b, t) =
    if b <> [] then raise Base_expected else begin
        let map = List.map (fun (s, t) -> (s, to_base t)) l in
        base (subs map t)
    end

let extract = function
    | None -> raise Some_expected
    | Some a -> a

let ksplit k l =
    let rec aux k acc = function
        | [] -> if k <= 0 then List.rev acc, [] else raise (Invalid_argument "List not long enough")
        | a :: r when k > 0 -> aux (k-1) (a :: acc) r
        | l (* k <= 0 *) -> List.rev acc, l
    in
    aux k [] l

let rec find2 p l l' = match l, l' with
    | [], [] -> raise Not_found
    | x :: r, y :: r' -> if p x y then (x, y) else find2 p r r'
    | _ -> raise (Invalid_argument "Different lengths")


(* Pseudo type-checking *)
let bool_app l =
    try raise (Mismatch (type_bool, (List.find (neq type_bool) l)))
    with Not_found -> type_bool
let bool_app_opt l =
    try Some (bool_app (List.map extract l))
    with Some_expected -> None

let type_app_base t l = match t with
    | Arrow (args, ret) ->
            begin try
                let x, y = find2 _neq args l in
                raise (Mismatch (base x, base y))
            with
            | Not_found -> ret
            | Invalid_argument _ -> raise Not_enough_args
            end
    | _ when l = [] -> t
    | _ -> raise Function_expected

let type_eq = function
    | [a; b] when is_type_num a && is_type_num b -> type_bool
    | [a; b] -> if equal a b then type_bool else raise (Mismatch (a, b))
    | _ -> raise Not_enough_args

let type_app (b, t) args =
    try
        let k = List.length b in
        let args = List.map to_base args in
        let typs, args = ksplit k args in
        let t = subs (List.combine b typs) t in
        base (type_app_base t args)
    with Invalid_argument _ ->
        raise Not_enough_args

let type_app_opt (s, t) args =
    try
        if s = "=" && t = None then
            Some (type_eq (List.map extract args))
        else
            Some (type_app (extract t) (List.map extract args))
    with Some_expected -> None

(* Functions for TPTP.TFF typechecking *)
let rec is_atomic = function
    | Bool | Ttype -> true
    | App (s, l) -> List.for_all is_atomic l
    | Arrow _ -> false

let is_tff_arg t = t <> Bool && is_atomic t

let rec _tff_check = function
    | Arrow (l, ret) -> is_atomic ret && List.for_all is_tff_arg l
    | _ -> true

let tff_check (b, t) = _tff_check t

let rec _tff = function
    | Bool -> Bool
    | App ("$o", []) -> Bool
    | App ("$int", []) -> App ("Int", [])
    | App ("$rat", []) -> App ("Rat", [])
    | App ("$real", []) -> App ("Real", [])
    | App ("$tType", []) -> Ttype
    | App (s, l) -> App (s, List.map _tff l)
    | Arrow (l, ret) -> Arrow (List.map _tff l, _tff ret)
    | Ttype -> Ttype

let tff (b, t) = (b, _tff t)

(* Functions for SMTLIB typechecking *)
let rec _smtlib = function
    | Bool -> Bool
    | App ("Bool", []) -> Bool
    | App ("Int", []) -> App ("Int", [])
    | App ("Real", []) -> App ("Real", [])
    | App ("Type", []) -> Ttype
    | App (s, l) -> App (s, List.map _tff l)
    | Arrow (l, ret) -> Arrow (List.map _tff l, _tff ret)
    | Ttype -> Ttype

let smtlib (b, t) = (b, _smtlib t)

(* Help for defined types in coq proofs *)
let defs = ref ([] : (string * t) list)

let add_defs l =
    defs := l @ !defs

let get_defs () = !defs

