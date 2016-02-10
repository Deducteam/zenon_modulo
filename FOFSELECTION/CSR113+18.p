%------------------------------------------------------------------------------
% File     : CSR113+18 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Commonsense Reasoning
% Problem  : Where can you find the Statue of Liberty?
% Version  : [Pel09] axioms.
% English  :

% Refs     : [Glo07] Gloeckner (2007), University of Hagen at CLEF 2007: An
%          : [PW07]  Pelzer & Wernhard (2007), System Description: E-KRHype
%          : [FG+08] Furbach et al. (2008), LogAnswer - A Deduction-Based Q
%          : [Pel09] Pelzer (2009), Email to Geoff Sutcliffe
% Source   : [Pel09]
% Names    : synth_qa07_003_mira_wp_222_a19713_tptp [Pel09]

% Status   : Theorem
% Rating   : 0.27 v6.1.0, 0.36 v6.0.0, 0.50 v5.4.0, 0.48 v5.3.0, 0.57 v5.2.0, 0.36 v5.0.0, 0.40 v4.1.0, 0.44 v4.0.1, 0.42 v4.0.0
% Syntax   : Number of formulae    : 10189 (10061 unit)
%            Number of atoms       : 10828 (   0 equality)
%            Maximal formula depth :  123 (   1 average)
%            Number of connectives :  639 (   0   ~;  18   |; 495   &)
%                                         (   0 <=>; 126  =>;   0  <=)
%                                         (   0 <~>;   0  ~|;   0  ~&)
%            Number of predicates  :   89 (   0 propositional; 2-3 arity)
%            Number of functors    : 16650 (16649 constant; 0-2 arity)
%            Number of variables   :  473 (   0 sgn; 405   !;  68   ?)
%            Maximal term depth    :    5 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : The different versions of this problem stem from the use of
%            different text snippet retrieval modules, and different snippets
%            being found. The problem tries to prove the questions from the
%            snippet and the background knowledge.
%------------------------------------------------------------------------------
%----Include LogAnswer axioms
include('Axioms/CSR004+0.ax').
%------------------------------------------------------------------------------
fof(synth_qa07_003_mira_wp_222_a19713,conjecture,(
    ? [X0,X1,X2,X3,X4] :
      ( attr(X2,X1)
      & loc(X3,X0)
      & scar(X3,X4)
      & sub(X1,name_1_1)
      & sub(X4,freiheitsstatue_1_1)
      & subs(X3,stehen_1_1)
      & val(X1,new_york_0) ) )).

fof(ave07_era5_synth_qa07_003_mira_wp_222_a19713,hypothesis,
    ( supl(c34,bekannt_1_1,c35)
    & prop(c4,c34)
    & sub(c4,freiheitsstatue_1_1)
    & attr(c41,c42)
    & sub(c41,stadt__1_1)
    & sub(c42,name_1_1)
    & val(c42,new_york_0)
    & mexp(c44,c50)
    & semrel(c44,c8)
    & subs(c44,sehen_1_1)
    & vor(c53,c41)
    & loc(c8,c53)
    & scar(c8,c4)
    & subs(c8,stehen_1_1)
    & assoc(freiheitsstatue_1_1,freiheit_1_1)
    & sub(freiheitsstatue_1_1,statue_1_1)
    & sort(c34,tq)
    & sort(bekannt_1_1,nq)
    & sort(c35,o)
    & card(c35,card_c)
    & etype(c35,int1)
    & etype(c35,int2)
    & fact(c35,real)
    & gener(c35,gener_c)
    & quant(c35,quant_c)
    & refer(c35,refer_c)
    & varia(c35,varia_c)
    & sort(c4,d)
    & card(c4,int1)
    & etype(c4,int0)
    & fact(c4,real)
    & gener(c4,sp)
    & quant(c4,one)
    & refer(c4,det)
    & varia(c4,con)
    & sort(freiheitsstatue_1_1,d)
    & card(freiheitsstatue_1_1,int1)
    & etype(freiheitsstatue_1_1,int0)
    & fact(freiheitsstatue_1_1,real)
    & gener(freiheitsstatue_1_1,ge)
    & quant(freiheitsstatue_1_1,one)
    & refer(freiheitsstatue_1_1,refer_c)
    & varia(freiheitsstatue_1_1,varia_c)
    & sort(c41,d)
    & sort(c41,io)
    & card(c41,int1)
    & etype(c41,int0)
    & fact(c41,real)
    & gener(c41,sp)
    & quant(c41,one)
    & refer(c41,det)
    & varia(c41,con)
    & sort(c42,na)
    & card(c42,int1)
    & etype(c42,int0)
    & fact(c42,real)
    & gener(c42,sp)
    & quant(c42,one)
    & refer(c42,indet)
    & varia(c42,varia_c)
    & sort(stadt__1_1,d)
    & sort(stadt__1_1,io)
    & card(stadt__1_1,int1)
    & etype(stadt__1_1,int0)
    & fact(stadt__1_1,real)
    & gener(stadt__1_1,ge)
    & quant(stadt__1_1,one)
    & refer(stadt__1_1,refer_c)
    & varia(stadt__1_1,varia_c)
    & sort(name_1_1,na)
    & card(name_1_1,int1)
    & etype(name_1_1,int0)
    & fact(name_1_1,real)
    & gener(name_1_1,ge)
    & quant(name_1_1,one)
    & refer(name_1_1,refer_c)
    & varia(name_1_1,varia_c)
    & sort(new_york_0,fe)
    & sort(c44,dn)
    & fact(c44,real)
    & gener(c44,sp)
    & sort(c50,d)
    & card(c50,int1)
    & etype(c50,int0)
    & fact(c50,real)
    & gener(c50,sp)
    & quant(c50,one)
    & refer(c50,det)
    & varia(c50,varia_c)
    & sort(c8,st)
    & fact(c8,real)
    & gener(c8,sp)
    & sort(sehen_1_1,dn)
    & fact(sehen_1_1,real)
    & gener(sehen_1_1,ge)
    & sort(c53,l)
    & card(c53,int1)
    & etype(c53,int0)
    & fact(c53,real)
    & gener(c53,sp)
    & quant(c53,one)
    & refer(c53,det)
    & varia(c53,con)
    & sort(stehen_1_1,st)
    & fact(stehen_1_1,real)
    & gener(stehen_1_1,ge)
    & sort(freiheit_1_1,as)
    & sort(freiheit_1_1,io)
    & card(freiheit_1_1,int1)
    & etype(freiheit_1_1,int0)
    & fact(freiheit_1_1,real)
    & gener(freiheit_1_1,ge)
    & quant(freiheit_1_1,one)
    & refer(freiheit_1_1,refer_c)
    & varia(freiheit_1_1,varia_c)
    & sort(statue_1_1,d)
    & card(statue_1_1,int1)
    & etype(statue_1_1,int0)
    & fact(statue_1_1,real)
    & gener(statue_1_1,ge)
    & quant(statue_1_1,one)
    & refer(statue_1_1,refer_c)
    & varia(statue_1_1,varia_c) )).

%------------------------------------------------------------------------------
