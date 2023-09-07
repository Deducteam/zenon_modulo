// Logic for Zenon Modulo


set declared "τ"
set declared "ι"
set declared "π"
set declared "⊤"
set declared "⊥"
set declared "¬"
set declared "∀"
set declared "∃"

symbol Prop  : TYPE
symbol Type  : TYPE

injective symbol π : Prop → TYPE
injective symbol τ : Type → TYPE

constant symbol ι  : Type

// Symbols

symbol ⊤ : Prop
symbol ⊥ : Prop

symbol ¬ : Prop → Prop
symbol {|and|} : Prop → Prop → Prop
symbol or  : Prop → Prop → Prop
symbol imp : Prop → Prop → Prop
symbol eqv : Prop → Prop → Prop

set infix right 5 "⇒" ≔ imp
set infix right 10 "∧" ≔ {|and|}
set infix right 9 "∨" ≔ or
set infix left 10 "⇔" ≔ eqv

constant symbol select : Π (a : Type), τ a

symbol ∀ {a} : (τ a → Prop) → Prop
symbol ∃ {a} : (τ a → Prop) → Prop

set quantifier ∀
set quantifier ∃

symbol foralltype : (Type → Prop) → Prop
symbol existstype : (Type → Prop) → Prop

symbol equal  {a} : τ a → τ a → Prop
set infix 12 "=" ≔ equal

symbol Rfalse : π ⊥ → π ⊥

symbol Rnottrue : π (¬ ⊤) → π ⊥

symbol Raxiom : Π (p : Prop), π p → π (¬ p) → π ⊥

symbol Rnoteq : Π (a : Type) (t : τ a), π (¬ (t = t)) → π ⊥

symbol Reqsym a (t u : τ a) : π (t = u) → π (¬ (u = t)) → π ⊥

symbol Rcut p : (π p → π ⊥) → (π (¬ p) → π ⊥) → π ⊥

symbol Rnotnot p : (π p → π ⊥) → π (¬ (¬ p)) → π ⊥

symbol Rand p q : (π p → π q → π ⊥) → π (p ∧ q) → π ⊥

symbol Ror p q : (π p → π ⊥) → (π q → π ⊥) → π (p ∨ q) → π ⊥

symbol Rimply p q :  (π (¬ p) → π ⊥) → (π q → π ⊥) → π (p ⇒ q) → π ⊥

symbol Requiv p q : 
  (π (¬ p) → π (¬ q) → π ⊥) → (π p → π q → π ⊥) → π (p ⇔ q) → π ⊥

symbol Rnotand p q : 
  (π (¬ p) → π ⊥) → (π (¬ q) → π ⊥) → π (¬ (p ∧ q)) → π ⊥

symbol Rnotor p q : (π (¬ p) → π (¬ q) → π ⊥) → π (¬ (or p q)) → π ⊥

symbol Rnotimply p q : (π p → π (¬ q) → π ⊥) → π (¬ (imp p q)) → π ⊥

symbol Rnotequiv p q :
  (π (¬ p) → π q → π ⊥) → (π p → π (¬ q) → π ⊥) → π (¬ (p ⇔ q)) → π ⊥

symbol Rex a p : (Π (t : τ a), π (p t) → π ⊥) → π (∃ p) → π ⊥

symbol Rall a p t : (π (p t) → π ⊥) → π (@∀ a p) → π ⊥

symbol Rnotex a (p : (τ a → Prop)) (t : τ a) : 
  (π (¬ (p t)) → π ⊥) → π (¬ (∃ p)) → π ⊥

symbol Rnotall a p : (Π (t : τ a), π (¬ (p t)) → π ⊥) → π (¬ (@∀ a p)) → π ⊥

symbol Rextype (p : (Type → Prop)) : 
  (Π (a : Type), π (p a) → π ⊥) → π (existstype p) → π ⊥

symbol Ralltype (p : (Type → Prop)) a :
  (π (p a) → π ⊥) → π (foralltype p) → π ⊥

symbol Rnotextype (p : (Type → Prop)) a : 
  (π (¬ (p a)) → π ⊥) → π (¬ (existstype p)) → π ⊥

symbol Rnotalltype (p : (Type → Prop)) : 
  (Π (a : Type), π (¬ (p a)) → π ⊥) → π (¬ (foralltype p)) → π ⊥

symbol Rsubst a (p : (τ a → Prop)) (t1 t2 : τ a) :
  (π (¬ (t1 = t2)) → π ⊥) → (π (p t2) → π ⊥) → π (p t1) → π ⊥

symbol Rconglr a (p : (τ a → Prop)) (t1 t2 : τ a) :
  (π (p t2) → π ⊥) → π (p t1) → π (t1 = t2) → π ⊥

symbol Rcongrl a (p : (τ a → Prop)) (t1 t2 : τ a) :
  (π (p t2) → π ⊥) → π (p t1) → π (t2 = t1) → π ⊥

// rule π ⊥ ↪ Π p, π p
rule π (¬ $p) ↪ π $p → π ⊥
rule π ⊤ ↪ Π p, π p → π p
rule π (imp $p $q) ↪ π $p → π $q
rule π (or $p $q) ↪ Π x, (π $p → π x) → (π $q → π x) → π x
rule π (eqv $p $q) ↪ Π x, (π (imp $p $q) → π (imp $q $p) → π x) → π x
rule π (@equal $a $t $v) ↪ Π(x:τ $a → Prop), π (x $t) → π (x $v)
rule π ({|and|} $p $q) ↪ Π x, (π $p → π $q → π x) → π x
rule π (@∃ $a $p) ↪ Π P, (Π(x : τ $a), π ($p x) → π P) → π P
rule π (@∀ $a $p) ↪ Π x, π ($p x)


symbol nnpp (p : Prop) : π (¬ (¬ p)) → π p

rule nnpp (¬ $a) $pr $q ↪ $pr (λ H1, H1 $q)
rule nnpp (imp $a $b) $pr $q ↪ nnpp $b (λ H1, $pr (λ H2, H1 (H2 $q)))
rule nnpp (or $a $b) $pr $P $pa $pb ↪
  nnpp $P (λ H1 : π (¬ $P), $pr (λ H2, H1 (H2 $P $pa $pb)))
rule nnpp (eqv $a $b) $pr $P $pab ↪
  nnpp $P (λ H1 : π (¬ $P), $pr (λ H2, H1 (H2 $P $pab)))
rule nnpp (equal $t $v) $pr $P $pt ↪
  nnpp ($P $v) (λ H1 : π (¬ ($P $v)), $pr (λ H2, H1 (H2 $P $pt)))
rule nnpp ({|and|} $a $b) $pr $P $pab ↪
  nnpp $P (λ H1 : π (¬ $P), $pr (λ H2, H1 (H2 $P $pab)))
rule nnpp (∃ $a) $pr $P $paP ↪
  nnpp $P (λ H1 : π (¬ $P), $pr (λ H2, H1 (H2 $P $paP)))
rule nnpp (∀ $a) $pr $t ↪ nnpp ($a $t) (λ H1 : π (¬ ($a $t)), $pr (λ H2, H1 (H2 $t)))
rule nnpp ⊥ $pr ↪ $pr (λ z, z)
rule nnpp $a[] (λ H1, H1 (nnpp $a[] (λ H2, $K[H1;H2]))) ↪
  nnpp $a[] (λ H1, $K[H1;H1])
rule nnpp $a (λ H1, H1 $K[]) ↪ $K[]

definition bot (pr : π ⊥) (p : Prop) : π p ≔
  nnpp p (λ _, pr)

definition xmid (p z : Prop) (pp: π p → π z) (pnp : π (¬ p) → π z) : π z ≔
  nnpp z (λ H2, H2 (pp (nnpp p (λ H3, H2 (pnp H3)))))
  

// usefull lemmas to prove rules

definition true_intro : π ⊤
             ≔ λ (p : Prop) (x : π p), x

definition lemme_contraposition (p : Prop)
                      (q : Prop)
: (π (imp p q) →
   π (imp (¬ q) (¬ p)))
≔
  λ (H1 : π (imp p q))
  (H2 : π (¬ q))
     (H3 : π p),
	H2 (H1 H3)

definition lemme_equiv_1 (p : Prop)
	       (q : Prop)
	       (H5 : π q → π p)
	       (H2 : π p → π (¬ q))
	       (HQ : π q)
: π (¬ q)
≔
  H2 (H5 HQ)

definition lemme_equiv_2 (p : Prop)
 	       (q : Prop)
	       (H5 : π q → π p)
	       (H2 : π p → π (¬ q))
: π (¬ q)
≔
  λ (HQ : π q), lemme_equiv_1 p q H5 H2 HQ HQ

definition lemme_equiv_3 (p : Prop)
	       (q : Prop)
	       (H5 : π q → π p)
	       (H2 : π p → π (¬ q))
	       (H4 : π p → π q)
: π (¬ p)
≔
  lemme_contraposition p q H4 (lemme_equiv_2 p q H5 H2)

definition lemme_equiv_4 (p : Prop)
	       (q : Prop)
	       (H5 : π q → π p)
	       (H2 : π p → π (¬ q))
	       (H4 : π p → π q)
	       (H1 : π (¬ p) → π (¬ (¬ q)))
: π (¬ (¬ q))
≔
  H1 (lemme_equiv_3 p q H5 H2 H4)

definition lemme_notor_1 (p : Prop)
	       (q : Prop)
: π p → π (or p q)
≔
  λ (H1 : π p)
    (z : Prop)
    (H2 : (π p → π z))
	  (H3 : (π q → π z)),
	   H2 H1

definition lemme_notor_2 (p : Prop)
	       (q : Prop)
: π q → π (or p q)
≔
  λ (H1 : π q)
    (z : Prop)
    (H2 : (π p → π z))
	  (H3 : (π q → π z)),
	   H3 H1

definition lemme_notor_3 (p : Prop)
	       (q : Prop)
	       (H2 : π (¬ (or p q)))
: π (¬ p)
≔
  lemme_contraposition p (or p q) (lemme_notor_1 p q) H2

definition lemme_notor_4 (p : Prop)
	       (q : Prop)
	       (H2 : π (¬ (or p q)))
: π (¬ q)
≔
  lemme_contraposition q (or p q) (lemme_notor_2 p q) H2

definition lemme_notimply_1 (p : Prop)
	          (q : Prop)
	          (H2 : π (¬ (imp p q)))
: π (¬ q)
≔
  λ (H3 : π q),
  H2 (λ (H4 : π p), H3)

definition lemme_notimply_2 (p : Prop)
	          (q : Prop)
	          (H1 : π p → π (¬ (¬ q)))
	          (H2 : π (¬ (imp p q)))
: π (¬ p)
≔
  λ (H3 : π p),
    (H1 H3) (lemme_notimply_1 p q H2)

definition lemme_notimply_3 (p : Prop)
	          (q : Prop)
	          (H3 : π (¬ p))
: π (imp p q)
≔
  λ (H4 : π p), bot (H3 H4) q

definition lemme_notequiv_1 (p : Prop)
                  (q : Prop)
                  (H2 : π p → π (¬ (¬ q)))
                  (H3 : π (¬ (eqv p q)))
: π (¬ p)
≔
  λ (HP : π p),
    H2 HP (λ (HQ : π q),
              H3 (λ (z : Prop)
                    (H4 : (π (imp p q) →
                            π (imp q p) →
                            π z)),
                      H4 (λ (__ : π p), HQ) (λ (__ : π q), HP)))

// πs of LLπ Rules

rule Rfalse ↪ λ (x : π ⊥), x

rule Rnottrue ↪ λ (H : π (¬ ⊤)), H true_intro

rule Raxiom $p ↪ λ (H : π $p) (CH : π (¬ $p)), CH H

rule Rnoteq $a $t ↪
  λ (H1 : π (¬ ($t = $t))),
     H1 (λ (z : (τ $a → Prop)),
	     (λ (H2 : π (z $t)),
	          H2))

rule Reqsym $a $t $u ↪
  λ (H1 : π ($t = $u))
    (H2 : π (¬ ($u = $t))),
     H2 (λ (z : (τ $a → Prop))
	         (H3 : π (z $u)),
	            H1 (λ (x : τ $a),
		            (imp (z x) (z $t)))
		     (λ (H4 : π (z $t)),
		      H4)
		     H3)

rule Rcut $p ↪
  λ (H1 : (π $p → π ⊥))
    (H2 : (π (¬ $p) → π ⊥)),
     H2 H1

rule Rnotnot $p ↪
  λ (H1 : (π $p → π ⊥))
    (H2 : π (¬ (¬ $p))),
     H2 H1

rule Rand $p $q ↪
  λ (H1 : (π $p → π $q → π ⊥))
    (H2 : π ({|and|} $p $q)),
     H2 ⊥ H1

rule Ror $p $q ↪
  λ (H1 : (π $p → π ⊥))
    (H2 : (π $q → π ⊥))
    (H3 : π (or $p $q)),
	   H3 ⊥ H1 H2

rule Rimply $p $q ↪
  λ (H1 : (π (¬ $p) → π ⊥))
    (H2 : (π $q → π ⊥))
    (H3 : π (imp $p $q)),
     H1 (lemme_contraposition $p $q H3 H2)

rule Requiv $p $q ↪
  λ (H1 : (π (¬ $p) → π (¬ $q) → π ⊥))
    (H2 : (π $p → π $q → π ⊥))
    (H3 : π (eqv $p $q)),
	   H3 ⊥
             (λ (H4 : (π $p → π $q))
	              (H5 : (π $q → π $p)),
		  lemme_equiv_4 $p $q H5 H2 H4 H1 (lemme_equiv_2 $p $q H5 H2))

rule Rnotand $p $q ↪
  λ (H1 : (π (¬ $p) → π ⊥))
    (H2 : (π (¬ $q) → π ⊥))
    (H3 : π (¬ ({|and|} $p $q))),
	  H1 (λ (H5 : π $p),
               H2 (λ (H6 : π $q),
                   H3 (λ (z : Prop),
                       (λ (H4 : (π $p → π $q → π z)),
                        H4 H5 H6))))

rule Rnotor $p $q ↪
  λ (H1 : (π (¬ $p) → π (¬ $q) → π ⊥))
    (H2 : π (¬ (or $p $q))),
     H1 (lemme_notor_3 $p $q H2) (lemme_notor_4 $p $q H2)

// [p : Prop, q : Prop] Rnotimply p q ↪
//   H1 : (π p → π (¬ q) → π ⊥)
//   => H2 : π (¬ (imp p q))
//      => H2 (lemme_notimply_3 p q (lemme_notimply_2 p q H1 H2)).

// def Rnotimplytest : p : Prop →
//                 q : Prop →
//                 (π p → π (¬ q) → π ⊥) →
//                 π (¬ (imp p q)) →
//                 π ⊥.

// def Rnotimplytesttwo : p : Prop →
//                 q : Prop →
//                 (π p → π (¬ q) → π ⊥) →
//                 π (¬ (imp p q)) →
//                 π ⊥.

// [p : Prop, q : Prop] Rnotimplytest p q ↪
//   H1 : (π p → π (¬ q) → π ⊥)
//   => H2 : π (¬ (imp p q))
//      => H2 (lemme_notimply_3 p q
//                             (H4 : π p
//                              => (H1 H4)
//                                 (H5 : π q
//                                   => H2 (H6 : π p
// 	                                  => H5))) ).

rule Rnotimply $p $q ↪
  λ (H1 : (π $p → π (¬ $q) → π ⊥))
    (H2 : π (¬ (imp $p $q))),
     H2 (λ (H3 : π $p),
            bot ((H1 H3) (λ (H4 : π $q),
                        H2 (λ (H5 : π $p),
                               H4))) $q)


rule Rnotequiv $p $q ↪
  λ (H1 : (π (¬ $p) → π (¬ $q)))
    (H2 : (π $p → π (¬ (¬ $q))))
    (H3 : π (¬ (eqv $p $q))),
    (λ (HNP : π (¬ $p)),
            H3 (λ (z : Prop)
                  (H4 : (π (imp $p $q) → π (imp $q $p) → π z)),
                      H4 (λ (HP : π $p), bot (HNP HP) $q)
                            (λ (HQ : π $q), bot (H1 HNP HQ) $p)))
           (lemme_notequiv_1 $p $q H2 H3)

rule Rex $a $p ↪
  λ (H1 : (Π (t : τ $a), π ($p t) → π ⊥))
    (H2 : π (@∃ $a $p)),
     H2 ⊥ H1

rule Rall $a $p $t ↪
  λ (H1 : (π ($p $t) → π ⊥))
    (H2 : π (@∀ $a $p)),
     H1 (H2 $t)

rule Rnotex $a $p $t ↪
  λ (H1 : (π (¬ ($p $t)) → π ⊥))
    (H2 : π (¬ (@∃ $a $p))),
     H1 (λ (H4 : π ($p $t)),
            H2 (λ (z : Prop)
		              (H3 : (Π (x : τ $a), π ($p x) → π z)),
		      H3 $t H4))

rule Rnotall $a $p ↪
  λ (H1 : (Π(t : τ $a), π (¬ ($p t)) → π ⊥))
    (H2 : π (¬ (@∀ $a $p))),
     H2 (λ (t : τ $a),
	       nnpp ($p t) (H1 t))

// rule Rextype $p ↪
  // λ (H1 : (Π (a : Type), π ($p a) → π ⊥))
    // (H2 : π (existstype $p)),
    // H2 ⊥ H1

// rule Ralltype $p $a ↪
  // λ (H1 : (π ($p $a) → π ⊥))
    // (H2 : π (foralltype $p)),
    //  H1 (H2 $a)

// rule Rnotextype $p $a ↪
  // λ (H1 : (π (¬ ($p $a)) → π ⊥))
    // (H2 : π (¬ (existstype $p))),
     // H1 (λ (H4 : π ($p $a)),
            // (H2 (λ (z : Prop)
		            // (H3 : (Π (b : Type), π ($p b) → π z)),
		             // H3 $a H4)))

// rule Rnotalltype $p ↪
  // λ (H1 : (Π (a : Type), π (¬ ($p a)) → π ⊥))
    // (H2 : π (¬ (foralltype $p))),
    // H2 (λ (a : Type),
	       // nnpp ($p a) (H1 a))

rule Rsubst $a $p $t1 $t2 ↪
  λ (H1 : (π (¬ (@equal $a $t1 $t2)) → π ⊥))
    (H2 : (π ($p $t2) → π ⊥))
    (H3 : π ($p $t1)),
	   H1 (λ (H4 : π (@equal $a $t1 $t2)),
            H2 (H4 $p H3))
