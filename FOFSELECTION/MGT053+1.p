%--------------------------------------------------------------------------
% File     : MGT053+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Management (Organisation Theory)
% Problem  : The dissimilarity relation is symmetric
% Version  : [Han98] axioms.
% English  :

% Refs     : [Kam00] Kamps (2000), Email to G. Sutcliffe
%            [CH00]  Carroll & Hannan (2000), The Demography of Corporation
%            [Han98] Hannan (1998), Rethinking Age Dependence in Organizati
% Source   : [Kam00]
% Names    : LEMMA 7 [Han98]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v4.1.0, 0.13 v4.0.1, 0.17 v3.7.0, 0.14 v3.5.0, 0.00 v3.4.0, 0.08 v3.3.0, 0.11 v3.2.0, 0.22 v3.1.0, 0.17 v2.7.0, 0.00 v2.4.0
% Syntax   : Number of formulae    :    8 (   0 unit)
%            Number of atoms       :   22 (   3 equality)
%            Maximal formula depth :    8 (   5 average)
%            Number of connectives :   16 (   2 ~  ;   4  |;   3  &)
%                                         (   6 <=>;   1 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    8 (   0 propositional; 1-3 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   19 (   0 singleton;  19 !;   0 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments : See MGT042+1.p for the mnemonic names.
%--------------------------------------------------------------------------
include('Axioms/MGT001+0.ax').
%--------------------------------------------------------------------------
%----Problem Axioms
%----Two states of the environment are dissimilar for an organization
%----if and only if the organization cannot be aligned to both.
%----
%----Added quantification over X.
fof(definition_2,axiom,
    ( ! [X,T0,T] :
        ( dissimilar(X,T0,T)
      <=> ( organization(X)
          & ~ ( is_aligned(X,T0)
            <=> is_aligned(X,T) ) ) ) )).

%----Problem theorems
%----The dissimilarity relation is symmetric.
%----From D2.
%----
%----As stated is incorrect (missing Xs in quantification and second DS).
%----No inequalities needed.
fof(lemma_7,conjecture,
    ( ! [X,T1,T2] :
        ( dissimilar(X,T1,T2)
      <=> dissimilar(X,T2,T1) ) )).

%--------------------------------------------------------------------------
