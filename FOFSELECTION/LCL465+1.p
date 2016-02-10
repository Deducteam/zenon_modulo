%------------------------------------------------------------------------------
% File     : LCL465+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Logic Calculi (Propositional)
% Problem  : Prove Hilbert's implies_3 axiom from Lukasiewicz's axiomatization
% Version  : [Zem73] axioms.
% English  :

% Refs     : [Zem73] Zeman (1973), Modal Logic, the Lewis-Modal systems
%          : [Hal]   Halleck (URL), John Halleck's Logic Systems
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.10 v6.0.0, 0.17 v5.5.0, 0.15 v5.4.0, 0.18 v5.3.0, 0.30 v5.2.0, 0.15 v5.1.0, 0.19 v5.0.0, 0.17 v4.1.0, 0.22 v4.0.0, 0.21 v3.7.0, 0.10 v3.5.0, 0.11 v3.4.0, 0.05 v3.3.0
% Syntax   : Number of formulae    :   43 (  12 unit)
%            Number of atoms       :   77 (   6 equality)
%            Maximal formula depth :    6 (   3 average)
%            Number of connectives :   34 (   0 ~  ;   0  |;   1  &)
%                                         (  26 <=>;   7 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   34 (  32 propositional; 0-2 arity)
%            Number of functors    :    5 (   0 constant; 1-2 arity)
%            Number of variables   :   65 (   0 singleton;  65 !;   0 ?)
%            Maximal term depth    :    5 (   3 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include axioms of propositional logic
include('Axioms/LCL006+0.ax').
include('Axioms/LCL006+1.ax').
%----Include Lukasiewicz's axiomatization of propositional logic
include('Axioms/LCL006+3.ax').
%------------------------------------------------------------------------------
%----Operator definitions to reduce everything to and & not
fof(hilbert_op_or,axiom,op_or).

fof(hilbert_op_implies_and,axiom,op_implies_and).

fof(hilbert_op_equiv,axiom,op_equiv).

fof(hilbert_implies_3,conjecture,implies_3).

%------------------------------------------------------------------------------
