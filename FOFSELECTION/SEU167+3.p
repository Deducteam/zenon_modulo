%------------------------------------------------------------------------------
% File     : SEU167+3 : TPTP v6.1.0. Released v3.2.0.
% Domain   : Set theory
% Problem  : Basic properties of sets, theorem 119
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [Byl90] Bylinski (1990), Some Basic Properties of Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : zfmisc_1__t119_zfmisc_1 [Urb06]

% Status   : Theorem
% Rating   : 0.00 v6.0.0, 0.25 v5.5.0, 0.12 v5.4.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.00 v3.2.0
% Syntax   : Number of formulae    :    6 (   3 unit)
%            Number of atoms       :   12 (   0 equality)
%            Maximal formula depth :    7 (   4 average)
%            Number of connectives :    7 (   1 ~  ;   0  |;   3  &)
%                                         (   0 <=>;   3 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    2 (   0 propositional; 1-2 arity)
%            Number of functors    :    1 (   0 constant; 2-2 arity)
%            Number of variables   :   14 (   1 singleton;  12 !;   2 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(rc1_xboole_0,axiom,(
    ? [A] : empty(A) )).

fof(rc2_xboole_0,axiom,(
    ? [A] : ~ empty(A) )).

fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : subset(A,A) )).

fof(t118_zfmisc_1,axiom,(
    ! [A,B,C] :
      ( subset(A,B)
     => ( subset(cartesian_product2(A,C),cartesian_product2(B,C))
        & subset(cartesian_product2(C,A),cartesian_product2(C,B)) ) ) )).

fof(t119_zfmisc_1,conjecture,(
    ! [A,B,C,D] :
      ( ( subset(A,B)
        & subset(C,D) )
     => subset(cartesian_product2(A,C),cartesian_product2(B,D)) ) )).

fof(t1_xboole_1,axiom,(
    ! [A,B,C] :
      ( ( subset(A,B)
        & subset(B,C) )
     => subset(A,C) ) )).
%------------------------------------------------------------------------------
