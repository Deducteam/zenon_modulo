%------------------------------------------------------------------------------
% File     : LCL672+1.001 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Logic Calculi (Modal Logic)
% Problem  : In S4, A5{box p0/p0} & box A5{~p0/p0} -> A5, size 1
% Version  : Especial.
% English  :

% Refs     : [BHS00] Balsiger et al. (2000), A Benchmark Method for the Pro
%          : [Kam08] Kaminski (2008), Email to G. Sutcliffe
% Source   : [Kam08]
% Names    : s4_45_p [BHS00]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.12 v6.0.0, 0.25 v5.4.0, 0.26 v5.3.0, 0.30 v5.2.0, 0.14 v5.0.0, 0.15 v4.1.0, 0.17 v4.0.1, 0.21 v4.0.0
% Syntax   : Number of formulae    :    3 (   1 unit)
%            Number of atoms       :   53 (   0 equality)
%            Maximal formula depth :   24 (  11 average)
%            Number of connectives :  110 (  60 ~  ;  37  |;  12  &)
%                                         (   0 <=>;   1 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    3 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   35 (   0 singleton;  34 !;   1 ?)
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
          ~ ( ( ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | p2(Y) ) )
              & ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | ~ ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ! [Y] :
                                          ( ~ r1(X,Y)
                                          | ~ p1(Y) ) ) ) )
                          & p1(Y) ) ) )
              & ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | p1(Y) ) ) )
            | ( ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | p2(Y) ) )
              & ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | ! [X] :
                          ( ~ r1(Y,X)
                          | ~ ( ~ ( ! [Y] :
                                      ( ~ r1(X,Y)
                                      | ~ ( ! [X] :
                                              ( ~ r1(Y,X)
                                              | p1(X) ) ) ) )
                              & ~ ( ! [Y] :
                                      ( ~ r1(X,Y)
                                      | p1(Y) ) ) ) ) ) )
              & ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | p1(Y) ) ) )
            | ( ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | p2(Y) ) )
              & ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | ~ ( ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ! [Y] :
                                          ( ~ r1(X,Y)
                                          | ~ ( ! [X] :
                                                  ( ~ r1(Y,X)
                                                  | p1(X) ) ) ) ) ) )
                          & ~ ( ! [X] :
                                  ( ~ r1(Y,X)
                                  | ~ ( ! [Y] :
                                          ( ~ r1(X,Y)
                                          | p1(Y) ) ) ) ) ) ) )
              & ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | p1(Y) ) ) )
            | ( ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | p2(Y) ) )
              & ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | ~ ( ! [X] :
                              ( ~ r1(Y,X)
                              | $false ) ) ) )
              & ~ ( ! [Y] :
                      ( ~ r1(X,Y)
                      | p1(Y) ) ) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p2(Y) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | ! [X] :
                    ( ~ r1(Y,X)
                    | ~ ( ! [Y] :
                            ( ~ r1(X,Y)
                            | p1(Y) ) ) )
                | ! [X] :
                    ( ~ r1(Y,X)
                    | p1(X) ) )
            | ! [Y] :
                ( ~ r1(X,Y)
                | p1(Y) ) ) ) )).

%------------------------------------------------------------------------------
