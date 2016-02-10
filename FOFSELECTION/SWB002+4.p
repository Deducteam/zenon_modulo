%------------------------------------------------------------------------------
% File     : SWB002+4 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Existential Blank Nodes
% Version  : [Sch11] axioms : Especial.
% English  : 

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 002_Existential_Blank_Nodes [Sch11]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0
% Syntax   : Number of formulae    :   82 (  62 unit)
%            Number of atoms       :  112 (   0 equality)
%            Maximal formula depth :    9 (   2 average)
%            Number of connectives :   30 (   0   ~;   0   |;  10   &)
%                                         (   5 <=>;  15  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    6 (   0 propositional; 1-3 arity)
%            Number of functors    :   36 (  36 constant; 0-0 arity)
%            Number of variables   :   40 (   0 sgn;  37   !;   3   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments :
%------------------------------------------------------------------------------
%----Include RDFS axioms
include('Axioms/SWB003+0.ax').
%------------------------------------------------------------------------------
fof(testcase_conclusion_fullish_002_Existential_Blank_Nodes,conjecture,(
    ? [BNODE_x,BNODE_y] :
      ( iext(uri_ex_p,BNODE_x,BNODE_y)
      & iext(uri_ex_q,BNODE_y,BNODE_x) ) )).

fof(testcase_premise_fullish_002_Existential_Blank_Nodes,axiom,(
    ? [BNODE_o] :
      ( iext(uri_ex_p,uri_ex_s,BNODE_o)
      & iext(uri_ex_q,BNODE_o,uri_ex_s) ) )).

%------------------------------------------------------------------------------
