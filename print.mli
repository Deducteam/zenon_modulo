(*  Copyright 2004 INRIA  *)
(*  $Id: print.mli,v 1.4 2005-11-05 11:13:17 doligez Exp $  *)

type output = Buff of Buffer.t | Chan of out_channel;;

val expr : output -> Expr.expr -> unit;;
val expr_soft : output -> Expr.expr -> unit;;

val phrase : output -> Phrase.phrase -> unit;;

val hlproof : output -> int -> Mlproof.proof -> unit;;

val mlproof : output -> Mlproof.proof -> unit;;
val mlproof_rule : output -> Mlproof.rule -> unit;;
val mlproof_rule_soft : output -> Mlproof.rule -> unit;;

val llproof : output -> Llproof.proof -> unit;;

val sexpr : Expr.expr -> string;;
val sexpr_t : Expr.expr -> string;;
val sexpr_type : Expr.expr -> string;;

val pp_expr : Buffer.t -> Expr.expr -> unit;;
val pp_expr_t : Buffer.t -> Expr.expr -> unit;;
val pp_expr_type : Buffer.t -> Expr.expr -> unit;;
val pp_mlrule : Buffer.t -> Mlproof.rule -> unit;;

val dots : output -> ?full_output:bool -> ?max_depth:int -> Mlproof.proof list -> unit;;

val pr_def : Buffer.t -> Expr.definition -> unit;;

val print_tbl_term : output -> Expr.rwrt_tbl -> unit;;
val print_tbl_prop : output -> Expr.rwrt_tbl -> unit;;

