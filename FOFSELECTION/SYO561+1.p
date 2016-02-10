%------------------------------------------------------------------------------
% File     : SYO561+1 : TPTP v6.1.0. Released v5.3.0.
% Domain   : Syntactic
% Problem  : Distinct objects
% Version  : Biased.
% English  : 

% Refs     : 
% Source   : TPTP
% Names    : 

% Status   : Theorem
% Rating   : 0.67 v6.1.0, 0.50 v6.0.0, 0.67 v5.5.0, 0.78 v5.3.0
% Syntax   : Number of formulae    :    1 (   1 unit)
%            Number of atoms       :    1 (   1 equality)
%            Maximal formula depth :    2 (   2 average)
%            Number of connectives :    1 (   1   ~;   0   |;   0   &)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    1 (   0 propositional; 2-2 arity)
%            Number of functors    :    2 (   2 constant; 0-0 arity)
%            Number of variables   :    0 (   0 sgn;   0   !;   0   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments : Designed to test if systems have implemented distinct objects.
%------------------------------------------------------------------------------
fof(apple_not_microsoft,conjecture,(
    "Apple" != "Microsoft" )).

%------------------------------------------------------------------------------
