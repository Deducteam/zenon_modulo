%------------------------------------------------------------------------------
% File     : SWB029+2 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Ex Falso Quodlibet
% Version  : [Sch11] axioms : Reduced > Incomplete.
% English  :

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 029_Ex_Falso_Quodlibet [Sch11]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.08 v6.0.0, 0.50 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0
% Syntax   : Number of formulae    :    5 (   1 unit)
%            Number of atoms       :   28 (   0 equality)
%            Maximal formula depth :   14 (   8 average)
%            Number of connectives :   24 (   1   ~;   0   |;  17   &)
%                                         (   4 <=>;   2  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    3 (   0 propositional; 1-3 arity)
%            Number of functors    :   10 (  10 constant; 0-0 arity)
%            Number of variables   :   15 (   0 sgn;  11   !;   4   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
fof(rdfs_cext_def,axiom,(
    ! [X,C] :
      ( iext(uri_rdf_type,X,C)
    <=> icext(C,X) ) )).

fof(owl_bool_complementof_class,axiom,(
    ! [Z,C] :
      ( iext(uri_owl_complementOf,Z,C)
     => ( ic(Z)
        & ic(C)
        & ! [X] :
            ( icext(Z,X)
          <=> ~ icext(C,X) ) ) ) )).

fof(owl_bool_intersectionof_class_002,axiom,(
    ! [Z,S1,C1,S2,C2] :
      ( ( iext(uri_rdf_first,S1,C1)
        & iext(uri_rdf_rest,S1,S2)
        & iext(uri_rdf_first,S2,C2)
        & iext(uri_rdf_rest,S2,uri_rdf_nil) )
     => ( iext(uri_owl_intersectionOf,Z,S1)
      <=> ( ic(Z)
          & ic(C1)
          & ic(C2)
          & ! [X] :
              ( icext(Z,X)
            <=> ( icext(C1,X)
                & icext(C2,X) ) ) ) ) ) )).

fof(testcase_conclusion_fullish_029_Ex_Falso_Quodlibet,conjecture,(
    iext(uri_rdf_type,uri_ex_w,uri_ex_B) )).

fof(testcase_premise_fullish_029_Ex_Falso_Quodlibet,axiom,(
    ? [BNODE_x,BNODE_y,BNODE_l1,BNODE_l2] :
      ( iext(uri_rdf_type,uri_ex_A,uri_owl_Class)
      & iext(uri_rdf_type,uri_ex_B,uri_owl_Class)
      & iext(uri_rdf_type,uri_ex_w,BNODE_x)
      & iext(uri_owl_intersectionOf,BNODE_x,BNODE_l1)
      & iext(uri_rdf_first,BNODE_l1,uri_ex_A)
      & iext(uri_rdf_rest,BNODE_l1,BNODE_l2)
      & iext(uri_rdf_first,BNODE_l2,BNODE_y)
      & iext(uri_rdf_rest,BNODE_l2,uri_rdf_nil)
      & iext(uri_owl_complementOf,BNODE_y,uri_ex_A) ) )).

%------------------------------------------------------------------------------
