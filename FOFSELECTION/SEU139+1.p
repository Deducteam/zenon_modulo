%------------------------------------------------------------------------------
% File     : SEU139+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem t60_xboole_1
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-t60_xboole_1 [Urb07]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v4.1.0, 0.04 v3.7.0, 0.14 v3.5.0, 0.00 v3.4.0, 0.08 v3.3.0
% Syntax   : Number of formulae    :    6 (   2 unit)
%            Number of atoms       :   12 (   2 equality)
%            Maximal formula depth :    6 (   5 average)
%            Number of connectives :   10 (   4 ~  ;   0  |;   3  &)
%                                         (   2 <=>;   1 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    3 (   0 propositional; 2-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   12 (   2 singleton;  12 !;   0 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(antisymmetry_r2_xboole_0,axiom,(
    ! [A,B] :
      ( proper_subset(A,B)
     => ~ proper_subset(B,A) ) )).

fof(d10_xboole_0,axiom,(
    ! [A,B] :
      ( A = B
    <=> ( subset(A,B)
        & subset(B,A) ) ) )).

fof(d8_xboole_0,axiom,(
    ! [A,B] :
      ( proper_subset(A,B)
    <=> ( subset(A,B)
        & A != B ) ) )).

fof(irreflexivity_r2_xboole_0,axiom,(
    ! [A,B] : ~ proper_subset(A,A) )).

fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : subset(A,A) )).

fof(t60_xboole_1,conjecture,(
    ! [A,B] : ~ ( subset(A,B)
      & proper_subset(B,A) ) )).

%------------------------------------------------------------------------------
