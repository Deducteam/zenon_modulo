%------------------------------------------------------------------------------
% File     : SEU160+3 : TPTP v6.1.0. Released v3.2.0.
% Domain   : Set theory
% Problem  : Basic properties of sets, theorem 39
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [Byl90] Bylinski (1990), Some Basic Properties of Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : zfmisc_1__t39_zfmisc_1 [Urb06]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.10 v6.0.0, 0.04 v5.4.0, 0.07 v5.3.0, 0.11 v5.2.0, 0.00 v4.1.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.00 v3.4.0, 0.05 v3.3.0, 0.07 v3.2.0
% Syntax   : Number of formulae    :    6 (   4 unit)
%            Number of atoms       :   10 (   4 equality)
%            Maximal formula depth :    5 (   3 average)
%            Number of connectives :    5 (   1 ~  ;   2  |;   0  &)
%                                         (   2 <=>;   0 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    3 (   0 propositional; 1-2 arity)
%            Number of functors    :    2 (   1 constant; 0-1 arity)
%            Number of variables   :    8 (   1 singleton;   6 !;   2 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : subset(A,A) )).

fof(fc1_xboole_0,axiom,(
    empty(empty_set) )).

fof(rc1_xboole_0,axiom,(
    ? [A] : empty(A) )).

fof(rc2_xboole_0,axiom,(
    ? [A] : ~ empty(A) )).

fof(t39_zfmisc_1,conjecture,(
    ! [A,B] :
      ( subset(A,singleton(B))
    <=> ( A = empty_set
        | A = singleton(B) ) ) )).

fof(l4_zfmisc_1,axiom,(
    ! [A,B] :
      ( subset(A,singleton(B))
    <=> ( A = empty_set
        | A = singleton(B) ) ) )).
%------------------------------------------------------------------------------
