%--------------------------------------------------------------------------
% File     : MGT059+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Management (Organisation Theory)
% Problem  : Hazard of mortality is constant during periods of immunity
% Version  : [Han98] axioms.
% English  : An organization's hazard of mortality is constant during periods
%            in which it has immunity.

% Refs     : [Kam00] Kamps (2000), Email to G. Sutcliffe
%            [CH00]  Carroll & Hannan (2000), The Demography of Corporation
%            [Han98] Hannan (1998), Rethinking Age Dependence in Organizati
% Source   : [Kam00]
% Names    : ASSUMPTION 2 [Han98]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.13 v6.0.0, 0.09 v5.5.0, 0.07 v5.4.0, 0.04 v5.3.0, 0.11 v5.2.0, 0.05 v5.0.0, 0.04 v3.7.0, 0.00 v2.4.0
% Syntax   : Number of formulae    :    8 (   0 unit)
%            Number of atoms       :   36 (   9 equality)
%            Maximal formula depth :   12 (   6 average)
%            Number of connectives :   34 (   6 ~  ;   4  |;  12  &)
%                                         (   3 <=>;   9 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    9 (   0 propositional; 1-2 arity)
%            Number of functors    :    6 (   5 constant; 0-2 arity)
%            Number of variables   :   18 (   0 singleton;  18 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : See MGT042+1.p for the mnemonic names.
%--------------------------------------------------------------------------
include('Axioms/MGT001+0.ax').
%--------------------------------------------------------------------------
%----Problem Axioms
%----An organization's immunity. alignment of capability with the
%----current state of the environment and positional advantage jointly
%----affect the hazard of mortality with the following ordinal scaling:
fof(assumption_17,axiom,
    ( ! [X,T] :
        ( organization(X)
       => ( ( has_immunity(X,T)
           => hazard_of_mortality(X,T) = very_low )
          & ( ~ has_immunity(X,T)
           => ( ( ( is_aligned(X,T)
                  & positional_advantage(X,T) )
               => hazard_of_mortality(X,T) = low )
              & ( ( ~ is_aligned(X,T)
                  & positional_advantage(X,T) )
               => hazard_of_mortality(X,T) = mod1 )
              & ( ( is_aligned(X,T)
                  & ~ positional_advantage(X,T) )
               => hazard_of_mortality(X,T) = mod2 )
              & ( ( ~ is_aligned(X,T)
                  & ~ positional_advantage(X,T) )
               => hazard_of_mortality(X,T) = high ) ) ) ) ) )).

%----Problem theorems
%----Text says on p.152 ``These assumptions [A17,A18] have the same effect
%----  as assumptions 2 and 3 in the formalization used in section III.''
%----This is indeed the case for these assumptions are now derivable.
%----A2 from A17 (no inequalities needed).
%----
%----An organization's hazard of mortality is constant during periods
%----in which it has immunity.
fof(assumption_2,conjecture,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & has_immunity(X,T0)
          & has_immunity(X,T) )
       => hazard_of_mortality(X,T0) = hazard_of_mortality(X,T) ) )).

%--------------------------------------------------------------------------
