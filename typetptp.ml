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
let type_tff_i = type_iota

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
  let unary t t' = earrow [t] t' in
  let binary t t' t'' = earrow [t; t'] t'' in
  let pred t = unary t type_prop in
  let pred2 t = binary t t type_prop in

  let int_id = unary Arith.type_int Arith.type_int in
  let rat_id = unary Arith.type_rat Arith.type_rat in
  let real_id = unary Arith.type_real Arith.type_real in
  let int_id_2 = binary Arith.type_int Arith.type_int Arith.type_int in
  let rat_id_2 = binary Arith.type_rat Arith.type_rat Arith.type_rat in
  let real_id_2 = binary Arith.type_real Arith.type_real Arith.type_real in
  let int_pred = pred Arith.type_int in
  let rat_pred = pred Arith.type_rat in
  let real_pred = pred Arith.type_real in
  let int_pred_2 = pred2 Arith.type_int in
  let rat_pred_2 = pred2 Arith.type_rat in
  let real_pred_2 = pred2 Arith.type_real in

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
    "$to_int",      [unary Arith.type_int Arith.type_int; unary Arith.type_rat Arith.type_int; unary Arith.type_real Arith.type_int];
    "$to_rat",      [unary Arith.type_int Arith.type_rat; unary Arith.type_rat Arith.type_rat; unary Arith.type_real Arith.type_rat];
    "$to_real",     [unary Arith.type_int Arith.type_real; unary Arith.type_rat Arith.type_real; unary Arith.type_real Arith.type_real];
  ] in
  let tff_base = List.fold_left (fun acc (s, t) -> M.add s t acc) M.empty tff_builtin in
  { empty_env with tff = tff_base }

let var_name s =
  if !Globals.namespace_flag then
    "v_" ^ s
  else
    s

(* Typing *)
let type_tff_var ty env e =
  Log.debug 4 " |- type var %a >> ty %a" Print.pp_expr e Print.pp_expr ty;
  match e with
  | Evar(v, _) as e ->
    begin try
        (List.assq e env.map, env)
      with Not_found ->
        if tff_mem v env then
          let ty = tff_app v [] env in
          (tvar v ty, env)
        else begin
          Log.debug 5 "Adding var/cst '%a' of type '%a'" Print.pp_expr e Print.pp_expr ty;
          (tvar v ty, tff_add_type v ty env)
        end
    end
  | _ -> assert false

let rec type_tff_app env expected e =
  Log.debug 4 " |- type app %a" Print.pp_expr e;
  match e with
  (* Type typechecking *)
  | _ when e == type_type || e == type_prop || e == type_tff_i -> e, env
  | Eapp(Evar("$int", _), [], _) -> Arith.type_int, env
  | Eapp(Evar("$rat", _), [], _) -> Arith.type_rat, env
  | Eapp(Evar("$real", _), [], _) -> Arith.type_real, env
  (* Application typechecking *)
  | Eapp(Evar("=", _), [a; b], _) ->
    let a', env' = type_tff_term env a in
    let b', env'' = type_tff_term env' b in
    eeq a' b', env''
  | Eapp(Evar(s, _) as s', args, _) ->
    let args, env' = map_fold type_tff_term env args in
    let f, env'' =
      if not (get_type s' == type_none) then s', env
      else if tff_mem s env then begin
        let t = tff_app s args env in
        Log.debug 4 "found in env %s : %a" s Print.pp_expr t;
        tvar s t, env'
      end else begin
        let t =
          if expected == type_type then
            earrow [] type_type
          else
            earrow (const_list (List.length args) type_tff_i) expected
        in
        Log.debug 4 "inferring type for %s : %a" s Print.pp_expr t;
        type_tff_var t env' s'
      end
    in
    begin try
        eapp (f, args), env''
      with
      | Type_Mismatch (t, t', s) ->
        Log.debug 0 "Expected %a but received %a in %s" Print.pp_expr t Print.pp_expr t' s;
        raise (Type_error (Printf.sprintf "Inferred type for function '%s' not valid (expected return type : %s)."
                             s (Print.sexpr expected)))
    end
  | Eapp(_) -> raise (Type_error (Printf.sprintf "Expected a symbol as function, not an expression."))
  | _ -> assert false

and type_tff_prop env e =
  Log.debug 4 " |- type prop %a" Print.pp_expr e;
  match e with
  (* Proposition typechecking *)
  | Evar(v, _) -> type_tff_var type_prop env e
  | Emeta(_) -> assert false
  | Eapp(_) -> type_tff_app env type_prop e
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

and type_tff_quant k mk_quant env e =
  Log.debug 4 " |- type quant %a" Print.pp_expr e;
  match e with
  | Eex(Evar(s, _) as v, body, _)
  | Eall(Evar(s, _) as v, body, _)
  | Elam(Evar(s, _) as v, body, _) ->
    let t, env' = type_tff_type env (get_type v) in
    let v' = tvar (var_name s) t in
    let map' = rm_binding v env'.map in
    let nv =
      if conflict v' map' then
        tvar (newname ()) t
      else
        v'
    in
    let map'' = (tvar_none s, nv) :: map' in
    Log.debug 2 "Introducting '%a' of type '%a' as '%a'"
      Print.pp_expr v Print.pp_expr t Print.pp_expr nv;
    Log.debug 4 " |- Old Body %a" Print.pp_expr body;
    let body, env'' = k { env' with map = map'' } body in
    Log.debug 4 " |- New Body %a" Print.pp_expr body;
    mk_quant (v', body), { env'' with map = env.map }
  | _ -> raise (Type_error ("Ill-formed expression"))

and type_tff_term env e =
  Log.debug 4 " |- type term %a" Print.pp_expr e;
  match e with
  | Evar(v, _) -> type_tff_var type_tff_i env e
  | Eapp(_) -> type_tff_app env type_tff_i e
  | Elam(_) -> type_tff_quant type_tff_term elam env e
  | _ -> raise (Type_error ("Ill-formed expression"))

and type_tff_type env e = match e with
  | _ when Expr.equal e type_none -> type_tff_i, env
  | Evar(v, _) -> type_tff_var type_type env e
  | Eapp(_) -> type_tff_app env type_type e
  | Eall(_) -> type_tff_quant type_tff_type eall env e
  | Earrow(args, ret, _) ->
    earrow (List.map (fun e -> fst (type_tff_term env e)) args) (fst (type_tff_term env ret)), env
  | _ -> raise (Type_error ("Ill-formed expression"))

let type_tff_expr env e =
  Log.debug 4 " |- type tff expr e : %a" Print.pp_expr e;
  let e', env' = type_tff_prop env e in
  let t = get_type e' in
  Log.debug 4 " |- e' : %a" Print.pp_expr e';
  Log.debug 4 " |- t : %a" Print.pp_expr t;
  if type_prop == t then
    e', env'
  else
    raise (Type_error (Printf.sprintf "Expected a boolean expression at root."))

let type_tff_def env e = match e with
  | Eapp (Evar("#", _), [Evar(v, _); t], _) ->
    let t', env' = type_tff_type env t in
    Log.debug 3 "Adding type (%s : %a) to env" v Print.pp_expr t';
    tff_add_type v t' env'
  | _ -> raise (Type_error (Printf.sprintf "Ill-formed expression."))

(* Check the quantifiers so that no type except Namespace.univ_name is present ? *)
let type_fof_expr env e =
  let e', _ = type_tff_prop env e in
  e'

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

let symbols = ref []

let is_symbol s = List.mem s !symbols

let type_phrase env p = match p with
  | Phrase.Hyp (name, e, kind) when is_tff_def kind ->
    Log.debug 1 "typechecking TFF definition '%s'" name;
    p, type_tff_def env e
  | Phrase.Hyp (name, e, kind) when is_tff_axiom kind ->
    Log.debug 1 "typechecking TFF axiom '%s'" name;
    symbols := name :: !symbols;
    let e', env' = type_tff_expr env e in
    Phrase.Hyp (name, e', notype_kind kind), env'
  | Phrase.Hyp (name, e, kind) when is_tff_expr kind ->
    Log.debug 1 "typechecking TFF expression '%s'" name;
    Log.debug 15 "%a" Print.pp_expr e;
    let e', env' = type_tff_expr env e in
    Phrase.Hyp (name, e', notype_kind kind), env'
  | Phrase.Rew (name, e, kind) when is_tff_axiom kind ->
    Log.debug 1 "typechecking TFF axiom/rewrite '%s'" name;
    let e', env' = type_tff_expr env e in
    Phrase.Rew (name, e', notype_kind kind), env'
  | Phrase.Rew (name, e, kind) when is_tff_expr kind ->
    Log.debug 1 "typechecking TFF expression/rewrite '%s'" name;
    Log.debug 15 "%a" Print.pp_expr e;
    let e', env' = type_tff_expr env e in
    Phrase.Rew (name, e', notype_kind kind), env'
  | Phrase.Hyp (name, e, kind) ->
    Log.debug 1 "typechecking FOF formula '%s'" name;
    symbols := name :: !symbols;
    let e' = type_fof_expr env e in
    Phrase.Hyp(name, e', kind), env
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
