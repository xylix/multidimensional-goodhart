# Could-do: RLHF identification experiment

Extracted June 11, 2026 from the executed empirics plan
(`archived/exchange-rate-empirics.md`) when that track closed; expanded into a
full design June 23, 2026 (selected as the "biggest bet" fork, to be held until
circulation feedback confirms the framing lands before any compute is spent).

## One-line claim under test

The channel-level harm rates `h_j` of T5 — the *design-invariant* inputs the
exchange-rate diagnostic needs, as opposed to the design-relative realized
average `H/d` — are recoverable in a real system when the experimenter controls
regime variation. RLHF is the one domain where that control is free.

## Why RLHF and not HRRP/education

The empirical literatures the closed track mined (HRRP, education
accountability) only ever supply T5's *output* (a realized harm-per-score
average) and score-side traces. They cannot satisfy
`research/threads/exchange_rate_identification.md` Case 3, because real
scorecards rarely vary their channel weights non-proportionally across
comparable sites — the dominant real-world failure mode is **collinear
regimes** (sites differ only in stringency, profile matrix has rank 1).

RLHF removes that obstruction: the reward-model weight vector is a *knob*, not
an observed nuisance. Vary it on purpose across training runs with
non-proportional vectors and the induced best-response action profiles have
full column rank by construction — Case 3's identifiability condition is met by
design rather than hoped for. The harm side (gold-reward loss) is measurable
per run and per behavior category, making this a genuine **harm-on-actions**
design (Case 2/3 proper), not the score-on-traces regression that identifies
nothing about `h_j`.

Anchor: Gao, Schulman, Hilton 2023, *Scaling Laws for Reward Model
Overoptimization* (`gao2023rewardmodeloveroptimization`, already in refs.bib) —
establishes the proxy-RM vs. gold-RM overoptimization gap this design would
decompose by channel.

## Mapping to T5 / Case 3

| T5 / identification object | RLHF instantiation |
| --- | --- |
| measured channels `j` | behavior categories scored by the reward model (e.g. length, sycophancy, formatting, refusal, citation) |
| score weights `w_j` | reward-model loadings on each behavior category (the controlled knob) |
| action `a_j` | policy's realized expression of behavior `j` (measurable per category) |
| cost curvature `kappa_j` | how hard the base policy resists moving behavior `j` |
| hidden harm rate `h_j` | gold-reward loss per unit of behavior `j` (the target of identification) |
| regime `r` | one training run at a chosen weight vector `w^(r)` |
| induced profile `a*(r)` | measured per-category behavior shift in run `r` |
| harm equation `H(r) = a*(r) . h` | gold-reward loss of run `r` regressed on its category-shift profile |

Identification verdict to reproduce: `h` is identified **iff** the stacked
profile matrix `A` (rows `a*(r)`) has full column rank; individual `h_j` is
identified iff `e_j` lies in the row space of `A`.

## Concrete design

1. **Pick a small category basis** (3–5 behaviors) that the gold reward and a
   proxy reward both score, and that the policy can move at measurable cost.
2. **Choose `R >= n` non-proportional weight vectors** `w^(1..R)`. Verify
   non-proportionality *before* training (the cheap guard against collinear
   regimes); aim for a profile matrix with condition number low enough that the
   recovered `h` is stable under measurement noise.
3. **Train one policy per regime** against its proxy RM; freeze the base policy
   and decoding so cross-run differences come only through `w^(r)`.
4. **Measure, per run:** (a) per-category behavior shift `a*(r)` relative to the
   base policy, (b) gold-reward loss `H(r)`.
5. **Solve** the linear system `H = A h` for `h`; report the recovered rate
   vector, its covariance, and which `h_j` are individually identified vs. only
   identified in combination.
6. **Out-of-design test (the real payoff):** predict gold-reward loss for a
   *held-out* weight vector not used in fitting. Success = the recovered `h`
   predicts the held-out run's harm better than the best design-relative `H/d`
   average carried over from the fitting runs. This is the operational form of
   "the `h_j` transfer across designs and the average does not."

## Named failure modes to guard (from the identification thread)

- **Collinear regimes.** Proportional weight vectors give a rank-1 profile
  matrix and fake variation. Guard: check non-proportionality and condition
  number of `A` before spending training compute (step 2).
- **Selection / pool-composition contamination.** If gold-reward loss moves
  through something other than the induced category shifts (e.g. distribution
  drift in the eval set across runs), every harm equation is biased. Guard:
  hold the eval distribution fixed across runs; this is the RLHF form of the
  contract's exclusion-restriction-shaped response-channel field. Declaring it
  does not make it true — it makes the dependence auditable.
- **Non-quadratic cost / non-linear harm.** T5 assumes separable quadratic
  costs and linear harm. If the policy's resistance or the gold-loss-per-
  behavior is badly non-linear over the explored range, the linear system is
  misspecified. Guard: keep weight perturbations modest; report residual
  diagnostics from the `H = A h` fit as a misspecification check.

## What success would and would not license

- **Would:** a worked, real-system demonstration that closes the "open half" of
  Part 8's identification gap — turning the rank condition from a conditional
  existence claim into a reproduced result. Also a third domain (after HRRP and
  education) for the n=2 cross-domain regularity in
  `research/applications/education_evidence_mini_pass.md`: that *evidence shape*,
  not domain, predicts how far decomposition gets — RLHF is the
  controlled-regime shape, so it should decompose furthest.
- **Would not:** generalize beyond the declared category basis, license a
  welfare reading of gold-reward loss, or establish T5's hypotheses for arbitrary
  RLHF setups. Scope stays inside the contract.

## Status and cost

Experiment sketch, not book material. Executing it means a small training-run
sweep (R >= n runs) plus gold/proxy reward infrastructure — real compute, so
gated behind circulation feedback per the agreed ordering. If the framing moves
after circulation, the category basis and design would move with it, so
hardening this now would be premature optimization.
