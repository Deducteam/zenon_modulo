%------------------------------------------------------------------------------
% File     : SEU375+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem t21_yellow_6
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-t21_yellow_6 [Urb07]

% Status   : Theorem
% Rating   : 0.20 v6.1.0, 0.23 v6.0.0, 0.17 v5.5.0, 0.19 v5.4.0, 0.25 v5.3.0, 0.30 v5.2.0, 0.10 v5.1.0, 0.14 v5.0.0, 0.21 v4.1.0, 0.26 v4.0.0, 0.29 v3.7.0, 0.25 v3.5.0, 0.26 v3.3.0
% Syntax   : Number of formulae    :   40 (   7 unit)
%            Number of atoms       :  119 (   6 equality)
%            Maximal formula depth :   18 (   4 average)
%            Number of connectives :   91 (  12 ~  ;   1  |;  37  &)
%                                         (   1 <=>;  40 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   19 (   1 propositional; 0-3 arity)
%            Number of functors    :    2 (   1 constant; 0-1 arity)
%            Number of variables   :   61 (   0 singleton;  46 !;  15 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(antisymmetry_r2_hidden,axiom,(
    ! [A,B] :
      ( in(A,B)
     => ~ in(B,A) ) )).

fof(cc1_funct_1,axiom,(
    ! [A] :
      ( empty(A)
     => function(A) ) )).

fof(cc1_relat_1,axiom,(
    ! [A] :
      ( empty(A)
     => relation(A) ) )).

fof(cc1_yellow_3,axiom,(
    ! [A] :
      ( rel_str(A)
     => ( empty_carrier(A)
       => v1_yellow_3(A) ) ) )).

fof(cc2_funct_1,axiom,(
    ! [A] :
      ( ( relation(A)
        & empty(A)
        & function(A) )
     => ( relation(A)
        & function(A)
        & one_to_one(A) ) ) )).

fof(cc2_yellow_3,axiom,(
    ! [A] :
      ( rel_str(A)
     => ( ~ v1_yellow_3(A)
       => ~ empty_carrier(A) ) ) )).

fof(d9_yellow_6,axiom,(
    ! [A] :
      ( one_sorted_str(A)
     => ! [B] :
          ( net_str(B,A)
         => ! [C] :
              ( subnetstr(C,A,B)
             => ( full_subnetstr(C,A,B)
              <=> ( full_subrelstr(C,B)
                  & subrelstr(C,B) ) ) ) ) ) )).

fof(dt_k1_xboole_0,axiom,(
    $true )).

fof(dt_l1_orders_2,axiom,(
    ! [A] :
      ( rel_str(A)
     => one_sorted_str(A) ) )).

fof(dt_l1_struct_0,axiom,(
    $true )).

fof(dt_l1_waybel_0,axiom,(
    ! [A] :
      ( one_sorted_str(A)
     => ! [B] :
          ( net_str(B,A)
         => rel_str(B) ) ) )).

fof(dt_m1_subset_1,axiom,(
    $true )).

fof(dt_m1_yellow_0,axiom,(
    ! [A] :
      ( rel_str(A)
     => ! [B] :
          ( subrelstr(B,A)
         => rel_str(B) ) ) )).

fof(dt_m1_yellow_6,axiom,(
    ! [A,B] :
      ( ( one_sorted_str(A)
        & net_str(B,A) )
     => ! [C] :
          ( subnetstr(C,A,B)
         => net_str(C,A) ) ) )).

fof(dt_u1_struct_0,axiom,(
    $true )).

fof(existence_l1_orders_2,axiom,(
    ? [A] : rel_str(A) )).

fof(existence_l1_struct_0,axiom,(
    ? [A] : one_sorted_str(A) )).

fof(existence_l1_waybel_0,axiom,(
    ! [A] :
      ( one_sorted_str(A)
     => ? [B] : net_str(B,A) ) )).

fof(existence_m1_subset_1,axiom,(
    ! [A] :
    ? [B] : element(B,A) )).

fof(existence_m1_yellow_0,axiom,(
    ! [A] :
      ( rel_str(A)
     => ? [B] : subrelstr(B,A) ) )).

fof(existence_m1_yellow_6,axiom,(
    ! [A,B] :
      ( ( one_sorted_str(A)
        & net_str(B,A) )
     => ? [C] : subnetstr(C,A,B) ) )).

fof(fc12_relat_1,axiom,
    ( empty(empty_set)
    & relation(empty_set)
    & relation_empty_yielding(empty_set) )).

fof(fc1_struct_0,axiom,(
    ! [A] :
      ( ( ~ empty_carrier(A)
        & one_sorted_str(A) )
     => ~ empty(the_carrier(A)) ) )).

fof(fc4_relat_1,axiom,
    ( empty(empty_set)
    & relation(empty_set) )).

fof(rc1_funct_1,axiom,(
    ? [A] :
      ( relation(A)
      & function(A) ) )).

fof(rc1_pboole,axiom,(
    ? [A] :
      ( relation(A)
      & relation_empty_yielding(A)
      & function(A) ) )).

fof(rc1_relat_1,axiom,(
    ? [A] :
      ( empty(A)
      & relation(A) ) )).

fof(rc2_funct_1,axiom,(
    ? [A] :
      ( relation(A)
      & empty(A)
      & function(A) ) )).

fof(rc2_relat_1,axiom,(
    ? [A] :
      ( ~ empty(A)
      & relation(A) ) )).

fof(rc3_funct_1,axiom,(
    ? [A] :
      ( relation(A)
      & function(A)
      & one_to_one(A) ) )).

fof(rc3_relat_1,axiom,(
    ? [A] :
      ( relation(A)
      & relation_empty_yielding(A) ) )).

fof(rc3_struct_0,axiom,(
    ? [A] :
      ( one_sorted_str(A)
      & ~ empty_carrier(A) ) )).

fof(rc4_funct_1,axiom,(
    ? [A] :
      ( relation(A)
      & relation_empty_yielding(A)
      & function(A) ) )).

fof(t1_subset,axiom,(
    ! [A,B] :
      ( in(A,B)
     => element(A,B) ) )).

fof(t21_yellow_6,conjecture,(
    ! [A] :
      ( one_sorted_str(A)
     => ! [B] :
          ( ( ~ empty_carrier(B)
            & net_str(B,A) )
         => ! [C] :
              ( ( ~ empty_carrier(C)
                & full_subnetstr(C,A,B)
                & subnetstr(C,A,B) )
             => ! [D] :
                  ( element(D,the_carrier(B))
                 => ! [E] :
                      ( element(E,the_carrier(B))
                     => ! [F] :
                          ( element(F,the_carrier(C))
                         => ! [G] :
                              ( element(G,the_carrier(C))
                             => ( ( D = F
                                  & E = G
                                  & related(B,D,E) )
                               => related(C,F,G) ) ) ) ) ) ) ) ) )).

fof(t2_subset,axiom,(
    ! [A,B] :
      ( element(A,B)
     => ( empty(B)
        | in(A,B) ) ) )).

fof(t61_yellow_0,axiom,(
    ! [A] :
      ( rel_str(A)
     => ! [B] :
          ( ( full_subrelstr(B,A)
            & subrelstr(B,A) )
         => ! [C] :
              ( element(C,the_carrier(A))
             => ! [D] :
                  ( element(D,the_carrier(A))
                 => ! [E] :
                      ( element(E,the_carrier(B))
                     => ! [F] :
                          ( element(F,the_carrier(B))
                         => ( ( E = C
                              & F = D
                              & related(A,C,D)
                              & in(E,the_carrier(B))
                              & in(F,the_carrier(B)) )
                           => related(B,E,F) ) ) ) ) ) ) ) )).

fof(t6_boole,axiom,(
    ! [A] :
      ( empty(A)
     => A = empty_set ) )).

fof(t7_boole,axiom,(
    ! [A,B] : ~ ( in(A,B)
      & empty(B) ) )).

fof(t8_boole,axiom,(
    ! [A,B] : ~ ( empty(A)
      & A != B
      & empty(B) ) )).

%------------------------------------------------------------------------------
