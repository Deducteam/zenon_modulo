%--------------------------------------------------------------------------
% File     : MGT057+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Management (Organisation Theory)
% Problem  : Conditions for a constant then increasing hazard of mortality
% Version  : [Han98] axioms.
% English  : In a drifting environment, an endowed organization's hazard of
%            mortality is constant during the period of immunity; beyond the
%            period of immunity, the hazard rises with age.

% Refs     : [Kam00] Kamps (2000), Email to G. Sutcliffe
%            [CH00]  Carroll & Hannan (2000), The Demography of Corporation
%            [Han98] Hannan (1998), Rethinking Age Dependence in Organizati
% Source   : [Kam00]
% Names    : THEOREM 6 [Han98]

% Status   : Theorem
% Rating   : 0.16 v6.1.0, 0.17 v6.0.0, 0.09 v5.5.0, 0.15 v5.4.0, 0.18 v5.3.0, 0.22 v5.2.0, 0.15 v5.1.0, 0.14 v5.0.0, 0.08 v4.1.0, 0.09 v4.0.1, 0.13 v4.0.0, 0.12 v3.7.0, 0.05 v3.4.0, 0.11 v3.3.0, 0.07 v3.2.0, 0.18 v3.1.0, 0.11 v2.7.0, 0.17 v2.6.0, 0.33 v2.5.0, 0.00 v2.4.0
% Syntax   : Number of formulae    :   10 (   0 unit)
%            Number of atoms       :   38 (   6 equality)
%            Maximal formula depth :   11 (   6 average)
%            Number of connectives :   31 (   3 ~  ;   4  |;  14  &)
%                                         (   4 <=>;   6 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    8 (   0 propositional; 1-2 arity)
%            Number of functors    :    4 (   2 constant; 0-2 arity)
%            Number of variables   :   25 (   0 singleton;  25 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : See MGT042+1.p for the mnemonic names.
%--------------------------------------------------------------------------
include('Axioms/MGT001+0.ax').
%--------------------------------------------------------------------------
%----Problem Axioms
%----An endowment provides an immunity that lasts until an
%----organization's age exceeds `eta'.
fof(definition_1,axiom,
    ( ! [X] :
        ( has_endowment(X)
      <=> ! [T] :
            ( organization(X)
            & ( smaller_or_equal(age(X,T),eta)
             => has_immunity(X,T) )
            & ( greater(age(X,T),eta)
             => ~ has_immunity(X,T) ) ) ) )).

%----An organization's hazard of mortality is constant during periods
%----in which it has immunity.
fof(assumption_2,axiom,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & has_immunity(X,T0)
          & has_immunity(X,T) )
       => hazard_of_mortality(X,T0) = hazard_of_mortality(X,T) ) )).

%----An organization's hazard of mortality is lower during periods in
%----which it has immunity than in periods in which it does not.
fof(assumption_3,axiom,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & has_immunity(X,T0)
          & ~ has_immunity(X,T) )
       => greater(hazard_of_mortality(X,T),hazard_of_mortality(X,T0)) ) )).

%----Problem theorems
%----The obsolescence theorem for endowed organizations: In a drifting
%----environment, an endowed organization's hazard of mortality is
%----constant during the period of immunity; beyond the period of
%----immunity, the hazard rises with age.
%----From D1, A2, A3 (text says from L8,9; also needs D<, D<=).
%----
%----Text has redundant quantification over T3.
fof(theorem_6,conjecture,
    ( ! [X,T0,T1,T2] :
        ( ( organization(X)
          & has_endowment(X)
          & age(X,T0) = zero
          & smaller_or_equal(age(X,T1),eta)
          & greater(age(X,T2),eta)
          & greater(eta,zero) )
       => ( greater(hazard_of_mortality(X,T2),hazard_of_mortality(X,T1))
          & hazard_of_mortality(X,T1) = hazard_of_mortality(X,T0) ) ) )).

%--------------------------------------------------------------------------
