%------------------------------------------------------------------------------
% File     : TOP034+1 : TPTP v6.1.0. Released v3.4.0.
% Domain   : Topology
% Problem  : Maximal Kolmogorov Subspaces of a Topological Space T23
% Version  : [Urb08] axioms : Especial.
% English  :

% Refs     : [Kar96] Karno (1996), Maximal Kolmogorov Subspaces of a Topolo
%          : [Urb07] Urban (2007), MPTP 0.2: Design, Implementation, and In
%          : [Urb08] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb08]
% Names    : t23_tsp_2 [Urb08]

% Status   : Theorem
% Rating   : 0.16 v6.1.0, 0.20 v6.0.0, 0.17 v5.5.0, 0.22 v5.4.0, 0.29 v5.3.0, 0.30 v5.2.0, 0.15 v5.1.0, 0.24 v5.0.0, 0.21 v4.1.0, 0.26 v4.0.0, 0.29 v3.7.0, 0.20 v3.5.0, 0.21 v3.4.0
% Syntax   : Number of formulae    :   95 (  14 unit)
%            Number of atoms       :  466 (   2 equality)
%            Maximal formula depth :   15 (   6 average)
%            Number of connectives :  476 ( 105 ~  ;   1  |; 230  &)
%                                         (   4 <=>; 136 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   46 (   1 propositional; 0-3 arity)
%            Number of functors    :    4 (   1 constant; 0-2 arity)
%            Number of variables   :  160 (   1 singleton; 139 !;  21 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Normal version: includes the axioms (which may be theorems from
%            other articles) and background that are possibly necessary.
%          : Translated by MPTP from the Mizar Mathematical Library 4.48.930.
%          : The problem encoding is based on set theory.
%------------------------------------------------------------------------------
fof(t23_tsp_2,conjecture,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( ( ~ v3_struct_0(B)
            & v2_tsp_2(B,A)
            & m2_tsp_1(B,A) )
         => r1_borsuk_1(A,B) ) ) )).

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

fof(cc10_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ( ( ~ v3_struct_0(A)
          & v2_pre_topc(A)
          & ~ v1_tdlat_3(A)
          & v2_t_0topsp(A) )
       => ( ~ v3_struct_0(A)
          & ~ v3_realset2(A)
          & v2_pre_topc(A)
          & ~ v1_tdlat_3(A)
          & ~ v2_tdlat_3(A)
          & ~ v3_tdlat_3(A) ) ) ) )).

fof(cc10_tsp_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ( v2_tex_2(B,A)
              & v2_tsp_2(B,A) )
           => ( v2_pre_topc(B)
              & ~ v1_borsuk_1(B,A) ) ) ) ) )).

fof(cc11_membered,axiom,(
    ! [A] :
      ( v2_membered(A)
     => ! [B] :
          ( m1_subset_1(B,A)
         => ( v1_xcmplx_0(B)
            & v1_xreal_0(B) ) ) ) )).

fof(cc11_tsp_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & v2_t_0topsp(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ~ v3_struct_0(B)
           => ( ~ v3_struct_0(B)
              & v2_t_0topsp(B) ) ) ) ) )).

fof(cc12_membered,axiom,(
    ! [A] :
      ( v3_membered(A)
     => ! [B] :
          ( m1_subset_1(B,A)
         => ( v1_xcmplx_0(B)
            & v1_xreal_0(B)
            & v1_rat_1(B) ) ) ) )).

fof(cc12_tsp_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & ~ v2_t_0topsp(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ( ~ v3_struct_0(B)
              & ~ v2_tex_2(B,A) )
           => ( ~ v3_struct_0(B)
              & ~ v3_realset2(B)
              & ~ v2_t_0topsp(B) ) ) ) ) )).

fof(cc13_membered,axiom,(
    ! [A] :
      ( v4_membered(A)
     => ! [B] :
          ( m1_subset_1(B,A)
         => ( v1_xcmplx_0(B)
            & v1_xreal_0(B)
            & v1_int_1(B)
            & v1_rat_1(B) ) ) ) )).

fof(cc13_tsp_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & ~ v2_t_0topsp(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ( ~ v3_struct_0(B)
              & v2_t_0topsp(B) )
           => ( ~ v3_struct_0(B)
              & v2_tex_2(B,A) ) ) ) ) )).

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

fof(cc1_membered,axiom,(
    ! [A] :
      ( v5_membered(A)
     => v4_membered(A) ) )).

fof(cc1_pre_topc,axiom,(
    ! [A] :
      ( ( v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => v2_pre_topc(B) ) ) )).

fof(cc1_relset_1,axiom,(
    ! [A,B,C] :
      ( m1_subset_1(C,k1_zfmisc_1(k2_zfmisc_1(A,B)))
     => v1_relat_1(C) ) )).

fof(cc1_tops_1,axiom,(
    ! [A] :
      ( ( v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
         => ( v1_xboole_0(B)
           => ( v3_pre_topc(B,A)
              & v4_pre_topc(B,A) ) ) ) ) )).

fof(cc1_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ( ( ~ v3_struct_0(A)
          & v3_realset2(A) )
       => ( ~ v3_struct_0(A)
          & v2_t_0topsp(A) ) ) ) )).

fof(cc1_tsp_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ( ~ v3_struct_0(B)
              & v2_tsp_2(B,A) )
           => ( ~ v3_struct_0(B)
              & v2_t_0topsp(B) ) ) ) ) )).

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

fof(cc2_membered,axiom,(
    ! [A] :
      ( v4_membered(A)
     => v3_membered(A) ) )).

fof(cc2_tops_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
         => ( v1_xboole_0(B)
           => v2_tops_1(B,A) ) ) ) )).

fof(cc2_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ( ( ~ v3_struct_0(A)
          & ~ v2_t_0topsp(A) )
       => ( ~ v3_struct_0(A)
          & ~ v3_realset2(A) ) ) ) )).

fof(cc2_tsp_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ( ~ v3_struct_0(B)
              & ~ v2_t_0topsp(B) )
           => ( ~ v3_struct_0(B)
              & ~ v2_tsp_2(B,A) ) ) ) ) )).

fof(cc3_membered,axiom,(
    ! [A] :
      ( v3_membered(A)
     => v2_membered(A) ) )).

fof(cc3_tops_1,axiom,(
    ! [A] :
      ( ( v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
         => ( v1_xboole_0(B)
           => v3_tops_1(B,A) ) ) ) )).

fof(cc3_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ( ( ~ v3_struct_0(A)
          & v2_pre_topc(A)
          & v1_tdlat_3(A) )
       => ( ~ v3_struct_0(A)
          & v2_pre_topc(A)
          & v2_t_0topsp(A) ) ) ) )).

fof(cc3_tsp_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( v2_tsp_2(B,A)
           => ( v2_pre_topc(B)
              & v1_tex_3(B,A) ) ) ) ) )).

fof(cc4_membered,axiom,(
    ! [A] :
      ( v2_membered(A)
     => v1_membered(A) ) )).

fof(cc4_tops_1,axiom,(
    ! [A] :
      ( ( v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
         => ( v3_tops_1(B,A)
           => v2_tops_1(B,A) ) ) ) )).

fof(cc4_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ( ( ~ v3_struct_0(A)
          & v2_pre_topc(A)
          & ~ v2_t_0topsp(A) )
       => ( ~ v3_struct_0(A)
          & ~ v3_realset2(A)
          & v2_pre_topc(A)
          & ~ v1_tdlat_3(A) ) ) ) )).

fof(cc4_tsp_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ~ v1_tex_3(B,A)
           => ( v2_pre_topc(B)
              & ~ v2_tsp_2(B,A) ) ) ) ) )).

fof(cc5_tops_1,axiom,(
    ! [A] :
      ( ( v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
         => ( ( v4_pre_topc(B,A)
              & v2_tops_1(B,A) )
           => ( v2_tops_1(B,A)
              & v3_tops_1(B,A) ) ) ) ) )).

fof(cc5_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ( ( ~ v3_struct_0(A)
          & ~ v3_realset2(A)
          & v2_pre_topc(A)
          & v2_tdlat_3(A) )
       => ( ~ v3_struct_0(A)
          & ~ v3_realset2(A)
          & v2_pre_topc(A)
          & ~ v2_t_0topsp(A) ) ) ) )).

fof(cc5_tsp_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ( v1_tsep_1(B,A)
              & v2_tsp_2(B,A) )
           => ( v2_pre_topc(B)
              & ~ v2_tex_2(B,A) ) ) ) ) )).

fof(cc6_tops_1,axiom,(
    ! [A] :
      ( ( v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
         => ( ( v3_pre_topc(B,A)
              & v3_tops_1(B,A) )
           => ( v1_xboole_0(B)
              & v3_pre_topc(B,A)
              & v4_pre_topc(B,A)
              & v1_membered(B)
              & v2_membered(B)
              & v3_membered(B)
              & v4_membered(B)
              & v5_membered(B)
              & v2_tops_1(B,A)
              & v3_tops_1(B,A) ) ) ) ) )).

fof(cc6_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ( ( ~ v3_struct_0(A)
          & v2_pre_topc(A)
          & v2_tdlat_3(A)
          & v2_t_0topsp(A) )
       => ( ~ v3_struct_0(A)
          & v3_realset2(A)
          & v2_pre_topc(A)
          & v1_tdlat_3(A)
          & v2_tdlat_3(A)
          & v3_tdlat_3(A)
          & v4_tdlat_3(A)
          & v5_tdlat_3(A)
          & v2_t_0topsp(A) ) ) ) )).

fof(cc6_tsp_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ( v1_tsep_1(B,A)
              & v2_tex_2(B,A) )
           => ( v2_pre_topc(B)
              & ~ v2_tsp_2(B,A) ) ) ) ) )).

fof(cc7_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ( ( ~ v3_struct_0(A)
          & ~ v3_realset2(A)
          & v2_pre_topc(A)
          & v2_t_0topsp(A) )
       => ( ~ v3_struct_0(A)
          & ~ v3_realset2(A)
          & v2_pre_topc(A)
          & ~ v2_tdlat_3(A) ) ) ) )).

fof(cc7_tsp_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ( v2_tex_2(B,A)
              & v2_tsp_2(B,A) )
           => ( v2_pre_topc(B)
              & ~ v1_tsep_1(B,A) ) ) ) ) )).

fof(cc8_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ( ( ~ v3_struct_0(A)
          & v2_pre_topc(A)
          & v3_tdlat_3(A)
          & v2_t_0topsp(A) )
       => ( ~ v3_struct_0(A)
          & v2_pre_topc(A)
          & v1_tdlat_3(A)
          & v3_tdlat_3(A)
          & v4_tdlat_3(A)
          & v5_tdlat_3(A)
          & v2_t_0topsp(A) ) ) ) )).

fof(cc8_tsp_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ( v1_borsuk_1(B,A)
              & v2_tsp_2(B,A) )
           => ( v2_pre_topc(B)
              & ~ v2_tex_2(B,A) ) ) ) ) )).

fof(cc9_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ( ( ~ v3_struct_0(A)
          & v2_pre_topc(A)
          & ~ v1_tdlat_3(A)
          & v3_tdlat_3(A) )
       => ( ~ v3_struct_0(A)
          & ~ v3_realset2(A)
          & v2_pre_topc(A)
          & ~ v1_tdlat_3(A)
          & ~ v2_t_0topsp(A) ) ) ) )).

fof(cc9_tsp_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( m1_pre_topc(B,A)
         => ( ( v2_tex_2(B,A)
              & v1_borsuk_1(B,A) )
           => ( v2_pre_topc(B)
              & ~ v2_tsp_2(B,A) ) ) ) ) )).

fof(d20_borsuk_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( ( ~ v3_struct_0(B)
            & m1_pre_topc(B,A) )
         => ( r1_borsuk_1(A,B)
          <=> ? [C] :
                ( v1_funct_1(C)
                & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
                & v5_pre_topc(C,A,B)
                & m2_relset_1(C,u1_struct_0(A),u1_struct_0(B))
                & v3_borsuk_1(C,A,B) ) ) ) ) )).

fof(dt_k1_xboole_0,axiom,(
    $true )).

fof(dt_k1_zfmisc_1,axiom,(
    $true )).

fof(dt_k2_zfmisc_1,axiom,(
    $true )).

fof(dt_l1_pre_topc,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => l1_struct_0(A) ) )).

fof(dt_l1_struct_0,axiom,(
    $true )).

fof(dt_m1_pre_topc,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ! [B] :
          ( m1_pre_topc(B,A)
         => l1_pre_topc(B) ) ) )).

fof(dt_m1_relset_1,axiom,(
    $true )).

fof(dt_m1_subset_1,axiom,(
    $true )).

fof(dt_m2_relset_1,axiom,(
    ! [A,B,C] :
      ( m2_relset_1(C,A,B)
     => m1_subset_1(C,k1_zfmisc_1(k2_zfmisc_1(A,B))) ) )).

fof(dt_m2_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ! [B] :
          ( m2_tsp_1(B,A)
         => l1_pre_topc(B) ) ) )).

fof(dt_u1_struct_0,axiom,(
    $true )).

fof(existence_l1_pre_topc,axiom,(
    ? [A] : l1_pre_topc(A) )).

fof(existence_l1_struct_0,axiom,(
    ? [A] : l1_struct_0(A) )).

fof(existence_m1_pre_topc,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ? [B] : m1_pre_topc(B,A) ) )).

fof(existence_m1_relset_1,axiom,(
    ! [A,B] :
    ? [C] : m1_relset_1(C,A,B) )).

fof(existence_m1_subset_1,axiom,(
    ! [A] :
    ? [B] : m1_subset_1(B,A) )).

fof(existence_m2_relset_1,axiom,(
    ! [A,B] :
    ? [C] : m2_relset_1(C,A,B) )).

fof(existence_m2_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ? [B] : m2_tsp_1(B,A) ) )).

fof(fc1_struct_0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_struct_0(A) )
     => ~ v1_xboole_0(u1_struct_0(A)) ) )).

fof(fc1_subset_1,axiom,(
    ! [A] : ~ v1_xboole_0(k1_zfmisc_1(A)) )).

fof(fc4_subset_1,axiom,(
    ! [A,B] :
      ( ( ~ v1_xboole_0(A)
        & ~ v1_xboole_0(B) )
     => ~ v1_xboole_0(k2_zfmisc_1(A,B)) ) )).

fof(fc6_membered,axiom,
    ( v1_xboole_0(k1_xboole_0)
    & v1_membered(k1_xboole_0)
    & v2_membered(k1_xboole_0)
    & v3_membered(k1_xboole_0)
    & v4_membered(k1_xboole_0)
    & v5_membered(k1_xboole_0) )).

fof(rc1_membered,axiom,(
    ? [A] :
      ( ~ v1_xboole_0(A)
      & v1_membered(A)
      & v2_membered(A)
      & v3_membered(A)
      & v4_membered(A)
      & v5_membered(A) ) )).

fof(rc1_subset_1,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
          & ~ v1_xboole_0(B) ) ) )).

fof(rc1_tops_1,axiom,(
    ! [A] :
      ( ( v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
          & v3_pre_topc(B,A) ) ) )).

fof(rc2_subset_1,axiom,(
    ! [A] :
    ? [B] :
      ( m1_subset_1(B,k1_zfmisc_1(A))
      & v1_xboole_0(B) ) )).

fof(rc2_tops_1,axiom,(
    ! [A] :
      ( ( v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
          & v3_pre_topc(B,A)
          & v4_pre_topc(B,A) ) ) )).

fof(rc3_struct_0,axiom,(
    ? [A] :
      ( l1_struct_0(A)
      & ~ v3_struct_0(A) ) )).

fof(rc3_tops_1,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
          & ~ v1_xboole_0(B)
          & v3_pre_topc(B,A)
          & v4_pre_topc(B,A) ) ) )).

fof(rc4_tops_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
          & v1_xboole_0(B)
          & v1_membered(B)
          & v2_membered(B)
          & v3_membered(B)
          & v4_membered(B)
          & v5_membered(B)
          & v2_tops_1(B,A) ) ) )).

fof(rc5_struct_0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_struct_0(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
          & ~ v1_xboole_0(B) ) ) )).

fof(rc5_tops_1,axiom,(
    ! [A] :
      ( ( v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
          & v1_xboole_0(B)
          & v3_pre_topc(B,A)
          & v4_pre_topc(B,A)
          & v1_membered(B)
          & v2_membered(B)
          & v3_membered(B)
          & v4_membered(B)
          & v5_membered(B)
          & v2_tops_1(B,A)
          & v3_tops_1(B,A) ) ) )).

fof(rc6_pre_topc,axiom,(
    ! [A] :
      ( ( v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
          & v4_pre_topc(B,A) ) ) )).

fof(rc7_pre_topc,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
          & ~ v1_xboole_0(B)
          & v4_pre_topc(B,A) ) ) )).

fof(redefinition_m2_relset_1,axiom,(
    ! [A,B,C] :
      ( m2_relset_1(C,A,B)
    <=> m1_relset_1(C,A,B) ) )).

fof(redefinition_m2_tsp_1,axiom,(
    ! [A] :
      ( l1_pre_topc(A)
     => ! [B] :
          ( m2_tsp_1(B,A)
        <=> m1_pre_topc(B,A) ) ) )).

fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : r1_tarski(A,A) )).

fof(t1_subset,axiom,(
    ! [A,B] :
      ( r2_hidden(A,B)
     => m1_subset_1(A,B) ) )).

fof(t22_tsp_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_pre_topc(A)
        & l1_pre_topc(A) )
     => ! [B] :
          ( ( ~ v3_struct_0(B)
            & v2_tsp_2(B,A)
            & m2_tsp_1(B,A) )
         => ? [C] :
              ( v1_funct_1(C)
              & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
              & v5_pre_topc(C,A,B)
              & m2_relset_1(C,u1_struct_0(A),u1_struct_0(B))
              & v3_borsuk_1(C,A,B) ) ) ) )).

fof(t2_subset,axiom,(
    ! [A,B] :
      ( m1_subset_1(A,B)
     => ( v1_xboole_0(B)
        | r2_hidden(A,B) ) ) )).

fof(t3_subset,axiom,(
    ! [A,B] :
      ( m1_subset_1(A,k1_zfmisc_1(B))
    <=> r1_tarski(A,B) ) )).

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
