%------------------------------------------------------------------------------
% File     : KRS162+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : Entailment for three natural numbers
% Version  : Especial.
% English  : This entailment can be replicated for any three natural numbers
%            i, j, k such that i+j >= k. In this example, they are chosen as
%            2, 3 and 5.

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_description-logic-Manifest901 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.27 v5.2.0, 0.00 v4.1.0, 0.30 v4.0.0, 0.33 v3.7.0, 0.14 v3.5.0, 0.11 v3.4.0, 0.08 v3.3.0, 0.22 v3.2.0, 0.33 v3.1.0
% Syntax   : Number of formulae    :   20 (   0 unit)
%            Number of atoms       :   78 (  26 equality)
%            Maximal formula depth :   25 (   6 average)
%            Number of connectives :   77 (  19 ~  ;   0  |;  39  &)
%                                         (   2 <=>;  17 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   10 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   54 (   0 singleton;  44 !;  10 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments : Sean Bechhofer says there are some errors in the encoding of
%            datatypes, so this problem may not be perfect. At least it's
%            still representative of the type of reasoning required for OWL.
%------------------------------------------------------------------------------
fof(cA_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cA(A) )
       => cA(B) ) )).

fof(cB_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cB(A) )
       => cB(B) ) )).

fof(cowlNothing_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cowlNothing(A) )
       => cowlNothing(B) ) )).

fof(cowlThing_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cowlThing(A) )
       => cowlThing(B) ) )).

fof(rp_substitution_1,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rp(A,C) )
       => rp(B,C) ) )).

fof(rp_substitution_2,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rp(C,A) )
       => rp(C,B) ) )).

fof(rq_substitution_1,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rq(A,C) )
       => rq(B,C) ) )).

fof(rq_substitution_2,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rq(C,A) )
       => rq(C,B) ) )).

fof(rr_substitution_1,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rr(A,C) )
       => rr(B,C) ) )).

fof(rr_substitution_2,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rr(C,A) )
       => rr(C,B) ) )).

fof(xsd_integer_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & xsd_integer(A) )
       => xsd_integer(B) ) )).

fof(xsd_string_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & xsd_string(A) )
       => xsd_string(B) ) )).

%----Thing and Nothing
fof(axiom_0,axiom,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) ) )).

%----String and Integer disjoint
fof(axiom_1,axiom,
    ( ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) ) )).

%----Range: rp
fof(axiom_2,axiom,
    ( ! [X,Y] :
        ( rp(X,Y)
       => cA(Y) ) )).

%----Range: rq
fof(axiom_3,axiom,
    ( ! [X,Y] :
        ( rq(X,Y)
       => cB(Y) ) )).

fof(axiom_4,axiom,
    ( ! [X] : ~ ( cB(X)
        & cA(X) ) )).

fof(axiom_5,axiom,
    ( ! [X,Y] :
        ( rq(X,Y)
       => rr(X,Y) ) )).

fof(axiom_6,axiom,
    ( ! [X,Y] :
        ( rp(X,Y)
       => rr(X,Y) ) )).

%----Thing and Nothing
%----String and Integer disjoint
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & ! [X] :
        ( ( ? [Y0,Y1] :
              ( rp(X,Y0)
              & rp(X,Y1)
              & Y0 != Y1 )
          & ? [Y0,Y1,Y2] :
              ( rq(X,Y0)
              & rq(X,Y1)
              & rq(X,Y2)
              & Y0 != Y1
              & Y0 != Y2
              & Y1 != Y2 ) )
       => ? [Y0,Y1,Y2,Y3,Y4] :
            ( rr(X,Y0)
            & rr(X,Y1)
            & rr(X,Y2)
            & rr(X,Y3)
            & rr(X,Y4)
            & Y0 != Y1
            & Y0 != Y2
            & Y0 != Y3
            & Y0 != Y4
            & Y1 != Y2
            & Y1 != Y3
            & Y1 != Y4
            & Y2 != Y3
            & Y2 != Y4
            & Y3 != Y4 ) ) )).

%------------------------------------------------------------------------------
