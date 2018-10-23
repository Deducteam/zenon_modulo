// Calculus of Construction embedded into Lambda-Pi Modulo

symbol const uT : TYPE
symbol eT : uT ⇒ TYPE

symbol const Pi : ∀ (X : uT), ((eT X) ⇒ uT) ⇒ uT
symbol const PiT : (uT ⇒ uT) ⇒ uT

rule eT (Pi &X &Y) → ∀ (x : (eT &X)), eT (&Y x)
rule eT (PiT &Y)   → ∀ (x : uT), eT (&Y x)

symbol Arrow : uT ⇒ uT ⇒ uT
rule Arrow &t1 &t2 → Pi &t1 (λ (x : eT &t1), &t2)