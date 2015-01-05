(* Copyright 2014 INRIA **)

open Expr
open Phrase
open Smtlib_syntax

exception Argument_mismatch
exception Incomplete_translation
exception Bad_arity of string

(* Misc functions *)
let opt = function
    | Some x -> x
    | None -> failwith "Expected a non-empty option"

let new_hyp_name =
    let i = ref 0 in
    let f () = incr i; "hyp" ^ (string_of_int !i) in
    f

let rec nlist k = function
    | i when i > 0 -> k :: (nlist k (i - 1))
    | _ -> []

(* Environment *)
module Emap = Map.Make(Expr)
module Smap = Map.Make(String)

type env = {
    defined_vars : expr Smap.t;
    defined_sorts : (string list * etype) Smap.t;
    defined_funs : (expr list * expr) Emap.t;
}

let default_env = {
    defined_vars = Smap.empty;
    defined_sorts = Smap.empty;
    defined_funs = Emap.empty;
}

let add_var env (s, e) =
    { env with defined_vars = Smap.add s e env.defined_vars }

let check_and_replace f (sym_args, e) args =
    try
        let subs = List.combine sym_args args in
        f subs e
    with Invalid_argument _ ->
        raise Argument_mismatch

(* Term translation *)
let sanitize s =
    let aux = function
        | '?' -> '_'
        | c -> c
    in
    String.map aux s

let translate_const = function
    | SpecConstsDec(_, s) -> Arith.mk_rat s
    | SpecConstNum(_, s) -> Arith.mk_int s
    | SpecConstString(_, s) -> eapp (estring, [evar s])
    | SpecConstsHex(_, s) -> Arith.mk_int ("0" ^ (String.sub s 1 (String.length s - 1)))
    | SpecConstsBinary(_, s) -> Arith.mk_int ("0" ^ (String.sub s 1 (String.length s - 1)))

let translate_symbol = function
    | Symbol(_, s) -> sanitize s
    | SymbolWithOr(_, s) -> sanitize s

let translate_id = function
    | IdSymbol(_, s) -> translate_symbol s
    | IdUnderscoreSymNum(_, s, n) -> raise Incomplete_translation

let rec translate_sort env = function
    | SortIdentifier(_, id) -> Type.atomic (translate_id id)
    | SortIdSortMulti(_, f, (_, l)) ->
            let f' = (translate_id f) in
            let l' = (List.map (translate_sort env) l) in
            try
                check_and_replace Type.substitute (Smap.find f' env.defined_sorts) l'
            with Not_found ->
                Type.mk_constr f' l'

let translate_sortedvar env = function
    | SortedVarSymSort(_, s, t) -> evar (translate_symbol s), (translate_sort env t)

let translate_sortedvar2 env = function
    | SortedVarSymSort(_, s, t) -> tvar (translate_symbol s) (translate_sort env t)

let translate_qualid = function
    | QualIdentifierId(_, id) -> translate_id id
    | QualIdentifierAs(_, id, s) -> raise Incomplete_translation

let left_assoc s f = function
    | x :: r -> List.fold_left f x r
    | _ -> raise (Bad_arity s)

let rec right_assoc s f = function
    | [] -> raise (Bad_arity s)
    | [x] -> x
    | x :: r -> f x (right_assoc s f r)

let chain s f l =
    let rec aux = function
        | [] | [_] -> raise (Bad_arity s)
        | [a; b] -> f a b
        | a :: b :: r -> eand ((f a b), (aux (b :: r)))
    in
    aux l

let rec translate_term env = function
    | TermSpecConst(_, const) -> translate_const const
    | TermLetTerm(_, (_, l), e) ->
            let l' = List.map (translate_varbinding env) l in
            let env' = List.fold_left add_var env l' in
            translate_term env' e
    | TermForAllTerm(_, (_, l), e) ->
            let e' = translate_term env e in
            List.fold_right (fun v e ->
                let v', t' = translate_sortedvar env v in
                eall (v', t', e)) l e'
    | TermExistsTerm(_, (_, l), e) ->
            let e' = translate_term env e in
            List.fold_right (fun v e ->
                let v', t' = translate_sortedvar env v in
                eex (v', t', e)) l e'
    | TermQualIdentifier(_, id) ->
            begin match translate_qualid id with
            | "true" -> etrue
            | "false" -> efalse
            | s when Smap.mem s env.defined_vars -> Smap.find s env.defined_vars
            | s -> evar s
            end
    | TermQualIdTerm(_, f, (_, l)) ->
            begin match (translate_qualid f), (List.map (translate_term env) l) with
            (* CORE theory translation - 'distinct','ite' not yet implemented *)
            | "not", [e] -> enot e
            | "not", _ -> raise (Bad_arity "not")
            | "and" as s, l -> left_assoc s (fun a b -> eand (a,b)) l
            | "or" as s, l -> left_assoc s (fun a b -> eor (a,b)) l
            | "xor" as s, l -> left_assoc s (fun a b -> exor (a,b)) l
            | "=>" as s, l -> right_assoc s (fun a b -> eimply (a,b)) l
            | "=" as s, l -> chain s (fun a b -> eapp (eeq, [a; b])) l
            (* INT/REAL theory translation - 'mod','div','abs','divisible' missing *)
            | "+" as s, l -> left_assoc s (fun a b -> eapp (evar "$sum", [a; b])) l
            | "-", [x] -> eapp (evar "$uminus", [x])
            | "-" as s, l -> left_assoc s (fun a b -> eapp (evar "$difference", [a; b])) l
            | "*" as s, l -> left_assoc s (fun a b -> eapp (evar "$product", [a; b])) l
            | "<" as s, l -> chain s (fun a b -> eapp (evar "$less", [a; b])) l
            | "<=" as s, l -> chain s (fun a b -> eapp (evar "$lesseq", [a; b])) l
            | ">" as s, l -> chain s (fun a b -> eapp (evar "$greater", [a; b])) l
            | ">=" as s, l -> chain s (fun a b -> eapp (evar "$greatereq", [a; b])) l
            (* Generic translation *)
            | s, args ->
                    let f' = evar s in
                    begin try
                        check_and_replace Expr.substitute (Emap.find f' env.defined_funs) args
                    with Not_found ->
                        eapp (f', args)
                    end
            end
    | _ -> raise Incomplete_translation

and translate_varbinding env = function
    | VarBindingSymTerm(_, s, e) -> translate_symbol s, translate_term env e

(* Command Translation *)
let translate_command env = function
    | CommandDeclareSort(_, s, n) ->
            let n = int_of_string n in
            let t = Type.mk_arrow  (nlist Type.type_type n) Type.type_type in
            env, [Hyp (new_hyp_name (), eapp (evar "#", [tvar (translate_symbol s) t]), 2)]
    | CommandDefineSort(_, s, (_, l), t) ->
            let s' = translate_symbol s in
            let l' = List.map translate_symbol l in
            let t' = translate_sort env t in
            { env with defined_sorts = Smap.add s' (l', t') env.defined_sorts}, []
    | CommandDeclareFun(_, s, (_, args), ret) ->
            let ret' = translate_sort env ret in
            let arg' = List.map (translate_sort env) args in
            let t = Type.mk_arrow arg' ret' in
            env, [Hyp (new_hyp_name (), eapp (evar "#", [tvar (translate_symbol s) t]), 2)]
    | CommandDefineFun(_, s, (_, args), ret, t) ->
            (* abbreviations with arguments l, ret type and expression t *)
            let ret' = translate_sort env ret in
            let args' = List.map (translate_sortedvar2 env) args in
            let args'' = List.map (fun x -> opt @@ get_type x) args' in
            let t' = translate_term env t in
            env, [Hyp (new_hyp_name (), eapp (evar "#",
                [tvar (translate_symbol s) (Type.mk_arrow args'' ret'); t'] @ args'), 3)]
    | CommandAssert(_, t) ->
            env, [Hyp (new_hyp_name (), translate_term env t, 1)]
    | _ -> env, []

let rec translate_command_list env acc = function
    | [] -> acc
    | c :: r ->
            try
                let env', l = translate_command env c in
                translate_command_list env' (l @ acc) r
            with Incomplete_translation ->
                Error.warn ("Incomplete translation of a command.");
                translate_command_list env acc r

let translate = function
    | Some Commands (_, (_, l)) -> List.rev (translate_command_list default_env [] l)
    | None -> []




