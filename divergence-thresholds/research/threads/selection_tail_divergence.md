# Thread: selection-channel tail divergence

Iteration: 1 (divergence-thresholds track)

Status: opening note, conjecture-stage. No theorem promoted; no book/paper
prose. States the divergence-threshold hypothesis for the selection channel,
its missing primitive, cheapest verification layer, and failure condition, in
the parent project's idiom.

Parent primitives: reused from `../../../research/core-math.md` (`S`, `G`, `P`,
`phi`, `epsilon`, `U`, `nu`, `K_theta`, `W_theta`, `mu_theta`, selection
intensity `delta = ||d mu_theta / d mu_0 - 1||_2`). Not re-derived here.

## Motivating gap

The parent's thresholds — T3 (gaming worthwhile iff `t - Q <= sqrt(2 kappa V)`),
T4 (feasible iff `m(d) <= V`), T6 (feasible iff `S_t(M) >= d^2/(2V)`) — are
*activation* thresholds: they say whether proxy gaming switches on. None says
anything about *severity past activation* — whether true value degrades
gracefully (bounded drift) or collapses below baseline (catastrophic
divergence).

Hypothesis for this track: there is a critical condition separating bounded
degradation from catastrophic divergence, and the discriminating primitive is
the **tail index of the hidden value/harm relative to the optimization
channel**, not the magnitude of optimization pressure.

## The seed already exists in the parent

- **T2 non-license** literally says "the bound can be uninformative when `chi^2`
  is large or infinite." The selection bound
  `|E_theta[V_H] - E_0[V_H]| <= delta sqrt(v^T Sigma_H v)` is finite-and-linear
  only when the hidden value direction has finite second moment under `mu_0`.
  Heavy tails blow up `sqrt(v^T Sigma_H v)`; the bound goes vacuous; degradation
  can be unbounded. That vacuity boundary is an unstated divergence threshold.
- **negative_results Iter 2/3**: with `P = Z ~ N(0,1)`, covariance summaries
  fail because the drift lives in the *tail response curve* / tilted path, not
  in `Cov(H, P)` (`E[H | P >= t] = t lambda(t)`; Boltzmann tilt gives
  `E_beta[H] - E[H] = beta^2` for `H = Z^2 - 1`). The parent already located the
  mechanism (tails); it never turned it into a threshold.

## Declared objects (this track)

- **Tilt family.** Log-likelihood ratio `L_theta = d mu_theta / d mu_0`;
  one-parameter exponential/Boltzmann tilt `L_beta proportional to exp(beta P)`,
  as in parent Iter 3.
- **Hidden value.** `V_H = v . (H - E_0 H)` with a *declared* tail class
  (e.g. tail exponent `alpha`, or MGF radius around 0). Per parent O7, `v` is
  declared, not learned from `mu_theta`.
- **Optimization pressure.** The tilt strength `beta` (selection channel) — the
  analogue of the KL budget in RL overoptimization (Gao et al. 2023).

## Conjecture C1 (tail-divergence boundary, selection channel)

Under the exponential tilt family, the hidden-value drift
`E_beta[V_H] - E_0[V_H]` is:

- **bounded uniformly in `beta`** (graceful degradation) iff `V_H` is
  lighter-tailed than the tilt's log-likelihood ratio — e.g. `V_H` has a finite
  MGF in a neighborhood matching the tilt direction;
- **unbounded / divergent** (catastrophic; true value driven below baseline as
  `beta` grows) iff `V_H` is equal-or-heavier-tailed than the tilt.

Informal reading: maximizing the proxy asymptotically concentrates weight in the
tail; whoever owns the heavier tail (value vs. error) wins the limit. This is the
selection-channel instance of the Catastrophic Goodhart tail-index comparison
(Kwa/Thomas 2023).

## Cheapest verification layer

Layer-3 toy, nearly free using parent toys. Sweep `beta` against the tail
exponent of `V_H`:

- `H = Z` (Gaussian, light tail) vs `H = Z^2 - 1` (heavier) vs a Pareto /
  Student-t `H` (genuinely heavy), with `P = Z` and tilt `exp(beta Z)`.
- Check whether `E_beta[V_H]` saturates or diverges as `beta` grows, and locate
  the exponent at which the behavior flips.

The parent's `H = Z` vs `H = Z^2 - 1` toys already straddle the likely boundary,
so the first probe is a few lines.

## Failure condition

- **No clean exponent boundary.** The flip between bounded and divergent depends
  on the tilt parameterization or the value-coordinate representation rather
  than on an intrinsic tail comparison. (Mirrors the parent's coordinate-freeness
  failures — `negative_results.md`, "coordinate-freeness overclaimed" and
  Iter 15: the result must be representation-aware *after* a declared value
  metric, not representation-free.)
- **Reduces to the existing caveat.** The boundary collapses to "finite vs
  infinite second moment" with no role for the tilt's own tail — in which case
  it is just T2's `chi^2` caveat restated, not a new threshold.

## Relationship to parent open questions

- **O8** (Zhuang & Hadfield-Menell below-baseline overoptimization) is the
  *intervention-channel* sibling of this *selection-channel* conjecture. If C1
  holds, O8's below-baseline result and C1 are two channel-specific instances of
  one tail/divergence principle. Settle the O8 embedding template first before
  claiming the unification (see track question Q-D2).
- **O7** (value-weighted susceptibility): C1 inherits the same non-license — the
  value functional `v` / value norm must be declared, not learned from
  `mu_theta`.

## Citations (anchors; verify per parent lit discipline before promotion)

- El-Mhamdi & Hoang 2024 (arXiv:2410.09638) — `load-bearing` in
  `../../../research/threads/lit_review/README.md`, "scalar bounds with
  tail-distribution dependence." Primary anchor for the tail-index mechanism.
- "Catastrophic Goodhart" (Kwa, D. Thomas, et al. 2023) — most direct statement
  of the tail-index comparison. Verify exact authorship/venue before citing.
- Gao, Schulman, Hilton 2023, "Scaling Laws for Reward Model Overoptimization" —
  empirical KL-budget overoptimization curves; KL is the RL analogue of `beta`.
- Zhuang & Hadfield-Menell 2020 — intervention-channel below-baseline result;
  parent O8.
- Manheim & Garrabrant 2018 — regime taxonomy; parent maps the four variants
  onto selection/intervention.

## Non-license

- Not a universal "optimization pressure is too much" scalar law. The threshold
  is conditional on a declared tilt family, a declared value functional, and a
  declared tail class. Stated unconditionally it would contradict the parent's
  central caution (no universal Goodhart effect size).
- Not a dimensional claim. "Precision of the goal" here means target sharpness /
  tail structure, not `dim(ker phi)`; the dimensional reading is dead
  (`../../../research/negative_results.md`, Iter 1, 5).
- Selection-channel only until the intervention analogue (O8 embedding) is worked
  out. No transfer to intervention or welfare without the parent's response and
  value contracts.
