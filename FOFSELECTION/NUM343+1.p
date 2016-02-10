%------------------------------------------------------------------------------
% File     : NUM343+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Number Theory (RDN arithmetic)
% Problem  : -1 < ? & ? < 1 => 21 + ? = 21
% Version  : Especial.
% English  :

% Refs     :
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.24 v6.1.0, 0.23 v6.0.0, 0.30 v5.5.0, 0.22 v5.4.0, 0.21 v5.3.0, 0.22 v5.2.0, 0.15 v5.1.0, 0.10 v5.0.0, 0.12 v4.1.0, 0.13 v4.0.0, 0.12 v3.7.0, 0.15 v3.5.0, 0.16 v3.3.0, 0.14 v3.2.0, 0.27 v3.1.0
% Syntax   : Number of formulae    :  402 ( 374 unit)
%            Number of atoms       :  475 (   5 equality)
%            Maximal formula depth :   19 (   1 average)
%            Number of connectives :   75 (   2 ~  ;   1  |;  44  &)
%                                         (   3 <=>;  25 =>;   0 <=)
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
fof(sum_something_n0_samething,conjecture,
    ( ? [X] :
        ( ( less(nn1,X)
          & less(X,n1) )
       => sum(n21,X,n21) ) )).

%------------------------------------------------------------------------------
