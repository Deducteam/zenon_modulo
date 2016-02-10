%------------------------------------------------------------------------------
% File     : NUM848+2 : TPTP v6.1.0. Released v4.1.0.
% Domain   : Number Theory
% Problem  : holds(286,441,4)
% Version  : Especial: Reduced > Especial.
% English  :

% Refs     : [Lan30] Landau (1930), Grundlagen der Analysis
%          : [Kue09] Kuehlwein (2009), Email to Geoff Sutcliffe
%          : [KC+10] Kuehlwein et al. (2010), Premise Selection in the Napr
% Source   : [Kue09]
% Names    :

% Status   : Theorem
% Rating   : 0.20 v6.1.0, 0.23 v6.0.0, 0.26 v5.5.0, 0.19 v5.4.0, 0.18 v5.3.0, 0.26 v5.2.0, 0.10 v5.0.0, 0.17 v4.1.0
% Syntax   : Number of formulae    :   16 (  12 unit)
%            Number of atoms       :   20 (  18 equality)
%            Maximal formula depth :    4 (   2 average)
%            Number of connectives :    5 (   1   ~;   0   |;   2   &)
%                                         (   0 <=>;   2  =>;   0  <=)
%                                         (   0 <~>;   0  ~|;   0  ~&)
%            Number of predicates  :    3 (   0 propositional; 2-2 arity)
%            Number of functors    :    8 (   4 constant; 0-2 arity)
%            Number of variables   :   15 (   0 sgn;  15   !;   0   ?)
%            Maximal term depth    :    4 (   3 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : From the Landau in Naproche 0.45 collection.
%          : This version uses a filtered set of axioms.
%------------------------------------------------------------------------------
fof('holds(286, 441, 4)',conjecture,(
    vplus(vmul(vd436,vd437),vplus(vmul(vd436,vd439),vd436)) = vplus(vmul(vd436,vd437),vmul(vd436,vsucc(vd439))) )).

fof('holds(286, 441, 3)',axiom,(
    vplus(vplus(vmul(vd436,vd437),vmul(vd436,vd439)),vd436) = vplus(vmul(vd436,vd437),vplus(vmul(vd436,vd439),vd436)) )).

fof('holds(286, 441, 2)',axiom,(
    vplus(vmul(vd436,vplus(vd437,vd439)),vd436) = vplus(vplus(vmul(vd436,vd437),vmul(vd436,vd439)),vd436) )).

fof('holds(286, 441, 1)',axiom,(
    vmul(vd436,vsucc(vplus(vd437,vd439))) = vplus(vmul(vd436,vplus(vd437,vd439)),vd436) )).

fof('holds(286, 441, 0)',axiom,(
    vmul(vd436,vplus(vd437,vsucc(vd439))) = vmul(vd436,vsucc(vplus(vd437,vd439))) )).

fof('holds(285, 440, 0)',axiom,(
    vmul(vd436,vplus(vd437,vd439)) = vplus(vmul(vd436,vd437),vmul(vd436,vd439)) )).

fof('holds(284, 438, 2)',axiom,(
    vplus(vmul(vd436,vd437),vd436) = vplus(vmul(vd436,vd437),vmul(vd436,v1)) )).

fof('holds(284, 438, 1)',axiom,(
    vmul(vd436,vsucc(vd437)) = vplus(vmul(vd436,vd437),vd436) )).

fof('qu(cond(conseq(axiom(3)), 32), and(holds(definiens(249), 399, 0), holds(definiens(249), 398, 0)))',axiom,(
    ! [Vd396,Vd397] :
      ( vmul(Vd396,vsucc(Vd397)) = vplus(vmul(Vd396,Vd397),Vd396)
      & vmul(Vd396,v1) = Vd396 ) )).

fof('ass(cond(241, 0), 0)',axiom,(
    ! [Vd386,Vd387] :
      ( less(Vd386,vplus(Vd387,v1))
     => leq(Vd386,Vd387) ) )).

fof('ass(cond(61, 0), 0)',axiom,(
    ! [Vd78,Vd79] : vplus(Vd79,Vd78) = vplus(Vd78,Vd79) )).

fof('ass(cond(52, 0), 0)',axiom,(
    ! [Vd68,Vd69] : vplus(vsucc(Vd68),Vd69) = vsucc(vplus(Vd68,Vd69)) )).

fof('ass(cond(43, 0), 0)',axiom,(
    ! [Vd59] : vplus(v1,Vd59) = vsucc(Vd59) )).

fof('ass(cond(33, 0), 0)',axiom,(
    ! [Vd46,Vd47,Vd48] : vplus(vplus(Vd46,Vd47),Vd48) = vplus(Vd46,vplus(Vd47,Vd48)) )).

fof('qu(cond(conseq(axiom(3)), 3), and(holds(definiens(29), 45, 0), holds(definiens(29), 44, 0)))',axiom,(
    ! [Vd42,Vd43] :
      ( vplus(Vd42,vsucc(Vd43)) = vsucc(vplus(Vd42,Vd43))
      & vplus(Vd42,v1) = vsucc(Vd42) ) )).

fof('ass(cond(20, 0), 0)',axiom,(
    ! [Vd24] :
      ( Vd24 != v1
     => Vd24 = vsucc(vskolem2(Vd24)) ) )).

%------------------------------------------------------------------------------
