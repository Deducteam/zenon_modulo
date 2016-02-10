%------------------------------------------------------------------------------
% File     : SEU424+1 : TPTP v6.1.0. Released v3.4.0.
% Domain   : Set Theory
% Problem  : First and Second Order Cutting of Binary Relations T18
% Version  : [Urb08] axioms : Especial.
% English  :

% Refs     : [Ret05] Retel (2005), Properties of First and Second Order Cut
%          : [Urb07] Urban (2007), MPTP 0.2: Design, Implementation, and In
%          : [Urb08] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb08]
% Names    : t18_relset_2 [Urb08]

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.13 v5.5.0, 0.11 v5.4.0, 0.18 v5.3.0, 0.22 v5.2.0, 0.10 v5.1.0, 0.14 v5.0.0, 0.17 v4.1.0, 0.22 v4.0.1, 0.26 v4.0.0, 0.29 v3.7.0, 0.20 v3.5.0, 0.21 v3.4.0
% Syntax   : Number of formulae    :   43 (  14 unit)
%            Number of atoms       :   91 (   6 equality)
%            Maximal formula depth :   11 (   4 average)
%            Number of connectives :   64 (  16 ~  ;   1  |;  22  &)
%                                         (   4 <=>;  21 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   10 (   1 propositional; 0-3 arity)
%            Number of functors    :    8 (   1 constant; 0-4 arity)
%            Number of variables   :   85 (   1 singleton;  76 !;   9 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Normal version: includes the axioms (which may be theorems from
%            other articles) and background that are possibly necessary.
%          : Translated by MPTP from the Mizar Mathematical Library 4.48.930.
%          : The problem encoding is based on set theory.
%------------------------------------------------------------------------------
fof(t18_relset_2,conjecture,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ! [B,C] :
          ( m1_subset_1(C,k1_zfmisc_1(A))
         => ! [D] :
              ( m2_relset_1(D,A,B)
             => m1_subset_1(a_4_0_relset_2(A,B,C,D),k1_zfmisc_1(k1_zfmisc_1(B))) ) ) ) )).

fof(antisymmetry_r2_hidden,axiom,(
    ! [A,B] :
      ( r2_hidden(A,B)
     => ~ r2_hidden(B,A) ) )).

fof(cc1_relat_1,axiom,(
    ! [A] :
      ( v1_xboole_0(A)
     => v1_relat_1(A) ) )).

fof(cc1_relset_1,axiom,(
    ! [A,B,C] :
      ( m1_subset_1(C,k1_zfmisc_1(k2_zfmisc_1(A,B)))
     => v1_relat_1(C) ) )).

fof(d1_relset_2,axiom,(
    ! [A,B,C] :
      ( m2_relset_1(C,A,B)
     => ! [D] :
          ( m1_subset_1(D,A)
         => k2_relset_2(A,B,C,D) = k10_relset_1(A,B,C,k1_tarski(D)) ) ) )).

fof(dt_k10_relset_1,axiom,(
    ! [A,B,C,D] :
      ( m1_relset_1(C,A,B)
     => m1_subset_1(k10_relset_1(A,B,C,D),k1_zfmisc_1(B)) ) )).

fof(dt_k1_tarski,axiom,(
    $true )).

fof(dt_k1_xboole_0,axiom,(
    $true )).

fof(dt_k1_zfmisc_1,axiom,(
    $true )).

fof(dt_k2_relset_2,axiom,(
    ! [A,B,C,D] :
      ( ( m1_relset_1(C,A,B)
        & m1_subset_1(D,A) )
     => m1_subset_1(k2_relset_2(A,B,C,D),k1_zfmisc_1(B)) ) )).

fof(dt_k2_zfmisc_1,axiom,(
    $true )).

fof(dt_k9_relat_1,axiom,(
    $true )).

fof(dt_m1_relset_1,axiom,(
    $true )).

fof(dt_m1_subset_1,axiom,(
    $true )).

fof(dt_m2_relset_1,axiom,(
    ! [A,B,C] :
      ( m2_relset_1(C,A,B)
     => m1_subset_1(C,k1_zfmisc_1(k2_zfmisc_1(A,B))) ) )).

fof(existence_m1_relset_1,axiom,(
    ! [A,B] :
    ? [C] : m1_relset_1(C,A,B) )).

fof(existence_m1_subset_1,axiom,(
    ! [A] :
    ? [B] : m1_subset_1(B,A) )).

fof(existence_m2_relset_1,axiom,(
    ! [A,B] :
    ? [C] : m2_relset_1(C,A,B) )).

fof(fc12_relat_1,axiom,
    ( v1_xboole_0(k1_xboole_0)
    & v1_relat_1(k1_xboole_0)
    & v3_relat_1(k1_xboole_0) )).

fof(fc1_subset_1,axiom,(
    ! [A] : ~ v1_xboole_0(k1_zfmisc_1(A)) )).

fof(fc1_sysrel,axiom,(
    ! [A,B] : v1_relat_1(k2_zfmisc_1(A,B)) )).

fof(fc2_subset_1,axiom,(
    ! [A] : ~ v1_xboole_0(k1_tarski(A)) )).

fof(fc4_relat_1,axiom,
    ( v1_xboole_0(k1_xboole_0)
    & v1_relat_1(k1_xboole_0) )).

fof(fc4_subset_1,axiom,(
    ! [A,B] :
      ( ( ~ v1_xboole_0(A)
        & ~ v1_xboole_0(B) )
     => ~ v1_xboole_0(k2_zfmisc_1(A,B)) ) )).

fof(fraenkel_a_4_0_relset_2,axiom,(
    ! [A,B,C,D,E] :
      ( ( ~ v1_xboole_0(B)
        & m1_subset_1(D,k1_zfmisc_1(B))
        & m2_relset_1(E,B,C) )
     => ( r2_hidden(A,a_4_0_relset_2(B,C,D,E))
      <=> ? [F] :
            ( m1_subset_1(F,B)
            & A = k2_relset_2(B,C,E,F)
            & r2_hidden(F,D) ) ) ) )).

fof(rc1_relat_1,axiom,(
    ? [A] :
      ( v1_xboole_0(A)
      & v1_relat_1(A) ) )).

fof(rc1_subset_1,axiom,(
    ! [A] :
      ( ~ v1_xboole_0(A)
     => ? [B] :
          ( m1_subset_1(B,k1_zfmisc_1(A))
          & ~ v1_xboole_0(B) ) ) )).

fof(rc2_relat_1,axiom,(
    ? [A] :
      ( ~ v1_xboole_0(A)
      & v1_relat_1(A) ) )).

fof(rc2_subset_1,axiom,(
    ! [A] :
    ? [B] :
      ( m1_subset_1(B,k1_zfmisc_1(A))
      & v1_xboole_0(B) ) )).

fof(rc3_relat_1,axiom,(
    ? [A] :
      ( v1_relat_1(A)
      & v3_relat_1(A) ) )).

fof(redefinition_k10_relset_1,axiom,(
    ! [A,B,C,D] :
      ( m1_relset_1(C,A,B)
     => k10_relset_1(A,B,C,D) = k9_relat_1(C,D) ) )).

fof(redefinition_m2_relset_1,axiom,(
    ! [A,B,C] :
      ( m2_relset_1(C,A,B)
    <=> m1_relset_1(C,A,B) ) )).

fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : r1_tarski(A,A) )).

fof(s8_domain_1__e1_22__relset_2,axiom,(
    ! [A,B,C,D] :
      ( ( ~ v1_xboole_0(A)
        & m1_subset_1(C,k1_zfmisc_1(A))
        & m2_relset_1(D,A,B) )
     => m1_subset_1(a_4_0_relset_2(A,B,C,D),k1_zfmisc_1(k1_zfmisc_1(B))) ) )).

fof(t1_subset,axiom,(
    ! [A,B] :
      ( r2_hidden(A,B)
     => m1_subset_1(A,B) ) )).

fof(t2_subset,axiom,(
    ! [A,B] :
      ( m1_subset_1(A,B)
     => ( v1_xboole_0(B)
        | r2_hidden(A,B) ) ) )).

fof(t2_tarski,axiom,(
    ! [A,B] :
      ( ! [C] :
          ( r2_hidden(C,A)
        <=> r2_hidden(C,B) )
     => A = B ) )).

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
