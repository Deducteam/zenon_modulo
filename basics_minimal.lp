// Ceci est une version minimale ecrite a la main du fichier
// habituellement généré basics.dk. Ce fichier permet de tester Zenon
// indépendamment de FoCaLiZe.

require cc
require dk_bool
require dk_logic
require dk_tuple


definition Is_true ≔ dk_logic.ebP

definition bool__t ≔ dk_bool.bool
definition true ≔ dk_bool.true
definition false ≔ dk_bool.false

definition _amper__amper_ : cc.eT bool__t ⇒ cc.eT bool__t ⇒ cc.eT bool__t
               ≔ dk_bool.{|and|}

definition _bar__bar_ : cc.eT bool__t ⇒ cc.eT bool__t ⇒ cc.eT bool__t
           ≔ dk_bool.or

definition _tilda__tilda_ : cc.eT bool__t ⇒ cc.eT bool__t ≔ dk_bool.not

definition _bar__lt__gt__bar_ : cc.eT bool__t ⇒ cc.eT bool__t ⇒ cc.eT bool__t
                   ≔ dk_bool.xor

definition prod ≔ dk_tuple.prod

definition pair (a : cc.uT)
         (b : cc.uT)
         (x : cc.eT a)
         (y : cc.eT b)
         : cc.eT (dk_tuple.prod a b) ≔
  (dk_tuple.pair a b x y)

definition fst (a : cc.uT)
        (b : cc.uT)
        (x : cc.eT (dk_tuple.prod a b)) :
        cc.eT a ≔
      dk_tuple.fst a b x

definition snd (a : cc.uT)
        (b : cc.uT)
        (x : cc.eT (dk_tuple.prod a b)) :
        cc.eT b ≔
      dk_tuple.snd a b x

symbol _equal_ : ∀ (a : cc.uT), cc.eT a ⇒ cc.eT a ⇒ cc.eT bool__t

definition syntactic_equal ≔ _equal_

symbol __beq_refl  : ∀ (a : cc.uT) (x : cc.eT a),
              dk_logic.eP (dk_logic.ebP (_equal_ a x x))

symbol __beq_symm  : ∀ (a : cc.uT) (x : cc.eT a) (y : cc.eT a),
              dk_logic.eP (dk_logic.ebP (_equal_ a x y)) ⇒
              dk_logic.eP (dk_logic.ebP (_equal_ a y x))

symbol __beq_trans  : ∀ (a : cc.uT) (x : cc.eT a) (y : cc.eT a) (z : cc.eT a),
               dk_logic.eP (dk_logic.ebP (_equal_ a x y)) ⇒
               dk_logic.eP (dk_logic.ebP (_equal_ a y z)) ⇒
               dk_logic.eP (dk_logic.ebP (_equal_ a x z))
