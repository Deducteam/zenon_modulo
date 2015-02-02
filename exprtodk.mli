open Termsig

module Translate (Dk : TermSig) :
sig
  val get_type_no_epsilon : Expr.expr -> Expr.expr
  val trexpr : Expr.expr -> Dk.term
end
