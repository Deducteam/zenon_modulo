%------------------------------------------------------------------------------
% File     : KRS189+1 : TPTP v6.1.0. Bugfixed v5.4.0.
% Domain   : Knowledge Representation
% Problem  : ETH isa THM
% Version  : [Sut08] axioms.
% English  :

% Refs     : [Sut08] Sutcliffe (2008), The SZS Ontologies for Automated Rea
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.18 v6.1.0, 0.40 v6.0.0, 0.25 v5.5.0, 0.46 v5.4.0
% Syntax   : Number of formulae    :   33 (   3 unit)
%            Number of atoms       :  107 (   0 equality)
%            Maximal formula depth :   10 (   6 average)
%            Number of connectives :   96 (  22   ~;   1   |;  35   &)
%                                         (  28 <=>;   8  =>;   0  <=;   2 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    7 (   0 propositional; 2-3 arity)
%            Number of functors    :   20 (  19 constant; 0-1 arity)
%            Number of variables   :  122 (   0 sgn;  72   !;  50   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
% Bugfixes : v5.4.0 - Added missing axiom in KRS001+1.ax
%------------------------------------------------------------------------------
%----Include SZS success ontology nodes
include('Axioms/KRS001+0.ax').
%----Include SZS success ontology node relationships
include('Axioms/KRS001+1.ax').
%------------------------------------------------------------------------------
fof(isa_eth_thm,conjecture,(
    isa(eth,thm) )).

%------------------------------------------------------------------------------
