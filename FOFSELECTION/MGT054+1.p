%--------------------------------------------------------------------------
% File     : MGT054+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Management (Organisation Theory)
% Problem  : Hazard of mortality increases in a drifting environment
% Version  : [Han98] axioms.
% English  : An unendowed organization's hazard of mortality increases with
%            age in a drifting environment.

% Refs     : [Kam00] Kamps (2000), Email to G. Sutcliffe
%            [CH00]  Carroll & Hannan (2000), The Demography of Corporation
%            [Han98] Hannan (1998), Rethinking Age Dependence in Organizati
% Source   : [Kam00]
% Names    : THEOREM 5 [Han98]

% Status   : Theorem
% Rating   : 0.20 v6.1.0, 0.23 v6.0.0, 0.30 v5.5.0, 0.26 v5.4.0, 0.25 v5.3.0, 0.30 v5.2.0, 0.20 v5.1.0, 0.19 v5.0.0, 0.21 v4.1.0, 0.22 v4.0.1, 0.26 v4.0.0, 0.25 v3.7.0, 0.20 v3.5.0, 0.16 v3.3.0, 0.14 v3.2.0, 0.27 v3.1.0, 0.22 v2.7.0, 0.17 v2.6.0, 0.33 v2.5.0, 0.17 v2.4.0
% Syntax   : Number of formulae    :   14 (   0 unit)
%            Number of atoms       :   50 (   6 equality)
%            Maximal formula depth :   11 (   6 average)
%            Number of connectives :   45 (   9 ~  ;   4  |;  18  &)
%                                         (   6 <=>;   8 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   10 (   0 propositional; 1-3 arity)
%            Number of functors    :    5 (   2 constant; 0-2 arity)
%            Number of variables   :   36 (   0 singleton;  36 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
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

%----An organization's hazard of mortality is lower during periods in
%----which it has immunity than in periods in which it does not.
fof(assumption_3,axiom,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & has_immunity(X,T0)
          & ~ has_immunity(X,T) )
       => greater(hazard_of_mortality(X,T),hazard_of_mortality(X,T0)) ) )).

%----Two states of the environment are dissimilar for an organization
%----if and only if the organization cannot be aligned to both.
%----
%----Added quantification over X.
fof(definition_2,axiom,
    ( ! [X,T0,T] :
        ( dissimilar(X,T0,T)
      <=> ( organization(X)
          & ~ ( is_aligned(X,T0)
            <=> is_aligned(X,T) ) ) ) )).

%----An organization is aligned with the state of the environment at
%----its time of founding.
fof(assumption_13,axiom,
    ( ! [X,T] :
        ( ( organization(X)
          & age(X,T) = zero )
       => is_aligned(X,T) ) )).

%----An organization's capability is higher in the state of the
%----environment to which it is aligned.
%----
%----Changed dissimilar(X,T0,T) to ~ is_aligned(X,T).
%----This makes theorem 5,9,10,11 and lemma 8 derivable.
fof(assumption_14,axiom,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & is_aligned(X,T0)
          & ~ is_aligned(X,T) )
       => greater(capability(X,T0),capability(X,T)) ) )).

%----Environmental drift: the environments at times separated by more
%----than `sigma' are dissimilar.
fof(assumption_15,axiom,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & age(X,T0) = zero )
       => ( greater(age(X,T),sigma)
        <=> dissimilar(X,T0,T) ) ) )).

%----Superiority in capability lowers the hazard of mortality when an
%----organization lacks immunity.
fof(assumption_16,axiom,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & ~ has_immunity(X,T0)
          & ~ has_immunity(X,T)
          & greater(capability(X,T),capability(X,T0)) )
       => greater(hazard_of_mortality(X,T0),hazard_of_mortality(X,T)) ) )).

%----Problem theorems
%----The obsolescence theorem for unendowed organizations (Barron et
%----al. 1994): an unendowed organization's hazard of mortality
%----increases with age in a drifting environment.
%----From D2, A1, A3, A13-16 (text says D1-2, A1-3, 13-16; also needs D<,
%----D<=, MP>str).
fof(theorem_5,conjecture,
    ( ! [X,T0,T1,T2] :
        ( ( organization(X)
          & ~ has_endowment(X)
          & age(X,T0) = zero
          & smaller_or_equal(age(X,T1),sigma)
          & greater(age(X,T2),sigma)
          & greater(sigma,zero) )
       => greater(hazard_of_mortality(X,T2),hazard_of_mortality(X,T1)) ) )).

%--------------------------------------------------------------------------
