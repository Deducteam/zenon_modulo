%--------------------------------------------------------------------------
% File     : SWV414+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Software Verification
% Problem  : Priority queue checker: Formula (12)
% Version  : [dNP05] axioms.
% English  :

% Refs     : [Pis06] Piskac (2006), Email to Geoff Sutcliffe
%          : [dNP05] de Nivelle & Piskac (2005), Verification of an Off-Lin
% Source   : [Pis06]
% Names    : cpq001 [Pis06]

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.03 v6.0.0, 0.04 v5.5.0, 0.00 v5.4.0, 0.04 v5.3.0, 0.11 v5.2.0, 0.05 v5.0.0, 0.04 v4.1.0, 0.09 v4.0.0, 0.12 v3.7.0, 0.10 v3.5.0, 0.11 v3.4.0, 0.16 v3.3.0
% Syntax   : Number of formulae    :   63 (  24 unit)
%            Number of atoms       :  129 (  41 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   82 (  16 ~  ;   4  |;  21  &)
%                                         (  16 <=>;  25 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   21 (   1 propositional; 0-3 arity)
%            Number of functors    :   27 (   5 constant; 0-3 arity)
%            Number of variables   :  164 (   4 singleton; 161 !;   3 ?)
%            Maximal term depth    :    5 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include the axioms about priority queues and checked priority queues
include('Axioms/SWV007+0.ax').
include('Axioms/SWV007+1.ax').
include('Axioms/SWV007+2.ax').
include('Axioms/SWV007+3.ax').
include('Axioms/SWV007+4.ax').
%--------------------------------------------------------------------------
fof(co1,conjecture,(
    ! [U] : i(triple(create_pqp,create_slb,U)) = create_pq )).

%--------------------------------------------------------------------------
