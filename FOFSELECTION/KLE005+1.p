%------------------------------------------------------------------------------
% File     : KLE005+1 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Kleene Algebra (Idempotent Test Semirings)
% Problem  : Complement - 0 is the complement of 1
% Version  : [Hoe08] axioms.
% English  :

% Refs     : [Hoe08] Hoefner (2008), Email to G. Sutcliffe
% Source   : [Hoe08]
% Names    :

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.17 v6.0.0, 0.13 v5.5.0, 0.07 v5.3.0, 0.15 v5.2.0, 0.10 v5.0.0, 0.08 v4.1.0, 0.04 v4.0.0
% Syntax   : Number of formulae    :   17 (  12 unit)
%            Number of atoms       :   25 (  18 equality)
%            Maximal formula depth :    6 (   3 average)
%            Number of connectives :    9 (   1 ~  ;   0  |;   2  &)
%                                         (   4 <=>;   2 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 1-2 arity)
%            Number of functors    :    5 (   2 constant; 0-2 arity)
%            Number of variables   :   29 (   0 singleton;  28 !;   1 ?)
%            Maximal term depth    :    3 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Equational encoding
%------------------------------------------------------------------------------
%---Include axioms for idempotent test semiring
include('Axioms/KLE001+0.ax').
%---Include test axioms
include('Axioms/KLE001+1.ax').
%------------------------------------------------------------------------------
fof(goals,conjecture,(
    c(one) = zero )).

%------------------------------------------------------------------------------
