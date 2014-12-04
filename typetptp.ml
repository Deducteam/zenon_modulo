(*  Copyright 2014 INRIA  *)

open Expr

exception Type_error of string
exception Type_found of expr

module M = Map.Make(String)

(* Misc functions *)
let map_fold f s l =
    let e, env = List.fold_left (fun (acc, env) e -> let x, env' = f env e in (x :: acc, env')) ([], s) l in
    List.rev e, env

let rec const_list n x = if n > 0 then x :: (const_list (n - 1) x) else []

let opt_out = function Some x -> x | None -> assert false

(* Copied from expr.ml for substituting *)
let conflict v map =
  match v with
  | Evar (vv, _) ->
      List.exists (fun (w, e) -> List.mem vv (get_fv e)) map
  | _ -> assert false
;;

let rec rm_binding v map =
  match map with
  | [] -> []
  | (w, _) :: t when w == v -> t
  | h :: t -> h :: (rm_binding v t)
;;

(* Typing specifications for tff *)
let type_tff_i = tvar "$i" type_type

(* Environment for typing *)
type env = {
    tff : Expr.t list M.t;
    map : (Expr.t * Expr.t) list;
    (* We also do substituting during typechecking to save a *lot* of time *)
}

let empty_env = {
    tff = M.empty;
    map = [];
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
        | [t'] -> begin match Expr.compare t t' with
            | 0 -> env
            | _ -> raise (Type_error (Printf.sprintf "Contradictory types for '%s'" name))
            end
        | _ -> raise (Type_error (Printf.sprintf "trying to redefine built_in '%s'" name))
    else
        { env with tff = M.add name [t] env.tff }

let tff_app_aux args t =
    try
        ignore (type_app t args);
        raise (Type_found t)
    with Type_Mismatch (t', t'', _) ->
        Log.debug 9 "mismatch : %a <> %a" Print.pp_expr t' Print.pp_expr t''

let tff_app f args env =
    try
        Log.debug 5 "finding type for '%s'" f;
        List.iter (fun e -> Log.debug 8 "  argument : (%a: %a)" Print.pp_expr e
            Print.pp_expr (get_type e)) args;
        begin match M.find f env.tff with
        | [] -> assert false
        | [t] when args = [] ->
                Log.debug 5 "found single type (%s: %a)" f Print.pp_expr t;
                t
        | _ when args = [] ->
                raise (Type_error (Printf.sprintf "Overloaded function '%s' without arguments" f))
        | l ->
                Log.debug 5 "overloaded type found";
                try
                    List.iter (tff_app_aux args) l;
                    raise (Type_error
                        (Printf.sprintf "No signature match found for '%s' with arguments : %s"
                        f (String.concat "*" (List.map Print.sexpr
                            (List.map get_type args)))
                    ))
                with Type_found t ->
                    Log.debug 5 "found type (%s: %a)" f Print.pp_expr t;
                    t
        end
    with Not_found ->
        raise (Type_error (Printf.sprintf "Unknown variable : %s" f))

let default_env =
    (*
    let unary t t' = mk_arrow [t] t' in
    let binary t t' t'' = mk_arrow [t; t'] t'' in
    let pred t = unary t type_bool in
    let pred2 t = binary t t type_bool in

    let int_id = unary type_int type_int in
    let rat_id = unary type_rat type_rat in
    let real_id = unary type_real type_real in
    let int_id_2 = binary type_int type_int type_int in
    let rat_id_2 = binary type_rat type_rat type_rat in
    let real_id_2 = binary type_real type_real type_real in
    let int_pred = pred type_int in
    let rat_pred = pred type_rat in
    let real_pred = pred type_real in
    let int_pred_2 = pred2 type_int in
    let rat_pred_2 = pred2 type_rat in
    let real_pred_2 = pred2 type_real in

    let tff_builtin = [
        "$less",        [int_pred_2; rat_pred_2; real_pred_2];
        "$lesseq",      [int_pred_2; rat_pred_2; real_pred_2];
        "$greater",     [int_pred_2; rat_pred_2; real_pred_2];
        "$greatereq",   [int_pred_2; rat_pred_2; real_pred_2];
        "$uminus",      [int_id; rat_id; real_id];
        "$sum",         [int_id_2; rat_id_2; real_id_2];
        "$difference",  [int_id_2; rat_id_2; real_id_2];
        "$product",     [int_id_2; rat_id_2; real_id_2];
        "$quotient",     [rat_id_2; real_id_2];
        "$quotient_e",   [int_id_2; rat_id_2; real_id_2];
        "$quotient_t",   [int_id_2; rat_id_2; real_id_2];
        "$quotient_f",   [int_id_2; rat_id_2; real_id_2];
        "$remainder_e",  [int_id_2; rat_id_2; real_id_2];
        "$remainder_t",  [int_id_2; rat_id_2; real_id_2];
        "$remainder_f",  [int_id_2; rat_id_2; real_id_2];
        "$floor",       [int_id; rat_id; real_id];
        "$ceiling",     [int_id; rat_id; real_id];
        "$truncate",    [int_id; rat_id; real_id];
        "$round",       [int_id; rat_id; real_id];
        "$is_int",      [int_pred; rat_pred; real_pred];
        "$is_rat",      [int_pred; rat_pred; real_pred];
        "$to_int",      [unary type_int type_int; unary type_rat type_int; unary type_real type_int];
        "$to_rat",      [unary type_int type_rat; unary type_rat type_rat; unary type_real type_rat];
        "$to_real",     [unary type_int type_real; unary type_rat type_real; unary type_real type_real];
    ] in
    *)
    let tff_builtin = [] in
    let tff_base = List.fold_left (fun acc (s, t) -> M.add s t acc) M.empty tff_builtin in
    { empty_env with tff = tff_base }

let var_name s =
    if !Globals.namespace_flag then
        "v_" ^ s
    else
        s

(* Typing *)
let type_tff_var t env = function
    | Evar(v, _) as e ->
            begin try
                (List.assq e env.map, env)
            with Not_found ->
                begin match get_type e with
                | t when type_none == t ->
                        if tff_mem v env then
                            let t = tff_app v [] env in
                            (tvar v t, env)
                        else begin
                            Log.debug 5 "Inferring type of var '%a' : '%a'" Print.pp_expr e Print.pp_expr t;
                            (tvar v t, tff_add_type v t env)
                        end
                | t -> e, env
                end
            end
    | _ -> assert false

let rec type_tff_app env is_pred e = match e with
    (* Type typechecking *)
    | Eapp(Evar("$i", _), [], _) -> eapp (tvar "$i" type_type, []), env
    | Eapp(Evar("$int", _), [], _) -> eapp (tvar "Int" type_type, []), env
    | Eapp(Evar("$rat", _), [], _) -> eapp (tvar "Rat" type_type, []), env
    | Eapp(Evar("$real", _), [], _) -> eapp (tvar "Real" type_type, []), env
    | Eapp(Evar("=", _), [a; b], _) ->
            let a', env' = type_tff_term env a in
            let b', env'' = type_tff_term env' b in
            eeq a' b', env''
    | Eapp(Evar(s, _) as s', args, _) ->
            let args, env' = map_fold type_tff_term env args in
            let f, env'' = match get_type s' with
                | t when type_none == t && tff_mem s env ->
                        let t = tff_app s args env in
                        tvar s t, env'
                | _ ->
                        let ret = if is_pred then type_prop else type_tff_i in
                        let t = earrow (const_list (List.length args) type_tff_i) ret in
                        type_tff_var t env' s'
            in
            begin try
                eapp (f, args), env''
            with
            | Type_Mismatch _ ->
                    raise (Type_error (Printf.sprintf "Inferred type for %s '%s' not valid."
                        (if is_pred then "predicate" else "function") s))
            end
    | Eapp(_) -> raise (Type_error (Printf.sprintf "Expected a symbol as function, not an expression."))
    | _ -> assert false

and type_tff_prop env e = match e with
    (* Proposition typechecking *)
    | Evar(v, _) -> type_tff_var type_prop env e
    | Emeta(_) -> assert false
    | Eapp(_) -> type_tff_app env true e
    | Enot(f, _) ->
            let f', env' = type_tff_prop env f in
            enot f', env'
    | Eand(f, g, _) ->
            let f', env' = type_tff_prop env f in
            let g', env'' = type_tff_prop env' g in
            eand (f', g'), env''
    | Eor(f, g, _) ->
            let f', env' = type_tff_prop env f in
            let g', env'' = type_tff_prop env' g in
            eor (f', g'), env''
    | Eimply(f, g, _) ->
            let f', env' = type_tff_prop env f in
            let g', env'' = type_tff_prop env' g in
            eimply (f', g'), env''
    | Eequiv(f, g, _) ->
            let f', env' = type_tff_prop env f in
            let g', env'' = type_tff_prop env' g in
            eequiv (f', g'), env''
    | Etrue
    | Efalse ->
            e, env
    | Eall(_) -> type_tff_quant type_tff_prop eall env e
    | Eex(_) -> type_tff_quant type_tff_prop eex env e
    | Etau(Evar(s, _), body, _) -> assert false
    | _ -> raise (Type_error ("Ill-formed expression"))

and type_tff_quant k mk_quant env = function
    | Eex(Evar(s, _) as v, body, _)
    | Eall(Evar(s, _) as v, body, _)
    | Elam(Evar(s, _) as v, body, _) ->
            let t = substitute env.map (get_type v) in
            let v' = tvar (var_name s) t in
            let map' = rm_binding v env.map in
            let nv =
                if conflict v' map' then
                    tvar (newname ()) t
                else
                    v'
            in
            let map'' = (evar s, nv) :: map' in
            Log.debug 2 "Introducting '%a' of type '%a' as '%a'" Print.pp_expr v Print.pp_expr t Print.pp_expr nv;
            let body, env' = k { env with map = map'' } body in
            mk_quant (v', body), env'
    | _ -> raise (Type_error ("Ill-formed expression"))

and type_tff_term env e = match e with
    | Evar(v, _) -> type_tff_var type_tff_i env e
    | Eapp(_) -> type_tff_app env false e
    | Elam(_) -> type_tff_quant type_tff_term elam env e
    | _ -> raise (Type_error ("Ill-formed expression"))

and type_tff_type env e = match e with
    | Evar(v, _) -> type_tff_var (lazy (assert false)) env e
    | Eapp(_) -> type_tff_app env false e
    | Eall(_) -> type_tff_quant type_tff_type eall env e
    | Earrow(args, ret, _) ->
            earrow (List.map (fun e -> fst (type_tff_term env e)) args) (fst (type_tff_term env ret)), env
    | _ -> raise (Type_error ("Ill-formed expression"))

let type_tff_expr env e =
    let e', env' = type_tff_prop env e in
    let t = get_type e' in
    if type_prop == t then
      e', env'
    else
      raise (Type_error (Printf.sprintf "Expected a boolean expression at root."))

let type_tff_def env e = match e with
    | Eapp (Evar("#", _), [Evar(v, _); t], _) ->
            let t', _ = type_tff_type env t in
            Log.debug 3 "Adding type (%s : %a) to env" v Print.pp_expr t';
            tff_add_type v t' env
    | _ -> raise (Type_error (Printf.sprintf "Ill-formed expression."))

(* Check the quantifiers so that no type except Namespace.univ_name is present ? *)
let type_fof_expr e = ()

(* Wrappers *)
let relevant = function
    | Phrase.Hyp(_, _, 13) -> false
    | _ -> true

let is_tff_def s = (s  = 13)
let is_tff_axiom s = (s  = 12)
let is_tff_expr s = (10 <= s && s <= 12)
let notype_kind = function
    | s when is_tff_expr s -> s - 10
    | s -> s

let type_phrase env p = match p with
    | Phrase.Hyp (name, e, kind) when is_tff_def kind ->
            Log.debug 1 "typechecking TFF definition '%s'" name;
            p, type_tff_def env e
    | Phrase.Hyp (name, e, kind) when is_tff_axiom kind ->
            Log.debug 1 "typechecking TFF axiom '%s'" name;
            let e', env' = type_tff_expr env e in
            Phrase.Hyp (name, e', notype_kind kind), env'
    | Phrase.Hyp (name, e, kind) when is_tff_expr kind ->
            Log.debug 1 "typechecking TFF expression '%s'" name;
            let e', env' = type_tff_expr env e in
            Phrase.Hyp (name, e', notype_kind kind), env'
    | Phrase.Hyp (name, e, kind) ->
            Log.debug 1 "typechecking FOF formula '%s'" name;
            type_fof_expr e;
            p, env
    | _ ->
            Log.debug 1 "typechecking unknown formula";
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
    List.iter (fun (s, t) -> Log.debug 5 "  %s : %a" s Print.pp_expr t) !defined;
    Expr.add_defs !defined;
    List.filter relevant p

