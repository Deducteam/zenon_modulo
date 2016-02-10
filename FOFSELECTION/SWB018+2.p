%------------------------------------------------------------------------------
% File     : SWB018+2 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Modified Logical Vocabulary Semantics
% Version  : [Sch11] axioms : Reduced > Incomplete.
% English  :

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 018_Modified_Logical_Vocabulary_Semantics [Sch11]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0
% Syntax   : Number of formulae    :    5 (   1 unit)
%            Number of atoms       :   10 (   1 equality)
%            Maximal formula depth :    7 (   4 average)
%            Number of connectives :    5 (   0   ~;   0   |;   2   &)
%                                         (   2 <=>;   1  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    3 (   0 propositional; 2-3 arity)
%            Number of functors    :    6 (   6 constant; 0-0 arity)
%            Number of variables   :    8 (   0 sgn;   8   !;   0   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments :
%------------------------------------------------------------------------------
fof(rdfs_cext_def,axiom,(
    ! [X,C] :
      ( iext(uri_rdf_type,X,C)
    <=> icext(C,X) ) )).

fof(rdfs_domain_main,axiom,(
    ! [P,C,X,Y] :
      ( ( iext(uri_rdfs_domain,P,C)
        & iext(P,X,Y) )
     => icext(C,X) ) )).

fof(owl_eqdis_sameas,axiom,(
    ! [X,Y] :
      ( iext(uri_owl_sameAs,X,Y)
    <=> X = Y ) )).

fof(testcase_conclusion_fullish_018_Modified_Logical_Vocabulary_Semantics,conjecture,(
    iext(uri_rdf_type,uri_ex_u,uri_ex_Person) )).

fof(testcase_premise_fullish_018_Modified_Logical_Vocabulary_Semantics,axiom,
    ( iext(uri_rdfs_domain,uri_owl_sameAs,uri_ex_Person)
    & iext(uri_owl_sameAs,uri_ex_w,uri_ex_u) )).

%------------------------------------------------------------------------------
