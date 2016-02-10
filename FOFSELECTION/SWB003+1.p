%------------------------------------------------------------------------------
% File     : SWB003+1 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Blank Nodes for Literals
% Version  : [Sch11] axioms.
% English  : 

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 003_Blank_Nodes_for_Literals [Sch11]

% Status   : Theorem
% Rating   : 0.16 v6.1.0, 0.27 v6.0.0, 0.26 v5.5.0, 0.30 v5.4.0, 0.32 v5.3.0, 0.44 v5.2.0
% Syntax   : Number of formulae    :  560 ( 198 unit)
%            Number of atoms       : 1774 (  90 equality)
%            Maximal formula depth :   27 (   5 average)
%            Number of connectives : 1350 ( 136   ~;  35   |; 758   &)
%                                         ( 126 <=>; 295  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :   13 (   1 propositional; 0-3 arity)
%            Number of functors    :  161 ( 159 constant; 0-2 arity)
%            Number of variables   :  974 (   0 sgn; 911   !;  63   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include OWL 2 Full axioms
include('Axioms/SWB001+0.ax').
%------------------------------------------------------------------------------
fof(testcase_conclusion_fullish_003_Blank_Nodes_for_Literals,conjecture,(
    ? [BNODE_x] : iext(uri_ex_p,uri_ex_s,BNODE_x) )).

fof(testcase_premise_fullish_003_Blank_Nodes_for_Literals,axiom,(
    iext(uri_ex_p,uri_ex_s,literal_plain(dat_str_foo)) )).

%------------------------------------------------------------------------------
