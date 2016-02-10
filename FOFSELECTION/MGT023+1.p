%--------------------------------------------------------------------------
% File     : MGT023+1 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Management (Organisation Theory)
% Problem  : Stable environments have a critical point.
% Version  : [PB+94] axioms : Reduced & Augmented > Complete.
% English  :

% Refs     : [PM93]  Peli & Masuch (1993), The Logic of Propogation Strateg
%          : [PM94]  Peli & Masuch (1994), The Logic of Propogation Strateg
%          : [Kam95] Kamps (1995), Email to G. Sutcliffe
% Source   : [Kam95]
% Names    :

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.10 v6.0.0, 0.04 v5.3.0, 0.07 v5.2.0, 0.00 v5.0.0, 0.04 v3.7.0, 0.00 v3.4.0, 0.05 v3.3.0, 0.07 v3.2.0, 0.09 v3.1.0, 0.11 v2.7.0, 0.17 v2.6.0, 0.29 v2.5.0, 0.25 v2.4.0, 0.00 v2.1.0
% Syntax   : Number of formulae    :    3 (   0 unit)
%            Number of atoms       :   17 (   1 equality)
%            Maximal formula depth :   10 (   8 average)
%            Number of connectives :   16 (   2 ~  ;   0  |;   9  &)
%                                         (   0 <=>;   5 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-4 arity)
%            Number of functors    :    4 (   2 constant; 0-2 arity)
%            Number of variables   :    7 (   0 singleton;   6 !;   1 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Subsitution axioms
%----Problem axioms
%----D1=>. A time point is the critical point of an environmental patch,
%----if and only if, it is the earliest time past which the growth rate of
%----efficient producers permanently exceeds growth rate of first movers.
fof(d1,hypothesis,
    ( ! [E,To] :
        ( ( environment(E)
          & ~ greater(growth_rate(efficient_producers,To),growth_rate(first_movers,To))
          & in_environment(E,To)
          & ! [T] :
              ( ( subpopulations(first_movers,efficient_producers,E,T)
                & greater(T,To) )
             => greater(growth_rate(efficient_producers,T),growth_rate(first_movers,T)) ) )
       => To = critical_point(E) ) )).

%----L12. There is an earliest time point, past which FM's growth rate
%----exceeds EP's growth rate.
fof(l12,hypothesis,
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

%----GOAL: L5. Stable environments have a critical point.
fof(prove_l5,conjecture,
    ( ! [E] :
        ( ( environment(E)
          & stable(E) )
       => in_environment(E,critical_point(E)) ) )).

%--------------------------------------------------------------------------
