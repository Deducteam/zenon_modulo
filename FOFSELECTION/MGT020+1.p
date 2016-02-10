%--------------------------------------------------------------------------
% File     : MGT020+1 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Management (Organisation Theory)
% Problem  : First movers exceeds efficient producers disbanding rate
% Version  : [PB+94] axioms.
% English  :

% Refs     : [PM93]  Peli & Masuch (1993), The Logic of Propogation Strateg
%          : [PM94]  Peli & Masuch (1994), The Logic of Propogation Strateg
%          : [PB+94] Peli et al. (1994), A Logical Approach to Formalizing
%          : [Kam95] Kamps (1995), Email to G. Sutcliffe
% Source   : [Kam95]
% Names    : LEMMA 2 [PM93]
%          : L2 [PB+94]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.13 v5.5.0, 0.07 v5.3.0, 0.15 v5.2.0, 0.00 v5.0.0, 0.08 v4.1.0, 0.09 v4.0.0, 0.08 v3.7.0, 0.05 v3.4.0, 0.11 v3.3.0, 0.14 v3.2.0, 0.18 v3.1.0, 0.22 v2.7.0, 0.17 v2.6.0, 0.29 v2.5.0, 0.38 v2.4.0, 0.00 v2.1.0
% Syntax   : Number of formulae    :   11 (   0 unit)
%            Number of atoms       :   42 (   1 equality)
%            Maximal formula depth :   10 (   6 average)
%            Number of connectives :   33 (   2 ~  ;   1  |;  16  &)
%                                         (   0 <=>;  14 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    7 (   0 propositional; 1-4 arity)
%            Number of functors    :    6 (   2 constant; 0-2 arity)
%            Number of variables   :   26 (   0 singleton;  26 !;   0 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Same as version with [PM93] axioms.
%--------------------------------------------------------------------------
%----Subsitution axioms
%----Problem axioms
%----L3. The difference between the disbanding rates of first movers and
%----efficient producers does not decrease.
fof(l3,axiom,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => ~ decreases(difference(disbanding_rate(first_movers,T),disbanding_rate(efficient_producers,T))) ) )).

%----MP. The initial time point of the environment is the earliest time,
%----when both FM and EP are present in the environment.
fof(mp_earliest_time_point,axiom,
    ( ! [E,T] :
        ( environment(E)
       => ( ( in_environment(E,initial_FM_EP(E))
           => subpopulations(first_movers,efficient_producers,E,initial_FM_EP(E)) )
          & ( subpopulations(first_movers,efficient_producers,E,T)
           => greater_or_equal(T,initial_FM_EP(E)) ) ) ) )).

%----MP. If f1(x1) > f2(x1) and f1(x)-f2(x) does not decrease on [x1,x2]
%----then f1(x2) > f2(x2).
%----INSTANTIATION: f1(x) = disbanding_rate(first_movers,x) ;
%----f2(x) = disbanding_rate(efficient_producers,x)
fof(mp_positive_function_difference,axiom,
    ( ! [E,T,T1,T2] :
        ( ( environment(E)
          & greater_or_equal(T,T1)
          & greater_or_equal(T2,T)
          & subpopulations(first_movers,efficient_producers,E,T2)
          & greater(disbanding_rate(first_movers,T1),disbanding_rate(efficient_producers,T1)) )
       => ( ~ decreases(difference(disbanding_rate(first_movers,T),disbanding_rate(efficient_producers,T)))
         => greater(disbanding_rate(first_movers,T2),disbanding_rate(efficient_producers,T2)) ) ) )).

%----MP. If FM and EP are non-empty subpopulations at a time -point in the
%----environment, then this time point occurs while the environment
%----persists.
fof(mp_time_point_occurs,axiom,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => in_environment(E,T) ) )).

%----MP. The initial time of an environment cannot precede the opening of
%----this environment.
fof(mp_initial_time,axiom,
    ( ! [E] :
        ( environment(E)
       => greater_or_equal(initial_FM_EP(E),start_time(E)) ) )).

%----MP. If time point T1 occurs after the opening of the environment, and
%----a later time point T2 occurs before the environment ends, then T1 also
%----occurs before the end of the environment.
fof(mp_times_in_order,axiom,
    ( ! [E,T1,T2] :
        ( ( environment(E)
          & greater_or_equal(T1,start_time(E))
          & greater(T2,T1)
          & in_environment(E,T2) )
       => in_environment(E,T1) ) )).

%----MP. inequality
fof(mp_greater_transitivity,axiom,
    ( ! [X,Y,Z] :
        ( ( greater(X,Y)
          & greater(Y,Z) )
       => greater(X,Z) ) )).

%----MP. on "greater or equal to"
fof(mp_greater_or_equal,axiom,
    ( ! [X,Y] :
        ( greater_or_equal(X,Y)
       => ( greater(X,Y)
          | X = Y ) ) )).

%----A8. The disbanding rate of first movers exceeds the disbanding rate
%----of efficient producers initially.
fof(a8,hypothesis,
    ( ! [E] :
        ( environment(E)
       => greater(disbanding_rate(first_movers,initial_FM_EP(E)),disbanding_rate(efficient_producers,initial_FM_EP(E))) ) )).

%----A10. If FM and EP are present in the environment at time-points t1
%----and t2, then they are present during the time-interval between
%----t1 and t2.
fof(a10,hypothesis,
    ( ! [E,T1,T2,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T1)
          & subpopulations(first_movers,efficient_producers,E,T2)
          & greater_or_equal(T,T1)
          & greater_or_equal(T2,T) )
       => subpopulations(first_movers,efficient_producers,E,T) ) )).

%----GOAL: L2. The disbanding rate of first movers exceeds the disbanding
%----rate of efficient producers.
fof(prove_l2,conjecture,
    ( ! [E,T] :
        ( ( environment(E)
          & subpopulations(first_movers,efficient_producers,E,T) )
       => greater(disbanding_rate(first_movers,T),disbanding_rate(efficient_producers,T)) ) )).

%--------------------------------------------------------------------------
