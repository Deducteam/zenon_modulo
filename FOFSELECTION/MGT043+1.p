%--------------------------------------------------------------------------
% File     : MGT043+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Management (Organisation Theory)
% Problem  : Conditions for a higher hazard of mortality
% Version  : [Han98] axioms.
% English  : When an organization lacks immunity, the growth of internal
%            friction elevates its hazard of mortality when its knowledge and
%            the quality of its ties are constant.

% Refs     : [Kam00] Kamps (2000), Email to G. Sutcliffe
%            [CH00]  Carroll & Hannan (2000), The Demography of Corporation
%            [Han98] Hannan (1998), Rethinking Age Dependence in Organizati
% Source   : [Kam00]
% Names    : LEMMA 2 [Han98]

% Status   : Theorem
% Rating   : 0.20 v6.1.0, 0.23 v6.0.0, 0.13 v5.5.0, 0.19 v5.4.0, 0.21 v5.3.0, 0.30 v5.2.0, 0.20 v5.1.0, 0.24 v5.0.0, 0.17 v4.1.0, 0.13 v4.0.0, 0.12 v3.7.0, 0.15 v3.5.0, 0.16 v3.3.0, 0.21 v3.2.0, 0.27 v3.1.0, 0.44 v2.7.0, 0.50 v2.6.0, 0.33 v2.4.0
% Syntax   : Number of formulae    :   10 (   0 unit)
%            Number of atoms       :   50 (  13 equality)
%            Maximal formula depth :   10 (   6 average)
%            Number of connectives :   45 (   5 ~  ;   4  |;  20  &)
%                                         (   3 <=>;  13 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    7 (   0 propositional; 1-2 arity)
%            Number of functors    :    6 (   0 constant; 2-2 arity)
%            Number of variables   :   25 (   0 singleton;  25 !;   0 ?)
%            Maximal term depth    :    2 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : See MGT042+1.p for the mnemonic names.
%--------------------------------------------------------------------------
include('Axioms/MGT001+0.ax').
%--------------------------------------------------------------------------
%----Problem Axioms
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

%----Problem theorems
%----When an organization lacks immunity, the growth of internal
%----friction elevates its hazard of mortality when its knowledge and
%----the quality of its ties are constant.
%----From A4, A5, and A6 (text says A1-6; also needs D<, D>=, D<=,
%----MP>str, MP>com, MP>tra).
fof(lemma_2,conjecture,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & ~ has_immunity(X,T0)
          & ~ has_immunity(X,T)
          & stock_of_knowledge(X,T) = stock_of_knowledge(X,T0)
          & greater(internal_friction(X,T),internal_friction(X,T0))
          & external_ties(X,T0) = external_ties(X,T) )
       => greater(hazard_of_mortality(X,T),hazard_of_mortality(X,T0)) ) )).

%--------------------------------------------------------------------------
