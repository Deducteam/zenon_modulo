%------------------------------------------------------------------------------
% File     : KLE051+1 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Kleene Algebra (Domain Semirings)
% Problem  : Every domain semiring is automatically isotone
% Version  : [Hoe08] axioms.
% English  :

% Refs     : [DS08]  Desharnais & Struth (2008), Modal Semirings Revisited
%          : [Hoe08] Hoefner (2008), Email to G. Sutcliffe
% Source   : [Hoe08]
% Names    :

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.13 v6.0.0, 0.09 v5.5.0, 0.07 v5.3.0, 0.15 v5.2.0, 0.05 v5.0.0, 0.00 v4.1.0, 0.04 v4.0.0
% Syntax   : Number of formulae    :   18 (  17 unit)
%            Number of atoms       :   19 (  18 equality)
%            Maximal formula depth :    4 (   3 average)
%            Number of connectives :    1 (   0 ~  ;   0  |;   0  &)
%                                         (   1 <=>;   0 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    2 (   0 propositional; 2-2 arity)
%            Number of functors    :    5 (   2 constant; 0-2 arity)
%            Number of variables   :   29 (   0 singleton;  29 !;   0 ?)
%            Maximal term depth    :    4 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Equational encoding
%------------------------------------------------------------------------------
%---Include axioms for domain semiring
include('Axioms/KLE001+0.ax').
%---Include axioms for domain
include('Axioms/KLE001+5.ax').
%------------------------------------------------------------------------------
fof(goals,conjecture,(
    ! [X0] : addition(X0,X0) = X0 )).

%------------------------------------------------------------------------------
