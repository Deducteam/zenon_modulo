%------------------------------------------------------------------------------
% File     : SWB014+2 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Harry belongs to some Species
% Version  : [Sch11] axioms : Reduced > Incomplete.
% English  :

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 014_Harry_belongs_to_some_Species [Sch11]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.50 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0
% Syntax   : Number of formulae    :    4 (   0 unit)
%            Number of atoms       :   23 (   0 equality)
%            Maximal formula depth :   14 (   8 average)
%            Number of connectives :   19 (   0   ~;   1   |;  14   &)
%                                         (   3 <=>;   1  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    3 (   0 propositional; 1-3 arity)
%            Number of functors    :    9 (   9 constant; 0-0 arity)
%            Number of variables   :   12 (   0 sgn;   8   !;   4   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
fof(rdfs_cext_def,axiom,(
    ! [X,C] :
      ( iext(uri_rdf_type,X,C)
    <=> icext(C,X) ) )).

fof(owl_bool_unionof_class_002,axiom,(
    ! [Z,S1,C1,S2,C2] :
      ( ( iext(uri_rdf_first,S1,C1)
        & iext(uri_rdf_rest,S1,S2)
        & iext(uri_rdf_first,S2,C2)
        & iext(uri_rdf_rest,S2,uri_rdf_nil) )
     => ( iext(uri_owl_unionOf,Z,S1)
      <=> ( ic(Z)
          & ic(C1)
          & ic(C2)
          & ! [X] :
              ( icext(Z,X)
            <=> ( icext(C1,X)
                | icext(C2,X) ) ) ) ) ) )).

fof(testcase_conclusion_fullish_014_Harry_belongs_to_some_Species,conjecture,(
    ? [BNODE_x] :
      ( iext(uri_rdf_type,uri_ex_harry,BNODE_x)
      & iext(uri_rdf_type,BNODE_x,uri_ex_Species) ) )).

fof(testcase_premise_fullish_014_Harry_belongs_to_some_Species,axiom,(
    ? [BNODE_u,BNODE_l1,BNODE_l2] :
      ( iext(uri_rdf_type,uri_ex_Eagle,uri_ex_Species)
      & iext(uri_rdf_type,uri_ex_Falcon,uri_ex_Species)
      & iext(uri_rdf_type,uri_ex_harry,BNODE_u)
      & iext(uri_owl_unionOf,BNODE_u,BNODE_l1)
      & iext(uri_rdf_first,BNODE_l1,uri_ex_Eagle)
      & iext(uri_rdf_rest,BNODE_l1,BNODE_l2)
      & iext(uri_rdf_first,BNODE_l2,uri_ex_Falcon)
      & iext(uri_rdf_rest,BNODE_l2,uri_rdf_nil) ) )).

%------------------------------------------------------------------------------
