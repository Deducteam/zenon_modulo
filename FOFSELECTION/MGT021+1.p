%--------------------------------------------------------------------------
% File     : MGT021+1 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Management (Organisation Theory)
% Problem  : Difference between disbanding rates does not decrease
% Version  : [PB+94] axioms.
% English  : The difference between the disbanding rates of first movers
%            and efficient producers does not decrease with time.

% Refs     : [PM93]  Peli & Masuch (1993), The Logic of Propogation Strateg
%          : [PM94]  Peli & Masuch (1994), The Logic of Propogation Strateg
%          : [PB+94] Peli et al. (1994), A Logical Approach to Formalizing
%          : [Kam95] Kamps (1995), Email to G. Sutcliffe
% Source   : [Kam95]
% Names    : LEMMA 3 [PM93]
%          : L3 [PB+94]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.07 v6.0.0, 0.04 v5.3.0, 0.11 v5.2.0, 0.00 v3.2.0, 0.09 v3.1.0, 0.00 v2.5.0, 0.12 v2.4.0, 0.25 v2.3.0, 0.33 v2.2.1, 0.00 v2.1.0
% Syntax   : Number of formulae    :    7 (   0 unit)
%            Number of atoms       :   27 (   1 equality)
%            Maximal formula depth :    7 (   5 average)
%            Number of connectives :   24 (   4 ~  ;   1  |;   8  &)
%                                         (   0 <=>;  11 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    9 (   0 propositional; 1-4 arity)
%            Number of functors    :    8 (   3 constant; 0-2 arity)
%            Number of variables   :   13 (   0 singleton;  13 !;   0 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Same as version with [PM93] axioms.
%--------------------------------------------------------------------------
%----Subsitution axioms
%----Problem axioms
%----MP. If first movers and efficient producers are present in an
%----environment  at a certain point of time, then this time-point belongs
%----to the the environment.
fof(mp_time_point_in_environment,axiom,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => in_environment(E,T) ) )).

%----MP. If first movers and efficient producers are present in an
%----environment  at a certain point of time, then then the environment
%----is not empty at this time.
fof(mp_environment_not_empty,axiom,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => greater(number_of_organizations(E,T),zero) ) )).

%----MP. If something increases, then it does not decrease.
fof(mp_increase_not_decrease,axiom,
    ( ! [X] :
        ( increases(X)
       => ~ decreases(X) ) )).

%----MP. on "greater or equal to"
fof(mp_greater_or_equal,axiom,
    ( ! [X,Y] :
        ( greater_or_equal(X,Y)
       => ( greater(X,Y)
          | X = Y ) ) )).

%----A3. Resource availability decreases until equilibrium is reached.
fof(a3,hypothesis,
    ( ! [E,T] :
        ( ( environment(E)
          & in_environment(E,T)
          & greater(number_of_organizations(E,T),zero) )
       => ( ( greater(equilibrium(E),T)
           => decreases(resources(E,T)) )
          & ( ~ greater(equilibrium(E),T)
           => constant(resources(E,T)) ) ) ) )).

%----L4. A decreasing resource availability affects the disbanding rate of
%----first movers more than the disbanding rate of efficient producers.
fof(l4,hypothesis,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => ( ( decreases(resources(E,T))
           => increases(difference(disbanding_rate(first_movers,T),disbanding_rate(efficient_producers,T))) )
          & ( constant(resources(E,T))
           => ~ decreases(difference(disbanding_rate(first_movers,T),disbanding_rate(efficient_producers,T))) ) ) ) )).

%----GOAL: L3. The difference between the disbanding rates of first movers
%----and efficient producers does not decrease.
fof(prove_l3,conjecture,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => ~ decreases(difference(disbanding_rate(first_movers,T),disbanding_rate(efficient_producers,T))) ) )).

%--------------------------------------------------------------------------
