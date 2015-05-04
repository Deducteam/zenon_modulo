(* Copyright 2014 Inria *)

(* This module performs typing of expressions and phrases,
   It should only be used when the parsed language annotates all
   binders and declares all function symbols with their types.

   It does not, for now, infer types.

   It walks through expressions and types leaves (variables) with
   the last type found on a binder *)

open Expr;;

(* Exception raised when we meet a variable which is not present in the environment,
   i.e. which was not introduced by a binder. *)
exception Scoping_error of string;;
(* Exception raised when a function is applied to the bad number of arguments *)
exception Arity_mismatch of expr * expr list;;

(* Options to pass to the type checking and type inference functions *)
type opts =
  {
    default_type : expr;      (* A type to associate to free variables *)
    scope_warnings : bool;    (* Should we warn when we encounter free variables? *)
    undeclared_functions_warning : bool; (* Should we warn when we encounter undeclared function symbols? *)
    register_new_constants : bool; (* If we infer the type of an unknown function symbol, should we register it? *)
    fully_type : bool;             (* Should everything be typed? *)
  }
;;

(* A global hashtable of constant values.
   These constants are declared in extensions and parsers.
   (declare_constant is exported)
   This table is used for typing applications. *)
let const_env : (string, expr) Hashtbl.t = Hashtbl.create 97;;
let declare_constant (c, ty) =
  Log.debug 15 "Declaring %s : %s." c (Print.sexpr ty);
  Hashtbl.add const_env c ty;;

(* Print the declared constants, one by line *)
let print_constant_decls out =
  Hashtbl.iter (fun s ty -> Printf.fprintf out "$CONST %s : %s\n"
                                        s (Print.sexpr ty))
               const_env
;;

(* This function queries the hashtable for typing a constant *)
(* Raises Not_found if the constant is unknown. *)
let type_const opts = function
  | Evar (s, _) as c ->
     (try tvar s (Hashtbl.find const_env s)
      with Not_found ->
           if opts.undeclared_functions_warning then
             Error.warn ("Undeclared function symbol : " ^ s);
           c)
  | _ -> assert false            (* This function should only
                                   be called for typing the head
                                   of an application,
                                   which should be a variable.  *)
;;

(* If a variable of name v is in env, then return its type.
   Otherwise raise Not_found *)
let assoc v env =
  get_type
    (List.find
       (function
         | Evar (s, _) -> v = s
         | _ -> false)
       env)
;;

(* arity ty is the arity of *symbols* of type ty. *)
let rec xarity acc = function
  | Eall (_, ty, _) -> xarity (acc + 1) ty
  | Earrow (l, _, _) -> acc + List.length l
  | _ -> acc
;;
let arity = xarity 0;;

(* instantiate args ty substitutes prenex type variables in ty
   by type arguments at the beginning of the list of arguments args.
   Returns the type arguments, the remaining arguments, their expected types
   and the expected return type *)
(* Helper function that accumulates type arguments in reverse order. *)
let rec xinstantiate accu args ty =
  match (ty, args) with
  | (Eall (v, ty, _), hd :: tl) ->
     xinstantiate (hd :: accu) tl (substitute_safe [v, hd] ty)
  | (Earrow (l, ret, _), args) -> (accu, args, l, ret)
  | (ty, []) -> (accu, [], [], ty)
  | (_, _ :: _) -> assert false  (* Should not occur because we have checked arity *)

let instantiate args ty =
  if arity ty = List.length args then
    let (reversed_ty_args, args, tys, ret) = xinstantiate [] args ty in
    (List.rev reversed_ty_args, args, tys, ret)
  else
    raise (Arity_mismatch (ty, args))
;;

(* Main functions walking through expressions infering and checking types. *)
(* This type-checking is bidirectionnal. *)
let rec infer_expr opts env = function
  | Evar (s, _) as v ->
     (
       try (tvar s (assoc s env))
       with Not_found ->
         (* Variable is free, this might be an ill-parsed constant *)
         infer_expr opts env (eapp (v, []))
     )
  | Emeta (t, _) -> emeta (infer_expr opts env t)
  | Enot _ | Eand _ | Eor _ | Eimply _ | Eequiv _
  | Etrue | Efalse | Eall _ | Eex _
  | Eapp (Evar ("=", _), [_; _], _) as e -> check_expr opts env type_prop e
  | Eapp (Evar (f_sym, _) as f, args, _) ->
     (* First lookup in the constant table *)
     (* Remark: If it fails, it looks at it on the symbol. *)
     let tyf = get_type (type_const opts f) in
     if tyf == type_none
     then
       (* We have no way to find a return type,
          but we have to recursively call ourself
          for scoping purpose *)
       eapp (f, List.map (infer_expr opts env) args)
     else
       let (type_args, term_args, tys, ret_ty) = instantiate args tyf in
       eapp (tvar f_sym tyf, type_args @ List.map2 (check_expr opts env) tys term_args)
  | Etau (Evar _ as x, body, _) ->
     etau (x, check_expr opts (x :: env) type_prop body)
  | Elam (Evar _ as x, body, _) ->
     elam (x, infer_expr opts (x :: env) body)
  | _ -> assert false
and xcheck_expr opts env ty e =
  if ty == type_none
  then infer_expr opts env e
  else
    match e with
    | Evar (s, _) ->
       (* Call inference because it checks for scoping *)
       let e' = infer_expr opts env e in
       let ret_ty = get_type e' in
       if ret_ty == ty then
         e'
       else
         raise (Type_Mismatch (ret_ty, ty, "Typer.xcheck_expr"))
    | Emeta (Eall (Evar (s, _), b, _), _) ->
       emeta (check_expr opts env type_prop (eall (tvar s ty, b)))
    | Eapp (Evar ("=", _) as eq, [e1; e2], _) ->
       (* Equality is the only symbol for which
          implicit polymorphism is allowed. *)
       (* First try to infer the type of e1 *)
       let e1' = infer_expr opts env e1 in
       let t1 = get_type e1' in
       (* If this fails, try e2 *)
       if t1 == type_none then
         let e2' = infer_expr opts env e2 in
         let t2 = get_type e2' in
         (* if it also fails, finally look at the type annotation of the equality constant *)
         if t2 == type_none then
           match get_type eq with
           | Earrow ([t1; t2], prop, _) when t1 == t2 && prop = type_prop ->
              eeq (check_expr opts env t1 e1) (check_expr opts env t2 e2)
           | _ ->                    (* We hav no more clue to guess the type of this equality *)
              eeq e1' e2'
         else
           eeq (check_expr opts env t2 e1) e2'
       else
         eeq e1' (check_expr opts env t1 e2)
    | Eapp (Evar (f_sym, _) as f, args, _) ->
       (* First lookup in the constant table *)
       (* Remark: If it fails, it looks at it on the symbol. *)
       let tyf = get_type (type_const opts f) in
       if tyf == type_none
       then
         (Log.debug 15 "Check undeclared symbol %s" f_sym;
          let typed_args = List.map (infer_expr opts env) args in
          let args_types = List.map get_type typed_args in
          let infered_const_type = earrow args_types ty in
          if opts.register_new_constants then
            declare_constant (f_sym, infered_const_type);
          eapp (tvar f_sym infered_const_type, typed_args))
       else
         (Log.debug 15 "Check declared symbol %s : %a" f_sym Print.pp_expr tyf;
          let (type_args, term_args, tys, ret_ty) = instantiate args tyf in
          if ret_ty == ty
          then
            eapp (tvar f_sym tyf, type_args @ List.map2 (check_expr opts env) tys term_args)
          else
            raise (Type_Mismatch (ret_ty, ty, "Typer.xcheck_expr")))
    | Enot (e, _) ->
       assert (ty == type_prop);
       enot (check_expr opts env type_prop e)
    | Eand (a, b, _) ->
       assert (ty == type_prop);
       eand (check_expr opts env type_prop a, check_expr opts env type_prop b)
    | Eor (a, b, _) ->
       assert (ty == type_prop);
       eor (check_expr opts env type_prop a, check_expr opts env type_prop b)
    | Eimply (a, b, _) ->
       assert (ty == type_prop);
       eimply (check_expr opts env type_prop a, check_expr opts env type_prop b)
    | Eequiv (a, b, _) ->
       assert (ty == type_prop);
       eequiv (check_expr opts env type_prop a, check_expr opts env type_prop b)
    | Etrue -> assert (ty == type_prop); etrue
    | Efalse -> assert (ty == type_prop); efalse
    | Eall (Evar _ as x, body, _) ->
       assert (ty == type_prop);
       eall (x, check_expr opts (x :: env) type_prop body)
    | Eex (Evar _ as x, body, _) ->
       assert (ty == type_prop);
       eex (x, check_expr opts (x :: env) type_prop body)
    | Etau (Evar _ as x, body, _) ->
       let newx = check_expr opts env x ty in
       etau (newx, check_expr opts (newx :: env) type_prop body)
    | Elam (Evar _ as x, body, _) ->
       (
         let mk_arrow l ret =
           if l = [] then ret else earrow l ret
         in
         match ty with
         | Earrow (hd :: tl, ret, _) ->
            let newx = check_expr opts env hd x in
            elam (newx, check_expr opts (x :: env) (mk_arrow tl ret) body)
         | _ -> raise (Invalid_argument "Typer.check_expr: arrow expected")
       )
    | _ -> assert false
and check_expr opts env ty e =
  Log.debug 15 "Check %a : %a" Print.pp_expr e Print.pp_expr ty;
  let result = xcheck_expr opts env ty e in
  let rty = get_type result in
  if opts.fully_type && not (ty == rty) then
    raise (Type_Mismatch (ty, rty, "Typer.check_expr"));
  result
;;

(* Declare the defined identifier and return the typed version of the body
   and its typing environment. *)
(* TODO: currify when the body is a lambda. *)
let declare_def_constant opts = function
  | DefReal (_, s, ty, env, body, _)
  | DefPseudo ((_, _), s, ty, env, body)
  | DefRec (_, s, ty, env, body) ->
     if ty == type_none
     then
       let typed_body = infer_expr opts env body in
       declare_constant (s, earrow (List.map get_type env) (get_type typed_body));
       (env, typed_body)
     else
       (match ty with
        | Earrow (ty_params, ty_body, _) ->
           assert (ty_params = List.map get_type env);
           let typed_body = check_expr opts env ty_body body in
           declare_constant (s, ty);
           (env, typed_body)
        | ty ->
           assert (env = []);
           let typed_body = check_expr opts env ty body in
           declare_constant (s, ty);
           ([], typed_body))
;;

(* Type a definition and declare it. *)
let definition opts d =
  let (env, typed_body) = declare_def_constant opts d in
  match d with
  | DefReal (name, ident, ty, params, body, decarg) ->
     DefReal (name, ident, ty, params, typed_body, decarg)
  | DefPseudo ((e, n), s, ty, params, body) ->
     DefPseudo ((infer_expr opts env e, n), s, ty, params, typed_body)
  | DefRec (e, s, ty, params, body) ->
     DefRec (infer_expr opts env e, s, ty, params, typed_body)
;;

(* Declarations are encoded as "real definitions" by the parser
   (currently only parsedk). *)
(* This function is folded on the list of phrases,
   it removes declarations and return the typed phrases
   in reverse order *)
let phrase opts l (p, b) =
  Log.debug 15 "Check Phrase %a" Print.pp_phrase p;
  match p with
  | Phrase.Hyp (s, e, n) ->
     (Phrase.Hyp (s, check_expr opts [] type_prop e, n), b) :: l
  | Phrase.Def d ->
     (Phrase.Def (definition opts d), b) :: l
  | _ -> (p, b) :: l                  (* TODO *)
;;

(* Simpler version of declaration of defined constant which
   does not try to type the body to find the type to give to the symbol.
   This is only used in first pass. *)
let declare_phrase (p, _) = match p with
  | Phrase.Def (DefReal (_, s, ty, _, _, _))
  | Phrase.Def (DefPseudo (_, s, ty, _, _))
  | Phrase.Def (DefRec (_, s, ty, _, _)) ->
     if ty == type_none then () else declare_constant (s, ty)
  | _ -> ()
;;

(* Check that there is no free variable in phrases *)
let rec check_fv phrases =
  List.iter
    (fun p -> Log.debug 15 "Checking free vars of %a" Print.pp_phrase p; match p with
      | Phrase.Hyp (_, e, _) ->
	 assert (Expr.get_fv e = [])
      | Phrase.Def d ->
	 let (params, e) =
	   match d with
	   | DefReal (_, _, _, params, body, _)
	   | DefPseudo (_, _, _, params, body)
	   | DefRec (_, _, _, params, body) ->
	      (List.map Expr.get_name params, body)
	 in
	 assert (List.for_all (fun x -> List.mem x params) (Expr.get_fv e))
      | _ -> ())
    phrases
;;

(* This is the only exported function of this module,
   it is called in main.ml after parsing. *)
let phrasebl opts l =
  (* Log.debug 15 "Initial constants:";
  print_constant_decls stdout; *)
  (* We proceed in two passes because sometimes defined symbols are
     used too early. *)
  (* First pass: declare all constants *)
  List.iter declare_phrase l;
  (* Log.debug 15 "All constants:";
  print_constant_decls stdout; *)
  (* Second pass: do the real job of typing everything *)
  let phrases = List.fold_left (phrase opts) [] (List.rev l) in
  check_fv (List.map fst phrases);
  phrases
;;
