%------------------------------------------------------------------------------
% File     : LCL540+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Logic Calculi (Propositional modal)
% Problem  : Prove adjunction from KM4B axiomatization of S5
% Version  : [HC96] axioms.
% English  :

% Refs     : [HC96]  Hughes & Cresswell (1996), A New Introduction to Modal
%          : [Hal]   Halleck (URL), John Halleck's Logic Systems
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.20 v6.0.0, 0.22 v5.5.0, 0.26 v5.4.0, 0.32 v5.3.0, 0.41 v5.2.0, 0.35 v5.1.0, 0.43 v5.0.0, 0.38 v4.1.0, 0.43 v4.0.0, 0.42 v3.7.0, 0.35 v3.5.0, 0.32 v3.4.0, 0.37 v3.3.0
% Syntax   : Number of formulae    :   89 (  31 unit)
%            Number of atoms       :  156 (  11 equality)
%            Maximal formula depth :    6 (   3 average)
%            Number of connectives :   67 (   0 ~  ;   0  |;   3  &)
%                                         (  49 <=>;  15 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   61 (  59 propositional; 0-2 arity)
%            Number of functors    :    9 (   0 constant; 1-2 arity)
%            Number of variables   :  110 (   0 singleton; 110 !;   0 ?)
%            Maximal term depth    :    5 (   3 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include Hilbert's axiomatization of propositional logic
include('Axioms/LCL006+0.ax').
include('Axioms/LCL006+1.ax').
include('Axioms/LCL006+2.ax').
%----Include axioms of modal logic
include('Axioms/LCL007+0.ax').
include('Axioms/LCL007+1.ax').
%----Include axioms for KM4B
include('Axioms/LCL007+3.ax').
%------------------------------------------------------------------------------
%----Modal definitions
fof(s1_0_op_possibly,axiom,op_possibly).

fof(s1_0_op_or,axiom,op_or).

fof(s1_0_op_implies,axiom,op_implies).

fof(s1_0_op_strict_implies,axiom,op_strict_implies).

fof(s1_0_op_equiv,axiom,op_equiv).

fof(s1_0_op_strict_equiv,axiom,op_strict_equiv).

%----Conjecture
fof(s1_0_adjunction,conjecture,adjunction).

%------------------------------------------------------------------------------
