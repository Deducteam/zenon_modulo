%------------------------------------------------------------------------------
% File     : NUM333+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Number Theory (RDN arithmetic)
% Problem  : ?XYZ, ((X+Y)+Z) = (X+(Y+Z))
% Version  : Especial.
% English  :

% Refs     :
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.20 v6.1.0, 0.17 v6.0.0, 0.22 v5.5.0, 0.19 v5.4.0, 0.18 v5.3.0, 0.26 v5.2.0, 0.15 v5.1.0, 0.10 v5.0.0, 0.12 v4.1.0, 0.13 v4.0.0, 0.12 v3.7.0, 0.15 v3.5.0, 0.16 v3.4.0, 0.11 v3.3.0, 0.07 v3.2.0, 0.27 v3.1.0
% Syntax   : Number of formulae    :  402 ( 374 unit)
%            Number of atoms       :  477 (   6 equality)
%            Maximal formula depth :   19 (   2 average)
%            Number of connectives :   77 (   2 ~  ;   1  |;  46  &)
%                                         (   3 <=>;  25 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   11 (   0 propositional; 1-4 arity)
%            Number of functors    :  260 ( 256 constant; 0-2 arity)
%            Number of variables   :  128 (   0 singleton; 121 !;   7 ?)
%            Maximal term depth    :    5 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include axioms for RDN arithmetic
include('Axioms/NUM005+0.ax').
include('Axioms/NUM005+1.ax').
include('Axioms/NUM005+2.ax').
%------------------------------------------------------------------------------
%Comment:S-SETHEO---0.0 gives error:
%  *** ERROR:bigloo:parser:
%  parse error (unexpected token `closebracket') -- closebracket
fof(associative,conjecture,
    ( ? [X,Y,Z,Z1,Z2,Z3,Z4] :
        ( ( sum(X,Y,Z1)
          & sum(Z1,Z,Z2)
          & sum(Y,Z,Z3)
          & sum(X,Z3,Z4) )
       => Z2 = Z4 ) )).

%------------------------------------------------------------------------------
