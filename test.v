
Require Import QArith.

Parameter p : Q -> Prop.
Hypothesis H : Proper (Qeq ==> iff) p.

Lemma test : 2 # 1 == (1 * 2)%Z # 1 -> p(2 # 1) -> p((1 * 2)%Z # 1).
Proof.
intros.
rewrite H0 in H1. exact H1.
Qed.
