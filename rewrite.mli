(*  Copyright 2003 INRIA  *)
(*  $Id: modnorm.mli,v 1.00 2013-04_05 15:19:00 halmagrand Exp $  *)

open Expr;;
open Print;;

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

val rewrite_term : (expr * expr) -> expr -> expr;;

val rewrite_prop : (expr * expr) -> expr -> expr;;

val normalize_fm : expr -> expr;;

val normalize_list : expr list -> expr list;;

val printer : expr -> unit;;

exception Unif_failed;;

val select_rwrt_rules : Phrase.phrase list -> Phrase.phrase list;;
