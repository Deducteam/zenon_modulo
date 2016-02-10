%------------------------------------------------------------------------------
% File     : SEU361+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem t44_yellow_0
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-t44_yellow_0 [Urb07]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.10 v6.0.0, 0.04 v5.5.0, 0.07 v5.3.0, 0.11 v5.2.0, 0.00 v5.0.0, 0.08 v4.1.0, 0.09 v4.0.0, 0.12 v3.7.0, 0.10 v3.5.0, 0.11 v3.3.0
% Syntax   : Number of formulae    :   28 (  10 unit)
%            Number of atoms       :   72 (   5 equality)
%            Maximal formula depth :   12 (   4 average)
%            Number of connectives :   55 (  11 ~  ;   1  |;  20  &)
%                                         (   0 <=>;  23 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   16 (   1 propositional; 0-3 arity)
%            Number of functors    :    4 (   1 constant; 0-2 arity)
%            Number of variables   :   36 (   0 singleton;  29 !;   7 ?)
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

fof(d11_yellow_0,axiom,(
    ! [A] :
      ( rel_str(A)
     => bottom_of_relstr(A) = join_on_relstr(A,empty_set) ) )).

fof(dt_k1_xboole_0,axiom,(
    $true )).

fof(dt_k1_yellow_0,axiom,(
    ! [A,B] :
      ( rel_str(A)
     => element(join_on_relstr(A,B),the_carrier(A)) ) )).

fof(dt_k3_yellow_0,axiom,(
    ! [A] :
      ( rel_str(A)
     => element(bottom_of_relstr(A),the_carrier(A)) ) )).

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

fof(fc1_struct_0,axiom,(
    ! [A] :
      ( ( ~ empty_carrier(A)
        & one_sorted_str(A) )
     => ~ empty(the_carrier(A)) ) )).

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

fof(rc3_struct_0,axiom,(
    ? [A] :
      ( one_sorted_str(A)
      & ~ empty_carrier(A) ) )).

fof(t1_subset,axiom,(
    ! [A,B] :
      ( in(A,B)
     => element(A,B) ) )).

fof(t2_subset,axiom,(
    ! [A,B] :
      ( element(A,B)
     => ( empty(B)
        | in(A,B) ) ) )).

fof(t30_yellow_0,axiom,(
    ! [A] :
      ( ( antisymmetric_relstr(A)
        & rel_str(A) )
     => ! [B] :
          ( element(B,the_carrier(A))
         => ! [C] :
              ( ( ( B = join_on_relstr(A,C)
                  & ex_sup_of_relstr_set(A,C) )
               => ( relstr_set_smaller(A,C,B)
                  & ! [D] :
                      ( element(D,the_carrier(A))
                     => ( relstr_set_smaller(A,C,D)
                       => related(A,B,D) ) ) ) )
              & ( ( relstr_set_smaller(A,C,B)
                  & ! [D] :
                      ( element(D,the_carrier(A))
                     => ( relstr_set_smaller(A,C,D)
                       => related(A,B,D) ) ) )
               => ( B = join_on_relstr(A,C)
                  & ex_sup_of_relstr_set(A,C) ) ) ) ) ) )).

fof(t42_yellow_0,axiom,(
    ! [A] :
      ( ( ~ empty_carrier(A)
        & antisymmetric_relstr(A)
        & lower_bounded_relstr(A)
        & rel_str(A) )
     => ( ex_sup_of_relstr_set(A,empty_set)
        & ex_inf_of_relstr_set(A,the_carrier(A)) ) ) )).

fof(t44_yellow_0,conjecture,(
    ! [A] :
      ( ( ~ empty_carrier(A)
        & antisymmetric_relstr(A)
        & lower_bounded_relstr(A)
        & rel_str(A) )
     => ! [B] :
          ( element(B,the_carrier(A))
         => related(A,bottom_of_relstr(A),B) ) ) )).

fof(t6_boole,axiom,(
    ! [A] :
      ( empty(A)
     => A = empty_set ) )).

fof(t6_yellow_0,axiom,(
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
