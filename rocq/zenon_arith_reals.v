
Require Export Reals.
Require Import Psatz.

Open Scope R.

Lemma Rplus_inj : forall r r1 r2: R, r1 = r2 <-> r + r1 = r + r2.
Proof.
intros. split.
  - intro. exact (Rplus_eq_compat_l r r1 r2 H).
  - intro. exact (Rplus_eq_reg_l r r1 r2 H).
Qed.

Lemma Rplus_lt_r : forall r r1 r2: R, r1 < r2 <-> r1 + r < r2 + r.
Proof.
intros. split.
  - intro. lra.
  - intro. lra.
Qed.

Lemma Rplus_le_r : forall r r1 r2: R, r1 <= r2 <-> r1 + r <= r2 + r.
Proof.
intros. split.
  - intro. lra.
  - intro. lra.
Qed.

Lemma Rge_def : forall r1 r2: R, r1 >= r2 <-> r2 <= r1.
Proof.
intros. split.
  - intro. lra.
  - intro. lra.
Qed.

Lemma Rgt_def : forall r1 r2: R, r1 > r2 <-> r2 < r1.
Proof.
intros. split.
  - intro. lra.
  - intro. lra.
Qed.

(**** Tactics ****)

Ltac real_const := lra.

Ltac real_unfold := try rewrite Rge_def; try rewrite Rgt_def.
Ltac real_unfold_in H := try rewrite Rge_def in H; try rewrite Rgt_def in H.

Ltac real_norm :=
  real_unfold;
  match goal with
  | |- ?a =  ?b => rewrite -> (Rplus_inj (- b) _ _)
  | |- ?a <= ?b => rewrite -> (Rplus_le_r (- b) _ _)
  | |- ?a <  ?b => rewrite -> (Rplus_lt_r (- b) _ _)
  end;
  ring_simplify.

Ltac real_norm_in H :=
  real_unfold_in H;
  match type of H with
  | ?a = ?b => rewrite -> (Rplus_inj (- b) _ _) in H
  | ?a <= ?b => rewrite -> (Rplus_le_r (- b) _ _) in H
  | ?a <  ?b => rewrite -> (Rplus_lt_r (- b) _ _) in H
  end;
  ring_simplify in H.

Ltac real_simpl k H :=
  try (rewrite (Rmult_eq_compat_r _ _ k) in H; [ idtac | real_const ]);
  real_norm; real_norm_in H;
  match goal with
  | H: ?e <= 0 |- ?f <= 0 =>
      let x := fresh in
      cut (e = f); [
        intro x; try rewrite <- x; exact H |
        lra ]
  | H: ?e < 0 |- ?f < 0 =>
      let x := fresh in
      cut (e = f); [
        intro x; try rewrite <- x; exact H |
        lra ]
  | H: ?e = 0 |- ?f = 0 =>
      let x := fresh in
      cut (e = f); [
        intro x; try rewrite <- x; exact H |
        lra ]
  end.

Ltac Rle_mult k Hyp H := first [
  let x := fresh in cut (0 < k); [ intro x;  pose proof (Rmult_lt_compat_r k _ _ x Hyp) as H | real_const ] |
  let x := fresh in cut (0 <= k); [ intro x;  pose proof (Rmult_le_compat_r k _ _ x Hyp) as H | real_const ] |
  let x := fresh in cut (k > 0); [ intro x;  pose proof (Rmult_gt_compat_r k _ _ x Hyp) as H | real_const ] |
  let x := fresh in cut (k >= 0); [ intro x;  pose proof (Rmult_ge_compat_r k _ _ x Hyp) as H | real_const ] ];
  real_unfold_in H.

Ltac Rle_mult_opp k Hyp H :=
  let y := fresh in
  pose proof (Ropp_le_contravar _ _ Hyp) as y;
  Rle_mult k y H.

Ltac arith_real_switch H H' :=
  pose proof (Ropp_le_contravar _ _ H) as H';
  rewrite Ropp_involutive in H'.

Ltac arith_real_trans lower upper new := first [
  pose proof (Rle_trans _ _ _ lower upper) as new |
  pose proof (Rlt_trans _ _ _ lower upper) as new |
  pose proof (Rle_lt_trans _ _ _ lower upper) as new |
  pose proof (Rlt_le_trans _ _ _ lower upper) as new ].

Ltac real_trans_aux lower upper new :=
  first [
    arith_real_trans lower upper new |
    let Arith_tmp_l := fresh in arith_real_switch lower Arith_tmp_l; arith_real_trans Arith_tmp_l upper new |
    let Arith_tmp_u := fresh in arith_real_switch upper Arith_tmp_u; arith_real_trans lower Arith_tmp_u new |
    let Arith_tmp_l := fresh in let Arith_tmp_u := fresh in
    arith_real_switch lower Arith_tmp_l; arith_real_switch upper Arith_tmp_u;
    arith_real_trans Arith_tmp_l Arith_tmp_u new].

Ltac real_trans A B C := first [ real_trans_aux A B C | real_trans_aux B A C ].

Ltac real_trans_simpl A B :=
  real_unfold_in A; real_unfold_in B;
  let C := fresh in real_trans A B C; real_const.

(**** Lemmas ****)

Lemma Req_refl : forall r: R, r = r.
Proof. intros. reflexivity. Qed.

Lemma arith_real_eq : forall a b: R, a = b -> a <= b /\ a >= b.
Proof. intros. lra. Qed.

Lemma arith_real_neq : forall a b: R, (~ a = b) -> a < b \/ a > b.
Proof. intros. lra. Qed.

Lemma arith_real_neg_leq : forall a b: R, (~ a <= b) -> a > b.
Proof. intros. exact (Rnot_le_gt _ _ H). Qed.

Lemma arith_real_neg_lt : forall a b: R, (~ a < b) -> a >= b.
Proof. intros. exact (Rnot_lt_ge _ _ H). Qed.

Lemma arith_real_neg_geq : forall a b: R, (~ a >= b) -> a < b.
Proof. intros. exact (Rnot_ge_lt _ _ H). Qed.

Lemma arith_real_neg_gt : forall a b: R, (~ a > b) -> a <= b.
Proof. intros. exact (Rnot_gt_le _ _ H). Qed.
