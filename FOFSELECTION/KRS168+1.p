%------------------------------------------------------------------------------
% File     : KRS168+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : De Morgan's law
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_equivalentClass-Manifest006 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v4.0.0, 0.05 v3.7.0, 0.00 v3.3.0, 0.11 v3.1.0
% Syntax   : Number of formulae    :    3 (   0 unit)
%            Number of atoms       :   12 (   0 equality)
%            Maximal formula depth :    7 (   5 average)
%            Number of connectives :   16 (   7 ~  ;   1  |;   5  &)
%                                         (   3 <=>;   0 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-1 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :    5 (   0 singleton;   5 !;   0 ?)
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
        ( ( ~ cB(X)
          & ~ cA(X) )
      <=> ~ ( cA(X)
            | cB(X) ) ) )).

%------------------------------------------------------------------------------
