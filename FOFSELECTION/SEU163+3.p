%------------------------------------------------------------------------------
% File     : SEU163+3 : TPTP v6.1.0. Released v3.2.0.
% Domain   : Set theory
% Problem  : Basic properties of sets, theorem 92
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [Byl90] Bylinski (1990), Some Basic Properties of Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : zfmisc_1__t92_zfmisc_1 [Urb06]

% Status   : Theorem
% Rating   : 0.00 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.00 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.00 v3.2.0
% Syntax   : Number of formulae    :    6 (   3 unit)
%            Number of atoms       :    9 (   0 equality)
%            Maximal formula depth :    5 (   4 average)
%            Number of connectives :    5 (   2 ~  ;   0  |;   0  &)
%                                         (   0 <=>;   3 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    3 (   0 propositional; 1-2 arity)
%            Number of functors    :    1 (   0 constant; 1-1 arity)
%            Number of variables   :   10 (   1 singleton;   8 !;   2 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : subset(A,A) )).

fof(antisymmetry_r2_hidden,axiom,(
    ! [A,B] :
      ( in(A,B)
     => ~ in(B,A) ) )).

fof(rc1_xboole_0,axiom,(
    ? [A] : empty(A) )).

fof(rc2_xboole_0,axiom,(
    ? [A] : ~ empty(A) )).

fof(t92_zfmisc_1,conjecture,(
    ! [A,B] :
      ( in(A,B)
     => subset(A,union(B)) ) )).

fof(l50_zfmisc_1,axiom,(
    ! [A,B] :
      ( in(A,B)
     => subset(A,union(B)) ) )).
%------------------------------------------------------------------------------
