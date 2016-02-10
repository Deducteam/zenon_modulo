%------------------------------------------------------------------------------
% File     : SWB032+2 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Datatype Relationships
% Version  : [Sch11] axioms : Reduced > Incomplete.
% English  :

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 032_Datatype_Relationships [Sch11]

% Status   : Theorem
% Rating   : 0.00 v5.5.0, 0.04 v5.4.0, 0.00 v5.3.0, 0.09 v5.2.0
% Syntax   : Number of formulae    :   12 (   3 unit)
%            Number of atoms       :   27 (   0 equality)
%            Maximal formula depth :    9 (   3 average)
%            Number of connectives :   17 (   2   ~;   0   |;   7   &)
%                                         (   2 <=>;   6  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    4 (   0 propositional; 1-3 arity)
%            Number of functors    :    8 (   8 constant; 0-0 arity)
%            Number of variables   :   12 (   0 sgn;  12   !;   0   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
fof(owl_dat_dtype_string_type,axiom,(
    idc(uri_xsd_string) )).

fof(owl_dat_dtype_decimal_type,axiom,(
    idc(uri_xsd_decimal) )).

fof(owl_dat_dtype_integer_type,axiom,(
    idc(uri_xsd_integer) )).

fof(owl_dat_dtype_relation_disjoint_plainliteral_real,axiom,(
    ! [X] :
      ~ ( icext(uri_rdf_PlainLiteral,X)
        & icext(uri_owl_real,X) ) )).

fof(owl_dat_dtype_relation_subtype_string_plainliteral,axiom,(
    ! [X] :
      ( icext(uri_xsd_string,X)
     => icext(uri_rdf_PlainLiteral,X) ) )).

fof(owl_dat_dtype_relation_subtype_rational_real,axiom,(
    ! [X] :
      ( icext(uri_owl_rational,X)
     => icext(uri_owl_real,X) ) )).

fof(owl_dat_dtype_relation_subtype_decimal_rational,axiom,(
    ! [X] :
      ( icext(uri_xsd_decimal,X)
     => icext(uri_owl_rational,X) ) )).

fof(owl_dat_dtype_relation_subtype_integer_decimal,axiom,(
    ! [X] :
      ( icext(uri_xsd_integer,X)
     => icext(uri_xsd_decimal,X) ) )).

fof(owl_parts_idc_cond_set,axiom,(
    ! [X] :
      ( idc(X)
     => ic(X) ) )).

fof(owl_rdfsext_subclassof,axiom,(
    ! [C1,C2] :
      ( iext(uri_rdfs_subClassOf,C1,C2)
    <=> ( ic(C1)
        & ic(C2)
        & ! [X] :
            ( icext(C1,X)
           => icext(C2,X) ) ) ) )).

fof(owl_eqdis_disjointwith,axiom,(
    ! [C1,C2] :
      ( iext(uri_owl_disjointWith,C1,C2)
    <=> ( ic(C1)
        & ic(C2)
        & ! [X] :
            ~ ( icext(C1,X)
              & icext(C2,X) ) ) ) )).

fof(testcase_conclusion_fullish_032_Datatype_Relationships,conjecture,
    ( iext(uri_owl_disjointWith,uri_xsd_decimal,uri_xsd_string)
    & iext(uri_rdfs_subClassOf,uri_xsd_integer,uri_xsd_decimal) )).

%------------------------------------------------------------------------------
