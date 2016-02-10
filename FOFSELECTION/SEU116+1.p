%------------------------------------------------------------------------------
% File     : SEU116+1 : TPTP v6.1.0. Released v3.2.0.
% Domain   : Set theory
% Problem  : Boolean domains, theorem 30
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [TD90]  Trybulec & Darmochwal (1990), Boolean Domains
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : finsub_1__t30_finsub_1 [Urb06]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.03 v6.0.0, 0.00 v5.5.0, 0.04 v5.3.0, 0.11 v5.2.0, 0.00 v3.2.0
% Syntax   : Number of formulae    :   31 (   7 unit)
%            Number of atoms       :   82 (   2 equality)
%            Maximal formula depth :   12 (   5 average)
%            Number of connectives :   68 (  17 ~  ;   1  |;  34  &)
%                                         (   1 <=>;  15 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   17 (   0 propositional; 1-2 arity)
%            Number of functors    :    3 (   1 constant; 0-1 arity)
%            Number of variables   :   50 (   1 singleton;  40 !;  10 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : subset(A,A) )).

fof(antisymmetry_r2_hidden,axiom,(
    ! [A,B] :
      ( in(A,B)
     => ~ in(B,A) ) )).

fof(fc1_xboole_0,axiom,(
    empty(empty_set) )).

fof(t1_subset,axiom,(
    ! [A,B] :
      ( in(A,B)
     => element(A,B) ) )).

fof(t4_subset,axiom,(
    ! [A,B,C] :
      ( ( in(A,B)
        & element(B,powerset(C)) )
     => element(A,C) ) )).

fof(t5_subset,axiom,(
    ! [A,B,C] :
      ~ ( in(A,B)
        & element(B,powerset(C))
        & empty(C) ) )).

fof(t8_boole,axiom,(
    ! [A,B] :
      ~ ( empty(A)
        & A != B
        & empty(B) ) )).

fof(fc1_finsub_1,axiom,(
    ! [A] :
      ( ~ empty(powerset(A))
      & cup_closed(powerset(A))
      & diff_closed(powerset(A))
      & preboolean(powerset(A)) ) )).

fof(cc1_finsub_1,axiom,(
    ! [A] :
      ( preboolean(A)
     => ( cup_closed(A)
        & diff_closed(A) ) ) )).

fof(cc2_finsub_1,axiom,(
    ! [A] :
      ( ( cup_closed(A)
        & diff_closed(A) )
     => preboolean(A) ) )).

fof(cc1_finset_1,axiom,(
    ! [A] :
      ( empty(A)
     => finite(A) ) )).

fof(cc2_finset_1,axiom,(
    ! [A] :
      ( finite(A)
     => ! [B] :
          ( element(B,powerset(A))
         => finite(B) ) ) )).

fof(fc1_subset_1,axiom,(
    ! [A] : ~ empty(powerset(A)) )).

fof(t2_subset,axiom,(
    ! [A,B] :
      ( element(A,B)
     => ( empty(B)
        | in(A,B) ) ) )).

fof(t3_subset,axiom,(
    ! [A,B] :
      ( element(A,powerset(B))
    <=> subset(A,B) ) )).

fof(t6_boole,axiom,(
    ! [A] :
      ( empty(A)
     => A = empty_set ) )).

fof(t7_boole,axiom,(
    ! [A,B] :
      ~ ( in(A,B)
        & empty(B) ) )).

fof(existence_m1_subset_1,axiom,(
    ! [A] :
    ? [B] : element(B,A) )).

fof(dt_k5_finsub_1,axiom,(
    ! [A] : preboolean(finite_subsets(A)) )).

fof(fc2_finsub_1,axiom,(
    ! [A] :
      ( ~ empty(finite_subsets(A))
      & cup_closed(finite_subsets(A))
      & diff_closed(finite_subsets(A))
      & preboolean(finite_subsets(A)) ) )).

fof(cc3_finsub_1,axiom,(
    ! [A,B] :
      ( element(B,finite_subsets(A))
     => finite(B) ) )).

fof(rc1_finsub_1,axiom,(
    ? [A] :
      ( ~ empty(A)
      & cup_closed(A)
      & cap_closed(A)
      & diff_closed(A)
      & preboolean(A) ) )).

fof(rc1_finset_1,axiom,(
    ? [A] :
      ( ~ empty(A)
      & finite(A) ) )).

fof(rc2_finset_1,axiom,(
    ! [A] :
    ? [B] :
      ( element(B,powerset(A))
      & empty(B)
      & relation(B)
      & function(B)
      & one_to_one(B)
      & epsilon_transitive(B)
      & epsilon_connected(B)
      & ordinal(B)
      & natural(B)
      & finite(B) ) )).

fof(rc3_finset_1,axiom,(
    ! [A] :
      ( ~ empty(A)
     => ? [B] :
          ( element(B,powerset(A))
          & ~ empty(B)
          & finite(B) ) ) )).

fof(rc4_finset_1,axiom,(
    ! [A] :
      ( ~ empty(A)
     => ? [B] :
          ( element(B,powerset(A))
          & ~ empty(B)
          & finite(B) ) ) )).

fof(rc1_subset_1,axiom,(
    ! [A] :
      ( ~ empty(A)
     => ? [B] :
          ( element(B,powerset(A))
          & ~ empty(B) ) ) )).

fof(rc2_subset_1,axiom,(
    ! [A] :
    ? [B] :
      ( element(B,powerset(A))
      & empty(B) ) )).

fof(rc1_xboole_0,axiom,(
    ? [A] : empty(A) )).

fof(rc2_xboole_0,axiom,(
    ? [A] : ~ empty(A) )).

fof(t30_finsub_1,conjecture,(
    ! [A,B] :
      ( element(B,finite_subsets(A))
     => finite(B) ) )).
%------------------------------------------------------------------------------
