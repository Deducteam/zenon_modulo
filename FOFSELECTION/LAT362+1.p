%------------------------------------------------------------------------------
% File     : LAT362+1 : TPTP v6.1.0. Released v3.4.0.
% Domain   : Lattice Theory
% Problem  : Duality Based on Galois Connection - Part I T20
% Version  : [Urb08] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek (2001), Duality Based on the Galois Connectio
%          : [Urb07] Urban (2007), MPTP 0.2: Design, Implementation, and In
%          : [Urb08] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb08]
% Names    : t20_waybel34 [Urb08]

% Status   : Theorem
% Rating   : 0.20 v6.1.0, 0.30 v5.5.0, 0.37 v5.4.0, 0.39 v5.3.0, 0.44 v5.2.0, 0.30 v5.1.0, 0.33 v5.0.0, 0.38 v4.1.0, 0.43 v4.0.1, 0.48 v4.0.0, 0.50 v3.5.0, 0.53 v3.4.0
% Syntax   : Number of formulae    :  113 (  18 unit)
%            Number of atoms       :  509 (  13 equality)
%            Maximal formula depth :   15 (   6 average)
%            Number of connectives :  457 (  61 ~  ;   1  |; 277  &)
%                                         (   3 <=>; 115 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   56 (   1 propositional; 0-6 arity)
%            Number of functors    :   16 (   1 constant; 0-4 arity)
%            Number of variables   :  225 (   1 singleton; 195 !;  30 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Normal version: includes the axioms (which may be theorems from
%            other articles) and background that are possibly necessary.
%          : Translated by MPTP from the Mizar Mathematical Library 4.48.930.
%          : The problem encoding is based on set theory.
%------------------------------------------------------------------------------
fof(t20_waybel34,conjecture,(
    ! [A] :
      ( ~ v2_setfam_1(A)
     => r2_functor0(k4_waybel34(A),k5_waybel34(A)) ) )).

fof(abstractness_v6_altcat_1,axiom,(
    ! [A] :
      ( l2_altcat_1(A)
     => ( v6_altcat_1(A)
       => A = g2_altcat_1(u1_struct_0(A),u1_altcat_1(A),u2_altcat_1(A)) ) ) )).

fof(abstractness_v9_functor0,axiom,(
    ! [A,B,C] :
      ( ( l1_altcat_1(A)
        & l1_altcat_1(B)
        & l2_functor0(C,A,B) )
     => ( v9_functor0(C,A,B)
       => C = g2_functor0(A,B,u1_functor0(A,B,C),u2_functor0(A,B,C)) ) ) )).

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

fof(cc11_membered,axiom,(
    ! [A] :
      ( v2_membered(A)
     => ! [B] :
          ( m1_subset_1(B,A)
         => ( v1_xcmplx_0(B)
            & v1_xreal_0(B) ) ) ) )).

fof(cc12_membered,axiom,(
    ! [A] :
      ( v3_membered(A)
     => ! [B] :
          ( m1_subset_1(B,A)
         => ( v1_xcmplx_0(B)
            & v1_xreal_0(B)
            & v1_rat_1(B) ) ) ) )).

fof(cc13_membered,axiom,(
    ! [A] :
      ( v4_membered(A)
     => ! [B] :
          ( m1_subset_1(B,A)
         => ( v1_xcmplx_0(B)
            & v1_xreal_0(B)
            & v1_int_1(B)
            & v1_rat_1(B) ) ) ) )).

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

fof(cc1_finset_1,axiom,(
    ! [A] :
      ( v1_xboole_0(A)
     => v1_finset_1(A) ) )).

fof(cc1_funct_1,axiom,(
    ! [A] :
      ( v1_xboole_0(A)
     => v1_funct_1(A) ) )).

fof(cc1_functor0,axiom,(
    ! [A,B,C,D,E] :
      ( ( v1_funct_1(C)
        & v1_funct_2(C,A,B)
        & m1_relset_1(C,A,B)
        & m1_pboole(D,A)
        & m1_pboole(E,B) )
     => ! [F] :
          ( m1_functor0(F,A,B,C,D,E)
         => v1_funcop_1(F) ) ) )).

fof(cc1_functor2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v2_altcat_1(A)
        & v12_altcat_1(A)
        & l2_altcat_1(A)
        & ~ v3_struct_0(B)
        & v12_altcat_1(B)
        & l2_altcat_1(B) )
     => ! [C] :
          ( m2_functor0(C,A,B)
         => ( v8_functor0(C,A,B)
            & v12_functor0(C,A,B) ) ) ) )).

fof(cc1_membered,axiom,(
    ! [A] :
      ( v5_membered(A)
     => v4_membered(A) ) )).

fof(cc1_relset_1,axiom,(
    ! [A,B,C] :
      ( m1_subset_1(C,k1_zfmisc_1(k2_zfmisc_1(A,B)))
     => v1_relat_1(C) ) )).

fof(cc1_yellow21,axiom,(
    ! [A] :
      ( l2_altcat_1(A)
     => ( ( ~ v3_struct_0(A)
          & v2_altcat_1(A)
          & v11_altcat_1(A)
          & v12_altcat_1(A)
          & v3_yellow21(A) )
       => ( ~ v3_struct_0(A)
          & v2_altcat_1(A)
          & v11_altcat_1(A)
          & v12_altcat_1(A)
          & v1_altcat_2(A)
          & v2_yellow21(A) ) ) ) )).

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

fof(cc2_functor0,axiom,(
    ! [A] :
      ( l2_altcat_1(A)
     => ( ( ~ v3_struct_0(A)
          & v12_altcat_1(A) )
       => ( ~ v3_struct_0(A)
          & v1_altcat_2(A) ) ) ) )).

fof(cc2_membered,axiom,(
    ! [A] :
      ( v4_membered(A)
     => v3_membered(A) ) )).

fof(cc2_setfam_1,axiom,(
    ! [A] :
      ( ~ v2_setfam_1(A)
     => ~ v1_xboole_0(A) ) )).

fof(cc2_yellow21,axiom,(
    ! [A] :
      ( l2_altcat_1(A)
     => ( ( ~ v3_struct_0(A)
          & v2_altcat_1(A)
          & v11_altcat_1(A)
          & v12_altcat_1(A)
          & v2_yellow21(A) )
       => ( ~ v3_struct_0(A)
          & v2_altcat_1(A)
          & v9_altcat_1(A)
          & v11_altcat_1(A)
          & v12_altcat_1(A)
          & v1_altcat_2(A)
          & v2_yellow18(A)
          & v3_yellow18(A)
          & v4_yellow18(A)
          & v1_yellow21(A) ) ) ) )).

fof(cc3_membered,axiom,(
    ! [A] :
      ( v3_membered(A)
     => v2_membered(A) ) )).

fof(cc4_functor0,axiom,(
    ! [A,B] :
      ( ( l1_struct_0(A)
        & ~ v3_struct_0(B)
        & l1_struct_0(B) )
     => ! [C] :
          ( l1_functor0(C,A,B)
         => ( v11_functor0(C,A,B)
           => v6_functor0(C,A,B) ) ) ) )).

fof(cc4_functor2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v2_altcat_1(A)
        & v12_altcat_1(A)
        & l2_altcat_1(A)
        & ~ v3_struct_0(B)
        & v12_altcat_1(B)
        & l2_altcat_1(B) )
     => ! [C] :
          ( m2_functor0(C,A,B)
         => ( v16_functor0(C,A,B)
           => ( v6_functor0(C,A,B)
              & v8_functor0(C,A,B)
              & v11_functor0(C,A,B)
              & v12_functor0(C,A,B)
              & v14_functor0(C,A,B) ) ) ) ) )).

fof(cc4_membered,axiom,(
    ! [A] :
      ( v2_membered(A)
     => v1_membered(A) ) )).

fof(cc5_functor2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v2_altcat_1(A)
        & v12_altcat_1(A)
        & l2_altcat_1(A)
        & ~ v3_struct_0(B)
        & v12_altcat_1(B)
        & l2_altcat_1(B) )
     => ! [C] :
          ( m2_functor0(C,A,B)
         => ( ( v11_functor0(C,A,B)
              & v14_functor0(C,A,B) )
           => ( v6_functor0(C,A,B)
              & v8_functor0(C,A,B)
              & v12_functor0(C,A,B)
              & v16_functor0(C,A,B) ) ) ) ) )).

fof(cc6_functor0,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v2_altcat_1(A)
        & v12_altcat_1(A)
        & l2_altcat_1(A)
        & ~ v3_struct_0(B)
        & v12_altcat_1(B)
        & l2_altcat_1(B) )
     => ! [C] :
          ( m2_functor0(C,A,B)
         => ( v16_functor0(C,A,B)
           => v6_functor0(C,A,B) ) ) ) )).

fof(d41_functor0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v2_altcat_1(A)
        & v12_altcat_1(A)
        & l2_altcat_1(A) )
     => ! [B] :
          ( ( ~ v3_struct_0(B)
            & v2_altcat_1(B)
            & v12_altcat_1(B)
            & l2_altcat_1(B) )
         => ( r2_functor0(A,B)
          <=> ? [C] :
                ( m2_functor0(C,A,B)
                & v21_functor0(C,A,B)
                & v16_functor0(C,A,B) ) ) ) ) )).

fof(dt_g2_altcat_1,axiom,(
    ! [A,B,C] :
      ( ( m1_pboole(B,k2_zfmisc_1(A,A))
        & m3_pboole(C,k3_zfmisc_1(A,A,A),k3_altcat_1(A,B,B),k2_altcat_1(A,B)) )
     => ( v6_altcat_1(g2_altcat_1(A,B,C))
        & l2_altcat_1(g2_altcat_1(A,B,C)) ) ) )).

fof(dt_g2_functor0,axiom,(
    ! [A,B,C,D] :
      ( ( l1_altcat_1(A)
        & l1_altcat_1(B)
        & v1_funct_1(C)
        & v1_funct_2(C,k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),k2_zfmisc_1(u1_struct_0(B),u1_struct_0(B)))
        & m1_relset_1(C,k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),k2_zfmisc_1(u1_struct_0(B),u1_struct_0(B)))
        & m1_functor0(D,k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),k2_zfmisc_1(u1_struct_0(B),u1_struct_0(B)),C,u1_altcat_1(A),u1_altcat_1(B)) )
     => ( v9_functor0(g2_functor0(A,B,C,D),A,B)
        & l2_functor0(g2_functor0(A,B,C,D),A,B) ) ) )).

fof(dt_k1_xboole_0,axiom,(
    $true )).

fof(dt_k1_zfmisc_1,axiom,(
    $true )).

fof(dt_k2_altcat_1,axiom,(
    ! [A,B] :
      ( m1_pboole(B,k2_zfmisc_1(A,A))
     => m1_pboole(k2_altcat_1(A,B),k3_zfmisc_1(A,A,A)) ) )).

fof(dt_k2_zfmisc_1,axiom,(
    $true )).

fof(dt_k3_altcat_1,axiom,(
    ! [A,B,C] :
      ( ( m1_pboole(B,k2_zfmisc_1(A,A))
        & m1_pboole(C,k2_zfmisc_1(A,A)) )
     => m1_pboole(k3_altcat_1(A,B,C),k3_zfmisc_1(A,A,A)) ) )).

fof(dt_k3_zfmisc_1,axiom,(
    $true )).

fof(dt_k4_waybel34,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ( ~ v3_struct_0(k4_waybel34(A))
        & v2_altcat_1(k4_waybel34(A))
        & v6_altcat_1(k4_waybel34(A))
        & v11_altcat_1(k4_waybel34(A))
        & v12_altcat_1(k4_waybel34(A))
        & v2_yellow21(k4_waybel34(A))
        & l2_altcat_1(k4_waybel34(A)) ) ) )).

fof(dt_k5_waybel34,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ( ~ v3_struct_0(k5_waybel34(A))
        & v2_altcat_1(k5_waybel34(A))
        & v6_altcat_1(k5_waybel34(A))
        & v11_altcat_1(k5_waybel34(A))
        & v12_altcat_1(k5_waybel34(A))
        & v2_yellow21(k5_waybel34(A))
        & l2_altcat_1(k5_waybel34(A)) ) ) )).

fof(dt_k6_waybel34,axiom,(
    ! [A] :
      ( ~ v2_setfam_1(A)
     => ( v9_functor0(k6_waybel34(A),k4_waybel34(A),k5_waybel34(A))
        & v16_functor0(k6_waybel34(A),k4_waybel34(A),k5_waybel34(A))
        & m2_functor0(k6_waybel34(A),k4_waybel34(A),k5_waybel34(A)) ) ) )).

fof(dt_l1_altcat_1,axiom,(
    ! [A] :
      ( l1_altcat_1(A)
     => l1_struct_0(A) ) )).

fof(dt_l1_functor0,axiom,(
    $true )).

fof(dt_l1_struct_0,axiom,(
    $true )).

fof(dt_l2_altcat_1,axiom,(
    ! [A] :
      ( l2_altcat_1(A)
     => l1_altcat_1(A) ) )).

fof(dt_l2_functor0,axiom,(
    ! [A,B] :
      ( ( l1_altcat_1(A)
        & l1_altcat_1(B) )
     => ! [C] :
          ( l2_functor0(C,A,B)
         => l1_functor0(C,A,B) ) ) )).

fof(dt_m1_functor0,axiom,(
    ! [A,B,C,D,E] :
      ( ( v1_funct_1(C)
        & v1_funct_2(C,A,B)
        & m1_relset_1(C,A,B)
        & m1_pboole(D,A)
        & m1_pboole(E,B) )
     => ! [F] :
          ( m1_functor0(F,A,B,C,D,E)
         => m1_pboole(F,A) ) ) )).

fof(dt_m1_pboole,axiom,(
    ! [A,B] :
      ( m1_pboole(B,A)
     => ( v1_relat_1(B)
        & v1_funct_1(B) ) ) )).

fof(dt_m1_relset_1,axiom,(
    $true )).

fof(dt_m1_subset_1,axiom,(
    $true )).

fof(dt_m2_functor0,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v2_altcat_1(A)
        & v12_altcat_1(A)
        & l2_altcat_1(A)
        & ~ v3_struct_0(B)
        & v12_altcat_1(B)
        & l2_altcat_1(B) )
     => ! [C] :
          ( m2_functor0(C,A,B)
         => l2_functor0(C,A,B) ) ) )).

fof(dt_m2_relset_1,axiom,(
    ! [A,B,C] :
      ( m2_relset_1(C,A,B)
     => m1_subset_1(C,k1_zfmisc_1(k2_zfmisc_1(A,B))) ) )).

fof(dt_m3_pboole,axiom,(
    ! [A,B,C] :
      ( ( m1_pboole(B,A)
        & m1_pboole(C,A) )
     => ! [D] :
          ( m3_pboole(D,A,B,C)
         => m1_pboole(D,A) ) ) )).

fof(dt_u1_altcat_1,axiom,(
    ! [A] :
      ( l1_altcat_1(A)
     => m1_pboole(u1_altcat_1(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A))) ) )).

fof(dt_u1_functor0,axiom,(
    ! [A,B,C] :
      ( ( l1_struct_0(A)
        & l1_struct_0(B)
        & l1_functor0(C,A,B) )
     => ( v1_funct_1(u1_functor0(A,B,C))
        & v1_funct_2(u1_functor0(A,B,C),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),k2_zfmisc_1(u1_struct_0(B),u1_struct_0(B)))
        & m2_relset_1(u1_functor0(A,B,C),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),k2_zfmisc_1(u1_struct_0(B),u1_struct_0(B))) ) ) )).

fof(dt_u1_struct_0,axiom,(
    $true )).

fof(dt_u2_altcat_1,axiom,(
    ! [A] :
      ( l2_altcat_1(A)
     => m3_pboole(u2_altcat_1(A),k3_zfmisc_1(u1_struct_0(A),u1_struct_0(A),u1_struct_0(A)),k3_altcat_1(u1_struct_0(A),u1_altcat_1(A),u1_altcat_1(A)),k2_altcat_1(u1_struct_0(A),u1_altcat_1(A))) ) )).

fof(dt_u2_functor0,axiom,(
    ! [A,B,C] :
      ( ( l1_altcat_1(A)
        & l1_altcat_1(B)
        & l2_functor0(C,A,B) )
     => m1_functor0(u2_functor0(A,B,C),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),k2_zfmisc_1(u1_struct_0(B),u1_struct_0(B)),u1_functor0(A,B,C),u1_altcat_1(A),u1_altcat_1(B)) ) )).

fof(existence_l1_altcat_1,axiom,(
    ? [A] : l1_altcat_1(A) )).

fof(existence_l1_functor0,axiom,(
    ! [A,B] :
      ( ( l1_struct_0(A)
        & l1_struct_0(B) )
     => ? [C] : l1_functor0(C,A,B) ) )).

fof(existence_l1_struct_0,axiom,(
    ? [A] : l1_struct_0(A) )).

fof(existence_l2_altcat_1,axiom,(
    ? [A] : l2_altcat_1(A) )).

fof(existence_l2_functor0,axiom,(
    ! [A,B] :
      ( ( l1_altcat_1(A)
        & l1_altcat_1(B) )
     => ? [C] : l2_functor0(C,A,B) ) )).

fof(existence_m1_functor0,axiom,(
    ! [A,B,C,D,E] :
      ( ( v1_funct_1(C)
        & v1_funct_2(C,A,B)
        & m1_relset_1(C,A,B)
        & m1_pboole(D,A)
        & m1_pboole(E,B) )
     => ? [F] : m1_functor0(F,A,B,C,D,E) ) )).

fof(existence_m1_pboole,axiom,(
    ! [A] :
    ? [B] : m1_pboole(B,A) )).

fof(existence_m1_relset_1,axiom,(
    ! [A,B] :
    ? [C] : m1_relset_1(C,A,B) )).

fof(existence_m1_subset_1,axiom,(
    ! [A] :
    ? [B] : m1_subset_1(B,A) )).

fof(existence_m2_functor0,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v2_altcat_1(A)
        & v12_altcat_1(A)
        & l2_altcat_1(A)
        & ~ v3_struct_0(B)
        & v12_altcat_1(B)
        & l2_altcat_1(B) )
     => ? [C] : m2_functor0(C,A,B) ) )).

fof(existence_m2_relset_1,axiom,(
    ! [A,B] :
    ? [C] : m2_relset_1(C,A,B) )).

fof(existence_m3_pboole,axiom,(
    ! [A,B,C] :
      ( ( m1_pboole(B,A)
        & m1_pboole(C,A) )
     => ? [D] : m3_pboole(D,A,B,C) ) )).

fof(fc14_finset_1,axiom,(
    ! [A,B] :
      ( ( v1_finset_1(A)
        & v1_finset_1(B) )
     => v1_finset_1(k2_zfmisc_1(A,B)) ) )).

fof(fc15_finset_1,axiom,(
    ! [A,B,C] :
      ( ( v1_finset_1(A)
        & v1_finset_1(B)
        & v1_finset_1(C) )
     => v1_finset_1(k3_zfmisc_1(A,B,C)) ) )).

fof(fc1_struct_0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_struct_0(A) )
     => ~ v1_xboole_0(u1_struct_0(A)) ) )).

fof(fc5_waybel34,axiom,(
    ! [A] :
      ( ~ v2_setfam_1(A)
     => ( ~ v3_struct_0(k4_waybel34(A))
        & v2_altcat_1(k4_waybel34(A))
        & v6_altcat_1(k4_waybel34(A))
        & v9_altcat_1(k4_waybel34(A))
        & v11_altcat_1(k4_waybel34(A))
        & v12_altcat_1(k4_waybel34(A))
        & v1_altcat_2(k4_waybel34(A))
        & v2_yellow18(k4_waybel34(A))
        & v3_yellow18(k4_waybel34(A))
        & v4_yellow18(k4_waybel34(A))
        & v1_yellow21(k4_waybel34(A))
        & v2_yellow21(k4_waybel34(A))
        & v3_yellow21(k4_waybel34(A)) ) ) )).

fof(fc6_membered,axiom,
    ( v1_xboole_0(k1_xboole_0)
    & v1_membered(k1_xboole_0)
    & v2_membered(k1_xboole_0)
    & v3_membered(k1_xboole_0)
    & v4_membered(k1_xboole_0)
    & v5_membered(k1_xboole_0) )).

fof(fc6_waybel34,axiom,(
    ! [A] :
      ( ~ v2_setfam_1(A)
     => ( ~ v3_struct_0(k5_waybel34(A))
        & v2_altcat_1(k5_waybel34(A))
        & v6_altcat_1(k5_waybel34(A))
        & v9_altcat_1(k5_waybel34(A))
        & v11_altcat_1(k5_waybel34(A))
        & v12_altcat_1(k5_waybel34(A))
        & v1_altcat_2(k5_waybel34(A))
        & v2_yellow18(k5_waybel34(A))
        & v3_yellow18(k5_waybel34(A))
        & v4_yellow18(k5_waybel34(A))
        & v1_yellow21(k5_waybel34(A))
        & v2_yellow21(k5_waybel34(A))
        & v3_yellow21(k5_waybel34(A)) ) ) )).

fof(fc7_functor0,axiom,(
    ! [A,B,C] :
      ( ( l1_altcat_1(A)
        & l1_altcat_1(B)
        & l2_functor0(C,A,B) )
     => ( v1_relat_1(u2_functor0(A,B,C))
        & v1_funct_1(u2_functor0(A,B,C))
        & v1_funcop_1(u2_functor0(A,B,C)) ) ) )).

fof(fc7_waybel34,axiom,(
    ! [A] :
      ( ~ v2_setfam_1(A)
     => ( v6_functor0(k6_waybel34(A),k4_waybel34(A),k5_waybel34(A))
        & v8_functor0(k6_waybel34(A),k4_waybel34(A),k5_waybel34(A))
        & v9_functor0(k6_waybel34(A),k4_waybel34(A),k5_waybel34(A))
        & v11_functor0(k6_waybel34(A),k4_waybel34(A),k5_waybel34(A))
        & v12_functor0(k6_waybel34(A),k4_waybel34(A),k5_waybel34(A))
        & v14_functor0(k6_waybel34(A),k4_waybel34(A),k5_waybel34(A))
        & v16_functor0(k6_waybel34(A),k4_waybel34(A),k5_waybel34(A))
        & v21_functor0(k6_waybel34(A),k4_waybel34(A),k5_waybel34(A)) ) ) )).

fof(free_g2_altcat_1,axiom,(
    ! [A,B,C] :
      ( ( m1_pboole(B,k2_zfmisc_1(A,A))
        & m3_pboole(C,k3_zfmisc_1(A,A,A),k3_altcat_1(A,B,B),k2_altcat_1(A,B)) )
     => ! [D,E,F] :
          ( g2_altcat_1(A,B,C) = g2_altcat_1(D,E,F)
         => ( A = D
            & B = E
            & C = F ) ) ) )).

fof(free_g2_functor0,axiom,(
    ! [A,B,C,D] :
      ( ( l1_altcat_1(A)
        & l1_altcat_1(B)
        & v1_funct_1(C)
        & v1_funct_2(C,k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),k2_zfmisc_1(u1_struct_0(B),u1_struct_0(B)))
        & m1_relset_1(C,k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),k2_zfmisc_1(u1_struct_0(B),u1_struct_0(B)))
        & m1_functor0(D,k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),k2_zfmisc_1(u1_struct_0(B),u1_struct_0(B)),C,u1_altcat_1(A),u1_altcat_1(B)) )
     => ! [E,F,G,H] :
          ( g2_functor0(A,B,C,D) = g2_functor0(E,F,G,H)
         => ( A = E
            & B = F
            & C = G
            & D = H ) ) ) )).

fof(rc1_finset_1,axiom,(
    ? [A] :
      ( ~ v1_xboole_0(A)
      & v1_finset_1(A) ) )).

fof(rc1_funct_1,axiom,(
    ? [A] :
      ( v1_relat_1(A)
      & v1_funct_1(A) ) )).

fof(rc1_membered,axiom,(
    ? [A] :
      ( ~ v1_xboole_0(A)
      & v1_membered(A)
      & v2_membered(A)
      & v3_membered(A)
      & v4_membered(A)
      & v5_membered(A) ) )).

fof(rc1_yellow21,axiom,(
    ? [A] :
      ( l2_altcat_1(A)
      & ~ v3_struct_0(A)
      & v2_altcat_1(A)
      & v6_altcat_1(A)
      & v9_altcat_1(A)
      & v11_altcat_1(A)
      & v12_altcat_1(A)
      & v1_altcat_2(A)
      & v2_yellow18(A)
      & v3_yellow18(A)
      & v4_yellow18(A)
      & v1_yellow21(A)
      & v2_yellow21(A)
      & v3_yellow21(A) ) )).

fof(rc2_funct_1,axiom,(
    ? [A] :
      ( v1_relat_1(A)
      & v1_xboole_0(A)
      & v1_funct_1(A) ) )).

fof(rc2_setfam_1,axiom,(
    ? [A] : ~ v2_setfam_1(A) )).

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

fof(rc3_functor0,axiom,(
    ! [A,B] :
      ( ( l1_altcat_1(A)
        & l1_altcat_1(B) )
     => ? [C] :
          ( l2_functor0(C,A,B)
          & v9_functor0(C,A,B) ) ) )).

fof(rc3_setfam_1,axiom,(
    ! [A] :
      ( ~ v2_setfam_1(A)
     => ? [B] :
          ( m1_subset_1(B,A)
          & ~ v1_xboole_0(B) ) ) )).

fof(rc3_struct_0,axiom,(
    ? [A] :
      ( l1_struct_0(A)
      & ~ v3_struct_0(A) ) )).

fof(rc4_finset_1,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
          & ~ v1_xboole_0(B)
          & v1_finset_1(B) ) ) )).

fof(rc5_functor0,axiom,(
    ! [A,B] :
      ( ( l1_altcat_1(A)
        & l1_altcat_1(B) )
     => ? [C] :
          ( l2_functor0(C,A,B)
          & v11_functor0(C,A,B) ) ) )).

fof(rc5_struct_0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_struct_0(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
          & ~ v1_xboole_0(B) ) ) )).

fof(rc7_functor0,axiom,(
    ? [A] :
      ( l2_altcat_1(A)
      & ~ v3_struct_0(A)
      & v1_altcat_2(A) ) )).

fof(rc8_functor0,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & l1_altcat_1(A)
        & ~ v3_struct_0(B)
        & v1_altcat_2(B)
        & l1_altcat_1(B) )
     => ? [C] :
          ( l2_functor0(C,A,B)
          & v6_functor0(C,A,B)
          & v8_functor0(C,A,B) ) ) )).

fof(rc9_functor0,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v12_altcat_1(A)
        & l2_altcat_1(A)
        & ~ v3_struct_0(B)
        & v12_altcat_1(B)
        & l2_altcat_1(B) )
     => ? [C] :
          ( l2_functor0(C,A,B)
          & v6_functor0(C,A,B)
          & v8_functor0(C,A,B)
          & v9_functor0(C,A,B)
          & v12_functor0(C,A,B) ) ) )).

fof(redefinition_m2_relset_1,axiom,(
    ! [A,B,C] :
      ( m2_relset_1(C,A,B)
    <=> m1_relset_1(C,A,B) ) )).

fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : r1_tarski(A,A) )).

fof(symmetry_r2_functor0,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v2_altcat_1(A)
        & v12_altcat_1(A)
        & l2_altcat_1(A)
        & ~ v3_struct_0(B)
        & v2_altcat_1(B)
        & v12_altcat_1(B)
        & l2_altcat_1(B) )
     => ( r2_functor0(A,B)
       => r2_functor0(B,A) ) ) )).

fof(t1_subset,axiom,(
    ! [A,B] :
      ( r2_hidden(A,B)
     => m1_subset_1(A,B) ) )).

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
