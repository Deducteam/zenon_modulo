(*  Copyright 2014 INRIA  *)

open Type
open Expr

exception Type_error of string
exception Type_found of etype

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


(* Environment for typing *)
type env = {
    tff : Type.t list M.t;
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
    if not (Type.tff_check t) then
        raise (Type_error (Printf.sprintf "The following type is ill-formed in TFF :@\n%s" (Type.to_string t)));
    if tff_mem name env then
        match M.find name env.tff with
        | [] -> assert false
        | [t'] -> begin match Type.compare t t' with
            | 0 -> env
            | _ -> raise (Type_error (Printf.sprintf "Contradictory types for '%s'" name))
            end
        | _ -> raise (Type_error (Printf.sprintf "trying to redefine built_in '%s'" name))
    else
        { env with tff = M.add name [t] env.tff }

let tff_app_aux s args t =
    try
        begin
        let targs = List.map tff (extract_args (Some t) args) in
        Log.debug 8 "extracted types for type '%s' :" (Type.to_string t);
        (List.iter2 (fun e t -> Log.debug 8 " - %a: %s" Print.pp_expr e (Type.to_string t)) args targs);
        match (type_app_opt (s, Some t) targs) with
        | t' -> raise (Type_found t)
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
            (Type.to_string (get_type e))) args;
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
                            (List.map get_type args)))
                    ))
                with Type_found t ->
                    Log.debug 5 "found type (%s: %s)" f (Type.to_string t);
                    t
        end
    with Not_found ->
        raise (Type_error (Printf.sprintf "Unknown variable : %s" f))

let default_env =
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
              e, env
                (* begin match get_type e with *)
                (* | Some t -> e, env *)
                (* | None when tff_mem v env -> *)
                (*         let t = tff_app v [] env in *)
                (*         (tvar v t, env) *)
                (* | None -> *)
                (*         Log.debug 5 "Inferring type of var '%s' : '%s'" v (Type.to_string t); *)
                (*         (tvar v t, tff_add_type v t env) *)
                (* end *)
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
            eapp (eeq, [a'; b']), env''
    | Eapp(Evar(s, _) as s', args, _) ->
            let args, env' = map_fold type_tff_term env args in
            let f, env'' = (* match get_type s' with *)
                (* | None when tff_mem s env -> *)
                (*         let t = tff_app s args env in *)
                (*         tvar s t, env' *)
                (* | _ -> *)
                        let ret = if is_pred then type_bool else type_tff_i in
                        let t = mk_arrow (const_list (List.length args) type_tff_i) ret in
                        type_tff_var t env' s'
            in
            begin try
                eapp (f, args), env''
            with
            | Not_enough_args
            | Mismatch _
            | Function_expected ->
                    raise (Type_error (Printf.sprintf "Inferred type for %s '%s' not valid."
                        (if is_pred then "predicate" else "function") s))
            end
    | Eapp(_) -> raise (Type_error (Printf.sprintf "Expected a symbol as function, not an expression."))
    | _ -> assert false

and type_tff_prop env e = match e with
    (* Proposition typechecking *)
    | Evar(v, _) -> type_tff_var type_bool env e
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
    | Eall(_) -> type_tff_quant eall env e
    | Eex(_) -> type_tff_quant eex env e
    | Etau(Evar(s, _), body, _) -> assert false
    | _ -> raise (Type_error ("Ill-formed expression"))

and type_tff_quant mk_quant env = function
    | Eex(Evar(s, _) as v, body, _)
    | Eall(Evar(s, _) as v, body, _)
    | Elam(Evar(s, _) as v, body, _) ->
            let t = substitute_type env.map (Type.tff (get_type v)) in
            let v' = tvar (var_name s) t in
            let map' = rm_binding v env.map in
            let nv =
                if conflict v' map' then
                    tvar (newname ()) t
                else
                    v'
            in
            let map'' = (v, nv) :: map' in
            Log.debug 2 "Introducting '%s' of type '%s' as '%a'" s (Type.to_string t) Print.pp_expr nv;
            let body, env' = type_tff_prop { env with map = map'' } body in
            mk_quant (v', body), env'
    | _ -> raise (Type_error ("Ill-formed expression"))

and type_tff_term env e = match e with
    | Evar(v, _) -> type_tff_var type_tff_i env e
    | Eapp(_) -> type_tff_app env false e
    | Elam(_) -> type_tff_quant elam env e
    | _ -> raise (Type_error ("Ill-formed expression"))

let type_tff_expr env e =
    let e', env' = type_tff_prop env e in
    let t = get_type e' in
    if Type.equal type_bool t then
      e', env'
    else
      raise (Type_error (Printf.sprintf "Expected a boolean expression at root."))
    (* | None -> *)
    (*         Log.debug 0 "Found a non-typed expression in tff context :\n%a" Print.pp_expr_type e'; *)
    (*         assert false *)

let type_tff_def env e = match e with
    | Eapp (Evar("#", _), [Evar(v, _); e'], _) ->
            let t = tff (type_of_expr e') in
            Log.debug 3 "Adding type (%s : %s) to env" v (Type.to_string t);
            tff_add_type v t env
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
    List.iter (fun (s, t) -> Log.debug 5 "  %s : %s" s (Type.to_string t)) !defined;
    Type.add_defs !defined;
    List.filter relevant p

