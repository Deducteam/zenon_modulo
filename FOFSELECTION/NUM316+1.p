%------------------------------------------------------------------------------
% File     : NUM316+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Number Theory (RDN arithmetic)
% Problem  : 2 + -5 = -3
% Version  : Especial.
% English  :

% Refs     :
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.52 v6.1.0, 0.63 v6.0.0, 0.61 v5.5.0, 0.63 v5.4.0, 0.71 v5.3.0, 0.78 v5.2.0, 0.65 v5.1.0, 0.57 v5.0.0, 0.62 v4.1.0, 0.61 v4.0.1, 0.65 v4.0.0, 0.62 v3.7.0, 0.70 v3.5.0, 0.74 v3.4.0, 0.84 v3.3.0, 0.79 v3.2.0, 0.82 v3.1.0
% Syntax   : Number of formulae    :  402 ( 375 unit)
%            Number of atoms       :  473 (   5 equality)
%            Maximal formula depth :   19 (   1 average)
%            Number of connectives :   73 (   2 ~  ;   1  |;  43  &)
%                                         (   3 <=>;  24 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   11 (   0 propositional; 1-4 arity)
%            Number of functors    :  260 ( 256 constant; 0-2 arity)
%            Number of variables   :  121 (   0 singleton; 121 !;   0 ?)
%            Maximal term depth    :    5 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include axioms for RDN arithmetic
include('Axioms/NUM005+0.ax').
include('Axioms/NUM005+1.ax').
include('Axioms/NUM005+2.ax').
%------------------------------------------------------------------------------
fof(sum_n2_nn5_nn3,conjecture,
    ( sum(n2,nn5,nn3) )).

%------------------------------------------------------------------------------
