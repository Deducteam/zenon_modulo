%------------------------------------------------------------------------------
% File     : MSC017+1 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Miscellaneous
% Problem  : Diving has no bad outcomes
% Version  : Especial.
% English  :

% Refs     :
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.04 v6.1.0, 0.10 v6.0.0, 0.04 v5.3.0, 0.11 v5.2.0, 0.00 v4.0.0
% Syntax   : Number of formulae    :    7 (   1 unit)
%            Number of atoms       :   20 (   2 equality)
%            Maximal formula depth :    6 (   4 average)
%            Number of connectives :   16 (   3   ~;   1   |;   2   &)
%                                         (   2 <=>;   8  =>;   0  <=)
%                                         (   0 <~>;   0  ~|;   0  ~&)
%            Number of predicates  :    5 (   0 propositional; 1-2 arity)
%            Number of functors    :    8 (   4 constant; 0-2 arity)
%            Number of variables   :    8 (   0 sgn;   8   !;   0   ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----The nitrogen of a dive is a function of the depth and time
fof(dive_nitrogen,axiom,(
    ! [D] :
      ( dive(D)
     => nitrogen(D) = padi(depth(D),time(D)) ) )).

fof(depth_and_time_and_nitrogen,axiom,(
    ! [D] :
      ( dive(D)
     => ( ( greater(depth(D),depth_limit)
          | greater(time(D),time_limit) )
      <=> greater(nitrogen(D),nitrogen_limit) ) ) )).

%----If the nitrogen of a dive is greater than the nitrogen limit, then
%----an outcome of the dive is DCI
fof(too_much_nitrogen,axiom,(
    ! [D] :
      ( dive(D)
     => ( greater(nitrogen(D),nitrogen_limit)
      <=> outcome(D,dci) ) ) )).

%----DCI is bad
fof(bad_dci,axiom,(
    bad(dci) )).

%----DCI is the only bad outcome of a dive
fof(dci_is_the_only_bad_outcome,axiom,(
    ! [D] :
      ( dive(D)
     => ! [O] :
          ( ( outcome(D,O)
            & bad(O) )
         => O = dci ) ) )).

%----No deep long dives
fof(no_deep_long,axiom,(
    ! [D] :
      ( dive(D)
     => ( ~ greater(depth(D),depth_limit)
        & ~ greater(time(D),time_limit) ) ) )).

%----No bad outcomes
fof(no_bad,conjecture,(
    ! [D] :
      ( dive(D)
     => ! [O] :
          ( outcome(D,O)
         => ~ bad(O) ) ) )).

%------------------------------------------------------------------------------
