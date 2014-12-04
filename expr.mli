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
  | DefReal of string * string * expr list * expr * string option
     (* definition-name, defined-ident, params, body, decreasing-arg *)
  | DefPseudo of (expr * int) * string * expr list * expr
  | DefRec of expr * string * expr list * expr
;;

(* Exceptions *)
exception Type_Mismatch of expr * expr * string;;
exception Bad_Arity of expr * expr list;;

type t = expr;;

(* Expr comparison *)
val equal : t -> t -> bool;;
val compare : t -> t -> int;;
val hash : t -> int;;

(* Term construction *)
val evar : string -> expr;;
val tvar : string -> expr -> expr;;
val emeta : expr -> expr;;
val eapp : expr * expr list -> expr;;

val eeq : expr;;
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
val type_none : expr;;
val earrow : expr list -> expr -> expr;;

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

val occurs_as_meta : expr -> expr -> bool;;
(* [occurs e1 e2] returns true if [Emeta (e1, _)] occurs in [e2] *)

exception Higher_order;;
val substitute : (expr * expr) list -> expr -> expr;;
(*
val substitute_meta : (expr * expr) -> expr -> expr;;
val substitute_expr : (expr * expr) -> expr -> expr;;
*)
val substitute_2nd : (expr * expr) list -> expr -> expr;;
val apply : expr -> expr -> expr;;
val add_argument : expr -> expr -> expr;;
val remove_scope : expr -> expr;;

(* gensym *)
val newvar : unit -> expr;;
val newname : unit -> string;;

val size : expr -> int;;
val get_taus : expr -> int;;   (* tau nesting level *)
val has_metas : expr -> bool;;
val count_metas : expr -> int;;
val get_metas : expr -> expr list;;
val get_fv : expr -> string list;;

type goalness = int;;

val print_stats : out_channel -> unit;;

(* Helper for defined symbols in coq proofs *)
val add_defs : (string * t) list -> unit
val get_defs : unit -> (string * t) list

(* Comparison of variables without comparing their types *)
val var_equal : expr -> expr -> bool
val list_var_equal : expr list -> expr list -> bool
