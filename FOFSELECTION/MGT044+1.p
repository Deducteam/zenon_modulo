%--------------------------------------------------------------------------
% File     : MGT044+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Management (Organisation Theory)
% Problem  : Capability increases monotonically with age
% Version  : [Han98] axioms.
% English  : An organization's capability increases monotonically with its age.

% Refs     : [Kam00] Kamps (2000), Email to G. Sutcliffe
%            [CH00]  Carroll & Hannan (2000), The Demography of Corporation
%            [Han98] Hannan (1998), Rethinking Age Dependence in Organizati
% Source   : [Kam00]
% Names    : LEMMA 3 [Han98]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.10 v6.0.0, 0.09 v5.5.0, 0.07 v5.4.0, 0.11 v5.3.0, 0.15 v5.2.0, 0.05 v5.0.0, 0.00 v3.3.0, 0.07 v3.2.0, 0.18 v3.1.0, 0.11 v2.7.0, 0.17 v2.5.0, 0.00 v2.4.0
% Syntax   : Number of formulae    :   10 (   0 unit)
%            Number of atoms       :   34 (   7 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   25 (   1 ~  ;   4  |;   9  &)
%                                         (   3 <=>;   8 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-2 arity)
%            Number of functors    :    4 (   0 constant; 2-2 arity)
%            Number of variables   :   25 (   0 singleton;  25 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : See MGT042+1.p for the mnemonic names.
%--------------------------------------------------------------------------
include('Axioms/MGT001+0.ax').
%--------------------------------------------------------------------------
%----Problem Axioms
%----Increased knowledge elevates an organization's capability; and
%----increased accumulation of organizational internal frictions
%----diminishes its capability.
fof(assumption_5,axiom,
    ( ! [X,T0,T] :
        ( organization(X)
       => ( ( ( greater(stock_of_knowledge(X,T),stock_of_knowledge(X,T0))
              & smaller_or_equal(internal_friction(X,T),internal_friction(X,T0)) )
           => greater(capability(X,T),capability(X,T0)) )
          & ( ( smaller_or_equal(stock_of_knowledge(X,T),stock_of_knowledge(X,T0))
              & greater(internal_friction(X,T),internal_friction(X,T0)) )
           => smaller(capability(X,T),capability(X,T0)) )
          & ( ( stock_of_knowledge(X,T) = stock_of_knowledge(X,T0)
              & internal_friction(X,T) = internal_friction(X,T0) )
           => capability(X,T) = capability(X,T0) ) ) ) )).

%----Case: liability of Newness (Ass. 7-9).
%----
%----An organization's stock of knowledge increases monotonically with
%----its age.
fof(assumption_7,axiom,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & greater(age(X,T),age(X,T0)) )
       => greater(stock_of_knowledge(X,T),stock_of_knowledge(X,T0)) ) )).

%----The quality of an organization's internal friction does not vary
%----with its age.
fof(assumption_9,axiom,
    ( ! [X,T0,T] :
        ( organization(X)
       => internal_friction(X,T) = internal_friction(X,T0) ) )).

%----Problem theorems
%----Case B: liability of newness.
%----
%----An organization's capability increases monotonically with its age.
%----From A5, A7, and A9 (text says A5,7-9; also needs D<=).
fof(lemma_3,conjecture,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & greater(age(X,T),age(X,T0)) )
       => greater(capability(X,T),capability(X,T0)) ) )).

%--------------------------------------------------------------------------
