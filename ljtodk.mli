open Termsig

module Translate (Dk : TermSig) :
sig
  val trproof : Lkproof.lkproof * Expr.expr * (Expr.expr * Dk.term) list -> Dk.term
end
