(*  Copyright 2004 INRIA  *)
(*  $Id$  *)

type coqterm;;
type coqproof;;

val trproof :
  Phrase.phrase list ->
  Phrase.phrase list ->
  Llproof.proof ->
    coqproof * string list
;;
val print : out_channel -> coqproof -> unit;;

val declare_context : out_channel -> Phrase.phrase list -> unit;;
val print_use_all : out_channel -> Phrase.phrase list -> unit;;

val init_mapping : Phrase.phrase list -> unit;;
val is_mapped : Expr.expr -> bool;;
val is_goal : Expr.expr -> bool;;
val init_induct : Phrase.phrase list -> unit;;
val get_induct :
  string -> string list * (string * Phrase.inductive_arg list) list * string
;;
val getname : Expr.expr -> string;;
val synthesize : string -> string;;
val constants_used : string list ref;;
exception Cannot_infer of string;;
