%------------------------------------------------------------------------------
% File     : MED002+1 : TPTP v6.1.0. Released v3.2.0.
% Domain   : Medicine
% Problem  : Combined biguanide and sulfonylurea treatment
% Version  : [HLB05] axioms : Especial.
% English  : Whether or not patients with nearly-exhausted production of
%            glucose in the B-cells are cured with a biguanide and sulfonylurea
%            combination therapy.

% Refs     : [HLB05] Hommersom et al. (2005), Automated Theorem Proving for
%          : [Hom06] Hommersom (2006), Email to G. Sutcliffe
% Source   : [Hom06]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.16 v6.0.0, 0.25 v5.5.0, 0.38 v5.4.0, 0.30 v5.3.0, 0.43 v5.2.0, 0.36 v5.0.0, 0.30 v4.1.0, 0.22 v4.0.1, 0.16 v4.0.0, 0.20 v3.7.0, 0.33 v3.5.0, 0.25 v3.3.0, 0.33 v3.2.0
% Syntax   : Number of formulae    :   19 (   1 unit)
%            Number of atoms       :   84 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :  104 (  39 ~  ;  12  |;  18  &)
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
fof(treatmentne,conjecture,
    ( ( ! [X0] :
          ( ~ gt(n0,X0)
         => ( drugbg(X0)
            & drugsu(X0) ) )
      & ! [X0] :
          ( gt(n0,X0)
         => conditionhyper(X0) )
      & bcapacityne(n0) )
   => ! [X0] :
        ( ~ gt(n0,X0)
       => conditionnormo(X0) ) )).

%------------------------------------------------------------------------------
