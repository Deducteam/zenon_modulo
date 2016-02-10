%------------------------------------------------------------------------------
% File     : CSR147+1 : TPTP v6.1.0. Released v4.1.0.
% Domain   : Commonsense Reasoning
% Problem  : My experienced brother
% Version  : Especial.
% English  : An older human sibling is more experienced than a younger one, or 
%            the younger one has seen more of the world.

% Refs     : 
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.04 v6.1.0, 0.10 v6.0.0, 0.04 v5.4.0, 0.07 v5.3.0, 0.15 v5.2.0, 0.00 v4.1.0
% Syntax   : Number of formulae    :   14 (  10 unit)
%            Number of atoms       :   24 (   3 equality)
%            Maximal formula depth :    8 (   2 average)
%            Number of connectives :   11 (   1   ~;   1   |;   3   &)
%                                         (   0 <=>;   6  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    7 (   0 propositional; 1-2 arity)
%            Number of functors    :    5 (   4 constant; 0-1 arity)
%            Number of variables   :    9 (   0 sgn;   7   !;   2   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : 
%------------------------------------------------------------------------------
fof(human_type,axiom,(
    ? [A] : s__Human(A) )).

fof(living_type,axiom,(
    ? [A] : s__LivingThing(A) )).

fof(humans_are_living,axiom,(
    ! [A] : 
      ( s__Human(A)
     => s__LivingThing(A) ) )).

fof(geoff_human,axiom,(
    s__Human(geoff) )).

fof(jim_human,axiom,(
    s__Human(jim) )).

fof(sibling_type,axiom,(
    ! [A] : 
      ( s__Human(A)
     => s__Human(s__siblingFn(A)) ) )).

fof(experience,axiom,(
    ! [O,OAge,YAge] : 
      ( s__Human(O)
     => ( ( s__age(O,OAge)
          & s__age(s__siblingFn(O),YAge)
          & greater(OAge,YAge) )
       => ( s__more_experienced(O,s__siblingFn(O))
          | s__has_seen_more(s__siblingFn(O),O) ) ) ) )).

fof(sibling_symmetry,axiom,(
    ! [X,Y] : 
      ( ( s__Human(X)
        & s__Human(Y) )
     => ( X = s__siblingFn(Y)
       => Y = s__siblingFn(X) ) ) )).

fof(geoff_48,axiom,(
    s__age(geoff,n48) )).

fof(jim_54,axiom,(
    s__age(jim,n54) )).

fof(greater_54_48,axiom,(
    greater(n54,n48) )).

fof(geoff_and_jim,axiom,
    ( geoff = s__siblingFn(jim) )).

fof(jim_has_seen_more,axiom,(
    ~ s__has_seen_more(geoff,jim) )).

fof(jim_is_experienced,conjecture,(
    s__more_experienced(jim,geoff) )).
%------------------------------------------------------------------------------
