open Termsig

module Translate (Dk : TermSig) :
sig
  val trexpr : Expr.expr -> Dk.term
end
