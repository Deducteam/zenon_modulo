require open logic.fol logic.ll logic.nd logic.nd_eps
             logic.nd_eps_full logic.nd_eps_aux logic.ll_nd;

symbol Type  : TYPE;
injective symbol τ : Type → TYPE;

constant symbol ι  : Type;

symbol nnpp p : ϵ (¬ ¬ p) → ϵ p;

rule τ ι ↪ κ;

symbol foralltype : (Type → Prop) → Prop;
symbol existstype : (Type → Prop) → Prop;

symbol ∀α {a} : (τ a → Prop) → Prop; notation ∀α quantifier;
rule @∀α ι ↪ ∀;

symbol ∃α {a} : (τ a → Prop) → Prop; notation ∃α quantifier;
rule @∃α ι ↪ ∃;

symbol eq {a} : τ a → τ a → Prop; notation = infix 12;
rule @eq ι $t $u ↪ $t = $u;

symbol Rfalse : ϵ ⊥ → ϵ ⊥; 
rule Rfalse ↪ R⊥;

symbol Rnottrue : ϵ (¬ ⊤) → ϵ ⊥;
rule Rnottrue ↪ R¬⊤;

symbol Raxiom : Π (p : Prop), ϵ p → ϵ (¬ p) → ϵ ⊥;
rule Raxiom ↪ Rax;

symbol Rnoteq : Π (a : Type) (t : τ a), ϵ (¬ (eq t t)) → ϵ ⊥;
rule Rnoteq ι ↪ R≠;

symbol Reqsym a (t u : τ a) : ϵ (eq t u) → ϵ (¬ (eq u t)) → ϵ ⊥;
rule Reqsym ι ↪ R=;

symbol Rnotnot p : (ϵ p → ϵ ⊥) → ϵ (¬ (¬ p)) → ϵ ⊥;
rule Rnotnot ↪ R¬¬;

symbol Rand p q : (ϵ p → ϵ q → ϵ ⊥) → ϵ (p ∧ q) → ϵ ⊥;
rule Rand ↪ R∧;

symbol Ror p q : (ϵ p → ϵ ⊥) → (ϵ q → ϵ ⊥) → ϵ (p ∨ q) → ϵ ⊥;
rule Ror ↪ R∨;

symbol Rimply p q :  (ϵ (¬ p) → ϵ ⊥) → (ϵ q → ϵ ⊥) → ϵ (p ⇒ q) → ϵ ⊥;
rule Rimply ↪ R⇒;

symbol Requiv p q : 
  (ϵ (¬ p) → ϵ (¬ q) → ϵ ⊥) → (ϵ p → ϵ q → ϵ ⊥) → ϵ (p ⇔ q) → ϵ ⊥;
rule Requiv ↪ R⇔;

symbol Rnotand p q : 
  (ϵ (¬ p) → ϵ ⊥) → (ϵ (¬ q) → ϵ ⊥) → ϵ (¬ (p ∧ q)) → ϵ ⊥;
rule Rnotand ↪ R¬∧;

symbol Rnotor p q : (ϵ (¬ p) → ϵ (¬ q) → ϵ ⊥) → ϵ (¬ (p ∨ q)) → ϵ ⊥;
rule Rnotor ↪ R¬∨;

symbol Rnotimply p q : (ϵ p → ϵ (¬ q) → ϵ ⊥) → ϵ (¬ (⇒ p q)) → ϵ ⊥;
rule Rnotimply ↪ R¬⇒;

symbol Rnotequiv p q :
  (ϵ (¬ p) → ϵ q → ϵ ⊥) → (ϵ p → ϵ (¬ q) → ϵ ⊥) → ϵ (¬ (p ⇔ q)) → ϵ ⊥;
rule Rnotequiv ↪ R¬⇔;

symbol Rex a p : (Π (t : τ a), ϵ (p t) → ϵ ⊥) → ϵ (∃α p) → ϵ ⊥;
rule Rex ι ↪ R∃;

symbol Rall a p t : (ϵ (p t) → ϵ ⊥) → ϵ (@∀α a p) → ϵ ⊥;
rule Rall ι ↪ R∀;

symbol Rnotex a (p : (τ a → Prop)) (t : τ a) : 
  (ϵ (¬ (p t)) → ϵ ⊥) → ϵ (¬ (∃α p)) → ϵ ⊥;
rule Rnotex ι ↪ R¬∃;

symbol Rnotall a p : (Π (t : τ a), ϵ (¬ (p t)) → ϵ ⊥) → ϵ (¬ (@∀α a p)) → ϵ ⊥;
rule Rnotall ι ↪ R¬∀;

symbol Rextype (p : (Type → Prop)) : 
  (Π (a : Type), ϵ (p a) → ϵ ⊥) → ϵ (existstype p) → ϵ ⊥;

//symbol Ralltype (p : (Type → Prop)) a :
//  (ϵ (p a) → ϵ ⊥) → ϵ (foralltype p) → ϵ ⊥;
//
//symbol Rnotextype (p : (Type → Prop)) a : 
//  (ϵ (¬ (p a)) → ϵ ⊥) → ϵ (¬ (existstype p)) → ϵ ⊥;
//
//symbol Rnotalltype (p : (Type → Prop)) : 
//  (Π (a : Type), ϵ (¬ (p a)) → ϵ ⊥) → ϵ (¬ (foralltype p)) → ϵ ⊥;
//
//symbol Rsubst a (p : (τ a → Prop)) (t1 t2 : τ a) :
//  (ϵ (¬ (t1 = t2)) → ϵ ⊥) → (ϵ (p t2) → ϵ ⊥) → ϵ (p t1) → ϵ ⊥;
//
//symbol Rconglr a (p : (τ a → Prop)) (t1 t2 : τ a) :
//  (ϵ (p t2) → ϵ ⊥) → ϵ (p t1) → ϵ (t1 = t2) → ϵ ⊥;
//
//symbol Rcongrl a (p : (τ a → Prop)) (t1 t2 : τ a) :
//  (ϵ (p t2) → ϵ ⊥) → ϵ (p t1) → ϵ (t2 = t1) → ϵ ⊥;
//