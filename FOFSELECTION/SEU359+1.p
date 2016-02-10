%------------------------------------------------------------------------------
% File     : SEU359+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem t30_yellow_0
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-t30_yellow_0 [Urb07]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.13 v6.0.0, 0.04 v5.5.0, 0.15 v5.4.0, 0.21 v5.3.0, 0.22 v5.2.0, 0.10 v5.1.0, 0.14 v5.0.0, 0.12 v4.1.0, 0.17 v4.0.1, 0.22 v4.0.0, 0.25 v3.7.0, 0.20 v3.5.0, 0.21 v3.4.0, 0.32 v3.3.0
% Syntax   : Number of formulae    :   11 (   6 unit)
%            Number of atoms       :   41 (   3 equality)
%            Maximal formula depth :   12 (   5 average)
%            Number of connectives :   30 (   0 ~  ;   0  |;  10  &)
%                                         (   2 <=>;  18 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    9 (   1 propositional; 0-3 arity)
%            Number of functors    :    2 (   0 constant; 1-2 arity)
%            Number of variables   :   20 (   0 singleton;  16 !;   4 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(d9_yellow_0,axiom,(
    ! [A] :
      ( rel_str(A)
     => ! [B,C] :
          ( element(C,the_carrier(A))
         => ( ex_sup_of_relstr_set(A,B)
           => ( C = join_on_relstr(A,B)
            <=> ( relstr_set_smaller(A,B,C)
                & ! [D] :
                    ( element(D,the_carrier(A))
                   => ( relstr_set_smaller(A,B,D)
                     => related(A,C,D) ) ) ) ) ) ) ) )).

fof(dt_k1_yellow_0,axiom,(
    ! [A,B] :
      ( rel_str(A)
     => element(join_on_relstr(A,B),the_carrier(A)) ) )).

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

fof(t15_yellow_0,axiom,(
    ! [A] :
      ( ( antisymmetric_relstr(A)
        & rel_str(A) )
     => ! [B] :
          ( ex_sup_of_relstr_set(A,B)
        <=> ? [C] :
              ( element(C,the_carrier(A))
              & relstr_set_smaller(A,B,C)
              & ! [D] :
                  ( element(D,the_carrier(A))
                 => ( relstr_set_smaller(A,B,D)
                   => related(A,C,D) ) ) ) ) ) )).

fof(t30_yellow_0,conjecture,(
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

%------------------------------------------------------------------------------
