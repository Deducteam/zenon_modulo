%------------------------------------------------------------------------------
% File     : SWB005+2 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Everything is a Resource
% Version  : [Sch11] axioms : Reduced > Incomplete.
% English  :

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 005_Everything_is_a_Resource [Sch11]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0
% Syntax   : Number of formulae    :    9 (   2 unit)
%            Number of atoms       :   22 (   0 equality)
%            Maximal formula depth :    8 (   4 average)
%            Number of connectives :   13 (   0   ~;   0   |;   7   &)
%                                         (   5 <=>;   1  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    4 (   0 propositional; 1-3 arity)
%            Number of functors    :    8 (   8 constant; 0-0 arity)
%            Number of variables   :   10 (   0 sgn;  10   !;   0   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments :
%------------------------------------------------------------------------------
fof(simple_ir,axiom,(
    ! [X] : ir(X) )).

fof(simple_iext_property,axiom,(
    ! [S,P,O] :
      ( iext(P,S,O)
     => ip(P) ) )).

fof(rdf_type_ip,axiom,(
    ! [P] :
      ( iext(uri_rdf_type,P,uri_rdf_Property)
    <=> ip(P) ) )).

fof(rdfs_cext_def,axiom,(
    ! [X,C] :
      ( iext(uri_rdf_type,X,C)
    <=> icext(C,X) ) )).

fof(rdfs_ir_def,axiom,(
    ! [X] :
      ( ir(X)
    <=> icext(uri_rdfs_Resource,X) ) )).

fof(owl_class_thing_ext,axiom,(
    ! [X] :
      ( icext(uri_owl_Thing,X)
    <=> ir(X) ) )).

fof(owl_class_objectproperty_ext,axiom,(
    ! [X] :
      ( icext(uri_owl_ObjectProperty,X)
    <=> ip(X) ) )).

fof(testcase_conclusion_fullish_005_Everything_is_a_Resource,conjecture,
    ( iext(uri_rdf_type,uri_ex_s,uri_rdfs_Resource)
    & iext(uri_rdf_type,uri_ex_s,uri_owl_Thing)
    & iext(uri_rdf_type,uri_ex_p,uri_rdfs_Resource)
    & iext(uri_rdf_type,uri_ex_p,uri_owl_Thing)
    & iext(uri_rdf_type,uri_ex_p,uri_rdf_Property)
    & iext(uri_rdf_type,uri_ex_p,uri_owl_ObjectProperty)
    & iext(uri_rdf_type,uri_ex_o,uri_rdfs_Resource)
    & iext(uri_rdf_type,uri_ex_o,uri_owl_Thing) )).

fof(testcase_premise_fullish_005_Everything_is_a_Resource,axiom,(
    iext(uri_ex_p,uri_ex_s,uri_ex_o) )).

%------------------------------------------------------------------------------
