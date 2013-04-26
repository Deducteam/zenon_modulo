(* Contributed by Damien Doligez *)

-------------- MODULE Cantor6 ------------------
THEOREM cantor ==
  \A S, f :
    \E A \in SUBSET S :
      \A x \in S :
        f [x] # A
PROOF
  <1> USE DEF cantor
  <1> TAKE S
  <1> TAKE f
  <1> WITNESS { z \in S : z \notin f[z] } \in SUBSET S
  <1> QED OBVIOUS
===============================================
