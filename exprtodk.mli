open Termsig

module Translate (Dk : TermSig) :
sig
  val tr_string : string -> string 
  val trexpr : Expr.expr -> Dk.term
end
