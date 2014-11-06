(*  Copyright 1997 INRIA  *)
(*  $Id$  *)

val index : int -> 'a -> 'a list -> int;;
val ( @@ ) : 'a list -> 'a list -> 'a list;;
val list_init : int -> (unit -> 'a) -> 'a list;;
val list_last : 'a list -> 'a;;
val list_iteri : (int -> 'a -> unit) -> 'a list -> unit;;
val list_iter3 :
  ('a -> 'b -> 'c -> unit) -> 'a list -> 'b list -> 'c list -> unit
;;
val list_fold_left3 :
  ('accu -> 'a -> 'b -> 'c -> 'accu) -> 'accu -> 'a list -> 'b list -> 'c list
  -> 'accu
;;
val list_mapi : ('a -> int -> 'b) -> 'a list -> int -> 'b list;;
val list_map3 :
  ('a -> 'b -> 'c -> 'd) -> 'a list -> 'b list -> 'c list -> 'd list
;;
val list_map4 :
  ('a -> 'b -> 'c -> 'd -> 'e)
  -> 'a list -> 'b list -> 'c list -> 'd list -> 'e list
;;
val list_nth_tail : 'a list -> int -> 'a list;;

val list_unique : 'a list -> 'a list;;
(** Assumes that the list is sorted. Uses structural equality. *)

val list_uniq : 'a list -> 'a list;;
(** Assumes that the list is sorted. Uses pointer equality. *)

val list_indexq : 'a -> 'a list -> int;;

val string_split : string -> string list;;
val occurs : string -> string -> bool;;
val is_prefix : string -> string -> bool;;
(* [is_prefix pre str] is true if [pre] is a prefix of [str]. *)

val replace_first : string -> string -> string -> string;;
val isalnum : char -> bool;;
val isdigit : char -> bool;;

val debug : ('a, out_channel, unit) format -> 'a;;

val base26 : int -> string;;
