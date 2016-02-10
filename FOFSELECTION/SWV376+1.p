%------------------------------------------------------------------------------
% File     : SWV376+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Software Verification
% Problem  : Priority queue checker: lemma_not_ok_persistence
% Version  : [dNP05] axioms.
% English  :

% Refs     : [Pis06] Piskac (2006), Email to Geoff Sutcliffe
%          : [dNP05] de Nivelle & Piskac (2005), Verification of an Off-Lin
% Source   : [Pis06]
% Names    : cpq_l012 [Pis06]

% Status   : Theorem
% Rating   : 0.36 v6.1.0, 0.23 v6.0.0, 0.22 v5.5.0, 0.30 v5.4.0, 0.36 v5.3.0, 0.37 v5.2.0, 0.30 v5.1.0, 0.24 v5.0.0, 0.29 v4.1.0, 0.39 v4.0.0, 0.42 v3.7.0, 0.45 v3.5.0, 0.47 v3.3.0
% Syntax   : Number of formulae    :   44 (  16 unit)
%            Number of atoms       :   93 (  29 equality)
%            Maximal formula depth :   11 (   5 average)
%            Number of connectives :   70 (  21 ~  ;   3  |;  12  &)
%                                         (   7 <=>;  27 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   11 (   1 propositional; 0-3 arity)
%            Number of functors    :   19 (   3 constant; 0-3 arity)
%            Number of variables   :  138 (   4 singleton; 138 !;   0 ?)
%            Maximal term depth    :    4 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include the axioms about priority queues and checked priority queues
include('Axioms/SWV007+0.ax').
include('Axioms/SWV007+2.ax').
include('Axioms/SWV007+3.ax').
%------------------------------------------------------------------------------
/*----
	Explanation about induction
	===========================

In order to  prove lemma_not_ok_persistence we use the following induction
principle: (the induction principle used in Coq)
=====================
let s/1 be the successor function defined on some set S and let =</2 be the
predicate that satisfies the following axioms:

1) x =< x
2) x =< y -> x =< s(y)

	Note that our predicate succ_cpq/2 satisfies those two axioms

The induction principle: (V = for eVery

Vx  ( (P(x) and Vy (x =< y -> (P(y) -> P(s(y))))  -> Vy (x=<y -> P(y)) )
======================

Let P(x) == ~(ok(x)) and let  =</2 == succ/2

Then, in order to confirm correctness of lemma_not_ok_persistence we have
to only verify "Vy (x =< y -> (P(y) -> P(s(y))))" part of the induction
principle, in other words we need to prove validity of:

all(CPQ1, all(CPQ2, succ_cpq(CPQ1, CPQ2) => ( ~(ok(CPQ2)) =>  ~(ok(s(CPQ2))) ) )),  (1)

where s(CPQ2) is the immediate successor of CPQ2

all(CPQ2,  ~(ok(CPQ2)) =>  ~(ok(s(CPQ2)))  )  (2)

is a valid formula.

the validity of formula (2) is proved in lemma_not_ok_persistence_induction,
so here we have included it as a valid formula

lemma_not_ok_persistence_induction proves the validity of formula (1)
and thus, since (1) is valid we can conclude that the following formula holds:

Vx  ( P(x) -> Vy (x=<y -> P(y)) )

or in our example:

all(CPQ, ~(ok(CPQ)) => all(CPQ1, succ(CPQ, CPQ1) => ~(ok(CPQ1)) ) )

which completes the inductive proof of lemma_not_ok_persistence
----*/

%----induction axiom
fof(l12_induction,axiom,
    ( ! [U,V,W,X,Y,Z] :
        ( succ_cpq(triple(U,V,W),triple(X,Y,Z))
       => ( ~ ok(triple(X,Y,Z))
         => ~ ok(im_succ_cpq(triple(X,Y,Z))) ) )
   => ! [X1,X2,X3] :
        ( ~ ok(triple(X1,X2,X3))
       => ! [X4,X5,X6] :
            ( succ_cpq(triple(X1,X2,X3),triple(X4,X5,X6))
           => ~ ok(triple(X4,X5,X6)) ) ) )).

%----lemma_not_ok_persistence_induction (cpq_l013.p .. cpq_l016.p)
fof(l12_l13,lemma,(
    ! [U,V,W] :
      ( ~ ok(triple(U,V,W))
     => ~ ok(im_succ_cpq(triple(U,V,W))) ) )).

%----lemma_not_ok_persistence (conjecture)
fof(l12_co,conjecture,(
    ! [U,V,W] :
      ( ~ ok(triple(U,V,W))
     => ! [X,Y,Z] :
          ( succ_cpq(triple(U,V,W),triple(X,Y,Z))
         => ~ ok(triple(X,Y,Z)) ) ) )).
%------------------------------------------------------------------------------
