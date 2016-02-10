%------------------------------------------------------------------------------
% File     : KRS163+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : Disjoint classes have different members
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_disjointWith-Manifest001 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v4.0.1, 0.04 v3.7.0, 0.00 v3.1.0
% Syntax   : Number of formulae    :   14 (   4 unit)
%            Number of atoms       :   35 (   7 equality)
%            Maximal formula depth :    6 (   4 average)
%            Number of connectives :   27 (   6 ~  ;   0  |;  13  &)
%                                         (   2 <=>;   6 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    7 (   0 propositional; 1-2 arity)
%            Number of functors    :    2 (   2 constant; 0-0 arity)
%            Number of variables   :   17 (   0 singleton;  17 !;   0 ?)
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

%----ia
fof(axiom_2,axiom,
    ( cA(ia) )).

%----ia
fof(axiom_3,axiom,
    ( cowlThing(ia) )).

%----ib
fof(axiom_4,axiom,
    ( cB(ib) )).

%----ib
fof(axiom_5,axiom,
    ( cowlThing(ib) )).

fof(axiom_6,axiom,
    ( ! [X] : ~ ( cB(X)
        & cA(X) ) )).

%----Thing and Nothing
%----String and Integer disjoint
%----ia
%----ib
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & cowlThing(ia)
    & cowlThing(ib)
    & ia != ib )).

%------------------------------------------------------------------------------
