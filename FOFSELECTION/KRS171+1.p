%------------------------------------------------------------------------------
% File     : KRS171+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : The inverse entailment of test 002 also holds
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_equivalentProperty-Manifest003 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v3.1.0
% Syntax   : Number of formulae    :    5 (   0 unit)
%            Number of atoms       :   14 (   0 equality)
%            Maximal formula depth :    6 (   4 average)
%            Number of connectives :   13 (   4 ~  ;   0  |;   4  &)
%                                         (   3 <=>;   2 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   10 (   0 singleton;  10 !;   0 ?)
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

fof(axiom_2,axiom,
    ( ! [X,Y] :
        ( rhasHead(X,Y)
       => rhasLeader(X,Y) ) )).

fof(axiom_3,axiom,
    ( ! [X,Y] :
        ( rhasLeader(X,Y)
       => rhasHead(X,Y) ) )).

%----Thing and Nothing
%----String and Integer disjoint
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & ! [X,Y] :
        ( rhasLeader(X,Y)
      <=> rhasHead(X,Y) ) )).

%------------------------------------------------------------------------------
