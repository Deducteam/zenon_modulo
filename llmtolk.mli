type env = {hypotheses : Expr.expr list;
	    distincts : (Expr.expr * int) list;}

val lltolk : env -> Llproof.prooftree -> Expr.t -> bool -> bool -> Lkproof.lkproof
val new_tau : unit -> Expr.expr
