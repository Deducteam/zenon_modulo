%------------------------------------------------------------------------------
% File     : SWB004+2 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Axiomatic Triples
% Version  : [Sch11] axioms : Reduced > Incomplete.
% English  :

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 004_Axiomatic_Triples [Sch11]

% Status   : Theorem
% Rating   : 0.00 v5.5.0, 0.04 v5.3.0, 0.09 v5.2.0
% Syntax   : Number of formulae    :   14 (   5 unit)
%            Number of atoms       :   32 (   0 equality)
%            Maximal formula depth :    8 (   3 average)
%            Number of connectives :   18 (   0   ~;   0   |;   8   &)
%                                         (   8 <=>;   2  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    5 (   0 propositional; 1-3 arity)
%            Number of functors    :    7 (   7 constant; 0-0 arity)
%            Number of variables   :   14 (   0 sgn;  14   !;   0   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
fof(simple_ir,axiom,(
    ! [X] : ir(X) )).

fof(rdfs_cext_def,axiom,(
    ! [X,C] :
      ( iext(uri_rdf_type,X,C)
    <=> icext(C,X) ) )).

fof(owl_parts_idc_cond_set,axiom,(
    ! [X] :
      ( idc(X)
     => ic(X) ) )).

fof(owl_class_classowl_type,axiom,(
    ic(uri_owl_Class) )).

fof(owl_class_classowl_ext,axiom,(
    ! [X] :
      ( icext(uri_owl_Class,X)
    <=> ic(X) ) )).

fof(owl_class_classrdfs_type,axiom,(
    ic(uri_rdfs_Class) )).

fof(owl_class_classrdfs_ext,axiom,(
    ! [X] :
      ( icext(uri_rdfs_Class,X)
    <=> ic(X) ) )).

fof(owl_class_datatype_type,axiom,(
    ic(uri_rdfs_Datatype) )).

fof(owl_class_datatype_ext,axiom,(
    ! [X] :
      ( icext(uri_rdfs_Datatype,X)
    <=> idc(X) ) )).

fof(owl_class_thing_type,axiom,(
    ic(uri_owl_Thing) )).

fof(owl_class_thing_ext,axiom,(
    ! [X] :
      ( icext(uri_owl_Thing,X)
    <=> ir(X) ) )).

fof(owl_rdfsext_subclassof,axiom,(
    ! [C1,C2] :
      ( iext(uri_rdfs_subClassOf,C1,C2)
    <=> ( ic(C1)
        & ic(C2)
        & ! [X] :
            ( icext(C1,X)
           => icext(C2,X) ) ) ) )).

fof(owl_eqdis_equivalentclass,axiom,(
    ! [C1,C2] :
      ( iext(uri_owl_equivalentClass,C1,C2)
    <=> ( ic(C1)
        & ic(C2)
        & ! [X] :
            ( icext(C1,X)
          <=> icext(C2,X) ) ) ) )).

fof(testcase_conclusion_fullish_004_Axiomatic_Triples,conjecture,
    ( iext(uri_rdf_type,uri_owl_Class,uri_owl_Thing)
    & iext(uri_rdf_type,uri_owl_Class,uri_owl_Class)
    & iext(uri_rdfs_subClassOf,uri_owl_Class,uri_owl_Thing)
    & iext(uri_owl_equivalentClass,uri_owl_Class,uri_rdfs_Class)
    & iext(uri_rdfs_subClassOf,uri_rdfs_Datatype,uri_owl_Class) )).

%------------------------------------------------------------------------------
