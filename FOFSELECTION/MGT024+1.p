%--------------------------------------------------------------------------
% File     : MGT024+1 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Management (Organisation Theory)
% Problem  : Subpopulation growth rates are in equilibria
% Version  : [PB+94] axioms : Reduced & Augmented > Complete.
% English  : If a subpopulation has positive growth rate, then the other
%            subpopulation must have negative growth rate in equilibrium.

% Refs     : [PM93]  Peli & Masuch (1993), The Logic of Propogation Strateg
%          : [PM94]  Peli & Masuch (1994), The Logic of Propogation Strateg
%          : [Kam95] Kamps (1995), Email to G. Sutcliffe
% Source   : [Kam95]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.03 v6.0.0, 0.04 v5.4.0, 0.07 v5.3.0, 0.15 v5.2.0, 0.00 v4.1.0, 0.04 v4.0.0, 0.08 v3.7.0, 0.05 v3.4.0, 0.11 v3.3.0, 0.00 v3.2.0, 0.09 v3.1.0, 0.00 v2.5.0, 0.12 v2.4.0, 0.25 v2.3.0, 0.33 v2.2.1, 0.00 v2.1.0
% Syntax   : Number of formulae    :    7 (   0 unit)
%            Number of atoms       :   40 (   4 equality)
%            Maximal formula depth :    7 (   6 average)
%            Number of connectives :   36 (   3 ~  ;   4  |;  18  &)
%                                         (   0 <=>;  11 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    8 (   0 propositional; 1-4 arity)
%            Number of functors    :    7 (   3 constant; 0-2 arity)
%            Number of variables   :   14 (   0 singleton;  14 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Subsitution axioms
%----Problem axioms
%----MP. The time points when FM and EP are present in the environment
%----occur during the environment sustains.
fof(mp_time_point_occur,axiom,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => in_environment(E,T) ) )).

%----MP. If both subpopulations are present in the environment, then the
%----number of organizations is positive in this environment.
fof(mp_positive_number_of_organizations,axiom,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => greater(number_of_organizations(E,T),zero) ) )).

%----MP. on equilibrium
fof(mp_equilibrium,axiom,
    ( ! [E,T] :
        ( ( environment(E)
          & greater_or_equal(T,equilibrium(E)) )
       => ~ greater(equilibrium(E),T) ) )).

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

%----A6. If resource availability decreases, then the number of
%----organizations increases or constant.
fof(a6,hypothesis,
    ( ! [E,T] :
        ( ( environment(E)
          & in_environment(E,T) )
       => ( ( decreases(resources(E,T))
           => ~ decreases(number_of_organizations(E,T)) )
          & ( constant(resources(E,T))
           => constant(number_of_organizations(E,T)) ) ) ) )).

%----L7. If one of the two subpopulations has positive growth rate, then
%----the other subpopulation must have negative growth rate if the total
%----number of organizations is constant.
fof(l7,hypothesis,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T)
          & constant(number_of_organizations(E,T)) )
       => ( ( growth_rate(first_movers,T) = zero
            & growth_rate(efficient_producers,T) = zero )
          | ( greater(growth_rate(first_movers,T),zero)
            & greater(zero,growth_rate(efficient_producers,T)) )
          | ( greater(growth_rate(efficient_producers,T),zero)
            & greater(zero,growth_rate(first_movers,T)) ) ) ) )).

%----GOAL: L6. If a subpopulation has positive growth rate, then the
%----other subpopulation must have negative growth rate in equilibrium.
fof(prove_l6,conjecture,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T)
          & greater_or_equal(T,equilibrium(E)) )
       => ( ( growth_rate(first_movers,T) = zero
            & growth_rate(efficient_producers,T) = zero )
          | ( greater(growth_rate(first_movers,T),zero)
            & greater(zero,growth_rate(efficient_producers,T)) )
          | ( greater(growth_rate(efficient_producers,T),zero)
            & greater(zero,growth_rate(first_movers,T)) ) ) ) )).

%--------------------------------------------------------------------------
