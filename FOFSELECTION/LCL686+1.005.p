%------------------------------------------------------------------------------
% File     : LCL686+1.005 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Logic Calculi (Modal Logic)
% Problem  : In S4, formula provable in S5 embedding, size 5
% Version  : Especial.
% English  :

% Refs     : [BHS00] Balsiger et al. (2000), A Benchmark Method for the Pro
%          : [Kam08] Kaminski (2008), Email to G. Sutcliffe
% Source   : [Kam08]
% Names    : s4_s5_p [BHS00]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.12 v5.4.0, 0.13 v5.3.0, 0.22 v5.2.0, 0.07 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.11 v4.0.0
% Syntax   : Number of formulae    :    3 (   1 unit)
%            Number of atoms       :  144 (   0 equality)
%            Maximal formula depth :   55 (  21 average)
%            Number of connectives :  257 ( 116 ~  ;  87  |;  53  &)
%                                         (   0 <=>;   1 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   16 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   37 (   0 singleton;  36 !;   1 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : A naive relational encoding of the modal logic problem into
%            first-order logic.
%------------------------------------------------------------------------------
fof(reflexivity,axiom,(
    ! [X] : r1(X,X) )).

fof(transitivity,axiom,(
    ! [X,Y,Z] :
      ( ( r1(X,Y)
        & r1(Y,Z) )
     => r1(X,Z) ) )).

fof(main,conjecture,(
    ~ ( ? [X] :
          ~ ( ! [Y] :
                ( ~ r1(X,Y)
                | ~ p15(Y)
                | ! [X] :
                    ( ~ r1(Y,X)
                    | ~ p1(X) ) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | ~ ( ! [X] :
                        ( ~ r1(Y,X)
                        | ~ ( ! [Y] :
                                ( ~ r1(X,Y)
                                | ! [X] :
                                    ( ~ r1(Y,X)
                                    | ! [Y] :
                                        ( ~ r1(X,Y)
                                        | ! [X] :
                                            ( ~ r1(Y,X)
                                            | ! [Y] :
                                                ( ~ r1(X,Y)
                                                | ! [X] :
                                                    ( ~ r1(Y,X)
                                                    | ! [Y] :
                                                        ( ~ r1(X,Y)
                                                        | ! [X] :
                                                            ( ~ r1(Y,X)
                                                            | ! [Y] :
                                                                ( ~ r1(X,Y)
                                                                | ! [X] :
                                                                    ( ~ r1(Y,X)
                                                                    | ! [Y] :
                                                                        ( ~ r1(X,Y)
                                                                        | ! [X] :
                                                                            ( ~ r1(Y,X)
                                                                            | ! [Y] :
                                                                                ( ~ r1(X,Y)
                                                                                | $false )
                                                                            | ~ ( ! [Y] :
                                                                                    ( ~ r1(X,Y)
                                                                                    | ~ ( ( p14(Y)
                                                                                          & ~ p13(Y) )
                                                                                        | ( ~ p14(Y)
                                                                                          & p13(Y) ) ) ) ) )
                                                                        | ~ ( ! [X] :
                                                                                ( ~ r1(Y,X)
                                                                                | ~ ( ( p13(X)
                                                                                      & ~ p12(X) )
                                                                                    | ( ~ p13(X)
                                                                                      & p12(X) ) ) ) ) )
                                                                    | ~ ( ! [Y] :
                                                                            ( ~ r1(X,Y)
                                                                            | ~ ( ( p12(Y)
                                                                                  & ~ p11(Y) )
                                                                                | ( ~ p12(Y)
                                                                                  & p11(Y) ) ) ) ) )
                                                                | ~ ( ! [X] :
                                                                        ( ~ r1(Y,X)
                                                                        | ~ ( ( p11(X)
                                                                              & ~ p10(X) )
                                                                            | ( ~ p11(X)
                                                                              & p10(X) ) ) ) ) )
                                                            | ~ ( ! [Y] :
                                                                    ( ~ r1(X,Y)
                                                                    | ~ ( ( p10(Y)
                                                                          & ~ p9(Y) )
                                                                        | ( ~ p10(Y)
                                                                          & p9(Y) ) ) ) ) )
                                                        | ~ ( ! [X] :
                                                                ( ~ r1(Y,X)
                                                                | ~ ( ( p9(X)
                                                                      & ~ p8(X) )
                                                                    | ( ~ p9(X)
                                                                      & p8(X) ) ) ) ) )
                                                    | ~ ( ! [Y] :
                                                            ( ~ r1(X,Y)
                                                            | ~ ( ( p8(Y)
                                                                  & ~ p7(Y) )
                                                                | ( ~ p8(Y)
                                                                  & p7(Y) ) ) ) ) )
                                                | ~ ( ! [X] :
                                                        ( ~ r1(Y,X)
                                                        | ~ ( ( p7(X)
                                                              & ~ p6(X) )
                                                            | ( ~ p7(X)
                                                              & p6(X) ) ) ) ) )
                                            | ~ ( ! [Y] :
                                                    ( ~ r1(X,Y)
                                                    | ~ ( ( p6(Y)
                                                          & ~ p5(Y) )
                                                        | ( ~ p6(Y)
                                                          & p5(Y) ) ) ) ) )
                                        | ~ ( ! [X] :
                                                ( ~ r1(Y,X)
                                                | ~ ( ( p5(X)
                                                      & ~ p4(X) )
                                                    | ( ~ p5(X)
                                                      & p4(X) ) ) ) ) )
                                    | ~ ( ! [Y] :
                                            ( ~ r1(X,Y)
                                            | ~ ( ( p4(Y)
                                                  & ~ p3(Y) )
                                                | ( ~ p4(Y)
                                                  & p3(Y) ) ) ) ) )
                                | ~ ( ! [X] :
                                        ( ~ r1(Y,X)
                                        | ~ ( ( p3(X)
                                              & ~ p2(X) )
                                            | ( ~ p3(X)
                                              & p2(X) ) ) ) ) )
                            | ~ ( ! [Y] :
                                    ( ~ r1(X,Y)
                                    | ~ ( ( p2(Y)
                                          & ~ p1(Y) )
                                        | ( ~ p2(Y)
                                          & p1(Y) ) ) ) )
                            | ! [Y] :
                                ( ~ r1(X,Y)
                                | p15(Y) )
                            | ! [Y] :
                                ( ~ r1(X,Y)
                                | ( ~ p13(Y)
                                  & ~ p14(Y) )
                                | ( p14(Y)
                                  & p13(Y) )
                                | ( ~ p12(Y)
                                  & ~ p13(Y) )
                                | ( p13(Y)
                                  & p12(Y) )
                                | ( ~ p11(Y)
                                  & ~ p12(Y) )
                                | ( p12(Y)
                                  & p11(Y) )
                                | ( ~ p10(Y)
                                  & ~ p11(Y) )
                                | ( p11(Y)
                                  & p10(Y) )
                                | ( ~ p9(Y)
                                  & ~ p10(Y) )
                                | ( p10(Y)
                                  & p9(Y) )
                                | ( ~ p8(Y)
                                  & ~ p9(Y) )
                                | ( p9(Y)
                                  & p8(Y) )
                                | ( ~ p7(Y)
                                  & ~ p8(Y) )
                                | ( p8(Y)
                                  & p7(Y) )
                                | ( ~ p6(Y)
                                  & ~ p7(Y) )
                                | ( p7(Y)
                                  & p6(Y) )
                                | ( ~ p5(Y)
                                  & ~ p6(Y) )
                                | ( p6(Y)
                                  & p5(Y) )
                                | ( ~ p4(Y)
                                  & ~ p5(Y) )
                                | ( p5(Y)
                                  & p4(Y) )
                                | ( ~ p3(Y)
                                  & ~ p4(Y) )
                                | ( p4(Y)
                                  & p3(Y) )
                                | ( ~ p2(Y)
                                  & ~ p3(Y) )
                                | ( p3(Y)
                                  & p2(Y) )
                                | ( ~ p1(Y)
                                  & ~ p2(Y) )
                                | ( p2(Y)
                                  & p1(Y) ) ) ) ) ) ) ) ) )).

%------------------------------------------------------------------------------
