%------------------------------------------------------------------------------
% File     : SWB003+3 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Blank Nodes for Literals
% Version  : [Sch11] axioms : Incomplete.
% English  : 

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 003_Blank_Nodes_for_Literals [Sch11]

% Status   : Theorem
% Rating   : 0.09 v6.1.0, 0.08 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0
% Syntax   : Number of formulae    :  140 (  75 unit)
%            Number of atoms       :  312 (   0 equality)
%            Maximal formula depth :   18 (   3 average)
%            Number of connectives :  175 (   3   ~;   3   |;  74   &)
%                                         (  38 <=>;  57  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :   11 (   0 propositional; 1-3 arity)
%            Number of functors    :   51 (  50 constant; 0-1 arity)
%            Number of variables   :  160 (   0 sgn; 157   !;   3   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
%----Include ALCO Full Extensional axioms
include('Axioms/SWB002+0.ax').
%------------------------------------------------------------------------------
fof(testcase_conclusion_fullish_003_Blank_Nodes_for_Literals,conjecture,(
    ? [BNODE_x] : iext(uri_ex_p,uri_ex_s,BNODE_x) )).

fof(testcase_premise_fullish_003_Blank_Nodes_for_Literals,axiom,(
    iext(uri_ex_p,uri_ex_s,literal_plain(dat_str_foo)) )).

%------------------------------------------------------------------------------
