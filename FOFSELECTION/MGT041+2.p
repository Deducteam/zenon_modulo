%--------------------------------------------------------------------------
% File     : MGT041+2 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Management (Organisation Theory)
% Problem  : There are non-FM and non-EP organisations
% Version  : [PM93] axioms.
% English  : There are non-first mover and non-efficient producers
%            organisations.

% Refs     : [PM93]  Peli & Masuch (1993), The Logic of Propogation Strateg
%          : [PM94]  Peli & Masuch (1994), The Logic of Propogation Strateg
%          : [Kam95] Kamps (1995), Email to G. Sutcliffe
% Source   : [PM93]
% Names    : Theorem 10 [PM93]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v3.2.0, 0.11 v3.1.0, 0.00 v2.5.0, 0.33 v2.4.0, 0.33 v2.2.1, 0.00 v2.1.0
% Syntax   : Number of formulae    :    5 (   0 unit)
%            Number of atoms       :   17 (   0 equality)
%            Maximal formula depth :    7 (   6 average)
%            Number of connectives :   16 (   4 ~  ;   0  |;  10  &)
%                                         (   0 <=>;   2 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-3 arity)
%            Number of functors    :    2 (   2 constant; 0-0 arity)
%            Number of variables   :   10 (   0 singleton;   6 !;   4 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments :
%--------------------------------------------------------------------------
%----MP. The number of routines cannot be low and high at the same time.
fof(mp_not_high_and_low,axiom,
    ( ! [X,T] : ~ ( number_of_routines(X,T,low)
        & number_of_routines(X,T,high) ) )).

%----A14. Efficient producer organizations have elaborated routines at
%----their founding.
fof(a14,hypothesis,
    ( ! [X,T] :
        ( ( organisation_at_time(X,T)
          & efficient_producer(X)
          & founding_time(X,T) )
       => has_elaborated_routines(X,T) ) )).

%----A15. First mover organizations have only a few routines at their
%----founding.
fof(a15,hypothesis,
    ( ! [X,T] :
        ( ( organisation_at_time(X,T)
          & first_mover(X)
          & founding_time(X,T) )
       => number_of_routines(X,T,low) ) )).

%----A16. Some organizations come to birth with several, but poorly
%----elaborated routines are not elaborated.
fof(a16,hypothesis,
    ( ? [X,T] :
        ( organisation_at_time(X,T)
        & founding_time(X,T)
        & number_of_routines(X,T,high)
        & ~ has_elaborated_routines(X,T) ) )).

%----GOAL: T10. There are are non-first movers and non-efficient producer
%----organizations.
fof(prove_t10,conjecture,
    ( ? [X,T] :
        ( organisation_at_time(X,T)
        & ~ first_mover(X)
        & ~ efficient_producer(X) ) )).

%--------------------------------------------------------------------------
