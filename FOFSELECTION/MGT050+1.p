%--------------------------------------------------------------------------
% File     : MGT050+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Management (Organisation Theory)
% Problem  : Unendowed organization's hazard of mortality increases with age
% Version  : [Han98] axioms.
% English  : An unendowed organization's hazard of mortality increases with
%            its age.

% Refs     : [Kam00] Kamps (2000), Email to G. Sutcliffe
%            [CH00]  Carroll & Hannan (2000), The Demography of Corporation
%            [Han98] Hannan (1998), Rethinking Age Dependence in Organizati
% Source   : [Kam00]
% Names    : THEOREM 3 [Han98]

% Status   : Theorem
% Rating   : 0.16 v6.1.0, 0.27 v6.0.0, 0.17 v5.5.0, 0.19 v5.4.0, 0.25 v5.3.0, 0.30 v5.2.0, 0.20 v5.1.0, 0.19 v5.0.0, 0.25 v4.1.0, 0.17 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.10 v3.5.0, 0.11 v3.4.0, 0.16 v3.3.0, 0.14 v3.2.0, 0.27 v3.1.0, 0.22 v2.7.0, 0.17 v2.6.0, 0.33 v2.5.0, 0.17 v2.4.0
% Syntax   : Number of formulae    :   14 (   0 unit)
%            Number of atoms       :   57 (  13 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   49 (   6 ~  ;   4  |;  19  &)
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

%----Case: liability of senescence (Ass. 10-12 replacing A7-9)!
%----
%----An organization's stock of knowledge does not vary with its age
%----(contra assumption 7).
fof(assumption_10,axiom,
    ( ! [X,T0,T] :
        ( organization(X)
       => stock_of_knowledge(X,T) = stock_of_knowledge(X,T0) ) )).

%----The quality of an organization's external ties does not vary with
%----its age (contra assumption 8).
fof(assumption_11,axiom,
    ( ! [X,T0,T] :
        ( organization(X)
       => external_ties(X,T) = external_ties(X,T0) ) )).

%----The quality of an organization's internal friction increases
%----monotonically with its age (contra assumption 9).
fof(assumption_12,axiom,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & greater(age(X,T),age(X,T0)) )
       => greater(internal_friction(X,T),internal_friction(X,T0)) ) )).

%----Problem theorems
%----The senescence theorem for unendowed organizations (Barron et
%----al. 1994): an unendowed organization's hazard of mortality
%----increases with its age.
%----From A1, A4-6, and A10-12 (text says D1, A1-4, L5-6; also needs D<,
%----D<=, D>=).
fof(theorem_3,conjecture,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & ~ has_endowment(X)
          & greater(age(X,T),age(X,T0)) )
       => greater(hazard_of_mortality(X,T),hazard_of_mortality(X,T0)) ) )).

%--------------------------------------------------------------------------
