%------------------------------------------------------------------------------
% File     : LCL674+1.010 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Logic Calculi (Modal Logic)
% Problem  : In S4, the branching formula made provable, size 10
% Version  : Especial.
% English  : The branching formula plus a negation symbol in front and an
%            additional subformula to make the formula provable.

% Refs     : [BHS00] Balsiger et al. (2000), A Benchmark Method for the Pro
%          : [Kam08] Kaminski (2008), Email to G. Sutcliffe
% Source   : [Kam08]
% Names    : s4_branch_p [BHS00]

% Status   : Theorem
% Rating   : 0.09 v6.1.0, 0.16 v6.0.0, 0.25 v5.5.0, 0.21 v5.4.0, 0.22 v5.2.0, 0.07 v5.0.0, 0.15 v4.1.0, 0.22 v4.0.1, 0.26 v4.0.0
% Syntax   : Number of formulae    :    3 (   1 unit)
%            Number of atoms       :  230 (   0 equality)
%            Maximal formula depth :   42 (  17 average)
%            Number of connectives :  432 ( 205 ~  ; 121  |; 105  &)
%                                         (   0 <=>;   1 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   24 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   49 (   0 singleton;  48 !;   1 ?)
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
          ~ ( ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | p5(Y) ) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ( ( ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ~ p11(X)
                                      & ~ p111(X)
                                      & p110(X) ) ) )
                          & ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( p11(X)
                                      & ~ p111(X)
                                      & p110(X) ) ) ) )
                        | ~ ( ~ p110(Y)
                            & p109(Y) ) )
                      & ( ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ~ p10(X)
                                      & ~ p110(X)
                                      & p109(X) ) ) )
                          & ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( p10(X)
                                      & ~ p110(X)
                                      & p109(X) ) ) ) )
                        | ~ ( ~ p109(Y)
                            & p108(Y) ) )
                      & ( ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ~ p9(X)
                                      & ~ p109(X)
                                      & p108(X) ) ) )
                          & ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( p9(X)
                                      & ~ p109(X)
                                      & p108(X) ) ) ) )
                        | ~ ( ~ p108(Y)
                            & p107(Y) ) )
                      & ( ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ~ p8(X)
                                      & ~ p108(X)
                                      & p107(X) ) ) )
                          & ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( p8(X)
                                      & ~ p108(X)
                                      & p107(X) ) ) ) )
                        | ~ ( ~ p107(Y)
                            & p106(Y) ) )
                      & ( ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ~ p7(X)
                                      & ~ p107(X)
                                      & p106(X) ) ) )
                          & ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( p7(X)
                                      & ~ p107(X)
                                      & p106(X) ) ) ) )
                        | ~ ( ~ p106(Y)
                            & p105(Y) ) )
                      & ( ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ~ p6(X)
                                      & ~ p106(X)
                                      & p105(X) ) ) )
                          & ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( p6(X)
                                      & ~ p106(X)
                                      & p105(X) ) ) ) )
                        | ~ ( ~ p105(Y)
                            & p104(Y) ) )
                      & ( ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ~ p5(X)
                                      & ~ p105(X)
                                      & p104(X) ) ) )
                          & ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( p5(X)
                                      & ~ p105(X)
                                      & p104(X) ) ) ) )
                        | ~ ( ~ p104(Y)
                            & p103(Y) ) )
                      & ( ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ~ p4(X)
                                      & ~ p104(X)
                                      & p103(X) ) ) )
                          & ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( p4(X)
                                      & ~ p104(X)
                                      & p103(X) ) ) ) )
                        | ~ ( ~ p103(Y)
                            & p102(Y) ) )
                      & ( ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ~ p3(X)
                                      & ~ p103(X)
                                      & p102(X) ) ) )
                          & ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( p3(X)
                                      & ~ p103(X)
                                      & p102(X) ) ) ) )
                        | ~ ( ~ p102(Y)
                            & p101(Y) ) )
                      & ( ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ~ p2(X)
                                      & ~ p102(X)
                                      & p101(X) ) ) )
                          & ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( p2(X)
                                      & ~ p102(X)
                                      & p101(X) ) ) ) )
                        | ~ ( ~ p101(Y)
                            & p100(Y) ) )
                      & ( ( ( ! [X] :
                                ( ~ r1(Y,X)
                                | ~ p11(X)
                                | ~ p110(X) )
                            | p11(Y) )
                          & ( ! [X] :
                                ( ~ r1(Y,X)
                                | p11(X)
                                | ~ p110(X) )
                            | ~ p11(Y) ) )
                        | ~ p110(Y) )
                      & ( ( ( ! [X] :
                                ( ~ r1(Y,X)
                                | ~ p10(X)
                                | ~ p109(X) )
                            | p10(Y) )
                          & ( ! [X] :
                                ( ~ r1(Y,X)
                                | p10(X)
                                | ~ p109(X) )
                            | ~ p10(Y) ) )
                        | ~ p109(Y) )
                      & ( ( ( ! [X] :
                                ( ~ r1(Y,X)
                                | ~ p9(X)
                                | ~ p108(X) )
                            | p9(Y) )
                          & ( ! [X] :
                                ( ~ r1(Y,X)
                                | p9(X)
                                | ~ p108(X) )
                            | ~ p9(Y) ) )
                        | ~ p108(Y) )
                      & ( ( ( ! [X] :
                                ( ~ r1(Y,X)
                                | ~ p8(X)
                                | ~ p107(X) )
                            | p8(Y) )
                          & ( ! [X] :
                                ( ~ r1(Y,X)
                                | p8(X)
                                | ~ p107(X) )
                            | ~ p8(Y) ) )
                        | ~ p107(Y) )
                      & ( ( ( ! [X] :
                                ( ~ r1(Y,X)
                                | ~ p7(X)
                                | ~ p106(X) )
                            | p7(Y) )
                          & ( ! [X] :
                                ( ~ r1(Y,X)
                                | p7(X)
                                | ~ p106(X) )
                            | ~ p7(Y) ) )
                        | ~ p106(Y) )
                      & ( ( ( ! [X] :
                                ( ~ r1(Y,X)
                                | ~ p6(X)
                                | ~ p105(X) )
                            | p6(Y) )
                          & ( ! [X] :
                                ( ~ r1(Y,X)
                                | p6(X)
                                | ~ p105(X) )
                            | ~ p6(Y) ) )
                        | ~ p105(Y) )
                      & ( ( ( ! [X] :
                                ( ~ r1(Y,X)
                                | ~ p5(X)
                                | ~ p104(X) )
                            | p5(Y) )
                          & ( ! [X] :
                                ( ~ r1(Y,X)
                                | p5(X)
                                | ~ p104(X) )
                            | ~ p5(Y) ) )
                        | ~ p104(Y) )
                      & ( ( ( ! [X] :
                                ( ~ r1(Y,X)
                                | ~ p4(X)
                                | ~ p103(X) )
                            | p4(Y) )
                          & ( ! [X] :
                                ( ~ r1(Y,X)
                                | p4(X)
                                | ~ p103(X) )
                            | ~ p4(Y) ) )
                        | ~ p103(Y) )
                      & ( ( ( ! [X] :
                                ( ~ r1(Y,X)
                                | ~ p3(X)
                                | ~ p102(X) )
                            | p3(Y) )
                          & ( ! [X] :
                                ( ~ r1(Y,X)
                                | p3(X)
                                | ~ p102(X) )
                            | ~ p3(Y) ) )
                        | ~ p102(Y) )
                      & ( ( ( ! [X] :
                                ( ~ r1(Y,X)
                                | ~ p2(X)
                                | ~ p101(X) )
                            | p2(Y) )
                          & ( ! [X] :
                                ( ~ r1(Y,X)
                                | p2(X)
                                | ~ p101(X) )
                            | ~ p2(Y) ) )
                        | ~ p101(Y) )
                      & ( ( ( ! [X] :
                                ( ~ r1(Y,X)
                                | ~ p1(X)
                                | ~ p100(X) )
                            | p1(Y) )
                          & ( ! [X] :
                                ( ~ r1(Y,X)
                                | p1(X)
                                | ~ p100(X) )
                            | ~ p1(Y) ) )
                        | ~ p100(Y) )
                      & ( p110(Y)
                        | ~ p111(Y) )
                      & ( p109(Y)
                        | ~ p110(Y) )
                      & ( p108(Y)
                        | ~ p109(Y) )
                      & ( p107(Y)
                        | ~ p108(Y) )
                      & ( p106(Y)
                        | ~ p107(Y) )
                      & ( p105(Y)
                        | ~ p106(Y) )
                      & ( p104(Y)
                        | ~ p105(Y) )
                      & ( p103(Y)
                        | ~ p104(Y) )
                      & ( p102(Y)
                        | ~ p103(Y) )
                      & ( p101(Y)
                        | ~ p102(Y) )
                      & ( p100(Y)
                        | ~ p101(Y) ) ) )
                & ~ p101(X)
                & p100(X) ) ) ) )).

%------------------------------------------------------------------------------
