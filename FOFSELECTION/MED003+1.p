%------------------------------------------------------------------------------
% File     : MED003+1 : TPTP v6.1.0. Released v3.2.0.
% Domain   : Medicine
% Problem  : Insulin treatment
% Version  : [HLB05] axioms : Especial.
% English  : Whether or not patients with exhausted production of glucose in
%            the B-cells are at least not hyperglycaemic afterwards.

% Refs     : [HLB05] Hommersom et al. (2005), Automated Theorem Proving for
%          : [Hom06] Hommersom (2006), Email to G. Sutcliffe
% Source   : [Hom06]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.12 v6.0.0, 0.25 v5.4.0, 0.26 v5.3.0, 0.30 v5.2.0, 0.14 v5.0.0, 0.15 v4.1.0, 0.17 v4.0.1, 0.16 v4.0.0, 0.15 v3.7.0, 0.33 v3.5.0, 0.25 v3.3.0, 0.22 v3.2.0
% Syntax   : Number of formulae    :   19 (   1 unit)
%            Number of atoms       :   84 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :  104 (  39 ~  ;  13  |;  17  &)
%                                         (   0 <=>;  35 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   15 (   0 propositional; 1-2 arity)
%            Number of functors    :    1 (   1 constant; 0-0 arity)
%            Number of variables   :   45 (   0 singleton;  45 !;   0 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
include('Axioms/MED001+0.ax').
%------------------------------------------------------------------------------
fof(treatmentex,conjecture,
    ( ( ! [X0] :
          ( ~ gt(n0,X0)
         => drugi(X0) )
      & ! [X0] :
          ( gt(n0,X0)
         => conditionhyper(X0) )
      & bcapacityex(n0) )
   => ! [X0] :
        ( ~ gt(n0,X0)
       => ( conditionnormo(X0)
          | conditionhypo(X0) ) ) )).

%------------------------------------------------------------------------------
