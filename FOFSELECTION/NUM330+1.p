%------------------------------------------------------------------------------
% File     : NUM330+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Number Theory (RDN arithmetic)
% Problem  : XY (X+Y = 8) & X = 4 & Y = 4
% Version  : Especial.
% English  :

% Refs     :
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.36 v6.1.0, 0.50 v6.0.0, 0.48 v5.5.0, 0.52 v5.4.0, 0.57 v5.3.0, 0.63 v5.2.0, 0.50 v5.1.0, 0.48 v5.0.0, 0.58 v4.1.0, 0.57 v4.0.0, 0.58 v3.7.0, 0.55 v3.5.0, 0.68 v3.3.0, 0.64 v3.2.0, 0.82 v3.1.0
% Syntax   : Number of formulae    :  402 ( 374 unit)
%            Number of atoms       :  475 (   7 equality)
%            Maximal formula depth :   19 (   1 average)
%            Number of connectives :   75 (   2 ~  ;   1  |;  45  &)
%                                         (   3 <=>;  24 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   11 (   0 propositional; 1-4 arity)
%            Number of functors    :  260 ( 256 constant; 0-2 arity)
%            Number of variables   :  123 (   0 singleton; 121 !;   2 ?)
%            Maximal term depth    :    5 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include axioms for RDN arithmetic
include('Axioms/NUM005+0.ax').
include('Axioms/NUM005+1.ax').
include('Axioms/NUM005+2.ax').
%------------------------------------------------------------------------------
fof(sum_n4_n4_n8,conjecture,
    ( ? [X,Y] :
        ( sum(X,Y,n8)
        & X = n4
        & Y = n4 ) )).

%------------------------------------------------------------------------------
