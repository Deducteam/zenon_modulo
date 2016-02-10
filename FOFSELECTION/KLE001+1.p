%------------------------------------------------------------------------------
% File     : KLE001+1 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Kleene Algebra (Idempotent Semirings)
% Problem  : Addition is isotone
% Version  : [Hoe08] axioms.
% English  :

% Refs     : [Hoe08] Hoefner (2008), Email to G. Sutcliffe
% Source   : [Hoe08]
% Names    :

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.13 v6.0.0, 0.09 v5.5.0, 0.04 v5.4.0, 0.07 v5.3.0, 0.11 v5.2.0, 0.05 v5.0.0, 0.04 v4.1.0, 0.09 v4.0.0
% Syntax   : Number of formulae    :   13 (  11 unit)
%            Number of atoms       :   15 (  12 equality)
%            Maximal formula depth :    5 (   3 average)
%            Number of connectives :    2 (   0 ~  ;   0  |;   0  &)
%                                         (   1 <=>;   1 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    2 (   0 propositional; 2-2 arity)
%            Number of functors    :    4 (   2 constant; 0-2 arity)
%            Number of variables   :   25 (   0 singleton;  25 !;   0 ?)
%            Maximal term depth    :    3 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Inequational axioms
%------------------------------------------------------------------------------
%---Include axioms for idempotent semiring
include('Axioms/KLE001+0.ax').
%------------------------------------------------------------------------------
fof(goals,conjecture,(
    ! [X0,X1,X2] :
      ( leq(X0,X1)
     => leq(addition(X0,X2),addition(X0,X2)) ) )).

%------------------------------------------------------------------------------
