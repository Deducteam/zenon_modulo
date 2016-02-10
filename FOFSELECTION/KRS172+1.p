%------------------------------------------------------------------------------
% File     : KRS172+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : The same property extension means equivalentProperty
% Version  : Especial.
% English  : If p and q have the same property extension then p
%            equivalentProperty q.

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_equivalentProperty-Manifest004 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v4.1.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.12 v3.7.0, 0.00 v3.2.0, 0.11 v3.1.0
% Syntax   : Number of formulae    :   19 (   1 unit)
%            Number of atoms       :   52 (  11 equality)
%            Maximal formula depth :    6 (   5 average)
%            Number of connectives :   37 (   4 ~  ;   0  |;  15  &)
%                                         (   5 <=>;  13 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    8 (   0 propositional; 1-2 arity)
%            Number of functors    :    1 (   1 constant; 0-0 arity)
%            Number of variables   :   40 (   0 singleton;  40 !;   0 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments : Sean Bechhofer says there are some errors in the encoding of
%            datatypes, so this problem may not be perfect. At least it's
%            still representative of the type of reasoning required for OWL.
%------------------------------------------------------------------------------
fof(cd_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cd(A) )
       => cd(B) ) )).

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

fof(rq_substitution_1,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rq(A,C) )
       => rq(B,C) ) )).

fof(rq_substitution_2,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rq(C,A) )
       => rq(C,B) ) )).

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

%----Equality cd
fof(axiom_2,axiom,
    ( ! [X] :
        ( cd(X)
      <=> rq(X,iv) ) )).

%----Equality cd
fof(axiom_3,axiom,
    ( ! [X] :
        ( cd(X)
      <=> rp(X,iv) ) )).

%----Functional: rp
fof(axiom_4,axiom,
    ( ! [X,Y,Z] :
        ( ( rp(X,Y)
          & rp(X,Z) )
       => Y = Z ) )).

%----Domain: rp
fof(axiom_5,axiom,
    ( ! [X,Y] :
        ( rp(X,Y)
       => cd(X) ) )).

%----Functional: rq
fof(axiom_6,axiom,
    ( ! [X,Y,Z] :
        ( ( rq(X,Y)
          & rq(X,Z) )
       => Y = Z ) )).

%----Domain: rq
fof(axiom_7,axiom,
    ( ! [X,Y] :
        ( rq(X,Y)
       => cd(X) ) )).

%----iv
fof(axiom_8,axiom,
    ( cowlThing(iv) )).

%----Thing and Nothing
%----String and Integer disjoint
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & ! [X,Y] :
        ( rq(X,Y)
      <=> rp(X,Y) ) )).

%------------------------------------------------------------------------------
