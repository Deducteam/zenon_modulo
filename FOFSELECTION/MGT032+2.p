%--------------------------------------------------------------------------
% File     : MGT032+2 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Management (Organisation Theory)
% Problem  : Selection favours EPs above FMs
% Version  : [PM93] axioms.
% English  : In stable environments, selection favors efficient producers
%            above first movers past a certain point in time.

% Refs     : [PM93]  Peli & Masuch (1993), The Logic of Propogation Strateg
%          : [PM94]  Peli & Masuch (1994), The Logic of Propogation Strateg
%          : [PB+94] Peli et al. (1994), A Logical Approach to Formalizing
%          : [Kam95] Kamps (1995), Email to G. Sutcliffe
% Source   : [PM93]
% Names    : THEOREM 1 [PM93]
%          : T1 [PB+94]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.00 v2.1.0
% Syntax   : Number of formulae    :    3 (   0 unit)
%            Number of atoms       :   16 (   0 equality)
%            Maximal formula depth :    8 (   8 average)
%            Number of connectives :   13 (   0 ~  ;   0  |;   8  &)
%                                         (   0 <=>;   5 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    7 (   0 propositional; 1-4 arity)
%            Number of functors    :    3 (   2 constant; 0-2 arity)
%            Number of variables   :   10 (   0 singleton;   8 !;   2 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
%----MP1. Selection favors subpopulations with higher growth rates.
fof(mp1_high_growth_rates,axiom,
    ( ! [E,S1,S2,T] :
        ( ( environment(E)
          & subpopulations(S1,S2,E,T)
          & greater(growth_rate(S2,T),growth_rate(S1,T)) )
       => selection_favors(S2,S1,T) ) )).

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

%----GOAL: T1. Selection favors efficient producers above first movers
%----past a certain time in stable environments.
fof(prove_t1,conjecture,
    ( ! [E] :
        ( ( environment(E)
          & stable(E) )
       => ? [To] :
            ( in_environment(E,To)
            & ! [T] :
                ( ( subpopulations(first_movers,efficient_producers,E,T)
                  & greater_or_equal(T,To) )
               => selection_favors(efficient_producers,first_movers,T) ) ) ) )).

%--------------------------------------------------------------------------
