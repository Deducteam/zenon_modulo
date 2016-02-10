%------------------------------------------------------------------------------
% File     : KRS138+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : Extensional semantics of owl:SymmetricProperty
% Version  : Especial.
% English  : Test illustrating extensional semantics of owl:SymmetricProperty.

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_SymmetricProperty-Manifest002 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v4.1.0, 0.13 v4.0.1, 0.17 v4.0.0, 0.21 v3.7.0, 0.00 v3.2.0, 0.11 v3.1.0
% Syntax   : Number of formulae    :   18 (   5 unit)
%            Number of atoms       :   52 (  13 equality)
%            Maximal formula depth :    9 (   4 average)
%            Number of connectives :   38 (   4 ~  ;   3  |;  17  &)
%                                         (   3 <=>;  11 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    7 (   0 propositional; 1-2 arity)
%            Number of functors    :    3 (   3 constant; 0-0 arity)
%            Number of variables   :   30 (   0 singleton;  30 !;   0 ?)
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

fof(requalityOnA_substitution_1,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & requalityOnA(A,C) )
       => requalityOnA(B,C) ) )).

fof(requalityOnA_substitution_2,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & requalityOnA(C,A) )
       => requalityOnA(C,B) ) )).

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

%----Enumeration cA
fof(axiom_2,axiom,
    ( ! [X] :
        ( cA(X)
      <=> ( X = ib
          | X = ia ) ) )).

%----InverseFunctional: requalityOnA
fof(axiom_3,axiom,
    ( ! [X,Y,Z] :
        ( ( requalityOnA(Y,X)
          & requalityOnA(Z,X) )
       => Y = Z ) )).

%----Range: requalityOnA
fof(axiom_4,axiom,
    ( ! [X,Y] :
        ( requalityOnA(X,Y)
       => cA(Y) ) )).

%----ia
fof(axiom_5,axiom,
    ( cowlThing(ia) )).

fof(axiom_6,axiom,
    ( requalityOnA(ia,ia) )).

%----ib
fof(axiom_7,axiom,
    ( cowlThing(ib) )).

fof(axiom_8,axiom,
    ( requalityOnA(ib,ib) )).

%----ic
fof(axiom_9,axiom,
    ( cowlThing(ic) )).

%----Thing and Nothing
%----String and Integer disjoint
%----Domain: requalityOnA
%----Symmetric: requalityOnA
%----ia
%----ib
%----ic
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & ! [X,Y] :
        ( requalityOnA(X,Y)
       => ( X = ia
          | X = ib
          | X = ic ) )
    & ! [X,Y] :
        ( requalityOnA(X,Y)
       => requalityOnA(Y,X) )
    & cowlThing(ia)
    & requalityOnA(ia,ia)
    & cowlThing(ib)
    & cowlThing(ic) )).

%------------------------------------------------------------------------------
