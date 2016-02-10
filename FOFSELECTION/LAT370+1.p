%------------------------------------------------------------------------------
% File     : LAT370+1 : TPTP v6.1.0. Released v3.4.0.
% Domain   : Lattice Theory
% Problem  : Duality Based on Galois Connection - Part I T43
% Version  : [Urb08] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek (2001), Duality Based on the Galois Connectio
%          : [Urb07] Urban (2007), MPTP 0.2: Design, Implementation, and In
%          : [Urb08] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb08]
% Names    : t43_waybel34 [Urb08]

% Status   : Theorem
% Rating   : 0.56 v6.1.0, 0.63 v6.0.0, 0.65 v5.5.0, 0.67 v5.4.0, 0.68 v5.3.0, 0.74 v5.2.0, 0.70 v5.1.0, 0.67 v5.0.0, 0.71 v4.1.0, 0.70 v4.0.1, 0.74 v4.0.0, 0.75 v3.7.0, 0.70 v3.5.0, 0.74 v3.4.0
% Syntax   : Number of formulae    :  148 (  13 unit)
%            Number of atoms       : 1178 (  10 equality)
%            Maximal formula depth :   22 (   8 average)
%            Number of connectives : 1162 ( 132 ~  ;   1  |; 834  &)
%                                         (   3 <=>; 192 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   63 (   1 propositional; 0-3 arity)
%            Number of functors    :   13 (   1 constant; 0-3 arity)
%            Number of variables   :  260 (   1 singleton; 229 !;  31 ?)
%            Maximal term depth    :    4 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Normal version: includes the axioms (which may be theorems from
%            other articles) and background that are possibly necessary.
%          : Translated by MPTP from the Mizar Mathematical Library 4.48.930.
%          : The problem encoding is based on set theory.
%------------------------------------------------------------------------------
fof(t43_waybel34,conjecture,(
    ! [A] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & v3_lattice3(A)
        & v3_waybel_3(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( ( v1_funct_1(B)
            & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
            & v7_waybel_1(B,A)
            & m2_relset_1(B,u1_struct_0(A),u1_struct_0(A)) )
         => ( v1_waybel34(k2_waybel_1(A,A,B),A,k2_yellow_2(A,A,B))
           => v4_waybel_0(k2_yellow_2(A,A,B),A) ) ) ) )).

fof(abstractness_v1_orders_2,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( v1_orders_2(A)
       => A = g1_orders_2(u1_struct_0(A),u1_orders_2(A)) ) ) )).

fof(antisymmetry_r2_hidden,axiom,(
    ! [A,B] :
      ( r2_hidden(A,B)
     => ~ r2_hidden(B,A) ) )).

fof(cc10_membered,axiom,(
    ! [A] :
      ( v1_membered(A)
     => ! [B] :
          ( m1_subset_1(B,A)
         => v1_xcmplx_0(B) ) ) )).

fof(cc10_waybel_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v3_lattice3(A) )
       => ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v24_waybel_0(A)
          & v25_waybel_0(A) ) ) ) )).

fof(cc11_membered,axiom,(
    ! [A] :
      ( v2_membered(A)
     => ! [B] :
          ( m1_subset_1(B,A)
         => ( v1_xcmplx_0(B)
            & v1_xreal_0(B) ) ) ) )).

fof(cc11_waybel_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v25_waybel_0(A) )
       => ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v1_yellow_0(A) ) ) ) )).

fof(cc11_yellow_0,axiom,(
    ! [A] :
      ( ( v3_orders_2(A)
        & v4_orders_2(A)
        & v2_lattice3(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( m1_yellow_0(B,A)
         => ( ( ~ v3_struct_0(B)
              & v4_yellow_0(B,A)
              & v5_yellow_0(B,A) )
           => ( ~ v3_struct_0(B)
              & v3_orders_2(B)
              & v4_orders_2(B)
              & v2_lattice3(B)
              & v4_yellow_0(B,A)
              & v5_yellow_0(B,A) ) ) ) ) )).

fof(cc12_membered,axiom,(
    ! [A] :
      ( v3_membered(A)
     => ! [B] :
          ( m1_subset_1(B,A)
         => ( v1_xcmplx_0(B)
            & v1_xreal_0(B)
            & v1_rat_1(B) ) ) ) )).

fof(cc12_waybel_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v3_orders_2(A)
          & v4_orders_2(A)
          & v1_lattice3(A)
          & v1_yellow_0(A)
          & v24_waybel_0(A) )
       => ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v3_orders_2(A)
          & v4_orders_2(A)
          & v1_lattice3(A)
          & v2_lattice3(A)
          & v3_lattice3(A)
          & v1_yellow_0(A)
          & v2_yellow_0(A)
          & v3_yellow_0(A) ) ) ) )).

fof(cc13_membered,axiom,(
    ! [A] :
      ( v4_membered(A)
     => ! [B] :
          ( m1_subset_1(B,A)
         => ( v1_xcmplx_0(B)
            & v1_xreal_0(B)
            & v1_int_1(B)
            & v1_rat_1(B) ) ) ) )).

fof(cc13_waybel_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v4_orders_2(A)
          & v25_waybel_0(A) )
       => ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v4_orders_2(A)
          & v2_lattice3(A) ) ) ) )).

fof(cc14_membered,axiom,(
    ! [A] :
      ( v5_membered(A)
     => ! [B] :
          ( m1_subset_1(B,A)
         => ( v1_xcmplx_0(B)
            & v4_ordinal2(B)
            & v1_xreal_0(B)
            & v1_int_1(B)
            & v1_rat_1(B) ) ) ) )).

fof(cc14_waybel_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v4_orders_2(A)
          & v2_yellow_0(A)
          & v25_waybel_0(A) )
       => ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v4_orders_2(A)
          & v1_lattice3(A)
          & v2_yellow_0(A) ) ) ) )).

fof(cc15_membered,axiom,(
    ! [A] :
      ( v1_xboole_0(A)
     => ( v1_membered(A)
        & v2_membered(A)
        & v3_membered(A)
        & v4_membered(A)
        & v5_membered(A) ) ) )).

fof(cc16_membered,axiom,(
    ! [A] :
      ( v1_membered(A)
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
         => v1_membered(B) ) ) )).

fof(cc17_membered,axiom,(
    ! [A] :
      ( v2_membered(A)
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
         => ( v1_membered(B)
            & v2_membered(B) ) ) ) )).

fof(cc18_membered,axiom,(
    ! [A] :
      ( v3_membered(A)
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
         => ( v1_membered(B)
            & v2_membered(B)
            & v3_membered(B) ) ) ) )).

fof(cc19_membered,axiom,(
    ! [A] :
      ( v4_membered(A)
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
         => ( v1_membered(B)
            & v2_membered(B)
            & v3_membered(B)
            & v4_membered(B) ) ) ) )).

fof(cc1_finset_1,axiom,(
    ! [A] :
      ( v1_xboole_0(A)
     => v1_finset_1(A) ) )).

fof(cc1_funct_1,axiom,(
    ! [A] :
      ( v1_xboole_0(A)
     => v1_funct_1(A) ) )).

fof(cc1_lattice3,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( v1_lattice3(A)
       => ~ v3_struct_0(A) ) ) )).

fof(cc1_membered,axiom,(
    ! [A] :
      ( v5_membered(A)
     => v4_membered(A) ) )).

fof(cc1_relset_1,axiom,(
    ! [A,B,C] :
      ( m1_subset_1(C,k1_zfmisc_1(k2_zfmisc_1(A,B)))
     => v1_relat_1(C) ) )).

fof(cc1_waybel10,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( m1_relset_1(B,u1_struct_0(A),u1_struct_0(A))
         => ( ( v1_funct_1(B)
              & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
              & v6_waybel_1(B,A) )
           => ( v1_funct_1(B)
              & ~ v1_xboole_0(B)
              & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
              & v1_partfun1(B,u1_struct_0(A),u1_struct_0(A))
              & v11_quantal1(B)
              & v5_orders_3(B,A,A) ) ) ) ) )).

fof(cc1_waybel17,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & v4_orders_2(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & v2_orders_2(B)
        & v4_orders_2(B)
        & l1_orders_2(B) )
     => ! [C] :
          ( m1_relset_1(C,u1_struct_0(A),u1_struct_0(B))
         => ( ( v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v22_waybel_0(C,A,B) )
           => ( ~ v1_xboole_0(C)
              & v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v5_orders_3(C,A,B)
              & v1_partfun1(C,u1_struct_0(A),u1_struct_0(B)) ) ) ) ) )).

fof(cc1_waybel21,axiom,(
    ! [A,B] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v2_lattice3(A)
        & l1_orders_2(A)
        & v2_orders_2(B)
        & v3_orders_2(B)
        & v4_orders_2(B)
        & v2_lattice3(B)
        & l1_orders_2(B) )
     => ! [C] :
          ( m1_relset_1(C,u1_struct_0(A),u1_struct_0(B))
         => ( ( v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v19_waybel_0(C,A,B) )
           => ( v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v5_orders_3(C,A,B) ) ) ) ) )).

fof(cc1_waybel_0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( m1_yellow_0(B,A)
         => ( v7_yellow_0(B,A)
           => v3_waybel_0(B,A) ) ) ) )).

fof(cc1_waybel_1,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & v2_orders_2(B)
        & v3_orders_2(B)
        & v4_orders_2(B)
        & l1_orders_2(B) )
     => ! [C] :
          ( m1_relset_1(C,u1_struct_0(A),u1_struct_0(B))
         => ( ( v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v4_waybel_1(C,A,B) )
           => ( v1_funct_1(C)
              & ~ v1_xboole_0(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v1_partfun1(C,u1_struct_0(A),u1_struct_0(B))
              & v17_waybel_0(C,A,B)
              & v19_waybel_0(C,A,B)
              & v21_waybel_0(C,A,B) ) ) ) ) )).

fof(cc1_yellow_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( ~ v3_struct_0(A)
          & v3_lattice3(A) )
       => ( ~ v3_struct_0(A)
          & v1_lattice3(A)
          & v2_lattice3(A) ) ) ) )).

fof(cc1_yellow_2,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v3_orders_2(A)
          & v4_orders_2(A)
          & v2_yellow_0(A)
          & v24_waybel_0(A)
          & v25_waybel_0(A) )
       => ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v3_orders_2(A)
          & v4_orders_2(A)
          & v1_yellow_0(A)
          & v2_yellow_0(A)
          & v3_yellow_0(A)
          & v24_waybel_0(A)
          & v25_waybel_0(A)
          & v1_lattice3(A)
          & v2_lattice3(A)
          & v3_lattice3(A) ) ) ) )).

fof(cc20_membered,axiom,(
    ! [A] :
      ( v5_membered(A)
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
         => ( v1_membered(B)
            & v2_membered(B)
            & v3_membered(B)
            & v4_membered(B)
            & v5_membered(B) ) ) ) )).

fof(cc2_finset_1,axiom,(
    ! [A] :
      ( v1_finset_1(A)
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
         => v1_finset_1(B) ) ) )).

fof(cc2_funct_1,axiom,(
    ! [A] :
      ( ( v1_relat_1(A)
        & v1_xboole_0(A)
        & v1_funct_1(A) )
     => ( v1_relat_1(A)
        & v1_funct_1(A)
        & v2_funct_1(A) ) ) )).

fof(cc2_lattice3,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( v2_lattice3(A)
       => ~ v3_struct_0(A) ) ) )).

fof(cc2_membered,axiom,(
    ! [A] :
      ( v4_membered(A)
     => v3_membered(A) ) )).

fof(cc2_waybel10,axiom,(
    ! [A] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & v3_lattice3(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( m1_yellow_0(B,A)
         => ( v7_yellow_0(B,A)
           => ~ v3_struct_0(B) ) ) ) )).

fof(cc2_waybel_1,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & v2_orders_2(B)
        & v3_orders_2(B)
        & v4_orders_2(B)
        & l1_orders_2(B) )
     => ! [C] :
          ( m1_relset_1(C,u1_struct_0(A),u1_struct_0(B))
         => ( ( v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v5_waybel_1(C,B,A) )
           => ( v1_funct_1(C)
              & ~ v1_xboole_0(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v1_partfun1(C,u1_struct_0(A),u1_struct_0(B))
              & v18_waybel_0(C,A,B)
              & v20_waybel_0(C,A,B)
              & v22_waybel_0(C,A,B) ) ) ) ) )).

fof(cc3_membered,axiom,(
    ! [A] :
      ( v3_membered(A)
     => v2_membered(A) ) )).

fof(cc3_waybel_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( m1_relset_1(B,u1_struct_0(A),u1_struct_0(A))
         => ( ( v1_funct_1(B)
              & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
              & v7_waybel_1(B,A) )
           => ( v1_funct_1(B)
              & ~ v1_xboole_0(B)
              & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
              & v1_partfun1(B,u1_struct_0(A),u1_struct_0(A))
              & v6_waybel_1(B,A) ) ) ) ) )).

fof(cc3_yellow_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( ~ v3_struct_0(A)
          & v3_lattice3(A) )
       => ( ~ v3_struct_0(A)
          & v3_yellow_0(A) ) ) ) )).

fof(cc4_membered,axiom,(
    ! [A] :
      ( v2_membered(A)
     => v1_membered(A) ) )).

fof(cc4_waybel_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( m1_relset_1(B,u1_struct_0(A),u1_struct_0(A))
         => ( ( v1_funct_1(B)
              & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
              & v8_waybel_1(B,A) )
           => ( v1_funct_1(B)
              & ~ v1_xboole_0(B)
              & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
              & v1_partfun1(B,u1_struct_0(A),u1_struct_0(A))
              & v6_waybel_1(B,A) ) ) ) ) )).

fof(cc4_waybel_3,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v3_waybel_3(A) )
       => ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v24_waybel_0(A)
          & v2_waybel_3(A) ) ) ) )).

fof(cc4_yellow_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( v3_yellow_0(A)
       => ( v1_yellow_0(A)
          & v2_yellow_0(A) ) ) ) )).

fof(cc5_waybel_3,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( v2_orders_2(A)
          & v3_orders_2(A)
          & v4_orders_2(A)
          & v1_lattice3(A)
          & v1_yellow_0(A)
          & v24_waybel_0(A)
          & v2_waybel_3(A) )
       => ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v3_orders_2(A)
          & v4_orders_2(A)
          & v1_lattice3(A)
          & v1_yellow_0(A)
          & v3_waybel_3(A) ) ) ) )).

fof(cc5_yellow_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( v1_yellow_0(A)
          & v2_yellow_0(A) )
       => v3_yellow_0(A) ) ) )).

fof(cc6_waybel_0,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & l1_orders_2(B) )
     => ! [C] :
          ( m1_relset_1(C,u1_struct_0(A),u1_struct_0(B))
         => ( ( v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v17_waybel_0(C,A,B) )
           => ( v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v19_waybel_0(C,A,B)
              & v21_waybel_0(C,A,B) ) ) ) ) )).

fof(cc6_yellow_0,axiom,(
    ! [A] :
      ( ( v2_orders_2(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( m1_yellow_0(B,A)
         => ( v4_yellow_0(B,A)
           => ( v2_orders_2(B)
              & v4_yellow_0(B,A) ) ) ) ) )).

fof(cc7_waybel_0,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & l1_orders_2(B) )
     => ! [C] :
          ( m1_relset_1(C,u1_struct_0(A),u1_struct_0(B))
         => ( ( v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v18_waybel_0(C,A,B) )
           => ( v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v20_waybel_0(C,A,B)
              & v22_waybel_0(C,A,B) ) ) ) ) )).

fof(cc7_yellow_0,axiom,(
    ! [A] :
      ( ( v3_orders_2(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( m1_yellow_0(B,A)
         => ( v4_yellow_0(B,A)
           => ( v3_orders_2(B)
              & v4_yellow_0(B,A) ) ) ) ) )).

fof(cc8_waybel_0,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & l1_orders_2(B) )
     => ! [C] :
          ( m1_relset_1(C,u1_struct_0(A),u1_struct_0(B))
         => ( ( v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v23_waybel_0(C,A,B) )
           => ( v1_funct_1(C)
              & v2_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v5_orders_3(C,A,B) ) ) ) ) )).

fof(cc8_yellow_0,axiom,(
    ! [A] :
      ( ( v4_orders_2(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( m1_yellow_0(B,A)
         => ( v4_yellow_0(B,A)
           => ( v4_orders_2(B)
              & v4_yellow_0(B,A) ) ) ) ) )).

fof(cc9_waybel_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( ( v2_orders_2(A)
          & v1_lattice3(A)
          & v24_waybel_0(A) )
       => ( ~ v3_struct_0(A)
          & v2_orders_2(A)
          & v1_lattice3(A)
          & v2_yellow_0(A) ) ) ) )).

fof(cc9_yellow_0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( m1_yellow_0(B,A)
         => ( v7_yellow_0(B,A)
           => v5_yellow_0(B,A) ) ) ) )).

fof(d16_waybel_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( ( ~ v3_struct_0(B)
            & l1_orders_2(B) )
         => ! [C] :
              ( ( v1_funct_1(C)
                & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
                & m2_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
             => k2_waybel_1(A,B,C) = k8_relat_1(u1_struct_0(k2_yellow_2(A,B,C)),C) ) ) ) )).

fof(d17_waybel_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( ( ~ v3_struct_0(B)
            & l1_orders_2(B) )
         => ! [C] :
              ( ( v1_funct_1(C)
                & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
                & m2_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
             => k3_waybel_1(A,B,C) = k7_grcat_1(k2_yellow_2(A,B,C)) ) ) ) )).

fof(dt_g1_orders_2,axiom,(
    ! [A,B] :
      ( m1_relset_1(B,A,A)
     => ( v1_orders_2(g1_orders_2(A,B))
        & l1_orders_2(g1_orders_2(A,B)) ) ) )).

fof(dt_k1_waybel34,axiom,(
    ! [A,B,C] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & l1_orders_2(A)
        & v2_orders_2(B)
        & v3_orders_2(B)
        & v4_orders_2(B)
        & v1_lattice3(B)
        & v2_lattice3(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
        & m1_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
     => ( v1_funct_1(k1_waybel34(A,B,C))
        & v1_funct_2(k1_waybel34(A,B,C),u1_struct_0(B),u1_struct_0(A))
        & m2_relset_1(k1_waybel34(A,B,C),u1_struct_0(B),u1_struct_0(A)) ) ) )).

fof(dt_k1_xboole_0,axiom,(
    $true )).

fof(dt_k1_zfmisc_1,axiom,(
    $true )).

fof(dt_k2_waybel34,axiom,(
    ! [A,B,C] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & l1_orders_2(A)
        & v2_orders_2(B)
        & v3_orders_2(B)
        & v4_orders_2(B)
        & v1_lattice3(B)
        & v2_lattice3(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(B),u1_struct_0(A))
        & m1_relset_1(C,u1_struct_0(B),u1_struct_0(A)) )
     => ( v1_funct_1(k2_waybel34(A,B,C))
        & v1_funct_2(k2_waybel34(A,B,C),u1_struct_0(A),u1_struct_0(B))
        & m2_relset_1(k2_waybel34(A,B,C),u1_struct_0(A),u1_struct_0(B)) ) ) )).

fof(dt_k2_waybel_1,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
        & m1_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
     => ( v1_funct_1(k2_waybel_1(A,B,C))
        & v1_funct_2(k2_waybel_1(A,B,C),u1_struct_0(A),u1_struct_0(k2_yellow_2(A,B,C)))
        & m2_relset_1(k2_waybel_1(A,B,C),u1_struct_0(A),u1_struct_0(k2_yellow_2(A,B,C))) ) ) )).

fof(dt_k2_yellow_2,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
        & m1_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
     => ( v1_orders_2(k2_yellow_2(A,B,C))
        & v4_yellow_0(k2_yellow_2(A,B,C),B)
        & m1_yellow_0(k2_yellow_2(A,B,C),B) ) ) )).

fof(dt_k2_zfmisc_1,axiom,(
    $true )).

fof(dt_k3_waybel_1,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
        & m1_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
     => ( v1_funct_1(k3_waybel_1(A,B,C))
        & v1_funct_2(k3_waybel_1(A,B,C),u1_struct_0(k2_yellow_2(A,B,C)),u1_struct_0(B))
        & m2_relset_1(k3_waybel_1(A,B,C),u1_struct_0(k2_yellow_2(A,B,C)),u1_struct_0(B)) ) ) )).

fof(dt_k7_grcat_1,axiom,(
    ! [A] :
      ( l1_struct_0(A)
     => ( v1_funct_1(k7_grcat_1(A))
        & v1_funct_2(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A))
        & m2_relset_1(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A)) ) ) )).

fof(dt_k8_relat_1,axiom,(
    ! [A,B] :
      ( v1_relat_1(B)
     => v1_relat_1(k8_relat_1(A,B)) ) )).

fof(dt_l1_orders_2,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => l1_struct_0(A) ) )).

fof(dt_l1_struct_0,axiom,(
    $true )).

fof(dt_m1_relset_1,axiom,(
    $true )).

fof(dt_m1_subset_1,axiom,(
    $true )).

fof(dt_m1_yellow_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ! [B] :
          ( m1_yellow_0(B,A)
         => l1_orders_2(B) ) ) )).

fof(dt_m2_relset_1,axiom,(
    ! [A,B,C] :
      ( m2_relset_1(C,A,B)
     => m1_subset_1(C,k1_zfmisc_1(k2_zfmisc_1(A,B))) ) )).

fof(dt_u1_orders_2,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => m2_relset_1(u1_orders_2(A),u1_struct_0(A),u1_struct_0(A)) ) )).

fof(dt_u1_struct_0,axiom,(
    $true )).

fof(existence_l1_orders_2,axiom,(
    ? [A] : l1_orders_2(A) )).

fof(existence_l1_struct_0,axiom,(
    ? [A] : l1_struct_0(A) )).

fof(existence_m1_relset_1,axiom,(
    ! [A,B] :
    ? [C] : m1_relset_1(C,A,B) )).

fof(existence_m1_subset_1,axiom,(
    ! [A] :
    ? [B] : m1_subset_1(B,A) )).

fof(existence_m1_yellow_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ? [B] : m1_yellow_0(B,A) ) )).

fof(existence_m2_relset_1,axiom,(
    ! [A,B] :
    ? [C] : m2_relset_1(C,A,B) )).

fof(fc10_waybel10,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & l1_orders_2(A)
        & v1_funct_1(B)
        & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
        & v7_waybel_1(B,A)
        & m1_relset_1(B,u1_struct_0(A),u1_struct_0(A)) )
     => ( ~ v3_struct_0(k2_yellow_2(A,A,B))
        & v1_orders_2(k2_yellow_2(A,A,B))
        & v2_orders_2(k2_yellow_2(A,A,B))
        & v3_orders_2(k2_yellow_2(A,A,B))
        & v4_orders_2(k2_yellow_2(A,A,B))
        & v4_yellow_0(k2_yellow_2(A,A,B),A)
        & v5_yellow_0(k2_yellow_2(A,A,B),A)
        & v7_yellow_0(k2_yellow_2(A,A,B),A)
        & v3_waybel_0(k2_yellow_2(A,A,B),A) ) ) )).

fof(fc10_waybel34,axiom,(
    ! [A,B] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & v3_lattice3(A)
        & l1_orders_2(A)
        & v1_funct_1(B)
        & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
        & v6_waybel_1(B,A)
        & m1_relset_1(B,u1_struct_0(A),u1_struct_0(A)) )
     => ( ~ v3_struct_0(k2_yellow_2(A,A,B))
        & v1_orders_2(k2_yellow_2(A,A,B))
        & v2_orders_2(k2_yellow_2(A,A,B))
        & v3_orders_2(k2_yellow_2(A,A,B))
        & v4_orders_2(k2_yellow_2(A,A,B))
        & v1_yellow_0(k2_yellow_2(A,A,B))
        & v2_yellow_0(k2_yellow_2(A,A,B))
        & v3_yellow_0(k2_yellow_2(A,A,B))
        & v4_yellow_0(k2_yellow_2(A,A,B),A)
        & v24_waybel_0(k2_yellow_2(A,A,B))
        & v25_waybel_0(k2_yellow_2(A,A,B))
        & v1_lattice3(k2_yellow_2(A,A,B))
        & v2_lattice3(k2_yellow_2(A,A,B))
        & v3_lattice3(k2_yellow_2(A,A,B)) ) ) )).

fof(fc10_waybel_8,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & v24_waybel_0(A)
        & l1_orders_2(A) )
     => ( ~ v3_struct_0(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v1_orders_2(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v2_orders_2(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v24_waybel_0(g1_orders_2(u1_struct_0(A),u1_orders_2(A))) ) ) )).

fof(fc14_finset_1,axiom,(
    ! [A,B] :
      ( ( v1_finset_1(A)
        & v1_finset_1(B) )
     => v1_finset_1(k2_zfmisc_1(A,B)) ) )).

fof(fc15_waybel10,axiom,(
    ! [A,B] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & v3_lattice3(A)
        & l1_orders_2(A)
        & v1_funct_1(B)
        & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
        & v22_waybel_0(B,A,A)
        & v7_waybel_1(B,A)
        & m1_relset_1(B,u1_struct_0(A),u1_struct_0(A)) )
     => ( ~ v3_struct_0(k2_yellow_2(A,A,B))
        & v1_orders_2(k2_yellow_2(A,A,B))
        & v2_orders_2(k2_yellow_2(A,A,B))
        & v3_orders_2(k2_yellow_2(A,A,B))
        & v4_orders_2(k2_yellow_2(A,A,B))
        & v2_lattice3(k2_yellow_2(A,A,B))
        & v4_yellow_0(k2_yellow_2(A,A,B),A)
        & v5_yellow_0(k2_yellow_2(A,A,B),A)
        & v7_yellow_0(k2_yellow_2(A,A,B),A)
        & v3_waybel_0(k2_yellow_2(A,A,B),A)
        & v4_waybel_0(k2_yellow_2(A,A,B),A) ) ) )).

fof(fc1_struct_0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_struct_0(A) )
     => ~ v1_xboole_0(u1_struct_0(A)) ) )).

fof(fc1_waybel34,axiom,(
    ! [A,B,C] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & v3_lattice3(A)
        & l1_orders_2(A)
        & v2_orders_2(B)
        & v3_orders_2(B)
        & v4_orders_2(B)
        & v1_lattice3(B)
        & v2_lattice3(B)
        & v3_lattice3(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
        & v17_waybel_0(C,A,B)
        & m1_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
     => ( v1_relat_1(k1_waybel34(A,B,C))
        & v1_funct_1(k1_waybel34(A,B,C))
        & ~ v1_xboole_0(k1_waybel34(A,B,C))
        & v1_funct_2(k1_waybel34(A,B,C),u1_struct_0(B),u1_struct_0(A))
        & v1_partfun1(k1_waybel34(A,B,C),u1_struct_0(B),u1_struct_0(A))
        & v18_waybel_0(k1_waybel34(A,B,C),B,A)
        & v20_waybel_0(k1_waybel34(A,B,C),B,A)
        & v22_waybel_0(k1_waybel34(A,B,C),B,A)
        & v5_waybel_1(k1_waybel34(A,B,C),A,B)
        & v5_orders_3(k1_waybel34(A,B,C),B,A) ) ) )).

fof(fc2_waybel10,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & v2_orders_2(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
        & v5_orders_3(C,A,B)
        & m1_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
     => ( v1_relat_1(k2_waybel_1(A,B,C))
        & v1_funct_1(k2_waybel_1(A,B,C))
        & ~ v1_xboole_0(k2_waybel_1(A,B,C))
        & v1_funct_2(k2_waybel_1(A,B,C),u1_struct_0(A),u1_struct_0(k2_yellow_2(A,B,C)))
        & v2_funct_2(k2_waybel_1(A,B,C),u1_struct_0(A),u1_struct_0(k2_yellow_2(A,B,C)))
        & v1_partfun1(k2_waybel_1(A,B,C),u1_struct_0(A),u1_struct_0(k2_yellow_2(A,B,C)))
        & v5_orders_3(k2_waybel_1(A,B,C),A,k2_yellow_2(A,B,C)) ) ) )).

fof(fc2_waybel34,axiom,(
    ! [A,B,C] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & v3_lattice3(A)
        & l1_orders_2(A)
        & v2_orders_2(B)
        & v3_orders_2(B)
        & v4_orders_2(B)
        & v1_lattice3(B)
        & v2_lattice3(B)
        & v3_lattice3(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(B),u1_struct_0(A))
        & v18_waybel_0(C,B,A)
        & m1_relset_1(C,u1_struct_0(B),u1_struct_0(A)) )
     => ( v1_relat_1(k2_waybel34(A,B,C))
        & v1_funct_1(k2_waybel34(A,B,C))
        & ~ v1_xboole_0(k2_waybel34(A,B,C))
        & v1_funct_2(k2_waybel34(A,B,C),u1_struct_0(A),u1_struct_0(B))
        & v1_partfun1(k2_waybel34(A,B,C),u1_struct_0(A),u1_struct_0(B))
        & v17_waybel_0(k2_waybel34(A,B,C),A,B)
        & v19_waybel_0(k2_waybel34(A,B,C),A,B)
        & v21_waybel_0(k2_waybel34(A,B,C),A,B)
        & v4_waybel_1(k2_waybel34(A,B,C),A,B)
        & v5_orders_3(k2_waybel34(A,B,C),A,B) ) ) )).

fof(fc2_waybel_1,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ( v1_relat_1(k7_grcat_1(A))
        & v1_funct_1(k7_grcat_1(A))
        & v1_funct_2(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A))
        & v23_waybel_0(k7_grcat_1(A),A,A) ) ) )).

fof(fc2_yellow_2,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
        & m1_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
     => ( ~ v3_struct_0(k2_yellow_2(A,B,C))
        & v1_orders_2(k2_yellow_2(A,B,C))
        & v4_yellow_0(k2_yellow_2(A,B,C),B) ) ) )).

fof(fc3_waybel10,axiom,(
    ! [A] :
      ( l1_struct_0(A)
     => ( v1_relat_1(k7_grcat_1(A))
        & v1_funct_1(k7_grcat_1(A))
        & v2_funct_1(k7_grcat_1(A))
        & v1_funct_2(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A)) ) ) )).

fof(fc3_waybel_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A) )
     => ( v1_relat_1(k7_grcat_1(A))
        & v1_funct_1(k7_grcat_1(A))
        & v2_funct_1(k7_grcat_1(A))
        & ~ v1_xboole_0(k7_grcat_1(A))
        & v1_funct_2(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A))
        & v1_partfun1(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A))
        & v5_orders_3(k7_grcat_1(A),A,A)
        & v23_waybel_0(k7_grcat_1(A),A,A)
        & v6_waybel_1(k7_grcat_1(A),A) ) ) )).

fof(fc4_waybel10,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & l1_orders_2(A) )
     => ( v1_relat_1(k7_grcat_1(A))
        & v1_funct_1(k7_grcat_1(A))
        & v2_funct_1(k7_grcat_1(A))
        & ~ v1_xboole_0(k7_grcat_1(A))
        & v1_funct_2(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A))
        & v1_partfun1(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A))
        & v11_quantal1(k7_grcat_1(A))
        & v5_orders_3(k7_grcat_1(A),A,A)
        & v17_waybel_0(k7_grcat_1(A),A,A)
        & v18_waybel_0(k7_grcat_1(A),A,A)
        & v19_waybel_0(k7_grcat_1(A),A,A)
        & v20_waybel_0(k7_grcat_1(A),A,A)
        & v21_waybel_0(k7_grcat_1(A),A,A)
        & v22_waybel_0(k7_grcat_1(A),A,A)
        & v23_waybel_0(k7_grcat_1(A),A,A)
        & v6_waybel_1(k7_grcat_1(A),A)
        & v7_waybel_1(k7_grcat_1(A),A)
        & v8_waybel_1(k7_grcat_1(A),A) ) ) )).

fof(fc4_waybel_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & l1_orders_2(A) )
     => ( v1_relat_1(k7_grcat_1(A))
        & v1_funct_1(k7_grcat_1(A))
        & v2_funct_1(k7_grcat_1(A))
        & ~ v1_xboole_0(k7_grcat_1(A))
        & v1_funct_2(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A))
        & v1_partfun1(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A))
        & v5_orders_3(k7_grcat_1(A),A,A)
        & v23_waybel_0(k7_grcat_1(A),A,A)
        & v6_waybel_1(k7_grcat_1(A),A)
        & v7_waybel_1(k7_grcat_1(A),A) ) ) )).

fof(fc4_waybel_8,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A) )
     => ( ~ v3_struct_0(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v1_orders_2(g1_orders_2(u1_struct_0(A),u1_orders_2(A))) ) ) )).

fof(fc5_funct_1,axiom,(
    ! [A,B] :
      ( ( v1_relat_1(B)
        & v1_funct_1(B) )
     => ( v1_relat_1(k8_relat_1(A,B))
        & v1_funct_1(k8_relat_1(A,B)) ) ) )).

fof(fc5_waybel_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & l1_orders_2(A) )
     => ( v1_relat_1(k7_grcat_1(A))
        & v1_funct_1(k7_grcat_1(A))
        & v2_funct_1(k7_grcat_1(A))
        & ~ v1_xboole_0(k7_grcat_1(A))
        & v1_funct_2(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A))
        & v1_partfun1(k7_grcat_1(A),u1_struct_0(A),u1_struct_0(A))
        & v5_orders_3(k7_grcat_1(A),A,A)
        & v23_waybel_0(k7_grcat_1(A),A,A)
        & v6_waybel_1(k7_grcat_1(A),A)
        & v7_waybel_1(k7_grcat_1(A),A)
        & v8_waybel_1(k7_grcat_1(A),A) ) ) )).

fof(fc5_waybel_8,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & l1_orders_2(A) )
     => ( ~ v3_struct_0(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v1_orders_2(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v2_orders_2(g1_orders_2(u1_struct_0(A),u1_orders_2(A))) ) ) )).

fof(fc6_membered,axiom,
    ( v1_xboole_0(k1_xboole_0)
    & v1_membered(k1_xboole_0)
    & v2_membered(k1_xboole_0)
    & v3_membered(k1_xboole_0)
    & v4_membered(k1_xboole_0)
    & v5_membered(k1_xboole_0) )).

fof(fc6_waybel_1,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
        & m1_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
     => ( v1_relat_1(k2_waybel_1(A,B,C))
        & v1_funct_1(k2_waybel_1(A,B,C))
        & ~ v1_xboole_0(k2_waybel_1(A,B,C))
        & v1_funct_2(k2_waybel_1(A,B,C),u1_struct_0(A),u1_struct_0(k2_yellow_2(A,B,C)))
        & v2_funct_2(k2_waybel_1(A,B,C),u1_struct_0(A),u1_struct_0(k2_yellow_2(A,B,C)))
        & v1_partfun1(k2_waybel_1(A,B,C),u1_struct_0(A),u1_struct_0(k2_yellow_2(A,B,C))) ) ) )).

fof(fc6_waybel_8,axiom,(
    ! [A] :
      ( ( v3_orders_2(A)
        & l1_orders_2(A) )
     => ( v1_orders_2(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v3_orders_2(g1_orders_2(u1_struct_0(A),u1_orders_2(A))) ) ) )).

fof(fc7_waybel_1,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
        & m1_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
     => ( v1_relat_1(k3_waybel_1(A,B,C))
        & v1_funct_1(k3_waybel_1(A,B,C))
        & v2_funct_1(k3_waybel_1(A,B,C))
        & ~ v1_xboole_0(k3_waybel_1(A,B,C))
        & v1_funct_2(k3_waybel_1(A,B,C),u1_struct_0(k2_yellow_2(A,B,C)),u1_struct_0(B))
        & v1_partfun1(k3_waybel_1(A,B,C),u1_struct_0(k2_yellow_2(A,B,C)),u1_struct_0(B))
        & v5_orders_3(k3_waybel_1(A,B,C),k2_yellow_2(A,B,C),B) ) ) )).

fof(fc7_waybel_8,axiom,(
    ! [A] :
      ( ( v4_orders_2(A)
        & l1_orders_2(A) )
     => ( v1_orders_2(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v4_orders_2(g1_orders_2(u1_struct_0(A),u1_orders_2(A))) ) ) )).

fof(fc8_waybel_8,axiom,(
    ! [A] :
      ( ( v2_lattice3(A)
        & l1_orders_2(A) )
     => ( ~ v3_struct_0(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v1_orders_2(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v2_lattice3(g1_orders_2(u1_struct_0(A),u1_orders_2(A))) ) ) )).

fof(fc9_waybel34,axiom,(
    ! [A,B,C] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & v3_lattice3(A)
        & l1_orders_2(A)
        & v2_orders_2(B)
        & v3_orders_2(B)
        & v4_orders_2(B)
        & v1_lattice3(B)
        & v2_lattice3(B)
        & v3_lattice3(B)
        & l1_orders_2(B)
        & v1_funct_1(C)
        & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
        & v18_waybel_0(C,A,B)
        & m1_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
     => ( ~ v3_struct_0(k2_yellow_2(A,B,C))
        & v1_orders_2(k2_yellow_2(A,B,C))
        & v2_orders_2(k2_yellow_2(A,B,C))
        & v3_orders_2(k2_yellow_2(A,B,C))
        & v4_orders_2(k2_yellow_2(A,B,C))
        & v1_yellow_0(k2_yellow_2(A,B,C))
        & v2_yellow_0(k2_yellow_2(A,B,C))
        & v3_yellow_0(k2_yellow_2(A,B,C))
        & v4_yellow_0(k2_yellow_2(A,B,C),B)
        & v24_waybel_0(k2_yellow_2(A,B,C))
        & v25_waybel_0(k2_yellow_2(A,B,C))
        & v1_lattice3(k2_yellow_2(A,B,C))
        & v2_lattice3(k2_yellow_2(A,B,C))
        & v3_lattice3(k2_yellow_2(A,B,C)) ) ) )).

fof(fc9_waybel_8,axiom,(
    ! [A] :
      ( ( v1_lattice3(A)
        & l1_orders_2(A) )
     => ( ~ v3_struct_0(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v1_orders_2(g1_orders_2(u1_struct_0(A),u1_orders_2(A)))
        & v1_lattice3(g1_orders_2(u1_struct_0(A),u1_orders_2(A))) ) ) )).

fof(free_g1_orders_2,axiom,(
    ! [A,B] :
      ( m1_relset_1(B,A,A)
     => ! [C,D] :
          ( g1_orders_2(A,B) = g1_orders_2(C,D)
         => ( A = C
            & B = D ) ) ) )).

fof(rc13_waybel_0,axiom,(
    ? [A] :
      ( l1_orders_2(A)
      & ~ v3_struct_0(A)
      & v1_orders_2(A)
      & v2_orders_2(A)
      & v3_orders_2(A)
      & v4_orders_2(A)
      & v1_lattice3(A)
      & v2_lattice3(A)
      & v3_lattice3(A)
      & v1_yellow_0(A)
      & v2_yellow_0(A)
      & v3_yellow_0(A)
      & v24_waybel_0(A)
      & v25_waybel_0(A) ) )).

fof(rc1_finset_1,axiom,(
    ? [A] :
      ( ~ v1_xboole_0(A)
      & v1_finset_1(A) ) )).

fof(rc1_funct_1,axiom,(
    ? [A] :
      ( v1_relat_1(A)
      & v1_funct_1(A) ) )).

fof(rc1_lattice3,axiom,(
    ? [A] :
      ( l1_orders_2(A)
      & ~ v3_struct_0(A)
      & v1_orders_2(A)
      & v2_orders_2(A)
      & v3_orders_2(A)
      & v4_orders_2(A)
      & v3_lattice3(A) ) )).

fof(rc1_lattice5,axiom,(
    ! [A,B] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & l1_orders_2(A)
        & v2_orders_2(B)
        & v3_orders_2(B)
        & v4_orders_2(B)
        & v1_lattice3(B)
        & v2_lattice3(B)
        & l1_orders_2(B) )
     => ? [C] :
          ( m1_relset_1(C,u1_struct_0(A),u1_struct_0(B))
          & v1_relat_1(C)
          & v1_funct_1(C)
          & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
          & v19_waybel_0(C,A,B)
          & v20_waybel_0(C,A,B) ) ) )).

fof(rc1_membered,axiom,(
    ? [A] :
      ( ~ v1_xboole_0(A)
      & v1_membered(A)
      & v2_membered(A)
      & v3_membered(A)
      & v4_membered(A)
      & v5_membered(A) ) )).

fof(rc1_waybel10,axiom,(
    ! [A,B] :
      ( ( l1_orders_2(A)
        & ~ v3_struct_0(B)
        & v2_orders_2(B)
        & l1_orders_2(B) )
     => ? [C] :
          ( m1_relset_1(C,u1_struct_0(A),u1_struct_0(B))
          & v1_relat_1(C)
          & v1_funct_1(C)
          & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
          & v1_partfun1(C,u1_struct_0(A),u1_struct_0(B))
          & v5_orders_3(C,A,B) ) ) )).

fof(rc1_waybel21,axiom,(
    ! [A] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & v3_lattice3(A)
        & l1_orders_2(A) )
     => ? [B] :
          ( m1_yellow_0(B,A)
          & ~ v3_struct_0(B)
          & v2_orders_2(B)
          & v3_orders_2(B)
          & v4_orders_2(B)
          & v1_yellow_0(B)
          & v2_yellow_0(B)
          & v3_yellow_0(B)
          & v4_yellow_0(B,A)
          & v5_yellow_0(B,A)
          & v7_yellow_0(B,A)
          & v3_waybel_0(B,A)
          & v4_waybel_0(B,A)
          & v24_waybel_0(B)
          & v25_waybel_0(B)
          & v1_lattice3(B)
          & v2_lattice3(B)
          & v3_lattice3(B) ) ) )).

fof(rc1_waybel_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A) )
     => ? [B] :
          ( m1_relset_1(B,u1_struct_0(A),u1_struct_0(A))
          & v1_relat_1(B)
          & v1_funct_1(B)
          & ~ v1_xboole_0(B)
          & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
          & v1_partfun1(B,u1_struct_0(A),u1_struct_0(A))
          & v6_waybel_1(B,A) ) ) )).

fof(rc2_funct_1,axiom,(
    ? [A] :
      ( v1_relat_1(A)
      & v1_xboole_0(A)
      & v1_funct_1(A) ) )).

fof(rc2_lattice3,axiom,(
    ? [A] :
      ( l1_orders_2(A)
      & ~ v3_struct_0(A)
      & v1_orders_2(A)
      & v2_orders_2(A)
      & v3_orders_2(A)
      & v4_orders_2(A)
      & v1_lattice3(A)
      & v2_lattice3(A)
      & v3_lattice3(A) ) )).

fof(rc2_waybel10,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & l1_orders_2(A) )
     => ? [B] :
          ( m1_relset_1(B,u1_struct_0(A),u1_struct_0(A))
          & v1_relat_1(B)
          & v1_funct_1(B)
          & v2_funct_1(B)
          & ~ v1_xboole_0(B)
          & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
          & v1_partfun1(B,u1_struct_0(A),u1_struct_0(A))
          & v11_quantal1(B)
          & v5_orders_3(B,A,A)
          & v17_waybel_0(B,A,A)
          & v18_waybel_0(B,A,A)
          & v19_waybel_0(B,A,A)
          & v20_waybel_0(B,A,A)
          & v21_waybel_0(B,A,A)
          & v22_waybel_0(B,A,A)
          & v6_waybel_1(B,A)
          & v7_waybel_1(B,A)
          & v8_waybel_1(B,A) ) ) )).

fof(rc2_waybel_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & l1_orders_2(A) )
     => ? [B] :
          ( m1_relset_1(B,u1_struct_0(A),u1_struct_0(A))
          & v1_relat_1(B)
          & v1_funct_1(B)
          & ~ v1_xboole_0(B)
          & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
          & v1_partfun1(B,u1_struct_0(A),u1_struct_0(A))
          & v6_waybel_1(B,A)
          & v7_waybel_1(B,A) ) ) )).

fof(rc2_waybel_3,axiom,(
    ? [A] :
      ( l1_orders_2(A)
      & ~ v3_struct_0(A)
      & v1_orders_2(A)
      & v2_orders_2(A)
      & v3_orders_2(A)
      & v4_orders_2(A)
      & v1_lattice3(A)
      & v2_lattice3(A)
      & v3_lattice3(A)
      & v1_yellow_0(A)
      & v2_yellow_0(A)
      & v3_yellow_0(A)
      & v24_waybel_0(A)
      & v25_waybel_0(A)
      & v2_waybel_3(A)
      & v3_waybel_3(A) ) )).

fof(rc2_yellow_0,axiom,(
    ? [A] :
      ( l1_orders_2(A)
      & ~ v3_struct_0(A)
      & v2_orders_2(A)
      & v3_orders_2(A)
      & v4_orders_2(A)
      & v1_lattice3(A)
      & v2_lattice3(A)
      & v3_lattice3(A)
      & v1_yellow_0(A)
      & v2_yellow_0(A)
      & v3_yellow_0(A) ) )).

fof(rc3_finset_1,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
          & ~ v1_xboole_0(B)
          & v1_finset_1(B) ) ) )).

fof(rc3_funct_1,axiom,(
    ? [A] :
      ( v1_relat_1(A)
      & v1_funct_1(A)
      & v2_funct_1(A) ) )).

fof(rc3_struct_0,axiom,(
    ? [A] :
      ( l1_struct_0(A)
      & ~ v3_struct_0(A) ) )).

fof(rc3_waybel_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_orders_2(A)
        & l1_orders_2(A) )
     => ? [B] :
          ( m1_relset_1(B,u1_struct_0(A),u1_struct_0(A))
          & v1_relat_1(B)
          & v1_funct_1(B)
          & ~ v1_xboole_0(B)
          & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
          & v1_partfun1(B,u1_struct_0(A),u1_struct_0(A))
          & v6_waybel_1(B,A)
          & v8_waybel_1(B,A) ) ) )).

fof(rc3_yellow_0,axiom,(
    ! [A] :
      ( l1_orders_2(A)
     => ? [B] :
          ( m1_yellow_0(B,A)
          & v1_orders_2(B)
          & v4_yellow_0(B,A) ) ) )).

fof(rc3_yellow_9,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & v2_orders_2(B)
        & v4_orders_2(B)
        & v2_yellow_0(B)
        & l1_orders_2(B) )
     => ? [C] :
          ( m1_relset_1(C,u1_struct_0(A),u1_struct_0(B))
          & v1_relat_1(C)
          & v1_funct_1(C)
          & ~ v1_xboole_0(C)
          & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
          & v17_waybel_0(C,A,B)
          & v19_waybel_0(C,A,B)
          & v21_waybel_0(C,A,B)
          & v1_partfun1(C,u1_struct_0(A),u1_struct_0(B)) ) ) )).

fof(rc4_finset_1,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
          & ~ v1_xboole_0(B)
          & v1_finset_1(B) ) ) )).

fof(rc4_yellow_0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A) )
     => ? [B] :
          ( m1_yellow_0(B,A)
          & ~ v3_struct_0(B)
          & v1_orders_2(B)
          & v4_yellow_0(B,A) ) ) )).

fof(rc4_yellow_9,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & l1_orders_2(A)
        & ~ v3_struct_0(B)
        & v2_orders_2(B)
        & v4_orders_2(B)
        & v1_yellow_0(B)
        & l1_orders_2(B) )
     => ? [C] :
          ( m1_relset_1(C,u1_struct_0(A),u1_struct_0(B))
          & v1_relat_1(C)
          & v1_funct_1(C)
          & ~ v1_xboole_0(C)
          & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
          & v18_waybel_0(C,A,B)
          & v20_waybel_0(C,A,B)
          & v22_waybel_0(C,A,B)
          & v1_partfun1(C,u1_struct_0(A),u1_struct_0(B)) ) ) )).

fof(rc5_struct_0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_struct_0(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
          & ~ v1_xboole_0(B) ) ) )).

fof(redefinition_m2_relset_1,axiom,(
    ! [A,B,C] :
      ( m2_relset_1(C,A,B)
    <=> m1_relset_1(C,A,B) ) )).

fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : r1_tarski(A,A) )).

fof(t1_subset,axiom,(
    ! [A,B] :
      ( r2_hidden(A,B)
     => m1_subset_1(A,B) ) )).

fof(t25_waybel34,axiom,(
    ! [A] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & v3_lattice3(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( ( v2_orders_2(B)
            & v3_orders_2(B)
            & v4_orders_2(B)
            & v1_lattice3(B)
            & v2_lattice3(B)
            & v3_lattice3(B)
            & v3_waybel_3(B)
            & l1_orders_2(B) )
         => ! [C] :
              ( ( v1_funct_1(C)
                & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
                & v17_waybel_0(C,A,B)
                & m2_relset_1(C,u1_struct_0(A),u1_struct_0(B)) )
             => ( v1_waybel34(k1_waybel34(A,B,C),B,A)
               => v22_waybel_0(C,A,B) ) ) ) ) )).

fof(t2_subset,axiom,(
    ! [A,B] :
      ( m1_subset_1(A,B)
     => ( v1_xboole_0(B)
        | r2_hidden(A,B) ) ) )).

fof(t39_waybel34,axiom,(
    ! [A] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & v3_lattice3(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( ( v1_funct_1(B)
            & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
            & v7_waybel_1(B,A)
            & m2_relset_1(B,u1_struct_0(A),u1_struct_0(A)) )
         => ( v18_waybel_0(k2_waybel_1(A,A,B),A,k2_yellow_2(A,A,B))
            & v17_waybel_0(k3_waybel_1(A,A,B),k2_yellow_2(A,A,B),A)
            & k2_waybel34(k2_yellow_2(A,A,B),A,k2_waybel_1(A,A,B)) = k3_waybel_1(A,A,B)
            & k1_waybel34(k2_yellow_2(A,A,B),A,k3_waybel_1(A,A,B)) = k2_waybel_1(A,A,B) ) ) ) )).

fof(t3_subset,axiom,(
    ! [A,B] :
      ( m1_subset_1(A,k1_zfmisc_1(B))
    <=> r1_tarski(A,B) ) )).

fof(t40_waybel34,axiom,(
    ! [A] :
      ( ( v2_orders_2(A)
        & v3_orders_2(A)
        & v4_orders_2(A)
        & v1_lattice3(A)
        & v2_lattice3(A)
        & v3_lattice3(A)
        & l1_orders_2(A) )
     => ! [B] :
          ( ( v1_funct_1(B)
            & v1_funct_2(B,u1_struct_0(A),u1_struct_0(A))
            & v7_waybel_1(B,A)
            & m2_relset_1(B,u1_struct_0(A),u1_struct_0(A)) )
         => ( v4_waybel_0(k2_yellow_2(A,A,B),A)
          <=> v22_waybel_0(k3_waybel_1(A,A,B),k2_yellow_2(A,A,B),A) ) ) ) )).

fof(t4_subset,axiom,(
    ! [A,B,C] :
      ( ( r2_hidden(A,B)
        & m1_subset_1(B,k1_zfmisc_1(C)) )
     => m1_subset_1(A,C) ) )).

fof(t5_subset,axiom,(
    ! [A,B,C] :
      ~ ( r2_hidden(A,B)
        & m1_subset_1(B,k1_zfmisc_1(C))
        & v1_xboole_0(C) ) )).

fof(t6_boole,axiom,(
    ! [A] :
      ( v1_xboole_0(A)
     => A = k1_xboole_0 ) )).

fof(t7_boole,axiom,(
    ! [A,B] :
      ~ ( r2_hidden(A,B)
        & v1_xboole_0(B) ) )).

fof(t8_boole,axiom,(
    ! [A,B] :
      ~ ( v1_xboole_0(A)
        & A != B
        & v1_xboole_0(B) ) )).
%------------------------------------------------------------------------------
