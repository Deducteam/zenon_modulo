(*  Copyright 2004 INRIA  *)
(*  $Id: eqrel.mli,v 1.3 2004-10-28 13:51:38 doligez Exp $  *)

val analyse : Expr.expr -> unit;;
val subsumed : Expr.expr -> bool;;

val refl : Expr.expr -> bool;;
val sym : Expr.expr -> bool;;
val trans : Expr.expr -> bool;;
val any : Expr.expr -> bool;;

val get_refl_hyp : Expr.expr -> Expr.expr;;
val get_sym_hyp : Expr.expr -> Expr.expr;;
val get_trans_hyp : Expr.expr -> Expr.expr;;

val get_proof : Expr.expr -> Mlproof.proof * Expr.expr list;;

val print_rels : out_channel -> unit;;
