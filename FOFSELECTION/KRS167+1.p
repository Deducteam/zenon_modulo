%------------------------------------------------------------------------------
% File     : KRS167+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : Two classes with the same complete description are equivalent
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_equivalentClass-Manifest004 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.03 v6.0.0, 0.04 v5.5.0, 0.11 v5.4.0, 0.14 v5.3.0, 0.19 v5.2.0, 0.00 v4.1.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.00 v3.2.0, 0.11 v3.1.0
% Syntax   : Number of formulae    :   13 (   0 unit)
%            Number of atoms       :   44 (  10 equality)
%            Maximal formula depth :    8 (   6 average)
%            Number of connectives :   35 (   4 ~  ;   0  |;  16  &)
%                                         (   5 <=>;  10 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    8 (   0 propositional; 1-2 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   31 (   0 singleton;  29 !;   2 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Sean Bechhofer says there are some errors in the encoding of
%            datatypes, so this problem may not be perfect. At least it's
%            still representative of the type of reasoning required for OWL.
%------------------------------------------------------------------------------
fof(cc1_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cc1(A) )
       => cc1(B) ) )).

fof(cc2_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cc2(A) )
       => cc2(B) ) )).

fof(cowlNothing_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cowlNothing(A) )
       => cowlNothing(B) ) )).

fof(cowlThing_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cowlThing(A) )
       => cowlThing(B) ) )).

fof(rp_substitution_1,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rp(A,C) )
       => rp(B,C) ) )).

fof(rp_substitution_2,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rp(C,A) )
       => rp(C,B) ) )).

fof(xsd_integer_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & xsd_integer(A) )
       => xsd_integer(B) ) )).

fof(xsd_string_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & xsd_string(A) )
       => xsd_string(B) ) )).

%----Thing and Nothing
fof(axiom_0,axiom,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) ) )).

%----String and Integer disjoint
fof(axiom_1,axiom,
    ( ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) ) )).

%----Equality cc1
fof(axiom_2,axiom,
    ( ! [X] :
        ( cc1(X)
      <=> ( ? [Y0] : rp(X,Y0)
          & ! [Y0,Y1] :
              ( ( rp(X,Y0)
                & rp(X,Y1) )
             => Y0 = Y1 ) ) ) )).

%----Equality cc2
fof(axiom_3,axiom,
    ( ! [X] :
        ( cc2(X)
      <=> ( ? [Y0] : rp(X,Y0)
          & ! [Y0,Y1] :
              ( ( rp(X,Y0)
                & rp(X,Y1) )
             => Y0 = Y1 ) ) ) )).

%----Thing and Nothing
%----String and Integer disjoint
%----Equality cc1
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & ! [X] :
        ( cc1(X)
      <=> cc2(X) ) )).

%------------------------------------------------------------------------------
