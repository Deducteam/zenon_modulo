%--------------------------------------------------------------------------
% File     : MGT036+3 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Management (Organisation Theory)
% Problem  : First movers never outcompete efficient producers.
% Version  : [PM93] axioms.
% English  :

% Refs     : [PM93]  Peli & Masuch (1993), The Logic of Propogation Strateg
%          : [PM94]  Peli & Masuch (1994), The Logic of Propogation Strateg
% Source   : [PM93]
% Names    : THEOREM 5* [PM93]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.00 v2.1.0
% Syntax   : Number of formulae    :    4 (   0 unit)
%            Number of atoms       :   15 (   0 equality)
%            Maximal formula depth :    8 (   6 average)
%            Number of connectives :   11 (   0 ~  ;   0  |;   8  &)
%                                         (   1 <=>;   2 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    5 (   0 propositional; 1-4 arity)
%            Number of functors    :    4 (   3 constant; 0-2 arity)
%            Number of variables   :   12 (   0 singleton;   8 !;   4 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
%----MP. The "pop" predicate is symmetric: if S1 and S2 are subpopulations,
%----then S2 and S1 are also subpopulations.
fof(mp_symmetry_of_subpopulations,axiom,
    ( ! [E,S1,S2,T] :
        ( ( environment(E)
          & subpopulations(S1,S2,E,T) )
       => subpopulations(S2,S1,E,T) ) )).

%----D2. A subpopulation outcompetes an other in an environment at a
%----certain time, if and only if, it has non-negative growth rate while
%----the other subpopulation has negative growth rate.
fof(d2,hypothesis,
    ( ! [E,S1,S2,T] :
        ( ( environment(E)
          & subpopulations(S1,S2,E,T) )
       => ( ( greater_or_equal(growth_rate(S2,T),zero)
            & greater(zero,growth_rate(S1,T)) )
        <=> outcompetes(S2,S1,T) ) ) )).

%----A13*: Efficient producers may decrease in members even when the first
%----mover subpopulation grows or stagnates.
fof(a13_star,hypothesis,
    ( ? [E,T] :
        ( environment(E)
        & subpopulations(first_movers,efficient_producers,E,T)
        & greater_or_equal(growth_rate(first_movers,T),zero)
        & greater(zero,growth_rate(efficient_producers,T)) ) )).

%----GOAL: T5*. First movers may outcompete efficient producers in some
%----environments.
fof(prove_t5_star,conjecture,
    ( ? [E,T] :
        ( environment(E)
        & subpopulations(first_movers,efficient_producers,E,T)
        & outcompetes(first_movers,efficient_producers,T) ) )).

%--------------------------------------------------------------------------
