// Logic for Zenon Modulo


set declared "τ"
set declared "ι"
set declared "ϵ"
set declared "⊤"
set declared "⊥"
set declared "¬"
set declared "∀"
set declared "∃"

symbol prop  : TYPE
symbol Type  : TYPE

injective symbol ϵ : prop → TYPE
injective symbol τ : Type → TYPE

symbol arrow : Type → Type → Type
constant symbol ι  : Type

// Symbols

symbol ⊤ : prop
symbol ⊥ : prop

symbol ¬ : prop → prop
symbol {|and|} : prop → prop → prop
symbol or  : prop → prop → prop
symbol imp : prop → prop → prop
symbol eqv : prop → prop → prop

set infix right 5 "⇒" ≔ imp
set infix right 10 "∧" ≔ {|and|}
set infix right 9 "∨" ≔ or
set infix left 10 "⇔" ≔ eqv

constant symbol select : Π (a : Type), τ a

symbol ∀ {a} : (τ a → prop) → prop
symbol ∃ {a} : (τ a → prop) → prop

symbol foralltype : (Type → prop) → prop
symbol existstype : (Type → prop) → prop

symbol equal      : Π (a : Type), τ a → τ a → prop

symbol seq : TYPE

// LLproof Deduction Rules

// Rfalse

symbol Rfalse : ϵ ⊥ → seq

// Rnottrue

symbol Rnottrue : ϵ (¬ ⊤) → seq

// Raxiom

symbol Raxiom : Π (p : prop), ϵ p → ϵ (¬ p) → seq

// Rnoteq

symbol Rnoteq : Π (a : Type) (t : τ a), ϵ (¬ (equal a t t)) → seq

// Reqsym

symbol Reqsym : Π (a : Type) (t : τ a) (u : τ a),
             ϵ (equal a t u) →
             ϵ (¬ (equal a u t)) →
             seq

// Rcut

symbol Rcut : Π (p : prop),
           (ϵ p → seq) →
           (ϵ (¬ p) → seq) →
           seq

// Rnotnot

symbol Rnotnot : Π (p : prop),
              (ϵ p → seq) →
              ϵ (¬ (¬ p)) →
              seq

// Rand

symbol Rand : Π (p : prop)
           (q : prop),
           (ϵ p → ϵ q → seq) →
           ϵ ({|and|} p q) →
           seq

// Ror

symbol Ror : Π (p : prop)
          (q : prop),
          (ϵ p → seq) →
          (ϵ q → seq) →
          ϵ (or p q) →
          seq

// Rimply

symbol Rimply : Π (p : prop)
             (q : prop),
             (ϵ (¬ p) → seq) →
             (ϵ q → seq) →
             ϵ (imp p q) →
             seq

// Requiv

symbol Requiv : Π (p : prop)
             (q : prop),
             (ϵ (¬ p) → ϵ (¬ q) → seq) →
             (ϵ p → ϵ q → seq) →
             ϵ (eqv p q) →
             seq

// Rnotand

symbol Rnotand : Π (p : prop) (q : prop),
              (ϵ (¬ p) → seq) →
              (ϵ (¬ q) → seq) →
              ϵ (¬ ({|and|} p q)) →
              seq

// Rnotor

symbol Rnotor : Π (p : prop)
               (q : prop),
             (ϵ (¬ p) → ϵ (¬ q) → seq) →
             ϵ (¬ (or p q)) →
             seq

// Rnotimply

symbol Rnotimply : Π (p : prop)
                  (q : prop),
                (ϵ p → ϵ (¬ q) → seq) →
                ϵ (¬ (imp p q)) →
                seq

// Rnotequiv

symbol Rnotequiv :Π (p : prop)
                    (q : prop),
                (ϵ (¬ p) → ϵ q → seq) →
                (ϵ p → ϵ (¬ q) → seq) →
                ϵ (¬ (eqv p q)) →
                seq

// Rex

symbol Rex : Π (a : Type)
               (p : (τ a → prop)),
          (Π (t : τ a), ϵ (p t) → seq) →
          ϵ (∃ p) →
          seq

// Rall

symbol Rall : Π (a : Type)
                (p : (τ a → prop))
                (t : τ a),
           (ϵ (p t) → seq) →
           ϵ (@∀ a p) →
           seq

// Rnotex
symbol Rnotex : Π (a : Type)
                  (p : (τ a → prop))
                  (t : τ a),
             (ϵ (¬ (p t)) → seq) →
             ϵ (¬ (∃ p)) →
             seq

// Rnotall

symbol Rnotall : Π (a : Type)
                   (p : (τ a → prop)),
              (Π (t : τ a), ϵ (¬ (p t)) → seq) →
              ϵ (¬ (@∀ a p)) →
              seq

// Rextype

symbol Rextype : Π (p : (Type → prop)),
              ( Π (a : Type), ϵ (p a) → seq) →
              ϵ (existstype p) →
              seq

// Ralltype

symbol Ralltype : Π (p : (Type → prop))
                    (a : Type),
               (ϵ (p a) → seq) →
               ϵ (foralltype p) →
               seq

// Rnotextype

symbol Rnotextype : Π (p : (Type → prop))
                      (a : Type),
                 (ϵ (¬ (p a)) → seq) →
                 ϵ (¬ (existstype p)) →
                 seq

// Rnotalltype

symbol Rnotalltype :  Π (p : (Type → prop)),
                   (Π (a : Type), ϵ (¬ (p a)) → seq) →
                   ϵ (¬ (foralltype p)) →
                   seq

// Rsubst

symbol Rsubst : Π (a : Type)
                  (p : (τ a → prop))
                  (t1 : τ a)
                  (t2 : τ a),
             (ϵ (¬ (equal a t1 t2)) → seq) →
             (ϵ (p t2) → seq) →
             ϵ (p t1) →
             seq

symbol Rconglr :Π (a : Type)
                  (p : (τ a → prop))
                  (t1 : τ a)
                  (t2 : τ a),
              (ϵ (p t2) → seq) →
              ϵ (p t1) →
              ϵ (equal a t1 t2) →
              seq

symbol Rcongrl : Π (a : Type)
                  (p : (τ a → prop))
                  (t1 : τ a)
                  (t2 : τ a),
              (ϵ (p t2) → seq) →
              ϵ (p t1) →
              ϵ (equal a t2 t1) →
              seq

// Proofs of these rules in the logic of Focalide

// rule Type  ↪ cc.uT
// rule τ  ↪ cc.eT
// rule arrow ↪ cc.Arrow
// rule prop  ↪ dk_logic.Prop
// rule ϵ ↪ dk_logic.eP

// rule ⊤       ↪ dk_logic.⊤
// rule ⊥      ↪ dk_logic.⊥
// rule ¬        ↪ dk_logic.¬
// rule{|and|}       ↪ dk_logic.{|and|}
// rule or         ↪ dk_logic.or
// rule imp        ↪ dk_logic.imp
// rule eqv        ↪ dk_logic.eqv
// rule @∀     ↪ dk_logic.forall
// rule exists     ↪ dk_logic.exists
// rule foralltype ↪ dk_logic.forall_type
// rule existstype ↪ dk_logic.exists_type
// rule equal      ↪ dk_logic.equal

rule seq ↪ ϵ ⊥
rule ϵ ⊥ ↪ Π (p : prop), ϵ p
rule ϵ (¬ $p) ↪ ϵ $p → ϵ ⊥
rule ϵ ⊤ ↪ Π (p : prop), ϵ p → ϵ p
rule ϵ (imp $p $q) ↪ ϵ $p → ϵ $q
rule ϵ (or $p $q) ↪ Π(x:prop), (ϵ $p → ϵ x) → (ϵ $q → ϵ x) → ϵ x
rule ϵ (eqv $p $q) ↪ Π(x:prop), (ϵ (imp $p $q) → ϵ (imp $q $p) → ϵ x) → ϵ x
rule ϵ (equal $a $t $v) ↪ Π(x:τ $a → prop), ϵ (x $t) → ϵ (x $v)
rule ϵ ({|and|} $p $q) ↪ Π(x:prop), (ϵ $p → ϵ $q → ϵ x) → ϵ x
rule ϵ (@∃ $a $p) ↪ Π(P:prop), (Π(x : τ $a), ϵ ($p x) → ϵ P) → ϵ P
rule ϵ (@∀ $a $p) ↪ Π(x : τ $a), ϵ ($p x)

// Law of eXcluded Middle

constant symbol xmid       : Π (p : prop) (z : prop),
	     (ϵ p → ϵ z) →
	     (ϵ (¬ p) → ϵ z) →
	     ϵ z

definition nnpp (p : prop) : ϵ (¬ (¬ p)) → ϵ p ≔
    λ (H1 : ϵ (¬ (¬ p))),
      xmid p p
	    (λ (H2 : ϵ p),
        H2)
	    (λ (H3 : ϵ (¬ p)),
	        H1 H3 p)

// usefull lemmas to prove rules

definition true_intro : ϵ ⊤
             ≔ λ (p : prop) (x : ϵ p), x

definition lemme_contraposition (p : prop)
                      (q : prop)
: (ϵ (imp p q) →
   ϵ (imp (¬ q) (¬ p)))
≔
  λ (H1 : ϵ (imp p q))
  (H2 : ϵ (¬ q))
     (H3 : ϵ p),
	H2 (H1 H3)

definition lemme_equiv_1 (p : prop)
	       (q : prop)
	       (H5 : ϵ q → ϵ p)
	       (H2 : ϵ p → ϵ (¬ q))
	       (HQ : ϵ q)
: ϵ (¬ q)
≔
  H2 (H5 HQ)

definition lemme_equiv_2 (p : prop)
 	       (q : prop)
	       (H5 : ϵ q → ϵ p)
	       (H2 : ϵ p → ϵ (¬ q))
: ϵ (¬ q)
≔
  λ (HQ : ϵ q), lemme_equiv_1 p q H5 H2 HQ HQ

definition lemme_equiv_3 (p : prop)
	       (q : prop)
	       (H5 : ϵ q → ϵ p)
	       (H2 : ϵ p → ϵ (¬ q))
	       (H4 : ϵ p → ϵ q)
: ϵ (¬ p)
≔
  lemme_contraposition p q H4 (lemme_equiv_2 p q H5 H2)

definition lemme_equiv_4 (p : prop)
	       (q : prop)
	       (H5 : ϵ q → ϵ p)
	       (H2 : ϵ p → ϵ (¬ q))
	       (H4 : ϵ p → ϵ q)
	       (H1 : ϵ (¬ p) → ϵ (¬ (¬ q)))
: ϵ (¬ (¬ q))
≔
  H1 (lemme_equiv_3 p q H5 H2 H4)

definition lemme_notor_1 (p : prop)
	       (q : prop)
: ϵ p → ϵ (or p q)
≔
  λ (H1 : ϵ p)
    (z : prop)
    (H2 : (ϵ p → ϵ z))
	  (H3 : (ϵ q → ϵ z)),
	   H2 H1

definition lemme_notor_2 (p : prop)
	       (q : prop)
: ϵ q → ϵ (or p q)
≔
  λ (H1 : ϵ q)
    (z : prop)
    (H2 : (ϵ p → ϵ z))
	  (H3 : (ϵ q → ϵ z)),
	   H3 H1

definition lemme_notor_3 (p : prop)
	       (q : prop)
	       (H2 : ϵ (¬ (or p q)))
: ϵ (¬ p)
≔
  lemme_contraposition p (or p q) (lemme_notor_1 p q) H2

definition lemme_notor_4 (p : prop)
	       (q : prop)
	       (H2 : ϵ (¬ (or p q)))
: ϵ (¬ q)
≔
  lemme_contraposition q (or p q) (lemme_notor_2 p q) H2

definition lemme_notimply_1 (p : prop)
	          (q : prop)
	          (H2 : ϵ (¬ (imp p q)))
: ϵ (¬ q)
≔
  λ (H3 : ϵ q),
  H2 (λ (H4 : ϵ p), H3)

definition lemme_notimply_2 (p : prop)
	          (q : prop)
	          (H1 : ϵ p → ϵ (¬ (¬ q)))
	          (H2 : ϵ (¬ (imp p q)))
: ϵ (¬ p)
≔
  λ (H3 : ϵ p),
    (H1 H3) (lemme_notimply_1 p q H2)

definition lemme_notimply_3 (p : prop)
	          (q : prop)
	          (H3 : ϵ (¬ p))
: ϵ (imp p q)
≔
  λ (H4 : ϵ p), H3 H4 q

definition lemme_notequiv_1 (p : prop)
                  (q : prop)
                  (H2 : ϵ p → ϵ (¬ (¬ q)))
                  (H3 : ϵ (¬ (eqv p q)))
: ϵ (¬ p)
≔
  λ (HP : ϵ p),
    H2 HP (λ (HQ : ϵ q),
              H3 (λ (z : prop)
                    (H4 : (ϵ (imp p q) →
                            ϵ (imp q p) →
                            ϵ z)),
                      H4 (λ (__ : ϵ p), HQ) (λ (__ : ϵ q), HP)))

// ϵs of LLϵ Rules

rule Rfalse ↪ λ (x : ϵ ⊥), x

rule Rnottrue ↪ λ (H : ϵ (¬ ⊤)), H true_intro

rule Raxiom $p ↪ λ (H : ϵ $p) (CH : ϵ (¬ $p)), CH H

rule Rnoteq $a $t ↪
  λ (H1 : ϵ (¬ (equal $a $t $t))),
     H1 (λ (z : (τ $a → prop)),
	     (λ (H2 : ϵ (z $t)),
	          H2))

rule Reqsym $a $t $u ↪
  λ (H1 : ϵ (equal $a $t $u))
    (H2 : ϵ (¬ (equal $a $u $t))),
     H2 (λ (z : (τ $a → prop))
	         (H3 : ϵ (z $u)),
	            H1 (λ (x : τ $a),
		            (imp (z x) (z $t)))
		     (λ (H4 : ϵ (z $t)),
		      H4)
		     H3)

rule Rcut $p ↪
  λ (H1 : (ϵ $p → ϵ ⊥))
    (H2 : (ϵ (¬ $p) → ϵ ⊥)),
     H2 H1

rule Rnotnot $p ↪
  λ (H1 : (ϵ $p → ϵ ⊥))
    (H2 : ϵ (¬ (¬ $p))),
     H2 H1

rule Rand $p $q ↪
  λ (H1 : (ϵ $p → ϵ $q → ϵ ⊥))
    (H2 : ϵ ({|and|} $p $q)),
     H2 ⊥ H1

rule Ror $p $q ↪
  λ (H1 : (ϵ $p → ϵ ⊥))
    (H2 : (ϵ $q → ϵ ⊥))
    (H3 : ϵ (or $p $q)),
	   H3 ⊥ H1 H2

rule Rimply $p $q ↪
  λ (H1 : (ϵ (¬ $p) → ϵ ⊥))
    (H2 : (ϵ $q → ϵ ⊥))
    (H3 : ϵ (imp $p $q)),
     H1 (lemme_contraposition $p $q H3 H2)

rule Requiv $p $q ↪
  λ (H1 : (ϵ (¬ $p) → ϵ (¬ $q) → ϵ ⊥))
    (H2 : (ϵ $p → ϵ $q → ϵ ⊥))
    (H3 : ϵ (eqv $p $q)),
	   H3 ⊥
             (λ (H4 : (ϵ $p → ϵ $q))
	              (H5 : (ϵ $q → ϵ $p)),
		  lemme_equiv_4 $p $q H5 H2 H4 H1 (lemme_equiv_2 $p $q H5 H2))

rule Rnotand $p $q ↪
  λ (H1 : (ϵ (¬ $p) → ϵ ⊥))
    (H2 : (ϵ (¬ $q) → ϵ ⊥))
    (H3 : ϵ (¬ ({|and|} $p $q))),
	  H1 (λ (H5 : ϵ $p),
               H2 (λ (H6 : ϵ $q),
                   H3 (λ (z : prop),
                       (λ (H4 : (ϵ $p → ϵ $q → ϵ z)),
                        H4 H5 H6))))

rule Rnotor $p $q ↪
  λ (H1 : (ϵ (¬ $p) → ϵ (¬ $q) → ϵ ⊥))
    (H2 : ϵ (¬ (or $p $q))),
     H1 (lemme_notor_3 $p $q H2) (lemme_notor_4 $p $q H2)

// [p : prop, q : prop] Rnotimply p q ↪
//   H1 : (ϵ p → ϵ (¬ q) → ϵ ⊥)
//   => H2 : ϵ (¬ (imp p q))
//      => H2 (lemme_notimply_3 p q (lemme_notimply_2 p q H1 H2)).

// def Rnotimplytest : p : prop →
//                 q : prop →
//                 (ϵ p → ϵ (¬ q) → seq) →
//                 ϵ (¬ (imp p q)) →
//                 seq.

// def Rnotimplytesttwo : p : prop →
//                 q : prop →
//                 (ϵ p → ϵ (¬ q) → seq) →
//                 ϵ (¬ (imp p q)) →
//                 seq.

// [p : prop, q : prop] Rnotimplytest p q ↪
//   H1 : (ϵ p → ϵ (¬ q) → ϵ ⊥)
//   => H2 : ϵ (¬ (imp p q))
//      => H2 (lemme_notimply_3 p q
//                             (H4 : ϵ p
//                              => (H1 H4)
//                                 (H5 : ϵ q
//                                   => H2 (H6 : ϵ p
// 	                                  => H5))) ).

rule Rnotimply $p $q ↪
  λ (H1 : (ϵ $p → ϵ (¬ $q) → ϵ ⊥))
    (H2 : ϵ (¬ (imp $p $q))),
     H2 (λ (H3 : ϵ $p),
            (H1 H3) (λ (H4 : ϵ $q),
                        H2 (λ (H5 : ϵ $p),
                               H4)) $q)


rule Rnotequiv $p $q ↪
  λ (H1 : (ϵ (¬ $p) → ϵ (¬ $q)))
    (H2 : (ϵ $p → ϵ (¬ (¬ $q))))
    (H3 : ϵ (¬ (eqv $p $q))),
    (λ (HNP : ϵ (¬ $p)),
            H3 (λ (z : prop)
                  (H4 : (ϵ (imp $p $q) → ϵ (imp $q $p) → ϵ z)),
                      H4 (λ (HP : ϵ $p), HNP HP $q)
                            (λ (HQ : ϵ $q), H1 HNP HQ $p)))
           (lemme_notequiv_1 $p $q H2 H3)

rule Rex $a $p ↪
  λ (H1 : (Π (t : τ $a), ϵ ($p t) → ϵ ⊥))
    (H2 : ϵ (@∃ $a $p)),
     H2 ⊥ H1

rule Rall $a $p $t ↪
  λ (H1 : (ϵ ($p $t) → ϵ ⊥))
    (H2 : ϵ (@∀ $a $p)),
     H1 (H2 $t)

rule Rnotex $a $p $t ↪
  λ (H1 : (ϵ (¬ ($p $t)) → ϵ ⊥))
    (H2 : ϵ (¬ (@∃ $a $p))),
     H1 (λ (H4 : ϵ ($p $t)),
            H2 (λ (z : prop)
		              (H3 : (Π (x : τ $a), ϵ ($p x) → ϵ z)),
		      H3 $t H4))

rule Rnotall $a $p ↪
  λ (H1 : (Π(t : τ $a), ϵ (¬ ($p t)) → ϵ ⊥))
    (H2 : ϵ (¬ (@∀ $a $p))),
     H2 (λ (t : τ $a),
	       nnpp ($p t) (H1 t))

// rule Rextype $p ↪
  // λ (H1 : (Π (a : Type), ϵ ($p a) → ϵ ⊥))
    // (H2 : ϵ (existstype $p)),
    // H2 ⊥ H1

// rule Ralltype $p $a ↪
  // λ (H1 : (ϵ ($p $a) → ϵ ⊥))
    // (H2 : ϵ (foralltype $p)),
    //  H1 (H2 $a)

// rule Rnotextype $p $a ↪
  // λ (H1 : (ϵ (¬ ($p $a)) → ϵ ⊥))
    // (H2 : ϵ (¬ (existstype $p))),
     // H1 (λ (H4 : ϵ ($p $a)),
            // (H2 (λ (z : prop)
		            // (H3 : (Π (b : Type), ϵ ($p b) → ϵ z)),
		             // H3 $a H4)))

// rule Rnotalltype $p ↪
  // λ (H1 : (Π (a : Type), ϵ (¬ ($p a)) → ϵ ⊥))
    // (H2 : ϵ (¬ (foralltype $p))),
    // H2 (λ (a : Type),
	       // nnpp ($p a) (H1 a))

rule Rsubst $a $p $t1 $t2 ↪
  λ (H1 : (ϵ (¬ (equal $a $t1 $t2)) → ϵ ⊥))
    (H2 : (ϵ ($p $t2) → ϵ ⊥))
    (H3 : ϵ ($p $t1)),
	   H1 (λ (H4 : ϵ (equal $a $t1 $t2)),
            H2 (H4 $p H3))
