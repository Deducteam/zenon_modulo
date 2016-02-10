%------------------------------------------------------------------------------
% File     : LCL460+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Logic Calculi (Propositional)
% Problem  : Prove Rosser's kn2 axiom from Hilbert's axiomatization
% Version  : [HB34] axioms.
% English  :

% Refs     : [HB34]  Hilbert & Bernays (1934), Grundlagen der Mathematick
%          : [Hal]   Halleck (URL), John Halleck's Logic Systems
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.10 v6.0.0, 0.17 v5.5.0, 0.15 v5.4.0, 0.14 v5.3.0, 0.22 v5.2.0, 0.10 v5.1.0, 0.14 v5.0.0, 0.08 v4.1.0, 0.09 v4.0.0, 0.08 v3.7.0, 0.05 v3.3.0
% Syntax   : Number of formulae    :   53 (  22 unit)
%            Number of atoms       :   87 (   6 equality)
%            Maximal formula depth :    6 (   3 average)
%            Number of connectives :   34 (   0 ~  ;   0  |;   1  &)
%                                         (  26 <=>;   7 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   33 (  31 propositional; 0-2 arity)
%            Number of functors    :    5 (   0 constant; 1-2 arity)
%            Number of variables   :   65 (   0 singleton;  65 !;   0 ?)
%            Maximal term depth    :    5 (   3 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include axioms of propositional logic
include('Axioms/LCL006+0.ax').
include('Axioms/LCL006+1.ax').
%----Include Hilbert's axiomatization of propositional logic
include('Axioms/LCL006+2.ax').
%------------------------------------------------------------------------------
%----Operator definitions to reduce everything to and & not
fof(rosser_op_or,axiom,op_or).

fof(rosser_op_implies_and,axiom,op_implies_and).

fof(rosser_op_equiv,axiom,op_equiv).

fof(rosser_kn2,conjecture,kn2).

%------------------------------------------------------------------------------
