require logic.cc as cc
require logic.dk_bool as dk_bool

// Impredicative prop 

symbol const prop : cc.uT
symbol const Prop : TYPE
rule cc.eT prop → Prop
symbol ebP : cc.eT dk_bool.bool ⇒ Prop

symbol const imp : Prop ⇒ Prop ⇒ Prop
symbol const forall_type : (cc.uT ⇒ Prop) ⇒ Prop
symbol const forall : ∀ (A : cc.uT), (cc.eT A ⇒ Prop) ⇒ Prop

symbol eeP : Prop ⇒ cc.uT
definition eP : Prop ⇒ TYPE
   ≔ λ (f : Prop), cc.eT (eeP f)
rule
    eeP (imp &f1 &f2)
      →
    cc.Arrow (eeP &f1) (eeP &f2)

rule
    eeP (forall &A &f)
      →
    cc.Pi &A (λ (x : cc.eT &A), eeP (&f x))

rule
    eeP (forall_type &f)
      →
    cc.PiT (λ (x : cc.uT), eeP (&f x))

definition True : Prop ≔ forall prop (λ (P : Prop), imp P P)
definition False : Prop ≔ forall prop (λ (P : Prop),  P)
definition not (f : Prop) : Prop ≔ imp f False
definition {|and|} (A : Prop) (B : Prop) : Prop ≔
  forall prop (λ (P : Prop), imp (imp A (imp B P)) P)
definition or  (A : Prop) (B : Prop) : Prop ≔
  forall prop (λ (P : Prop), imp (imp A P) (imp (imp B P) P))
definition eqv (A : Prop) (B : Prop) : Prop ≔
  {|and|} (imp A B) (imp B A)

definition exists (A : cc.uT) (f : cc.eT A ⇒ Prop) : Prop ≔
  forall prop (λ (P : Prop), imp (forall A (λ (x : cc.eT A), imp (f x) P)) P)
definition forallc (A : cc.uT) (f : cc.eT A ⇒ Prop) : Prop ≔
  not (not (forall A (λ (x : cc.eT A), not (not (f x)))))
definition existsc (A : cc.uT) (f : cc.eT A ⇒ Prop) : Prop ≔
  not (not (exists A (λ (x : cc.eT A),not (not (f x)))))

definition exists_type (f : cc.uT ⇒ Prop) : Prop
≔ forall prop (λ (z : Prop),
                (imp (forall_type (λ (a : cc.uT),
                                   imp (f a) z))
                     z))


definition TrueT : TYPE ≔ eP True
definition FalseT : TYPE ≔ eP False
symbol const I : TrueT
symbol const False_elim : ∀ (A : cc.uT), FalseT ⇒ cc.eT A

symbol Istrue : dk_bool.Bool ⇒ TYPE
rule Istrue &b → eP (ebP &b)

definition and_intro  (f1 : Prop)
              (f2 : Prop)
              (H1 : eP f1)
              (H2 : eP f2)
              : eP ({|and|} f1 f2)
    ≔ λ 
        (f3 : Prop)
        (H3 : (eP f1 ⇒ eP f2 ⇒ eP f3)),
       H3 H1 H2

definition and_elim1 (f1 : Prop)
              (f2 : Prop)
              (H3 : eP ({|and|} f1 f2))
              : eP f1 
    ≔ H3 f1 (λ (H1 : eP f1)  (H2 : eP f2), H1)

definition and_elim2 (f1 : Prop)
              (f2 : Prop)
              (H3 : eP ({|and|} f1 f2))
              : eP f2
    ≔ H3 f2 (λ (H1 : eP f1) (H2 : eP f2), H2)

definition or_intro1 (f1 : Prop)
              (f2 : Prop)
              (H1 : eP f1)
              : eP (or f1 f2)
    ≔ λ (f3 : Prop) 
       (H13 : (eP f1 ⇒ eP f3))
       (H23 : (eP f2 ⇒ eP f3)), 
       H13 H1

definition or_intro2  (f1 : Prop)
              (f2 : Prop)
              (H2 : eP f2)
              : eP (or f1 f2)
    ≔ λ (f3 : Prop),
       λ (H13 : (eP f1 ⇒ eP f3)),
       λ (H23 : (eP f2 ⇒ eP f3)),
       H23 H2

definition or_elim (f1 : Prop)
            (f2 : Prop)
            (f3 : Prop)
            (H3 : eP (or f1 f2))
            (H13 : eP (imp f1 f3))
            (H23 : eP (imp f2 f3))
            : eP f3
    ≔ H3 f3 H13 H23

definition eqv_intro ≔ λ (f1 : Prop)
                 (f2 : Prop),
                 and_intro (imp f1 f2) (imp f2 f1)
definition eqv_elim1 ≔ λ (f1 : Prop)
                 (f2 : Prop),
                 and_elim1 (imp f1 f2) (imp f2 f1)
definition eqv_elim2 ≔ λ (f1 : Prop)
                 (f2 : Prop),
                 and_elim2 (imp f1 f2) (imp f2 f1)

rule ebP dk_bool.true → True
rule ebP dk_bool.false → False

// equality 
definition equal : ∀ (A : cc.uT) (x : cc.eT A) (y : cc.eT A), Prop
      ≔ λ (A : cc.uT) (x : cc.eT A) (y : cc.eT A),
                                     forall (cc.Arrow A prop)
                                            (λ (H : (cc.eT A ⇒ Prop)), 
                                             imp (H x) (H y))

definition equalc (A : cc.uT) (x : cc.eT A) (y : cc.eT A) : Prop ≔
  not (not (equal A x y))

definition refl : ∀ (A : cc.uT) (x : cc.eT A), eP (equal A x x)
     ≔ λ (A : cc.uT) (x : cc.eT A) 
                     (H : (cc.eT A ⇒ Prop))
                     (px : eP (H x)), px

definition equal_ind : ∀ (A : cc.uT)
            (H : (cc.eT A ⇒ Prop))
            (x : cc.eT A)
            (y : cc.eT A)
            , eP (equal A x y) ⇒
            eP (H x) ⇒
            eP (H y)
          ≔
            λ (A : cc.uT)
            (P : (cc.eT A ⇒ Prop))
            (x : cc.eT A)
            (y : cc.eT A)
            (eq: eP (equal A x y)),
            eq P

definition equal_sym : ∀ (A : cc.uT)
            (x : cc.eT A)
            (y : cc.eT A),
            eP (equal A x y) ⇒
            eP (equal A y x)
          ≔
            λ (A : cc.uT)
            (x : cc.eT A)
            (y : cc.eT A)
            (eq : eP (equal A x y)),
            equal_ind
              A
              (λ (z : cc.eT A), equal A z x)
              x
                y
                eq
                (refl A x)

definition equal_congr : ∀
  (A : cc.uT)
  (B : cc.uT)
  (f : (cc.eT A ⇒ cc.eT B))
  (x : cc.eT A)
  (y : cc.eT A),
  eP (equal A x y) ⇒
  eP (equal B (f x) (f y))
  ≔ λ
    (A : cc.uT)
    (B : cc.uT)
    (f : (cc.eT A ⇒ cc.eT B))
    (x : cc.eT A)
    (y : cc.eT A)
    (H : eP (equal A x y)),
    equal_ind A (λ (z : cc.eT A), equal B (f x) (f z)) x y H (refl B (f x))
