%------------------------------------------------------------------------------
% File     : TOP022+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Topology (Homotopy theory)
% Problem  : Homotopy groups
% Version  : [Shu96] axioms : Especial.
% English  :

% Refs     : [Mun75] Munkres (1975), Topology: A First Course
%          : [Sch96] Shults (1996), Email to Geoff Sutcliffe
% Source   : [Sch96]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.09 v5.2.0, 0.00 v3.1.0
% Syntax   : Number of formulae    :    4 (   0 unit)
%            Number of atoms       :   12 (   0 equality)
%            Maximal formula depth :    7 (   6 average)
%            Number of connectives :    8 (   0 ~  ;   0  |;   3  &)
%                                         (   2 <=>;   3 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    5 (   0 propositional; 1-4 arity)
%            Number of functors    :    2 (   0 constant; 1-2 arity)
%            Number of variables   :   14 (   0 singleton;  12 !;   2 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
%----What it means to be isomorphic
fof(isomorphic_groups_defn,axiom,
    ( ! [A,B] :
        ( isomorphic_groups(A,B)
      <=> ? [F] : a_group_isomorphism_from_to(F,A,B) ) )).

%----The definition of path connectedness
fof(path_connected_defn,axiom,
    ( ! [X,X0,X1] :
        ( path_connected(X)
      <=> ( ( a_member_of(X0,X)
            & a_member_of(X1,X) )
         => ? [P] : a_path_from_to_in(P,X0,X1,X) ) ) )).

%----Theorem 2.1 in Chapter 8 of Munkres
fof(m_8_2_1,axiom,
    ( ! [A,X0,X1,X] :
        ( a_path_from_to_in(A,X0,X1,X)
       => a_group_isomorphism_from_to(alpha_hat(A),first_homotop_grp(X,X0),first_homotop_grp(X,X1)) ) )).

fof(m_8_2_2,conjecture,
    ( ! [X,X0,X1] :
        ( ( path_connected(X)
          & a_member_of(X0,X)
          & a_member_of(X1,X) )
       => isomorphic_groups(first_homotop_grp(X,X0),first_homotop_grp(X,X1)) ) )).
%------------------------------------------------------------------------------
