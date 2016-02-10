%------------------------------------------------------------------------------
% File     : SWB007+2 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Equal Classes
% Version  : [Sch11] axioms : Reduced > Incomplete.
% English  :

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 007_Equal_Classes [Sch11]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0
% Syntax   : Number of formulae    :    3 (   0 unit)
%            Number of atoms       :    9 (   1 equality)
%            Maximal formula depth :    4 (   4 average)
%            Number of connectives :    6 (   0   ~;   0   |;   5   &)
%                                         (   1 <=>;   0  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    2 (   0 propositional; 2-3 arity)
%            Number of functors    :    9 (   9 constant; 0-0 arity)
%            Number of variables   :    2 (   0 sgn;   2   !;   0   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments :
%------------------------------------------------------------------------------
fof(owl_eqdis_sameas,axiom,(
    ! [X,Y] :
      ( iext(uri_owl_sameAs,X,Y)
    <=> X = Y ) )).

fof(testcase_conclusion_fullish_007_Equal_Classes,conjecture,
    ( iext(uri_rdf_type,uri_ex_w,uri_ex_c2)
    & iext(uri_rdfs_subClassOf,uri_ex_c,uri_ex_c2)
    & iext(uri_rdfs_range,uri_ex_p,uri_ex_c2) )).

fof(testcase_premise_fullish_007_Equal_Classes,axiom,
    ( iext(uri_owl_sameAs,uri_ex_c1,uri_ex_c2)
    & iext(uri_rdf_type,uri_ex_w,uri_ex_c1)
    & iext(uri_rdfs_subClassOf,uri_ex_c,uri_ex_c1)
    & iext(uri_rdfs_range,uri_ex_p,uri_ex_c1) )).

%------------------------------------------------------------------------------
