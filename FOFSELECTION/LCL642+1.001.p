%------------------------------------------------------------------------------
% File     : LCL642+1.001 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Logic Calculi (Modal Logic)
% Problem  : In K, box Grz & Grz{C() & A4{C()/p0}/p0} -> Grz1, size 1
% Version  : Especial.
% English  :

% Refs     : [BHS00] Balsiger et al. (2000), A Benchmark Method for the Pro
%          : [Kam08] Kaminski (2008), Email to G. Sutcliffe
% Source   : [Kam08]
% Names    : k_grz_p [BHS00]

% Status   : Theorem
% Rating   : 0.18 v6.1.0, 0.28 v6.0.0, 0.25 v5.5.0, 0.46 v5.4.0, 0.43 v5.3.0, 0.52 v5.2.0, 0.29 v5.0.0, 0.55 v4.1.0, 0.50 v4.0.1, 0.42 v4.0.0
% Syntax   : Number of formulae    :    1 (   0 unit)
%            Number of atoms       :  107 (   0 equality)
%            Maximal formula depth :   37 (  37 average)
%            Number of connectives :  207 ( 101 ~  ; 101  |;   5  &)
%                                         (   0 <=>;   0 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   56 (   0 singleton;  55 !;   1 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : A naive relational encoding of the modal logic problem into
%            first-order logic.
%------------------------------------------------------------------------------
fof(main,conjecture,(
    ~ ( ? [X] :
          ~ ( ! [Y] :
                ( ~ r1(X,Y)
                | p3(Y) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | p3(Y)
                    | ~ ( ! [X] :
                            ( ~ r1(Y,X)
                            | ! [Y] :
                                ( ~ r1(X,Y)
                                | p3(Y) )
                            | ~ p3(X) ) ) ) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p2(Y) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | p2(Y)
                    | ~ ( ! [X] :
                            ( ~ r1(Y,X)
                            | ! [Y] :
                                ( ~ r1(X,Y)
                                | p2(Y) )
                            | ~ p2(X) ) ) ) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p1(Y) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | p1(Y)
                    | ~ ( ! [X] :
                            ( ~ r1(Y,X)
                            | ! [Y] :
                                ( ~ r1(X,Y)
                                | p1(Y) )
                            | ~ p1(X) ) ) ) )
            | ~ ( ( ( ( ! [Y] :
                          ( ~ r1(X,Y)
                          | ! [X] :
                              ( ~ r1(Y,X)
                              | p2(X)
                              | ~ ( ! [Y] :
                                      ( ~ r1(X,Y)
                                      | ! [X] :
                                          ( ~ r1(Y,X)
                                          | p2(X) )
                                      | ~ p2(Y) ) ) ) )
                      | ~ ( ! [Y] :
                              ( ~ r1(X,Y)
                              | p2(Y)
                              | ~ ( ! [X] :
                                      ( ~ r1(Y,X)
                                      | ! [Y] :
                                          ( ~ r1(X,Y)
                                          | p2(Y) )
                                      | ~ p2(X) ) ) ) ) )
                    & ( p2(X)
                      | ~ ( ! [Y] :
                              ( ~ r1(X,Y)
                              | ! [X] :
                                  ( ~ r1(Y,X)
                                  | p2(X) )
                              | ~ p2(Y) ) ) ) )
                  | ~ ( ! [Y] :
                          ( ~ r1(X,Y)
                          | ( ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ! [Y] :
                                      ( ~ r1(X,Y)
                                      | p2(Y)
                                      | ~ ( ! [X] :
                                              ( ~ r1(Y,X)
                                              | ! [Y] :
                                                  ( ~ r1(X,Y)
                                                  | p2(Y) )
                                              | ~ p2(X) ) ) ) )
                              | ~ ( ! [X] :
                                      ( ~ r1(Y,X)
                                      | p2(X)
                                      | ~ ( ! [Y] :
                                              ( ~ r1(X,Y)
                                              | ! [X] :
                                                  ( ~ r1(Y,X)
                                                  | p2(X) )
                                              | ~ p2(Y) ) ) ) ) )
                            & ( p2(Y)
                              | ~ ( ! [X] :
                                      ( ~ r1(Y,X)
                                      | ! [Y] :
                                          ( ~ r1(X,Y)
                                          | p2(Y) )
                                      | ~ p2(X) ) ) ) )
                          | ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ! [Y] :
                                      ( ~ r1(X,Y)
                                      | ( ( ! [X] :
                                              ( ~ r1(Y,X)
                                              | ! [Y] :
                                                  ( ~ r1(X,Y)
                                                  | p2(Y)
                                                  | ~ ( ! [X] :
                                                          ( ~ r1(Y,X)
                                                          | ! [Y] :
                                                              ( ~ r1(X,Y)
                                                              | p2(Y) )
                                                          | ~ p2(X) ) ) ) )
                                          | ~ ( ! [X] :
                                                  ( ~ r1(Y,X)
                                                  | p2(X)
                                                  | ~ ( ! [Y] :
                                                          ( ~ r1(X,Y)
                                                          | ! [X] :
                                                              ( ~ r1(Y,X)
                                                              | p2(X) )
                                                          | ~ p2(Y) ) ) ) ) )
                                        & ( p2(Y)
                                          | ~ ( ! [X] :
                                                  ( ~ r1(Y,X)
                                                  | ! [Y] :
                                                      ( ~ r1(X,Y)
                                                      | p2(Y) )
                                                  | ~ p2(X) ) ) ) ) )
                                  | ~ ( ( ! [Y] :
                                            ( ~ r1(X,Y)
                                            | ! [X] :
                                                ( ~ r1(Y,X)
                                                | p2(X)
                                                | ~ ( ! [Y] :
                                                        ( ~ r1(X,Y)
                                                        | ! [X] :
                                                            ( ~ r1(Y,X)
                                                            | p2(X) )
                                                        | ~ p2(Y) ) ) ) )
                                        | ~ ( ! [Y] :
                                                ( ~ r1(X,Y)
                                                | p2(Y)
                                                | ~ ( ! [X] :
                                                        ( ~ r1(Y,X)
                                                        | ! [Y] :
                                                            ( ~ r1(X,Y)
                                                            | p2(Y) )
                                                        | ~ p2(X) ) ) ) ) )
                                      & ( p2(X)
                                        | ~ ( ! [Y] :
                                                ( ~ r1(X,Y)
                                                | ! [X] :
                                                    ( ~ r1(Y,X)
                                                    | p2(X) )
                                                | ~ p2(Y) ) ) ) ) ) ) ) ) )
                & ! [Y] :
                    ( ~ r1(X,Y)
                    | p2(Y)
                    | ~ ( ! [X] :
                            ( ~ r1(Y,X)
                            | p2(X)
                            | ~ ( ! [Y] :
                                    ( ~ r1(X,Y)
                                    | ! [X] :
                                        ( ~ r1(Y,X)
                                        | p2(X) )
                                    | ~ p2(Y) ) ) ) ) ) ) ) ) )).

%------------------------------------------------------------------------------
