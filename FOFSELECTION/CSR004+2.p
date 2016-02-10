%--------------------------------------------------------------------------
% File     : CSR004+2 : TPTP v6.1.0. Bugfixed v3.1.0.
% Domain   : Commonsense Reasoning
% Problem  : Overflow happens at time 3
% Version  : [Mue04] axioms : Augmented > Especial.
% English  :

% Refs     : [MS05]  Mueller & Sutcliffe (2005), Reasoning in the Event Cal
%          : [Mue04] Mueller (2004), A Tool for Satisfiability-based Common
%          : [MS02]  Miller & Shanahan (2002), Some Alternative Formulation
% Source   : [MS05]
% Names    :

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.10 v6.0.0, 0.09 v5.5.0, 0.07 v5.4.0, 0.11 v5.3.0, 0.15 v5.2.0, 0.10 v5.0.0, 0.04 v4.1.0, 0.09 v4.0.0, 0.08 v3.7.0, 0.05 v3.4.0, 0.11 v3.3.0, 0.07 v3.2.0, 0.09 v3.1.0
% Syntax   : Number of formulae    :   57 (  27 unit)
%            Number of atoms       :  138 (  40 equality)
%            Maximal formula depth :   12 (   4 average)
%            Number of connectives :  109 (  28 ~  ;   8  |;  43  &)
%                                         (  18 <=>;  12 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   13 (   0 propositional; 2-4 arity)
%            Number of functors    :   17 (  15 constant; 0-2 arity)
%            Number of variables   :   86 (   0 singleton;  74 !;  12 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include standard discrete event calculus axioms
include('Axioms/CSR001+0.ax').
%----Include kitchen sink scenario axioms
include('Axioms/CSR001+1.ax').
%--------------------------------------------------------------------------
fof(plus0_0,axiom,
    ( plus(n0,n0) = n0 )).

fof(plus0_1,axiom,
    ( plus(n0,n1) = n1 )).

fof(plus0_2,axiom,
    ( plus(n0,n2) = n2 )).

fof(plus0_3,axiom,
    ( plus(n0,n3) = n3 )).

fof(plus1_1,axiom,
    ( plus(n1,n1) = n2 )).

fof(plus1_2,axiom,
    ( plus(n1,n2) = n3 )).

fof(plus1_3,axiom,
    ( plus(n1,n3) = n4 )).

fof(plus2_2,axiom,
    ( plus(n2,n2) = n4 )).

fof(plus2_3,axiom,
    ( plus(n2,n3) = n5 )).

fof(plus3_3,axiom,
    ( plus(n3,n3) = n6 )).

fof(symmetry_of_plus,axiom,
    ( ! [X,Y] : plus(X,Y) = plus(Y,X) )).

fof(less_or_equal,axiom,
    ( ! [X,Y] :
        ( less_or_equal(X,Y)
      <=> ( less(X,Y)
          | X = Y ) ) )).

fof(less0,axiom,
    ( ~ ( ? [X] : less(X,n0) ) )).

fof(less1,axiom,
    ( ! [X] :
        ( less(X,n1)
      <=> less_or_equal(X,n0) ) )).

fof(less2,axiom,
    ( ! [X] :
        ( less(X,n2)
      <=> less_or_equal(X,n1) ) )).

fof(less3,axiom,
    ( ! [X] :
        ( less(X,n3)
      <=> less_or_equal(X,n2) ) )).

fof(less4,axiom,
    ( ! [X] :
        ( less(X,n4)
      <=> less_or_equal(X,n3) ) )).

fof(less5,axiom,
    ( ! [X] :
        ( less(X,n5)
      <=> less_or_equal(X,n4) ) )).

fof(less6,axiom,
    ( ! [X] :
        ( less(X,n6)
      <=> less_or_equal(X,n5) ) )).

fof(less7,axiom,
    ( ! [X] :
        ( less(X,n7)
      <=> less_or_equal(X,n6) ) )).

fof(less8,axiom,
    ( ! [X] :
        ( less(X,n8)
      <=> less_or_equal(X,n7) ) )).

fof(less9,axiom,
    ( ! [X] :
        ( less(X,n9)
      <=> less_or_equal(X,n8) ) )).

fof(less_property,axiom,
    ( ! [X,Y] :
        ( less(X,Y)
      <=> ( ~ less(Y,X)
          & Y != X ) ) )).

%----Initial conditions
fof(waterLevel_0,hypothesis,
    ( holdsAt(waterLevel(n0),n0) )).

fof(not_filling_0,hypothesis,
    ( ~ holdsAt(filling,n0) )).

fof(not_spilling_0,hypothesis,
    ( ~ holdsAt(spilling,n0) )).

fof(not_released_waterLevel_0,hypothesis,
    ( ! [Height] : ~ releasedAt(waterLevel(Height),n0) )).

fof(not_released_filling_0,hypothesis,
    ( ~ releasedAt(filling,n0) )).

fof(not_released_spilling_0,hypothesis,
    ( ~ releasedAt(spilling,n0) )).

fof(waterLevel_3,lemma,
    ( holdsAt(waterLevel(n3),n3) )).

fof(filling_3,lemma,
    ( holdsAt(filling,n3) )).

fof(overflow_3,conjecture,
    ( happens(overflow,n3) )).
%--------------------------------------------------------------------------
