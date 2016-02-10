%------------------------------------------------------------------------------
% File     : LAT346+1 : TPTP v6.1.0. Released v3.4.0.
% Domain   : Lattice Theory
% Problem  : Dual Concept Lattices T22
% Version  : [Urb08] axioms : Especial.
% English  :

% Refs     : [Sch01] Schwarzweller (2001), A Characterization of Concept La
%          : [Urb07] Urban (2007), MPTP 0.2: Design, Implementation, and In
%          : [Urb08] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb08]
% Names    : t22_conlat_2 [Urb08]

% Status   : Theorem
% Rating   : 0.32 v6.1.0, 0.37 v6.0.0, 0.30 v5.5.0, 0.48 v5.4.0, 0.46 v5.3.0, 0.56 v5.2.0, 0.45 v5.1.0, 0.48 v5.0.0, 0.50 v4.1.0, 0.57 v4.0.1, 0.52 v4.0.0, 0.58 v3.7.0, 0.55 v3.5.0, 0.58 v3.4.0
% Syntax   : Number of formulae    :  102 (  24 unit)
%            Number of atoms       :  412 (  16 equality)
%            Maximal formula depth :   15 (   5 average)
%            Number of connectives :  387 (  77 ~  ;   1  |; 227  &)
%                                         (   3 <=>;  79 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   38 (   1 propositional; 0-3 arity)
%            Number of functors    :   17 (   1 constant; 0-3 arity)
%            Number of variables   :  159 (   1 singleton; 132 !;  27 ?)
%            Maximal term depth    :    4 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Normal version: includes the axioms (which may be theorems from
%            other articles) and background that are possibly necessary.
%          : Translated by MPTP from the Mizar Mathematical Library 4.48.930.
%          : The problem encoding is based on set theory.
%------------------------------------------------------------------------------
fof(t22_conlat_2,conjecture,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l2_conlat_1(A) )
     => r1_filter_1(k11_conlat_1(k7_conlat_2(A)),k1_lattice2(k11_conlat_1(A))) ) )).

fof(abstractness_v3_lattices,axiom,(
    ! [A] :
      ( l3_lattices(A)
     => ( v3_lattices(A)
       => A = g3_lattices(u1_struct_0(A),u2_lattices(A),u1_lattices(A)) ) ) )).

fof(abstractness_v4_conlat_1,axiom,(
    ! [A] :
      ( l2_conlat_1(A)
     => ( v4_conlat_1(A)
       => A = g2_conlat_1(u1_conlat_1(A),u2_conlat_1(A),u3_conlat_1(A)) ) ) )).

fof(antisymmetry_r2_hidden,axiom,(
    ! [A,B] :
      ( r2_hidden(A,B)
     => ~ r2_hidden(B,A) ) )).

fof(cc1_funct_2,axiom,(
    ! [A,B,C] :
      ( m1_relset_1(C,A,B)
     => ( ( v1_funct_1(C)
          & v1_partfun1(C,A,B) )
       => ( v1_funct_1(C)
          & v1_funct_2(C,A,B) ) ) ) )).

fof(cc1_lattices,axiom,(
    ! [A] :
      ( l3_lattices(A)
     => ( ( ~ v3_struct_0(A)
          & v10_lattices(A) )
       => ( ~ v3_struct_0(A)
          & v4_lattices(A)
          & v5_lattices(A)
          & v6_lattices(A)
          & v7_lattices(A)
          & v8_lattices(A)
          & v9_lattices(A) ) ) ) )).

fof(cc1_relset_1,axiom,(
    ! [A,B,C] :
      ( m1_subset_1(C,k1_zfmisc_1(k2_zfmisc_1(A,B)))
     => v1_relat_1(C) ) )).

fof(cc2_lattices,axiom,(
    ! [A] :
      ( l3_lattices(A)
     => ( ( ~ v3_struct_0(A)
          & v4_lattices(A)
          & v5_lattices(A)
          & v6_lattices(A)
          & v7_lattices(A)
          & v8_lattices(A)
          & v9_lattices(A) )
       => ( ~ v3_struct_0(A)
          & v10_lattices(A) ) ) ) )).

fof(cc3_lattices,axiom,(
    ! [A] :
      ( l3_lattices(A)
     => ( ( ~ v3_struct_0(A)
          & v13_lattices(A)
          & v14_lattices(A) )
       => ( ~ v3_struct_0(A)
          & v15_lattices(A) ) ) ) )).

fof(cc4_lattices,axiom,(
    ! [A] :
      ( l3_lattices(A)
     => ( ( ~ v3_struct_0(A)
          & v15_lattices(A) )
       => ( ~ v3_struct_0(A)
          & v13_lattices(A)
          & v14_lattices(A) ) ) ) )).

fof(cc5_funct_2,axiom,(
    ! [A,B] :
      ( ~ v1_xboole_0(B)
     => ! [C] :
          ( m1_relset_1(C,A,B)
         => ( ( v1_funct_1(C)
              & v1_funct_2(C,A,B) )
           => ( v1_funct_1(C)
              & v1_partfun1(C,A,B)
              & v1_funct_2(C,A,B) ) ) ) ) )).

fof(cc6_funct_2,axiom,(
    ! [A,B] :
      ( ( ~ v1_xboole_0(A)
        & ~ v1_xboole_0(B) )
     => ! [C] :
          ( m1_relset_1(C,A,B)
         => ( ( v1_funct_1(C)
              & v1_funct_2(C,A,B) )
           => ( v1_funct_1(C)
              & ~ v1_xboole_0(C)
              & v1_partfun1(C,A,B)
              & v1_funct_2(C,A,B) ) ) ) ) )).

fof(d5_lattice4,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A) )
     => ! [B] :
          ( ( ~ v3_struct_0(B)
            & v10_lattices(B)
            & l3_lattices(B) )
         => ( r1_filter_1(A,B)
          <=> ? [C] :
                ( m1_lattice4(C,A,B)
                & v3_lattice4(C,A,B) ) ) ) ) )).

fof(d7_conlat_2,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l2_conlat_1(A) )
     => k7_conlat_2(A) = g2_conlat_1(u2_conlat_1(A),u1_conlat_1(A),k6_relset_1(u1_conlat_1(A),u2_conlat_1(A),u3_conlat_1(A))) ) )).

fof(dt_g2_conlat_1,axiom,(
    ! [A,B,C] :
      ( m1_relset_1(C,A,B)
     => ( v4_conlat_1(g2_conlat_1(A,B,C))
        & l2_conlat_1(g2_conlat_1(A,B,C)) ) ) )).

fof(dt_g3_lattices,axiom,(
    ! [A,B,C] :
      ( ( v1_funct_1(B)
        & v1_funct_2(B,k2_zfmisc_1(A,A),A)
        & m1_relset_1(B,k2_zfmisc_1(A,A),A)
        & v1_funct_1(C)
        & v1_funct_2(C,k2_zfmisc_1(A,A),A)
        & m1_relset_1(C,k2_zfmisc_1(A,A),A) )
     => ( v3_lattices(g3_lattices(A,B,C))
        & l3_lattices(g3_lattices(A,B,C)) ) ) )).

fof(dt_k10_conlat_2,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l2_conlat_1(A) )
     => m1_lattice4(k10_conlat_2(A),k1_lattice2(k11_conlat_1(A)),k11_conlat_1(k7_conlat_2(A))) ) )).

fof(dt_k11_conlat_1,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l2_conlat_1(A) )
     => ( ~ v3_struct_0(k11_conlat_1(A))
        & v3_lattices(k11_conlat_1(A))
        & l3_lattices(k11_conlat_1(A)) ) ) )).

fof(dt_k1_lattice2,axiom,(
    ! [A] :
      ( l3_lattices(A)
     => ( v3_lattices(k1_lattice2(A))
        & l3_lattices(k1_lattice2(A)) ) ) )).

fof(dt_k1_xboole_0,axiom,(
    $true )).

fof(dt_k1_zfmisc_1,axiom,(
    $true )).

fof(dt_k2_zfmisc_1,axiom,(
    $true )).

fof(dt_k4_relat_1,axiom,(
    ! [A] :
      ( v1_relat_1(A)
     => v1_relat_1(k4_relat_1(A)) ) )).

fof(dt_k6_relset_1,axiom,(
    ! [A,B,C] :
      ( m1_relset_1(C,A,B)
     => m2_relset_1(k6_relset_1(A,B,C),B,A) ) )).

fof(dt_k7_conlat_2,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l2_conlat_1(A) )
     => ( ~ v3_conlat_1(k7_conlat_2(A))
        & v4_conlat_1(k7_conlat_2(A))
        & l2_conlat_1(k7_conlat_2(A)) ) ) )).

fof(dt_l1_conlat_1,axiom,(
    $true )).

fof(dt_l1_lattices,axiom,(
    ! [A] :
      ( l1_lattices(A)
     => l1_struct_0(A) ) )).

fof(dt_l1_struct_0,axiom,(
    $true )).

fof(dt_l2_conlat_1,axiom,(
    ! [A] :
      ( l2_conlat_1(A)
     => l1_conlat_1(A) ) )).

fof(dt_l2_lattices,axiom,(
    ! [A] :
      ( l2_lattices(A)
     => l1_struct_0(A) ) )).

fof(dt_l3_lattices,axiom,(
    ! [A] :
      ( l3_lattices(A)
     => ( l1_lattices(A)
        & l2_lattices(A) ) ) )).

fof(dt_m1_lattice4,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v3_struct_0(B)
        & v10_lattices(B)
        & l3_lattices(B) )
     => ! [C] :
          ( m1_lattice4(C,A,B)
         => ( v1_funct_1(C)
            & v1_funct_2(C,u1_struct_0(A),u1_struct_0(B))
            & m2_relset_1(C,u1_struct_0(A),u1_struct_0(B)) ) ) ) )).

fof(dt_m1_relset_1,axiom,(
    $true )).

fof(dt_m1_subset_1,axiom,(
    $true )).

fof(dt_m2_relset_1,axiom,(
    ! [A,B,C] :
      ( m2_relset_1(C,A,B)
     => m1_subset_1(C,k1_zfmisc_1(k2_zfmisc_1(A,B))) ) )).

fof(dt_u1_conlat_1,axiom,(
    $true )).

fof(dt_u1_lattices,axiom,(
    ! [A] :
      ( l1_lattices(A)
     => ( v1_funct_1(u1_lattices(A))
        & v1_funct_2(u1_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A))
        & m2_relset_1(u1_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A)) ) ) )).

fof(dt_u1_struct_0,axiom,(
    $true )).

fof(dt_u2_conlat_1,axiom,(
    $true )).

fof(dt_u2_lattices,axiom,(
    ! [A] :
      ( l2_lattices(A)
     => ( v1_funct_1(u2_lattices(A))
        & v1_funct_2(u2_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A))
        & m2_relset_1(u2_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A)) ) ) )).

fof(dt_u3_conlat_1,axiom,(
    ! [A] :
      ( l2_conlat_1(A)
     => m2_relset_1(u3_conlat_1(A),u1_conlat_1(A),u2_conlat_1(A)) ) )).

fof(existence_l1_conlat_1,axiom,(
    ? [A] : l1_conlat_1(A) )).

fof(existence_l1_lattices,axiom,(
    ? [A] : l1_lattices(A) )).

fof(existence_l1_struct_0,axiom,(
    ? [A] : l1_struct_0(A) )).

fof(existence_l2_conlat_1,axiom,(
    ? [A] : l2_conlat_1(A) )).

fof(existence_l2_lattices,axiom,(
    ? [A] : l2_lattices(A) )).

fof(existence_l3_lattices,axiom,(
    ? [A] : l3_lattices(A) )).

fof(existence_m1_lattice4,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v3_struct_0(B)
        & v10_lattices(B)
        & l3_lattices(B) )
     => ? [C] : m1_lattice4(C,A,B) ) )).

fof(existence_m1_relset_1,axiom,(
    ! [A,B] :
    ? [C] : m1_relset_1(C,A,B) )).

fof(existence_m1_subset_1,axiom,(
    ! [A] :
    ? [B] : m1_subset_1(B,A) )).

fof(existence_m2_relset_1,axiom,(
    ! [A,B] :
    ? [C] : m2_relset_1(C,A,B) )).

fof(fc1_conlat_1,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l1_conlat_1(A) )
     => ~ v1_xboole_0(u2_conlat_1(A)) ) )).

fof(fc1_conlat_2,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l2_conlat_1(A) )
     => ( ~ v3_struct_0(k11_conlat_1(A))
        & v3_lattices(k11_conlat_1(A))
        & v4_lattices(k11_conlat_1(A))
        & v5_lattices(k11_conlat_1(A))
        & v6_lattices(k11_conlat_1(A))
        & v7_lattices(k11_conlat_1(A))
        & v8_lattices(k11_conlat_1(A))
        & v9_lattices(k11_conlat_1(A))
        & v10_lattices(k11_conlat_1(A))
        & v13_lattices(k11_conlat_1(A))
        & v14_lattices(k11_conlat_1(A))
        & v15_lattices(k11_conlat_1(A))
        & v4_lattice3(k11_conlat_1(A)) ) ) )).

fof(fc1_lattice2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l3_lattices(A) )
     => ( ~ v3_struct_0(k1_lattice2(A))
        & v3_lattices(k1_lattice2(A)) ) ) )).

fof(fc1_struct_0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_struct_0(A) )
     => ~ v1_xboole_0(u1_struct_0(A)) ) )).

fof(fc1_subset_1,axiom,(
    ! [A] : ~ v1_xboole_0(k1_zfmisc_1(A)) )).

fof(fc1_xboole_0,axiom,(
    v1_xboole_0(k1_xboole_0) )).

fof(fc2_conlat_1,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l1_conlat_1(A) )
     => ~ v1_xboole_0(u1_conlat_1(A)) ) )).

fof(fc2_conlat_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & v4_lattice3(A)
        & l3_lattices(A) )
     => ( ~ v3_struct_0(k1_lattice2(A))
        & v3_lattices(k1_lattice2(A))
        & v4_lattices(k1_lattice2(A))
        & v5_lattices(k1_lattice2(A))
        & v6_lattices(k1_lattice2(A))
        & v7_lattices(k1_lattice2(A))
        & v8_lattices(k1_lattice2(A))
        & v9_lattices(k1_lattice2(A))
        & v10_lattices(k1_lattice2(A))
        & v4_lattice3(k1_lattice2(A)) ) ) )).

fof(fc2_lattice2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v4_lattices(A)
        & l2_lattices(A) )
     => ( v1_relat_1(u2_lattices(A))
        & v1_funct_1(u2_lattices(A))
        & v1_funct_2(u2_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A))
        & v1_binop_1(u2_lattices(A),u1_struct_0(A))
        & v1_partfun1(u2_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A)) ) ) )).

fof(fc3_lattice2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v5_lattices(A)
        & l2_lattices(A) )
     => ( v1_relat_1(u2_lattices(A))
        & v1_funct_1(u2_lattices(A))
        & v1_funct_2(u2_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A))
        & v2_binop_1(u2_lattices(A),u1_struct_0(A))
        & v1_partfun1(u2_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A)) ) ) )).

fof(fc3_lattices,axiom,(
    ! [A,B,C] :
      ( ( ~ v1_xboole_0(A)
        & v1_funct_1(B)
        & v1_funct_2(B,k2_zfmisc_1(A,A),A)
        & m1_relset_1(B,k2_zfmisc_1(A,A),A)
        & v1_funct_1(C)
        & v1_funct_2(C,k2_zfmisc_1(A,A),A)
        & m1_relset_1(C,k2_zfmisc_1(A,A),A) )
     => ( ~ v3_struct_0(g3_lattices(A,B,C))
        & v3_lattices(g3_lattices(A,B,C)) ) ) )).

fof(fc4_conlat_1,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l2_conlat_1(A) )
     => ( ~ v3_struct_0(k11_conlat_1(A))
        & v3_lattices(k11_conlat_1(A))
        & v4_lattices(k11_conlat_1(A))
        & v5_lattices(k11_conlat_1(A))
        & v6_lattices(k11_conlat_1(A))
        & v7_lattices(k11_conlat_1(A))
        & v8_lattices(k11_conlat_1(A))
        & v9_lattices(k11_conlat_1(A))
        & v10_lattices(k11_conlat_1(A)) ) ) )).

fof(fc4_lattice2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v6_lattices(A)
        & l1_lattices(A) )
     => ( v1_relat_1(u1_lattices(A))
        & v1_funct_1(u1_lattices(A))
        & v1_funct_2(u1_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A))
        & v1_binop_1(u1_lattices(A),u1_struct_0(A))
        & v1_partfun1(u1_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A)) ) ) )).

fof(fc4_subset_1,axiom,(
    ! [A,B] :
      ( ( ~ v1_xboole_0(A)
        & ~ v1_xboole_0(B) )
     => ~ v1_xboole_0(k2_zfmisc_1(A,B)) ) )).

fof(fc5_conlat_1,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l2_conlat_1(A) )
     => ( ~ v3_struct_0(k11_conlat_1(A))
        & v3_lattices(k11_conlat_1(A))
        & v4_lattices(k11_conlat_1(A))
        & v5_lattices(k11_conlat_1(A))
        & v6_lattices(k11_conlat_1(A))
        & v7_lattices(k11_conlat_1(A))
        & v8_lattices(k11_conlat_1(A))
        & v9_lattices(k11_conlat_1(A))
        & v10_lattices(k11_conlat_1(A))
        & v4_lattice3(k11_conlat_1(A)) ) ) )).

fof(fc5_lattice2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v7_lattices(A)
        & l1_lattices(A) )
     => ( v1_relat_1(u1_lattices(A))
        & v1_funct_1(u1_lattices(A))
        & v1_funct_2(u1_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A))
        & v2_binop_1(u1_lattices(A),u1_struct_0(A))
        & v1_partfun1(u1_lattices(A),k2_zfmisc_1(u1_struct_0(A),u1_struct_0(A)),u1_struct_0(A)) ) ) )).

fof(fc6_lattice2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A) )
     => ( ~ v3_struct_0(k1_lattice2(A))
        & v3_lattices(k1_lattice2(A))
        & v4_lattices(k1_lattice2(A))
        & v5_lattices(k1_lattice2(A))
        & v6_lattices(k1_lattice2(A))
        & v7_lattices(k1_lattice2(A))
        & v8_lattices(k1_lattice2(A))
        & v9_lattices(k1_lattice2(A))
        & v10_lattices(k1_lattice2(A)) ) ) )).

fof(free_g2_conlat_1,axiom,(
    ! [A,B,C] :
      ( m1_relset_1(C,A,B)
     => ! [D,E,F] :
          ( g2_conlat_1(A,B,C) = g2_conlat_1(D,E,F)
         => ( A = D
            & B = E
            & C = F ) ) ) )).

fof(free_g3_lattices,axiom,(
    ! [A,B,C] :
      ( ( v1_funct_1(B)
        & v1_funct_2(B,k2_zfmisc_1(A,A),A)
        & m1_relset_1(B,k2_zfmisc_1(A,A),A)
        & v1_funct_1(C)
        & v1_funct_2(C,k2_zfmisc_1(A,A),A)
        & m1_relset_1(C,k2_zfmisc_1(A,A),A) )
     => ! [D,E,F] :
          ( g3_lattices(A,B,C) = g3_lattices(D,E,F)
         => ( A = D
            & B = E
            & C = F ) ) ) )).

fof(involutiveness_k4_relat_1,axiom,(
    ! [A] :
      ( v1_relat_1(A)
     => k4_relat_1(k4_relat_1(A)) = A ) )).

fof(involutiveness_k6_relset_1,axiom,(
    ! [A,B,C] :
      ( m1_relset_1(C,A,B)
     => k6_relset_1(A,B,k6_relset_1(A,B,C)) = C ) )).

fof(rc11_lattices,axiom,(
    ? [A] :
      ( l3_lattices(A)
      & ~ v3_struct_0(A)
      & v3_lattices(A)
      & v4_lattices(A)
      & v5_lattices(A)
      & v6_lattices(A)
      & v7_lattices(A)
      & v8_lattices(A)
      & v9_lattices(A)
      & v10_lattices(A)
      & v13_lattices(A)
      & v14_lattices(A)
      & v15_lattices(A) ) )).

fof(rc1_funct_2,axiom,(
    ! [A,B] :
    ? [C] :
      ( m1_relset_1(C,A,B)
      & v1_relat_1(C)
      & v1_funct_1(C)
      & v1_funct_2(C,A,B) ) )).

fof(rc1_subset_1,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
          & ~ v1_xboole_0(B) ) ) )).

fof(rc1_xboole_0,axiom,(
    ? [A] : v1_xboole_0(A) )).

fof(rc2_partfun1,axiom,(
    ! [A,B] :
    ? [C] :
      ( m1_relset_1(C,A,B)
      & v1_relat_1(C)
      & v1_funct_1(C) ) )).

fof(rc2_subset_1,axiom,(
    ! [A] :
    ? [B] :
      ( m1_subset_1(B,k1_zfmisc_1(A))
      & v1_xboole_0(B) ) )).

fof(rc2_xboole_0,axiom,(
    ? [A] : ~ v1_xboole_0(A) )).

fof(rc3_lattices,axiom,(
    ? [A] :
      ( l3_lattices(A)
      & v3_lattices(A) ) )).

fof(rc3_struct_0,axiom,(
    ? [A] :
      ( l1_struct_0(A)
      & ~ v3_struct_0(A) ) )).

fof(rc5_conlat_1,axiom,(
    ? [A] :
      ( l2_conlat_1(A)
      & v4_conlat_1(A) ) )).

fof(rc5_struct_0,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l1_struct_0(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
          & ~ v1_xboole_0(B) ) ) )).

fof(rc6_lattices,axiom,(
    ? [A] :
      ( l3_lattices(A)
      & ~ v3_struct_0(A)
      & v3_lattices(A) ) )).

fof(rc7_conlat_1,axiom,(
    ? [A] :
      ( l2_conlat_1(A)
      & ~ v3_conlat_1(A)
      & v4_conlat_1(A) ) )).

fof(rc8_conlat_1,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l1_conlat_1(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u1_conlat_1(A)))
          & ~ v1_xboole_0(B) ) ) )).

fof(rc9_conlat_1,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l1_conlat_1(A) )
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(u2_conlat_1(A)))
          & ~ v1_xboole_0(B) ) ) )).

fof(rc9_lattices,axiom,(
    ? [A] :
      ( l3_lattices(A)
      & ~ v3_struct_0(A)
      & v3_lattices(A)
      & v4_lattices(A)
      & v5_lattices(A)
      & v6_lattices(A)
      & v7_lattices(A)
      & v8_lattices(A)
      & v9_lattices(A)
      & v10_lattices(A) ) )).

fof(redefinition_k6_relset_1,axiom,(
    ! [A,B,C] :
      ( m1_relset_1(C,A,B)
     => k6_relset_1(A,B,C) = k4_relat_1(C) ) )).

fof(redefinition_m2_relset_1,axiom,(
    ! [A,B,C] :
      ( m2_relset_1(C,A,B)
    <=> m1_relset_1(C,A,B) ) )).

fof(reflexivity_r1_filter_1,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v3_struct_0(B)
        & v10_lattices(B)
        & l3_lattices(B) )
     => r1_filter_1(A,A) ) )).

fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : r1_tarski(A,A) )).

fof(symmetry_r1_filter_1,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v3_struct_0(B)
        & v10_lattices(B)
        & l3_lattices(B) )
     => ( r1_filter_1(A,B)
       => r1_filter_1(B,A) ) ) )).

fof(t1_subset,axiom,(
    ! [A,B] :
      ( r2_hidden(A,B)
     => m1_subset_1(A,B) ) )).

fof(t21_conlat_2,axiom,(
    ! [A] :
      ( ( ~ v3_conlat_1(A)
        & l2_conlat_1(A) )
     => v3_lattice4(k10_conlat_2(A),k1_lattice2(k11_conlat_1(A)),k11_conlat_1(k7_conlat_2(A))) ) )).

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
