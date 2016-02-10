%------------------------------------------------------------------------------
% File     : KRS140+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : Test illustrating extensional semantics of owl:TransitiveProperty
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_TransitiveProperty-Manifest002 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.17 v6.0.0, 0.00 v5.5.0, 0.11 v5.4.0, 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v4.1.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.12 v3.7.0, 0.00 v3.1.0
% Syntax   : Number of formulae    :   15 (   4 unit)
%            Number of atoms       :   40 (   8 equality)
%            Maximal formula depth :    9 (   4 average)
%            Number of connectives :   29 (   4 ~  ;   1  |;  13  &)
%                                         (   2 <=>;   9 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-2 arity)
%            Number of functors    :    2 (   2 constant; 0-0 arity)
%            Number of variables   :   26 (   0 singleton;  25 !;   1 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments : Sean Bechhofer says there are some errors in the encoding of
%            datatypes, so this problem may not be perfect. At least it's
%            still representative of the type of reasoning required for OWL.
%------------------------------------------------------------------------------
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

fof(rsymProp_substitution_1,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rsymProp(A,C) )
       => rsymProp(B,C) ) )).

fof(rsymProp_substitution_2,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rsymProp(C,A) )
       => rsymProp(C,B) ) )).

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

%----Range: rsymProp
fof(axiom_2,axiom,
    ( ! [X,Y] :
        ( rsymProp(X,Y)
       => ( Y = ia
          | Y = ib ) ) )).

%----Symmetric: rsymProp
fof(axiom_3,axiom,
    ( ! [X,Y] :
        ( rsymProp(X,Y)
       => rsymProp(Y,X) ) )).

%----ia
fof(axiom_4,axiom,
    ( cowlThing(ia) )).

fof(axiom_5,axiom,
    ( rsymProp(ia,ia) )).

%----ib
fof(axiom_6,axiom,
    ( cowlThing(ib) )).

fof(axiom_7,axiom,
    ( rsymProp(ib,ib) )).

%----Thing and Nothing
%----String and Integer disjoint
%----Transitive: rsymProp
%----ia
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & ! [X,Y,Z] :
        ( ( rsymProp(X,Y)
          & rsymProp(Y,Z) )
       => rsymProp(X,Z) )
    & ? [X] :
        ( rsymProp(ia,X)
        & cowlThing(X) ) )).

%------------------------------------------------------------------------------
