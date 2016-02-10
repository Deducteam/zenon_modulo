%------------------------------------------------------------------------------
% File     : SEU275+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem t7_wellord2
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-t7_wellord2 [Urb07]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v5.0.0, 0.05 v4.1.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   11 (   4 unit)
%            Number of atoms       :   26 (   0 equality)
%            Maximal formula depth :    8 (   3 average)
%            Number of connectives :   15 (   0 ~  ;   0  |;   8  &)
%                                         (   1 <=>;   6 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   10 (   0 propositional; 1-1 arity)
%            Number of functors    :    1 (   0 constant; 1-1 arity)
%            Number of variables   :   11 (   0 singleton;  10 !;   1 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(cc1_ordinal1,axiom,(
    ! [A] :
      ( ordinal(A)
     => ( epsilon_transitive(A)
        & epsilon_connected(A) ) ) )).

fof(cc2_ordinal1,axiom,(
    ! [A] :
      ( ( epsilon_transitive(A)
        & epsilon_connected(A) )
     => ordinal(A) ) )).

fof(d4_wellord1,axiom,(
    ! [A] :
      ( relation(A)
     => ( well_ordering(A)
      <=> ( reflexive(A)
          & transitive(A)
          & antisymmetric(A)
          & connected(A)
          & well_founded_relation(A) ) ) ) )).

fof(dt_k1_wellord2,axiom,(
    ! [A] : relation(inclusion_relation(A)) )).

fof(rc1_ordinal1,axiom,(
    ? [A] :
      ( epsilon_transitive(A)
      & epsilon_connected(A)
      & ordinal(A) ) )).

fof(t2_wellord2,axiom,(
    ! [A] : reflexive(inclusion_relation(A)) )).

fof(t3_wellord2,axiom,(
    ! [A] : transitive(inclusion_relation(A)) )).

fof(t4_wellord2,axiom,(
    ! [A] :
      ( ordinal(A)
     => connected(inclusion_relation(A)) ) )).

fof(t5_wellord2,axiom,(
    ! [A] : antisymmetric(inclusion_relation(A)) )).

fof(t6_wellord2,axiom,(
    ! [A] :
      ( ordinal(A)
     => well_founded_relation(inclusion_relation(A)) ) )).

fof(t7_wellord2,conjecture,(
    ! [A] :
      ( ordinal(A)
     => well_ordering(inclusion_relation(A)) ) )).

%------------------------------------------------------------------------------
