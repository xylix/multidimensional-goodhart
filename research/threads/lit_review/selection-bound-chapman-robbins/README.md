# Selection-bound (T1/T2) prior-art review — synthesis

Status: closed, 2026-07-11. Per-theorem novelty verdict for T1 (scalar
selection bound) and T2 (value-weighted/operator selection bound), Track A,
per `plans/litrev-selection-bounds.md`.

Provenance: this review **consumes** the completed shared Phase 0 discovery
(`research/threads/lit_review/cross-field-discovery/prior-art-formal.md`,
Areas A–B, C2) and the Task 08 primary-source verification records
(`.../cross-field-discovery/prior-art-verification.md`, items B1–B4). No new
deep-research passes were run (the plan's original two-pass protocol is
superseded by the shared discovery, per the plan header). Verification tags
(`[verified-primary]`, `[verified-secondary]`) are **inherited** from Task 08;
nothing was re-verified here and no proposition number is cited beyond what
Task 08 read.

## The claim under review

From `research/core-math.md`:

- **T1.** Probability space `(S, F, mu_0)`; pure selection `mu_theta << mu_0`;
  `L = d mu_theta/d mu_0`, `E_0[L] = 1`, `L in L^2(mu_0)`; hidden coordinates
  `H_i` with finite second moments. With `delta = ||L - 1||_{L^2(mu_0)}` and
  `s_i = sd_{mu_0}(H_i)`:
  `|E_{mu_theta}[H_i] - E_{mu_0}[H_i]| <= delta * s_i`,
  and `||B_H||_2 <= delta ||s||_2` under the declared Euclidean coordinate
  metric. Sharpness riders: (i) tightness via a two-point witness for any
  `delta in (0,1]`; (ii) necessity of `L in L^2` via a `n^{-4}/n^{-2}`
  zeta-tail witness (finite hidden variance, infinite drift at infinite chi²).
- **T2.** T1 hypotheses + covariance `Sigma_H`; declared value direction `v`
  or value norm `||.||_V` with dual `||.||_{V,*}`:
  `|E_theta[v.(H - E_0 H)] - E_0[v.(H - E_0 H)]| <= delta sqrt(v^T Sigma_H v)`;
  norm form `||B_H||_V <= delta sup_{||v||_{V,*} <= 1} sqrt(v^T Sigma_H v)`.

## Verdict (TL;DR)

1. **T1's inequality is the Hammersley–Chapman–Robbins (HCR) chi-squared
   variational inequality, verbatim after rearrangement.** `[confident]` —
   rests on the Task-08 `[verified-primary]` record of Polyanskiy–Wu,
   *Information Theory: From Coding to Learning*, §29.1, eq. (29.1); the
   rearrangement algebra is displayed below and the adversarial pass (end of
   file) was run and cleared. Altitude note: T1 matches the **two-measure
   inequality** eq. (29.1) exactly; the classical estimation-theoretic "HCR
   bound" (Thm 29.1, eq. (29.3)) is that inequality plus a sup over a
   parametric family — T1 is the former, so "T1 = HCR" is exact at the
   inequality altitude and one packaging step away at the named-theorem
   altitude.
2. **The same envelope is the chi²-DRO worst-case mean, with the exact
   constant in Namkoong–Duchi 2017, Theorem 1, eq. (10).** `[confident]` —
   `[verified-primary]` per Task 08, including the normalization conversion
   (their `sqrt(2 rho/n)` **equals** the book's `delta` once their
   `phi(t) = (1/2)(t-1)^2` radius is converted; algebra below). **Corrected
   attribution:** Ben-Tal et al. 2013 supplies only the general phi-divergence
   robust-counterpart machinery (conjugate-based RCP, Table 2 chi² entry) and
   does **not** contain the mean+sqrt(r)·sd closed form — do not cite it for
   the envelope (Task 08 `[verified-primary]` correction).
3. **A third independent home exists in Bayesian robustness** (Gustafson 1996
   local sensitivity of posterior expectations: mean-shift <= posterior sd ×
   perturbation size). `[tentative]` — discovery-grade only (Phase 0 B5, no
   primary pull); cap stated.
4. **T2's skeleton is classical: matrix HCR ellipsoid + ellipsoid support
   function.** The scalar value-weighted form is *literally* scalar HCR
   applied to the scalar variable `v.H` (so it inherits the
   `[verified-primary]` status of eq. (29.1)); the matrix/ellipsoid form is
   `[verified-secondary]` as a canonical citation (Wikipedia verbatim; no
   numbered primary read) but is derivable in three lines from the
   verified-primary scalar form (shown below). **The declared-value-norm
   operator wrapper — the drift bound packaged over the dual unit ball of a
   declared value norm — was not found stated in any discovered source.**
   Auditable negative below. `[tentative]`
5. **What survives as ours:** the selection-channel *reading* (delta as a
   declared selection-intensity budget used to exclude/bound the selection
   channel before an intervention claim, with no independence assumption and
   no proxy–target decomposition), the declared-value-metric operator
   *packaging*, and the assembled sharpness pair (attainment witness +
   explicit necessity-of-L² witness) as presented. None of these is new
   mathematics; all are framing/packaging over a classical inequality — the
   same shape as the T5 verdict. `[tentative]`

Consequence: the internal "no chi² analogue exists" note
(`research/reviews/formal_analogue_lit_map.md`, Non-map pass) was a **false
negative**; corrected in place with a dated note pointing here.

## (a) The algebra: T1 is rearranged HCR

Task-08 verified-primary statement (Polyanskiy–Wu §29.1, eq. (29.1),
quoted in `prior-art-verification.md` B1):

```
chi^2(P||Q) >= sup_{a,b in R} { 2(a E_P[X] + b) - E_Q[(aX+b)^2] - 1 }
            = (E_P[X] - E_Q[X])^2 / Var_Q(X).
```

Rearrangement (three steps, no content added):

1. Multiply both sides by `Var_Q(X)`:
   `(E_P[X] - E_Q[X])^2 <= Var_Q(X) * chi^2(P||Q)`.
2. Take square roots:
   `|E_P[X] - E_Q[X]| <= sd_Q(X) * sqrt(chi^2(P||Q))`.
3. Instantiate `X = H_i`, `Q = mu_0` (baseline), `P = mu_theta` (selected),
   so `sd_Q(X) = s_i`; and note the book's `delta` **is** `sqrt(chi^2)` by
   definition:
   `delta^2 = ||L - 1||^2_{L^2(mu_0)} = E_{mu_0}[(d mu_theta/d mu_0 - 1)^2]
   = chi^2(mu_theta || mu_0)` — the definition of Pearson chi² in the same
   argument order (perturbed measure first, reference measure second) as
   eq. (29.1). Result: `|E_theta[H_i] - E_0[H_i]| <= delta * s_i` = **T1**.

The chi² **direction matches**: both eq. (29.1) and the book put the variance
under the second (reference) argument and the chi² integrand over the same
reference measure. No convention translation is needed. `[confident]`

### Hypothesis-by-hypothesis check against T1's actual statement

| T1 hypothesis | eq. (29.1) counterpart | Match? |
| --- | --- | --- |
| `mu_theta << mu_0` | Needed for `chi^2(P||Q) < infinity`; eq. (29.1) holds for arbitrary pairs with `chi^2 = +infinity` convention (then vacuous) | Match; T1 makes explicit what eq. (29.1) absorbs into the `+infinity` convention |
| `E_0[L] = 1`, `L >= 0` | `P` is a probability measure | Match (automatic) |
| `L in L^2(mu_0)` | `chi^2(P||Q) < infinity` — identical condition (`chi^2 = ||L-1||_2^2`) | Match |
| `H_i` finite second moment | `X` with `Var_Q(X) < infinity` (else RHS degenerate) | Match |
| Per-coordinate + `||B_H||_2 <= delta ||s||_2` aggregate | Scalar inequality applied coordinatewise; the `l^2` aggregate is summing squares of the per-coordinate bounds | Elementary corollary, no extra content |
| Tightness: two-point witness, any `delta in (0,1]` | **Not stated in the verified excerpt** of eq. (29.1)/Thm 29.1 | **Mismatch (small): see below** |
| Necessity of `L in L^2`: zeta-tail witness | Not stated (eq. (29.1) is merely vacuous at `chi^2 = infinity`; T1's rider shows the *conclusion* genuinely fails, not just the bound) | **Mismatch (small): see below** |

**The two mismatches, stated as part of the verdict, not a footnote:** the
*inequality* is verbatim HCR; the *sharpness package* is not verbatim in the
verified primary excerpt. (i) The attainment witness (two-point `H`,
`L = 1 ± delta`, valid density iff `delta <= 1`) is the Cauchy–Schwarz
equality case and is the same object as the chi²-DRO worst-case attainer; its
empirical-setting analogue is `[verified-primary]` as the *lower* bound of
Namkoong–Duchi Thm 1 eq. (10) (`sqrt(2 rho/n) s_n - 2M rho/n <= sup - mean`),
whose `-2M rho/n` correction plays exactly the role of T1's `delta <= 1`
density-nonnegativity restriction. So the attainment content is standard and
independently recoverable, but no discovered primary states T1's exact
population-level attainment remark with its `delta in (0,1]` scoping.
`[tentative]` on "the tightness rider as packaged is unstated"; `[confident]`
that it is mathematically standard (it is a two-line equality-case check,
self-contained in `core-math.md`). (ii) The necessity witness (finite hidden
variance, `chi^2 = infinity`, infinite drift) sharpens "bound vacuous" to
"conclusion fails"; none of the discovered statements carry this rider.
Verdict language for the capstone: **T1 = HCR (eq. 29.1) rearranged, plus a
standard-but-assembled sharpness pair.**

### Why the selection framing adds no mathematical content (and where it does add)

T1's response-model structure (`U`, `nu`, `W_theta`, `K_theta = K_0`) enters
the *statement* only through producing a pair `mu_theta << mu_0`. Conversely,
any pair `mu_theta << mu_0` arises from a pure-selection model (take `U = S`,
`K_0 = id`, `W_theta = L`). So the class of instances is *identical* to the
two-measure class eq. (29.1) quantifies over: the selection hypothesis
neither strengthens nor weakens the inequality. `[confident]` (checked in the
adversarial pass, item 4). What the selection framing adds is the *reading*:
which real-world channel the pair `(mu_0, mu_theta)` represents and what a
bound on it licenses (rule out selection before claiming intervention). That
is a contribution of the response-modeling contract, not of the inequality.

## (b) The chi²-DRO home (corrected attribution) and the Bayesian third home

**Closest DRO statement `[verified-primary]` (inherited from Task 08 B4):**
Namkoong & Duchi 2017 (arXiv:1610.02581; NeurIPS 2017 / JMLR 20(68)),
**Theorem 1, eq. (10)**: for `Z in [M_0, M_1]`, `M = M_1 - M_0`, sample
variance `s_n^2`, `phi(t) = (1/2)(t-1)^2`, ambiguity set
`{P : D_phi(P || P_hat_n) <= rho/n}`:

```
sqrt(2 rho/n) s_n - 2M rho/n  <=  sup_P E_P[Z] - E_{P_hat_n}[Z]  <=  sqrt(2 rho/n) s_n.
```

**Normalization conversion (do this before equating constants):** with
`phi(t) = (1/2)(t-1)^2`, `D_phi(P||Q) = (1/2) chi^2(P||Q)` in the book's
convention (`chi^2 = E_Q[(L-1)^2]`). So the constraint `D_phi <= rho/n` is
`chi^2 <= 2 rho/n`, i.e. the book's `delta <= sqrt(2 rho/n)`. Their upper
bound is then exactly `delta_max * s_n` — **the same constant as T1**, with
the factor 2 an artifact of the `phi` normalization, exactly as the Task-08
record flags. `[confident]`

**Tightness in the DRO home:** the eq. (10) *lower* bound shows the envelope
is attained to `O(1/n)` in the empirical setting; the correction term
`-2M rho/n` is the price of density nonnegativity, mirroring T1's
`delta <= 1` witness restriction. `[confident]` for the statement as read by
Task 08; the population-exact attainment claim is T1's own self-contained
witness, not attributed.

**Corrected attribution (binding, from Task 08 B3):** Ben-Tal, den Hertog,
De Waegenaere, Melenberg, Rennen 2013 (*Management Science* 59(2)) contains
the **phi-divergence robust-counterpart framework** (conjugate-based RCP;
Table 2 lists the chi² conjugate) and does **NOT** contain any
"worst-case = mean + sqrt(r)·sd" proposition — Task 08 searched the full
extracted text. Cite Ben-Tal 2013 for the machinery only; cite
Namkoong–Duchi Thm 1 for the closed-form envelope. The Phase-0 discovery
file's B1 attribution is superseded on this point. `[confident]` (inherited
verified-primary correction).

**Adjacent-but-wrong ball (recorded to prevent mis-homing):**
Wasserstein-DRO (Esfahani–Kuhn 2018) regularizes by a Lipschitz/gradient
norm, not by sd — the book's `delta = sqrt(chi^2)` pins T1 to the chi² ball.
`[tentative]` (discovery-grade, Phase 0 B6).

**Third home, Bayesian robustness `[tentative]`:** Gustafson 1996 ("Local
sensitivity of posterior expectations," *Ann. Statist.* 24:174–195) and the
Berger et al. Bayesian-robustness survey line: sensitivity of a posterior
expectation `E[H | data]` to a chi²-type prior perturbation is bounded by the
posterior sd of `H` times the perturbation magnitude — the same
mean-shift <= sd × sqrt(divergence) template. Phase 0 (B5) confirmed this as
a real, citable home at discovery grade; **no primary was pulled**, so this
claim caps at `[tentative]` and no proposition number may be cited without a
pull. Also in the same family, sensitivity-analysis phrasing: Lam 2016/2019
robust sensitivity (Phase 0 B3 discovery item; discovery-grade,
`[tentative]`).

## (c) T2: matrix HCR + support function, and the auditable negative

### How close the discovered prior art gets

**Step 1 — the scalar value-weighted form is scalar HCR, full stop.** Apply
eq. (29.1) to the scalar random variable `X = v.H`: `Var_{mu_0}(v.H) =
v^T Sigma_H v`, so `|E_theta[v.H] - E_0[v.H]| <= delta sqrt(v^T Sigma_H v)`
— T2's first display, at `[verified-primary]` strength via the same record as
T1. No matrix form is even needed (and none of `Sigma_H`'s invertibility is
used). `[confident]`

**Step 2 — the matrix/ellipsoid form (Phase 0 A2, Task 08 B2).** Statement
(Wikipedia verbatim, `[verified-secondary]`): `chi^2(mu_theta' ; mu_theta) >=
(Delta mu)^T Cov_theta[g]^{-1} (Delta mu)`, i.e. the mean-shift vector lies
in the `Sigma`-ellipsoid of radius `sqrt(chi^2)`. Derivable in three lines
from the verified-primary scalar form when `Sigma_H` is invertible: for every
`v`, `(v.B_H)^2 <= delta^2 v^T Sigma_H v` (Step 1); take
`sup_{v != 0} (v.B_H)^2 / (v^T Sigma_H v)`; substituting `u = Sigma_H^{1/2} v`
gives the generalized Rayleigh quotient with value `B_H^T Sigma_H^{-1} B_H`,
hence `B_H^T Sigma_H^{-1} B_H <= delta^2`. So the *statement* is
`[confident]` as mathematics (derivation above is checkable); the *canonical
numbered citation* remains `[verified-secondary]`-capped — per Task 08, pull
Lehmann–Casella *TPE* §2.7 or the full Polyanskiy–Wu notes before citing a
numbered matrix-HCR primary.

**Step 3 — the support-function formula (Phase 0 C2).** The support function
of the ellipsoid `{b : b^T Sigma^{-1} b <= 1}` is `sqrt(v^T Sigma v)`
(standard convex analysis; Boyd–Vandenberghe §3.3-grade, `[verified-secondary]`
as a citation, standard as math). Evaluating the matrix-HCR ellipsoid's
support function in direction `v` gives `delta sqrt(v^T Sigma_H v)` — T2's
feasible-set reading, exactly as the Phase 0 CROSS-REFERENCE table records
("skeleton CONFIRMED").

**Step 4 — the residual: the declared-value-norm operator wrapper.** T2's
norm form is Step 1 plus one line of norm duality:
`||B_H||_V = sup_{||v||_{V,*} <= 1} v.B_H <= delta sup_{||v||_{V,*} <= 1}
sqrt(v^T Sigma_H v)` (finite-dimensional bidual). Two honest observations cut
opposite ways:

- *In the book's favor (micro):* the support-function/norm packaging holds for
  **singular** `Sigma_H`, where the ellipsoid-inverse form of matrix HCR is
  not literally defined; and the sup-over-dual-ball form makes the "declare
  your value metric first" contract requirement part of the statement rather
  than a remark.
- *Against any strong novelty reading:* every ingredient is classical and the
  assembly is one line; this is precisely a T5(D)-type "reading nobody wrote
  down," not mathematics.

### The auditable negative

**Claim `[tentative]`:** no source discovered by Phase 0 states the
mean-drift bound *packaged over the dual unit ball of a declared value norm*
— i.e. a statement of the form "for a declared norm `||.||_V` on hidden
drifts, `||E_P[H] - E_Q[H]||_V <= sqrt(chi^2(P||Q)) * sup_{||v||_{V,*} <= 1}
sd_Q(v.H)`" — as a named result.

What was searched (by Phase 0, not re-run here): estimation theory (Area A:
HCR scalar, matrix, Cramér–Rao, the HCR-descended chi²/KL/Hellinger
mean-variance inequality family A4), chi²- and phi-divergence DRO (Area B:
Ben-Tal 2013, Namkoong–Duchi, Duchi–Glynn–Namkoong, Lam 2016/2019, tight
f-divergence variance bounds arXiv:2009.09264, Wasserstein contrast case,
Gustafson/Berger Bayesian robustness), and convex-analysis support-function
sources (C2); plus the earlier Goodhart-adjacent pass recorded in
`formal_analogue_lit_map.md` (El-Mhamdi, Majka–El-Mhamdi, Skalse, Dwork,
Lucas, Laidlaw near-miss). Phase 0 declared Areas A and B **saturated** for
discovery.

Nearest statements found, and what each lacks:

| Nearest statement | Where | What it lacks vs T2's norm form |
| --- | --- | --- |
| Matrix HCR ellipsoid `(Delta mu)^T Sigma^{-1} (Delta mu) <= chi^2` | A2/B2 (`[verified-secondary]`) | The full feasible set, but stated as an ellipsoid constraint; no value norm, no dual-ball sup; needs `Sigma` invertible |
| Ellipsoid support function `sqrt(v^T Sigma v)` | C2 (standard) | The formula, but as a convex-analysis identity, not applied to mean-drift under a divergence budget |
| Worst-case linear readout over chi²-ball | B1/B4 (`[verified-primary]` for scalar) | Per-direction (fixed `v`) only; no declared-norm packaging over the dual ball |
| Markowitz `sqrt(w^T Sigma w)` mean–sd frontier | D2 (recognition anchor) | Same quadratic-form geometry; entirely different object (portfolio risk, no divergence budget) |

Limits of the negative (stated so it is auditable, not absolute): (i) Phase 0
was WebSearch/WebFetch-grade discovery — saturated at the *area* level, not
an exhaustive per-paper sweep; (ii) the wrapper is a one-line corollary of
classical parts, so a buried statement in a DRO or minimax-estimation text
(e.g. a general dual-norm robust-counterpart lemma specialized to chi²)
would not be surprising and would erase even this residual; (iii) the negative
therefore licenses "state it as a packaging/reading, present it as an
immediate corollary of HCR + norm duality" — it does **not** license "novel
result." Benchmark that would erase the residual: an explicit dual-norm-ball
drift bound in Lehmann–Casella §2.7, the full Polyanskiy–Wu notes, or a
phi-divergence DRO survey's vector-mean section. Check those before any
stronger claim.

## Closest prior art (consolidated)

| Book item | Closest prior art | Status of match | Verification status |
| --- | --- | --- | --- |
| T1 inequality | HCR chi² variational inequality: Polyanskiy–Wu §29.1, **eq. (29.1)** (Thm 29.1/eq. 29.3 = estimation packaging) | verbatim after rearrangement | `[verified-primary]` (Task 08 B1) |
| T1 envelope, DRO form | **Namkoong–Duchi 2017, Thm 1, eq. (10)**, constant `sqrt(2 rho/n)` = `delta` after phi-normalization conversion | same envelope + empirical attainment | `[verified-primary]` (Task 08 B4) |
| T1 envelope, DRO machinery | Ben-Tal et al. 2013 conjugate-based phi-divergence RCP (Table 2 chi²) — **NOT the closed form** | framework only | `[verified-primary]` for the correction (Task 08 B3) |
| T1, third home | Gustafson 1996 posterior-sensitivity (Bayesian robustness); Lam 2016/2019 robust sensitivity | same template | `[tentative]` discovery-grade (Phase 0 B5/B3) |
| T1 tightness rider | Cauchy–Schwarz equality case = chi²-DRO attainer; empirical analogue = ND Thm 1 lower bound | standard, assembled | witness self-contained in `core-math.md` |
| T2 scalar form | Scalar HCR applied to `v.H` | verbatim | `[verified-primary]` (same as T1) |
| T2 feasible set | Matrix HCR ellipsoid | exact skeleton | `[verified-secondary]`; derivable from scalar (shown above) |
| T2 support-function step | Ellipsoid support function `sqrt(v^T Sigma v)` (Boyd–Vandenberghe §3.3-grade) | standard identity | standard textbook |
| T2 declared-value-norm wrapper | — none found — | apparently unstated (one-line corollary) | auditable negative above, `[tentative]` |

## What survives as the book's contribution

Mirroring the T5 verdict's discipline (and the `plans/litrev-handoff.md`
guardrail against overcorrecting into "it's all trivial"):

- **The selection-channel reading** `[tentative]`: delta as a *declared
  selection-intensity budget* inside the response-modeling contract — used to
  exclude or bound the selection channel before an intervention claim is
  entertained, valid with dependent `H`, no proxy–target decomposition, no
  independence assumption. The math is HCR; the *role* (a channel-exclusion
  test in a Goodhart claim contract) is not stated in any discovered home.
  This survives, but as framing, and should be stated as such.
- **The declared-value-metric operator packaging** `[tentative]`: the
  dual-ball norm form, including its validity for singular `Sigma_H` and its
  fusing of "declare the value metric" into the statement. One-line corollary
  of classical parts; credit as a reading, exactly like T5(D).
- **The assembled sharpness pair** `[tentative]`: attainment witness +
  explicit necessity-of-L² witness (conclusion fails, not merely bound
  vacuous) presented together with the inequality. Standard content,
  pedagogically assembled; not a novelty claim.
- **The El-Mhamdi/Majka comparison is unaffected** (envelope vs sharp
  asymptotics) and now sits next to the correct classical anchor, as the plan
  anticipated.

Not surviving: any claim that the inequality, the constant, the two-point
witness, the ellipsoid, or the chi²-ball worst-case is new. The capstone
should state plainly that T1/T2's envelope **is** Chapman–Robbins / the
chi²-DRO worst case, cite Polyanskiy–Wu eq. (29.1) and Namkoong–Duchi Thm 1,
and scope the contribution to the readings above.

## Adversarial pass (required: [confident] claims above)

Target: the identification "T1 = HCR (eq. 29.1) rearranged" and the T2
skeleton claim. Skeptical-referee attempts to break it:

1. **chi² direction / argument order.** chi² is asymmetric; if the book and
   the source used opposite conventions the constants would differ. Checked:
   the book's `delta^2 = E_{mu_0}[(dmu_theta/dmu_0 - 1)^2]` is
   `chi^2(mu_theta || mu_0)` with the reference measure second; eq. (29.1)'s
   `chi^2(P||Q)` puts the variance under `Q`, the reference. Both put the
   perturbed measure first. **Does not break.**
2. **Population two-measure statement vs parametric-family estimator bound.**
   The named "Chapman–Robbins bound" is an estimator-risk statement with a
   sup over `theta'` (eq. 29.3). T1 has no estimator, no family, no sup. But
   the verified record shows eq. (29.1) is stated as a two-measure inequality
   for arbitrary square-integrable `X` — exactly T1's shape — and Thm 29.1 is
   its one-step corollary. The identification holds at the inequality
   altitude; the writeup states the altitude explicitly (verdict item 1).
   **Does not break; forced an altitude clarification, adopted.**
3. **Estimator `T` vs arbitrary bounded/`L²` `H`.** Same resolution as 2:
   eq. (29.1) requires no estimator structure, only `Var_Q(X) < infinity`.
   **Does not break.**
4. **Selection reweighting vs two distributions.** Could T1's
   selection-model hypotheses (`W_theta`, `K_theta = K_0`) make it a
   genuinely different (narrower or stronger) statement? Narrower: no — the
   inequality never uses the type structure, only `mu_theta << mu_0`.
   Stronger: no — every `mu_theta << mu_0` pair is realized by a
   pure-selection model (`U = S`, `K_0 = id`, `W_theta = L`), so the instance
   classes coincide. **Does not break; upgraded into the writeup as the
   "selection framing adds no mathematical content" paragraph.**
5. **Tightness/necessity riders.** The one place "verbatim" fails: the
   verified primary excerpt states the inequality, not T1's attainment remark
   (`delta in (0,1]` two-point witness) or the necessity-of-`L²` witness.
   **Partially fires** — resolved by weakening the verdict language from
   "T1 = HCR verbatim" to "T1's inequality = HCR verbatim; sharpness pair
   standard-but-assembled," carried as a mismatch row in the
   hypothesis-by-hypothesis table, not a footnote.
6. **Vacuity check.** Is the identification itself contentless (any
   Cauchy–Schwarz bound "is" HCR)? No: the match is exact in objects
   (chi² of the same pair, sd under the same baseline, same constant 1, same
   equality case), not a family resemblance; and the DRO home independently
   reproduces the same constant after normalization conversion. **Does not
   break.**
7. **Red-flag scan.** "Suspiciously elementary": fires by construction — the
   *finding is* that the theorem is classical; this is the established
   project posture (`paper1-is-elementary-synthesis`), not a new unresolved
   flag. "Rhetorically convenient": the convenient outcome for the narrative
   was already priced in by the plan (which predicted this verdict); the
   guardrail risk is *overcorrection*, addressed by the auditable negative
   and the surviving-contribution section. No unresolved flag to log.

**Outcome: adversarial pass clear**, with two adopted repairs (altitude
clarification in item 2; verdict-language weakening in item 5).

## Caveats and caps

- Anything resting on the matrix-HCR Wikipedia record is capped
  `[verified-secondary]`: do not cite a numbered matrix-HCR primary until
  Lehmann–Casella §2.7 or the full Polyanskiy–Wu notes are pulled (Task 08
  flag inherited). The three-line derivation from the scalar form is offered
  as the checkable route in the meantime.
- The Bayesian-robustness (Gustafson) and Lam sensitivity homes are
  discovery-grade `[tentative]`: no primary pulled; no proposition numbers.
- The auditable negative for the T2 wrapper is bounded by Phase 0's
  discovery grade; the benchmark texts that would erase it are named above.
- Namkoong–Duchi is an *empirical-reference* statement (`P_hat_n`, radius
  `rho/n`, `o(1/n)` correction); the population-exact form the book states is
  the HCR side. When the capstone cites ND for tightness, say
  "attained to `O(1/n)` in the empirical setting," not "exactly attained."
- Per the plan, this review changes no theorem statements and no book prose;
  integration belongs to `plans/novelty-refactor.md`.

## Consequences (feeds the capstone)

1. `research/reviews/formal_analogue_lit_map.md` Non-map pass corrected in
   place (dated note, 2026-07-11) — done in this iteration.
2. Capstone reframe for T1/T2 prose: state the envelope as
   Chapman–Robbins / chi²-DRO worst case (cite Polyanskiy–Wu §29.1 eq. (29.1);
   Namkoong–Duchi Thm 1 eq. (10) with the normalization conversion; Ben-Tal
   2013 for machinery only); scope contribution to the selection-channel
   reading + declared-value-metric packaging.
3. Keep the El-Mhamdi/Majka sharp-vs-envelope comparison unchanged.

## File index / evidence pointers

- Discovery: `../cross-field-discovery/prior-art-formal.md` (Areas A1–A4,
  B1–B6, C2; CROSS-REFERENCE table).
- Primary verification: `../cross-field-discovery/prior-art-verification.md`
  (B1 HCR eq. 29.1 `[verified-primary]`; B2 matrix HCR
  `[verified-secondary]`; B3 Ben-Tal correction `[verified-primary]`;
  B4 Namkoong–Duchi Thm 1 `[verified-primary]`).
- Claim under review: `research/core-math.md` T1/T2 (untouched).
- Plan: `plans/litrev-selection-bounds.md`; guardrails:
  `plans/litrev-handoff.md`.
- Corrected false negative: `research/reviews/formal_analogue_lit_map.md`
  (Non-map pass).
