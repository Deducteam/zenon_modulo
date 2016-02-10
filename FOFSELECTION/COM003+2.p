%--------------------------------------------------------------------------
% File     : COM003+2 : TPTP v6.1.0. Bugfixed v2.2.0.
% Domain   : Computing Theory
% Problem  : The halting problem is undecidable
% Version  : [Bru91] axioms.
% English  :

% Refs     : [Gan98] Ganzinger (1998), Email to Geoff Sutcliffe
%          : [Bur87b] Burkholder (1987), A 76th Automated Theorem Proving Pr
%          : [Bru91] Brushi (1991), The Halting Problem
% Source   : [Bru91]
% Names    : - [Bru91]

% Status   : Theorem
% Rating   : 0.09 v6.1.0, 0.12 v6.0.0, 0.50 v5.5.0, 0.21 v5.4.0, 0.17 v5.3.0, 0.26 v5.2.0, 0.14 v5.0.0, 0.10 v4.1.0, 0.06 v4.0.1, 0.11 v4.0.0, 0.10 v3.7.0, 0.33 v3.5.0, 0.12 v3.4.0, 0.08 v3.3.0, 0.11 v3.2.0, 0.22 v3.1.0, 0.00 v2.5.0, 0.33 v2.4.0, 0.33 v2.2.1
% Syntax   : Number of formulae    :   16 (   1 unit)
%            Number of atoms       :   52 (   0 equality)
%            Maximal formula depth :    8 (   6 average)
%            Number of connectives :   39 (   3 ~  ;   0  |;  15  &)
%                                         (  11 <=>;  10 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   17 (   0 propositional; 1-4 arity)
%            Number of functors    :    2 (   2 constant; 0-0 arity)
%            Number of variables   :   44 (   0 singleton;  37 !;   7 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
% Bugfixes : v2.2.0 - Clauses program_halts2_halts3_outputs_def, program_
%            not_halts2_halts3_outputs_def, program_halts2_halts2_outputs_
%            def, program_not_halts2_halts2_outputs_def, p4 by [Gan98].
%--------------------------------------------------------------------------
fof(program_decides_def,axiom,
    ( ! [X] :
        ( program_decides(X)
      <=> ! [Y] :
            ( program(Y)
           => ! [Z] : decides(X,Y,Z) ) ) )).

fof(program_program_decides_def,axiom,
    ( ! [X] :
        ( program_program_decides(X)
      <=> ( program(X)
          & program_decides(X) ) ) )).

fof(algorithm_program_decides_def,axiom,
    ( ! [X] :
        ( algorithm_program_decides(X)
      <=> ( algorithm(X)
          & program_decides(X) ) ) )).

fof(program_halts2_def,axiom,
    ( ! [X,Y] :
        ( program_halts2(X,Y)
      <=> ( program(X)
          & halts2(X,Y) ) ) )).

fof(halts3_outputs_def,axiom,
    ( ! [X,Y,Z,W] :
        ( halts3_outputs(X,Y,Z,W)
      <=> ( halts3(X,Y,Z)
          & outputs(X,W) ) ) )).

fof(program_not_halts2_def,axiom,
    ( ! [X,Y] :
        ( program_not_halts2(X,Y)
      <=> ( program(X)
          & ~ halts2(X,Y) ) ) )).

fof(halts2_outputs_def,axiom,
    ( ! [X,Y,W] :
        ( halts2_outputs(X,Y,W)
      <=> ( halts2(X,Y)
          & outputs(X,W) ) ) )).

fof(program_halts2_halts3_outputs_def,axiom,
    ( ! [X,Y,Z,W] :
        ( program_halts2_halts3_outputs(X,Y,Z,W)
      <=> ( program_halts2(Y,Z)
         => halts3_outputs(X,Y,Z,W) ) ) )).

fof(program_not_halts2_halts3_outputs_def,axiom,
    ( ! [X,Y,Z,W] :
        ( program_not_halts2_halts3_outputs(X,Y,Z,W)
      <=> ( program_not_halts2(Y,Z)
         => halts3_outputs(X,Y,Z,W) ) ) )).

fof(program_halts2_halts2_outputs_def,axiom,
    ( ! [X,Y,W] :
        ( program_halts2_halts2_outputs(X,Y,W)
      <=> ( program_halts2(Y,Y)
         => halts2_outputs(X,Y,W) ) ) )).

fof(program_not_halts2_halts2_outputs_def,axiom,
    ( ! [X,Y,W] :
        ( program_not_halts2_halts2_outputs(X,Y,W)
      <=> ( program_not_halts2(Y,Y)
         => halts2_outputs(X,Y,W) ) ) )).

fof(p1,axiom,
    ( ? [X] : algorithm_program_decides(X)
   => ? [W] : program_program_decides(W) )).

fof(p2,axiom,
    ( ! [W] :
        ( program_program_decides(W)
       => ! [Y,Z] :
            ( program_halts2_halts3_outputs(W,Y,Z,good)
            & program_not_halts2_halts3_outputs(W,Y,Z,bad) ) ) )).

fof(p3,axiom,
    ( ? [W] :
        ( program(W)
        & ! [Y] :
            ( program_halts2_halts3_outputs(W,Y,Y,good)
            & program_not_halts2_halts3_outputs(W,Y,Y,bad) ) )
   => ? [V] :
        ( program(V)
        & ! [Y] :
            ( program_halts2_halts2_outputs(V,Y,good)
            & program_not_halts2_halts2_outputs(V,Y,bad) ) ) )).

fof(p4,axiom,
    ( ? [V] :
        ( program(V)
        & ! [Y] :
            ( program_halts2_halts2_outputs(V,Y,good)
            & program_not_halts2_halts2_outputs(V,Y,bad) ) )
   => ? [U] :
        ( program(U)
        & ! [Y] :
            ( ( program_halts2(Y,Y)
             => ~ halts2(U,Y) )
            & program_not_halts2_halts2_outputs(U,Y,good) ) ) )).

fof(prove_this,conjecture,
    ( ~ ( ? [X] : algorithm_program_decides(X) ) )).

%--------------------------------------------------------------------------
