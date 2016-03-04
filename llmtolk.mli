type env = {hypotheses : Expr.expr list;
	    distincts : (Expr.expr * int) list;}

val llmtolk : env -> Llproof.prooftree -> Expr.t -> bool -> Lkproof.lkproof
val new_tau : unit -> Expr.expr
