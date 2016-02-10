%------------------------------------------------------------------------------
% File     : KRS174+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : Sets with appropriate extensions are related by unionOf
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_unionOf-Manifest003 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v4.1.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.00 v3.4.0, 0.08 v3.3.0, 0.00 v3.1.0
% Syntax   : Number of formulae    :   15 (   2 unit)
%            Number of atoms       :   41 (  11 equality)
%            Maximal formula depth :    6 (   4 average)
%            Number of connectives :   30 (   4 ~  ;   2  |;  11  &)
%                                         (   6 <=>;   7 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    8 (   0 propositional; 1-2 arity)
%            Number of functors    :    2 (   2 constant; 0-0 arity)
%            Number of variables   :   22 (   0 singleton;  22 !;   0 ?)
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

fof(cA_and_B_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cA_and_B(A) )
       => cA_and_B(B) ) )).

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

%----Enumeration cA
fof(axiom_2,axiom,
    ( ! [X] :
        ( cA(X)
      <=> X = ia ) )).

%----Enumeration cA_and_B
fof(axiom_3,axiom,
    ( ! [X] :
        ( cA_and_B(X)
      <=> ( X = ib
          | X = ia ) ) )).

%----Enumeration cB
fof(axiom_4,axiom,
    ( ! [X] :
        ( cB(X)
      <=> X = ib ) )).

%----ia
fof(axiom_5,axiom,
    ( cowlThing(ia) )).

%----ib
fof(axiom_6,axiom,
    ( cowlThing(ib) )).

%----Thing and Nothing
%----String and Integer disjoint
%----Equality cA_and_B
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & ! [X] :
        ( cA_and_B(X)
      <=> ( cB(X)
          | cA(X) ) ) )).

%------------------------------------------------------------------------------
