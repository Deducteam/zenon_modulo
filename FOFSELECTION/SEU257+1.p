%------------------------------------------------------------------------------
% File     : SEU257+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem t32_wellord1
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-t32_wellord1 [Urb07]

% Status   : Theorem
% Rating   : 0.04 v6.1.0, 0.07 v6.0.0, 0.04 v5.4.0, 0.07 v5.3.0, 0.11 v5.2.0, 0.00 v4.0.0, 0.04 v3.7.0, 0.05 v3.3.0
% Syntax   : Number of formulae    :   13 (   4 unit)
%            Number of atoms       :   33 (   3 equality)
%            Maximal formula depth :    8 (   4 average)
%            Number of connectives :   20 (   0 ~  ;   0  |;   4  &)
%                                         (   1 <=>;  15 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    9 (   1 propositional; 0-2 arity)
%            Number of functors    :    3 (   0 constant; 2-2 arity)
%            Number of variables   :   21 (   1 singleton;  21 !;   0 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(commutativity_k3_xboole_0,axiom,(
    ! [A,B] : set_intersection2(A,B) = set_intersection2(B,A) )).

fof(d4_wellord1,axiom,(
    ! [A] :
      ( relation(A)
     => ( well_ordering(A)
      <=> ( reflexive(A)
          & transitive(A)
          & antisymmetric(A)
          & connected(A)
          & well_founded_relation(A) ) ) ) )).

fof(d6_wellord1,axiom,(
    ! [A] :
      ( relation(A)
     => ! [B] : relation_restriction(A,B) = set_intersection2(A,cartesian_product2(B,B)) ) )).

fof(dt_k2_wellord1,axiom,(
    ! [A,B] :
      ( relation(A)
     => relation(relation_restriction(A,B)) ) )).

fof(dt_k2_zfmisc_1,axiom,(
    $true )).

fof(dt_k3_xboole_0,axiom,(
    $true )).

fof(idempotence_k3_xboole_0,axiom,(
    ! [A,B] : set_intersection2(A,A) = A )).

fof(t22_wellord1,axiom,(
    ! [A,B] :
      ( relation(B)
     => ( reflexive(B)
       => reflexive(relation_restriction(B,A)) ) ) )).

fof(t23_wellord1,axiom,(
    ! [A,B] :
      ( relation(B)
     => ( connected(B)
       => connected(relation_restriction(B,A)) ) ) )).

fof(t24_wellord1,axiom,(
    ! [A,B] :
      ( relation(B)
     => ( transitive(B)
       => transitive(relation_restriction(B,A)) ) ) )).

fof(t25_wellord1,axiom,(
    ! [A,B] :
      ( relation(B)
     => ( antisymmetric(B)
       => antisymmetric(relation_restriction(B,A)) ) ) )).

fof(t31_wellord1,axiom,(
    ! [A,B] :
      ( relation(B)
     => ( well_founded_relation(B)
       => well_founded_relation(relation_restriction(B,A)) ) ) )).

fof(t32_wellord1,conjecture,(
    ! [A,B] :
      ( relation(B)
     => ( well_ordering(B)
       => well_ordering(relation_restriction(B,A)) ) ) )).

%------------------------------------------------------------------------------
