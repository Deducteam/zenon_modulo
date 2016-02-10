%------------------------------------------------------------------------------
% File     : SWB006+2 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Literal Values represented by URIs and Blank Nodes
% Version  : [Sch11] axioms : Reduced > Incomplete.
% English  :

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 006_Literal_Values_represented_by_URIs_and_Blank_Nodes [Sch11]

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.10 v6.0.0, 0.04 v5.3.0, 0.11 v5.2.0
% Syntax   : Number of formulae    :    3 (   1 unit)
%            Number of atoms       :    6 (   1 equality)
%            Maximal formula depth :    4 (   3 average)
%            Number of connectives :    3 (   0   ~;   0   |;   2   &)
%                                         (   1 <=>;   0  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    2 (   0 propositional; 2-3 arity)
%            Number of functors    :    5 (   4 constant; 0-1 arity)
%            Number of variables   :    3 (   0 sgn;   2   !;   1   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
fof(owl_eqdis_sameas,axiom,(
    ! [X,Y] :
      ( iext(uri_owl_sameAs,X,Y)
    <=> X = Y ) )).

fof(testcase_conclusion_fullish_006_Literal_Values_represented_by_URIs_and_Blank_Nodes,conjecture,(
    iext(uri_owl_sameAs,uri_ex_u,uri_ex_w) )).

fof(testcase_premise_fullish_006_Literal_Values_represented_by_URIs_and_Blank_Nodes,axiom,(
    ? [BNODE_x] :
      ( iext(uri_owl_sameAs,uri_ex_u,literal_plain(dat_str_abc))
      & iext(uri_owl_sameAs,BNODE_x,literal_plain(dat_str_abc))
      & iext(uri_owl_sameAs,BNODE_x,uri_ex_w) ) )).

%------------------------------------------------------------------------------
