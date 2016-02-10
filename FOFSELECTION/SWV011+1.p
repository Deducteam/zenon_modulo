%--------------------------------------------------------------------------
% File     : SWV011+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Software Verification
% Problem  : Fact 2 of the Neumann-Stubblebine analysis
% Version  : [Wei99] axioms.
% English  :

% Refs     : [Wei99] Weidenbach (1999), Towards and Automatic Analysis of S
%            [Bau99] Baumgartner (1999), FTP'2000 - Problem Sets
% Source   : [Bau99]
% Names    : Fact 2 [Wei99]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.04 v5.2.0, 0.00 v2.4.0
% Syntax   : Number of formulae    :   17 (  16 unit)
%            Number of atoms       :   18 (   0 equality)
%            Maximal formula depth :    3 (   1 average)
%            Number of connectives :    1 (   0 ~  ;   0  |;   1  &)
%                                         (   0 <=>;   0 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    8 (   0 propositional; 1-1 arity)
%            Number of functors    :   15 (   6 constant; 0-4 arity)
%            Number of variables   :    1 (   0 singleton;   0 !;   1 ?)
%            Maximal term depth    :    6 (   3 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
fof(a_holds_key_at_for_t,axiom,
    ( a_holds(key(at,t)) )).

fof(a_is_party_of_protocol,axiom,
    ( party_of_protocol(a) )).

fof(a_sent_message_i_to_b,axiom,
    ( message(sent(a,b,pair(a,an_a_nonce))) )).

fof(a_stored_message_i,axiom,
    ( a_stored(pair(b,an_a_nonce)) )).

fof(b_hold_key_bt_for_t,axiom,
    ( b_holds(key(bt,t)) )).

fof(b_is_party_of_protocol,axiom,
    ( party_of_protocol(b) )).

fof(nonce_a_is_fresh_to_b,axiom,
    ( fresh_to_b(an_a_nonce) )).

fof(t_holds_key_at_for_a,axiom,
    ( t_holds(key(at,a)) )).

fof(t_holds_key_bt_for_b,axiom,
    ( t_holds(key(bt,b)) )).

fof(t_is_party_of_protocol,axiom,
    ( party_of_protocol(t) )).

fof(ax1,axiom,
    ( b_holds(key(generate_key(an_a_nonce),a)) )).

fof(ax2,axiom,
    ( message(sent(a,b,pair(encrypt(triple(a,generate_key(an_a_nonce),generate_expiration_time(an_a_nonce)),bt),encrypt(generate_b_nonce(an_a_nonce),generate_key(an_a_nonce))))) )).

fof(ax3,axiom,
    ( a_holds(key(generate_key(an_a_nonce),b)) )).

fof(ax4,axiom,
    ( message(sent(t,a,triple(encrypt(quadruple(b,an_a_nonce,generate_key(an_a_nonce),generate_expiration_time(an_a_nonce)),at),encrypt(triple(a,generate_key(an_a_nonce),generate_expiration_time(an_a_nonce)),bt),generate_b_nonce(an_a_nonce)))) )).

fof(ax5,axiom,
    ( message(sent(b,t,triple(b,generate_b_nonce(an_a_nonce),encrypt(triple(a,an_a_nonce,generate_expiration_time(an_a_nonce)),bt)))) )).

fof(ax6,axiom,
    ( b_stored(pair(a,an_a_nonce)) )).

fof(co1,conjecture,
    ( ? [U] :
        ( a_holds(key(U,b))
        & b_holds(key(U,a)) ) )).

%--------------------------------------------------------------------------
