%------------------------------------------------------------------------------
% File     : SWB002+3 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Existential Blank Nodes
% Version  : [Sch11] axioms : Incomplete.
% English  : 

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 002_Existential_Blank_Nodes [Sch11]

% Status   : Theorem
% Rating   : 0.09 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0
% Syntax   : Number of formulae    :  140 (  73 unit)
%            Number of atoms       :  314 (   0 equality)
%            Maximal formula depth :   18 (   3 average)
%            Number of connectives :  177 (   3   ~;   3   |;  76   &)
%                                         (  38 <=>;  57  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :   11 (   0 propositional; 1-3 arity)
%            Number of functors    :   50 (  50 constant; 0-0 arity)
%            Number of variables   :  162 (   0 sgn; 157   !;   5   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
%----Include ALCO Full Extensional axioms
include('Axioms/SWB002+0.ax').
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
