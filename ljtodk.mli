open Termsig

module Translate (Dk : TermSig) :
sig
  val trproof : Ljproof.ljproof * Expr.expr * (Expr.expr * Dk.term) list -> Dk.term
end
