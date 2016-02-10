%------------------------------------------------------------------------------
% File     : SEU244+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem t8_wellord1
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-t8_wellord1 [Urb07]

% Status   : Theorem
% Rating   : 0.04 v6.1.0, 0.07 v6.0.0, 0.04 v5.4.0, 0.07 v5.3.0, 0.11 v5.2.0, 0.00 v4.0.1, 0.04 v4.0.0, 0.08 v3.7.0, 0.05 v3.3.0
% Syntax   : Number of formulae    :   15 (   6 unit)
%            Number of atoms       :   40 (   3 equality)
%            Maximal formula depth :    9 (   4 average)
%            Number of connectives :   25 (   0 ~  ;   0  |;   8  &)
%                                         (   8 <=>;   9 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   15 (   1 propositional; 0-2 arity)
%            Number of functors    :    4 (   0 constant; 1-2 arity)
%            Number of variables   :   14 (   1 singleton;  14 !;   0 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(commutativity_k2_xboole_0,axiom,(
    ! [A,B] : set_union2(A,B) = set_union2(B,A) )).

fof(d12_relat_2,axiom,(
    ! [A] :
      ( relation(A)
     => ( antisymmetric(A)
      <=> is_antisymmetric_in(A,relation_field(A)) ) ) )).

fof(d14_relat_2,axiom,(
    ! [A] :
      ( relation(A)
     => ( connected(A)
      <=> is_connected_in(A,relation_field(A)) ) ) )).

fof(d16_relat_2,axiom,(
    ! [A] :
      ( relation(A)
     => ( transitive(A)
      <=> is_transitive_in(A,relation_field(A)) ) ) )).

fof(d4_wellord1,axiom,(
    ! [A] :
      ( relation(A)
     => ( well_ordering(A)
      <=> ( reflexive(A)
          & transitive(A)
          & antisymmetric(A)
          & connected(A)
          & well_founded_relation(A) ) ) ) )).

fof(d5_wellord1,axiom,(
    ! [A] :
      ( relation(A)
     => ! [B] :
          ( well_orders(A,B)
        <=> ( is_reflexive_in(A,B)
            & is_transitive_in(A,B)
            & is_antisymmetric_in(A,B)
            & is_connected_in(A,B)
            & is_well_founded_in(A,B) ) ) ) )).

fof(d6_relat_1,axiom,(
    ! [A] :
      ( relation(A)
     => relation_field(A) = set_union2(relation_dom(A),relation_rng(A)) ) )).

fof(d9_relat_2,axiom,(
    ! [A] :
      ( relation(A)
     => ( reflexive(A)
      <=> is_reflexive_in(A,relation_field(A)) ) ) )).

fof(dt_k1_relat_1,axiom,(
    $true )).

fof(dt_k2_relat_1,axiom,(
    $true )).

fof(dt_k2_xboole_0,axiom,(
    $true )).

fof(dt_k3_relat_1,axiom,(
    $true )).

fof(idempotence_k2_xboole_0,axiom,(
    ! [A,B] : set_union2(A,A) = A )).

fof(t5_wellord1,axiom,(
    ! [A] :
      ( relation(A)
     => ( well_founded_relation(A)
      <=> is_well_founded_in(A,relation_field(A)) ) ) )).

fof(t8_wellord1,conjecture,(
    ! [A] :
      ( relation(A)
     => ( well_orders(A,relation_field(A))
      <=> well_ordering(A) ) ) )).

%------------------------------------------------------------------------------
