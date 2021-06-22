require open sigmafol

// set declared "⊥E"
// set declared "⊤I"
// set declared "∧El"
// set declared "∧Er"
// set declared "∧I"
// set declared "∨E"
// set declared "∨Il"
// set declared "∨Ir"
// set declared "⇒E"
// set declared "⇒I"
// set declared "¬I"
// set declared "¬E"
// set declared "=E"
// set declared "=I"
// set declared "∀I"
// set declared "∀E"
// set declared "∃E"
// set declared "∃I"

symbol ⊥E : ϵ ⊥ → Π p, ϵ p 
symbol ⊤I : ϵ ⊤ 
symbol ∧El : Π p : Prop, Π q: Prop, ϵ (p ∧ q) → ϵ p  
symbol ∧Er : Π p : Prop, Π q: Prop, ϵ (p ∧ q) → ϵ q  
symbol ∧I : Π p : Prop, Π q: Prop, ϵ p → ϵ q → ϵ (p ∧ q)  
symbol ∨E : Π p : Prop, Π q: Prop, ϵ (p ∨ q) → Π x, (ϵ p → ϵ x) → (ϵ q → ϵ x) → ϵ x 
symbol ∨Il : Π p : Prop, Π q: Prop,  ϵ p → ϵ (p ∨ q) 
symbol ∨Ir : Π p : Prop, Π q: Prop, ϵ q → ϵ (p ∨ q) 
symbol ⇒E : Π p : Prop, Π q : Prop, ϵ (p ⇒ q) → ϵ p → ϵ q 
symbol ⇒I : Π p : Prop, Π q : Prop, (ϵ p → ϵ q) → ϵ (p ⇒ q) 
symbol ¬I : Π p : Prop, (ϵ p → ϵ (⊥)) → ϵ (¬ p) 
symbol ¬E : Π p : Prop, ϵ (¬ p) → ϵ (p) → ϵ (⊥) 
symbol =E : Π t : ι, Π v : ι, ϵ (t = v) → Π p : ι → Prop, ϵ (p t) → ϵ (p v) 
symbol =I : Π t : ι, ϵ  (t = t) 
symbol ∀I : Π p : ι → Prop, (Π x : ι, ϵ (p x)) → ϵ (∀ p)  
symbol ∀E : Π p : ι → Prop, Π t : ι, ϵ (∀ p) → ϵ (p t)  
symbol ∃E : Π p : ι → Prop, ϵ (∃ p) → Π P, (Π x : ι, ϵ (p x) → ϵ P) → ϵ P 
symbol ∃I : Π p : ι → Prop, Π t, ϵ (p t) → ϵ (∃ p) 
