%------------------------------------------------------------------------------
% File     : LCL644+1.010 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Logic Calculi (Modal Logic)
% Problem  : In K, H2 -> L, size 10
% Version  : Especial.
% English  :

% Refs     : [BHS00] Balsiger et al. (2000), A Benchmark Method for the Pro
%          : [Kam08] Kaminski (2008), Email to G. Sutcliffe
% Source   : [Kam08]
% Names    : k_lin_p [BHS00]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.00 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.22 v5.2.0, 0.14 v5.0.0, 0.10 v4.1.0, 0.11 v4.0.0
% Syntax   : Number of formulae    :    1 (   0 unit)
%            Number of atoms       :  440 (   0 equality)
%            Maximal formula depth :   34 (  34 average)
%            Number of connectives :  697 ( 258 ~  ; 297  |; 142  &)
%                                         (   0 <=>;   0 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   12 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :  155 (   0 singleton; 154 !;   1 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : A naive relational encoding of the modal logic problem into
%            first-order logic.
%------------------------------------------------------------------------------
fof(main,conjecture,(
    ~ ( ? [X] :
          ~ ( ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ~ ( p11(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p11(X) ) )
                    | p10(Y) )
                | ! [Y] :
                    ( ~ r1(X,Y)
                    | p11(Y)
                    | ~ ( p10(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p10(X) )
                        & p10(Y) ) )
                | ~ ( ! [Y] :
                        ( ~ r1(X,Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( p11(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p11(Y) ) )
                            | p10(X) )
                        | p11(Y)
                        | ~ ( p10(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p10(X) )
                            & p10(Y) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p11(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p11(X) ) )
                        | p10(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | p11(X)
                            | ~ ( p10(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p10(Y) )
                                & p10(X) ) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p11(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p11(X) ) )
                        | p10(Y)
                        | p11(Y)
                        | ~ ( p10(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p10(X) )
                            & p10(Y) ) ) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ~ ( p10(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p10(X) ) )
                    | p9(Y) )
                | ! [Y] :
                    ( ~ r1(X,Y)
                    | p10(Y)
                    | ~ ( p9(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p9(X) )
                        & p9(Y) ) )
                | ~ ( ! [Y] :
                        ( ~ r1(X,Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( p10(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p10(Y) ) )
                            | p9(X) )
                        | p10(Y)
                        | ~ ( p9(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p9(X) )
                            & p9(Y) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p10(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p10(X) ) )
                        | p9(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | p10(X)
                            | ~ ( p9(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p9(Y) )
                                & p9(X) ) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p10(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p10(X) ) )
                        | p9(Y)
                        | p10(Y)
                        | ~ ( p9(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p9(X) )
                            & p9(Y) ) ) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ~ ( p9(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p9(X) ) )
                    | p8(Y) )
                | ! [Y] :
                    ( ~ r1(X,Y)
                    | p9(Y)
                    | ~ ( p8(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p8(X) )
                        & p8(Y) ) )
                | ~ ( ! [Y] :
                        ( ~ r1(X,Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( p9(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p9(Y) ) )
                            | p8(X) )
                        | p9(Y)
                        | ~ ( p8(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p8(X) )
                            & p8(Y) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p9(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p9(X) ) )
                        | p8(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | p9(X)
                            | ~ ( p8(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p8(Y) )
                                & p8(X) ) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p9(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p9(X) ) )
                        | p8(Y)
                        | p9(Y)
                        | ~ ( p8(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p8(X) )
                            & p8(Y) ) ) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ~ ( p8(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p8(X) ) )
                    | p7(Y) )
                | ! [Y] :
                    ( ~ r1(X,Y)
                    | p8(Y)
                    | ~ ( p7(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p7(X) )
                        & p7(Y) ) )
                | ~ ( ! [Y] :
                        ( ~ r1(X,Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( p8(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p8(Y) ) )
                            | p7(X) )
                        | p8(Y)
                        | ~ ( p7(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p7(X) )
                            & p7(Y) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p8(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p8(X) ) )
                        | p7(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | p8(X)
                            | ~ ( p7(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p7(Y) )
                                & p7(X) ) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p8(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p8(X) ) )
                        | p7(Y)
                        | p8(Y)
                        | ~ ( p7(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p7(X) )
                            & p7(Y) ) ) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ~ ( p7(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p7(X) ) )
                    | p6(Y) )
                | ! [Y] :
                    ( ~ r1(X,Y)
                    | p7(Y)
                    | ~ ( p6(Y)
                        & ! [X] :
                            ( ~ r1(Y,X)
                            | p6(X) )
                        & p6(Y) ) )
                | ~ ( ! [Y] :
                        ( ~ r1(X,Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( p7(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p7(Y) ) )
                            | p6(X) )
                        | p7(Y)
                        | ~ ( p6(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p6(X) )
                            & p6(Y) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p7(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p7(X) ) )
                        | p6(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | p7(X)
                            | ~ ( p6(X)
                                & ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p6(Y) )
                                & p6(X) ) ) )
                    & ! [Y] :
                        ( ~ r1(X,Y)
                        | ~ ( p7(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p7(X) ) )
                        | p6(Y)
                        | p7(Y)
                        | ~ ( p6(Y)
                            & ! [X] :
                                ( ~ r1(Y,X)
                                | p6(X) )
                            & p6(Y) ) ) ) )
            | ~ ( ! [Y] :
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
            | ! [Y] :
                ( ~ r1(X,Y)
                | p10(Y)
                | ~ ( ! [X] :
                        ( ~ r1(Y,X)
                        | p10(X) )
                    & p10(Y) ) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p10(Y)
                | ~ ( ! [X] :
                        ( ~ r1(Y,X)
                        | p10(X) )
                    & p10(Y) ) )
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
