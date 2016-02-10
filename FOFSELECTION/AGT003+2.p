%--------------------------------------------------------------------------
% File     : AGT003+2 : TPTP v6.1.0. Bugfixed v3.1.0.
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
% Rating   : 0.20 v6.0.0, 0.17 v5.5.0, 0.26 v5.4.0, 0.21 v5.3.0, 0.30 v5.2.0, 0.25 v5.1.0, 0.24 v5.0.0, 0.25 v4.1.0, 0.17 v4.0.1, 0.13 v4.0.0, 0.08 v3.7.0, 0.10 v3.5.0, 0.11 v3.4.0, 0.21 v3.2.0, 0.36 v3.1.0
% Syntax   : Number of formulae    :  923 ( 891 unit)
%            Number of atoms       : 1023 (   2 equality)
%            Maximal formula depth :    8 (   1 average)
%            Number of connectives :  148 (  48 ~  ;   1  |;  67  &)
%                                         (  16 <=>;  16 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   17 (   0 propositional; 1-4 arity)
%            Number of functors    :  290 ( 286 constant; 0-2 arity)
%            Number of variables   :   70 (   0 singleton;  70 !;   0 ?)
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
%----Include lemmas of CPlanT
include('Axioms/AGT001+2.ax').
%----Include axioms for RDN and RDN less
include('Axioms/NUM005+0.ax').
include('Axioms/NUM005+1.ax').
%--------------------------------------------------------------------------
fof(query_3,conjecture,
    ( accept_team(christiansufferterrahumanitarianorganization,countryafirstaidorganization,towna,n5) )).

%--------------------------------------------------------------------------
