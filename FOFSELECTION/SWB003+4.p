%------------------------------------------------------------------------------
% File     : SWB003+4 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Blank Nodes for Literals
% Version  : [Sch11] axioms : Especial.
% English  : 

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 003_Blank_Nodes_for_Literals [Sch11]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0
% Syntax   : Number of formulae    :   82 (  64 unit)
%            Number of atoms       :  110 (   0 equality)
%            Maximal formula depth :    9 (   2 average)
%            Number of connectives :   28 (   0   ~;   0   |;   8   &)
%                                         (   5 <=>;  15  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    6 (   0 propositional; 1-3 arity)
%            Number of functors    :   37 (  36 constant; 0-1 arity)
%            Number of variables   :   38 (   0 sgn;  37   !;   1   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
%----Include RDFS axioms
include('Axioms/SWB003+0.ax').
%------------------------------------------------------------------------------
fof(testcase_conclusion_fullish_003_Blank_Nodes_for_Literals,conjecture,(
    ? [BNODE_x] : iext(uri_ex_p,uri_ex_s,BNODE_x) )).

fof(testcase_premise_fullish_003_Blank_Nodes_for_Literals,axiom,(
    iext(uri_ex_p,uri_ex_s,literal_plain(dat_str_foo)) )).

%------------------------------------------------------------------------------
