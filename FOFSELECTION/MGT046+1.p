%--------------------------------------------------------------------------
% File     : MGT046+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Management (Organisation Theory)
% Problem  : Unendowed organization's hazard of mortality declines with age
% Version  : [Han98] axioms.
% English  : An unendowed organization's hazard of mortality declines
%            monotonically with its age.

% Refs     : [Kam00] Kamps (2000), Email to G. Sutcliffe
%            [CH00]  Carroll & Hannan (2000), The Demography of Corporation
%            [Han98] Hannan (1998), Rethinking Age Dependence in Organizati
% Source   : [Kam00]
% Names    : THEOREM 1 [Han98]

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.17 v6.0.0, 0.13 v5.5.0, 0.11 v5.4.0, 0.14 v5.3.0, 0.22 v5.2.0, 0.10 v5.0.0, 0.12 v4.1.0, 0.09 v4.0.0, 0.08 v3.7.0, 0.10 v3.5.0, 0.11 v3.4.0, 0.16 v3.3.0, 0.21 v3.2.0, 0.27 v3.1.0, 0.22 v2.7.0, 0.17 v2.4.0
% Syntax   : Number of formulae    :   14 (   0 unit)
%            Number of atoms       :   58 (  12 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   50 (   6 ~  ;   4  |;  20  &)
%                                         (   3 <=>;  17 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    8 (   0 propositional; 1-2 arity)
%            Number of functors    :    7 (   0 constant; 2-2 arity)
%            Number of variables   :   36 (   0 singleton;  36 !;   0 ?)
%            Maximal term depth    :    2 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : See MGT042+1.p for the mnemonic names.
%--------------------------------------------------------------------------
include('Axioms/MGT001+0.ax').
%--------------------------------------------------------------------------
%----Problem Axioms
%----An unendowed organization never possesses immunity.
fof(assumption_1,axiom,
    ( ! [X,T] :
        ( ( organization(X)
          & ~ has_endowment(X) )
       => ~ has_immunity(X,T) ) )).

%----When an organization lacks immunity, superior capability and
%----position imply a lower hazard of mortality.
fof(assumption_4,axiom,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & ~ has_immunity(X,T0)
          & ~ has_immunity(X,T) )
       => ( ( ( greater(capability(X,T),capability(X,T0))
              & greater_or_equal(position(X,T),position(X,T0)) )
           => smaller(hazard_of_mortality(X,T),hazard_of_mortality(X,T0)) )
          & ( ( greater_or_equal(capability(X,T),capability(X,T0))
              & greater(position(X,T),position(X,T0)) )
           => smaller(hazard_of_mortality(X,T),hazard_of_mortality(X,T0)) )
          & ( ( capability(X,T) = capability(X,T0)
              & position(X,T) = position(X,T0) )
           => hazard_of_mortality(X,T) = hazard_of_mortality(X,T0) ) ) ) )).

%----Increased knowledge elevates an organization's capability; and
%----increased accumulation of organizational internal frictions
%----diminishes its capability.
fof(assumption_5,axiom,
    ( ! [X,T0,T] :
        ( organization(X)
       => ( ( ( greater(stock_of_knowledge(X,T),stock_of_knowledge(X,T0))
              & smaller_or_equal(internal_friction(X,T),internal_friction(X,T0)) )
           => greater(capability(X,T),capability(X,T0)) )
          & ( ( smaller_or_equal(stock_of_knowledge(X,T),stock_of_knowledge(X,T0))
              & greater(internal_friction(X,T),internal_friction(X,T0)) )
           => smaller(capability(X,T),capability(X,T0)) )
          & ( ( stock_of_knowledge(X,T) = stock_of_knowledge(X,T0)
              & internal_friction(X,T) = internal_friction(X,T0) )
           => capability(X,T) = capability(X,T0) ) ) ) )).

%----Improved ties with external actors enhance an organization's position.
fof(assumption_6,axiom,
    ( ! [X,T0,T] :
        ( organization(X)
       => ( ( greater(external_ties(X,T),external_ties(X,T0))
           => greater(position(X,T),position(X,T0)) )
          & ( external_ties(X,T) = external_ties(X,T0)
           => position(X,T) = position(X,T0) ) ) ) )).

%----Case: liability of Newness (Ass. 7-9).
%----
%----An organization's stock of knowledge increases monotonically with
%----its age.
fof(assumption_7,axiom,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & greater(age(X,T),age(X,T0)) )
       => greater(stock_of_knowledge(X,T),stock_of_knowledge(X,T0)) ) )).

%----The quality of an organization's external ties increases
%----monotonically with its age.
fof(assumption_8,axiom,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & greater(age(X,T),age(X,T0)) )
       => greater(external_ties(X,T),external_ties(X,T0)) ) )).

%----The quality of an organization's internal friction does not vary
%----with its age.
fof(assumption_9,axiom,
    ( ! [X,T0,T] :
        ( organization(X)
       => internal_friction(X,T) = internal_friction(X,T0) ) )).

%----Problem theorems
%----The liability-of-newness theorem (Stinchcombe 1965): an unendowed
%----organization's hazard of mortality declines monotonically with
%----its age.
%----From A1 and A4-9 (text says D1, A1-4, L1-2; also needs D<=, D>=).
fof(theorem_1,conjecture,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & ~ has_endowment(X)
          & greater(age(X,T),age(X,T0)) )
       => smaller(hazard_of_mortality(X,T),hazard_of_mortality(X,T0)) ) )).

%--------------------------------------------------------------------------
