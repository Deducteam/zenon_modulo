%--------------------------------------------------------------------------
% File     : GRA010+2 : TPTP v6.1.0. Bugfixed v3.2.0.
% Domain   : Graph Theory
% Problem  : Maximal shortest path length in terms of triangles
% Version  : Augmented > Especial.
% English  : In a complete graph, if there is a shortest path P from V1 to
%            V2 with edges E1 and E2, E1 sequential to E2 means there is an
%            edge E3 such that E1, E2, and E3 form a triangle, then the
%            number of sequential pairs in P is the number of triangles
%            in P.

% Refs     :
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.13 v6.0.0, 0.17 v5.5.0, 0.19 v5.4.0, 0.25 v5.3.0, 0.30 v5.2.0, 0.20 v5.1.0, 0.29 v5.0.0, 0.25 v4.1.0, 0.30 v4.0.1, 0.35 v4.0.0, 0.33 v3.7.0, 0.25 v3.5.0, 0.26 v3.4.0, 0.32 v3.3.0, 0.29 v3.2.0

% Syntax   : Number of formulae    :   19 (   1 unit)
%            Number of atoms       :  102 (  25 equality)
%            Maximal formula depth :   13 (   9 average)
%            Number of connectives :   89 (   6 ~  ;   3  |;  51  &)
%                                         (   3 <=>;  21 =>;   2 <=)
%                                         (   3 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   12 (   1 propositional; 0-3 arity)
%            Number of functors    :   12 (   6 constant; 0-2 arity)
%            Number of variables   :   77 (   0 singleton;  65 !;  12 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
% Bugfixes : v3.2.0 - Bugfix to GRA001+0.ax
%--------------------------------------------------------------------------
%----Include axioms for directed graphs and paths
include('Axioms/GRA001+0.ax').
%--------------------------------------------------------------------------
fof(triangle_defn,axiom,
    ( ! [E1,E2,E3] :
        ( triangle(E1,E2,E3)
      <=> ( edge(E1)
          & edge(E2)
          & edge(E3)
          & sequential(E1,E2)
          & sequential(E2,E3)
          & sequential(E3,E1) ) ) )).

fof(length_defn,axiom,
    ( ! [V1,V2,P] :
        ( path(V1,V2,P)
       => length_of(P) = number_of_in(edges,P) ) )).

fof(path_length_sequential_pairs,axiom,
    ( ! [V1,V2,P] :
        ( path(V1,V2,P)
       => number_of_in(sequential_pairs,P) = minus(length_of(P),n1) ) )).

fof(sequential_pairs_and_triangles,axiom,
    ( ! [P,V1,V2] :
        ( ( path(V1,V2,P)
          & ! [E1,E2] :
              ( ( on_path(E1,P)
                & on_path(E2,P)
                & sequential(E1,E2) )
             => ? [E3] : triangle(E1,E2,E3) ) )
       => number_of_in(sequential_pairs,P) = number_of_in(triangles,P) ) )).

fof(graph_has_them_all,axiom,
    ( ! [Things,InThese] : less_or_equal(number_of_in(Things,InThese),number_of_in(Things,graph)) )).

fof(sequential_is_triangle,lemma,
    ( complete
   => ! [V1,V2,E1,E2,P] :
        ( ( shortest_path(V1,V2,P)
          & precedes(E1,E2,P)
          & sequential(E1,E2) )
       => ? [E3] : triangle(E1,E2,E3) ) )).

fof(complete_means_sequential_pairs_and_triangles,conjecture,
    ( complete
   => ! [P,V1,V2] :
        ( ( path(V1,V2,P)
          & ! [E1,E2] :
              ( ( on_path(E1,P)
                & on_path(E2,P)
                & sequential(E1,E2) )
             => ? [E3] : triangle(E1,E2,E3) ) )
       => number_of_in(sequential_pairs,P) = number_of_in(triangles,P) ) )).
%--------------------------------------------------------------------------
