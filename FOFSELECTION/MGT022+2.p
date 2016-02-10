%--------------------------------------------------------------------------
% File     : MGT022+2 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Management (Organisation Theory)
% Problem  : Decreasing resource availability affects FMS more than EPs
% Version  : [PM93] axioms.
% English  : Decreasing resource availability affects the disbanding rate
%            of first movers more than the disbanding rate of efficient
%            producers.

% Refs     : [PM93]  Peli & Masuch (1993), The Logic of Propogation Strateg
%          : [PM94]  Peli & Masuch (1994), The Logic of Propogation Strateg
%          : [PB+94] Peli et al. (1994), A Logical Approach to Formalizing
% Source   : [PM93]
% Names    : LEMMA 4 [PM93]
%          : L4 [PB+94]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.00 v2.1.0
% Syntax   : Number of formulae    :    4 (   1 unit)
%            Number of atoms       :   16 (   0 equality)
%            Maximal formula depth :    8 (   5 average)
%            Number of connectives :   14 (   2 ~  ;   0  |;   5  &)
%                                         (   0 <=>;   7 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-4 arity)
%            Number of functors    :    6 (   2 constant; 0-2 arity)
%            Number of variables   :    7 (   0 singleton;   7 !;   0 ?)
%            Maximal term depth    :    3 (   2 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
%----MP. If something is constant, then it does not decreases.
fof(mp_constant_not_decrease,axiom,
    ( ! [X] :
        ( constant(X)
       => ~ decreases(X) ) )).

%----A6. Less resilient subpopulations are more affected by decreasing
%----resource availability.
fof(a6,hypothesis,
    ( ! [E,S1,S2,T] :
        ( ( environment(E)
          & subpopulations(S1,S2,E,T)
          & greater(resilience(S2),resilience(S1)) )
       => ( ( decreases(resources(E,T))
           => increases(difference(disbanding_rate(S1,T),disbanding_rate(S2,T))) )
          & ( constant(resources(E,T))
           => constant(difference(disbanding_rate(S1,T),disbanding_rate(S2,T))) ) ) ) )).

%----A2. Efficient producers are more resilient than first movers.
fof(a2,hypothesis,
    ( greater(resilience(efficient_producers),resilience(first_movers)) )).

%----GOAL: L4. A decreasing resource availability affects the disbanding
%----rate of first movers more than the disbanding rate of efficient
%----producers.
fof(prove_l4,conjecture,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => ( ( decreases(resources(E,T))
           => increases(difference(disbanding_rate(first_movers,T),disbanding_rate(efficient_producers,T))) )
          & ( constant(resources(E,T))
           => ~ decreases(difference(disbanding_rate(first_movers,T),disbanding_rate(efficient_producers,T))) ) ) ) )).

%--------------------------------------------------------------------------
