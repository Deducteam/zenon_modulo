%--------------------------------------------------------------------------
% File     : MGT002+1 : TPTP v6.1.0. Released v2.0.0.
% Domain   : Management (Organisation Theory)
% Problem  : Structural inertia increases monotonically with age.
% Version  : [PB+94] axioms.
% English  :

% Refs     : [PB+92] Peli et al. (1992), A Logical Approach to Formalizing
%          : [PB+94] Peli et al. (1994), A Logical Approach to Formalizing
%          : [Kam94] Kamps (1994), Email to G. Sutcliffe
% Source   : [Kam94]
% Names    : THEOREM 2 [PB+92]
%          : T2FOL2 [PB+94]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.50 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0, 0.00 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.05 v3.7.0, 0.00 v3.2.0, 0.11 v3.1.0, 0.00 v2.1.0
% Syntax   : Number of formulae    :    5 (   0 unit)
%            Number of atoms       :   29 (   0 equality)
%            Maximal formula depth :   17 (  10 average)
%            Number of connectives :   24 (   0 ~  ;   0  |;  18  &)
%                                         (   1 <=>;   5 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    5 (   0 propositional; 2-3 arity)
%            Number of functors    :    0 (   0 constant; --- arity)
%            Number of variables   :   24 (   0 singleton;  23 !;   1 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
fof(mp3,axiom,
    ( ! [X,T] :
        ( organization(X,T)
       => ? [Rp] : reproducibility(X,Rp,T) ) )).

fof(mp4,axiom,
    ( ! [X,T1,T2] :
        ( reorganization_free(X,T1,T2)
       => ( reorganization_free(X,T1,T1)
          & reorganization_free(X,T2,T2) ) ) )).

%----High levels of reproducibility of structure generate strong
%----inertial pressures.
fof(a3_FOL,hypothesis,
    ( ! [X,Y,T1,T2,Rp1,Rp2,I1,I2] :
        ( ( organization(X,T1)
          & organization(Y,T2)
          & reorganization_free(X,T1,T1)
          & reorganization_free(Y,T2,T2)
          & reproducibility(X,Rp1,T1)
          & reproducibility(Y,Rp2,T2)
          & inertia(X,I1,T1)
          & inertia(Y,I2,T2) )
       => ( greater(Rp2,Rp1)
        <=> greater(I2,I1) ) ) )).

%----Reproducibility of structure increases monotonically with age.
fof(a4_FOL,hypothesis,
    ( ! [X,Rp1,Rp2,T1,T2] :
        ( ( organization(X,T1)
          & organization(X,T2)
          & reorganization_free(X,T1,T2)
          & reproducibility(X,Rp1,T1)
          & reproducibility(X,Rp2,T2)
          & greater(T2,T1) )
       => greater(Rp2,Rp1) ) )).

fof(t2_FOL,conjecture,
    ( ! [X,I1,I2,T1,T2] :
        ( ( organization(X,T1)
          & organization(X,T2)
          & reorganization_free(X,T1,T2)
          & inertia(X,I1,T1)
          & inertia(X,I2,T2)
          & greater(T2,T1) )
       => greater(I2,I1) ) )).

%--------------------------------------------------------------------------
