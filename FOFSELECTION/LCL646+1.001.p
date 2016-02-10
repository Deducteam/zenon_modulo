%------------------------------------------------------------------------------
% File     : LCL646+1.001 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Logic Calculi (Modal Logic)
% Problem  : In K, path through a labyrinth, size 1
% Version  : Especial.
% English  :

% Refs     : [BHS00] Balsiger et al. (2000), A Benchmark Method for the Pro
%          : [Kam08] Kaminski (2008), Email to G. Sutcliffe
% Source   : [Kam08]
% Names    : k_path_p [BHS00]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v4.1.0, 0.06 v4.0.1, 0.05 v4.0.0
% Syntax   : Number of formulae    :    1 (   0 unit)
%            Number of atoms       :   16 (   0 equality)
%            Maximal formula depth :   14 (  14 average)
%            Number of connectives :   29 (  14 ~  ;  15  |;   0  &)
%                                         (   0 <=>;   0 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    7 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :    9 (   0 singleton;   8 !;   1 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments : A naive relational encoding of the modal logic problem into
%            first-order logic.
%------------------------------------------------------------------------------
fof(main,conjecture,(
    ~ ( ? [X] :
          ~ ( ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | p6(Y) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | p2(Y) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | p4(Y) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | p2(Y) ) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p5(Y) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p3(Y) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p2(Y) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p1(Y) ) ) ) )).

%------------------------------------------------------------------------------
