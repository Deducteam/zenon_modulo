%--------------------------------------------------------------------------
% File     : MGT030+1 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Management (Organisation Theory)
% Problem  : Earliest time point when FM growth rate exceeds EP growth rate
% Version  : [PB+94] axioms : Reduced & Augmented > Complete.
% English  : There is an earliest time point, past which FM's growth
%            rate exceeds EP's growth rate.

% Refs     : [PM93]  Peli & Masuch (1993), The Logic of Propogation Strateg
%          : [PM94]  Peli & Masuch (1994), The Logic of Propogation Strateg
%          : [Kam95] Kamps (1995), Email to G. Sutcliffe
% Source   : [Kam95]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0, 0.07 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.05 v3.7.0, 0.00 v2.1.0
% Syntax   : Number of formulae    :    3 (   0 unit)
%            Number of atoms       :   23 (   0 equality)
%            Maximal formula depth :    9 (   9 average)
%            Number of connectives :   22 (   2 ~  ;   0  |;  13  &)
%                                         (   0 <=>;   7 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-4 arity)
%            Number of functors    :    3 (   2 constant; 0-2 arity)
%            Number of variables   :   11 (   0 singleton;   7 !;   4 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
%----MP. If EP's growth rate exceeds FM's growth rate past a certain time,
%----then there is an earliest time point, past which FM's growth rate
%----exceeds EP's growth rate.
fof(mp_earliest_time_growth_rate_exceeds,axiom,
    ( ! [E] :
        ( ( environment(E)
          & ? [To] :
              ( in_environment(E,To)
              & ! [T] :
                  ( ( subpopulations(first_movers,efficient_producers,E,T)
                    & greater_or_equal(T,To) )
                 => greater(growth_rate(efficient_producers,T),growth_rate(first_movers,T)) ) ) )
       => ? [To] :
            ( in_environment(E,To)
            & ~ greater(growth_rate(efficient_producers,To),growth_rate(first_movers,To))
            & ! [T] :
                ( ( subpopulations(first_movers,efficient_producers,E,T)
                  & greater(T,To) )
               => greater(growth_rate(efficient_producers,T),growth_rate(first_movers,T)) ) ) ) )).

%----L1. The growth rate of efficient producers exceeds the growth rate of
%----first movers past a certain time in stable environments.
fof(l1,hypothesis,
    ( ! [E] :
        ( ( environment(E)
          & stable(E) )
       => ? [To] :
            ( in_environment(E,To)
            & ! [T] :
                ( ( subpopulations(first_movers,efficient_producers,E,T)
                  & greater_or_equal(T,To) )
               => greater(growth_rate(efficient_producers,T),growth_rate(first_movers,T)) ) ) ) )).

%----GOAL:L12. There is an earliest time point, past which FM's growth
%----rate exceeds EP's growth rate.
fof(prove_l12,conjecture,
    ( ! [E] :
        ( ( environment(E)
          & stable(E) )
       => ? [To] :
            ( in_environment(E,To)
            & ~ greater(growth_rate(efficient_producers,To),growth_rate(first_movers,To))
            & ! [T] :
                ( ( subpopulations(first_movers,efficient_producers,E,T)
                  & greater(T,To) )
               => greater(growth_rate(efficient_producers,T),growth_rate(first_movers,T)) ) ) ) )).

%--------------------------------------------------------------------------
