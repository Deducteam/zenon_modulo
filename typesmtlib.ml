(*  Copyright 2014 INRIA  *)

open Type
open Expr
open Arith

exception Type_error of string
exception Type_found of etype

module M = Map.Make(String)

(* Misc function *)
let map_fold f s l =
    let e, env = List.fold_left (fun (acc, env) e -> let x, env' = f env e in (x :: acc, env')) ([], s) l in
    List.rev e, env

let rec const_list n x = if n > 0 then x :: (const_list (n - 1) x) else []

let opt_out = function Some x -> x | None -> assert false

let is_bool e =
    match get_type e with
    | Some t -> Type.equal type_bool t
    | None -> false

(* Environment for typing *)
type env = {
    tff : Type.t list M.t;
}

let empty_env = {
    tff = M.empty;
}

let tff_mem v env = M.mem v env.tff

let tff_find v env =
    try
        begin match M.find v env.tff with
        | [] -> assert false
        | [t] -> t
        | _ -> raise (Type_error (Printf.sprintf "Single-type variable expected ('%s')" v))
        end
    with Not_found ->
        raise (Type_error (Printf.sprintf "Unknown variable : %s" v))

let tff_add_type name t env =
    if tff_mem name env then
        match M.find name env.tff with
        | [] -> assert false
        | [t'] -> begin match Type.compare t t' with
            | 0 -> env
            | _ -> raise (Type_error (Printf.sprintf "Contradictory types for '%s'" name))
            end
        | _ -> raise (Type_error (Printf.sprintf "trying to redefine built_in '%s'" name))
    else
        { (* env with *) tff = M.add name [t] env.tff }

let tff_app_aux s args t =
    try
        begin
        let targs = List.map (function Some t -> Some (tff t) | None -> None) (extract_args (Some t) args) in
        Log.debug 8 "extracted types for type '%s' :" (Type.to_string t);
        (List.iter2 (fun e t -> Log.debug 8 " - %a: %s" Print.pp_expr e (Type.to_string (opt_out t))) args targs);
        match (type_app_opt (s, Some t) targs) with
        | None -> ()
        | Some t' -> raise (Type_found t)
        end
    with
    | Not_enough_args
    | Function_expected
    | Mismatch _ ->
            ()

let tff_app f args env =
    try
        Log.debug 5 "finding type for '%s'" f;
        List.iter (fun e -> Log.debug 7 "argument : (%a: %s)" Print.pp_expr e
            (Type.to_string (opt_out (get_type e)))) args;
        begin match M.find f env.tff with
        | [] -> assert false
        | [t] when args = [] ->
                Log.debug 5 "found single type (%s: %s)" f (Type.to_string t);
                t
        | _ when args = [] ->
                raise (Type_error (Printf.sprintf "Overloaded function '%s' without arguments" f))
        | l ->
                Log.debug 5 "overloaded type found";
                try
                    List.iter (tff_app_aux f args) l;
                    raise (Type_error
                        (Printf.sprintf "No signature match found for '%s' with arguments : %s"
                        f (String.concat "*" (List.map Type.to_string
                            (List.map (fun e -> match get_type e with Some t -> t | None -> assert false) args)))
                    ))
                with Type_found t ->
                    Log.debug 5 "found type (%s: %s)" f (Type.to_string t);
                    t
        end
    with Not_found ->
        raise (Type_error (Printf.sprintf "Unknown variable : %s" f))

let poly_num f l =
    let rec aux acc l = function
        | [] -> acc
        | x :: r -> aux ((List.map (fun y -> x, y) l) @ acc) l r
    in
    let largs = aux [] l l in
    List.map (fun (x, y) -> mk_arrow [x; y] (f x y)) largs

let default_env =
    let unary t t' = mk_arrow [t] t' in
    let pred t = unary t type_bool in

    let int_id = unary type_int type_int in
    let rat_id = unary type_rat type_rat in
    let real_id = unary type_real type_real in
    let int_pred = pred type_int in
    let rat_pred = pred type_rat in
    let real_pred = pred type_real in

    let poly_op = poly_num mix_type [type_int; type_rat; type_real] in
    let poly_bop = poly_num (fun _ _ -> type_bool) [type_int; type_rat; type_real] in

    let tff_builtin = [
        "$less",        poly_bop;
        "$lesseq",      poly_bop;
        "$greater",     poly_bop;
        "$greatereq",   poly_bop;
        "$uminus",      [int_id; rat_id; real_id];
        "$sum",         poly_op;
        "$difference",  poly_op;
        "$product",     poly_op;
        "$is_int",      [int_pred; rat_pred; real_pred];
        "$to_int",      [unary type_int type_int; unary type_rat type_int; unary type_real type_int];
        "$to_real",     [unary type_int type_real; unary type_rat type_real; unary type_real type_real];
    ] in
    let tff_base = List.fold_left (fun acc (s, t) -> M.add s t acc) M.empty tff_builtin in
    { (* empty_env with *) tff = tff_base }

let var_name s =
    if s = to_string type_int || s = to_string type_rat then
        s ^ "'"
    else
        s

(* Typing *)
let type_tff_var env = function
    | Evar(v, _) as e -> begin match get_type e with
        | Some t -> e, env
        | None when tff_mem v env ->
                let t = tff_app v [] env in
                (tvar v t, env)
        | None ->
                Log.debug 5 "No type found for variable '%s'" v;
                raise (Type_error "Variable without type")
        end
    | _ -> assert false


let rec type_tff_app env e = match e with
    (* Term typechecking *)
    | Eapp(Evar("$int", _), [Evar (v, _)], _) ->
            mk_int v, env
    | Eapp(Evar("$rat", _), [Evar (v, _)], _) ->
            mk_rat v, env
    | Eapp(Evar("$real", _), [Evar (v, _)], _) ->
            mk_real v, env
    | Eapp(Evar("=", _), [a; b], _) ->
            let a', env' = type_tff_term env a in
            let b', env'' = type_tff_term env' b in
            if is_bool a' && is_bool b' then
                eequiv (a',b'), env''
            else begin try
                eapp (eeq, [a'; b']), env''
            with Type.Mismatch(t, t') ->
                Log.debug 1 "Bad match for equality with types : '%s' - '%s'" (Type.to_string t) (Type.to_string t');
                raise (Type_error "Bad equality")
            end
    | Eapp(Evar(s, _) as s', args, _) ->
            let args, env' = map_fold type_tff_term env args in
            let f, env'' = match get_type s' with
                | Some t -> s', env'
                | None when tff_mem s env ->
                        let t = tff_app s args env in
                        tvar s t, env'
                | None ->
                        Log.debug 1 "Encountered a function/constant with no type : '%s'" s;
                        raise (Type_error "Missing type")
            in
            begin try
                let e' = eapp (f, args) in
                e', env''
            with
            | Not_enough_args
            | Mismatch _
            | Function_expected ->
                    raise (Type_error "")
            end
    | Eapp(_) ->
            raise (Type_error (Printf.sprintf "Expected a symbol function, not an expression."))
    | _ -> assert false

and type_tff_term env e = match e with
    | Evar(v, _) -> type_tff_var env e
    | Emeta(_) -> assert false
    | Eapp(_) -> type_tff_app env e
    | Enot(f, _) ->
            let f', env' = type_tff_term env f in
            enot f', env'
    | Eand(f, g, _) ->
            let f', env' = type_tff_term env f in
            let g', env'' = type_tff_term env' g in
            eand (f', g'), env''
    | Eor(f, g, _) ->
            let f', env' = type_tff_term env f in
            let g', env'' = type_tff_term env' g in
            eor (f', g'), env''
    | Eimply(f, g, _) ->
            let f', env' = type_tff_term env f in
            let g', env'' = type_tff_term env' g in
            eimply (f', g'), env''
    | Eequiv(f, g, _) ->
            let f', env' = type_tff_term env f in
            let g', env'' = type_tff_term env' g in
            eequiv (f', g'), env''
    | Etrue
    | Efalse ->
            e, env
    | Eall(Evar(s, _) as v, t, body, _) ->
            let t = Type.tff t in
            let s = var_name s in
            let v' = tvar s t in
            Log.debug 2 "Introducting '%s' of type '%s'" s (Type.to_string t);
            let body = substitute [v, v'] body in
            let body, env = type_tff_term env body in
            eall (v', t, body), env
    | Eex(Evar(s, _) as v, t, body, _) ->
            let t = Type.tff t in
            let s = var_name s in
            let v' = tvar s t in
            Log.debug 2 "Introducting '%s' of type '%s'" s (Type.to_string t);
            let body = substitute [v, v'] body in
            let body, env = type_tff_term env body in
            eex (v', t, body), env
    | Etau(Evar(s, _), t, body, _) -> assert false
    | Elam(Evar(s, _) as v, t, body, _) ->
            let t = Type.tff t in
            let v' = tvar s t in
            let body' = substitute [v, v'] body in
            let body'', env' = type_tff_term env body' in
            elam (v', t, body''), env'
    | _ ->
            Log.debug 1 "This expression is not a term : %a" Print.pp_expr e;
            raise (Type_error ("Ill-formed expression (Term expected)"))

let type_tff_expr env e =
    let e', env' = type_tff_term env e in
    match get_type e' with
    | Some t ->
            if Type.equal type_bool t then
                e', env'
            else
                raise (Type_error (Printf.sprintf "Expected a boolean expression at root."))
    | None ->
            Log.debug 0 "Found a non-typed expression in tff context :\n%a" Print.pp_expr_type e';
            assert false

let type_tff_def env e = match e with
    | Eapp (Evar("#", _), [Evar(s, _) as v], _) ->
            let t = smtlib (opt_out @@ get_type v) in
            Log.debug 3 "Adding type (%s : %s) to env" s (Type.to_string t);
            tff_add_type s t env
    | _ -> raise (Type_error (Printf.sprintf "Ill-formed expression (Definition expected)"))

(* Check the quantifiers so that no type except Namespace.univ_name is present ? *)
let type_fof_expr e = ()

(* Wrappers *)
let relevant = function
    | Phrase.Hyp(_, _, (2|3)) -> false
    | _ -> true

let type_phrase env p = match p with
    | Phrase.Hyp (name, e, 2) ->
            Log.debug 1 "typechecking TFF definition '%s'" name;
            p, type_tff_def env e
    | Phrase.Hyp (name, e, 1) ->
            Log.debug 1 "typechecking TFF expression '%s'" name;
            Log.debug 10 "  %s" (Print.sexpr e);
            let e', env' = type_tff_expr env e in
            Phrase.Hyp (name, e', 1), env'
    | _ ->
            Log.debug 1 "Unknown formula, not doing anything...";
            p, env

let typecheck l =
    let defined = ref [] in
    let aux env =
        let f s l =
            if not (tff_mem s default_env) then begin
                assert (List.length l = 1);
                defined := (s, List.hd l) :: !defined
            end
        in
        M.iter f env.tff
    in
    Log.debug 1 "========== Typecheck ============";
    let p, env = map_fold type_phrase default_env l in
    aux env;
    Log.debug 3 "keeping in mind %i defined symbols" (List.length !defined);
    List.iter (fun (s, t) -> Log.debug 5 "  %s : %s" s (Type.to_string t)) !defined;
    Type.add_defs !defined;
    List.filter relevant p

