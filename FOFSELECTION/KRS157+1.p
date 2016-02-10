%------------------------------------------------------------------------------
% File     : KRS157+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : ABox test from DL98 systems comparison
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_description-logic-Manifest664 [Bec03]

% Status   : Theorem
% Rating   : 0.09 v6.1.0, 0.12 v6.0.0, 0.25 v5.5.0, 0.12 v5.4.0, 0.13 v5.3.0, 0.22 v5.2.0, 0.14 v5.0.0, 0.15 v4.1.0, 0.11 v4.0.0, 0.10 v3.7.0, 0.33 v3.5.0, 0.12 v3.4.0, 0.08 v3.3.0, 0.11 v3.1.0
% Syntax   : Number of formulae    :  220 (  12 unit)
%            Number of atoms       :  544 (   0 equality)
%            Maximal formula depth :   10 (   4 average)
%            Number of connectives :  375 (  51 ~  ;   0  |; 117  &)
%                                         ( 202 <=>;   5 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :  209 (   0 propositional; 1-2 arity)
%            Number of functors    :    1 (   1 constant; 0-0 arity)
%            Number of variables   :  357 (   0 singleton; 209 !; 148 ?)
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
      <=> ? [Y0] : ra_Px87(X,Y0) ) )).

%----Equality cC10
fof(axiom_3,axiom,
    ( ! [X] :
        ( cC10(X)
      <=> ( cC2xcomp(X)
          & cC8xcomp(X) ) ) )).

%----Equality cC10xcomp
fof(axiom_4,axiom,
    ( ! [X] :
        ( cC10xcomp(X)
      <=> ~ ( ? [Y] : ra_Px87(X,Y) ) ) )).

%----Equality cC100
fof(axiom_5,axiom,
    ( ! [X] :
        ( cC100(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC98xcomp(Y) ) ) )).

%----Equality cC100
fof(axiom_6,axiom,
    ( ! [X] :
        ( cC100(X)
      <=> ~ ( ? [Y] : ra_Px76(X,Y) ) ) )).

%----Equality cC100xcomp
fof(axiom_7,axiom,
    ( ! [X] :
        ( cC100xcomp(X)
      <=> ? [Y0] : ra_Px76(X,Y0) ) )).

%----Equality cC102
fof(axiom_8,axiom,
    ( ! [X] :
        ( cC102(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC104
fof(axiom_9,axiom,
    ( ! [X] :
        ( cC104(X)
      <=> ( cC16(X)
          & cC102(X) ) ) )).

%----Equality cC106
fof(axiom_10,axiom,
    ( ! [X] :
        ( cC106(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC104(Y) ) ) )).

%----Equality cC106
fof(axiom_11,axiom,
    ( ! [X] :
        ( cC106(X)
      <=> ~ ( ? [Y] : ra_Px37(X,Y) ) ) )).

%----Equality cC106xcomp
fof(axiom_12,axiom,
    ( ! [X] :
        ( cC106xcomp(X)
      <=> ? [Y0] : ra_Px37(X,Y0) ) )).

%----Equality cC108
fof(axiom_13,axiom,
    ( ! [X] :
        ( cC108(X)
      <=> ( cC16xcomp(X)
          & cC106xcomp(X) ) ) )).

%----Equality cC108
fof(axiom_14,axiom,
    ( ! [X] :
        ( cC108(X)
      <=> ? [Y0] : ra_Px45(X,Y0) ) )).

%----Equality cC108xcomp
fof(axiom_15,axiom,
    ( ! [X] :
        ( cC108xcomp(X)
      <=> ~ ( ? [Y] : ra_Px45(X,Y) ) ) )).

%----Equality cC110
fof(axiom_16,axiom,
    ( ! [X] :
        ( cC110(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC112
fof(axiom_17,axiom,
    ( ! [X] :
        ( cC112(X)
      <=> ( cC16(X)
          & cC110(X) ) ) )).

%----Equality cC114
fof(axiom_18,axiom,
    ( ! [X] :
        ( cC114(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC112(Y) ) ) )).

%----Equality cC114
fof(axiom_19,axiom,
    ( ! [X] :
        ( cC114(X)
      <=> ~ ( ? [Y] : ra_Px40(X,Y) ) ) )).

%----Equality cC114xcomp
fof(axiom_20,axiom,
    ( ! [X] :
        ( cC114xcomp(X)
      <=> ? [Y0] : ra_Px40(X,Y0) ) )).

%----Equality cC116
fof(axiom_21,axiom,
    ( ! [X] :
        ( cC116(X)
      <=> ( cC16xcomp(X)
          & cC114xcomp(X) ) ) )).

%----Equality cC118
fof(axiom_22,axiom,
    ( ! [X] :
        ( cC118(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC116(Y) ) ) )).

%----Equality cC12
fof(axiom_23,axiom,
    ( ! [X] :
        ( cC12(X)
      <=> ~ ( ? [Y] : ra_Px4(X,Y) ) ) )).

%----Equality cC12
fof(axiom_24,axiom,
    ( ! [X] :
        ( cC12(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC10(Y) ) ) )).

%----Equality cC12xcomp
fof(axiom_25,axiom,
    ( ! [X] :
        ( cC12xcomp(X)
      <=> ? [Y0] : ra_Px4(X,Y0) ) )).

%----Equality cC120
fof(axiom_26,axiom,
    ( ! [X] :
        ( cC120(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC118(Y) ) ) )).

%----Equality cC122
fof(axiom_27,axiom,
    ( ! [X] :
        ( cC122(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC124
fof(axiom_28,axiom,
    ( ! [X] :
        ( cC124(X)
      <=> ( cC16(X)
          & cC122(X) ) ) )).

%----Equality cC126
fof(axiom_29,axiom,
    ( ! [X] :
        ( cC126(X)
      <=> ~ ( ? [Y] : ra_Px43(X,Y) ) ) )).

%----Equality cC126
fof(axiom_30,axiom,
    ( ! [X] :
        ( cC126(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC124(Y) ) ) )).

%----Equality cC126xcomp
fof(axiom_31,axiom,
    ( ! [X] :
        ( cC126xcomp(X)
      <=> ? [Y0] : ra_Px43(X,Y0) ) )).

%----Equality cC128
fof(axiom_32,axiom,
    ( ! [X] :
        ( cC128(X)
      <=> ( cC16xcomp(X)
          & cC126xcomp(X) ) ) )).

%----Equality cC130
fof(axiom_33,axiom,
    ( ! [X] :
        ( cC130(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC128(Y) ) ) )).

%----Equality cC130
fof(axiom_34,axiom,
    ( ! [X] :
        ( cC130(X)
      <=> ? [Y0] : ra_Px44(X,Y0) ) )).

%----Equality cC130xcomp
fof(axiom_35,axiom,
    ( ! [X] :
        ( cC130xcomp(X)
      <=> ~ ( ? [Y] : ra_Px44(X,Y) ) ) )).

%----Equality cC132
fof(axiom_36,axiom,
    ( ! [X] :
        ( cC132(X)
      <=> ( cC120(X)
          & cC130xcomp(X) ) ) )).

%----Equality cC132
fof(axiom_37,axiom,
    ( ! [X] :
        ( cC132(X)
      <=> ~ ( ? [Y] : ra_Px46(X,Y) ) ) )).

%----Equality cC132xcomp
fof(axiom_38,axiom,
    ( ! [X] :
        ( cC132xcomp(X)
      <=> ? [Y0] : ra_Px46(X,Y0) ) )).

%----Equality cC134
fof(axiom_39,axiom,
    ( ! [X] :
        ( cC134(X)
      <=> ? [Y0] : ra_Px72(X,Y0) ) )).

%----Equality cC134
fof(axiom_40,axiom,
    ( ! [X] :
        ( cC134(X)
      <=> ( cC132xcomp(X)
          & cC108xcomp(X) ) ) )).

%----Equality cC134xcomp
fof(axiom_41,axiom,
    ( ! [X] :
        ( cC134xcomp(X)
      <=> ~ ( ? [Y] : ra_Px72(X,Y) ) ) )).

%----Equality cC136
fof(axiom_42,axiom,
    ( ! [X] :
        ( cC136(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC138
fof(axiom_43,axiom,
    ( ! [X] :
        ( cC138(X)
      <=> ( cC16(X)
          & cC136(X) ) ) )).

%----Equality cC14
fof(axiom_44,axiom,
    ( ! [X] :
        ( cC14(X)
      <=> ( cC2xcomp(X)
          & cC12xcomp(X) ) ) )).

%----Equality cC140
fof(axiom_45,axiom,
    ( ! [X] :
        ( cC140(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC138(Y) ) ) )).

%----Equality cC140
fof(axiom_46,axiom,
    ( ! [X] :
        ( cC140(X)
      <=> ~ ( ? [Y] : ra_Px49(X,Y) ) ) )).

%----Equality cC140xcomp
fof(axiom_47,axiom,
    ( ! [X] :
        ( cC140xcomp(X)
      <=> ? [Y0] : ra_Px49(X,Y0) ) )).

%----Equality cC142
fof(axiom_48,axiom,
    ( ! [X] :
        ( cC142(X)
      <=> ( cC16xcomp(X)
          & cC140xcomp(X) ) ) )).

%----Equality cC142
fof(axiom_49,axiom,
    ( ! [X] :
        ( cC142(X)
      <=> ? [Y0] : ra_Px57(X,Y0) ) )).

%----Equality cC142xcomp
fof(axiom_50,axiom,
    ( ! [X] :
        ( cC142xcomp(X)
      <=> ~ ( ? [Y] : ra_Px57(X,Y) ) ) )).

%----Equality cC144
fof(axiom_51,axiom,
    ( ! [X] :
        ( cC144(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC146
fof(axiom_52,axiom,
    ( ! [X] :
        ( cC146(X)
      <=> ( cC144(X)
          & cC16(X) ) ) )).

%----Equality cC148
fof(axiom_53,axiom,
    ( ! [X] :
        ( cC148(X)
      <=> ~ ( ? [Y] : ra_Px52(X,Y) ) ) )).

%----Equality cC148
fof(axiom_54,axiom,
    ( ! [X] :
        ( cC148(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC146(Y) ) ) )).

%----Equality cC148xcomp
fof(axiom_55,axiom,
    ( ! [X] :
        ( cC148xcomp(X)
      <=> ? [Y0] : ra_Px52(X,Y0) ) )).

%----Equality cC150
fof(axiom_56,axiom,
    ( ! [X] :
        ( cC150(X)
      <=> ( cC16xcomp(X)
          & cC148xcomp(X) ) ) )).

%----Equality cC152
fof(axiom_57,axiom,
    ( ! [X] :
        ( cC152(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC150(Y) ) ) )).

%----Equality cC154
fof(axiom_58,axiom,
    ( ! [X] :
        ( cC154(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC152(Y) ) ) )).

%----Equality cC156
fof(axiom_59,axiom,
    ( ! [X] :
        ( cC156(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC158
fof(axiom_60,axiom,
    ( ! [X] :
        ( cC158(X)
      <=> ( cC16(X)
          & cC156(X) ) ) )).

%----Equality cC16
fof(axiom_61,axiom,
    ( ! [X] :
        ( cC16(X)
      <=> ? [Y0] : ra_Px5(X,Y0) ) )).

%----Equality cC16xcomp
fof(axiom_62,axiom,
    ( ! [X] :
        ( cC16xcomp(X)
      <=> ~ ( ? [Y] : ra_Px5(X,Y) ) ) )).

%----Equality cC160
fof(axiom_63,axiom,
    ( ! [X] :
        ( cC160(X)
      <=> ~ ( ? [Y] : ra_Px55(X,Y) ) ) )).

%----Equality cC160
fof(axiom_64,axiom,
    ( ! [X] :
        ( cC160(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC158(Y) ) ) )).

%----Equality cC160xcomp
fof(axiom_65,axiom,
    ( ! [X] :
        ( cC160xcomp(X)
      <=> ? [Y0] : ra_Px55(X,Y0) ) )).

%----Equality cC162
fof(axiom_66,axiom,
    ( ! [X] :
        ( cC162(X)
      <=> ( cC16xcomp(X)
          & cC160xcomp(X) ) ) )).

%----Equality cC164
fof(axiom_67,axiom,
    ( ! [X] :
        ( cC164(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC162(Y) ) ) )).

%----Equality cC164
fof(axiom_68,axiom,
    ( ! [X] :
        ( cC164(X)
      <=> ? [Y0] : ra_Px56(X,Y0) ) )).

%----Equality cC164xcomp
fof(axiom_69,axiom,
    ( ! [X] :
        ( cC164xcomp(X)
      <=> ~ ( ? [Y] : ra_Px56(X,Y) ) ) )).

%----Equality cC166
fof(axiom_70,axiom,
    ( ! [X] :
        ( cC166(X)
      <=> ( cC164xcomp(X)
          & cC154(X) ) ) )).

%----Equality cC166
fof(axiom_71,axiom,
    ( ! [X] :
        ( cC166(X)
      <=> ~ ( ? [Y] : ra_Px58(X,Y) ) ) )).

%----Equality cC166xcomp
fof(axiom_72,axiom,
    ( ! [X] :
        ( cC166xcomp(X)
      <=> ? [Y0] : ra_Px58(X,Y0) ) )).

%----Equality cC168
fof(axiom_73,axiom,
    ( ! [X] :
        ( cC168(X)
      <=> ( cC142xcomp(X)
          & cC166xcomp(X) ) ) )).

%----Equality cC168
fof(axiom_74,axiom,
    ( ! [X] :
        ( cC168(X)
      <=> ? [Y0] : ra_Px59(X,Y0) ) )).

%----Equality cC168xcomp
fof(axiom_75,axiom,
    ( ! [X] :
        ( cC168xcomp(X)
      <=> ~ ( ? [Y] : ra_Px59(X,Y) ) ) )).

%----Equality cC170
fof(axiom_76,axiom,
    ( ! [X] :
        ( cC170(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC168xcomp(Y) ) ) )).

%----Equality cC172
fof(axiom_77,axiom,
    ( ! [X] :
        ( cC172(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC174
fof(axiom_78,axiom,
    ( ! [X] :
        ( cC174(X)
      <=> ( cC16(X)
          & cC172(X) ) ) )).

%----Equality cC176
fof(axiom_79,axiom,
    ( ! [X] :
        ( cC176(X)
      <=> ? [Y0] : ra_Px62(X,Y0) ) )).

%----Equality cC176
fof(axiom_80,axiom,
    ( ! [X] :
        ( cC176(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC174(Y) ) ) )).

%----Equality cC176xcomp
fof(axiom_81,axiom,
    ( ! [X] :
        ( cC176xcomp(X)
      <=> ~ ( ? [Y] : ra_Px62(X,Y) ) ) )).

%----Equality cC178
fof(axiom_82,axiom,
    ( ! [X] :
        ( cC178(X)
      <=> ~ ( ? [Y] : ra_Px70(X,Y) ) ) )).

%----Equality cC178
fof(axiom_83,axiom,
    ( ! [X] :
        ( cC178(X)
      <=> ( cC16xcomp(X)
          & cC176xcomp(X) ) ) )).

%----Equality cC178xcomp
fof(axiom_84,axiom,
    ( ! [X] :
        ( cC178xcomp(X)
      <=> ? [Y0] : ra_Px70(X,Y0) ) )).

%----Equality cC18
fof(axiom_85,axiom,
    ( ! [X] :
        ( cC18(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC180
fof(axiom_86,axiom,
    ( ! [X] :
        ( cC180(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC182
fof(axiom_87,axiom,
    ( ! [X] :
        ( cC182(X)
      <=> ( cC16(X)
          & cC180(X) ) ) )).

%----Equality cC184
fof(axiom_88,axiom,
    ( ! [X] :
        ( cC184(X)
      <=> ? [Y0] : ra_Px65(X,Y0) ) )).

%----Equality cC184
fof(axiom_89,axiom,
    ( ! [X] :
        ( cC184(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC182(Y) ) ) )).

%----Equality cC184xcomp
fof(axiom_90,axiom,
    ( ! [X] :
        ( cC184xcomp(X)
      <=> ~ ( ? [Y] : ra_Px65(X,Y) ) ) )).

%----Equality cC186
fof(axiom_91,axiom,
    ( ! [X] :
        ( cC186(X)
      <=> ( cC16xcomp(X)
          & cC184xcomp(X) ) ) )).

%----Equality cC188
fof(axiom_92,axiom,
    ( ! [X] :
        ( cC188(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC186(Y) ) ) )).

%----Equality cC190
fof(axiom_93,axiom,
    ( ! [X] :
        ( cC190(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC188(Y) ) ) )).

%----Equality cC192
fof(axiom_94,axiom,
    ( ! [X] :
        ( cC192(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC194
fof(axiom_95,axiom,
    ( ! [X] :
        ( cC194(X)
      <=> ( cC16(X)
          & cC192(X) ) ) )).

%----Equality cC196
fof(axiom_96,axiom,
    ( ! [X] :
        ( cC196(X)
      <=> ? [Y0] : ra_Px68(X,Y0) ) )).

%----Equality cC196
fof(axiom_97,axiom,
    ( ! [X] :
        ( cC196(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC194(Y) ) ) )).

%----Equality cC196xcomp
fof(axiom_98,axiom,
    ( ! [X] :
        ( cC196xcomp(X)
      <=> ~ ( ? [Y] : ra_Px68(X,Y) ) ) )).

%----Equality cC198
fof(axiom_99,axiom,
    ( ! [X] :
        ( cC198(X)
      <=> ( cC16xcomp(X)
          & cC196xcomp(X) ) ) )).

%----Equality cC2
fof(axiom_100,axiom,
    ( ! [X] :
        ( cC2(X)
      <=> ~ ( ? [Y] : ra_Px1(X,Y) ) ) )).

%----Equality cC2xcomp
fof(axiom_101,axiom,
    ( ! [X] :
        ( cC2xcomp(X)
      <=> ? [Y0] : ra_Px1(X,Y0) ) )).

%----Equality cC20
fof(axiom_102,axiom,
    ( ! [X] :
        ( cC20(X)
      <=> ( cC18(X)
          & cC16(X) ) ) )).

%----Equality cC200
fof(axiom_103,axiom,
    ( ! [X] :
        ( cC200(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC198(Y) ) ) )).

%----Equality cC200
fof(axiom_104,axiom,
    ( ! [X] :
        ( cC200(X)
      <=> ? [Y0] : ra_Px69(X,Y0) ) )).

%----Equality cC200xcomp
fof(axiom_105,axiom,
    ( ! [X] :
        ( cC200xcomp(X)
      <=> ~ ( ? [Y] : ra_Px69(X,Y) ) ) )).

%----Equality cC202
fof(axiom_106,axiom,
    ( ! [X] :
        ( cC202(X)
      <=> ( cC200xcomp(X)
          & cC190(X) ) ) )).

%----Equality cC202
fof(axiom_107,axiom,
    ( ! [X] :
        ( cC202(X)
      <=> ? [Y0] : ra_Px71(X,Y0) ) )).

%----Equality cC202xcomp
fof(axiom_108,axiom,
    ( ! [X] :
        ( cC202xcomp(X)
      <=> ~ ( ? [Y] : ra_Px71(X,Y) ) ) )).

%----Equality cC204
fof(axiom_109,axiom,
    ( ! [X] :
        ( cC204(X)
      <=> ( cC202xcomp(X)
          & cC178xcomp(X) ) ) )).

%----Equality cC206
fof(axiom_110,axiom,
    ( ! [X] :
        ( cC206(X)
      <=> ( cC204(X)
          & cC170(X) ) ) )).

%----Equality cC208
fof(axiom_111,axiom,
    ( ! [X] :
        ( cC208(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC206(Y) ) ) )).

%----Equality cC208
fof(axiom_112,axiom,
    ( ! [X] :
        ( cC208(X)
      <=> ~ ( ? [Y] : ra_Px73(X,Y) ) ) )).

%----Equality cC208xcomp
fof(axiom_113,axiom,
    ( ! [X] :
        ( cC208xcomp(X)
      <=> ? [Y0] : ra_Px73(X,Y0) ) )).

%----Equality cC210
fof(axiom_114,axiom,
    ( ! [X] :
        ( cC210(X)
      <=> ( cC134xcomp(X)
          & cC208xcomp(X) ) ) )).

%----Equality cC212
fof(axiom_115,axiom,
    ( ! [X] :
        ( cC212(X)
      <=> ? [Y0] : ra_Px74(X,Y0) ) )).

%----Equality cC212
fof(axiom_116,axiom,
    ( ! [X] :
        ( cC212(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC210(Y) ) ) )).

%----Equality cC212xcomp
fof(axiom_117,axiom,
    ( ! [X] :
        ( cC212xcomp(X)
      <=> ~ ( ? [Y] : ra_Px74(X,Y) ) ) )).

%----Equality cC214
fof(axiom_118,axiom,
    ( ! [X] :
        ( cC214(X)
      <=> ? [Y0] : ra_Px75(X,Y0) ) )).

%----Equality cC214
fof(axiom_119,axiom,
    ( ! [X] :
        ( cC214(X)
      <=> ( cC212xcomp(X)
          & cC100(X) ) ) )).

%----Equality cC214xcomp
fof(axiom_120,axiom,
    ( ! [X] :
        ( cC214xcomp(X)
      <=> ~ ( ? [Y] : ra_Px75(X,Y) ) ) )).

%----Equality cC216
fof(axiom_121,axiom,
    ( ! [X] :
        ( cC216(X)
      <=> ( cC64(X)
          & cC214xcomp(X) ) ) )).

%----Equality cC22
fof(axiom_122,axiom,
    ( ! [X] :
        ( cC22(X)
      <=> ~ ( ? [Y] : ra_Px7(X,Y) ) ) )).

%----Equality cC22
fof(axiom_123,axiom,
    ( ! [X] :
        ( cC22(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC20(Y) ) ) )).

%----Equality cC22xcomp
fof(axiom_124,axiom,
    ( ! [X] :
        ( cC22xcomp(X)
      <=> ? [Y0] : ra_Px7(X,Y0) ) )).

%----Equality cC24
fof(axiom_125,axiom,
    ( ! [X] :
        ( cC24(X)
      <=> ~ ( ? [Y] : ra_Px88(X,Y) ) ) )).

%----Equality cC24
fof(axiom_126,axiom,
    ( ! [X] :
        ( cC24(X)
      <=> ( cC16xcomp(X)
          & cC22xcomp(X) ) ) )).

%----Equality cC24xcomp
fof(axiom_127,axiom,
    ( ! [X] :
        ( cC24xcomp(X)
      <=> ? [Y0] : ra_Px88(X,Y0) ) )).

%----Equality cC26
fof(axiom_128,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ? [Y0] : ra_Px9(X,Y0) ) )).

%----Equality cC26
fof(axiom_129,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC24(Y) ) ) )).

%----Equality cC26xcomp
fof(axiom_130,axiom,
    ( ! [X] :
        ( cC26xcomp(X)
      <=> ~ ( ? [Y] : ra_Px9(X,Y) ) ) )).

%----Equality cC28
fof(axiom_131,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ( cC16xcomp(X)
          & cC26xcomp(X) ) ) )).

%----Equality cC30
fof(axiom_132,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ( cC28(X)
          & cC14(X) ) ) )).

%----Equality cC32
fof(axiom_133,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ~ ( ? [Y] : ra_Px10(X,Y) ) ) )).

%----Equality cC32xcomp
fof(axiom_134,axiom,
    ( ! [X] :
        ( cC32xcomp(X)
      <=> ? [Y0] : ra_Px10(X,Y0) ) )).

%----Equality cC34
fof(axiom_135,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC32xcomp(Y) ) ) )).

%----Equality cC36
fof(axiom_136,axiom,
    ( ! [X] :
        ( cC36(X)
      <=> ( cC34(X)
          & cC32(X) ) ) )).

%----Equality cC38
fof(axiom_137,axiom,
    ( ! [X] :
        ( cC38(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC36(Y) ) ) )).

%----Equality cC38
fof(axiom_138,axiom,
    ( ! [X] :
        ( cC38(X)
      <=> ? [Y0] : ra_Px12(X,Y0) ) )).

%----Equality cC38xcomp
fof(axiom_139,axiom,
    ( ! [X] :
        ( cC38xcomp(X)
      <=> ~ ( ? [Y] : ra_Px12(X,Y) ) ) )).

%----Equality cC4
fof(axiom_140,axiom,
    ( ! [X] :
        ( cC4(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC40
fof(axiom_141,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> ? [Y0] : ra_Px86(X,Y0) ) )).

%----Equality cC40
fof(axiom_142,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> ( cC32xcomp(X)
          & cC38xcomp(X) ) ) )).

%----Equality cC40xcomp
fof(axiom_143,axiom,
    ( ! [X] :
        ( cC40xcomp(X)
      <=> ~ ( ? [Y] : ra_Px86(X,Y) ) ) )).

%----Equality cC42
fof(axiom_144,axiom,
    ( ! [X] :
        ( cC42(X)
      <=> ? [Y0] : ra_Px14(X,Y0) ) )).

%----Equality cC42
fof(axiom_145,axiom,
    ( ! [X] :
        ( cC42(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC40(Y) ) ) )).

%----Equality cC42xcomp
fof(axiom_146,axiom,
    ( ! [X] :
        ( cC42xcomp(X)
      <=> ~ ( ? [Y] : ra_Px14(X,Y) ) ) )).

%----Equality cC44
fof(axiom_147,axiom,
    ( ! [X] :
        ( cC44(X)
      <=> ( cC42xcomp(X)
          & cC32xcomp(X) ) ) )).

%----Equality cC46
fof(axiom_148,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ( cC30(X)
          & cC44(X) ) ) )).

%----Equality cC48
fof(axiom_149,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC50
fof(axiom_150,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC52
fof(axiom_151,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ( cC50(X)
          & cC16(X) ) ) )).

%----Equality cC54
fof(axiom_152,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ? [Y0] : ra_Px18(X,Y0) ) )).

%----Equality cC54
fof(axiom_153,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC52(Y) ) ) )).

%----Equality cC54xcomp
fof(axiom_154,axiom,
    ( ! [X] :
        ( cC54xcomp(X)
      <=> ~ ( ? [Y] : ra_Px18(X,Y) ) ) )).

%----Equality cC56
fof(axiom_155,axiom,
    ( ! [X] :
        ( cC56(X)
      <=> ( cC16xcomp(X)
          & cC54xcomp(X) ) ) )).

%----Equality cC58
fof(axiom_156,axiom,
    ( ! [X] :
        ( cC58(X)
      <=> ~ ( ? [Y] : ra_Px19(X,Y) ) ) )).

%----Equality cC58
fof(axiom_157,axiom,
    ( ! [X] :
        ( cC58(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC56(Y) ) ) )).

%----Equality cC58xcomp
fof(axiom_158,axiom,
    ( ! [X] :
        ( cC58xcomp(X)
      <=> ? [Y0] : ra_Px19(X,Y0) ) )).

%----Equality cC6
fof(axiom_159,axiom,
    ( ! [X] :
        ( cC6(X)
      <=> ( cC2(X)
          & cC4(X) ) ) )).

%----Equality cC60
fof(axiom_160,axiom,
    ( ! [X] :
        ( cC60(X)
      <=> ~ ( ? [Y] : ra_Px85(X,Y) ) ) )).

%----Equality cC60
fof(axiom_161,axiom,
    ( ! [X] :
        ( cC60(X)
      <=> ( cC48(X)
          & cC58xcomp(X) ) ) )).

%----Equality cC60xcomp
fof(axiom_162,axiom,
    ( ! [X] :
        ( cC60xcomp(X)
      <=> ? [Y0] : ra_Px85(X,Y0) ) )).

%----Equality cC62
fof(axiom_163,axiom,
    ( ! [X] :
        ( cC62(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC60(Y) ) ) )).

%----Equality cC62
fof(axiom_164,axiom,
    ( ! [X] :
        ( cC62(X)
      <=> ? [Y0] : ra_Px20(X,Y0) ) )).

%----Equality cC62xcomp
fof(axiom_165,axiom,
    ( ! [X] :
        ( cC62xcomp(X)
      <=> ~ ( ? [Y] : ra_Px20(X,Y) ) ) )).

%----Equality cC64
fof(axiom_166,axiom,
    ( ! [X] :
        ( cC64(X)
      <=> ( cC62xcomp(X)
          & cTOP(X) ) ) )).

%----Equality cC66
fof(axiom_167,axiom,
    ( ! [X] :
        ( cC66(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC68
fof(axiom_168,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ( cC16(X)
          & cC66(X) ) ) )).

%----Equality cC70
fof(axiom_169,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC68(Y) ) ) )).

%----Equality cC70
fof(axiom_170,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ? [Y0] : ra_Px23(X,Y0) ) )).

%----Equality cC70xcomp
fof(axiom_171,axiom,
    ( ! [X] :
        ( cC70xcomp(X)
      <=> ~ ( ? [Y] : ra_Px23(X,Y) ) ) )).

%----Equality cC72
fof(axiom_172,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ~ ( ? [Y] : ra_Px31(X,Y) ) ) )).

%----Equality cC72
fof(axiom_173,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ( cC16xcomp(X)
          & cC70xcomp(X) ) ) )).

%----Equality cC72xcomp
fof(axiom_174,axiom,
    ( ! [X] :
        ( cC72xcomp(X)
      <=> ? [Y0] : ra_Px31(X,Y0) ) )).

%----Equality cC74
fof(axiom_175,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC76
fof(axiom_176,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ( cC16(X)
          & cC74(X) ) ) )).

%----Equality cC78
fof(axiom_177,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC76(Y) ) ) )).

%----Equality cC78
fof(axiom_178,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ? [Y0] : ra_Px26(X,Y0) ) )).

%----Equality cC78xcomp
fof(axiom_179,axiom,
    ( ! [X] :
        ( cC78xcomp(X)
      <=> ~ ( ? [Y] : ra_Px26(X,Y) ) ) )).

%----Equality cC8
fof(axiom_180,axiom,
    ( ! [X] :
        ( cC8(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC6(Y) ) ) )).

%----Equality cC8
fof(axiom_181,axiom,
    ( ! [X] :
        ( cC8(X)
      <=> ? [Y0] : ra_Px2(X,Y0) ) )).

%----Equality cC8xcomp
fof(axiom_182,axiom,
    ( ! [X] :
        ( cC8xcomp(X)
      <=> ~ ( ? [Y] : ra_Px2(X,Y) ) ) )).

%----Equality cC80
fof(axiom_183,axiom,
    ( ! [X] :
        ( cC80(X)
      <=> ( cC16xcomp(X)
          & cC78xcomp(X) ) ) )).

%----Equality cC82
fof(axiom_184,axiom,
    ( ! [X] :
        ( cC82(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC80(Y) ) ) )).

%----Equality cC84
fof(axiom_185,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC82(Y) ) ) )).

%----Equality cC86
fof(axiom_186,axiom,
    ( ! [X] :
        ( cC86(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC88
fof(axiom_187,axiom,
    ( ! [X] :
        ( cC88(X)
      <=> ( cC16(X)
          & cC86(X) ) ) )).

%----Equality cC90
fof(axiom_188,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC88(Y) ) ) )).

%----Equality cC90
fof(axiom_189,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ? [Y0] : ra_Px29(X,Y0) ) )).

%----Equality cC90xcomp
fof(axiom_190,axiom,
    ( ! [X] :
        ( cC90xcomp(X)
      <=> ~ ( ? [Y] : ra_Px29(X,Y) ) ) )).

%----Equality cC92
fof(axiom_191,axiom,
    ( ! [X] :
        ( cC92(X)
      <=> ( cC16xcomp(X)
          & cC90xcomp(X) ) ) )).

%----Equality cC94
fof(axiom_192,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y0] : ra_Px30(X,Y0) ) )).

%----Equality cC94
fof(axiom_193,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC92(Y) ) ) )).

%----Equality cC94xcomp
fof(axiom_194,axiom,
    ( ! [X] :
        ( cC94xcomp(X)
      <=> ~ ( ? [Y] : ra_Px30(X,Y) ) ) )).

%----Equality cC96
fof(axiom_195,axiom,
    ( ! [X] :
        ( cC96(X)
      <=> ? [Y0] : ra_Px32(X,Y0) ) )).

%----Equality cC96
fof(axiom_196,axiom,
    ( ! [X] :
        ( cC96(X)
      <=> ( cC84(X)
          & cC94xcomp(X) ) ) )).

%----Equality cC96xcomp
fof(axiom_197,axiom,
    ( ! [X] :
        ( cC96xcomp(X)
      <=> ~ ( ? [Y] : ra_Px32(X,Y) ) ) )).

%----Equality cC98
fof(axiom_198,axiom,
    ( ! [X] :
        ( cC98(X)
      <=> ~ ( ? [Y] : ra_Px34(X,Y) ) ) )).

%----Equality cC98
fof(axiom_199,axiom,
    ( ! [X] :
        ( cC98(X)
      <=> ( cC72xcomp(X)
          & cC96xcomp(X) ) ) )).

%----Equality cC98xcomp
fof(axiom_200,axiom,
    ( ! [X] :
        ( cC98xcomp(X)
      <=> ? [Y0] : ra_Px34(X,Y0) ) )).

%----Equality cTEST
fof(axiom_201,axiom,
    ( ! [X] :
        ( cTEST(X)
      <=> ( cC216(X)
          & cC46(X) ) ) )).

%----iV3102
fof(axiom_202,axiom,
    ( cTEST(iV3102) )).

%----iV3102
fof(axiom_203,axiom,
    ( cC2xcomp(iV3102) )).

%----iV3102
fof(axiom_204,axiom,
    ( ! [X] :
        ( rR1(iV3102,X)
       => cC24xcomp(X) ) )).

%----iV3102
fof(axiom_205,axiom,
    ( cTOP(iV3102) )).

%----iV3102
fof(axiom_206,axiom,
    ( cC26xcomp(iV3102) )).

%----iV3102
fof(axiom_207,axiom,
    ( cC32xcomp(iV3102) )).

%----iV3102
fof(axiom_208,axiom,
    ( ! [X] :
        ( rR1(iV3102,X)
       => cC98(X) ) )).

%----iV3102
fof(axiom_209,axiom,
    ( ! [X] :
        ( rR1(iV3102,X)
       => cC60xcomp(X) ) )).

%----iV3102
fof(axiom_210,axiom,
    ( cC16xcomp(iV3102) )).

%----iV3102
fof(axiom_211,axiom,
    ( cC42xcomp(iV3102) )).

%----iV3102
fof(axiom_212,axiom,
    ( cC62xcomp(iV3102) )).

%----iV3102
fof(axiom_213,axiom,
    ( ! [X] :
        ( rR1(iV3102,X)
       => cC40xcomp(X) ) )).

%----iV3102
fof(axiom_214,axiom,
    ( ! [X] :
        ( rR1(iV3102,X)
       => cC10xcomp(X) ) )).

%----iV3102
fof(axiom_215,axiom,
    ( cC12xcomp(iV3102) )).

%----iV3102
fof(axiom_216,axiom,
    ( cC214xcomp(iV3102) )).

%----iV3102
fof(axiom_217,axiom,
    ( cowlThing(iV3102) )).

%----iV3102
fof(axiom_218,axiom,
    ( cC100xcomp(iV3102) )).

%----Thing and Nothing
%----String and Integer disjoint
%----iV3102
%----iV3102
%----iV3102
%----iV3102
%----iV3102
%----iV3102
%----iV3102
%----iV3102
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & cC14(iV3102)
    & cC44(iV3102)
    & cC216(iV3102)
    & cC64(iV3102)
    & cC46(iV3102)
    & cC28(iV3102)
    & cowlThing(iV3102)
    & cC30(iV3102) )).

%------------------------------------------------------------------------------
