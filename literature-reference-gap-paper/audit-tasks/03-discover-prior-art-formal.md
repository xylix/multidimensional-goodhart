# Task 03 — Discover prior art: formal-math / statistics side

**Objective.** Comprehensively discover the **formal-mathematical** prior art —
statistics, estimation theory, distributionally robust optimization, convex
analysis, operations research, control, index-number theory — the native homes of
the book's T1/T2 and T4. Outside ML.

**Depends on:** none (parallel with 01, 02). **Blocks:** 04, 08.

**Why it matters.** The citation gap likely extends past the congruity (T5)
slice: T1/T2 = Chapman–Robbins / χ²-DRO, T4 = Fenchel duality, and the audit
already found a near-miss (Laidlaw 2024 uses χ²/occupancy regularization while
citing no estimation prior art). The paper's "same math, uncited" claim is
stronger if the formal side is mapped too.

## Inputs
- `../citation-audit/audit.md` (ESTIM tier + caveats).
- Track A reviews — `../../plans/litrev-selection-bounds.md` (T1/T2),
  `../../plans/litrev-convex-budget.md` (T4), `../../plans/litrev-lower-tier.md`
  (L1–L4): this discovery and those reviews are **largely the same searches** —
  run them as shared infrastructure (see the README's "Relationship to Track A").
  Harvest their hypotheses; feed your findings back; do not double-run. The gap
  paper cites Track A for the math and claims only the *citation gap* per family.

## Protocol
Sweep each area to saturation (autonomous sweeps + multi-LLM where a result is
contested):
- **Estimation theory:** Hammersley–Chapman–Robbins, Cramér–Rao, Hájek–Le Cam,
  variance/sensitivity bounds as worst-case mean shift.
- **Distributionally robust optimization:** Ben-Tal 2013, Duchi–Namkoong, Lam
  robust sensitivity, φ-/χ²-divergence balls.
- **Convex analysis / duality:** Rockafellar, Fenchel conjugacy, support functions,
  perturbation/value-function duality.
- **Operations research / least-cost allocation:** equimarginal / abatement
  (Montgomery 1972, Baumol–Oates — note overlap with task 02), Markowitz twin.
- **Index-number theory / aggregation:** Diewert, Eichhorn–Voeller, Blackorby–
  Primont, consistency-in-aggregation.
- **Control / information theory** (only if a genuine proxy-gaming parallel surfaces).
- **Causal inference / identification (lower-tier L1 home):** observational
  equivalence, Heckman selection, Rubin potential outcomes, Pearl do-calculus,
  Manski partial identification, mixture-model non-identifiability.
- **Exponential families / large deviations (lower-tier L2 home):**
  natural-parameter tilting, cumulant generating functions, Gibbs–Boltzmann
  measures, importance sampling.
- **Security games / resource scheduling (lower-tier L4 home):** Stackelberg
  security games, moving-target defense, greedy monotone resource reduction.

For each: record the statement + preliminary mapping to T1/T2/T4 **and the
lower-tier theorems** (T3, T6, identification, tilt) — this discovery feeds Track
A's `litrev-lower-tier.md`.

## Output
**Shared discovery output** (neutral home, also consumed by Track A's
litrev-selection-bounds / -convex-budget / -lower-tier):
`../../research/threads/lit_review/cross-field-discovery/prior-art-formal.md` —
per-area list (result · statement · preliminary mapping · source) + saturation
note + a cross-reference to what Track A already established.

## Done criteria
- Formal areas swept to saturation; set recorded with mappings.
- Track A findings harvested, not duplicated; overlap noted.

## Guardrails
- **Discovery + mapping only** — verification is task 08.
- Keep the boundary with Track A explicit to avoid double-claiming.
