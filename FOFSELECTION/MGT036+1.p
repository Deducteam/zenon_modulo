%--------------------------------------------------------------------------
% File     : MGT036+1 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Management (Organisation Theory)
% Problem  : First movers never outcompete efficient producers.
% Version  : [PB+94] axioms : Reduced & Augmented > Complete.
% English  :

% Refs     : [PM93]  Peli & Masuch (1993), The Logic of Propogation Strateg
%          : [PM94]  Peli & Masuch (1994), The Logic of Propogation Strateg
%          : [Kam95] Kamps (1995), Email to G. Sutcliffe
% Source   : [Kam95]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.12 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0, 0.07 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.05 v3.7.0, 0.00 v2.1.0
% Syntax   : Number of formulae    :    7 (   1 unit)
%            Number of atoms       :   24 (   0 equality)
%            Maximal formula depth :   10 (   6 average)
%            Number of connectives :   21 (   4 ~  ;   0  |;   9  &)
%                                         (   2 <=>;   6 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-4 arity)
%            Number of functors    :    5 (   3 constant; 0-2 arity)
%            Number of variables   :   18 (   0 singleton;  18 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
%----MP. The "pop" predicate is symmetric: if FM and EP are subpopulations,
%----then EP and FM are also subpopulations.
fof(mp_symmetry_of_FM_and_EP,axiom,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => subpopulations(efficient_producers,first_movers,E,T) ) )).

%----MP. The time points when FM and EP are present in the environment
%----occur during the environment sustains.
fof(mp_time_point_occur,axiom,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => in_environment(E,T) ) )).

%----MP. on "greater or equal to"
fof(mp_growth_rate_relationships,axiom,
    ( ! [E,S1,S2,T] :
        ( ( ( environment(E)
            & subpopulations(S1,S2,E,T) )
         => greater_or_equal(growth_rate(S1,T),zero) )
      <=> ~ greater(zero,growth_rate(S1,T)) ) )).

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

%----A12. If a subpopulation does not decrease in members, then a more
%----resilient subpopulation does not decrease either.
fof(a12,hypothesis,
    ( ! [E,S1,S2,T] :
        ( ( environment(E)
          & in_environment(E,T)
          & ~ greater(zero,growth_rate(S1,T))
          & greater(resilience(S2),resilience(S1)) )
       => ~ greater(zero,growth_rate(S2,T)) ) )).

%----A2. Efficient producers are more resilient than first movers.
fof(a2,hypothesis,
    ( greater(resilience(efficient_producers),resilience(first_movers)) )).

%----GOAL: T5. First movers never outcompete efficient producers.
fof(prove_t5,conjecture,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => ~ outcompetes(first_movers,efficient_producers,T) ) )).

%--------------------------------------------------------------------------
