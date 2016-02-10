%------------------------------------------------------------------------------
% File     : LCL660+1.001 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Logic Calculi (Modal Logic)
% Problem  : In KT, box Grz & Grz{C() & A4{C()/p0}/p0} -> Grz1, size 1
% Version  : Especial.
% English  :

% Refs     : [BHS00] Balsiger et al. (2000), A Benchmark Method for the Pro
%          : [Kam08] Kaminski (2008), Email to G. Sutcliffe
% Source   : [Kam08]
% Names    : kt_grz_p [BHS00]

% Status   : Theorem
% Rating   : 0.45 v6.1.0, 0.60 v6.0.0, 0.25 v5.5.0, 0.71 v5.4.0, 0.65 v5.3.0, 0.74 v5.2.0, 0.64 v5.0.0, 0.80 v4.1.0, 0.83 v4.0.1, 0.84 v4.0.0
% Syntax   : Number of formulae    :    2 (   1 unit)
%            Number of atoms       :  121 (   0 equality)
%            Maximal formula depth :   37 (  20 average)
%            Number of connectives :  235 ( 116 ~  ; 112  |;   7  &)
%                                         (   0 <=>;   0 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    5 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   64 (   0 singleton;  63 !;   1 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : A naive relational encoding of the modal logic problem into
%            first-order logic.
%------------------------------------------------------------------------------
fof(reflexivity,axiom,(
    ! [X] : r1(X,X) )).

fof(main,conjecture,(
    ~ ( ? [X] :
          ~ ( ( ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | ~ p3(Y) ) )
              & ( ! [Y] :
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
                                | ~ p2(X) ) ) ) ) ) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p4(Y) )
            | ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | p4(Y)
                    | ~ ( ! [X] :
                            ( ~ r1(Y,X)
                            | ! [Y] :
                                ( ~ r1(X,Y)
                                | p4(Y) )
                            | ~ p4(X) ) ) ) )
            | ( ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | ~ ( ! [X] :
                              ( ~ r1(Y,X)
                              | ~ p3(X) ) ) ) )
              & ( ! [Y] :
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
                                | ~ p2(X) ) ) ) ) ) )
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
