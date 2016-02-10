%------------------------------------------------------------------------------
% File     : SEU161+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem t46_zfmisc_1
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-t46_zfmisc_1 [Urb07]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.10 v6.0.0, 0.09 v5.5.0, 0.04 v5.4.0, 0.07 v5.2.0, 0.05 v5.0.0, 0.04 v4.0.0, 0.08 v3.7.0, 0.10 v3.5.0, 0.11 v3.3.0
% Syntax   : Number of formulae    :    7 (   4 unit)
%            Number of atoms       :   10 (   4 equality)
%            Maximal formula depth :    5 (   3 average)
%            Number of connectives :    4 (   1 ~  ;   0  |;   0  &)
%                                         (   0 <=>;   3 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    3 (   1 propositional; 0-2 arity)
%            Number of functors    :    2 (   0 constant; 1-2 arity)
%            Number of variables   :   10 (   1 singleton;  10 !;   0 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(commutativity_k2_xboole_0,axiom,(
    ! [A,B] : set_union2(A,B) = set_union2(B,A) )).

fof(idempotence_k2_xboole_0,axiom,(
    ! [A,B] : set_union2(A,A) = A )).

fof(antisymmetry_r2_hidden,axiom,(
    ! [A,B] :
      ( in(A,B)
     => ~ in(B,A) ) )).

fof(dt_k1_tarski,axiom,(
    $true )).

fof(dt_k2_xboole_0,axiom,(
    $true )).

fof(t46_zfmisc_1,conjecture,(
    ! [A,B] :
      ( in(A,B)
     => set_union2(singleton(A),B) = B ) )).

fof(l23_zfmisc_1,axiom,(
    ! [A,B] :
      ( in(A,B)
     => set_union2(singleton(A),B) = B ) )).

%------------------------------------------------------------------------------
