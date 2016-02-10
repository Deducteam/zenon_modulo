%------------------------------------------------------------------------------
% File     : NUM340+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Number Theory (RDN arithmetic)
% Problem  : ? - 0 = ?
% Version  : Especial.
% English  :

% Refs     :
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.28 v6.1.0, 0.40 v6.0.0, 0.30 v5.5.0, 0.37 v5.4.0, 0.36 v5.3.0, 0.41 v5.2.0, 0.30 v5.1.0, 0.33 v5.0.0, 0.38 v4.1.0, 0.39 v4.0.1, 0.43 v4.0.0, 0.42 v3.7.0, 0.40 v3.5.0, 0.42 v3.4.0, 0.47 v3.3.0, 0.43 v3.2.0, 0.64 v3.1.0
% Syntax   : Number of formulae    :  402 ( 375 unit)
%            Number of atoms       :  473 (   5 equality)
%            Maximal formula depth :   19 (   1 average)
%            Number of connectives :   73 (   2 ~  ;   1  |;  43  &)
%                                         (   3 <=>;  24 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   11 (   0 propositional; 1-4 arity)
%            Number of functors    :  260 ( 256 constant; 0-2 arity)
%            Number of variables   :  122 (   0 singleton; 121 !;   1 ?)
%            Maximal term depth    :    5 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include axioms for RDN arithmetic
include('Axioms/NUM005+0.ax').
include('Axioms/NUM005+1.ax').
include('Axioms/NUM005+2.ax').
%------------------------------------------------------------------------------
fof(diff_zero_identity,conjecture,
    ( ? [X] : difference(X,n0,X) )).

%------------------------------------------------------------------------------
