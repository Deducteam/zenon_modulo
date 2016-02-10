%--------------------------------------------------------------------------
% File     : MGT049+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Management (Organisation Theory)
% Problem  : Structural position does not vary with its age
% Version  : [Han98] axioms.
% English  : An organization's structural position does not vary with its age.

% Refs     : [Kam00] Kamps (2000), Email to G. Sutcliffe
%            [CH00]  Carroll & Hannan (2000), The Demography of Corporation
%            [Han98] Hannan (1998), Rethinking Age Dependence in Organizati
% Source   : [Kam00]
% Names    : LEMMA 6 [Han98]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.10 v6.0.0, 0.13 v5.5.0, 0.07 v5.4.0, 0.11 v5.3.0, 0.15 v5.2.0, 0.10 v5.0.0, 0.00 v3.2.0, 0.09 v3.1.0, 0.00 v2.4.0
% Syntax   : Number of formulae    :    9 (   0 unit)
%            Number of atoms       :   26 (   7 equality)
%            Maximal formula depth :    7 (   5 average)
%            Number of connectives :   18 (   1 ~  ;   4  |;   4  &)
%                                         (   3 <=>;   6 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-2 arity)
%            Number of functors    :    3 (   0 constant; 2-2 arity)
%            Number of variables   :   22 (   0 singleton;  22 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : See MGT042+1.p for the mnemonic names.
%--------------------------------------------------------------------------
include('Axioms/MGT001+0.ax').
%--------------------------------------------------------------------------
%----Problem Axioms
%----Improved ties with external actors enhance an organization's position.
fof(assumption_6,axiom,
    ( ! [X,T0,T] :
        ( organization(X)
       => ( ( greater(external_ties(X,T),external_ties(X,T0))
           => greater(position(X,T),position(X,T0)) )
          & ( external_ties(X,T) = external_ties(X,T0)
           => position(X,T) = position(X,T0) ) ) ) )).

%----The quality of an organization's external ties does not vary with
%----its age (contra assumption 8).
fof(assumption_11,axiom,
    ( ! [X,T0,T] :
        ( organization(X)
       => external_ties(X,T) = external_ties(X,T0) ) )).

%----Problem theorems
%----An organization's structural position does not vary with its age.
%----From A6 and A11 (text says A6 and A9!; no inequalities needed).
fof(lemma_6,conjecture,
    ( ! [X,T0,T] :
        ( ( organization(X)
          & greater(age(X,T),age(X,T0)) )
       => position(X,T) = position(X,T0) ) )).

%--------------------------------------------------------------------------
