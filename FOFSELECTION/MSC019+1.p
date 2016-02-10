%------------------------------------------------------------------------------
% File     : MSC019+1 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Miscellaneous
% Problem  : Mexico is in America
% Version  : Especial.
% English  :

% Refs     : [deM09] de Melo (2009), Email to Geoff Sutcliffe
% Source   : [deM09]
% Names    : geo2 [deM09]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.00 v4.1.0, 0.11 v4.0.1, 0.16 v4.0.0
% Syntax   : Number of formulae    :  604 ( 601 unit)
%            Number of atoms       :  608 (   0 equality)
%            Maximal formula depth :    6 (   1 average)
%            Number of connectives :    4 (   0   ~;   0   |;   1   &)
%                                         (   0 <=>;   3  =>;   0  <=)
%                                         (   0 <~>;   0  ~|;   0  ~&)
%            Number of predicates  :    2 (   0 propositional; 2-2 arity)
%            Number of functors    :  280 ( 280 constant; 0-0 arity)
%            Number of variables   :    7 (   0 sgn;   7   !;   0   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments :
%------------------------------------------------------------------------------
%----include('axioms/geo.tptp').
fof(kb0,axiom,(
    s_contains(s_g001,s_g002) )).

fof(kb1,axiom,(
    s_contains(s_g001,s_g009) )).

fof(kb2,axiom,(
    s_contains(s_g001,s_g019) )).

fof(kb3,axiom,(
    s_contains(s_g001,s_g142) )).

fof(kb4,axiom,(
    s_contains(s_g001,s_g150) )).

fof(kb5,axiom,(
    s_partOf(s_g002,s_g001) )).

fof(kb6,axiom,(
    s_contains(s_g002,s_g011) )).

fof(kb7,axiom,(
    s_contains(s_g002,s_g014) )).

fof(kb8,axiom,(
    s_contains(s_g002,s_g015) )).

fof(kb9,axiom,(
    s_contains(s_g002,s_g017) )).

fof(kb10,axiom,(
    s_contains(s_g002,s_g018) )).

fof(kb11,axiom,(
    s_partOf(s_g009,s_g001) )).

fof(kb12,axiom,(
    s_contains(s_g009,s_g053) )).

fof(kb13,axiom,(
    s_contains(s_g009,s_g054) )).

fof(kb14,axiom,(
    s_contains(s_g009,s_g057) )).

fof(kb15,axiom,(
    s_contains(s_g009,s_g061) )).

fof(kb16,axiom,(
    s_partOf(s_g019,s_g001) )).

fof(kb17,axiom,(
    s_contains(s_g019,s_g005) )).

fof(kb18,axiom,(
    s_contains(s_g019,s_g013) )).

fof(kb19,axiom,(
    s_contains(s_g019,s_g021) )).

fof(kb20,axiom,(
    s_contains(s_g019,s_g029) )).

fof(kb21,axiom,(
    s_contains(s_g019,s_g003) )).

fof(kb22,axiom,(
    s_contains(s_g019,s_g419) )).

fof(kb23,axiom,(
    s_partOf(s_g142,s_g001) )).

fof(kb24,axiom,(
    s_contains(s_g142,s_g030) )).

fof(kb25,axiom,(
    s_contains(s_g142,s_g035) )).

fof(kb26,axiom,(
    s_contains(s_g142,s_g143) )).

fof(kb27,axiom,(
    s_contains(s_g142,s_g145) )).

fof(kb28,axiom,(
    s_contains(s_g142,s_g034) )).

fof(kb29,axiom,(
    s_contains(s_g142,s_g062) )).

fof(kb30,axiom,(
    s_partOf(s_g150,s_g001) )).

fof(kb31,axiom,(
    s_contains(s_g150,s_g039) )).

fof(kb32,axiom,(
    s_contains(s_g150,s_g151) )).

fof(kb33,axiom,(
    s_contains(s_g150,s_g154) )).

fof(kb34,axiom,(
    s_contains(s_g150,s_g155) )).

fof(kb35,axiom,(
    s_contains(s_g011,s_BF) )).

fof(kb36,axiom,(
    s_contains(s_g011,s_BJ) )).

fof(kb37,axiom,(
    s_contains(s_g011,s_CI) )).

fof(kb38,axiom,(
    s_contains(s_g011,s_CV) )).

fof(kb39,axiom,(
    s_contains(s_g011,s_GH) )).

fof(kb40,axiom,(
    s_contains(s_g011,s_GM) )).

fof(kb41,axiom,(
    s_contains(s_g011,s_GN) )).

fof(kb42,axiom,(
    s_contains(s_g011,s_GW) )).

fof(kb43,axiom,(
    s_contains(s_g011,s_LR) )).

fof(kb44,axiom,(
    s_contains(s_g011,s_ML) )).

fof(kb45,axiom,(
    s_contains(s_g011,s_MR) )).

fof(kb46,axiom,(
    s_contains(s_g011,s_NE) )).

fof(kb47,axiom,(
    s_contains(s_g011,s_NG) )).

fof(kb48,axiom,(
    s_contains(s_g011,s_SH) )).

fof(kb49,axiom,(
    s_contains(s_g011,s_SL) )).

fof(kb50,axiom,(
    s_contains(s_g011,s_SN) )).

fof(kb51,axiom,(
    s_contains(s_g011,s_TG) )).

fof(kb52,axiom,(
    s_partOf(s_g011,s_g002) )).

fof(kb53,axiom,(
    s_partOf(s_BF,s_g011) )).

fof(kb54,axiom,(
    s_partOf(s_BJ,s_g011) )).

fof(kb55,axiom,(
    s_partOf(s_CI,s_g011) )).

fof(kb56,axiom,(
    s_partOf(s_CV,s_g011) )).

fof(kb57,axiom,(
    s_partOf(s_GH,s_g011) )).

fof(kb58,axiom,(
    s_partOf(s_GM,s_g011) )).

fof(kb59,axiom,(
    s_partOf(s_GN,s_g011) )).

fof(kb60,axiom,(
    s_partOf(s_GW,s_g011) )).

fof(kb61,axiom,(
    s_partOf(s_LR,s_g011) )).

fof(kb62,axiom,(
    s_partOf(s_ML,s_g011) )).

fof(kb63,axiom,(
    s_partOf(s_MR,s_g011) )).

fof(kb64,axiom,(
    s_partOf(s_NE,s_g011) )).

fof(kb65,axiom,(
    s_partOf(s_NG,s_g011) )).

fof(kb66,axiom,(
    s_partOf(s_SH,s_g011) )).

fof(kb67,axiom,(
    s_partOf(s_SL,s_g011) )).

fof(kb68,axiom,(
    s_partOf(s_SN,s_g011) )).

fof(kb69,axiom,(
    s_partOf(s_TG,s_g011) )).

fof(kb70,axiom,(
    s_contains(s_g013,s_BZ) )).

fof(kb71,axiom,(
    s_contains(s_g013,s_CR) )).

fof(kb72,axiom,(
    s_contains(s_g013,s_GT) )).

fof(kb73,axiom,(
    s_contains(s_g013,s_HN) )).

fof(kb74,axiom,(
    s_contains(s_g013,s_MX) )).

fof(kb75,axiom,(
    s_contains(s_g013,s_NI) )).

fof(kb76,axiom,(
    s_contains(s_g013,s_PA) )).

fof(kb77,axiom,(
    s_contains(s_g013,s_SV) )).

fof(kb78,axiom,(
    s_partOf(s_g013,s_g019) )).

fof(kb79,axiom,(
    s_partOf(s_g013,s_g003) )).

fof(kb80,axiom,(
    s_partOf(s_g013,s_g419) )).

fof(kb81,axiom,(
    s_partOf(s_BZ,s_g013) )).

fof(kb82,axiom,(
    s_partOf(s_CR,s_g013) )).

fof(kb83,axiom,(
    s_partOf(s_GT,s_g013) )).

fof(kb84,axiom,(
    s_partOf(s_HN,s_g013) )).

fof(kb85,axiom,(
    s_partOf(s_MX,s_g013) )).

fof(kb86,axiom,(
    s_partOf(s_NI,s_g013) )).

fof(kb87,axiom,(
    s_partOf(s_PA,s_g013) )).

fof(kb88,axiom,(
    s_partOf(s_SV,s_g013) )).

fof(kb89,axiom,(
    s_contains(s_g014,s_BI) )).

fof(kb90,axiom,(
    s_contains(s_g014,s_DJ) )).

fof(kb91,axiom,(
    s_contains(s_g014,s_ER) )).

fof(kb92,axiom,(
    s_contains(s_g014,s_ET) )).

fof(kb93,axiom,(
    s_contains(s_g014,s_KE) )).

fof(kb94,axiom,(
    s_contains(s_g014,s_KM) )).

fof(kb95,axiom,(
    s_contains(s_g014,s_MG) )).

fof(kb96,axiom,(
    s_contains(s_g014,s_MU) )).

fof(kb97,axiom,(
    s_contains(s_g014,s_MW) )).

fof(kb98,axiom,(
    s_contains(s_g014,s_MZ) )).

fof(kb99,axiom,(
    s_contains(s_g014,s_RE) )).

fof(kb100,axiom,(
    s_contains(s_g014,s_RW) )).

fof(kb101,axiom,(
    s_contains(s_g014,s_SC) )).

fof(kb102,axiom,(
    s_contains(s_g014,s_SO) )).

fof(kb103,axiom,(
    s_contains(s_g014,s_TZ) )).

fof(kb104,axiom,(
    s_contains(s_g014,s_UG) )).

fof(kb105,axiom,(
    s_contains(s_g014,s_YT) )).

fof(kb106,axiom,(
    s_contains(s_g014,s_ZM) )).

fof(kb107,axiom,(
    s_contains(s_g014,s_ZW) )).

fof(kb108,axiom,(
    s_partOf(s_g014,s_g002) )).

fof(kb109,axiom,(
    s_partOf(s_BI,s_g014) )).

fof(kb110,axiom,(
    s_partOf(s_DJ,s_g014) )).

fof(kb111,axiom,(
    s_partOf(s_ER,s_g014) )).

fof(kb112,axiom,(
    s_partOf(s_ET,s_g014) )).

fof(kb113,axiom,(
    s_partOf(s_KE,s_g014) )).

fof(kb114,axiom,(
    s_partOf(s_KM,s_g014) )).

fof(kb115,axiom,(
    s_partOf(s_MG,s_g014) )).

fof(kb116,axiom,(
    s_partOf(s_MU,s_g014) )).

fof(kb117,axiom,(
    s_partOf(s_MW,s_g014) )).

fof(kb118,axiom,(
    s_partOf(s_MZ,s_g014) )).

fof(kb119,axiom,(
    s_partOf(s_RE,s_g014) )).

fof(kb120,axiom,(
    s_partOf(s_RW,s_g014) )).

fof(kb121,axiom,(
    s_partOf(s_SC,s_g014) )).

fof(kb122,axiom,(
    s_partOf(s_SO,s_g014) )).

fof(kb123,axiom,(
    s_partOf(s_TZ,s_g014) )).

fof(kb124,axiom,(
    s_partOf(s_UG,s_g014) )).

fof(kb125,axiom,(
    s_partOf(s_YT,s_g014) )).

fof(kb126,axiom,(
    s_partOf(s_ZM,s_g014) )).

fof(kb127,axiom,(
    s_partOf(s_ZW,s_g014) )).

fof(kb128,axiom,(
    s_partOf(s_g030,s_g142) )).

fof(kb129,axiom,(
    s_contains(s_g030,s_CN) )).

fof(kb130,axiom,(
    s_contains(s_g030,s_HK) )).

fof(kb131,axiom,(
    s_contains(s_g030,s_JP) )).

fof(kb132,axiom,(
    s_contains(s_g030,s_KP) )).

fof(kb133,axiom,(
    s_contains(s_g030,s_KR) )).

fof(kb134,axiom,(
    s_contains(s_g030,s_MN) )).

fof(kb135,axiom,(
    s_contains(s_g030,s_MO) )).

fof(kb136,axiom,(
    s_contains(s_g030,s_TW) )).

fof(kb137,axiom,(
    s_partOf(s_g035,s_g142) )).

fof(kb138,axiom,(
    s_contains(s_g035,s_BN) )).

fof(kb139,axiom,(
    s_contains(s_g035,s_ID) )).

fof(kb140,axiom,(
    s_contains(s_g035,s_KH) )).

fof(kb141,axiom,(
    s_contains(s_g035,s_LA) )).

fof(kb142,axiom,(
    s_contains(s_g035,s_MM) )).

fof(kb143,axiom,(
    s_contains(s_g035,s_BU) )).

fof(kb144,axiom,(
    s_contains(s_g035,s_MY) )).

fof(kb145,axiom,(
    s_contains(s_g035,s_PH) )).

fof(kb146,axiom,(
    s_contains(s_g035,s_SG) )).

fof(kb147,axiom,(
    s_contains(s_g035,s_TH) )).

fof(kb148,axiom,(
    s_contains(s_g035,s_TL) )).

fof(kb149,axiom,(
    s_contains(s_g035,s_TP) )).

fof(kb150,axiom,(
    s_contains(s_g035,s_VN) )).

fof(kb151,axiom,(
    s_partOf(s_g143,s_g142) )).

fof(kb152,axiom,(
    s_contains(s_g143,s_TM) )).

fof(kb153,axiom,(
    s_contains(s_g143,s_TJ) )).

fof(kb154,axiom,(
    s_contains(s_g143,s_KG) )).

fof(kb155,axiom,(
    s_contains(s_g143,s_KZ) )).

fof(kb156,axiom,(
    s_contains(s_g143,s_UZ) )).

fof(kb157,axiom,(
    s_partOf(s_g143,s_g062) )).

fof(kb158,axiom,(
    s_partOf(s_g145,s_g142) )).

fof(kb159,axiom,(
    s_contains(s_g145,s_AE) )).

fof(kb160,axiom,(
    s_contains(s_g145,s_AM) )).

fof(kb161,axiom,(
    s_contains(s_g145,s_AZ) )).

fof(kb162,axiom,(
    s_contains(s_g145,s_BH) )).

fof(kb163,axiom,(
    s_contains(s_g145,s_CY) )).

fof(kb164,axiom,(
    s_contains(s_g145,s_GE) )).

fof(kb165,axiom,(
    s_contains(s_g145,s_IL) )).

fof(kb166,axiom,(
    s_contains(s_g145,s_IQ) )).

fof(kb167,axiom,(
    s_contains(s_g145,s_JO) )).

fof(kb168,axiom,(
    s_contains(s_g145,s_KW) )).

fof(kb169,axiom,(
    s_contains(s_g145,s_LB) )).

fof(kb170,axiom,(
    s_contains(s_g145,s_OM) )).

fof(kb171,axiom,(
    s_contains(s_g145,s_PS) )).

fof(kb172,axiom,(
    s_contains(s_g145,s_QA) )).

fof(kb173,axiom,(
    s_contains(s_g145,s_SA) )).

fof(kb174,axiom,(
    s_contains(s_g145,s_NT) )).

fof(kb175,axiom,(
    s_contains(s_g145,s_SY) )).

fof(kb176,axiom,(
    s_contains(s_g145,s_TR) )).

fof(kb177,axiom,(
    s_contains(s_g145,s_YE) )).

fof(kb178,axiom,(
    s_contains(s_g145,s_YD) )).

fof(kb179,axiom,(
    s_partOf(s_g034,s_g142) )).

fof(kb180,axiom,(
    s_partOf(s_g034,s_g062) )).

fof(kb181,axiom,(
    s_contains(s_g034,s_AF) )).

fof(kb182,axiom,(
    s_contains(s_g034,s_BD) )).

fof(kb183,axiom,(
    s_contains(s_g034,s_BT) )).

fof(kb184,axiom,(
    s_contains(s_g034,s_IN) )).

fof(kb185,axiom,(
    s_contains(s_g034,s_IR) )).

fof(kb186,axiom,(
    s_contains(s_g034,s_LK) )).

fof(kb187,axiom,(
    s_contains(s_g034,s_MV) )).

fof(kb188,axiom,(
    s_contains(s_g034,s_NP) )).

fof(kb189,axiom,(
    s_contains(s_g034,s_PK) )).

fof(kb190,axiom,(
    s_partOf(s_g062,s_g142) )).

fof(kb191,axiom,(
    s_contains(s_g062,s_g034) )).

fof(kb192,axiom,(
    s_contains(s_g062,s_g143) )).

fof(kb193,axiom,(
    s_partOf(s_TM,s_g143) )).

fof(kb194,axiom,(
    s_partOf(s_TM,s_g172) )).

fof(kb195,axiom,(
    s_partOf(s_TJ,s_g143) )).

fof(kb196,axiom,(
    s_partOf(s_TJ,s_g172) )).

fof(kb197,axiom,(
    s_partOf(s_KG,s_g143) )).

fof(kb198,axiom,(
    s_partOf(s_KG,s_g172) )).

fof(kb199,axiom,(
    s_partOf(s_KZ,s_g143) )).

fof(kb200,axiom,(
    s_partOf(s_KZ,s_g172) )).

fof(kb201,axiom,(
    s_partOf(s_UZ,s_g143) )).

fof(kb202,axiom,(
    s_partOf(s_UZ,s_g172) )).

fof(kb203,axiom,(
    s_partOf(s_AE,s_g145) )).

fof(kb204,axiom,(
    s_partOf(s_AM,s_g145) )).

fof(kb205,axiom,(
    s_partOf(s_AM,s_g172) )).

fof(kb206,axiom,(
    s_partOf(s_AZ,s_g145) )).

fof(kb207,axiom,(
    s_partOf(s_AZ,s_g172) )).

fof(kb208,axiom,(
    s_partOf(s_BH,s_g145) )).

fof(kb209,axiom,(
    s_partOf(s_CY,s_g145) )).

fof(kb210,axiom,(
    s_partOf(s_GE,s_g145) )).

fof(kb211,axiom,(
    s_partOf(s_GE,s_g172) )).

fof(kb212,axiom,(
    s_partOf(s_IL,s_g145) )).

fof(kb213,axiom,(
    s_partOf(s_IQ,s_g145) )).

fof(kb214,axiom,(
    s_partOf(s_JO,s_g145) )).

fof(kb215,axiom,(
    s_partOf(s_KW,s_g145) )).

fof(kb216,axiom,(
    s_partOf(s_LB,s_g145) )).

fof(kb217,axiom,(
    s_partOf(s_OM,s_g145) )).

fof(kb218,axiom,(
    s_partOf(s_PS,s_g145) )).

fof(kb219,axiom,(
    s_partOf(s_QA,s_g145) )).

fof(kb220,axiom,(
    s_partOf(s_SA,s_g145) )).

fof(kb221,axiom,(
    s_partOf(s_NT,s_g145) )).

fof(kb222,axiom,(
    s_partOf(s_SY,s_g145) )).

fof(kb223,axiom,(
    s_partOf(s_TR,s_g145) )).

fof(kb224,axiom,(
    s_partOf(s_YE,s_g145) )).

fof(kb225,axiom,(
    s_partOf(s_YD,s_g145) )).

fof(kb226,axiom,(
    s_contains(s_g015,s_DZ) )).

fof(kb227,axiom,(
    s_contains(s_g015,s_EG) )).

fof(kb228,axiom,(
    s_contains(s_g015,s_EH) )).

fof(kb229,axiom,(
    s_contains(s_g015,s_LY) )).

fof(kb230,axiom,(
    s_contains(s_g015,s_MA) )).

fof(kb231,axiom,(
    s_contains(s_g015,s_SD) )).

fof(kb232,axiom,(
    s_contains(s_g015,s_TN) )).

fof(kb233,axiom,(
    s_partOf(s_g015,s_g002) )).

fof(kb234,axiom,(
    s_partOf(s_DZ,s_g015) )).

fof(kb235,axiom,(
    s_partOf(s_EG,s_g015) )).

fof(kb236,axiom,(
    s_partOf(s_EH,s_g015) )).

fof(kb237,axiom,(
    s_partOf(s_LY,s_g015) )).

fof(kb238,axiom,(
    s_partOf(s_MA,s_g015) )).

fof(kb239,axiom,(
    s_partOf(s_SD,s_g015) )).

fof(kb240,axiom,(
    s_partOf(s_TN,s_g015) )).

fof(kb241,axiom,(
    s_partOf(s_g039,s_g150) )).

fof(kb242,axiom,(
    s_contains(s_g039,s_AD) )).

fof(kb243,axiom,(
    s_contains(s_g039,s_AL) )).

fof(kb244,axiom,(
    s_contains(s_g039,s_BA) )).

fof(kb245,axiom,(
    s_contains(s_g039,s_ES) )).

fof(kb246,axiom,(
    s_contains(s_g039,s_GI) )).

fof(kb247,axiom,(
    s_contains(s_g039,s_GR) )).

fof(kb248,axiom,(
    s_contains(s_g039,s_HR) )).

fof(kb249,axiom,(
    s_contains(s_g039,s_IT) )).

fof(kb250,axiom,(
    s_contains(s_g039,s_ME) )).

fof(kb251,axiom,(
    s_contains(s_g039,s_MK) )).

fof(kb252,axiom,(
    s_contains(s_g039,s_MT) )).

fof(kb253,axiom,(
    s_contains(s_g039,s_CS) )).

fof(kb254,axiom,(
    s_contains(s_g039,s_RS) )).

fof(kb255,axiom,(
    s_contains(s_g039,s_PT) )).

fof(kb256,axiom,(
    s_contains(s_g039,s_SI) )).

fof(kb257,axiom,(
    s_contains(s_g039,s_SM) )).

fof(kb258,axiom,(
    s_contains(s_g039,s_VA) )).

fof(kb259,axiom,(
    s_contains(s_g039,s_YU) )).

fof(kb260,axiom,(
    s_partOf(s_g151,s_g150) )).

fof(kb261,axiom,(
    s_contains(s_g151,s_BG) )).

fof(kb262,axiom,(
    s_contains(s_g151,s_BY) )).

fof(kb263,axiom,(
    s_contains(s_g151,s_CZ) )).

fof(kb264,axiom,(
    s_contains(s_g151,s_HU) )).

fof(kb265,axiom,(
    s_contains(s_g151,s_MD) )).

fof(kb266,axiom,(
    s_contains(s_g151,s_PL) )).

fof(kb267,axiom,(
    s_contains(s_g151,s_RO) )).

fof(kb268,axiom,(
    s_contains(s_g151,s_RU) )).

fof(kb269,axiom,(
    s_contains(s_g151,s_SU) )).

fof(kb270,axiom,(
    s_contains(s_g151,s_SK) )).

fof(kb271,axiom,(
    s_contains(s_g151,s_UA) )).

fof(kb272,axiom,(
    s_partOf(s_g154,s_g150) )).

fof(kb273,axiom,(
    s_contains(s_g154,s_GG) )).

fof(kb274,axiom,(
    s_contains(s_g154,s_IM) )).

fof(kb275,axiom,(
    s_contains(s_g154,s_JE) )).

fof(kb276,axiom,(
    s_contains(s_g154,s_AX) )).

fof(kb277,axiom,(
    s_contains(s_g154,s_DK) )).

fof(kb278,axiom,(
    s_contains(s_g154,s_EE) )).

fof(kb279,axiom,(
    s_contains(s_g154,s_FI) )).

fof(kb280,axiom,(
    s_contains(s_g154,s_FO) )).

fof(kb281,axiom,(
    s_contains(s_g154,s_GB) )).

fof(kb282,axiom,(
    s_contains(s_g154,s_IE) )).

fof(kb283,axiom,(
    s_contains(s_g154,s_IM) )).

fof(kb284,axiom,(
    s_contains(s_g154,s_IS) )).

fof(kb285,axiom,(
    s_contains(s_g154,s_LT) )).

fof(kb286,axiom,(
    s_contains(s_g154,s_LV) )).

fof(kb287,axiom,(
    s_contains(s_g154,s_NO) )).

fof(kb288,axiom,(
    s_contains(s_g154,s_SE) )).

fof(kb289,axiom,(
    s_contains(s_g154,s_SJ) )).

fof(kb290,axiom,(
    s_partOf(s_g155,s_g150) )).

fof(kb291,axiom,(
    s_contains(s_g155,s_AT) )).

fof(kb292,axiom,(
    s_contains(s_g155,s_BE) )).

fof(kb293,axiom,(
    s_contains(s_g155,s_CH) )).

fof(kb294,axiom,(
    s_contains(s_g155,s_DE) )).

fof(kb295,axiom,(
    s_contains(s_g155,s_DD) )).

fof(kb296,axiom,(
    s_contains(s_g155,s_FR) )).

fof(kb297,axiom,(
    s_contains(s_g155,s_FX) )).

fof(kb298,axiom,(
    s_contains(s_g155,s_LI) )).

fof(kb299,axiom,(
    s_contains(s_g155,s_LU) )).

fof(kb300,axiom,(
    s_contains(s_g155,s_MC) )).

fof(kb301,axiom,(
    s_contains(s_g155,s_NL) )).

fof(kb302,axiom,(
    s_partOf(s_BG,s_g151) )).

fof(kb303,axiom,(
    s_partOf(s_BY,s_g151) )).

fof(kb304,axiom,(
    s_partOf(s_BY,s_g172) )).

fof(kb305,axiom,(
    s_partOf(s_CZ,s_g151) )).

fof(kb306,axiom,(
    s_partOf(s_HU,s_g151) )).

fof(kb307,axiom,(
    s_partOf(s_MD,s_g151) )).

fof(kb308,axiom,(
    s_partOf(s_MD,s_g172) )).

fof(kb309,axiom,(
    s_partOf(s_PL,s_g151) )).

fof(kb310,axiom,(
    s_partOf(s_RO,s_g151) )).

fof(kb311,axiom,(
    s_partOf(s_RU,s_g151) )).

fof(kb312,axiom,(
    s_partOf(s_RU,s_g172) )).

fof(kb313,axiom,(
    s_partOf(s_SU,s_g151) )).

fof(kb314,axiom,(
    s_partOf(s_SK,s_g151) )).

fof(kb315,axiom,(
    s_partOf(s_UA,s_g151) )).

fof(kb316,axiom,(
    s_partOf(s_UA,s_g172) )).

fof(kb317,axiom,(
    s_partOf(s_GG,s_g154) )).

fof(kb318,axiom,(
    s_partOf(s_GG,s_g830) )).

fof(kb319,axiom,(
    s_partOf(s_IM,s_g154) )).

fof(kb320,axiom,(
    s_partOf(s_IM,s_g154) )).

fof(kb321,axiom,(
    s_partOf(s_JE,s_g154) )).

fof(kb322,axiom,(
    s_partOf(s_JE,s_g830) )).

fof(kb323,axiom,(
    s_partOf(s_AX,s_g154) )).

fof(kb324,axiom,(
    s_partOf(s_DK,s_g154) )).

fof(kb325,axiom,(
    s_partOf(s_EE,s_g154) )).

fof(kb326,axiom,(
    s_partOf(s_FI,s_g154) )).

fof(kb327,axiom,(
    s_partOf(s_FO,s_g154) )).

fof(kb328,axiom,(
    s_partOf(s_GB,s_g154) )).

fof(kb329,axiom,(
    s_partOf(s_IE,s_g154) )).

fof(kb330,axiom,(
    s_partOf(s_IS,s_g154) )).

fof(kb331,axiom,(
    s_partOf(s_LT,s_g154) )).

fof(kb332,axiom,(
    s_partOf(s_LV,s_g154) )).

fof(kb333,axiom,(
    s_partOf(s_NO,s_g154) )).

fof(kb334,axiom,(
    s_partOf(s_SE,s_g154) )).

fof(kb335,axiom,(
    s_partOf(s_SJ,s_g154) )).

fof(kb336,axiom,(
    s_contains(s_g830,s_GG) )).

fof(kb337,axiom,(
    s_contains(s_g830,s_JE) )).

fof(kb338,axiom,(
    s_partOf(s_AT,s_g155) )).

fof(kb339,axiom,(
    s_partOf(s_BE,s_g155) )).

fof(kb340,axiom,(
    s_partOf(s_CH,s_g155) )).

fof(kb341,axiom,(
    s_partOf(s_DE,s_g155) )).

fof(kb342,axiom,(
    s_partOf(s_DD,s_g155) )).

fof(kb343,axiom,(
    s_partOf(s_FR,s_g155) )).

fof(kb344,axiom,(
    s_partOf(s_FX,s_g155) )).

fof(kb345,axiom,(
    s_partOf(s_LI,s_g155) )).

fof(kb346,axiom,(
    s_partOf(s_LU,s_g155) )).

fof(kb347,axiom,(
    s_partOf(s_MC,s_g155) )).

fof(kb348,axiom,(
    s_partOf(s_NL,s_g155) )).

fof(kb349,axiom,(
    s_contains(s_g017,s_AO) )).

fof(kb350,axiom,(
    s_contains(s_g017,s_CD) )).

fof(kb351,axiom,(
    s_contains(s_g017,s_ZR) )).

fof(kb352,axiom,(
    s_contains(s_g017,s_CF) )).

fof(kb353,axiom,(
    s_contains(s_g017,s_CG) )).

fof(kb354,axiom,(
    s_contains(s_g017,s_CM) )).

fof(kb355,axiom,(
    s_contains(s_g017,s_GA) )).

fof(kb356,axiom,(
    s_contains(s_g017,s_GQ) )).

fof(kb357,axiom,(
    s_contains(s_g017,s_ST) )).

fof(kb358,axiom,(
    s_contains(s_g017,s_TD) )).

fof(kb359,axiom,(
    s_partOf(s_g017,s_g002) )).

fof(kb360,axiom,(
    s_partOf(s_AO,s_g017) )).

fof(kb361,axiom,(
    s_partOf(s_CD,s_g017) )).

fof(kb362,axiom,(
    s_partOf(s_ZR,s_g017) )).

fof(kb363,axiom,(
    s_partOf(s_CF,s_g017) )).

fof(kb364,axiom,(
    s_partOf(s_CG,s_g017) )).

fof(kb365,axiom,(
    s_partOf(s_CM,s_g017) )).

fof(kb366,axiom,(
    s_partOf(s_GA,s_g017) )).

fof(kb367,axiom,(
    s_partOf(s_GQ,s_g017) )).

fof(kb368,axiom,(
    s_partOf(s_ST,s_g017) )).

fof(kb369,axiom,(
    s_partOf(s_TD,s_g017) )).

fof(kb370,axiom,(
    s_contains(s_g172,s_AM) )).

fof(kb371,axiom,(
    s_contains(s_g172,s_AZ) )).

fof(kb372,axiom,(
    s_contains(s_g172,s_BY) )).

fof(kb373,axiom,(
    s_contains(s_g172,s_GE) )).

fof(kb374,axiom,(
    s_contains(s_g172,s_KG) )).

fof(kb375,axiom,(
    s_contains(s_g172,s_KZ) )).

fof(kb376,axiom,(
    s_contains(s_g172,s_MD) )).

fof(kb377,axiom,(
    s_contains(s_g172,s_RU) )).

fof(kb378,axiom,(
    s_contains(s_g172,s_TJ) )).

fof(kb379,axiom,(
    s_contains(s_g172,s_TM) )).

fof(kb380,axiom,(
    s_contains(s_g172,s_UA) )).

fof(kb381,axiom,(
    s_contains(s_g172,s_UZ) )).

fof(kb382,axiom,(
    s_contains(s_g018,s_BW) )).

fof(kb383,axiom,(
    s_contains(s_g018,s_LS) )).

fof(kb384,axiom,(
    s_contains(s_g018,s_NA) )).

fof(kb385,axiom,(
    s_contains(s_g018,s_SZ) )).

fof(kb386,axiom,(
    s_contains(s_g018,s_ZA) )).

fof(kb387,axiom,(
    s_partOf(s_g018,s_g002) )).

fof(kb388,axiom,(
    s_partOf(s_BW,s_g018) )).

fof(kb389,axiom,(
    s_partOf(s_LS,s_g018) )).

fof(kb390,axiom,(
    s_partOf(s_NA,s_g018) )).

fof(kb391,axiom,(
    s_partOf(s_SZ,s_g018) )).

fof(kb392,axiom,(
    s_partOf(s_ZA,s_g018) )).

fof(kb393,axiom,(
    s_partOf(s_g005,s_g019) )).

fof(kb394,axiom,(
    s_partOf(s_g005,s_g419) )).

fof(kb395,axiom,(
    s_contains(s_g005,s_AR) )).

fof(kb396,axiom,(
    s_contains(s_g005,s_BO) )).

fof(kb397,axiom,(
    s_contains(s_g005,s_BR) )).

fof(kb398,axiom,(
    s_contains(s_g005,s_CL) )).

fof(kb399,axiom,(
    s_contains(s_g005,s_CO) )).

fof(kb400,axiom,(
    s_contains(s_g005,s_EC) )).

fof(kb401,axiom,(
    s_contains(s_g005,s_FK) )).

fof(kb402,axiom,(
    s_contains(s_g005,s_GF) )).

fof(kb403,axiom,(
    s_contains(s_g005,s_GY) )).

fof(kb404,axiom,(
    s_contains(s_g005,s_PE) )).

fof(kb405,axiom,(
    s_contains(s_g005,s_PY) )).

fof(kb406,axiom,(
    s_contains(s_g005,s_SR) )).

fof(kb407,axiom,(
    s_contains(s_g005,s_UY) )).

fof(kb408,axiom,(
    s_contains(s_g005,s_VE) )).

fof(kb409,axiom,(
    s_partOf(s_g021,s_g019) )).

fof(kb410,axiom,(
    s_contains(s_g021,s_BM) )).

fof(kb411,axiom,(
    s_contains(s_g021,s_CA) )).

fof(kb412,axiom,(
    s_contains(s_g021,s_GL) )).

fof(kb413,axiom,(
    s_contains(s_g021,s_PM) )).

fof(kb414,axiom,(
    s_contains(s_g021,s_US) )).

fof(kb415,axiom,(
    s_partOf(s_g021,s_g003) )).

fof(kb416,axiom,(
    s_partOf(s_g029,s_g019) )).

fof(kb417,axiom,(
    s_contains(s_g029,s_AG) )).

fof(kb418,axiom,(
    s_contains(s_g029,s_AI) )).

fof(kb419,axiom,(
    s_contains(s_g029,s_AN) )).

fof(kb420,axiom,(
    s_contains(s_g029,s_AW) )).

fof(kb421,axiom,(
    s_contains(s_g029,s_BB) )).

fof(kb422,axiom,(
    s_contains(s_g029,s_BL) )).

fof(kb423,axiom,(
    s_contains(s_g029,s_BS) )).

fof(kb424,axiom,(
    s_contains(s_g029,s_CU) )).

fof(kb425,axiom,(
    s_contains(s_g029,s_DM) )).

fof(kb426,axiom,(
    s_contains(s_g029,s_DO) )).

fof(kb427,axiom,(
    s_contains(s_g029,s_GD) )).

fof(kb428,axiom,(
    s_contains(s_g029,s_GP) )).

fof(kb429,axiom,(
    s_contains(s_g029,s_HT) )).

fof(kb430,axiom,(
    s_contains(s_g029,s_JM) )).

fof(kb431,axiom,(
    s_contains(s_g029,s_KN) )).

fof(kb432,axiom,(
    s_contains(s_g029,s_KY) )).

fof(kb433,axiom,(
    s_contains(s_g029,s_LC) )).

fof(kb434,axiom,(
    s_contains(s_g029,s_MF) )).

fof(kb435,axiom,(
    s_contains(s_g029,s_MQ) )).

fof(kb436,axiom,(
    s_contains(s_g029,s_MS) )).

fof(kb437,axiom,(
    s_contains(s_g029,s_PR) )).

fof(kb438,axiom,(
    s_contains(s_g029,s_TC) )).

fof(kb439,axiom,(
    s_contains(s_g029,s_TT) )).

fof(kb440,axiom,(
    s_contains(s_g029,s_VC) )).

fof(kb441,axiom,(
    s_contains(s_g029,s_VG) )).

fof(kb442,axiom,(
    s_contains(s_g029,s_VI) )).

fof(kb443,axiom,(
    s_partOf(s_g029,s_g003) )).

fof(kb444,axiom,(
    s_partOf(s_g029,s_g419) )).

fof(kb445,axiom,(
    s_partOf(s_g003,s_g019) )).

fof(kb446,axiom,(
    s_contains(s_g003,s_g013) )).

fof(kb447,axiom,(
    s_contains(s_g003,s_g021) )).

fof(kb448,axiom,(
    s_contains(s_g003,s_g029) )).

fof(kb449,axiom,(
    s_partOf(s_g419,s_g019) )).

fof(kb450,axiom,(
    s_contains(s_g419,s_g005) )).

fof(kb451,axiom,(
    s_contains(s_g419,s_g013) )).

fof(kb452,axiom,(
    s_contains(s_g419,s_g029) )).

fof(kb453,axiom,(
    s_partOf(s_BM,s_g021) )).

fof(kb454,axiom,(
    s_partOf(s_CA,s_g021) )).

fof(kb455,axiom,(
    s_partOf(s_GL,s_g021) )).

fof(kb456,axiom,(
    s_partOf(s_PM,s_g021) )).

fof(kb457,axiom,(
    s_partOf(s_US,s_g021) )).

fof(kb458,axiom,(
    s_partOf(s_AG,s_g029) )).

fof(kb459,axiom,(
    s_partOf(s_AI,s_g029) )).

fof(kb460,axiom,(
    s_partOf(s_AN,s_g029) )).

fof(kb461,axiom,(
    s_partOf(s_AW,s_g029) )).

fof(kb462,axiom,(
    s_partOf(s_BB,s_g029) )).

fof(kb463,axiom,(
    s_partOf(s_BL,s_g029) )).

fof(kb464,axiom,(
    s_partOf(s_BS,s_g029) )).

fof(kb465,axiom,(
    s_partOf(s_CU,s_g029) )).

fof(kb466,axiom,(
    s_partOf(s_DM,s_g029) )).

fof(kb467,axiom,(
    s_partOf(s_DO,s_g029) )).

fof(kb468,axiom,(
    s_partOf(s_GD,s_g029) )).

fof(kb469,axiom,(
    s_partOf(s_GP,s_g029) )).

fof(kb470,axiom,(
    s_partOf(s_HT,s_g029) )).

fof(kb471,axiom,(
    s_partOf(s_JM,s_g029) )).

fof(kb472,axiom,(
    s_partOf(s_KN,s_g029) )).

fof(kb473,axiom,(
    s_partOf(s_KY,s_g029) )).

fof(kb474,axiom,(
    s_partOf(s_LC,s_g029) )).

fof(kb475,axiom,(
    s_partOf(s_MF,s_g029) )).

fof(kb476,axiom,(
    s_partOf(s_MQ,s_g029) )).

fof(kb477,axiom,(
    s_partOf(s_MS,s_g029) )).

fof(kb478,axiom,(
    s_partOf(s_PR,s_g029) )).

fof(kb479,axiom,(
    s_partOf(s_TC,s_g029) )).

fof(kb480,axiom,(
    s_partOf(s_TT,s_g029) )).

fof(kb481,axiom,(
    s_partOf(s_VC,s_g029) )).

fof(kb482,axiom,(
    s_partOf(s_VG,s_g029) )).

fof(kb483,axiom,(
    s_partOf(s_VI,s_g029) )).

fof(kb484,axiom,(
    s_partOf(s_CN,s_g030) )).

fof(kb485,axiom,(
    s_partOf(s_HK,s_g030) )).

fof(kb486,axiom,(
    s_partOf(s_JP,s_g030) )).

fof(kb487,axiom,(
    s_partOf(s_KP,s_g030) )).

fof(kb488,axiom,(
    s_partOf(s_KR,s_g030) )).

fof(kb489,axiom,(
    s_partOf(s_MN,s_g030) )).

fof(kb490,axiom,(
    s_partOf(s_MO,s_g030) )).

fof(kb491,axiom,(
    s_partOf(s_TW,s_g030) )).

fof(kb492,axiom,(
    s_partOf(s_BN,s_g035) )).

fof(kb493,axiom,(
    s_partOf(s_ID,s_g035) )).

fof(kb494,axiom,(
    s_partOf(s_KH,s_g035) )).

fof(kb495,axiom,(
    s_partOf(s_LA,s_g035) )).

fof(kb496,axiom,(
    s_partOf(s_MM,s_g035) )).

fof(kb497,axiom,(
    s_partOf(s_BU,s_g035) )).

fof(kb498,axiom,(
    s_partOf(s_MY,s_g035) )).

fof(kb499,axiom,(
    s_partOf(s_PH,s_g035) )).

fof(kb500,axiom,(
    s_partOf(s_SG,s_g035) )).

fof(kb501,axiom,(
    s_partOf(s_TH,s_g035) )).

fof(kb502,axiom,(
    s_partOf(s_TL,s_g035) )).

fof(kb503,axiom,(
    s_partOf(s_TP,s_g035) )).

fof(kb504,axiom,(
    s_partOf(s_VN,s_g035) )).

fof(kb505,axiom,(
    s_partOf(s_AD,s_g039) )).

fof(kb506,axiom,(
    s_partOf(s_AL,s_g039) )).

fof(kb507,axiom,(
    s_partOf(s_BA,s_g039) )).

fof(kb508,axiom,(
    s_partOf(s_ES,s_g039) )).

fof(kb509,axiom,(
    s_partOf(s_GI,s_g039) )).

fof(kb510,axiom,(
    s_partOf(s_GR,s_g039) )).

fof(kb511,axiom,(
    s_partOf(s_HR,s_g039) )).

fof(kb512,axiom,(
    s_partOf(s_IT,s_g039) )).

fof(kb513,axiom,(
    s_partOf(s_ME,s_g039) )).

fof(kb514,axiom,(
    s_partOf(s_MK,s_g039) )).

fof(kb515,axiom,(
    s_partOf(s_MT,s_g039) )).

fof(kb516,axiom,(
    s_partOf(s_CS,s_g039) )).

fof(kb517,axiom,(
    s_partOf(s_RS,s_g039) )).

fof(kb518,axiom,(
    s_partOf(s_PT,s_g039) )).

fof(kb519,axiom,(
    s_partOf(s_SI,s_g039) )).

fof(kb520,axiom,(
    s_partOf(s_SM,s_g039) )).

fof(kb521,axiom,(
    s_partOf(s_VA,s_g039) )).

fof(kb522,axiom,(
    s_partOf(s_YU,s_g039) )).

fof(kb523,axiom,(
    s_partOf(s_AR,s_g005) )).

fof(kb524,axiom,(
    s_partOf(s_BO,s_g005) )).

fof(kb525,axiom,(
    s_partOf(s_BR,s_g005) )).

fof(kb526,axiom,(
    s_partOf(s_CL,s_g005) )).

fof(kb527,axiom,(
    s_partOf(s_CO,s_g005) )).

fof(kb528,axiom,(
    s_partOf(s_EC,s_g005) )).

fof(kb529,axiom,(
    s_partOf(s_FK,s_g005) )).

fof(kb530,axiom,(
    s_partOf(s_GF,s_g005) )).

fof(kb531,axiom,(
    s_partOf(s_GY,s_g005) )).

fof(kb532,axiom,(
    s_partOf(s_PE,s_g005) )).

fof(kb533,axiom,(
    s_partOf(s_PY,s_g005) )).

fof(kb534,axiom,(
    s_partOf(s_SR,s_g005) )).

fof(kb535,axiom,(
    s_partOf(s_UY,s_g005) )).

fof(kb536,axiom,(
    s_partOf(s_VE,s_g005) )).

fof(kb537,axiom,(
    s_contains(s_g053,s_AU) )).

fof(kb538,axiom,(
    s_contains(s_g053,s_NF) )).

fof(kb539,axiom,(
    s_contains(s_g053,s_NZ) )).

fof(kb540,axiom,(
    s_partOf(s_g053,s_g009) )).

fof(kb541,axiom,(
    s_partOf(s_AU,s_g053) )).

fof(kb542,axiom,(
    s_partOf(s_NF,s_g053) )).

fof(kb543,axiom,(
    s_partOf(s_NZ,s_g053) )).

fof(kb544,axiom,(
    s_contains(s_g054,s_FJ) )).

fof(kb545,axiom,(
    s_contains(s_g054,s_NC) )).

fof(kb546,axiom,(
    s_contains(s_g054,s_PG) )).

fof(kb547,axiom,(
    s_contains(s_g054,s_SB) )).

fof(kb548,axiom,(
    s_contains(s_g054,s_VU) )).

fof(kb549,axiom,(
    s_partOf(s_g054,s_g009) )).

fof(kb550,axiom,(
    s_partOf(s_FJ,s_g054) )).

fof(kb551,axiom,(
    s_partOf(s_NC,s_g054) )).

fof(kb552,axiom,(
    s_partOf(s_PG,s_g054) )).

fof(kb553,axiom,(
    s_partOf(s_SB,s_g054) )).

fof(kb554,axiom,(
    s_partOf(s_VU,s_g054) )).

fof(kb555,axiom,(
    s_contains(s_g057,s_FM) )).

fof(kb556,axiom,(
    s_contains(s_g057,s_GU) )).

fof(kb557,axiom,(
    s_contains(s_g057,s_KI) )).

fof(kb558,axiom,(
    s_contains(s_g057,s_MH) )).

fof(kb559,axiom,(
    s_contains(s_g057,s_MP) )).

fof(kb560,axiom,(
    s_contains(s_g057,s_NR) )).

fof(kb561,axiom,(
    s_contains(s_g057,s_PW) )).

fof(kb562,axiom,(
    s_partOf(s_g057,s_g009) )).

fof(kb563,axiom,(
    s_partOf(s_FM,s_g057) )).

fof(kb564,axiom,(
    s_partOf(s_GU,s_g057) )).

fof(kb565,axiom,(
    s_partOf(s_KI,s_g057) )).

fof(kb566,axiom,(
    s_partOf(s_MH,s_g057) )).

fof(kb567,axiom,(
    s_partOf(s_MP,s_g057) )).

fof(kb568,axiom,(
    s_partOf(s_NR,s_g057) )).

fof(kb569,axiom,(
    s_partOf(s_PW,s_g057) )).

fof(kb570,axiom,(
    s_contains(s_g061,s_AS) )).

fof(kb571,axiom,(
    s_contains(s_g061,s_CK) )).

fof(kb572,axiom,(
    s_contains(s_g061,s_NU) )).

fof(kb573,axiom,(
    s_contains(s_g061,s_PF) )).

fof(kb574,axiom,(
    s_contains(s_g061,s_PN) )).

fof(kb575,axiom,(
    s_contains(s_g061,s_TK) )).

fof(kb576,axiom,(
    s_contains(s_g061,s_TO) )).

fof(kb577,axiom,(
    s_contains(s_g061,s_TV) )).

fof(kb578,axiom,(
    s_contains(s_g061,s_WF) )).

fof(kb579,axiom,(
    s_contains(s_g061,s_WS) )).

fof(kb580,axiom,(
    s_partOf(s_g061,s_g009) )).

fof(kb581,axiom,(
    s_partOf(s_AS,s_g061) )).

fof(kb582,axiom,(
    s_partOf(s_CK,s_g061) )).

fof(kb583,axiom,(
    s_partOf(s_NU,s_g061) )).

fof(kb584,axiom,(
    s_partOf(s_PF,s_g061) )).

fof(kb585,axiom,(
    s_partOf(s_PN,s_g061) )).

fof(kb586,axiom,(
    s_partOf(s_TK,s_g061) )).

fof(kb587,axiom,(
    s_partOf(s_TO,s_g061) )).

fof(kb588,axiom,(
    s_partOf(s_TV,s_g061) )).

fof(kb589,axiom,(
    s_partOf(s_WF,s_g061) )).

fof(kb590,axiom,(
    s_partOf(s_WS,s_g061) )).

fof(kb591,axiom,(
    s_partOf(s_AF,s_g034) )).

fof(kb592,axiom,(
    s_partOf(s_BD,s_g034) )).

fof(kb593,axiom,(
    s_partOf(s_BT,s_g034) )).

fof(kb594,axiom,(
    s_partOf(s_IN,s_g034) )).

fof(kb595,axiom,(
    s_partOf(s_IR,s_g034) )).

fof(kb596,axiom,(
    s_partOf(s_LK,s_g034) )).

fof(kb597,axiom,(
    s_partOf(s_MV,s_g034) )).

fof(kb598,axiom,(
    s_partOf(s_NP,s_g034) )).

fof(kb599,axiom,(
    s_partOf(s_PK,s_g034) )).

fof(axiom1,axiom,(
    ! [X,Y,Z] :
      ( ( s_contains(X,Y)
        & s_contains(Y,Z) )
     => s_contains(X,Z) ) )).

fof(axiom2,axiom,(
    ! [X,Y] :
      ( s_partOf(X,Y)
     => s_contains(Y,X) ) )).

fof(axiom3,axiom,(
    ! [X,Y] :
      ( s_contains(X,Y)
     => s_partOf(Y,X) ) )).

fof(mexico_in_america_1,conjecture,(
    s_contains(s_g019,s_MX) )).

%------------------------------------------------------------------------------
