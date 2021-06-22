symbol Type : TYPE
symbol Prop : TYPE
constant symbol ι : TYPE

injective symbol ϵ : Prop → TYPE

symbol ⊤ : Prop
symbol ⊥ : Prop

symbol ¬ : Prop → Prop
symbol ∧ : Prop → Prop → Prop
symbol ∨  : Prop → Prop → Prop
symbol ⇒ : Prop → Prop → Prop
symbol ⇔ : Prop → Prop → Prop

notation ⇒ infix right 5;
notation ∧ infix right 10;
notation ∨ infix right 9;
notation ⇔ infix left 10;

symbol ∀ : (ι → Prop) → Prop
symbol ∃ : (ι → Prop) → Prop

set quantifier ∀
set quantifier ∃

symbol = : ι → ι → Prop
notation = infix 12;