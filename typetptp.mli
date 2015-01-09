(*  Copyright 2014 INRIA  *)

exception Type_error of string

type env
val default_env : env

val type_tff_expr : env -> Expr.t -> Expr.t * env

val typecheck : Phrase.phrase list -> Phrase.phrase list

