(*  Copyright 2014 INRIA  *)

type t

exception Mismatch of t * t
exception Base_expected
exception Not_enough_args
exception Function_expected

val type_bool : t
val type_int : t
val type_rat : t
val type_real : t
val type_tff_i : t
val type_scope : t

val type_type : t

val atomic : string -> t
val mk_poly : string list -> t -> t
val mk_constr : string -> t list -> t
val mk_arrow : t list -> t -> t

val equal : t -> t -> bool
val compare : t -> t -> int
val nbind : t -> int
val substitute : (string * t) list -> t -> t

val bool_app : t list -> t
val bool_app_opt : t option list -> t option
val type_eq : t list -> t
val type_app : t -> t list -> t
val type_app_opt : string * t option -> t option list -> t option

val to_string : t -> string
val opt_string : t option -> string

(* Arith typing *)
val is_type_num : t -> bool

(* TPTP.TFF typing *)
val tff : t -> t
val tff_check : t -> bool

(* SMTLIB typing *)
val smtlib : t -> t

(* Auxiliary function *)
val ksplit : int -> 'a list -> 'a list * 'a list
val find2 : ('a -> 'b -> bool) -> 'a list -> 'b list -> 'a * 'b

(* Defined types *)
val add_defs : (string * t) list -> unit
val get_defs : unit -> (string * t) list
