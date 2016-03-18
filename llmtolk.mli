type env = {hypotheses : Expr.expr list;
	    distincts : (Expr.expr * int) list;}

val llmtolk : env -> Llproof.prooftree -> Expr.t -> bool -> Lkproof.typed_lkproof
val new_tau : unit -> Expr.expr
