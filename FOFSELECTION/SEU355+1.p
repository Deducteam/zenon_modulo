%------------------------------------------------------------------------------
% File     : SEU355+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem t6_yellow_0
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-t6_yellow_0 [Urb07]

% Status   : Theorem
% Rating   : 0.04 v6.1.0, 0.10 v6.0.0, 0.09 v5.5.0, 0.04 v5.4.0, 0.07 v5.3.0, 0.04 v5.2.0, 0.00 v5.0.0, 0.04 v4.0.0, 0.08 v3.7.0, 0.05 v3.4.0, 0.11 v3.3.0
% Syntax   : Number of formulae    :   22 (  10 unit)
%            Number of atoms       :   46 (   2 equality)
%            Maximal formula depth :   10 (   4 average)
%            Number of connectives :   30 (   6 ~  ;   1  |;   5  &)
%                                         (   2 <=>;  16 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   11 (   1 propositional; 0-3 arity)
%            Number of functors    :    2 (   1 constant; 0-1 arity)
%            Number of variables   :   30 (   0 singleton;  24 !;   6 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(antisymmetry_r2_hidden,axiom,(
    ! [A,B] :
      ( in(A,B)
     => ~ in(B,A) ) )).

fof(cc1_finset_1,axiom,(
    ! [A] :
      ( empty(A)
     => finite(A) ) )).

fof(d8_lattice3,axiom,(
    ! [A] :
      ( rel_str(A)
     => ! [B,C] :
          ( element(C,the_carrier(A))
         => ( relstr_element_smaller(A,B,C)
          <=> ! [D] :
                ( element(D,the_carrier(A))
               => ( in(D,B)
                 => related(A,C,D) ) ) ) ) ) )).

fof(d9_lattice3,axiom,(
    ! [A] :
      ( rel_str(A)
     => ! [B,C] :
          ( element(C,the_carrier(A))
         => ( relstr_set_smaller(A,B,C)
          <=> ! [D] :
                ( element(D,the_carrier(A))
               => ( in(D,B)
                 => related(A,D,C) ) ) ) ) ) )).

fof(dt_k1_xboole_0,axiom,(
    $true )).

fof(dt_l1_orders_2,axiom,(
    ! [A] :
      ( rel_str(A)
     => one_sorted_str(A) ) )).

fof(dt_l1_struct_0,axiom,(
    $true )).

fof(dt_m1_subset_1,axiom,(
    $true )).

fof(dt_u1_struct_0,axiom,(
    $true )).

fof(existence_l1_orders_2,axiom,(
    ? [A] : rel_str(A) )).

fof(existence_l1_struct_0,axiom,(
    ? [A] : one_sorted_str(A) )).

fof(existence_m1_subset_1,axiom,(
    ! [A] :
    ? [B] : element(B,A) )).

fof(fc1_xboole_0,axiom,(
    empty(empty_set) )).

fof(rc1_finset_1,axiom,(
    ? [A] :
      ( ~ empty(A)
      & finite(A) ) )).

fof(rc1_xboole_0,axiom,(
    ? [A] : empty(A) )).

fof(rc2_xboole_0,axiom,(
    ? [A] : ~ empty(A) )).

fof(t1_subset,axiom,(
    ! [A,B] :
      ( in(A,B)
     => element(A,B) ) )).

fof(t2_subset,axiom,(
    ! [A,B] :
      ( element(A,B)
     => ( empty(B)
        | in(A,B) ) ) )).

fof(t6_boole,axiom,(
    ! [A] :
      ( empty(A)
     => A = empty_set ) )).

fof(t6_yellow_0,conjecture,(
    ! [A] :
      ( rel_str(A)
     => ! [B] :
          ( element(B,the_carrier(A))
         => ( relstr_set_smaller(A,empty_set,B)
            & relstr_element_smaller(A,empty_set,B) ) ) ) )).

fof(t7_boole,axiom,(
    ! [A,B] : ~ ( in(A,B)
      & empty(B) ) )).

fof(t8_boole,axiom,(
    ! [A,B] : ~ ( empty(A)
      & A != B
      & empty(B) ) )).

%------------------------------------------------------------------------------
