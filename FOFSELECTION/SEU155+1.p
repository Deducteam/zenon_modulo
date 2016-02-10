%------------------------------------------------------------------------------
% File     : SEU155+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Set theory
% Problem  : MPTP bushy problem l50_zfmisc_1
% Version  : [Urb07] axioms : Especial.
% English  :

% Refs     : [Ban01] Bancerek et al. (2001), On the Characterizations of Co
%          : [Urb07] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb07]
% Names    : bushy-l50_zfmisc_1 [Urb07]

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.13 v6.0.0, 0.17 v5.5.0, 0.07 v5.4.0, 0.11 v5.3.0, 0.19 v5.2.0, 0.00 v5.0.0, 0.12 v4.1.0, 0.13 v4.0.0, 0.17 v3.7.0, 0.15 v3.5.0, 0.16 v3.3.0
% Syntax   : Number of formulae    :    6 (   2 unit)
%            Number of atoms       :   13 (   1 equality)
%            Maximal formula depth :    8 (   4 average)
%            Number of connectives :    8 (   1 ~  ;   0  |;   1  &)
%                                         (   3 <=>;   3 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   1 propositional; 0-2 arity)
%            Number of functors    :    1 (   0 constant; 1-1 arity)
%            Number of variables   :   13 (   1 singleton;  12 !;   1 ?)
%            Maximal term depth    :    2 (   1 average)
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

fof(d4_tarski,axiom,(
    ! [A,B] :
      ( B = union(A)
    <=> ! [C] :
          ( in(C,B)
        <=> ? [D] :
              ( in(C,D)
              & in(D,A) ) ) ) )).

fof(dt_k3_tarski,axiom,(
    $true )).

fof(l50_zfmisc_1,conjecture,(
    ! [A,B] :
      ( in(A,B)
     => subset(A,union(B)) ) )).

fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : subset(A,A) )).

%------------------------------------------------------------------------------
