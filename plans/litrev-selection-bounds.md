# Lit review: T1/T2 selection bounds vs Chapman–Robbins / χ²-DRO

Status: active, highest-priority lit review. One of three feeding the
novelty-refactor capstone (`plans/novelty-refactor.md`). Models the proven
exchange-rate harness (`research/threads/lit_review/looking-for-exchange-rate-results/`),
not any older lit-review plan.

## Why this exists

The T5 exercise established that core "survived" theorems are likely classical
results in other clothes, and that the parallel lives in each theorem's *native
mathematical home*, not in the Goodhart literature we kept searching. T1/T2 is
the strongest remaining candidate — and more urgent than T5 was, because our own
notes currently assert the opposite.

`research/reviews/formal_analogue_lit_map.md` (lines ~138–142, "Non-map pass")
explicitly concludes the χ² reweighting budget has **no external analogue**:
"several sources have related divergence-based tools … but none use χ² in this
exact role." That search only covered Goodhart-adjacent sources (El-Mhamdi,
Dwork, Lucas). It never looked in estimation theory or distributionally robust
optimization. This is a probable false negative of exactly the T5/congruence
kind.

## The claim under review

T1 (book §5.1, `core-math.md` T1): for pure selection `mu_theta << mu_0`,
`L = d mu_theta/d mu_0`, `delta = ||L - 1||_{L^2(mu_0)} = sqrt(chi^2(mu_theta||mu_0))`,
and hidden coordinate `H_i` with baseline sd `s_i`:
`|E_{mu_theta}[H_i] - E_{mu_0}[H_i]| <= delta * s_i`.
T2: value-weighted/operator form `|v . B_H| <= delta sqrt(v^T Sigma_H v)`, with
the support-function sup over a declared value unit ball.

## Suspected prior art (the hypothesis to confirm or refute)

- **Hammersley–Chapman–Robbins inequality (1950).** `Var_P(T) >= (E_Q[T] -
  E_P[T])^2 / chi^2(Q||P)` rearranges to exactly `|Delta E[H]| <= sd_P(H) *
  sqrt(chi^2)`. HCR **generalizes Cramér–Rao**; it is in standard estimation
  theory. If confirmed, T1 *is* HCR and T2 is HCR applied to `v . H`.
- **χ²-divergence DRO.** "Worst-case mean over a χ²-ball of radius δ = baseline
  mean + δ·sd" is the textbook χ²-robustness result; the two-point tightness
  witness is the standard attainment case, and the operator form is the
  ellipsoid support function. Anchors: Ben-Tal et al. 2013 ("Robust solutions of
  optimization problems affected by uncertain probabilities"); Duchi & Namkoong;
  Lam 2016/2019 ("robust sensitivity").
- **Bayesian robustness / posterior-expectation sensitivity** to prior
  perturbations (Gustafson, Basu) — a possible third independent home.

Double exposure: an econ/stats referee knows HCR; an ML referee knows χ²-DRO.

## Protocol

Run the two-pass adversarial harness used for the exchange-rate review, seeded
toward **estimation theory + DRO**, not Goodhart sources:

1. Optimistic ("prove this is novel") and pessimistic ("find the precedent,
   treat 'novel' as failure") prompts, structured as in
   `research/threads/lit_review/looking-for-exchange-rate-results/optimistic_prompt.md`
   and `pessimistic_prompt.md`.
2. Run each across ChatGPT, Claude, and Gemini deep research; store results in a
   new `research/threads/lit_review/selection-bound-chapman-robbins/`.
3. Seeds to embed: Hammersley–Chapman–Robbins; Chapman–Robbins bound; Cramér–Rao
   generalization via χ²; f-divergence / χ²-divergence DRO; variance as
   worst-case sensitivity; Ben-Tal 2013; Duchi–Namkoong; Lam robust sensitivity;
   Bayesian robustness posterior sensitivity.

## Resolution criterion

The review is resolved when the passes converge on (a) whether T1 = HCR verbatim,
(b) the closest DRO statement of the χ²-ball mean envelope and its tightness, and
(c) an auditable negative for anything *not* found (e.g. the multidim operator
form over a declared value norm, if that turns out unstated). Verify the HCR and
DRO statements against at least one primary source before the capstone cites
proposition numbers.

## Consequence if confirmed (feeds the capstone)

- Correct the `formal_analogue_lit_map.md` false negative ("no χ² analogue").
- Reframe T1/T2 prose: state plainly that the envelope is Chapman–Robbins / the
  χ²-DRO worst case; scope the contribution to the *selection-channel reading*
  (ruling out / bounding selection before an intervention claim) and the
  declared-value-metric operator form, not the inequality.
- Keep the existing El-Mhamdi/Majka comparison (sharp asymptotics vs envelope);
  it is unaffected and now sits next to the correct classical anchor.

## What this plan deliberately does not do

- No new theorem; no change to the T1/T2 statements themselves.
- No edits to `core-math.md`, `claim_audits.md`, or the book until the capstone
  runs (this plan only produces the review verdict).
