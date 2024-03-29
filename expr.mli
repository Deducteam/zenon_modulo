(*  Copyright 2003 INRIA  *)
(*  $Id: expr.mli,v 1.22 2012-04-11 18:27:26 doligez Exp $  *)

type private_info;;

(* Expression definition *)
type expr = private
  | Evar of string * private_info
  | Emeta of expr * private_info    (* expr = Eall (...)  or   Eex (...) *)
  | Eapp of expr * expr list * private_info   (* expr = Evar (...) *)

  | Earrow of expr list * expr * private_info (* args -> ret *)

  | Enot of expr * private_info
  | Eand of expr * expr * private_info
  | Eor of expr * expr * private_info
  | Eimply of expr * expr * private_info
  | Eequiv of expr * expr * private_info
  | Etrue
  | Efalse

  | Eall of expr * expr * private_info
  | Eex of expr * expr * private_info
  | Etau of expr * expr * private_info
  | Elam of expr * expr * private_info
      (* variable, type, body *)
;;

type definition =
  | DefReal of string * string * expr * expr list * expr * string option
     (* definition-name, defined-ident, type, params, body, decreasing-arg *)
  | DefPseudo of (expr * int) * string * expr * expr list * expr
  | DefRec of expr option * string * expr * expr list * expr
;;

(* Exceptions *)
exception Type_Mismatch of expr * expr * string;;
exception Bad_Arity of expr * expr list;;
exception Ill_typed_substitution of (expr * expr) list;;
exception Mismatch;;

type t = expr;;

(* Expr comparison *)
val equal : t -> t -> bool;;
val compare : t -> t -> int;;
val hash : t -> int;;

(* Term construction *)
val tvar : string -> expr -> expr;;

(* Shortcuts for types none, iota, tType and prop *)
val tvar_none : string -> expr;;
val tvar_iota : string -> expr;;
val tvar_type : string -> expr;;
val tvar_prop : string -> expr;;

val emeta : expr -> expr;;
val eapp : expr * expr list -> expr;;

val eeq : expr -> expr -> expr;;
val eite_t : expr -> expr -> expr -> expr;;
val estring : expr;;

(* Prop construction *)
val enot : expr -> expr;;
val eand : expr * expr -> expr;;
val eor : expr * expr -> expr;;
val exor : expr * expr -> expr;;
val eimply : expr * expr -> expr;;
val eequiv : expr * expr -> expr;;
val etrue : expr;;
val efalse : expr;;
val eall : expr * expr -> expr;;
val eex : expr * expr -> expr;;
val etau : expr * expr -> expr;;
val elam : expr * expr -> expr;;

val all_list : expr list -> expr -> expr;;
val ex_list : expr list -> expr -> expr;;

(* Typing *)
val type_type : expr;;
val type_prop : expr;;
val type_iota : expr;;
val type_none : expr;;
val earrow : expr list -> expr -> expr;;

val get_name : expr -> string;;
val get_type : expr -> expr;;

val type_app : expr -> expr list -> expr;;
(* [type_app t args]
   checks that type t can be applied to the given arguments, and reutrns the return type.
   @raise Type_Mismatch if the type and arguments do not match.
*)


(* Misc functions *)
val diff : expr list -> expr list -> expr list;;
(* [diff l1 l2]
   return [l1] without the formulas present in [l2]
*)
val union : expr list -> expr list -> expr list;;
(* [union l1 l2]
   return [l1 @@ l2], removing duplicate formulas
*)
val disjoint : expr list -> expr list -> bool;;
(* [disjoint l1 l2]
   return true if [l1] and [l2] have no element in common
*)

val preunifiable : expr -> expr -> bool;;
(* [preunifiable e1 e2]
   Returns true if e1 and e2 are pre-unifiable.
   Assumes that e1 and e2 are terms (i.e. don't have logical connectives
   except inside a tau).
*)

val preunify : expr -> expr -> (expr * expr) list;;
(* [preunify e1 e2]
   If e1 and e2 are pre-unifiable, return the set of pre-unifiers.
   Return an empty list if they are not pre-unifiable.
   A pre-unifier is: (metavariable, value)
*)

exception Ununifiable;;

val preunify_list : expr list -> expr list -> (expr * expr) list;;

val occurs_as_meta : expr -> expr -> bool;;
(* [occurs e1 e2] returns true if [Emeta (e1, _)] occurs in [e2] *)

exception Higher_order;;
val substitute : (expr * expr) list -> expr -> expr;;
(* Same as substitute but also check that the substitution is well-typed. *)
val substitute_safe : (expr * expr) list -> expr -> expr;;
val substitute_unsafe : (expr * expr) list -> expr -> expr;;
val substitute_meta : (expr * expr) -> expr -> expr;;
(*
val substitute_expr : (expr * expr) -> expr -> expr;;
*)
val substitute_2nd : (expr * expr) list -> expr -> expr;;
(* Same as substitute but also check that the substitution is well-typed. *)
val substitute_2nd_safe : (expr * expr) list -> expr -> expr;;
val substitute_2nd_unsafe : (expr * expr) list -> expr -> expr;;
val apply : expr -> expr -> expr;;
val add_argument : expr -> expr -> expr;;
val remove_scope : expr -> expr;;

(* gensym *)
val newtvar : expr -> expr;;
val newname : unit -> string;;

val size : expr -> int;;
val get_taus : expr -> int;;   (* tau nesting level *)
val has_metas : expr -> bool;;
val count_metas : expr -> int;;
val get_metas : expr -> expr list;;
val get_submetas : expr -> expr list;;
val get_fv : expr -> string list;;

type goalness = int;;

val print_stats : out_channel -> unit;;

(* Helper for defined symbols in coq proofs *)
val add_defs : (string * t) list -> unit
val get_defs : unit -> (string * t) list

(* Comparison of variables without comparing their types *)
val var_equal : expr -> expr -> bool
val list_var_equal : expr list -> expr list -> bool

val nb_tvar : expr -> int;;

exception Unsplitable;;

val split_list : int -> expr list -> expr list * expr list;;
val get_tvar : expr -> expr list;;

type rwrt_tbl = (string, expr * expr) Hashtbl.t;;
type rwrt_tbls = rwrt_tbl * rwrt_tbl;;

val tbl_term : rwrt_tbl ref;;
val tbl_prop : rwrt_tbl ref;;
