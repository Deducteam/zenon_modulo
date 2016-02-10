%------------------------------------------------------------------------------
% File     : LAT295+3 : TPTP v6.1.0. Released v3.4.0.
% Domain   : Lattice Theory
% Problem  : Ideals T08
% Version  : [Urb08] axioms : Especial.
% English  :

% Refs     : [Ban96] Bancerek (1996), Ideals
%          : [Urb07] Urban (2007), MPTP 0.2: Design, Implementation, and In
%          : [Urb08] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb08]
% Names    : t8_filter_2 [Urb08]

% Status   : Theorem
% Rating   : 0.72 v6.1.0, 0.73 v6.0.0, 0.91 v5.5.0, 0.89 v5.4.0, 0.93 v5.2.0, 0.90 v5.0.0, 0.96 v3.7.0, 0.95 v3.4.0
% Syntax   : Number of formulae    : 13583 (2725 unit)
%            Number of atoms       : 84218 (9450 equality)
%            Maximal formula depth :   36 (   7 average)
%            Number of connectives : 81248 (10613 ~  ; 462  |;40353  &)
%                                         (2319 <=>;27501 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :  773 (   2 propositional; 0-6 arity)
%            Number of functors    : 1970 ( 510 constant; 0-10 arity)
%            Number of variables   : 33740 (   8 singleton;32139 !;1601 ?)
%            Maximal term depth    :    7 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Chainy small version: includes all preceding MML articles that
%            are included in any Bushy version.
%          : Translated by MPTP from the Mizar Mathematical Library 4.48.930.
%          : The problem encoding is based on set theory.
%------------------------------------------------------------------------------
include('Axioms/SET007/SET007+0.ax').
include('Axioms/SET007/SET007+1.ax').
include('Axioms/SET007/SET007+2.ax').
include('Axioms/SET007/SET007+3.ax').
include('Axioms/SET007/SET007+4.ax').
include('Axioms/SET007/SET007+5.ax').
include('Axioms/SET007/SET007+6.ax').
include('Axioms/SET007/SET007+7.ax').
include('Axioms/SET007/SET007+8.ax').
include('Axioms/SET007/SET007+9.ax').
include('Axioms/SET007/SET007+10.ax').
include('Axioms/SET007/SET007+11.ax').
include('Axioms/SET007/SET007+13.ax').
include('Axioms/SET007/SET007+14.ax').
include('Axioms/SET007/SET007+15.ax').
include('Axioms/SET007/SET007+16.ax').
include('Axioms/SET007/SET007+17.ax').
include('Axioms/SET007/SET007+18.ax').
include('Axioms/SET007/SET007+19.ax').
include('Axioms/SET007/SET007+20.ax').
include('Axioms/SET007/SET007+21.ax').
include('Axioms/SET007/SET007+22.ax').
include('Axioms/SET007/SET007+23.ax').
include('Axioms/SET007/SET007+24.ax').
include('Axioms/SET007/SET007+25.ax').
include('Axioms/SET007/SET007+26.ax').
include('Axioms/SET007/SET007+31.ax').
include('Axioms/SET007/SET007+32.ax').
include('Axioms/SET007/SET007+33.ax').
include('Axioms/SET007/SET007+34.ax').
include('Axioms/SET007/SET007+35.ax').
include('Axioms/SET007/SET007+40.ax').
include('Axioms/SET007/SET007+48.ax').
include('Axioms/SET007/SET007+50.ax').
include('Axioms/SET007/SET007+51.ax').
include('Axioms/SET007/SET007+54.ax').
include('Axioms/SET007/SET007+55.ax').
include('Axioms/SET007/SET007+59.ax').
include('Axioms/SET007/SET007+60.ax').
include('Axioms/SET007/SET007+61.ax').
include('Axioms/SET007/SET007+64.ax').
include('Axioms/SET007/SET007+66.ax').
include('Axioms/SET007/SET007+67.ax').
include('Axioms/SET007/SET007+68.ax').
include('Axioms/SET007/SET007+71.ax').
include('Axioms/SET007/SET007+75.ax').
include('Axioms/SET007/SET007+76.ax').
include('Axioms/SET007/SET007+77.ax').
include('Axioms/SET007/SET007+79.ax').
include('Axioms/SET007/SET007+80.ax').
include('Axioms/SET007/SET007+86.ax').
include('Axioms/SET007/SET007+91.ax').
include('Axioms/SET007/SET007+117.ax').
include('Axioms/SET007/SET007+125.ax').
include('Axioms/SET007/SET007+126.ax').
include('Axioms/SET007/SET007+148.ax').
include('Axioms/SET007/SET007+159.ax').
include('Axioms/SET007/SET007+165.ax').
include('Axioms/SET007/SET007+170.ax').
include('Axioms/SET007/SET007+182.ax').
include('Axioms/SET007/SET007+186.ax').
include('Axioms/SET007/SET007+188.ax').
include('Axioms/SET007/SET007+190.ax').
include('Axioms/SET007/SET007+200.ax').
include('Axioms/SET007/SET007+202.ax').
include('Axioms/SET007/SET007+205.ax').
include('Axioms/SET007/SET007+206.ax').
include('Axioms/SET007/SET007+207.ax').
include('Axioms/SET007/SET007+209.ax').
include('Axioms/SET007/SET007+210.ax').
include('Axioms/SET007/SET007+211.ax').
include('Axioms/SET007/SET007+212.ax').
include('Axioms/SET007/SET007+213.ax').
include('Axioms/SET007/SET007+217.ax').
include('Axioms/SET007/SET007+218.ax').
include('Axioms/SET007/SET007+223.ax').
include('Axioms/SET007/SET007+224.ax').
include('Axioms/SET007/SET007+225.ax').
include('Axioms/SET007/SET007+227.ax').
include('Axioms/SET007/SET007+237.ax').
include('Axioms/SET007/SET007+241.ax').
include('Axioms/SET007/SET007+242.ax').
include('Axioms/SET007/SET007+246.ax').
include('Axioms/SET007/SET007+247.ax').
include('Axioms/SET007/SET007+248.ax').
include('Axioms/SET007/SET007+252.ax').
include('Axioms/SET007/SET007+253.ax').
include('Axioms/SET007/SET007+255.ax').
include('Axioms/SET007/SET007+256.ax').
include('Axioms/SET007/SET007+276.ax').
include('Axioms/SET007/SET007+278.ax').
include('Axioms/SET007/SET007+279.ax').
include('Axioms/SET007/SET007+280.ax').
include('Axioms/SET007/SET007+281.ax').
include('Axioms/SET007/SET007+293.ax').
include('Axioms/SET007/SET007+295.ax').
include('Axioms/SET007/SET007+297.ax').
include('Axioms/SET007/SET007+298.ax').
include('Axioms/SET007/SET007+299.ax').
include('Axioms/SET007/SET007+301.ax').
include('Axioms/SET007/SET007+308.ax').
include('Axioms/SET007/SET007+309.ax').
include('Axioms/SET007/SET007+311.ax').
include('Axioms/SET007/SET007+312.ax').
include('Axioms/SET007/SET007+317.ax').
include('Axioms/SET007/SET007+321.ax').
include('Axioms/SET007/SET007+322.ax').
include('Axioms/SET007/SET007+327.ax').
include('Axioms/SET007/SET007+335.ax').
include('Axioms/SET007/SET007+338.ax').
include('Axioms/SET007/SET007+339.ax').
include('Axioms/SET007/SET007+354.ax').
include('Axioms/SET007/SET007+363.ax').
include('Axioms/SET007/SET007+365.ax').
include('Axioms/SET007/SET007+370.ax').
include('Axioms/SET007/SET007+375.ax').
include('Axioms/SET007/SET007+377.ax').
include('Axioms/SET007/SET007+384.ax').
include('Axioms/SET007/SET007+387.ax').
include('Axioms/SET007/SET007+388.ax').
include('Axioms/SET007/SET007+393.ax').
include('Axioms/SET007/SET007+394.ax').
include('Axioms/SET007/SET007+395.ax').
include('Axioms/SET007/SET007+396.ax').
include('Axioms/SET007/SET007+399.ax').
include('Axioms/SET007/SET007+401.ax').
include('Axioms/SET007/SET007+405.ax').
include('Axioms/SET007/SET007+406.ax').
include('Axioms/SET007/SET007+407.ax').
%------------------------------------------------------------------------------
fof(dt_m1_filter_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A) )
     => ! [B] :
          ( m1_filter_2(B,A)
         => ( ~ v1_xboole_0(B)
            & m2_lattice4(B,A) ) ) ) )).

fof(existence_m1_filter_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A) )
     => ? [B] : m1_filter_2(B,A) ) )).

fof(redefinition_m1_filter_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A) )
     => ! [B] :
          ( m1_filter_2(B,A)
        <=> m1_filter_0(B,A) ) ) )).

fof(dt_m2_filter_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A) )
     => ! [B] :
          ( m2_filter_2(B,A)
         => ( ~ v1_xboole_0(B)
            & m2_lattice4(B,A) ) ) ) )).

fof(existence_m2_filter_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A) )
     => ? [B] : m2_filter_2(B,A) ) )).

fof(symmetry_r1_filter_2,axiom,(
    ! [A,B,C] :
      ( ( ~ v1_xboole_0(A)
        & m1_subset_1(B,k1_zfmisc_1(A))
        & m1_subset_1(C,k1_zfmisc_1(A)) )
     => ( r1_filter_2(A,B,C)
       => r1_filter_2(A,C,B) ) ) )).

fof(reflexivity_r1_filter_2,axiom,(
    ! [A,B,C] :
      ( ( ~ v1_xboole_0(A)
        & m1_subset_1(B,k1_zfmisc_1(A))
        & m1_subset_1(C,k1_zfmisc_1(A)) )
     => r1_filter_2(A,B,B) ) )).

fof(redefinition_r1_filter_2,axiom,(
    ! [A,B,C] :
      ( ( ~ v1_xboole_0(A)
        & m1_subset_1(B,k1_zfmisc_1(A))
        & m1_subset_1(C,k1_zfmisc_1(A)) )
     => ( r1_filter_2(A,B,C)
      <=> B = C ) ) )).

fof(dt_k1_filter_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A) )
     => m1_filter_2(k1_filter_2(A),A) ) )).

fof(redefinition_k1_filter_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A) )
     => k1_filter_2(A) = k1_filter_0(A) ) )).

fof(dt_k2_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_subset_1(B,u1_struct_0(A)) )
     => m1_filter_2(k2_filter_2(A,B),A) ) )).

fof(redefinition_k2_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_subset_1(B,u1_struct_0(A)) )
     => k2_filter_2(A,B) = k2_filter_0(A,B) ) )).

fof(dt_k3_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v1_xboole_0(B)
        & m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A))) )
     => m1_filter_2(k3_filter_2(A,B),A) ) )).

fof(redefinition_k3_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v1_xboole_0(B)
        & m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A))) )
     => k3_filter_2(A,B) = k3_filter_0(A,B) ) )).

fof(dt_k4_filter_2,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & v11_lattices(A)
        & l3_lattices(A)
        & m1_filter_0(B,A)
        & m1_filter_0(C,A) )
     => m1_filter_2(k4_filter_2(A,B,C),A) ) )).

fof(redefinition_k4_filter_2,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & v11_lattices(A)
        & l3_lattices(A)
        & m1_filter_0(B,A)
        & m1_filter_0(C,A) )
     => k4_filter_2(A,B,C) = k5_filter_0(A,B,C) ) )).

fof(dt_k5_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_subset_1(B,u1_struct_0(A)) )
     => m1_subset_1(k5_filter_2(A,B),u1_struct_0(k1_lattice2(A))) ) )).

fof(dt_k6_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_subset_1(B,u1_struct_0(k1_lattice2(A))) )
     => m1_subset_1(k6_filter_2(A,B),u1_struct_0(A)) ) )).

fof(dt_k7_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A))) )
     => m1_subset_1(k7_filter_2(A,B),k1_zfmisc_1(u1_struct_0(k1_lattice2(A)))) ) )).

fof(dt_k8_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_subset_1(B,k1_zfmisc_1(u1_struct_0(k1_lattice2(A)))) )
     => m1_subset_1(k8_filter_2(A,B),k1_zfmisc_1(u1_struct_0(A))) ) )).

fof(dt_k9_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m2_lattice4(B,A) )
     => m2_lattice4(k9_filter_2(A,B),k1_lattice2(A)) ) )).

fof(redefinition_k9_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m2_lattice4(B,A) )
     => k9_filter_2(A,B) = k7_filter_2(A,B) ) )).

fof(dt_k10_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v1_xboole_0(B)
        & m2_lattice4(B,A) )
     => ( ~ v1_xboole_0(k10_filter_2(A,B))
        & m2_lattice4(k10_filter_2(A,B),k1_lattice2(A)) ) ) )).

fof(redefinition_k10_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v1_xboole_0(B)
        & m2_lattice4(B,A) )
     => k10_filter_2(A,B) = k7_filter_2(A,B) ) )).

fof(dt_k11_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m2_lattice4(B,k1_lattice2(A)) )
     => m2_lattice4(k11_filter_2(A,B),A) ) )).

fof(redefinition_k11_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m2_lattice4(B,k1_lattice2(A)) )
     => k11_filter_2(A,B) = k8_filter_2(A,B) ) )).

fof(dt_k12_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v1_xboole_0(B)
        & m2_lattice4(B,k1_lattice2(A)) )
     => ( ~ v1_xboole_0(k12_filter_2(A,B))
        & m2_lattice4(k12_filter_2(A,B),A) ) ) )).

fof(redefinition_k12_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v1_xboole_0(B)
        & m2_lattice4(B,k1_lattice2(A)) )
     => k12_filter_2(A,B) = k8_filter_2(A,B) ) )).

fof(dt_k13_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_filter_0(B,A) )
     => m2_filter_2(k13_filter_2(A,B),k1_lattice2(A)) ) )).

fof(redefinition_k13_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_filter_0(B,A) )
     => k13_filter_2(A,B) = k7_filter_2(A,B) ) )).

fof(dt_k14_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_filter_0(B,k1_lattice2(A)) )
     => m2_filter_2(k14_filter_2(A,B),A) ) )).

fof(redefinition_k14_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_filter_0(B,k1_lattice2(A)) )
     => k14_filter_2(A,B) = k8_filter_2(A,B) ) )).

fof(dt_k15_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m2_filter_2(B,A) )
     => m1_filter_2(k15_filter_2(A,B),k1_lattice2(A)) ) )).

fof(redefinition_k15_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m2_filter_2(B,A) )
     => k15_filter_2(A,B) = k7_filter_2(A,B) ) )).

fof(dt_k16_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m2_filter_2(B,k1_lattice2(A)) )
     => m1_filter_2(k16_filter_2(A,B),A) ) )).

fof(redefinition_k16_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m2_filter_2(B,k1_lattice2(A)) )
     => k16_filter_2(A,B) = k8_filter_2(A,B) ) )).

fof(dt_k17_filter_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A) )
     => m2_filter_2(k17_filter_2(A),A) ) )).

fof(dt_k18_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_subset_1(B,u1_struct_0(A)) )
     => m2_filter_2(k18_filter_2(A,B),A) ) )).

fof(dt_k19_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v1_xboole_0(B)
        & m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A))) )
     => m2_filter_2(k19_filter_2(A,B),A) ) )).

fof(dt_k20_filter_2,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v1_xboole_0(B)
        & m1_subset_1(B,k1_zfmisc_1(u1_struct_0(A)))
        & ~ v1_xboole_0(C)
        & m1_subset_1(C,k1_zfmisc_1(u1_struct_0(A))) )
     => m1_subset_1(k20_filter_2(A,B,C),k1_zfmisc_1(u1_struct_0(A))) ) )).

fof(dt_k21_filter_2,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & v11_lattices(A)
        & l3_lattices(A)
        & m2_filter_2(B,A)
        & m2_filter_2(C,A) )
     => m2_filter_2(k21_filter_2(A,B,C),A) ) )).

fof(redefinition_k21_filter_2,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & v11_lattices(A)
        & l3_lattices(A)
        & m2_filter_2(B,A)
        & m2_filter_2(C,A) )
     => k21_filter_2(A,B,C) = k20_filter_2(A,B,C) ) )).

fof(dt_k22_filter_2,axiom,(
    ! [A,B,C] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m1_subset_1(B,u1_struct_0(A))
        & m1_subset_1(C,u1_struct_0(A)) )
     => ( ~ v1_xboole_0(k22_filter_2(A,B,C))
        & m2_lattice4(k22_filter_2(A,B,C),A) ) ) )).

fof(dt_k23_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & ~ v1_xboole_0(B)
        & m2_lattice4(B,A) )
     => m2_nat_lat(k23_filter_2(A,B),A) ) )).

fof(dt_k24_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m2_nat_lat(B,A) )
     => ( v3_lattices(k24_filter_2(A,B))
        & m2_nat_lat(k24_filter_2(A,B),k1_lattice2(A)) ) ) )).

fof(redefinition_k24_filter_2,axiom,(
    ! [A,B] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A)
        & m2_nat_lat(B,A) )
     => k24_filter_2(A,B) = k1_lattice2(B) ) )).

fof(t1_filter_2,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ! [B] :
          ( ( ~ v1_xboole_0(B)
            & m1_subset_1(B,k1_zfmisc_1(A)) )
         => ! [C] :
              ( ( v1_funct_1(C)
                & v1_funct_2(C,k2_zfmisc_1(A,A),A)
                & m2_relset_1(C,k2_zfmisc_1(A,A),A) )
             => ! [D] :
                  ( ( v1_funct_1(D)
                    & v1_funct_2(D,k2_zfmisc_1(B,B),B)
                    & m2_relset_1(D,k2_zfmisc_1(B,B),B) )
                 => ( D = k1_realset1(C,B)
                   => ( ( v1_binop_1(C,A)
                       => v1_binop_1(D,B) )
                      & ( v3_binop_1(C,A)
                       => v3_binop_1(D,B) )
                      & ( v2_binop_1(C,A)
                       => v2_binop_1(D,B) ) ) ) ) ) ) ) )).

fof(t2_filter_2,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ! [B] :
          ( ( ~ v1_xboole_0(B)
            & m1_subset_1(B,k1_zfmisc_1(A)) )
         => ! [C] :
              ( ( v1_funct_1(C)
                & v1_funct_2(C,k2_zfmisc_1(A,A),A)
                & m2_relset_1(C,k2_zfmisc_1(A,A),A) )
             => ! [D] :
                  ( ( v1_funct_1(D)
                    & v1_funct_2(D,k2_zfmisc_1(B,B),B)
                    & m2_relset_1(D,k2_zfmisc_1(B,B),B) )
                 => ! [E] :
                      ( m1_subset_1(E,A)
                     => ! [F] :
                          ( m2_subset_1(F,A,B)
                         => ( ( D = k1_realset1(C,B)
                              & F = E )
                           => ( ( r1_binop_1(A,E,C)
                               => r1_binop_1(B,F,D) )
                              & ( r2_binop_1(A,E,C)
                               => r2_binop_1(B,F,D) )
                              & ( r3_binop_1(A,E,C)
                               => r3_binop_1(B,F,D) ) ) ) ) ) ) ) ) ) )).

fof(t3_filter_2,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ! [B] :
          ( ( ~ v1_xboole_0(B)
            & m1_subset_1(B,k1_zfmisc_1(A)) )
         => ! [C] :
              ( ( v1_funct_1(C)
                & v1_funct_2(C,k2_zfmisc_1(A,A),A)
                & m2_relset_1(C,k2_zfmisc_1(A,A),A) )
             => ! [D] :
                  ( ( v1_funct_1(D)
                    & v1_funct_2(D,k2_zfmisc_1(A,A),A)
                    & m2_relset_1(D,k2_zfmisc_1(A,A),A) )
                 => ! [E] :
                      ( ( v1_funct_1(E)
                        & v1_funct_2(E,k2_zfmisc_1(B,B),B)
                        & m2_relset_1(E,k2_zfmisc_1(B,B),B) )
                     => ! [F] :
                          ( ( v1_funct_1(F)
                            & v1_funct_2(F,k2_zfmisc_1(B,B),B)
                            & m2_relset_1(F,k2_zfmisc_1(B,B),B) )
                         => ( ( E = k1_realset1(C,B)
                              & F = k1_realset1(D,B) )
                           => ( ( r4_binop_1(A,C,D)
                               => r4_binop_1(B,E,F) )
                              & ( r5_binop_1(A,C,D)
                               => r5_binop_1(B,E,F) ) ) ) ) ) ) ) ) ) )).

fof(t4_filter_2,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ! [B] :
          ( ( ~ v1_xboole_0(B)
            & m1_subset_1(B,k1_zfmisc_1(A)) )
         => ! [C] :
              ( ( v1_funct_1(C)
                & v1_funct_2(C,k2_zfmisc_1(A,A),A)
                & m2_relset_1(C,k2_zfmisc_1(A,A),A) )
             => ! [D] :
                  ( ( v1_funct_1(D)
                    & v1_funct_2(D,k2_zfmisc_1(A,A),A)
                    & m2_relset_1(D,k2_zfmisc_1(A,A),A) )
                 => ! [E] :
                      ( ( v1_funct_1(E)
                        & v1_funct_2(E,k2_zfmisc_1(B,B),B)
                        & m2_relset_1(E,k2_zfmisc_1(B,B),B) )
                     => ! [F] :
                          ( ( v1_funct_1(F)
                            & v1_funct_2(F,k2_zfmisc_1(B,B),B)
                            & m2_relset_1(F,k2_zfmisc_1(B,B),B) )
                         => ( ( E = k1_realset1(C,B)
                              & F = k1_realset1(D,B)
                              & r6_binop_1(A,C,D) )
                           => r6_binop_1(B,E,F) ) ) ) ) ) ) ) )).

fof(t5_filter_2,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ! [B] :
          ( ( ~ v1_xboole_0(B)
            & m1_subset_1(B,k1_zfmisc_1(A)) )
         => ! [C] :
              ( ( v1_funct_1(C)
                & v1_funct_2(C,k2_zfmisc_1(A,A),A)
                & m2_relset_1(C,k2_zfmisc_1(A,A),A) )
             => ! [D] :
                  ( ( v1_funct_1(D)
                    & v1_funct_2(D,k2_zfmisc_1(A,A),A)
                    & m2_relset_1(D,k2_zfmisc_1(A,A),A) )
                 => ! [E] :
                      ( ( v1_funct_1(E)
                        & v1_funct_2(E,k2_zfmisc_1(B,B),B)
                        & m2_relset_1(E,k2_zfmisc_1(B,B),B) )
                     => ! [F] :
                          ( ( v1_funct_1(F)
                            & v1_funct_2(F,k2_zfmisc_1(B,B),B)
                            & m2_relset_1(F,k2_zfmisc_1(B,B),B) )
                         => ( ( E = k1_realset1(C,B)
                              & F = k1_realset1(D,B)
                              & r1_lattice2(A,C,D) )
                           => r1_lattice2(B,E,F) ) ) ) ) ) ) ) )).

fof(d1_filter_2,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ! [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
         => ! [C] :
              ( m1_subset_1(C,k1_zfmisc_1(A))
             => ( r1_filter_2(A,B,C)
              <=> ! [D] :
                    ( m1_subset_1(D,A)
                   => ( r2_hidden(D,B)
                    <=> r2_hidden(D,C) ) ) ) ) ) ) )).

fof(t6_filter_2,axiom,(
    ! [A] :
      ( l3_lattices(A)
     => ! [B] :
          ( l3_lattices(B)
         => ( g3_lattices(u1_struct_0(A),u2_lattices(A),u1_lattices(A)) = g3_lattices(u1_struct_0(B),u2_lattices(B),u1_lattices(B))
           => k1_lattice2(A) = k1_lattice2(B) ) ) ) )).

fof(t7_filter_2,axiom,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & v10_lattices(A)
        & l3_lattices(A) )
     => k1_lattice2(k1_lattice2(A)) = g3_lattices(u1_struct_0(A),u2_lattices(A),u1_lattices(A)) ) )).

fof(t8_filter_2,conjecture,(
    ! [A] :
      ( ( ~ v3_struct_0(A)
        & l3_lattices(A) )
     => ! [B] :
          ( ( ~ v3_struct_0(B)
            & l3_lattices(B) )
         => ( g3_lattices(u1_struct_0(A),u2_lattices(A),u1_lattices(A)) = g3_lattices(u1_struct_0(B),u2_lattices(B),u1_lattices(B))
           => ! [C] :
                ( m1_subset_1(C,u1_struct_0(A))
               => ! [D] :
                    ( m1_subset_1(D,u1_struct_0(A))
                   => ! [E] :
                        ( m1_subset_1(E,u1_struct_0(B))
                       => ! [F] :
                            ( m1_subset_1(F,u1_struct_0(B))
                           => ( ( C = E
                                & D = F )
                             => ( k1_lattices(A,C,D) = k1_lattices(B,E,F)
                                & k2_lattices(A,C,D) = k2_lattices(B,E,F)
                                & ( r1_lattices(A,C,D)
                                 => r1_lattices(B,E,F) )
                                & ( r1_lattices(B,E,F)
                                 => r1_lattices(A,C,D) ) ) ) ) ) ) ) ) ) ) )).
%------------------------------------------------------------------------------
