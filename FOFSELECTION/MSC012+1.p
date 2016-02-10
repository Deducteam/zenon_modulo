%------------------------------------------------------------------------------
% File     : MSC012+1 : TPTP v6.1.0. Released v3.2.0.
% Domain   : Miscellaneous
% Problem  : A serial and transitive relation inconsistent for non-empty domain
% Version  : Especial.
% English  :

% Refs     : [Bez05] Bezem (2005), Email to Geoff Sutcliffe
% Source   : [Bez05]
% Names    : ser [Bez05]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.12 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0, 0.07 v5.0.0, 0.10 v4.1.0, 0.11 v4.0.1, 0.16 v4.0.0, 0.15 v3.7.0, 0.33 v3.5.0, 0.12 v3.4.0, 0.08 v3.3.0, 0.00 v3.2.0

% Syntax   : Number of formulae    :    5 (   2 unit)
%            Number of atoms       :   12 (   0 equality)
%            Maximal formula depth :    6 (   4 average)
%            Number of connectives :    7 (   0 ~  ;   1  |;   4  &)
%                                         (   0 <=>;   2 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    3 (   1 propositional; 0-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :    9 (   0 singleton;   7 !;   2 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
fof(left_to_right,axiom,(
    ! [A,B] :
      ( ( p(A)
        & less(A,B)
        & p(B) )
     => goal ) )).

fof(right_to_left,axiom,(
    ! [A] :
      ( p(A)
      | ? [B] :
          ( less(A,B)
          & p(B) ) ) )).

fof(transitive_less,axiom,(
    ! [A,B,C] :
      ( ( less(A,B)
        & less(B,C) )
     => less(A,C) ) )).

fof(serial_less,axiom,(
    ! [A] :
    ? [B] : less(A,B) )).

fof(goal_to_be_proved,conjecture,(
    goal )).

%------------------------------------------------------------------------------
