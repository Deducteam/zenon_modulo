%------------------------------------------------------------------------------
% File     : LCL658+1.001 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Logic Calculi (Modal Logic)
% Problem  : In KT, formula with A4 and Dum leading to Dum, size 1
% Version  : Especial.
% English  : A4{box(p0->boxp0) -> p0/p0} & box A4 & Dum & Dum{p0->box p0/p0}
%            -> Dum1.

% Refs     : [BHS00] Balsiger et al. (2000), A Benchmark Method for the Pro
%          : [Kam08] Kaminski (2008), Email to G. Sutcliffe
% Source   : [Kam08]
% Names    : kt_dum_p [BHS00]

% Status   : Theorem
% Rating   : 0.27 v6.1.0, 0.36 v6.0.0, 0.25 v5.5.0, 0.46 v5.4.0, 0.48 v5.3.0, 0.57 v5.2.0, 0.50 v5.1.0, 0.57 v5.0.0, 0.60 v4.1.0, 0.61 v4.0.1, 0.58 v4.0.0
% Syntax   : Number of formulae    :    2 (   1 unit)
%            Number of atoms       :   63 (   0 equality)
%            Maximal formula depth :   27 (  14 average)
%            Number of connectives :  123 (  62 ~  ;  58  |;   3  &)
%                                         (   0 <=>;   0 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    2 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   36 (   0 singleton;  35 !;   1 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : A naive relational encoding of the modal logic problem into
%            first-order logic.
%------------------------------------------------------------------------------
fof(reflexivity,axiom,(
    ! [X] : r1(X,X) )).

fof(main,conjecture,(
    ~ ( ? [X] :
          ~ ( ~ ( ! [Y] :
                    ( ~ r1(X,Y)
                    | ( ( ! [X] :
                            ( ~ r1(Y,X)
                            | p1(X) )
                        | ~ p1(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( ! [Y] :
                                    ( ~ r1(X,Y)
                                    | ! [X] :
                                        ( ~ r1(Y,X)
                                        | p1(X) )
                                    | ~ p1(Y) ) ) )
                        | ~ ( ! [X] :
                                ( ~ r1(Y,X)
                                | ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p1(Y) )
                                | ~ p1(X)
                                | ~ ( ! [Y] :
                                        ( ~ r1(X,Y)
                                        | ! [X] :
                                            ( ~ r1(Y,X)
                                            | ! [Y] :
                                                ( ~ r1(X,Y)
                                                | p1(Y) )
                                            | ~ p1(X) )
                                        | ~ ( ! [X] :
                                                ( ~ r1(Y,X)
                                                | p1(X) )
                                            | ~ p1(Y) ) ) ) ) ) )
                      & ( p1(Y)
                        | ! [X] :
                            ( ~ r1(Y,X)
                            | ~ ( ! [Y] :
                                    ( ~ r1(X,Y)
                                    | p1(Y) ) ) )
                        | ~ ( ! [X] :
                                ( ~ r1(Y,X)
                                | p1(X)
                                | ~ ( ! [Y] :
                                        ( ~ r1(X,Y)
                                        | ! [X] :
                                            ( ~ r1(Y,X)
                                            | p1(X) )
                                        | ~ p1(Y) ) ) ) ) )
                      & ! [X] :
                          ( ~ r1(Y,X)
                          | ! [Y] :
                              ( ~ r1(X,Y)
                              | ! [X] :
                                  ( ~ r1(Y,X)
                                  | p1(X) ) )
                          | ~ ( ! [Y] :
                                  ( ~ r1(X,Y)
                                  | p1(Y) ) ) )
                      & ( ! [X] :
                            ( ~ r1(Y,X)
                            | ! [Y] :
                                ( ~ r1(X,Y)
                                | p1(Y)
                                | ~ ( ! [X] :
                                        ( ~ r1(Y,X)
                                        | ! [Y] :
                                            ( ~ r1(X,Y)
                                            | p1(Y) )
                                        | ~ p1(X) ) ) ) )
                        | ~ ( ! [X] :
                                ( ~ r1(Y,X)
                                | p1(X)
                                | ~ ( ! [Y] :
                                        ( ~ r1(X,Y)
                                        | ! [X] :
                                            ( ~ r1(Y,X)
                                            | p1(X) )
                                        | ~ p1(Y) ) ) ) ) ) ) ) )
            | ~ ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | ! [X] :
                          ( ~ r1(Y,X)
                          | p1(X) )
                      | ! [X] :
                          ( ~ r1(Y,X)
                          | ~ ( ! [Y] :
                                  ( ~ r1(X,Y)
                                  | p1(Y) ) ) )
                      | ~ ( ! [X] :
                              ( ~ r1(Y,X)
                              | p1(X)
                              | ~ ( ! [Y] :
                                      ( ~ r1(X,Y)
                                      | ! [X] :
                                          ( ~ r1(Y,X)
                                          | p1(X) )
                                      | ~ p1(Y) ) ) ) ) ) ) ) ) )).

%------------------------------------------------------------------------------
