(* Copyright 2014 Inria *)

(* This module performs typing of expressions and phrases,
   It should only be used when the parsed language annotates all
   binders and declares all function symbols with their types.

   It does not, for now, infer types.

   It walks through expressions and types leaves (variables) with
   the last type found on a binder *)

open Expr;;

exception Inference_failed;;


(* Printing functions for error messages *)
let print_expr out = Print.expr_soft (Print.Chan out);;

let print_env out =
  List.iter (fun (s, ty) ->
             Printf.fprintf out "%s : %s;\n"
                            s (Type.to_string ty))
;;

let print_phrase out = Print.phrase (Print.Chan out);;

(* Wrapper around Inference_failed exception printing useful information on stderr *)
let inference_failed env e =
  Printf.eprintf "\n\nType inference for expression %a failed.\n"
                 print_expr e;
  Printf.eprintf "\n\nContext:\n%a\n"
                 print_env env;
  raise Inference_failed
;;

(* Functions for building types (/!\ too specific to Dedukti) *)
let eps ty = Type.mk_constr "cc.eT" [ty];;
let arr ty1 ty2 = Type.mk_arrow [ty1] ty2;;
let t_bool = Type.atomic "basics.bool__t";;
let bool1 = eps t_bool;;
let bool2 = arr bool1 bool1;;
let bool3 = arr bool1 bool2;;
let t_prop = Type.type_bool;;

(* Env of builtin constants *)
(* TODO: move it to extensions *)
let base_env =
  [
    ("Is_true", arr bool1 t_prop);
    ("true", bool1);
    ("false", bool1);
    ("basics._tilda__tilda_", bool2);
    ("basics._amper__amper_", bool3);
    ("basics._bar__bar_", bool3);
    ("basics._bar__lt__gt__bar_", bool3)
  ]
;;

(* Main function walking through expressions *)
let rec rec_expr env = function
  | Evar (s, _) as v ->
     (
       try (tvar s (List.assoc s env))
       with Not_found ->
         Printf.eprintf "Scoping error: unknown free variable %s\n" s;
         v
     )
  | Emeta (t, _) -> emeta (rec_expr env t)
  | Eapp (Evar ("@", _),
          [Evar ("dk_tuple.pair", _); ty1; ty2; e1; e2], _) as e ->
     let prod =
       eps (Type.mk_constr "dk_tuple.prod"
                           [type_of_expr ty1;
                            type_of_expr ty2])
     in
     force_type prod e
  | Eapp (Evar ("@", _), _, _) ->
     assert false
  | Eapp (Evar ("$match", _),
          [p;
           Elam (Evar (x, _), tx,
                 Elam (Evar (y, _), ty,
                       Eapp (Evar ("$match-case", _),
                             [Evar ("dk_tuple.pair", _); body],
                             _),
                       _),
                 _)],
          _) as e ->
     let newenv = (x, tx) :: (y, ty) :: env in
     (match get_type (rec_expr newenv body) with
      | Some ty -> force_type ty e
      | None -> Printf.eprintf "\nUntyped pattern body %a.\n"
                              print_expr body;
               assert false)
  | Eapp (f, args, _) ->
     eapp (rec_expr env f, List.map (rec_expr env) args)
  | Enot (e, _) ->
     enot (rec_expr env e)
  | Eand (a, b, _) ->
     eand (rec_expr env a, rec_expr env b)
  | Eor (a, b, _) ->
     eor (rec_expr env a, rec_expr env b)
  | Eimply (a, b, _) ->
     eimply (rec_expr env a, rec_expr env b)
  | Eequiv (a, b, _) ->
     eequiv (rec_expr env a, rec_expr env b)
  | Etrue -> etrue
  | Efalse -> efalse
  | Eall (Evar (x, _), ty, body, _) ->
     eall (tvar x ty, ty, rec_expr ((x, ty) :: env) body)
  | Eex (Evar (x, _), ty, body, _) ->
     eex (tvar x ty, ty, rec_expr ((x, ty) :: env) body)
  | Etau (Evar (x, _), ty, body, _) ->
     etau (tvar x ty, ty, rec_expr ((x, ty) :: env) body)
  | Elam (Evar (x, _), ty, body, _) ->
     elam (tvar x ty, ty, rec_expr ((x, ty) :: env) body)
  | _ -> assert false
;;

(* Calls rec_expr and check that a type was found for the whole
   expresssion. This ensures that all subnodes are typed. *)
let expr env e =
  let e' = rec_expr env e in
  match get_type e' with
  | None -> inference_failed env e
  | Some t -> e'
;;

(* Parameters of definitions are typed variables.
   param env (s : ty) returns (s, ty) :: env *)
let param env = function
  | Evar (s, _) as v ->
     (
       match get_type v with
       | Some ty -> (s, ty) :: env
       | None -> assert false
     )
  | _ -> assert false
;;

(* Type a definition *)
let definition env = function
  | DefReal (name, ident, params, body, decarg) ->
     let env' = List.fold_left param env params in
     DefReal (name, ident, params, expr env' body, decarg)
  | DefPseudo ((e, n), s, params, body) ->
     let env' = List.fold_left param env params in
     DefPseudo ((expr env e, n), s, params, expr env' body)
  | DefRec (e, s, params, body) ->
     let env' = List.fold_left param env params in
     DefRec (expr env e, s, params, expr env' body)
;;

(* When typing a phrase, there are two alternatives,
   either the phrase is a typing declaration of a function symbol,
   (in which case we remove it from the list of phrases
   and add the declaration to the environment) or it is a regular phrase
   that we type. *)
type declaration_phrase = Decl of string * Type.t | Phr of Phrase.phrase;;

(* Declarations are encoded as "real definitions" by the parser
   (currently only parsedk). *)
let phrase env = function
  | Phrase.Def (DefReal ("Typing declaration", s, _, Elam (_, ty, _, _), _)) ->
     Decl (s, ty)
  | Phrase.Def (DefReal ("Typing declaration", _, _, _, _)) ->
     assert false
  | Phrase.Hyp (s, e, n) ->
     Phr (Phrase.Hyp (s, expr env e, n))
  | Phrase.Def d -> Phr (Phrase.Def (definition env d))
  | p -> Phr p
;;

(* This function is iterated (folded) on the list of phrases
   (annotated by a boolean). *)
let phraseb (env, l) (p, b) =
  match phrase env p with
  | Decl (s, ty) ->
     ((s, ty) :: env, l)
  | Phr ph ->
     (env, (ph, b) :: l)
;;

(* This is the only exported function of this module,
   it is called in main.ml after parsing of Dedukti input. *)
let phrasebl l =
  let (env, revl) = List.fold_left phraseb (base_env, []) l in
  List.rev revl
;;
