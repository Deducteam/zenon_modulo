%------------------------------------------------------------------------------
% File     : SWB008+2 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Inverse Functional Data Properties
% Version  : [Sch11] axioms : Reduced > Incomplete.
% English  :

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 008_Inverse_Functional_Data_Properties [Sch11]

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.07 v6.0.0, 0.04 v5.3.0, 0.11 v5.2.0
% Syntax   : Number of formulae    :    5 (   1 unit)
%            Number of atoms       :   14 (   2 equality)
%            Maximal formula depth :    9 (   4 average)
%            Number of connectives :    9 (   0   ~;   0   |;   5   &)
%                                         (   3 <=>;   1  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    4 (   0 propositional; 1-3 arity)
%            Number of functors    :    9 (   8 constant; 0-1 arity)
%            Number of variables   :    8 (   0 sgn;   8   !;   0   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
fof(rdfs_cext_def,axiom,(
    ! [X,C] :
      ( iext(uri_rdf_type,X,C)
    <=> icext(C,X) ) )).

fof(owl_eqdis_sameas,axiom,(
    ! [X,Y] :
      ( iext(uri_owl_sameAs,X,Y)
    <=> X = Y ) )).

fof(owl_char_inversefunctional,axiom,(
    ! [P] :
      ( icext(uri_owl_InverseFunctionalProperty,P)
    <=> ( ip(P)
        & ! [X1,X2,Y] :
            ( ( iext(P,X1,Y)
              & iext(P,X2,Y) )
           => X1 = X2 ) ) ) )).

fof(testcase_conclusion_fullish_008_Inverse_Functional_Data_Properties,conjecture,(
    iext(uri_owl_sameAs,uri_ex_bob,uri_ex_robert) )).

fof(testcase_premise_fullish_008_Inverse_Functional_Data_Properties,axiom,
    ( iext(uri_rdf_type,uri_foaf_mbox_sha1sum,uri_owl_DatatypeProperty)
    & iext(uri_rdf_type,uri_foaf_mbox_sha1sum,uri_owl_InverseFunctionalProperty)
    & iext(uri_foaf_mbox_sha1sum,uri_ex_bob,literal_plain(dat_str_xyz))
    & iext(uri_foaf_mbox_sha1sum,uri_ex_robert,literal_plain(dat_str_xyz)) )).

%------------------------------------------------------------------------------
