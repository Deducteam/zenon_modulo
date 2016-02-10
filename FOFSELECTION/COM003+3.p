%--------------------------------------------------------------------------
% File     : COM003+3 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Computing Theory
% Problem  : The halting problem is undecidable
% Version  : [Daf94] axioms.
% English  :

% Refs     : [Bur87a] Burkholder (1987), The Halting Problem
%          : [Bur87b] Burkholder (1987), A 76th Automated Theorem Proving Pr
%          : [Daf94] Dafa (1994), The Formulation of the Halting Problem Is
% Source   : [Daf94]
% Names    : - [Daf94]

% Status   : Theorem
% Rating   : 0.09 v6.1.0, 0.12 v6.0.0, 0.25 v5.5.0, 0.17 v5.3.0, 0.26 v5.2.0, 0.14 v5.0.0, 0.15 v4.1.0, 0.11 v4.0.1, 0.16 v4.0.0, 0.15 v3.7.0, 0.33 v3.5.0, 0.25 v3.4.0, 0.08 v3.3.0, 0.11 v3.2.0, 0.22 v3.1.0, 0.33 v2.7.0, 0.00 v2.5.0, 0.33 v2.4.0, 0.33 v2.2.1, 0.00 v2.1.0
% Syntax   : Number of formulae    :    4 (   0 unit)
%            Number of atoms       :   39 (   0 equality)
%            Maximal formula depth :   10 (   8 average)
%            Number of connectives :   39 (   4 ~  ;   0  |;  22  &)
%                                         (   0 <=>;  13 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-3 arity)
%            Number of functors    :    2 (   2 constant; 0-0 arity)
%            Number of variables   :   19 (   0 singleton;  15 !;   4 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
fof(p1,axiom,
    ( ? [X] :
        ( algorithm(X)
        & ! [Y] :
            ( program(Y)
           => ! [Z] : decides(X,Y,Z) ) )
   => ? [W] :
        ( program(W)
        & ! [Y] :
            ( program(Y)
           => ! [Z] : decides(W,Y,Z) ) ) )).

fof(p2,axiom,
    ( ! [W] :
        ( ( program(W)
          & ! [Y] :
              ( program(Y)
             => ! [Z] : decides(W,Y,Z) ) )
       => ! [Y,Z] :
            ( ( ( program(Y)
                & halts2(Y,Z) )
             => ( halts3(W,Y,Z)
                & outputs(W,good) ) )
            & ( ( program(Y)
                & ~ halts2(Y,Z) )
             => ( halts3(W,Y,Z)
                & outputs(W,bad) ) ) ) ) )).

fof(p3,axiom,
    ( ! [W] :
        ( ( program(W)
          & ! [Y,Z] :
              ( ( ( program(Y)
                  & halts2(Y,Z) )
               => ( halts3(W,Y,Z)
                  & outputs(W,good) ) )
              & ( ( program(Y)
                  & ~ halts2(Y,Z) )
               => ( halts3(W,Y,Z)
                  & outputs(W,bad) ) ) ) )
       => ? [V] :
            ( program(V)
            & ! [Y] :
                ( ( ( program(Y)
                    & halts3(W,Y,Y)
                    & outputs(W,good) )
                 => ~ halts2(V,Y) )
                & ( ( program(Y)
                    & halts3(W,Y,Y)
                    & outputs(W,bad) )
                 => ( halts2(V,Y)
                    & outputs(V,bad) ) ) ) ) ) )).

fof(prove_this,conjecture,
    ( ~ ( ? [X1] :
            ( algorithm(X1)
            & ! [Y1] :
                ( program(Y1)
               => ! [Z1] : decides(X1,Y1,Z1) ) ) ) )).

%--------------------------------------------------------------------------
