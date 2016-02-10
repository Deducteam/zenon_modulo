%------------------------------------------------------------------------------
% File     : SEU356+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem t15_yellow_0
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-t15_yellow_0 [Urb07]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.10 v6.0.0, 0.04 v5.5.0, 0.15 v5.4.0, 0.21 v5.3.0, 0.26 v5.2.0, 0.15 v5.1.0, 0.19 v5.0.0, 0.17 v4.1.0, 0.22 v4.0.0, 0.25 v3.7.0, 0.20 v3.5.0, 0.21 v3.4.0, 0.32 v3.3.0
% Syntax   : Number of formulae    :   10 (   6 unit)
%            Number of atoms       :   36 (   2 equality)
%            Maximal formula depth :   16 (   5 average)
%            Number of connectives :   26 (   0 ~  ;   0  |;   9  &)
%                                         (   2 <=>;  15 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    9 (   1 propositional; 0-3 arity)
%            Number of functors    :    1 (   0 constant; 1-1 arity)
%            Number of variables   :   18 (   0 singleton;  13 !;   5 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(d7_yellow_0,axiom,(
    ! [A] :
      ( rel_str(A)
     => ! [B] :
          ( ex_sup_of_relstr_set(A,B)
        <=> ? [C] :
              ( element(C,the_carrier(A))
              & relstr_set_smaller(A,B,C)
              & ! [D] :
                  ( element(D,the_carrier(A))
                 => ( relstr_set_smaller(A,B,D)
                   => related(A,C,D) ) )
              & ! [D] :
                  ( element(D,the_carrier(A))
                 => ( ( relstr_set_smaller(A,B,D)
                      & ! [E] :
                          ( element(E,the_carrier(A))
                         => ( relstr_set_smaller(A,B,E)
                           => related(A,D,E) ) ) )
                   => D = C ) ) ) ) ) )).

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

fof(t15_yellow_0,conjecture,(
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

fof(t25_orders_2,axiom,(
    ! [A] :
      ( ( antisymmetric_relstr(A)
        & rel_str(A) )
     => ! [B] :
          ( element(B,the_carrier(A))
         => ! [C] :
              ( element(C,the_carrier(A))
             => ( ( related(A,B,C)
                  & related(A,C,B) )
               => B = C ) ) ) ) )).

%------------------------------------------------------------------------------
