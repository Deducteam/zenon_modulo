require logic.cc as cc
require logic.dk_logic as dk_logic


// Logic for Zenon Modulo

symbol prop  : TYPE
symbol type  : TYPE
symbol Proof : prop ⇒ TYPE
symbol term  : type ⇒ TYPE
symbol arrow : type ⇒ type ⇒ type
symbol const iota  : type

// Symbols 

symbol True  : prop
symbol False : prop

symbol not : prop ⇒ prop
symbol {|and|} : prop ⇒ prop ⇒ prop
symbol or  : prop ⇒ prop ⇒ prop
symbol imp : prop ⇒ prop ⇒ prop
symbol eqv : prop ⇒ prop ⇒ prop

symbol const select : ∀ (a : type), term a

symbol forall : ∀ (a : type), (term a ⇒ prop) ⇒ prop
symbol exists : ∀ (a : type), (term a ⇒ prop) ⇒ prop

symbol foralltype : (type ⇒ prop) ⇒ prop
symbol existstype : (type ⇒ prop) ⇒ prop

symbol equal      : ∀ (a : type), term a ⇒ term a ⇒ prop

// Definition of Proofs of Symbols 

// The Sequent TYPE 

symbol seq : TYPE

// LLproof Deduction Rules 

// Rfalse 

symbol Rfalse : Proof False ⇒ seq

// Rnottrue 

symbol Rnottrue : Proof (not True) ⇒ seq

// Raxiom 

symbol Raxiom : ∀ (p : prop), Proof p ⇒ Proof (not p) ⇒ seq

// Rnoteq 

symbol Rnoteq : ∀ (a : type) (t : term a), Proof (not (equal a t t)) ⇒ seq

// Reqsym 

symbol Reqsym : ∀ (a : type) (t : term a) (u : term a),
             Proof (equal a t u) ⇒
             Proof (not (equal a u t)) ⇒
             seq

// Rcut 

symbol Rcut : ∀ (p : prop),
           (Proof p ⇒ seq) ⇒
           (Proof (not p) ⇒ seq) ⇒
           seq

// Rnotnot 

symbol Rnotnot : ∀ (p : prop),
              (Proof p ⇒ seq) ⇒
              Proof (not (not p)) ⇒
              seq

// Rand 

symbol Rand : ∀ (p : prop)
           (q : prop),
           (Proof p ⇒ Proof q ⇒ seq) ⇒
           Proof ({|and|} p q) ⇒
           seq

// Ror 

symbol Ror : ∀ (p : prop)
          (q : prop),
          (Proof p ⇒ seq) ⇒
          (Proof q ⇒ seq) ⇒
          Proof (or p q) ⇒
          seq

// Rimply 

symbol Rimply : ∀ (p : prop) 
             (q : prop),
             (Proof (not p) ⇒ seq) ⇒
             (Proof q ⇒ seq) ⇒
             Proof (imp p q) ⇒
             seq

// Requiv 

symbol Requiv : ∀ (p : prop)
             (q : prop),
             (Proof (not p) ⇒ Proof (not q) ⇒ seq) ⇒
             (Proof p ⇒ Proof q ⇒ seq) ⇒
             Proof (eqv p q) ⇒
             seq

// Rnotand 

symbol Rnotand : ∀ (p : prop) (q : prop),
              (Proof (not p) ⇒ seq) ⇒
              (Proof (not q) ⇒ seq) ⇒
              Proof (not ({|and|} p q)) ⇒
              seq

// Rnotor 

symbol Rnotor : ∀ (p : prop)
               (q : prop),
             (Proof (not p) ⇒ Proof (not q) ⇒ seq) ⇒
             Proof (not (or p q)) ⇒
             seq

// Rnotimply

symbol Rnotimply : ∀ (p : prop)
                  (q : prop),
                (Proof p ⇒ Proof (not q) ⇒ seq) ⇒
                Proof (not (imp p q)) ⇒
                seq

// Rnotequiv 

symbol Rnotequiv :∀ (p : prop)
                    (q : prop),
                (Proof (not p) ⇒ Proof q ⇒ seq) ⇒
                (Proof p ⇒ Proof (not q) ⇒ seq) ⇒
                Proof (not (eqv p q)) ⇒
                seq

// Rex 

symbol Rex : ∀ (a : type)
               (p : (term a ⇒ prop)),
          (∀ (t : term a), Proof (p t) ⇒ seq) ⇒
          Proof (exists a p) ⇒
          seq

// Rall 

symbol Rall : ∀ (a : type)
                (p : (term a ⇒ prop))
                (t : term a),
           (Proof (p t) ⇒ seq) ⇒
           Proof (forall a p) ⇒
           seq

// Rnotex 
symbol Rnotex : ∀ (a : type)
                  (p : (term a ⇒ prop))
                  (t : term a),
             (Proof (not (p t)) ⇒ seq) ⇒
             Proof (not (exists a p)) ⇒
             seq

// Rnotall 

symbol Rnotall : ∀ (a : type)
                   (p : (term a ⇒ prop)),
              (∀ (t : term a), Proof (not (p t)) ⇒ seq) ⇒
              Proof (not (forall a p)) ⇒
              seq

// Rextype 

symbol Rextype : ∀ (p : (type ⇒ prop)),
              ( ∀ (a : type), Proof (p a) ⇒ seq) ⇒
              Proof (existstype p) ⇒
              seq

// Ralltype 

symbol Ralltype : ∀ (p : (type ⇒ prop))
                    (a : type),
               (Proof (p a) ⇒ seq) ⇒
               Proof (foralltype p) ⇒
               seq

// Rnotextype 

symbol Rnotextype : ∀ (p : (type ⇒ prop))
                      (a : type),
                 (Proof (not (p a)) ⇒ seq) ⇒
                 Proof (not (existstype p)) ⇒
                 seq

// Rnotalltype 

symbol Rnotalltype :  ∀ (p : (type ⇒ prop)),
                   (∀ (a : type), Proof (not (p a)) ⇒ seq) ⇒
                   Proof (not (foralltype p)) ⇒
                   seq

// Rsubst 

symbol Rsubst : ∀ (a : type)
                  (p : (term a ⇒ prop))
                  (t1 : term a)
                  (t2 : term a),
             (Proof (not (equal a t1 t2)) ⇒ seq) ⇒
             (Proof (p t2) ⇒ seq) ⇒
             Proof (p t1) ⇒
             seq

symbol Rconglr :∀ (a : type)
                  (p : (term a ⇒ prop))
                  (t1 : term a)
                  (t2 : term a),
              (Proof (p t2) ⇒ seq) ⇒
              Proof (p t1) ⇒
              Proof (equal a t1 t2) ⇒
              seq

symbol Rcongrl : ∀ (a : type)
                  (p : (term a ⇒ prop))
                  (t1 : term a)
                  (t2 : term a),
              (Proof (p t2) ⇒ seq) ⇒
              Proof (p t1) ⇒
              Proof (equal a t2 t1) ⇒
              seq

// Proofs of these rules in the logic of Focalide 

rule type  → cc.uT
rule term  → cc.eT
rule arrow → cc.Arrow
rule prop  → dk_logic.Prop
rule Proof → dk_logic.eP

rule True       → dk_logic.True
rule False      → dk_logic.False
rule not        → dk_logic.not
rule{|and|}       → dk_logic.{|and|}
rule or         → dk_logic.or
rule imp        → dk_logic.imp
rule eqv        → dk_logic.eqv
rule forall     → dk_logic.forall
rule exists     → dk_logic.exists
rule foralltype → dk_logic.forall_type
rule existstype → dk_logic.exists_type
rule equal      → dk_logic.equal

rule seq → Proof False

// Law of eXcluded Middle 

symbol const xmid       : ∀ (p : prop) (z : prop),
	     (Proof p ⇒ Proof z) ⇒
	     (Proof (not p) ⇒ Proof z) ⇒
	     Proof z

definition nnpp (p : prop) : Proof (not (not p)) ⇒ Proof p ≔
    λ (H1 : Proof (not (not p))),
      xmid p p
	    (λ (H2 : Proof p),
        H2)
	    (λ (H3 : Proof (not p)),
	        H1 H3 p)

// usefull lemmas to prove rules 

definition true_intro : Proof True
             ≔ λ (p : prop) (x : Proof p), x

definition lemme_contraposition (p : prop)
                      (q : prop)
: (Proof (imp p q) ⇒
   Proof (imp (not q) (not p)))
≔
  λ (H1 : Proof (imp p q))
  (H2 : Proof (not q))
     (H3 : Proof p),
	H2 (H1 H3)

definition lemme_equiv_1 (p : prop)
	       (q : prop)
	       (H5 : Proof q ⇒ Proof p)
	       (H2 : Proof p ⇒ Proof (not q))
	       (HQ : Proof q)
: Proof (not q)
≔
  H2 (H5 HQ)

definition lemme_equiv_2 (p : prop)
 	       (q : prop)
	       (H5 : Proof q ⇒ Proof p)
	       (H2 : Proof p ⇒ Proof (not q))
: Proof (not q)
≔
  λ (HQ : Proof q), lemme_equiv_1 p q H5 H2 HQ HQ

definition lemme_equiv_3 (p : prop)
	       (q : prop)
	       (H5 : Proof q ⇒ Proof p)
	       (H2 : Proof p ⇒ Proof (not q))
	       (H4 : Proof p ⇒ Proof q)
: Proof (not p)
≔
  lemme_contraposition p q H4 (lemme_equiv_2 p q H5 H2)

definition lemme_equiv_4 (p : prop)
	       (q : prop)
	       (H5 : Proof q ⇒ Proof p)
	       (H2 : Proof p ⇒ Proof (not q))
	       (H4 : Proof p ⇒ Proof q)
	       (H1 : Proof (not p) ⇒ Proof (not (not q)))
: Proof (not (not q))
≔
  H1 (lemme_equiv_3 p q H5 H2 H4)

definition lemme_notor_1 (p : prop)
	       (q : prop)
: Proof p ⇒ Proof (or p q)
≔
  λ (H1 : Proof p)
    (z : prop)
    (H2 : (Proof p ⇒ Proof z))
	  (H3 : (Proof q ⇒ Proof z)),
	   H2 H1

definition lemme_notor_2 (p : prop)
	       (q : prop)
: Proof q ⇒ Proof (or p q)
≔
  λ (H1 : Proof q)
    (z : prop)
    (H2 : (Proof p ⇒ Proof z))
	  (H3 : (Proof q ⇒ Proof z)),
	   H3 H1

definition lemme_notor_3 (p : prop)
	       (q : prop)
	       (H2 : Proof (not (or p q)))
: Proof (not p)
≔
  lemme_contraposition p (or p q) (lemme_notor_1 p q) H2

definition lemme_notor_4 (p : prop)
	       (q : prop)
	       (H2 : Proof (not (or p q)))
: Proof (not q)
≔
  lemme_contraposition q (or p q) (lemme_notor_2 p q) H2

definition lemme_notimply_1 (p : prop)
	          (q : prop)
	          (H2 : Proof (not (imp p q)))
: Proof (not q)
≔
  λ (H3 : Proof q),
  H2 (λ (H4 : Proof p), H3)

definition lemme_notimply_2 (p : prop)
	          (q : prop)
	          (H1 : Proof p ⇒ Proof (not (not q)))
	          (H2 : Proof (not (imp p q)))
: Proof (not p)
≔
  λ (H3 : Proof p),
    (H1 H3) (lemme_notimply_1 p q H2)

definition lemme_notimply_3 (p : prop)
	          (q : prop)
	          (H3 : Proof (not p))
: Proof (imp p q)
≔
  λ (H4 : Proof p), H3 H4 q

definition lemme_notequiv_1 (p : prop)
                  (q : prop)
                  (H2 : Proof p ⇒ Proof (not (not q)))
                  (H3 : Proof (not (eqv p q)))
: Proof (not p)
≔
  λ (HP : Proof p),
    H2 HP (λ (HQ : Proof q),
              H3 (λ (z : prop)
                    (H4 : (Proof (imp p q) ⇒
                            Proof (imp q p) ⇒
                            Proof z)),
                      H4 (λ (__ : Proof p), HQ) (λ (__ : Proof q), HP)))

// Proofs of LLProof Rules 

rule Rfalse → λ (x : Proof False), x

rule Rnottrue → λ (H : Proof (not True)), H true_intro

rule Raxiom &p → λ (H : Proof &p) (CH : Proof (not &p)), CH H

rule Rnoteq &a &t →
  λ (H1 : Proof (not (equal &a &t &t))),
     H1 (λ (z : (term &a ⇒ prop)), 
	     (λ (H2 : Proof (z &t)), 
	          H2))

rule Reqsym &a &t &u →
  λ (H1 : Proof (equal &a &t &u))
    (H2 : Proof (not (equal &a &u &t))),
     H2 (λ (z : (term &a ⇒ prop))
	         (H3 : Proof (z &u)),
	            H1 (λ (x : term &a),
		            (imp (z x) (z &t)))
		     (λ (H4 : Proof (z &t)),
		      H4)
		     H3)

rule Rcut &p →
  λ (H1 : (Proof &p ⇒ Proof False))
    (H2 : (Proof (not &p) ⇒ Proof False)),
     H2 H1

rule Rnotnot &p →
  λ (H1 : (Proof &p ⇒ Proof False))
    (H2 : Proof (not (not &p))),
     H2 H1

rule Rand &p &q →
  λ (H1 : (Proof &p ⇒ Proof &q ⇒ Proof False))
    (H2 : Proof ({|and|} &p &q)),
     H2 False H1

rule Ror &p &q →
  λ (H1 : (Proof &p ⇒ Proof False))
    (H2 : (Proof &q ⇒ Proof False))
    (H3 : Proof (or &p &q)),
	   H3 False H1 H2

rule Rimply &p &q →
  λ (H1 : (Proof (not &p) ⇒ Proof False))
    (H2 : (Proof &q ⇒ Proof False))
    (H3 : Proof (imp &p &q)),
     H1 (lemme_contraposition &p &q H3 H2)

rule Requiv &p &q →
  λ (H1 : (Proof (not &p) ⇒ Proof (not &q) ⇒ Proof False))
    (H2 : (Proof &p ⇒ Proof &q ⇒ Proof False))
    (H3 : Proof (eqv &p &q)),
	   H3 False
             (λ (H4 : (Proof &p ⇒ Proof &q))
	              (H5 : (Proof &q ⇒ Proof &p)),
		  lemme_equiv_4 &p &q H5 H2 H4 H1 (lemme_equiv_2 &p &q H5 H2))

rule Rnotand &p &q →
  λ (H1 : (Proof (not &p) ⇒ Proof False))
    (H2 : (Proof (not &q) ⇒ Proof False))
    (H3 : Proof (not ({|and|} &p &q))),
	  H1 (λ (H5 : Proof &p),
               H2 (λ (H6 : Proof &q),
                   H3 (λ (z : prop),
                       (λ (H4 : (Proof &p ⇒ Proof &q ⇒ Proof z)),
                        H4 H5 H6))))

rule Rnotor &p &q →
  λ (H1 : (Proof (not &p) ⇒ Proof (not &q) ⇒ Proof False))
    (H2 : Proof (not (or &p &q))),
     H1 (lemme_notor_3 &p &q H2) (lemme_notor_4 &p &q H2)

// [p : prop, q : prop] Rnotimply p q → 
//   H1 : (Proof p ⇒ Proof (not q) ⇒ Proof False) 
//   => H2 : Proof (not (imp p q)) 
//      => H2 (lemme_notimply_3 p q (lemme_notimply_2 p q H1 H2)). 

// def Rnotimplytest : p : prop ⇒ 
//                 q : prop ⇒ 
//                 (Proof p ⇒ Proof (not q) ⇒ seq) ⇒ 
//                 Proof (not (imp p q)) ⇒ 
//                 seq. 

// def Rnotimplytesttwo : p : prop ⇒ 
//                 q : prop ⇒ 
//                 (Proof p ⇒ Proof (not q) ⇒ seq) ⇒ 
//                 Proof (not (imp p q)) ⇒ 
//                 seq. 

// [p : prop, q : prop] Rnotimplytest p q → 
//   H1 : (Proof p ⇒ Proof (not q) ⇒ Proof False) 
//   => H2 : Proof (not (imp p q)) 
//      => H2 (lemme_notimply_3 p q 
//                             (H4 : Proof p 
//                              => (H1 H4) 
//                                 (H5 : Proof q 
//                                   => H2 (H6 : Proof p 
// 	                                  => H5))) ). 

rule Rnotimply &p &q →
  λ (H1 : (Proof &p ⇒ Proof (not &q) ⇒ Proof False))
    (H2 : Proof (not (imp &p &q))),
     H2 (λ (H3 : Proof &p),
            (H1 H3) (λ (H4 : Proof &q),
                        H2 (λ (H5 : Proof &p),
                               H4)) &q)


rule Rnotequiv &p &q →
  λ (H1 : (Proof (not &p) ⇒ Proof (not &q)))
    (H2 : (Proof &p ⇒ Proof (not (not &q))))
    (H3 : Proof (not (eqv &p &q))),
    (λ (HNP : Proof (not &p)),
            H3 (λ (z : prop)
                  (H4 : (Proof (imp &p &q) ⇒ Proof (imp &q &p) ⇒ Proof z)),
                      H4 (λ (HP : Proof &p), HNP HP &q)
                            (λ (HQ : Proof &q), H1 HNP HQ &p)))
           (lemme_notequiv_1 &p &q H2 H3)

rule Rex &a &p →
  λ (H1 : (∀ (t : term &a), Proof (&p t) ⇒ Proof False))
    (H2 : Proof (exists &a &p)),
     H2 False H1

rule Rall &a &p &t →
  λ (H1 : (Proof (&p &t) ⇒ Proof False))
    (H2 : Proof (forall &a &p)),
     H1 (H2 &t)

rule Rnotex &a &p &t →
  λ (H1 : (Proof (not (&p &t)) ⇒ Proof False))
    (H2 : Proof (not (exists &a &p))),
     H1 (λ (H4 : Proof (&p &t)),
            H2 (λ (z : prop)
		              (H3 : (∀ (x : term &a), Proof (&p x) ⇒ Proof z)),
		      H3 &t H4))

rule Rnotall &a &p →
  λ (H1 : (∀(t : term &a), Proof (not (&p t)) ⇒ Proof False))
    (H2 : Proof (not (forall &a &p))),
     H2 (λ (t : term &a),
	       nnpp (&p t) (H1 t))

rule Rextype &p →
  λ (H1 : (∀ (a : type), Proof (&p a) ⇒ Proof False))
    (H2 : Proof (existstype &p)),
     H2 False H1

rule Ralltype &p &a →
  λ (H1 : (Proof (&p &a) ⇒ Proof False))
    (H2 : Proof (foralltype &p)),
     H1 (H2 &a)

rule Rnotextype &p &a →
  λ (H1 : (Proof (not (&p &a)) ⇒ Proof False))
    (H2 : Proof (not (existstype &p))),
     H1 (λ (H4 : Proof (&p &a)),
            (H2 (λ (z : prop)
		            (H3 : (∀ (b : type), Proof (&p b) ⇒ Proof z)),
		             H3 &a H4)))

rule Rnotalltype &p →
  λ (H1 : (∀ (a : type), Proof (not (&p a)) ⇒ Proof False))
    (H2 : Proof (not (foralltype &p))),
    H2 (λ (a : type),
	       nnpp (&p a) (H1 a))

rule Rsubst &a &p &t1 &t2 →
  λ (H1 : (Proof (not (equal &a &t1 &t2)) ⇒ Proof False))
    (H2 : (Proof (&p &t2) ⇒ Proof False))
    (H3 : Proof (&p &t1)),
	   H1 (λ (H4 : Proof (equal &a &t1 &t2)),
            H2 (H4 &p H3))
