%------------------------------------------------------------------------------
% File     : SWB001+1 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Subgraph Entailment
% Version  : [Sch11] axioms.
% English  : 

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 001_Subgraph_Entailment [Sch11]

% Status   : Theorem
% Rating   : 0.16 v6.1.0, 0.30 v6.0.0, 0.26 v5.5.0, 0.30 v5.4.0, 0.32 v5.3.0, 0.41 v5.2.0
% Syntax   : Number of formulae    :  560 ( 196 unit)
%            Number of atoms       : 1778 (  90 equality)
%            Maximal formula depth :   27 (   5 average)
%            Number of connectives : 1354 ( 136   ~;  35   |; 762   &)
%                                         ( 126 <=>; 295  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :   13 (   1 propositional; 0-3 arity)
%            Number of functors    :  161 ( 160 constant; 0-2 arity)
%            Number of variables   :  973 (   0 sgn; 911   !;  62   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include OWL 2 Full axioms
include('Axioms/SWB001+0.ax').
%------------------------------------------------------------------------------
fof(testcase_conclusion_fullish_001_Subgraph_Entailment,conjecture,
    ( iext(uri_rdf_type,uri_ex_r,uri_owl_Restriction)
    & iext(uri_owl_onProperty,uri_ex_r,uri_ex_p) )).

fof(testcase_premise_fullish_001_Subgraph_Entailment,axiom,
    ( iext(uri_rdfs_subClassOf,uri_ex_c,uri_ex_r)
    & iext(uri_rdf_type,uri_ex_r,uri_owl_Restriction)
    & iext(uri_owl_onProperty,uri_ex_r,uri_ex_p)
    & iext(uri_owl_someValuesFrom,uri_ex_r,uri_ex_d) )).

%------------------------------------------------------------------------------
