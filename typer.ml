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

(* A global hashtable of constant values.
   These constants are declared in extensions.
   (declare_constant is exported)
   This table is used for typing applications. *)
let const_env : (string, expr) Hashtbl.t = Hashtbl.create 97;;
let declare_constant (c, ty) = Hashtbl.add const_env c ty;;

(* Print the declared constants, one by line *)
let print_constant_decls out =
  Hashtbl.iter (fun s ty -> Printf.fprintf out "$CONST %s : %s\n"
                                        s (Print.sexpr ty))
               const_env
;;

(* This function queries the hashtable for typing a constant *)
(* Raises Not_found if the constant is unknown. *)
let type_const = function
  | Evar (s, _) as c ->
     (try tvar s (Hashtbl.find const_env s)
      with Not_found -> c)
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


(* Replace prenex quantified type variables by meta variables. *)
(* Variables are accumulated to call substitution only once. *)
let rec generalize_scheme varmap = function
  | Eall (v, sch, _) as e ->
     generalize_scheme ((v, emeta e) :: varmap) sch
  | Evar _
  | Earrow _ as base_type ->
     substitute varmap base_type
  | _ -> raise (Invalid_argument "Typer.generalize_scheme: Type scheme expected")
;;

(* Generate a fresh type meta-variable *)
let new_meta () =
  emeta (eall (tvar (newname ()) type_type,
               type_none))             (* Body is irrelevant *)
;;

(* Same as get_type but returns a fresh meta variable instead of type_none *)
let get_type_meta e =
  let ty = get_type e in
  if ty == type_none then new_meta () else ty
;;

(* Lookup a list of preunifiers until the expression is no more a meta,
   may raise Not_found *)
let rec follow_preunifiers preunifiers = function
  | Emeta _ as m -> follow_preunifiers preunifiers (List.assoc m preunifiers)
  | e -> e
;;

(* Like follow_preunifiers but returns type_none instead of failing *)
let follow_preunifiers_none preunifiers e =
  try
    follow_preunifiers preunifiers e
  with Not_found -> type_none
;;

(* Local exception for giving up checking of application *)
exception Give_up;;

(* Main functions walking through expressions infering and checking types. *)
(* This type-checking is bidirectionnal. *)
let rec infer_expr env = function
  | Evar (s, _) as v ->
     (
       try (tvar s (assoc s env))
       with Not_found ->
         Printf.eprintf "Scoping error: unknown free variable %s\n" s;
         v
     )
  | Emeta (t, _) -> emeta (infer_expr env t)
  | Eapp (Evar (f_sym, _) as f, args, _) ->
     let tyf = get_type f in
     if tyf <> type_none
     then                       (* The head has a meaningfull type. *)
       (match tyf with
        | Earrow (tyargs, tyret, _) when List.length tyargs = List.length args ->
           eapp (f, List.map2 (check_expr env) tyargs args)
        | _ -> raise (Arity_mismatch (f, args)))
     else                       (* The head has an unknown type,
                                   we look for it in the constant table. *)
       (
         (* The type of the constant f may be a type scheme of the form Eall (..(Eall(ty))),
            we generalize it to unify it with the type of arguments. *)
         let tyf' = generalize_scheme [] (type_const f) in
         (* We don't know the type to return yet
            so we generate a fresh meta-variable for it. *)
         let meta_return_type = new_meta() in
         (* for each argument, we try to infer its type *)
         let infered_args =
           List.map (fun arg -> let newarg = infer_expr env arg in
                             if get_type newarg == type_none
                             then arg
                             else newarg)
                    args
         in
         let args_types = List.map get_type_meta infered_args in
         let expected_type = earrow args_types meta_return_type in
         (* We preunify *)
         let preunifiers = preunify expected_type tyf' in
         (* We remove all metas *)
         let remove_metas = follow_preunifiers_none preunifiers in
         let args_types_no_meta = List.map remove_metas args_types in
         let newtyf =
           if List.exists ((==) type_none) args_types_no_meta
           then type_none
           else
             earrow args_types_no_meta (remove_metas meta_return_type)
         in
         let newargs =
           List.map2 (check_expr env) args_types_no_meta infered_args
         in
         eapp (tvar f_sym newtyf, newargs)
       )
  | Enot (e, _) ->
     enot (check_expr env type_prop e)
  | Eand (a, b, _) ->
     eand (check_expr env type_prop a, check_expr env type_prop b)
  | Eor (a, b, _) ->
     eor (check_expr env type_prop a, check_expr env type_prop b)
  | Eimply (a, b, _) ->
     eimply (check_expr env type_prop a, check_expr env type_prop b)
  | Eequiv (a, b, _) ->
     eequiv (check_expr env type_prop a, check_expr env type_prop b)
  | Etrue -> etrue
  | Efalse -> efalse
  | Eall (Evar _ as x, body, _) ->
     eall (x, check_expr (x :: env) type_prop body)
  | Eex (Evar _ as x, body, _) ->
     eex (x, check_expr (x :: env) type_prop body)
  | Etau (Evar _ as x, body, _) ->
     etau (x, check_expr (x :: env) type_prop body)
  | Elam (Evar _ as x, body, _) ->
     elam (x, check_expr (x :: env) type_prop body)
  | _ -> assert false
and xcheck_expr env ty e =
  if get_type e == ty
  then e
  else
    if ty == type_none
    then infer_expr env e
    else
      match e with
      | Evar (s, _) -> tvar s ty
      | Emeta (Eall (Evar (s, _), b, _), _) ->
         emeta (check_expr env type_prop (eall (tvar s ty, b)))
      | Eapp (Evar (f_sym, _) as f, args, _) ->
         (try
             let typed_args = List.map (infer_expr env) args in
             let args_types = List.map get_type typed_args in
             let (new_typed_args, new_args_types) =
               if List.exists ((==) type_none) args_types
               then (
                 (* Backup plan, maybe f_sym is declared and can help us checking args *)
                 let tyf' = type_const f in
                 match tyf' with
                 | Earrow (l, ret, _) when List.length l = List.length args && ret == ty ->
                    let new_typed_args = List.map2 (check_expr env) l args in
                    let new_args_types = List.map get_type new_typed_args in
                    if List.exists ((==) type_none) new_args_types then raise Give_up;
                    (new_typed_args, new_args_types)
                 | _ -> raise Give_up
               )
               else (typed_args, args_types)
             in
             let tyf = earrow new_args_types ty in
             eapp (tvar f_sym tyf, new_typed_args)
           with Give_up ->
             eapp (evar f_sym, args))
      | Enot (e, _) ->
         assert (ty == type_prop);
         enot (check_expr env type_prop e)
      | Eand (a, b, _) ->
         assert (ty == type_prop);
         eand (check_expr env type_prop a, check_expr env type_prop b)
      | Eor (a, b, _) ->
         assert (ty == type_prop);
         eor (check_expr env type_prop a, check_expr env type_prop b)
      | Eimply (a, b, _) ->
         assert (ty == type_prop);
         eimply (check_expr env type_prop a, check_expr env type_prop b)
      | Eequiv (a, b, _) ->
         assert (ty == type_prop);
         eequiv (check_expr env type_prop a, check_expr env type_prop b)
      | Etrue -> assert (ty == type_prop); etrue
      | Efalse -> assert (ty == type_prop); efalse
      | Eall (Evar _ as x, body, _) ->
         assert (ty == type_prop);
         eall (x, check_expr (x :: env) type_prop body)
      | Eex (Evar _ as x, body, _) ->
         assert (ty == type_prop);
         eex (x, check_expr (x :: env) type_prop body)
      | Etau (Evar _ as x, body, _) ->
         let newx = check_expr env x ty in
         etau (newx, check_expr (newx :: env) type_prop body)
      | Elam (Evar _ as x, body, _) ->
         (
           let mk_arrow l ret =
             if l = [] then ret else earrow l ret
           in
           match ty with
           | Earrow (hd :: tl, ret, _) ->
              let newx = check_expr env hd x in
              elam (newx, check_expr (x :: env) (mk_arrow tl ret) body)
           | _ -> raise (Invalid_argument "Typer.check_expr: arrow expected")
         )
      | _ -> assert false
and check_expr env ty e =
  try
    let result = xcheck_expr env ty e in
    let rty = get_type result in
    if not (rty == type_none || rty == ty)
    then Printf.eprintf "Typer: type checking %s at type %s resulted in %s = %s.\n"
                        (Print.sexpr e)
                        (Print.sexpr ty)
                        (Print.sexpr_type result)
                        (Print.sexpr rty);
    result
  with Type_Mismatch (a, b, f) as exc ->
    Printf.eprintf "error while checking %s at type %s in env [%s].\n"
                   (Print.sexpr_type e) (Print.sexpr_type ty)
                   (String.concat "; " (List.map Print.sexpr_type env));
    raise exc
;;

(* Declare the defined identifier and return the typed version of the body
   and its typing environment. *)
(* TODO: currify when the body is a lambda. *)
let declare_def_constant = function
  | DefReal (_, s, ty, env, body, _)
  | DefPseudo ((_, _), s, ty, env, body)
  | DefRec (_, s, ty, env, body) ->
     if ty == type_none
     then
       let typed_body = infer_expr env body in
       declare_constant (s, earrow (List.map get_type env) (get_type typed_body));
       (env, typed_body)
     else
       (match ty with
        | Earrow (ty_params, ty_body, _) ->
           assert (ty_params = List.map get_type env);
           let typed_body = check_expr env ty_body body in
           declare_constant (s, ty);
           (env, typed_body)
        | _ -> assert false)      (* Constant must have arrow types *)
;;

(* Type a definition and declare it. *)
let definition d =
  let (env, typed_body) = declare_def_constant d in
  match d with
  | DefReal (name, ident, ty, params, body, decarg) ->
     DefReal (name, ident, ty, params, typed_body, decarg)
  | DefPseudo ((e, n), s, ty, params, body) ->
     DefPseudo ((infer_expr env e, n), s, ty, params, typed_body)
  | DefRec (e, s, ty, params, body) ->
     DefRec (infer_expr env e, s, ty, params, typed_body)
;;

(* Declarations are encoded as "real definitions" by the parser
   (currently only parsedk). *)
(* This function is folded on the list of phrases,
   it removes declarations and return the typed phrases
   in reverse order *)
let phrase l (p, b) = match p with
  | Phrase.Def (DefReal ("Typing declaration", s, ty, _, _, _)) ->
     declare_constant (s, ty);
     l
  | Phrase.Hyp (s, e, n) ->
     (Phrase.Hyp (s, check_expr [] type_prop e, n), b) :: l
  | Phrase.Def d ->
     (Phrase.Def (definition d), b) :: l
  | _ -> (p, b) :: l                  (* TODO *)
;;

(* This is the only exported function of this module,
   it is called in main.ml after parsing. *)
let phrasebl l =
  List.fold_left phrase [] (List.rev l)
;;
