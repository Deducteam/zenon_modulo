%------------------------------------------------------------------------------
% File     : CSR114+6 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Commonsense Reasoning
% Problem  : In which Italian city can you find the Colosseum?
% Version  : [Pel09] axioms.
% English  :

% Refs     : [Glo07] Gloeckner (2007), University of Hagen at CLEF 2007: An
%          : [PW07]  Pelzer & Wernhard (2007), System Description: E-KRHype
%          : [FG+08] Furbach et al. (2008), LogAnswer - A Deduction-Based Q
%          : [Pel09] Pelzer (2009), Email to Geoff Sutcliffe
% Source   : [Pel09]
% Names    : synth_qa07_004_mira_news_526_tptp [Pel09]

% Status   : Theorem
% Rating   : 0.27 v6.1.0, 0.36 v6.0.0, 0.25 v5.5.0, 0.38 v5.4.0, 0.35 v5.3.0, 0.43 v5.2.0, 0.36 v5.0.0, 0.35 v4.1.0, 0.39 v4.0.1, 0.37 v4.0.0
% Syntax   : Number of formulae    : 10189 (10062 unit)
%            Number of atoms       : 10757 (   0 equality)
%            Maximal formula depth :   58 (   1 average)
%            Number of connectives :  568 (   0   ~;  18   |; 424   &)
%                                         (   0 <=>; 126  =>;   0  <=)
%                                         (   0 <~>;   0  ~|;   0  ~&)
%            Number of predicates  :   86 (   0 propositional; 2-3 arity)
%            Number of functors    : 16644 (16643 constant; 0-2 arity)
%            Number of variables   :  470 (   0 sgn; 405   !;  65   ?)
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
fof(synth_qa07_004_mira_news_526,conjecture,(
    ? [X0,X1] : attr(X0,X1) )).

fof(ave07_era5_synth_qa07_004_mira_news_526,hypothesis,
    ( attr(c5,c6)
    & attr(c5,c7)
    & sub(c6,tag_1_1)
    & val(c6,c3)
    & sub(c7,monat_1_1)
    & val(c7,c4)
    & sort(c5,t)
    & card(c5,int1)
    & etype(c5,int0)
    & fact(c5,real)
    & gener(c5,sp)
    & quant(c5,one)
    & refer(c5,det)
    & varia(c5,con)
    & sort(c6,me)
    & sort(c6,oa)
    & sort(c6,ta)
    & card(c6,card_c)
    & etype(c6,etype_c)
    & fact(c6,real)
    & gener(c6,sp)
    & quant(c6,quant_c)
    & refer(c6,refer_c)
    & varia(c6,varia_c)
    & sort(c7,me)
    & sort(c7,oa)
    & sort(c7,ta)
    & card(c7,card_c)
    & etype(c7,etype_c)
    & fact(c7,real)
    & gener(c7,sp)
    & quant(c7,quant_c)
    & refer(c7,refer_c)
    & varia(c7,varia_c)
    & sort(tag_1_1,me)
    & sort(tag_1_1,oa)
    & sort(tag_1_1,ta)
    & card(tag_1_1,card_c)
    & etype(tag_1_1,etype_c)
    & fact(tag_1_1,real)
    & gener(tag_1_1,ge)
    & quant(tag_1_1,quant_c)
    & refer(tag_1_1,refer_c)
    & varia(tag_1_1,varia_c)
    & sort(c3,nu)
    & card(c3,int9)
    & sort(monat_1_1,me)
    & sort(monat_1_1,oa)
    & sort(monat_1_1,ta)
    & card(monat_1_1,card_c)
    & etype(monat_1_1,etype_c)
    & fact(monat_1_1,real)
    & gener(monat_1_1,ge)
    & quant(monat_1_1,quant_c)
    & refer(monat_1_1,refer_c)
    & varia(monat_1_1,varia_c)
    & sort(c4,nu)
    & card(c4,int11) )).

%------------------------------------------------------------------------------
