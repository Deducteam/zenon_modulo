(*  Copyright 2003 INRIA  *)
(*  $Id: modnorm.mli,v 1.00 2013-04_05 15:19:00 halmagrand Exp $  *)

open Expr;;

val unif_aux : ( expr * expr ) list -> expr -> expr -> (expr * expr ) list;;
(* [unif_aux l t1 t2]
   return [l] the list of pair whch symbolise the substitution
   sigma : t1 -> t2
*)

val unif : expr -> expr -> (expr * expr ) list;;
(* [unif t1 t2]
   return [l] the list of pair whch symbolise the substitution
   sigma : t1 -> t2
*)

val nb_rewrite : unit -> int * int;;
(* return the number of rewrites on terms and props *)

val rewrite_term : (expr * expr) -> expr -> expr;;

val rewrite_prop : (expr * expr) -> expr -> expr;;

val normalize_fm : expr -> expr;;

val normalize_list : expr list -> expr list;;

val printer : expr -> unit;;

exception Unif_failed;;

val add_rwrt_term : string -> expr -> unit;;
val add_rwrt_prop : string -> expr -> unit;;

val select_rwrt_rules : Phrase.phrase list -> Phrase.phrase list;;
