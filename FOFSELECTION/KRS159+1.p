%------------------------------------------------------------------------------
% File     : KRS159+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : DL Test: k_path ABox test from DL98 systems comparison
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_description-logic-Manifest666 [Bec03]

% Status   : Theorem
% Rating   : 0.18 v6.1.0, 0.12 v6.0.0, 0.25 v5.5.0, 0.29 v5.4.0, 0.22 v5.3.0, 0.30 v5.2.0, 0.21 v5.0.0, 0.20 v4.1.0, 0.22 v4.0.1, 0.21 v4.0.0, 0.20 v3.7.0, 0.67 v3.5.0, 0.38 v3.4.0, 0.42 v3.3.0, 0.22 v3.2.0, 0.44 v3.1.0
% Syntax   : Number of formulae    :  343 ( 127 unit)
%            Number of atoms       :  690 (   0 equality)
%            Maximal formula depth :   52 (   3 average)
%            Number of connectives :  401 (  54 ~  ;   0  |; 132  &)
%                                         ( 187 <=>;  28 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :  197 (   0 propositional; 1-2 arity)
%            Number of functors    :   11 (  11 constant; 0-0 arity)
%            Number of variables   :  353 (   0 singleton; 217 !; 136 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Sean Bechhofer says there are some errors in the encoding of
%            datatypes, so this problem may not be perfect. At least it's
%            still representative of the type of reasoning required for OWL.
%------------------------------------------------------------------------------
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

%----Equality cC10
fof(axiom_2,axiom,
    ( ! [X] :
        ( cC10(X)
      <=> ( cC8(X)
          & cC4(X) ) ) )).

%----Equality cC100
fof(axiom_3,axiom,
    ( ! [X] :
        ( cC100(X)
      <=> ? [Y0] : ra_Px33(X,Y0) ) )).

%----Equality cC100xcomp
fof(axiom_4,axiom,
    ( ! [X] :
        ( cC100xcomp(X)
      <=> ~ ( ? [Y] : ra_Px33(X,Y) ) ) )).

%----Equality cC102
fof(axiom_5,axiom,
    ( ! [X] :
        ( cC102(X)
      <=> ~ ( ? [Y] : ra_Px34(X,Y) ) ) )).

%----Equality cC102
fof(axiom_6,axiom,
    ( ! [X] :
        ( cC102(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC6xcomp(Y) ) ) )).

%----Equality cC102xcomp
fof(axiom_7,axiom,
    ( ! [X] :
        ( cC102xcomp(X)
      <=> ? [Y0] : ra_Px34(X,Y0) ) )).

%----Equality cC104
fof(axiom_8,axiom,
    ( ! [X] :
        ( cC104(X)
      <=> ( cC102xcomp(X)
          & cC100xcomp(X) ) ) )).

%----Equality cC104
fof(axiom_9,axiom,
    ( ! [X] :
        ( cC104(X)
      <=> ~ ( ? [Y] : ra_Px85(X,Y) ) ) )).

%----Equality cC104xcomp
fof(axiom_10,axiom,
    ( ! [X] :
        ( cC104xcomp(X)
      <=> ? [Y0] : ra_Px85(X,Y0) ) )).

%----Equality cC106
fof(axiom_11,axiom,
    ( ! [X] :
        ( cC106(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC104(Y) ) ) )).

%----Equality cC106
fof(axiom_12,axiom,
    ( ! [X] :
        ( cC106(X)
      <=> ? [Y0] : ra_Px36(X,Y0) ) )).

%----Equality cC106xcomp
fof(axiom_13,axiom,
    ( ! [X] :
        ( cC106xcomp(X)
      <=> ~ ( ? [Y] : ra_Px36(X,Y) ) ) )).

%----Equality cC108
fof(axiom_14,axiom,
    ( ! [X] :
        ( cC108(X)
      <=> ( cC98xcomp(X)
          & cC106xcomp(X) ) ) )).

%----Equality cC110
fof(axiom_15,axiom,
    ( ! [X] :
        ( cC110(X)
      <=> ( cC108(X)
          & cTOP(X) ) ) )).

%----Equality cC112
fof(axiom_16,axiom,
    ( ! [X] :
        ( cC112(X)
      <=> ( cC110(X)
          & cC90(X) ) ) )).

%----Equality cC114
fof(axiom_17,axiom,
    ( ! [X] :
        ( cC114(X)
      <=> cTOP(X) ) )).

%----Equality cC116
fof(axiom_18,axiom,
    ( ! [X] :
        ( cC116(X)
      <=> ( cC114(X)
          & cC112(X) ) ) )).

%----Equality cC118
fof(axiom_19,axiom,
    ( ! [X] :
        ( cC118(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC92xcomp(Y) ) ) )).

%----Equality cC118
fof(axiom_20,axiom,
    ( ! [X] :
        ( cC118(X)
      <=> ? [Y0] : ra_Px39(X,Y0) ) )).

%----Equality cC118xcomp
fof(axiom_21,axiom,
    ( ! [X] :
        ( cC118xcomp(X)
      <=> ~ ( ? [Y] : ra_Px39(X,Y) ) ) )).

%----Equality cC12
fof(axiom_22,axiom,
    ( ! [X] :
        ( cC12(X)
      <=> ~ ( ? [Y] : ra_Px1(X,Y) ) ) )).

%----Equality cC12xcomp
fof(axiom_23,axiom,
    ( ! [X] :
        ( cC12xcomp(X)
      <=> ? [Y0] : ra_Px1(X,Y0) ) )).

%----Equality cC120
fof(axiom_24,axiom,
    ( ! [X] :
        ( cC120(X)
      <=> ? [Y0] : ra_Px84(X,Y0) ) )).

%----Equality cC120
fof(axiom_25,axiom,
    ( ! [X] :
        ( cC120(X)
      <=> ( cC92xcomp(X)
          & cC118xcomp(X) ) ) )).

%----Equality cC120xcomp
fof(axiom_26,axiom,
    ( ! [X] :
        ( cC120xcomp(X)
      <=> ~ ( ? [Y] : ra_Px84(X,Y) ) ) )).

%----Equality cC122
fof(axiom_27,axiom,
    ( ! [X] :
        ( cC122(X)
      <=> ~ ( ? [Y] : ra_Px43(X,Y) ) ) )).

%----Equality cC122
fof(axiom_28,axiom,
    ( ! [X] :
        ( cC122(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC120(Y) ) ) )).

%----Equality cC122xcomp
fof(axiom_29,axiom,
    ( ! [X] :
        ( cC122xcomp(X)
      <=> ? [Y0] : ra_Px43(X,Y0) ) )).

%----Equality cC124
fof(axiom_30,axiom,
    ( ! [X] :
        ( cC124(X)
      <=> ? [Y0] : ra_Px42(X,Y0) ) )).

%----Equality cC124
fof(axiom_31,axiom,
    ( ! [X] :
        ( cC124(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC92xcomp(Y) ) ) )).

%----Equality cC124xcomp
fof(axiom_32,axiom,
    ( ! [X] :
        ( cC124xcomp(X)
      <=> ~ ( ? [Y] : ra_Px42(X,Y) ) ) )).

%----Equality cC126
fof(axiom_33,axiom,
    ( ! [X] :
        ( cC126(X)
      <=> ? [Y0] : ra_Px83(X,Y0) ) )).

%----Equality cC126
fof(axiom_34,axiom,
    ( ! [X] :
        ( cC126(X)
      <=> ( cC124xcomp(X)
          & cC100xcomp(X) ) ) )).

%----Equality cC126xcomp
fof(axiom_35,axiom,
    ( ! [X] :
        ( cC126xcomp(X)
      <=> ~ ( ? [Y] : ra_Px83(X,Y) ) ) )).

%----Equality cC128
fof(axiom_36,axiom,
    ( ! [X] :
        ( cC128(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC126(Y) ) ) )).

%----Equality cC128
fof(axiom_37,axiom,
    ( ! [X] :
        ( cC128(X)
      <=> ? [Y0] : ra_Px44(X,Y0) ) )).

%----Equality cC128xcomp
fof(axiom_38,axiom,
    ( ! [X] :
        ( cC128xcomp(X)
      <=> ~ ( ? [Y] : ra_Px44(X,Y) ) ) )).

%----Equality cC130
fof(axiom_39,axiom,
    ( ! [X] :
        ( cC130(X)
      <=> ( cC128xcomp(X)
          & cC122xcomp(X) ) ) )).

%----Equality cC132
fof(axiom_40,axiom,
    ( ! [X] :
        ( cC132(X)
      <=> ( cC130(X)
          & cTOP(X) ) ) )).

%----Equality cC134
fof(axiom_41,axiom,
    ( ! [X] :
        ( cC134(X)
      <=> ( cC116(X)
          & cC132(X) ) ) )).

%----Equality cC136
fof(axiom_42,axiom,
    ( ! [X] :
        ( cC136(X)
      <=> cTOP(X) ) )).

%----Equality cC138
fof(axiom_43,axiom,
    ( ! [X] :
        ( cC138(X)
      <=> ( cC136(X)
          & cC134(X) ) ) )).

%----Equality cC14
fof(axiom_44,axiom,
    ( ! [X] :
        ( cC14(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC12xcomp(Y) ) ) )).

%----Equality cC140
fof(axiom_45,axiom,
    ( ! [X] :
        ( cC140(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC100xcomp(Y) ) ) )).

%----Equality cC140
fof(axiom_46,axiom,
    ( ! [X] :
        ( cC140(X)
      <=> ? [Y0] : ra_Px47(X,Y0) ) )).

%----Equality cC140xcomp
fof(axiom_47,axiom,
    ( ! [X] :
        ( cC140xcomp(X)
      <=> ~ ( ? [Y] : ra_Px47(X,Y) ) ) )).

%----Equality cC142
fof(axiom_48,axiom,
    ( ! [X] :
        ( cC142(X)
      <=> ( cC140xcomp(X)
          & cC92xcomp(X) ) ) )).

%----Equality cC142
fof(axiom_49,axiom,
    ( ! [X] :
        ( cC142(X)
      <=> ~ ( ? [Y] : ra_Px82(X,Y) ) ) )).

%----Equality cC142xcomp
fof(axiom_50,axiom,
    ( ! [X] :
        ( cC142xcomp(X)
      <=> ? [Y0] : ra_Px82(X,Y0) ) )).

%----Equality cC144
fof(axiom_51,axiom,
    ( ! [X] :
        ( cC144(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC142(Y) ) ) )).

%----Equality cC144
fof(axiom_52,axiom,
    ( ! [X] :
        ( cC144(X)
      <=> ? [Y0] : ra_Px51(X,Y0) ) )).

%----Equality cC144xcomp
fof(axiom_53,axiom,
    ( ! [X] :
        ( cC144xcomp(X)
      <=> ~ ( ? [Y] : ra_Px51(X,Y) ) ) )).

%----Equality cC146
fof(axiom_54,axiom,
    ( ! [X] :
        ( cC146(X)
      <=> ? [Y0] : ra_Px50(X,Y0) ) )).

%----Equality cC146
fof(axiom_55,axiom,
    ( ! [X] :
        ( cC146(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC100xcomp(Y) ) ) )).

%----Equality cC146xcomp
fof(axiom_56,axiom,
    ( ! [X] :
        ( cC146xcomp(X)
      <=> ~ ( ? [Y] : ra_Px50(X,Y) ) ) )).

%----Equality cC148
fof(axiom_57,axiom,
    ( ! [X] :
        ( cC148(X)
      <=> ? [Y0] : ra_Px81(X,Y0) ) )).

%----Equality cC148
fof(axiom_58,axiom,
    ( ! [X] :
        ( cC148(X)
      <=> ( cC100xcomp(X)
          & cC146xcomp(X) ) ) )).

%----Equality cC148xcomp
fof(axiom_59,axiom,
    ( ! [X] :
        ( cC148xcomp(X)
      <=> ~ ( ? [Y] : ra_Px81(X,Y) ) ) )).

%----Equality cC150
fof(axiom_60,axiom,
    ( ! [X] :
        ( cC150(X)
      <=> ~ ( ? [Y] : ra_Px52(X,Y) ) ) )).

%----Equality cC150
fof(axiom_61,axiom,
    ( ! [X] :
        ( cC150(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC148(Y) ) ) )).

%----Equality cC150xcomp
fof(axiom_62,axiom,
    ( ! [X] :
        ( cC150xcomp(X)
      <=> ? [Y0] : ra_Px52(X,Y0) ) )).

%----Equality cC152
fof(axiom_63,axiom,
    ( ! [X] :
        ( cC152(X)
      <=> ( cC144xcomp(X)
          & cC150xcomp(X) ) ) )).

%----Equality cC154
fof(axiom_64,axiom,
    ( ! [X] :
        ( cC154(X)
      <=> ( cC152(X)
          & cTOP(X) ) ) )).

%----Equality cC156
fof(axiom_65,axiom,
    ( ! [X] :
        ( cC156(X)
      <=> ( cC154(X)
          & cC138(X) ) ) )).

%----Equality cC158
fof(axiom_66,axiom,
    ( ! [X] :
        ( cC158(X)
      <=> ( cC22(X)
          & cC156(X) ) ) )).

%----Equality cC16
fof(axiom_67,axiom,
    ( ! [X] :
        ( cC16(X)
      <=> ( cC10(X)
          & cC14(X) ) ) )).

%----Equality cC160
fof(axiom_68,axiom,
    ( ! [X] :
        ( cC160(X)
      <=> ? [Y0] : ra_Px80(X,Y0) ) )).

%----Equality cC160
fof(axiom_69,axiom,
    ( ! [X] :
        ( cC160(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC6xcomp(Y) ) ) )).

%----Equality cC160xcomp
fof(axiom_70,axiom,
    ( ! [X] :
        ( cC160xcomp(X)
      <=> ~ ( ? [Y] : ra_Px80(X,Y) ) ) )).

%----Equality cC162
fof(axiom_71,axiom,
    ( ! [X] :
        ( cC162(X)
      <=> ~ ( ? [Y] : ra_Px55(X,Y) ) ) )).

%----Equality cC162
fof(axiom_72,axiom,
    ( ! [X] :
        ( cC162(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC160(Y) ) ) )).

%----Equality cC162xcomp
fof(axiom_73,axiom,
    ( ! [X] :
        ( cC162xcomp(X)
      <=> ? [Y0] : ra_Px55(X,Y0) ) )).

%----Equality cC164
fof(axiom_74,axiom,
    ( ! [X] :
        ( cC164(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC92xcomp(Y) ) ) )).

%----Equality cC164
fof(axiom_75,axiom,
    ( ! [X] :
        ( cC164(X)
      <=> ~ ( ? [Y] : ra_Px79(X,Y) ) ) )).

%----Equality cC164xcomp
fof(axiom_76,axiom,
    ( ! [X] :
        ( cC164xcomp(X)
      <=> ? [Y0] : ra_Px79(X,Y0) ) )).

%----Equality cC166
fof(axiom_77,axiom,
    ( ! [X] :
        ( cC166(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC164(Y) ) ) )).

%----Equality cC166
fof(axiom_78,axiom,
    ( ! [X] :
        ( cC166(X)
      <=> ? [Y0] : ra_Px56(X,Y0) ) )).

%----Equality cC166xcomp
fof(axiom_79,axiom,
    ( ! [X] :
        ( cC166xcomp(X)
      <=> ~ ( ? [Y] : ra_Px56(X,Y) ) ) )).

%----Equality cC168
fof(axiom_80,axiom,
    ( ! [X] :
        ( cC168(X)
      <=> ( cC162xcomp(X)
          & cC166xcomp(X) ) ) )).

%----Equality cC170
fof(axiom_81,axiom,
    ( ! [X] :
        ( cC170(X)
      <=> ? [Y0] : ra_Px78(X,Y0) ) )).

%----Equality cC170
fof(axiom_82,axiom,
    ( ! [X] :
        ( cC170(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC18xcomp(Y) ) ) )).

%----Equality cC170xcomp
fof(axiom_83,axiom,
    ( ! [X] :
        ( cC170xcomp(X)
      <=> ~ ( ? [Y] : ra_Px78(X,Y) ) ) )).

%----Equality cC172
fof(axiom_84,axiom,
    ( ! [X] :
        ( cC172(X)
      <=> ~ ( ? [Y] : ra_Px58(X,Y) ) ) )).

%----Equality cC172
fof(axiom_85,axiom,
    ( ! [X] :
        ( cC172(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC170(Y) ) ) )).

%----Equality cC172xcomp
fof(axiom_86,axiom,
    ( ! [X] :
        ( cC172xcomp(X)
      <=> ? [Y0] : ra_Px58(X,Y0) ) )).

%----Equality cC174
fof(axiom_87,axiom,
    ( ! [X] :
        ( cC174(X)
      <=> ( cC172xcomp(X)
          & cC168(X) ) ) )).

%----Equality cC176
fof(axiom_88,axiom,
    ( ! [X] :
        ( cC176(X)
      <=> ? [Y0] : ra_Px77(X,Y0) ) )).

%----Equality cC176
fof(axiom_89,axiom,
    ( ! [X] :
        ( cC176(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC100xcomp(Y) ) ) )).

%----Equality cC176xcomp
fof(axiom_90,axiom,
    ( ! [X] :
        ( cC176xcomp(X)
      <=> ~ ( ? [Y] : ra_Px77(X,Y) ) ) )).

%----Equality cC178
fof(axiom_91,axiom,
    ( ! [X] :
        ( cC178(X)
      <=> ? [Y0] : ra_Px60(X,Y0) ) )).

%----Equality cC178
fof(axiom_92,axiom,
    ( ! [X] :
        ( cC178(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC176(Y) ) ) )).

%----Equality cC178xcomp
fof(axiom_93,axiom,
    ( ! [X] :
        ( cC178xcomp(X)
      <=> ~ ( ? [Y] : ra_Px60(X,Y) ) ) )).

%----Equality cC18
fof(axiom_94,axiom,
    ( ! [X] :
        ( cC18(X)
      <=> ? [Y0] : ra_Px2(X,Y0) ) )).

%----Equality cC18xcomp
fof(axiom_95,axiom,
    ( ! [X] :
        ( cC18xcomp(X)
      <=> ~ ( ? [Y] : ra_Px2(X,Y) ) ) )).

%----Equality cC180
fof(axiom_96,axiom,
    ( ! [X] :
        ( cC180(X)
      <=> ( cC174(X)
          & cC178xcomp(X) ) ) )).

%----Equality cC2
fof(axiom_97,axiom,
    ( ! [X] :
        ( cC2(X)
      <=> ? [Y0] : ra_Px3(X,Y0) ) )).

%----Equality cC2xcomp
fof(axiom_98,axiom,
    ( ! [X] :
        ( cC2xcomp(X)
      <=> ~ ( ? [Y] : ra_Px3(X,Y) ) ) )).

%----Equality cC20
fof(axiom_99,axiom,
    ( ! [X] :
        ( cC20(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC18xcomp(Y) ) ) )).

%----Equality cC22
fof(axiom_100,axiom,
    ( ! [X] :
        ( cC22(X)
      <=> ( cC20(X)
          & cC16(X) ) ) )).

%----Equality cC24
fof(axiom_101,axiom,
    ( ! [X] :
        ( cC24(X)
      <=> ? [Y0] : ra_Px5(X,Y0) ) )).

%----Equality cC24
fof(axiom_102,axiom,
    ( ! [X] :
        ( cC24(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC24xcomp
fof(axiom_103,axiom,
    ( ! [X] :
        ( cC24xcomp(X)
      <=> ~ ( ? [Y] : ra_Px5(X,Y) ) ) )).

%----Equality cC26
fof(axiom_104,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ? [Y0] : ra_Px92(X,Y0) ) )).

%----Equality cC26
fof(axiom_105,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ( cC24xcomp(X)
          & cC2xcomp(X) ) ) )).

%----Equality cC26xcomp
fof(axiom_106,axiom,
    ( ! [X] :
        ( cC26xcomp(X)
      <=> ~ ( ? [Y] : ra_Px92(X,Y) ) ) )).

%----Equality cC28
fof(axiom_107,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC26(Y) ) ) )).

%----Equality cC28
fof(axiom_108,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ? [Y0] : ra_Px9(X,Y0) ) )).

%----Equality cC28xcomp
fof(axiom_109,axiom,
    ( ! [X] :
        ( cC28xcomp(X)
      <=> ~ ( ? [Y] : ra_Px9(X,Y) ) ) )).

%----Equality cC30
fof(axiom_110,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ? [Y0] : ra_Px8(X,Y0) ) )).

%----Equality cC30
fof(axiom_111,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC12xcomp(Y) ) ) )).

%----Equality cC30xcomp
fof(axiom_112,axiom,
    ( ! [X] :
        ( cC30xcomp(X)
      <=> ~ ( ? [Y] : ra_Px8(X,Y) ) ) )).

%----Equality cC32
fof(axiom_113,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ~ ( ? [Y] : ra_Px91(X,Y) ) ) )).

%----Equality cC32
fof(axiom_114,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ( cC2xcomp(X)
          & cC30xcomp(X) ) ) )).

%----Equality cC32xcomp
fof(axiom_115,axiom,
    ( ! [X] :
        ( cC32xcomp(X)
      <=> ? [Y0] : ra_Px91(X,Y0) ) )).

%----Equality cC34
fof(axiom_116,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ~ ( ? [Y] : ra_Px10(X,Y) ) ) )).

%----Equality cC34
fof(axiom_117,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC32(Y) ) ) )).

%----Equality cC34xcomp
fof(axiom_118,axiom,
    ( ! [X] :
        ( cC34xcomp(X)
      <=> ? [Y0] : ra_Px10(X,Y0) ) )).

%----Equality cC36
fof(axiom_119,axiom,
    ( ! [X] :
        ( cC36(X)
      <=> ( cC34xcomp(X)
          & cC28xcomp(X) ) ) )).

%----Equality cC38
fof(axiom_120,axiom,
    ( ! [X] :
        ( cC38(X)
      <=> ( cC36(X)
          & cTOP(X) ) ) )).

%----Equality cC4
fof(axiom_121,axiom,
    ( ! [X] :
        ( cC4(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC40
fof(axiom_122,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> cTOP(X) ) )).

%----Equality cC42
fof(axiom_123,axiom,
    ( ! [X] :
        ( cC42(X)
      <=> ( cC40(X)
          & cC38(X) ) ) )).

%----Equality cC44
fof(axiom_124,axiom,
    ( ! [X] :
        ( cC44(X)
      <=> ~ ( ? [Y] : ra_Px13(X,Y) ) ) )).

%----Equality cC44
fof(axiom_125,axiom,
    ( ! [X] :
        ( cC44(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC44xcomp
fof(axiom_126,axiom,
    ( ! [X] :
        ( cC44xcomp(X)
      <=> ? [Y0] : ra_Px13(X,Y0) ) )).

%----Equality cC46
fof(axiom_127,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ? [Y0] : ra_Px90(X,Y0) ) )).

%----Equality cC46
fof(axiom_128,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ( cC44xcomp(X)
          & cC12xcomp(X) ) ) )).

%----Equality cC46xcomp
fof(axiom_129,axiom,
    ( ! [X] :
        ( cC46xcomp(X)
      <=> ~ ( ? [Y] : ra_Px90(X,Y) ) ) )).

%----Equality cC48
fof(axiom_130,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ? [Y0] : ra_Px17(X,Y0) ) )).

%----Equality cC48
fof(axiom_131,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC46(Y) ) ) )).

%----Equality cC48xcomp
fof(axiom_132,axiom,
    ( ! [X] :
        ( cC48xcomp(X)
      <=> ~ ( ? [Y] : ra_Px17(X,Y) ) ) )).

%----Equality cC50
fof(axiom_133,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC12xcomp(Y) ) ) )).

%----Equality cC50
fof(axiom_134,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ~ ( ? [Y] : ra_Px16(X,Y) ) ) )).

%----Equality cC50xcomp
fof(axiom_135,axiom,
    ( ! [X] :
        ( cC50xcomp(X)
      <=> ? [Y0] : ra_Px16(X,Y0) ) )).

%----Equality cC52
fof(axiom_136,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ? [Y0] : ra_Px89(X,Y0) ) )).

%----Equality cC52
fof(axiom_137,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ( cC50xcomp(X)
          & cC12xcomp(X) ) ) )).

%----Equality cC52xcomp
fof(axiom_138,axiom,
    ( ! [X] :
        ( cC52xcomp(X)
      <=> ~ ( ? [Y] : ra_Px89(X,Y) ) ) )).

%----Equality cC54
fof(axiom_139,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC52(Y) ) ) )).

%----Equality cC54
fof(axiom_140,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ? [Y0] : ra_Px18(X,Y0) ) )).

%----Equality cC54xcomp
fof(axiom_141,axiom,
    ( ! [X] :
        ( cC54xcomp(X)
      <=> ~ ( ? [Y] : ra_Px18(X,Y) ) ) )).

%----Equality cC56
fof(axiom_142,axiom,
    ( ! [X] :
        ( cC56(X)
      <=> ( cC48xcomp(X)
          & cC54xcomp(X) ) ) )).

%----Equality cC58
fof(axiom_143,axiom,
    ( ! [X] :
        ( cC58(X)
      <=> ( cC56(X)
          & cTOP(X) ) ) )).

%----Equality cC6
fof(axiom_144,axiom,
    ( ! [X] :
        ( cC6(X)
      <=> ? [Y0] : ra_Px27(X,Y0) ) )).

%----Equality cC6xcomp
fof(axiom_145,axiom,
    ( ! [X] :
        ( cC6xcomp(X)
      <=> ~ ( ? [Y] : ra_Px27(X,Y) ) ) )).

%----Equality cC60
fof(axiom_146,axiom,
    ( ! [X] :
        ( cC60(X)
      <=> ( cC58(X)
          & cC42(X) ) ) )).

%----Equality cC62
fof(axiom_147,axiom,
    ( ! [X] :
        ( cC62(X)
      <=> cTOP(X) ) )).

%----Equality cC64
fof(axiom_148,axiom,
    ( ! [X] :
        ( cC64(X)
      <=> ( cC60(X)
          & cC62(X) ) ) )).

%----Equality cC66
fof(axiom_149,axiom,
    ( ! [X] :
        ( cC66(X)
      <=> ? [Y0] : ra_Px21(X,Y0) ) )).

%----Equality cC66
fof(axiom_150,axiom,
    ( ! [X] :
        ( cC66(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC66xcomp
fof(axiom_151,axiom,
    ( ! [X] :
        ( cC66xcomp(X)
      <=> ~ ( ? [Y] : ra_Px21(X,Y) ) ) )).

%----Equality cC68
fof(axiom_152,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ~ ( ? [Y] : ra_Px88(X,Y) ) ) )).

%----Equality cC68
fof(axiom_153,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ( cC18xcomp(X)
          & cC66xcomp(X) ) ) )).

%----Equality cC68xcomp
fof(axiom_154,axiom,
    ( ! [X] :
        ( cC68xcomp(X)
      <=> ? [Y0] : ra_Px88(X,Y0) ) )).

%----Equality cC70
fof(axiom_155,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC68(Y) ) ) )).

%----Equality cC70
fof(axiom_156,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ~ ( ? [Y] : ra_Px25(X,Y) ) ) )).

%----Equality cC70xcomp
fof(axiom_157,axiom,
    ( ! [X] :
        ( cC70xcomp(X)
      <=> ? [Y0] : ra_Px25(X,Y0) ) )).

%----Equality cC72
fof(axiom_158,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ? [Y0] : ra_Px24(X,Y0) ) )).

%----Equality cC72
fof(axiom_159,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC12xcomp(Y) ) ) )).

%----Equality cC72xcomp
fof(axiom_160,axiom,
    ( ! [X] :
        ( cC72xcomp(X)
      <=> ~ ( ? [Y] : ra_Px24(X,Y) ) ) )).

%----Equality cC74
fof(axiom_161,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ( cC72xcomp(X)
          & cC18xcomp(X) ) ) )).

%----Equality cC74
fof(axiom_162,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ? [Y0] : ra_Px87(X,Y0) ) )).

%----Equality cC74xcomp
fof(axiom_163,axiom,
    ( ! [X] :
        ( cC74xcomp(X)
      <=> ~ ( ? [Y] : ra_Px87(X,Y) ) ) )).

%----Equality cC76
fof(axiom_164,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC74(Y) ) ) )).

%----Equality cC76
fof(axiom_165,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ? [Y0] : ra_Px26(X,Y0) ) )).

%----Equality cC76xcomp
fof(axiom_166,axiom,
    ( ! [X] :
        ( cC76xcomp(X)
      <=> ~ ( ? [Y] : ra_Px26(X,Y) ) ) )).

%----Equality cC78
fof(axiom_167,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ( cC70xcomp(X)
          & cC76xcomp(X) ) ) )).

%----Equality cC8
fof(axiom_168,axiom,
    ( ! [X] :
        ( cC8(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC6xcomp(Y) ) ) )).

%----Equality cC80
fof(axiom_169,axiom,
    ( ! [X] :
        ( cC80(X)
      <=> ( cC78(X)
          & cTOP(X) ) ) )).

%----Equality cC82
fof(axiom_170,axiom,
    ( ! [X] :
        ( cC82(X)
      <=> ( cC64(X)
          & cC80(X) ) ) )).

%----Equality cC84
fof(axiom_171,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> cTOP(X) ) )).

%----Equality cC86
fof(axiom_172,axiom,
    ( ! [X] :
        ( cC86(X)
      <=> ( cC82(X)
          & cC84(X) ) ) )).

%----Equality cC88
fof(axiom_173,axiom,
    ( ! [X] :
        ( cC88(X)
      <=> cTOP(X) ) )).

%----Equality cC90
fof(axiom_174,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ( cC86(X)
          & cC88(X) ) ) )).

%----Equality cC92
fof(axiom_175,axiom,
    ( ! [X] :
        ( cC92(X)
      <=> ~ ( ? [Y] : ra_Px28(X,Y) ) ) )).

%----Equality cC92xcomp
fof(axiom_176,axiom,
    ( ! [X] :
        ( cC92xcomp(X)
      <=> ? [Y0] : ra_Px28(X,Y0) ) )).

%----Equality cC94
fof(axiom_177,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y0] : ra_Px29(X,Y0) ) )).

%----Equality cC94
fof(axiom_178,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC6xcomp(Y) ) ) )).

%----Equality cC94xcomp
fof(axiom_179,axiom,
    ( ! [X] :
        ( cC94xcomp(X)
      <=> ~ ( ? [Y] : ra_Px29(X,Y) ) ) )).

%----Equality cC96
fof(axiom_180,axiom,
    ( ! [X] :
        ( cC96(X)
      <=> ( cC94xcomp(X)
          & cC92xcomp(X) ) ) )).

%----Equality cC96
fof(axiom_181,axiom,
    ( ! [X] :
        ( cC96(X)
      <=> ? [Y0] : ra_Px86(X,Y0) ) )).

%----Equality cC96xcomp
fof(axiom_182,axiom,
    ( ! [X] :
        ( cC96xcomp(X)
      <=> ~ ( ? [Y] : ra_Px86(X,Y) ) ) )).

%----Equality cC98
fof(axiom_183,axiom,
    ( ! [X] :
        ( cC98(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC96(Y) ) ) )).

%----Equality cC98
fof(axiom_184,axiom,
    ( ! [X] :
        ( cC98(X)
      <=> ? [Y0] : ra_Px35(X,Y0) ) )).

%----Equality cC98xcomp
fof(axiom_185,axiom,
    ( ! [X] :
        ( cC98xcomp(X)
      <=> ~ ( ? [Y] : ra_Px35(X,Y) ) ) )).

%----Equality cTEST
fof(axiom_186,axiom,
    ( ! [X] :
        ( cTEST(X)
      <=> ( cC158(X)
          & cC180(X) ) ) )).

%----iV21026
fof(axiom_187,axiom,
    ( cC150xcomp(iV21026) )).

%----iV21026
fof(axiom_188,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC170xcomp(X) ) )).

%----iV21026
fof(axiom_189,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC46xcomp(X) ) )).

%----iV21026
fof(axiom_190,axiom,
    ( cTOP(iV21026) )).

%----iV21026
fof(axiom_191,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC160xcomp(X) ) )).

%----iV21026
fof(axiom_192,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC176xcomp(X) ) )).

%----iV21026
fof(axiom_193,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC164xcomp(X) ) )).

%----iV21026
fof(axiom_194,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC148xcomp(X) ) )).

%----iV21026
fof(axiom_195,axiom,
    ( cC76xcomp(iV21026) )).

%----iV21026
fof(axiom_196,axiom,
    ( cC98xcomp(iV21026) )).

%----iV21026
fof(axiom_197,axiom,
    ( cC128xcomp(iV21026) )).

%----iV21026
fof(axiom_198,axiom,
    ( cC166xcomp(iV21026) )).

%----iV21026
fof(axiom_199,axiom,
    ( cC106xcomp(iV21026) )).

%----iV21026
fof(axiom_200,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC120xcomp(X) ) )).

%----iV21026
fof(axiom_201,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC68xcomp(X) ) )).

%----iV21026
fof(axiom_202,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC26xcomp(X) ) )).

%----iV21026
fof(axiom_203,axiom,
    ( cC34xcomp(iV21026) )).

%----iV21026
fof(axiom_204,axiom,
    ( cC144xcomp(iV21026) )).

%----iV21026
fof(axiom_205,axiom,
    ( cC28xcomp(iV21026) )).

%----iV21026
fof(axiom_206,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC104xcomp(X) ) )).

%----iV21026
fof(axiom_207,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC126xcomp(X) ) )).

%----iV21026
fof(axiom_208,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC96xcomp(X) ) )).

%----iV21026
fof(axiom_209,axiom,
    ( cC54xcomp(iV21026) )).

%----iV21026
fof(axiom_210,axiom,
    ( cC122xcomp(iV21026) )).

%----iV21026
fof(axiom_211,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC52xcomp(X) ) )).

%----iV21026
fof(axiom_212,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC142xcomp(X) ) )).

%----iV21026
fof(axiom_213,axiom,
    ( cC162xcomp(iV21026) )).

%----iV21026
fof(axiom_214,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC32xcomp(X) ) )).

%----iV21026
fof(axiom_215,axiom,
    ( cC70xcomp(iV21026) )).

%----iV21026
fof(axiom_216,axiom,
    ( cC172xcomp(iV21026) )).

%----iV21026
fof(axiom_217,axiom,
    ( cC48xcomp(iV21026) )).

%----iV21026
fof(axiom_218,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => cC74xcomp(X) ) )).

%----iV21026
fof(axiom_219,axiom,
    ( cowlThing(iV21026) )).

%----iV21026
fof(axiom_220,axiom,
    ( cC178xcomp(iV21026) )).

%----iV21026
fof(axiom_221,axiom,
    ( cTEST(iV21026) )).

fof(axiom_222,axiom,
    ( rR1(iV21026,iV21030) )).

fof(axiom_223,axiom,
    ( rR1(iV21026,iV21027) )).

fof(axiom_224,axiom,
    ( rR1(iV21026,iV21028) )).

fof(axiom_225,axiom,
    ( rR1(iV21026,iV21029) )).

%----iV21027
fof(axiom_226,axiom,
    ( cC12(iV21027) )).

%----iV21027
fof(axiom_227,axiom,
    ( ! [X] :
        ( rR1(iV21027,X)
       => cC18(X) ) )).

%----iV21027
fof(axiom_228,axiom,
    ( cC176xcomp(iV21027) )).

%----iV21027
fof(axiom_229,axiom,
    ( cC96xcomp(iV21027) )).

%----iV21027
fof(axiom_230,axiom,
    ( cC170xcomp(iV21027) )).

%----iV21027
fof(axiom_231,axiom,
    ( cC120xcomp(iV21027) )).

%----iV21027
fof(axiom_232,axiom,
    ( cC92(iV21027) )).

%----iV21027
fof(axiom_233,axiom,
    ( ! [X] :
        ( rR1(iV21027,X)
       => cC6(X) ) )).

%----iV21027
fof(axiom_234,axiom,
    ( cC148xcomp(iV21027) )).

%----iV21027
fof(axiom_235,axiom,
    ( cC142xcomp(iV21027) )).

%----iV21027
fof(axiom_236,axiom,
    ( cC68xcomp(iV21027) )).

%----iV21027
fof(axiom_237,axiom,
    ( cC2xcomp(iV21027) )).

%----iV21027
fof(axiom_238,axiom,
    ( cC18(iV21027) )).

%----iV21027
fof(axiom_239,axiom,
    ( cC52xcomp(iV21027) )).

%----iV21027
fof(axiom_240,axiom,
    ( ! [X] :
        ( rR1(iV21027,X)
       => cC100(X) ) )).

%----iV21027
fof(axiom_241,axiom,
    ( cC104xcomp(iV21027) )).

%----iV21027
fof(axiom_242,axiom,
    ( cC26xcomp(iV21027) )).

%----iV21027
fof(axiom_243,axiom,
    ( cC46xcomp(iV21027) )).

%----iV21027
fof(axiom_244,axiom,
    ( cC126xcomp(iV21027) )).

%----iV21027
fof(axiom_245,axiom,
    ( cC164xcomp(iV21027) )).

%----iV21027
fof(axiom_246,axiom,
    ( cC100(iV21027) )).

%----iV21027
fof(axiom_247,axiom,
    ( cC160xcomp(iV21027) )).

%----iV21027
fof(axiom_248,axiom,
    ( cowlThing(iV21027) )).

%----iV21027
fof(axiom_249,axiom,
    ( cC74xcomp(iV21027) )).

%----iV21027
fof(axiom_250,axiom,
    ( cC32xcomp(iV21027) )).

%----iV21027
fof(axiom_251,axiom,
    ( ! [X] :
        ( rR1(iV21027,X)
       => cC92(X) ) )).

fof(axiom_252,axiom,
    ( rR1(iV21027,iV21036) )).

fof(axiom_253,axiom,
    ( rR1(iV21027,iV21035) )).

%----iV21028
fof(axiom_254,axiom,
    ( cowlThing(iV21028) )).

%----iV21029
fof(axiom_255,axiom,
    ( ! [X] :
        ( rR1(iV21029,X)
       => cC6(X) ) )).

%----iV21029
fof(axiom_256,axiom,
    ( cC176xcomp(iV21029) )).

%----iV21029
fof(axiom_257,axiom,
    ( cC96xcomp(iV21029) )).

%----iV21029
fof(axiom_258,axiom,
    ( cC120xcomp(iV21029) )).

%----iV21029
fof(axiom_259,axiom,
    ( cC170xcomp(iV21029) )).

%----iV21029
fof(axiom_260,axiom,
    ( ! [X] :
        ( rR1(iV21029,X)
       => cC18(X) ) )).

%----iV21029
fof(axiom_261,axiom,
    ( cC92(iV21029) )).

%----iV21029
fof(axiom_262,axiom,
    ( cC148xcomp(iV21029) )).

%----iV21029
fof(axiom_263,axiom,
    ( cC142xcomp(iV21029) )).

%----iV21029
fof(axiom_264,axiom,
    ( cC68xcomp(iV21029) )).

%----iV21029
fof(axiom_265,axiom,
    ( cC12xcomp(iV21029) )).

%----iV21029
fof(axiom_266,axiom,
    ( ! [X] :
        ( rR1(iV21029,X)
       => cC92(X) ) )).

%----iV21029
fof(axiom_267,axiom,
    ( cC18(iV21029) )).

%----iV21029
fof(axiom_268,axiom,
    ( cC52xcomp(iV21029) )).

%----iV21029
fof(axiom_269,axiom,
    ( cC104xcomp(iV21029) )).

%----iV21029
fof(axiom_270,axiom,
    ( cC2(iV21029) )).

%----iV21029
fof(axiom_271,axiom,
    ( cC26xcomp(iV21029) )).

%----iV21029
fof(axiom_272,axiom,
    ( cC46xcomp(iV21029) )).

%----iV21029
fof(axiom_273,axiom,
    ( ! [X] :
        ( rR1(iV21029,X)
       => cC100(X) ) )).

%----iV21029
fof(axiom_274,axiom,
    ( cC126xcomp(iV21029) )).

%----iV21029
fof(axiom_275,axiom,
    ( cC164xcomp(iV21029) )).

%----iV21029
fof(axiom_276,axiom,
    ( cC100(iV21029) )).

%----iV21029
fof(axiom_277,axiom,
    ( cC160xcomp(iV21029) )).

%----iV21029
fof(axiom_278,axiom,
    ( cowlThing(iV21029) )).

%----iV21029
fof(axiom_279,axiom,
    ( cC74xcomp(iV21029) )).

%----iV21029
fof(axiom_280,axiom,
    ( cC32xcomp(iV21029) )).

fof(axiom_281,axiom,
    ( rR1(iV21029,iV21034) )).

fof(axiom_282,axiom,
    ( rR1(iV21029,iV21033) )).

%----iV21030
fof(axiom_283,axiom,
    ( cC12(iV21030) )).

%----iV21030
fof(axiom_284,axiom,
    ( cC176xcomp(iV21030) )).

%----iV21030
fof(axiom_285,axiom,
    ( cC96xcomp(iV21030) )).

%----iV21030
fof(axiom_286,axiom,
    ( cC170xcomp(iV21030) )).

%----iV21030
fof(axiom_287,axiom,
    ( cC120xcomp(iV21030) )).

%----iV21030
fof(axiom_288,axiom,
    ( cC92(iV21030) )).

%----iV21030
fof(axiom_289,axiom,
    ( cC148xcomp(iV21030) )).

%----iV21030
fof(axiom_290,axiom,
    ( cC142xcomp(iV21030) )).

%----iV21030
fof(axiom_291,axiom,
    ( cC68xcomp(iV21030) )).

%----iV21030
fof(axiom_292,axiom,
    ( ! [X] :
        ( rR1(iV21030,X)
       => cC6(X) ) )).

%----iV21030
fof(axiom_293,axiom,
    ( cC18xcomp(iV21030) )).

%----iV21030
fof(axiom_294,axiom,
    ( cC52xcomp(iV21030) )).

%----iV21030
fof(axiom_295,axiom,
    ( cC104xcomp(iV21030) )).

%----iV21030
fof(axiom_296,axiom,
    ( cC2(iV21030) )).

%----iV21030
fof(axiom_297,axiom,
    ( ! [X] :
        ( rR1(iV21030,X)
       => cC100(X) ) )).

%----iV21030
fof(axiom_298,axiom,
    ( cC26xcomp(iV21030) )).

%----iV21030
fof(axiom_299,axiom,
    ( ! [X] :
        ( rR1(iV21030,X)
       => cC18(X) ) )).

%----iV21030
fof(axiom_300,axiom,
    ( cC46xcomp(iV21030) )).

%----iV21030
fof(axiom_301,axiom,
    ( cC126xcomp(iV21030) )).

%----iV21030
fof(axiom_302,axiom,
    ( cC164xcomp(iV21030) )).

%----iV21030
fof(axiom_303,axiom,
    ( ! [X] :
        ( rR1(iV21030,X)
       => cC92(X) ) )).

%----iV21030
fof(axiom_304,axiom,
    ( cC100(iV21030) )).

%----iV21030
fof(axiom_305,axiom,
    ( cC160xcomp(iV21030) )).

%----iV21030
fof(axiom_306,axiom,
    ( cowlThing(iV21030) )).

%----iV21030
fof(axiom_307,axiom,
    ( cC74xcomp(iV21030) )).

%----iV21030
fof(axiom_308,axiom,
    ( cC32xcomp(iV21030) )).

fof(axiom_309,axiom,
    ( rR1(iV21030,iV21032) )).

fof(axiom_310,axiom,
    ( rR1(iV21030,iV21031) )).

%----iV21031
fof(axiom_311,axiom,
    ( cowlThing(iV21031) )).

%----iV21032
fof(axiom_312,axiom,
    ( cC2xcomp(iV21032) )).

%----iV21032
fof(axiom_313,axiom,
    ( cC92(iV21032) )).

%----iV21032
fof(axiom_314,axiom,
    ( cC100(iV21032) )).

%----iV21032
fof(axiom_315,axiom,
    ( cC6(iV21032) )).

%----iV21032
fof(axiom_316,axiom,
    ( cowlThing(iV21032) )).

%----iV21032
fof(axiom_317,axiom,
    ( cC18(iV21032) )).

%----iV21033
fof(axiom_318,axiom,
    ( cC92(iV21033) )).

%----iV21033
fof(axiom_319,axiom,
    ( cC12xcomp(iV21033) )).

%----iV21033
fof(axiom_320,axiom,
    ( cC100(iV21033) )).

%----iV21033
fof(axiom_321,axiom,
    ( cC6(iV21033) )).

%----iV21033
fof(axiom_322,axiom,
    ( cowlThing(iV21033) )).

%----iV21033
fof(axiom_323,axiom,
    ( cC18(iV21033) )).

%----iV21034
fof(axiom_324,axiom,
    ( cC92(iV21034) )).

%----iV21034
fof(axiom_325,axiom,
    ( cC2xcomp(iV21034) )).

%----iV21034
fof(axiom_326,axiom,
    ( cC100(iV21034) )).

%----iV21034
fof(axiom_327,axiom,
    ( cC6(iV21034) )).

%----iV21034
fof(axiom_328,axiom,
    ( cowlThing(iV21034) )).

%----iV21034
fof(axiom_329,axiom,
    ( cC18(iV21034) )).

%----iV21035
fof(axiom_330,axiom,
    ( cC92(iV21035) )).

%----iV21035
fof(axiom_331,axiom,
    ( cC12xcomp(iV21035) )).

%----iV21035
fof(axiom_332,axiom,
    ( cC100(iV21035) )).

%----iV21035
fof(axiom_333,axiom,
    ( cC6(iV21035) )).

%----iV21035
fof(axiom_334,axiom,
    ( cowlThing(iV21035) )).

%----iV21035
fof(axiom_335,axiom,
    ( cC18(iV21035) )).

%----iV21036
fof(axiom_336,axiom,
    ( cC92(iV21036) )).

%----iV21036
fof(axiom_337,axiom,
    ( cC2xcomp(iV21036) )).

%----iV21036
fof(axiom_338,axiom,
    ( cC100(iV21036) )).

%----iV21036
fof(axiom_339,axiom,
    ( cC6(iV21036) )).

%----iV21036
fof(axiom_340,axiom,
    ( cowlThing(iV21036) )).

%----iV21036
fof(axiom_341,axiom,
    ( cC18(iV21036) )).

%----Thing and Nothing
%----String and Integer disjoint
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21027
%----iV21027
%----iV21027
%----iV21029
%----iV21029
%----iV21029
%----iV21030
%----iV21030
%----iV21030
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & cC108(iV21026)
    & cC40(iV21026)
    & cC136(iV21026)
    & cC10(iV21026)
    & cC90(iV21026)
    & cowlThing(iV21026)
    & cC58(iV21026)
    & cC56(iV21026)
    & cC158(iV21026)
    & cC110(iV21026)
    & cC22(iV21026)
    & cC60(iV21026)
    & cC154(iV21026)
    & cC180(iV21026)
    & cC78(iV21026)
    & cC16(iV21026)
    & cC132(iV21026)
    & cC114(iV21026)
    & cC20(iV21026)
    & cC84(iV21026)
    & cC38(iV21026)
    & cC138(iV21026)
    & cC174(iV21026)
    & cC62(iV21026)
    & cC8(iV21026)
    & cC36(iV21026)
    & cC112(iV21026)
    & cC64(iV21026)
    & cC116(iV21026)
    & cC82(iV21026)
    & cC14(iV21026)
    & cC152(iV21026)
    & cC80(iV21026)
    & cC88(iV21026)
    & cC130(iV21026)
    & cC168(iV21026)
    & cC4(iV21026)
    & cC134(iV21026)
    & cC42(iV21026)
    & cC156(iV21026)
    & cC86(iV21026)
    & cC30(iV21027)
    & cowlThing(iV21027)
    & cC24(iV21027)
    & cC50(iV21029)
    & cC44(iV21029)
    & cowlThing(iV21029)
    & cC72(iV21030)
    & cC66(iV21030)
    & cowlThing(iV21030) )).

%------------------------------------------------------------------------------
