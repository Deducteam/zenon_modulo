%------------------------------------------------------------------------------
% File     : SEU121+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem t1_xboole_1
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-t1_xboole_1 [Urb07]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.03 v6.0.0, 0.04 v5.5.0, 0.00 v5.4.0, 0.04 v5.3.0, 0.07 v5.2.0, 0.00 v4.0.0, 0.04 v3.7.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   11 (   5 unit)
%            Number of atoms       :   20 (   2 equality)
%            Maximal formula depth :    7 (   4 average)
%            Number of connectives :   14 (   5 ~  ;   0  |;   4  &)
%                                         (   1 <=>;   4 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    5 (   1 propositional; 0-2 arity)
%            Number of functors    :    1 (   1 constant; 0-0 arity)
%            Number of variables   :   17 (   1 singleton;  15 !;   2 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(antisymmetry_r2_hidden,axiom,(
    ! [A,B] :
      ( in(A,B)
     => ~ in(B,A) ) )).

fof(d3_tarski,axiom,(
    ! [A,B] :
      ( subset(A,B)
    <=> ! [C] :
          ( in(C,A)
         => in(C,B) ) ) )).

fof(dt_k1_xboole_0,axiom,(
    $true )).

fof(fc1_xboole_0,axiom,(
    empty(empty_set) )).

fof(rc1_xboole_0,axiom,(
    ? [A] : empty(A) )).

fof(rc2_xboole_0,axiom,(
    ? [A] : ~ empty(A) )).

fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : subset(A,A) )).

fof(t1_xboole_1,conjecture,(
    ! [A,B,C] :
      ( ( subset(A,B)
        & subset(B,C) )
     => subset(A,C) ) )).

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
