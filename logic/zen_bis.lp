// Logic for Zenon Modulo

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

symbol bot_E : π ⊥ → Π p, π p
rule ¬ $p ↪ $p ⇒ ⊥
symbol top_I : π ⊤
rule π (imp $p $q) ↪ π $p → π $q
symbol or_E {p q : Prop} :  π (or p q) → Π x, (π p → π x) → (π q → π x) → π x
symbol or_Il {p q : Prop} : π p → π (p ∨ q)
symbol or_Ir {p q : Prop} : π q → π (p ∨ q)
rule eqv $p $q ↪ ($p ⇒ $q) ∧ ($q ⇒ $p)
symbol eq_E {a : Type} {t v : τ a} : π (@equal a t v) → Π(x:τ a → Prop), π (x t) → π (x v)
symbol eq_I {a : Type} {t v : τ a} : (Π(x:τ a → Prop), π (x t) → π (x v)) → π (@equal a t v)
symbol and_El {p q : Prop} : π (p ∧ q) → π p 
symbol and_Er {p q : Prop} : π (p ∧ q) → π q 
symbol and_I {p q : Prop} : π p → π q → π (p ∧ q)
symbol exists_E {a : Type} {p : τ a → Prop} : π (@∃ a p) → Π P, (Π(x : τ a), π (p x) → π P) → π P
symbol exists_I {a : Type} {p : τ a → Prop} : Π t, π (p t) → π (∃ p)
rule π (@∀ _ $p) ↪ Π x, π ($p x)

rule @or_E $a $b (@or_Il $a $b $pa) _ $paP _ ↪
  $paP $pa
rule @or_E $a $b (@or_Ir $a $b $pb) _ _ $pbP ↪
  $pbP $pb

rule @eq_E $a $t $v (@eq_I $a $t $v $pxxtxv) $P $pt ↪ $pxxtxv $P $pt

rule @and_El $a $b (@and_I $a $b $pa _) ↪ $pa
rule @and_Er $a $b (@and_I $a $b _ $pb) ↪ $pb

rule @exists_E $a $p (@exists_I $a $p $t $pt) _ $pxpxP ↪
  $pxpxP $t $pt


rule bot_E (bot_E $pbot ⊥) $P ↪ bot_E $pbot $P
rule bot_E $pbot (imp _ $b) _ ↪
  bot_E $pbot $b
rule or_E (bot_E $pbot (_ ∨ _)) $P _ _ ↪ 
  bot_E $pbot $P
rule @eq_E _ $t $v (bot_E $pbot ($t = $v)) $P _ ↪ 
  bot_E $pbot ($P $v)
rule @and_El $a _ (bot_E $pbot ($a ∧ _)) ↪
  bot_E $pbot $a
rule @and_Er _ $b (bot_E $pbot (_ ∧ $b)) ↪
  bot_E $pbot $b
rule exists_E (bot_E $pbot (∃ _)) $P _  ↪
  bot_E $pbot $P
rule bot_E $pbot (∀ x, $a[x]) $t ↪ bot_E $pbot $a[$t]

rule bot_E (or_E $paorb ⊥ $pabot $pbbot) $P ↪
  or_E $paorb $P (λ pa, bot_E ($pabot pa) $P) (λ pb, bot_E ($pbbot pb) $P)
rule or_E $paorb (imp _ $q) $papq $pbpq $pp ↪
  or_E $paorb $q (λ pa, $papq pa $pp) (λ pb, $pbpq pb $pp)
rule or_E (or_E $paorb (_ ∨ _) $pacord $pbcord) $e $pce $pde ↪
  or_E $paorb $e 
     (λ pa, or_E ($pacord pa) $e $pce $pde)
     (λ pb, or_E ($pbcord pb) $e $pce $pde)
rule @eq_E _ $t $v (or_E $paorb ($t = $v) $patv $pbtv) $P $pPt ↪
  or_E $paorb ($P $v) 
              (λ pa, @eq_E _ $t $v ($patv pa) $P $pPt) 
              (λ pb, @eq_E _ $t $v ($pbtv pb) $P $pPt)
rule @and_El $c $d (or_E $paorb ($c ∧ $d) $pat $pbt)  ↪
  or_E $paorb $c (λ pa, @and_El $c $d ($pat pa)) (λ pb, @and_El $c $d ($pbt pb))
rule @and_Er $c $d (or_E $paorb ($c ∧ $d) $pat $pbt)  ↪
  or_E $paorb $d (λ pa, @and_Er $c $d ($pat pa)) (λ pb, @and_Er $c $d ($pbt pb))
rule @exists_E $t $p (@or_E $a $b $paorb (∃ $p) $pat $pbt) $P $pxpP ↪
  @or_E $a $b $paorb $P (λ pa, @exists_E $t $p ($pat pa) $P $pxpP)
                       (λ pb, @exists_E $t $p ($pbt pb) $P $pxpP)
rule or_E $paorb (∀ x, $a[x]) $papq $pbpq $t ↪
  or_E $paorb $a[$t] (λ pa, $papq pa $t) (λ pb, $pbpq pb $t)

rule bot_E (@exists_E $a $p $pexp ⊥ $ppt) $P ↪
  @exists_E $a $p $pexp $P (λ x pp, bot_E ($ppt x pp) $P)
rule @exists_E $a $p $pexp (imp _ $d) $ppt $pc ↪
  @exists_E $a $p $pexp $d (λ x pp, $ppt x pp $pc)
rule @or_E $a $b (@exists_E $t $p $pexp (or $a $b) $ppt) $e $pce $pde ↪
  @exists_E $t $p $pexp $e 
     (λ x pp, @or_E $a $b ($ppt x pp) $e $pce $pde)
rule @eq_E _ $t $v (@exists_E $a $p $pexp ($t = $v) $ppt) $P $pPt ↪
  @exists_E $a $p $pexp ($P $v) (λ x pp, @eq_E _ $t $v ($ppt x pp) $P $pPt)
rule @and_El $c $d (@exists_E $a $p $pexp ($c ∧ $d) $ppt) ↪
  @exists_E $a $p $pexp $c (λ x pp, @and_El $c $d ($ppt x pp))
rule @and_Er $c $d (@exists_E $a $p $pexp ($c ∧ $d) $ppt) ↪
  @exists_E $a $p $pexp $d (λ x pp, @and_Er $c $d ($ppt x pp))
rule @exists_E $t $p (@exists_E $u $q $pexp (∃ $p) $ppt) $P $pxpP ↪
  @exists_E $u $q $pexp $P (λ x pp, @exists_E $t $p ($ppt x pp) $P $pxpP)
rule @exists_E $a $p $pexp (∀ x, $b[x]) $ppt $t ↪
  @exists_E $a $p $pexp $b[$t] (λ x pp, $ppt x pp $t)



symbol nnpp (p : Prop) : π (¬ (¬ p)) → π p

// rule nnpp (¬ $a) $pr $q ↪ $pr (λ H1, H1 $q)
// rule nnpp (imp $a $b) $pr $q ↪ nnpp $b (λ H1, $pr (λ H2, H1 (H2 $q)))
// rule nnpp (or $a $b) (or_E $a $b $pr $P $pa $pb) ↪
//   nnpp $P (λ H1 : π (¬ $P), $pr (λ H2, H1 (H2 $P $pa $pb)))
// rule nnpp (eqv $a $b) $pr $P $pab ↪
//   nnpp $P (λ H1 : π (¬ $P), $pr (λ H2, H1 (H2 $P $pab)))
// rule nnpp (equal $t $v) $pr $P $pt ↪
//   nnpp ($P $v) (λ H1 : π (¬ ($P $v)), $pr (λ H2, H1 (H2 $P $pt)))
// rule nnpp ({|and|} $a $b) $pr $P $pab ↪
//   nnpp $P (λ H1 : π (¬ $P), $pr (λ H2, H1 (H2 $P $pab)))
// rule nnpp (∃ $a) $pr $P $paP ↪
//   nnpp $P (λ H1 : π (¬ $P), $pr (λ H2, H1 (H2 $P $paP)))
// rule nnpp (∀ $a) $pr $t ↪ nnpp ($a $t) (λ H1 : π (¬ ($a $t)), $pr (λ H2, H1 (H2 $t)))
// rule nnpp ⊥ $pr ↪ $pr (λ z, z)
// rule nnpp $a[] (λ H1, H1 (nnpp $a[] (λ H2, $K[H1;H2]))) ↪
//   nnpp $a[] (λ H1, $K[H1;H1])
// rule nnpp $a (λ H1, H1 $K[]) ↪ $K[]

//definition bot (pr : π ⊥) (p : Prop) : π p ≔
//  nnpp p (λ _, pr)

symbol xmid (p z : Prop) (pp: π p → π z) (pnp : π (¬ p) → π z) : π z ≔
  nnpp z (λ H2, H2 (pp (nnpp p (λ H3, H2 (pnp H3)))))
  

// usefull lemmas to prove rules

symbol true_intro : π ⊤
             ≔ top_I

symbol lemme_contraposition (p : Prop)
                      (q : Prop)
: (π (imp p q) →
   π (imp (¬ q) (¬ p)))
≔
  λ (H1 : π (imp p q))
  (H2 : π (¬ q))
     (H3 : π p),
	H2 (H1 H3)

symbol lemme_equiv_1 (p : Prop)
	       (q : Prop)
	       (H5 : π q → π p)
	       (H2 : π p → π (¬ q))
	       (HQ : π q)
: π (¬ q)
≔
  H2 (H5 HQ)

symbol lemme_equiv_2 (p : Prop)
 	       (q : Prop)
	       (H5 : π q → π p)
	       (H2 : π p → π (¬ q))
: π (¬ q)
≔
  λ (HQ : π q), lemme_equiv_1 p q H5 H2 HQ HQ

symbol lemme_equiv_3 (p : Prop)
	       (q : Prop)
	       (H5 : π q → π p)
	       (H2 : π p → π (¬ q))
	       (H4 : π p → π q)
: π (¬ p)
≔
  lemme_contraposition p q H4 (lemme_equiv_2 p q H5 H2)

symbol lemme_equiv_4 (p : Prop)
	       (q : Prop)
	       (H5 : π q → π p)
	       (H2 : π p → π (¬ q))
	       (H4 : π p → π q)
	       (H1 : π (¬ p) → π (¬ (¬ q)))
: π (¬ (¬ q))
≔
  H1 (lemme_equiv_3 p q H5 H2 H4)

symbol lemme_notor_1 (p : Prop)
	       (q : Prop)
: π p → π (or p q)
≔
  @or_Il p q

symbol lemme_notor_2 (p : Prop)
	       (q : Prop)
: π q → π (or p q)
≔
@or_Ir p q

symbol lemme_notor_3 (p : Prop)
	       (q : Prop)
	       (H2 : π (¬ (or p q)))
: π (¬ p)
≔
  lemme_contraposition p (or p q) (lemme_notor_1 p q) H2

symbol lemme_notor_4 (p : Prop)
	       (q : Prop)
	       (H2 : π (¬ (or p q)))
: π (¬ q)
≔
  lemme_contraposition q (or p q) (lemme_notor_2 p q) H2

symbol lemme_notimply_1 (p : Prop)
	          (q : Prop)
	          (H2 : π (¬ (imp p q)))
: π (¬ q)
≔
  λ (H3 : π q),
  H2 (λ (H4 : π p), H3)

symbol lemme_notimply_2 (p : Prop)
	          (q : Prop)
	          (H1 : π p → π (¬ (¬ q)))
	          (H2 : π (¬ (imp p q)))
: π (¬ p)
≔
  λ (H3 : π p),
    (H1 H3) (lemme_notimply_1 p q H2)

symbol lemme_notimply_3 (p : Prop)
	          (q : Prop)
	          (H3 : π (¬ p))
: π (imp p q)
≔
  λ (H4 : π p), bot_E (H3 H4) q

symbol lemme_notequiv_1 (p : Prop)
                  (q : Prop)
                  (H2 : π p → π (¬ (¬ q)))
                  (H3 : π (¬ (eqv p q)))
: π (¬ p)
≔
  λ (HP : π p),
    H2 HP (λ (HQ : π q),
              H3 (and_I (λ (__ : π p), HQ) (λ (__ : π q), HP)))

// proofs of LLproof Rules

rule Rfalse ↪ λ (x : π ⊥), x

rule Rnottrue ↪ λ (H : π (¬ ⊤)), H true_intro

rule Raxiom $p ↪ λ (H : π $p) (CH : π (¬ $p)), CH H

rule Rnoteq $a $t ↪
  λ (H1 : π (¬ ($t = $t))),
     H1 (eq_I (λ (z : (τ $a → Prop)),
	     (λ (H2 : π (z $t)),
	          H2)))

rule Reqsym $a $t $u ↪
  λ (H1 : π ($t = $u))
    (H2 : π (¬ ($u = $t))),
     H2 (eq_I (λ (z : (τ $a → Prop))
	         (H3 : π (z $u)),
	            eq_E H1 (λ (x : τ $a),
		            (imp (z x) (z $t)))
		     (λ (H4 : π (z $t)),
		      H4)
		     H3))

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
     H1 (@and_El $p $q H2) (@and_Er $p $q H2)

rule Ror $p $q ↪
  λ (H1 : (π $p → π ⊥))
    (H2 : (π $q → π ⊥))
    (H3 : π (or $p $q)),
	   or_E H3 ⊥ H1 H2

rule Rimply $p $q ↪
  λ (H1 : (π (¬ $p) → π ⊥))
    (H2 : (π $q → π ⊥))
    (H3 : π (imp $p $q)),
     H1 (lemme_contraposition $p $q H3 H2)

rule Requiv $p $q ↪
  λ (H1 : (π (¬ $p) → π (¬ $q) → π ⊥))
    (H2 : (π $p → π $q → π ⊥))
    (H3 : π (eqv $p $q)),
  lemme_equiv_4 $p $q 
                    (@and_Er ($p ⇒ $q) ($q ⇒ $p) H3)
                    H2 (@and_El ($p ⇒ $q) ($q ⇒ $p) H3)
                    H1 
                    (lemme_equiv_2 $p $q 
                                       (@and_Er ($p ⇒ $q) ($q ⇒ $p) H3) H2)

rule Rnotand $p $q ↪
  λ (H1 : (π (¬ $p) → π ⊥))
    (H2 : (π (¬ $q) → π ⊥))
    (H3 : π (¬ ({|and|} $p $q))),
	  H1 (λ (H5 : π $p),
               H2 (λ (H6 : π $q),
                   H3 (and_I H5 H6)))

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
            bot_E ((H1 H3) (λ (H4 : π $q),
                        H2 (λ (H5 : π $p),
                               H4))) $q)


rule Rnotequiv $p $q ↪
  λ (H1 : (π (¬ $p) → π (¬ $q)))
    (H2 : (π $p → π (¬ (¬ $q))))
    (H3 : π (¬ (eqv $p $q))),
    (λ (HNP : π (¬ $p)),
     H3 (and_I (λ (HP : π $p), bot_E (HNP HP) $q)
               (λ (HQ : π $q), bot_E (H1 HNP HQ) $p)))
           (lemme_notequiv_1 $p $q H2 H3)

rule Rex $a $p ↪
  λ (H1 : (Π (t : τ $a), π ($p t) → π ⊥))
    (H2 : π (@∃ $a $p)),
     @exists_E $a $p H2 ⊥ H1

rule Rall $a $p $t ↪
  λ (H1 : (π ($p $t) → π ⊥))
    (H2 : π (@∀ $a $p)),
     H1 (H2 $t)

rule Rnotex $a $p $t ↪
  λ (H1 : (π (¬ ($p $t)) → π ⊥))
    (H2 : π (¬ (@∃ $a $p))),
     H1 (λ (H4 : π ($p $t)),
            H2 (@exists_I $a $p $t H4))

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
            H2 (@eq_E $a $t1 $t2 H4 $p H3))
