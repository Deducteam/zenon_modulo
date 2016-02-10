%------------------------------------------------------------------------------
% File     : LCL644+1.005 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Logic Calculi (Modal Logic)
% Problem  : In K, H2 -> L, size 5
% Version  : Especial.
% English  :

% Refs     : [BHS00] Balsiger et al. (2000), A Benchmark Method for the Pro
%          : [Kam08] Kaminski (2008), Email to G. Sutcliffe
% Source   : [Kam08]
% Names    : k_lin_p [BHS00]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.08 v6.0.0, 0.25 v5.5.0, 0.12 v5.4.0, 0.13 v5.3.0, 0.22 v5.2.0, 0.07 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.11 v4.0.0
% Syntax   : Number of formulae    :    1 (   0 unit)
%            Number of atoms       :  225 (   0 equality)
%            Maximal formula depth :   29 (  29 average)
%            Number of connectives :  357 ( 133 ~  ; 152  |;  72  &)
%                                         (   0 <=>;   0 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    7 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   80 (   0 singleton;  79 !;   1 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : A naive relational encoding of the modal logic problem into
%            first-order logic.
%------------------------------------------------------------------------------
fof(main,conjecture,(
    ~ ( ? [X] :
          ~ ( ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ~ ( p6(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p6(X) ) )
                    | p5(Y) )
                | ! [Y] :
                    ( ~ r1(X,Y)
                    | p6(Y)
                    | ~ ( p5(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p5(X) )
                        & p5(Y) ) )
                | ~ ( ! [Y] :
                        ( ~ r1(X,Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( p6(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p6(Y) ) )
                            | p5(X) )
                        | p6(Y)
                        | ~ ( p5(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p5(X) )
                            & p5(Y) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p6(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p6(X) ) )
                        | p5(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | p6(X)
                            | ~ ( p5(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p5(Y) )
                                & p5(X) ) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p6(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p6(X) ) )
                        | p5(Y)
                        | p6(Y)
                        | ~ ( p5(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p5(X) )
                            & p5(Y) ) ) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ~ ( p5(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p5(X) ) )
                    | p4(Y) )
                | ! [Y] :
                    ( ~ r1(X,Y)
                    | p5(Y)
                    | ~ ( p4(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p4(X) )
                        & p4(Y) ) )
                | ~ ( ! [Y] :
                        ( ~ r1(X,Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( p5(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p5(Y) ) )
                            | p4(X) )
                        | p5(Y)
                        | ~ ( p4(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p4(X) )
                            & p4(Y) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p5(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p5(X) ) )
                        | p4(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | p5(X)
                            | ~ ( p4(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p4(Y) )
                                & p4(X) ) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p5(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p5(X) ) )
                        | p4(Y)
                        | p5(Y)
                        | ~ ( p4(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p4(X) )
                            & p4(Y) ) ) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ~ ( p4(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p4(X) ) )
                    | p3(Y) )
                | ! [Y] :
                    ( ~ r1(X,Y)
                    | p4(Y)
                    | ~ ( p3(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p3(X) )
                        & p3(Y) ) )
                | ~ ( ! [Y] :
                        ( ~ r1(X,Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( p4(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p4(Y) ) )
                            | p3(X) )
                        | p4(Y)
                        | ~ ( p3(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p3(X) )
                            & p3(Y) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p4(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p4(X) ) )
                        | p3(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | p4(X)
                            | ~ ( p3(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p3(Y) )
                                & p3(X) ) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p4(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p4(X) ) )
                        | p3(Y)
                        | p4(Y)
                        | ~ ( p3(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p3(X) )
                            & p3(Y) ) ) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ~ ( p3(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p3(X) ) )
                    | p2(Y) )
                | ! [Y] :
                    ( ~ r1(X,Y)
                    | p3(Y)
                    | ~ ( p2(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p2(X) )
                        & p2(Y) ) )
                | ~ ( ! [Y] :
                        ( ~ r1(X,Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( p3(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p3(Y) ) )
                            | p2(X) )
                        | p3(Y)
                        | ~ ( p2(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p2(X) )
                            & p2(Y) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p3(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p3(X) ) )
                        | p2(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | p3(X)
                            | ~ ( p2(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p2(Y) )
                                & p2(X) ) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p3(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p3(X) ) )
                        | p2(Y)
                        | p3(Y)
                        | ~ ( p2(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p2(X) )
                            & p2(Y) ) ) ) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p5(Y)
                | ~ ( ! [X] :
                        ( ~ r1(Y,X)
                        | p5(X) )
                    & p5(Y) ) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p5(Y)
                | ~ ( ! [X] :
                        ( ~ r1(Y,X)
                        | p5(X) )
                    & p5(Y) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ~ ( p2(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p2(X) ) )
                    | p1(Y) )
                | ! [Y] :
                    ( ~ r1(X,Y)
                    | p2(Y)
                    | ~ ( p1(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p1(X) )
                        & p1(Y) ) )
                | ~ ( ! [Y] :
                        ( ~ r1(X,Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( p2(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p2(Y) ) )
                            | p1(X) )
                        | p2(Y)
                        | ~ ( p1(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p1(X) )
                            & p1(Y) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p2(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p2(X) ) )
                        | p1(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | p2(X)
                            | ~ ( p1(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p1(Y) )
                                & p1(X) ) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p2(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p2(X) ) )
                        | p1(Y)
                        | p2(Y)
                        | ~ ( p1(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p1(X) )
                            & p1(Y) ) ) ) ) ) ) )).

%------------------------------------------------------------------------------
