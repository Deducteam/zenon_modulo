%------------------------------------------------------------------------------
% File     : KRS169+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : hasLeader may be stated as the owl:equivalentProperty of hasHead
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_equivalentProperty-Manifest001 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v3.7.0, 0.33 v3.5.0, 0.12 v3.4.0, 0.08 v3.3.0, 0.00 v3.2.0, 0.11 v3.1.0
% Syntax   : Number of formulae    :    7 (   3 unit)
%            Number of atoms       :   16 (   0 equality)
%            Maximal formula depth :    6 (   3 average)
%            Number of connectives :   13 (   4 ~  ;   0  |;   6  &)
%                                         (   3 <=>;   0 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-2 arity)
%            Number of functors    :    2 (   2 constant; 0-0 arity)
%            Number of variables   :    6 (   0 singleton;   6 !;   0 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments : Sean Bechhofer says there are some errors in the encoding of
%            datatypes, so this problem may not be perfect. At least it's
%            still representative of the type of reasoning required for OWL.
%------------------------------------------------------------------------------
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

%----iX
fof(axiom_2,axiom,
    ( cowlThing(iX) )).

fof(axiom_3,axiom,
    ( rhasLeader(iX,iY) )).

%----iY
fof(axiom_4,axiom,
    ( cowlThing(iY) )).

fof(axiom_5,axiom,
    ( ! [X,Y] :
        ( rhasLeader(X,Y)
      <=> rhasHead(X,Y) ) )).

%----Thing and Nothing
%----String and Integer disjoint
%----iX
%----iY
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & cowlThing(iX)
    & rhasHead(iX,iY)
    & cowlThing(iY) )).

%------------------------------------------------------------------------------
