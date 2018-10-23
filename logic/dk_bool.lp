require logic.cc as cc
// Bool 
// Declaration 
symbol const bool : cc.uT
symbol const Bool : TYPE
rule cc.eT bool → Bool

// Constructors 
symbol const true : Bool
symbol const false : Bool

// Pattern-matching 
symbol match :
  ∀ (P : Bool ⇒ cc.uT),
  cc.eT (P true) ⇒
  cc.eT (P false) ⇒
  ∀ (b : Bool),
  cc.eT (P b)

rule match _ &Ht _ true → &Ht
rule match _ _ &Hf false → &Hf

// Operations 
// polymorphic if .. then .. else .. 
symbol ite :
  ∀ (A : cc.uT),
  Bool ⇒
  cc.eT A ⇒
  cc.eT A ⇒
  cc.eT A

rule ite &A &b &x &y
      →
    match (λ (b : Bool), &A) &x &y &b

symbol match__true :
  Bool ⇒
  ∀ (A : cc.uT),
  cc.eT A ⇒
  cc.eT A ⇒
  cc.eT A

rule match__true &b &A &t &e → ite &A &b &t &e

symbol match__false :
  Bool ⇒
  ∀ (A : cc.uT),
  cc.eT A ⇒
  cc.eT A ⇒
  cc.eT A

rule match__false &b &A &t &e → ite &A &b &e &t

// boolean if .. then .. else .. 
definition iteb : Bool ⇒ Bool ⇒ Bool ⇒ Bool
     ≔ ite bool

// negation 
symbol not : Bool ⇒ Bool
rule not true → false
rule not false → true
rule not (not &b) → &b

// binary operators 
symbol {|and|} : Bool ⇒ Bool ⇒ Bool

rule {|and|} &b true → &b
rule {|and|} true &b → &b
rule {|and|} _ false → false
rule {|and|} false _ → false

symbol or : Bool ⇒ Bool ⇒ Bool
rule or _ true → true
rule or true _ → true
rule or &b false → &b
rule or false &b → &b

symbol xor : Bool ⇒ Bool ⇒ Bool
rule xor &b true → not &b
rule xor true &b → not &b
rule xor &b false → &b
rule xor false &b → &b

symbol imp : Bool ⇒ Bool ⇒ Bool
rule imp _ true → true
rule imp true &b → &b
rule imp &b false → not &b
rule imp false _ → true

symbol eqv : Bool ⇒ Bool ⇒ Bool
rule eqv &b true → &b
rule eqv true &b → &b
rule eqv &b false → not &b
rule eqv false &b → not &b

// Associativity 

rule {|and|} &b1 ({|and|} &b2 &b3) → {|and|} ({|and|} &b1 &b2) &b3
rule or &b1 (or &b2 &b3) → or (or &b1 &b2) &b3
rule xor &b1 (xor &b2 &b3) → xor (xor &b1 &b2) &b3

// Distributivity 

rule {|and|} &b1 (or &b2 &b3) → or ({|and|} &b1 &b2) ({|and|} &b1 &b3)
rule {|and|} (or &b1 &b2) &b3 → or ({|and|} &b1 &b3) ({|and|} &b2 &b3)


rule not ({|and|} &b1 &b2) → or (not &b1) (not &b2)

rule not (or &b1 &b2) → {|and|} (not &b1) (not &b2)

rule not (xor &b1 &b2) → eqv (not &b1) (not &b2)

rule not (eqv &b1 &b2) → xor (not &b1) (not &b2)
