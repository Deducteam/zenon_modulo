%------------------------------------------------------------------------------
% File     : MED005+1 : TPTP v6.1.0. Released v3.2.0.
% Domain   : Medicine
% Problem  : Unsuccessful diet treatment
% Version  : [HLB05] axioms : Especial.
% English  : Unsuccessful treatment of diet requires that medical management
%            moves to at least oral diabetics.

% Refs     : [HLB05] Hommersom et al. (2005), Automated Theorem Proving for
%          : [Hom06] Hommersom (2006), Email to G. Sutcliffe
% Source   : [Hom06]
% Names    :

% Status   : Theorem
% Rating   : 0.09 v6.1.0, 0.36 v6.0.0, 0.25 v5.5.0, 0.54 v5.4.0, 0.52 v5.3.0, 0.57 v5.2.0, 0.43 v5.0.0, 0.40 v4.1.0, 0.44 v4.0.1, 0.47 v4.0.0, 0.45 v3.7.0, 0.33 v3.5.0, 0.25 v3.4.0, 0.33 v3.3.0, 0.44 v3.2.0
% Syntax   : Number of formulae    :   41 (   1 unit)
%            Number of atoms       :  197 (   0 equality)
%            Maximal formula depth :   12 (   6 average)
%            Number of connectives :  239 (  83 ~  ;  33  |;  48  &)
%                                         (   0 <=>;  75 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   20 (   0 propositional; 1-2 arity)
%            Number of functors    :    1 (   1 constant; 0-0 arity)
%            Number of variables   :   96 (   0 singleton;  92 !;   4 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
include('Axioms/MED001+0.ax').
include('Axioms/MED001+1.ax').
%------------------------------------------------------------------------------
fof(transs0s1,conjecture,
    ( ( s0(n0)
      & ! [X0] :
          ( gt(n0,X0)
         => conditionhyper(X0) ) )
   => ? [X0] :
        ( ~ gt(n0,X0)
        & s1(X0)
        & ! [X1] :
            ( gt(X0,X1)
           => conditionhyper(X1) ) ) )).

%------------------------------------------------------------------------------
