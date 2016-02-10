%--------------------------------------------------------------------------
% File     : AGT014+1 : TPTP v6.1.0. Bugfixed v3.1.0.
% Domain   : Agents
% Problem  : Problem for the CPlanT system
% Version  : [Bar03] axioms : Especial.
% English  :

% Refs     : [Bar03] Barta, J. (2003), Email to G. Sutcliffe
%          : [BT+03] Barta et al. (2003), Meta-Reasoning in CPlanT Multi-Ag
%          : [TBP03] Tozicka et al. (2003), Meta-reasoning for Agents' Priv
% Source   : [Bar03]
% Names    :

% Status   : Theorem
% Rating   : 0.28 v6.1.0, 0.30 v5.4.0, 0.25 v5.3.0, 0.33 v5.2.0, 0.20 v5.1.0, 0.24 v5.0.0, 0.29 v4.1.0, 0.26 v4.0.0, 0.25 v3.5.0, 0.26 v3.4.0, 0.21 v3.2.0, 0.27 v3.1.0
% Syntax   : Number of formulae    :  556 ( 524 unit)
%            Number of atoms       :  656 (   2 equality)
%            Maximal formula depth :    8 (   1 average)
%            Number of connectives :  144 (  44 ~  ;   1  |;  67  &)
%                                         (  16 <=>;  16 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   17 (   0 propositional; 1-4 arity)
%            Number of functors    :  290 ( 286 constant; 0-2 arity)
%            Number of variables   :   73 (   0 singleton;  70 !;   3 ?)
%            Maximal term depth    :    5 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
% Bugfixes : v3.0.0 - Bugfixes in NUM005+1.ax
%          : v3.1.0 - Changes to NUM005 axioms
%--------------------------------------------------------------------------
%----Include axioms of CPlanT
include('Axioms/AGT001+0.ax').
%----Include events of CPlanT
include('Axioms/AGT001+1.ax').
%----Include axioms for RDN and RDN less
include('Axioms/NUM005+0.ax').
include('Axioms/NUM005+1.ax').
%--------------------------------------------------------------------------
fof(query_14,conjecture,
    ( ? [X,Y,Z] : ~ accept_population(X,Y,Z) )).

%--------------------------------------------------------------------------
