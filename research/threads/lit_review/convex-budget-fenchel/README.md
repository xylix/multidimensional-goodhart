# Convex-budget (T4) prior-art review — synthesis

Status: closed, 2026-07-11. Per-theorem novelty verdict for T4 (convex
score-deficit budget), Track A, per `plans/litrev-convex-budget.md`. This was
the low-effort confirm of the three reviews: the prior art was already
half-acknowledged internally (`research/threads/convex_intervention_bound.md`
names "Lagrange/Fenchel duality" in its own derivation).

Provenance: this review **consumes** the completed shared Phase 0 discovery
(`research/threads/lit_review/cross-field-discovery/prior-art-formal.md`,
items C1, C2, D1; CROSS-REFERENCE table row "T4 convex budget") and the
Task 08 primary-source verification records
(`.../cross-field-discovery/prior-art-verification.md`, item B5). No new
deep-research passes were run (the plan's original protocol is superseded by
the consume-Phase-0 header). Verification tags (`[verified-primary]`,
`[verified-secondary]`, `[paywalled-flag-for-user]`) are **inherited** from
Task 08; nothing was re-verified here and no proposition/theorem number is
cited beyond what Task 08 read — in particular **Rockafellar 1970 is cited by
section only** (B5 cap; see Caveats).

## The claim under review

From `research/core-math.md` (T4, book §5.2):

- Hypotheses: finite-dimensional action space; closed proper convex cost
  `c: R^n -> (-infty, +infty]` with feasibility absorbed into `c`; linear
  proxy gain `w . a`; score deficit `d`; standard convex-duality regularity.
- Statement: define `m(d) = inf_a { c(a) : w . a >= d }`. Under the
  regularity condition, `m(d) = sup_{lambda >= 0} [lambda d - c^*(lambda w)]`,
  where `c^*` is the convex conjugate. Gaming under stakes `V` is feasible
  exactly when `m(d) <= V` in this declared private-cost model.

## Verdict (TL;DR)

1. **T4's identity is textbook convex duality — the Lagrangian dual /
   perturbation (value-function) conjugacy of a linearly-constrained convex
   program — specialized to a single linear proxy constraint.** `[confident]`
   as mathematics: the identification is displayed below by two independent
   two-line routes (Lagrangian; biconjugate of the value function), both
   self-contained and checkable, and the adversarial pass (end of file) was
   run and cleared. As *attribution*, the statement is `[verified-secondary]`
   (Task 08 B5): the canonical home is Rockafellar, *Convex Analysis* (1970),
   **Fenchel duality §31 and perturbation/value-function conjugacy §28–30, by
   section only** — no theorem number is asserted until the book is pulled
   (upgrade path in Caveats).
2. **The quadratic corollary (`m(d) = d^2/(2S)`, `S = w^T diag(kappa) w`) is
   elementary**: the conjugate of a positive-definite quadratic
   (`f = (1/2) a^T Q a  =>  f^* = (1/2) y^T Q^{-1} y`; Rockafellar §12 /
   Boyd–Vandenberghe §3.3-grade, `[verified-secondary]` as a citation,
   standard as math — two-line check below). It is the same least-cost
   allocation quantity that recurs in T5/T6; the equimarginal/least-cost-
   abatement recognition anchor (Montgomery 1972, Phase 0 D1) is **Task 02's
   lane** — cross-referenced, not claimed here. `[confident]` on the algebra.
3. **No Goodhart or strategic-classification source in the repo's evidence
   base states the affordability budget in T4's conjugate-dual form.**
   Auditable negative below (protocol step 2), from existing evidence only.
   Nearest: Hardt et al. 2016 (strategic classification) contains the
   *feasibility idea* in substance — an agent games exactly when the cost of
   crossing the decision boundary is at most the benefit — but at
   discovery/tentative grade and with no value-function conjugacy; the
   citation audit coded it (F1) with zero citations into any prior-art
   family. `[tentative]`
4. **What survives as ours:** the gaming-affordability *reading* (`m(d) <= V`
   as the intervention-channel activation test inside the response-modeling
   contract) and the *placement* (the intervention budget is not a
   `mu_0`-functional — it is imported from declared action-cost geometry, in
   explicit contrast to T1/T2's baseline-divergence selection bound). Both
   are framing over textbook math, the same shape as the T5 and T1/T2
   verdicts, and are further scoped by the Hardt near-antecedent (the
   cost-vs-stakes comparison itself is not new). `[tentative]`
5. **Fact-vs-Theorem recommendation (for the capstone): YES, reframe.**
   Present T4 as a boxed **"Fact (standard convex analysis)"** or unboxed
   observation, cite Rockafellar by section, and keep the feasibility
   criterion and the reading in surrounding prose. Details below.
   `[tentative]` — the decision itself belongs to `plans/novelty-refactor.md`.

## (a) The identification: T4 is the Lagrangian / value-function dual

Two independent routes, each self-contained (this is the checkable substitute
for the unpinned Rockafellar theorem number).

**Route 1 — Lagrangian dual.** For `lambda >= 0`,

```
L(a, lambda) = c(a) + lambda (d - w . a)
g(lambda)    = inf_a L(a, lambda)
             = lambda d - sup_a [ lambda w . a - c(a) ]
             = lambda d - c^*(lambda w).
```

Weak duality (`m(d) >= sup_{lambda >= 0} g(lambda)`) always; equality under a
Slater-type condition (a feasible point with `w . a > d`, `c(a) < infty` —
exactly what the internal thread and T4's "standard convex-duality
regularity" hypothesis name). The dual objective is verbatim T4's
`lambda d - c^*(lambda w)`.

**Route 2 — value-function (perturbation) conjugacy.** `m` is the
perturbation function of the program, `m(d) = inf { c(a) : w . a >= d }`;
it is convex (line segment between feasible points) and nondecreasing in `d`.
Its conjugate:

```
m^*(lambda) = sup_d [ lambda d - m(d) ]
            = sup_d sup_{a : w.a >= d} [ lambda d - c(a) ]
            = sup_a [ lambda (w . a) - c(a) ]     (lambda >= 0: inner sup picks d = w.a)
            = c^*(lambda w),                       for lambda >= 0;
m^*(lambda) = +infty                               for lambda < 0
              (fix any a0 with c(a0) < infty; lambda d - m(d) >= lambda d - c(a0)
               for d <= w.a0, which diverges as d -> -infty).
```

Hence `m^{**}(d) = sup_{lambda >= 0} [lambda d - c^*(lambda w)]` — **T4's
right-hand side is literally the biconjugate of the value function**, and the
regularity condition is what licenses `m = m^{**}` (Fenchel–Moreau /
closedness of `m` at the relevant `d`, equivalently strong duality). This is
exactly the "perturbation/value-function conjugacy" of Rockafellar §28–30, as
Phase 0 C1 records.

### Hypothesis-by-hypothesis check against T4's actual statement

| T4 hypothesis / clause | Classical counterpart | Match? |
| --- | --- | --- |
| Finite-dimensional action space | Rockafellar 1970 is a finite-dimensional (`R^n`) text throughout | Match |
| Closed proper convex `c`, feasibility absorbed into `c` | Precisely the setting in which `c^*` is well-behaved and biconjugacy holds; extended-real-valued costs with `+infty` for infeasibility is the standard device | Match |
| Linear proxy gain `w . a`, constraint `w . a >= d` | Single linear inequality constraint = linearly-perturbed convex program; perturbation parameter `d` | Match |
| "Standard convex-duality regularity" | Slater-type condition (strictly feasible point) for strong duality / `m = m^{**}`; the internal thread states it concretely ("a feasible point with `w . a > d`") | Match; T4 leaves the condition named-but-unspecified — the capstone should either name Slater or point at the thread's concrete form |
| Dual form `sup_{lambda >= 0} [lambda d - c^*(lambda w)]` | Lagrangian dual = perturbation conjugate (both routes above) | Verbatim |
| Feasibility criterion `m(d) <= V` | **Not a classical theorem — and not a theorem at all**: given the declared private-cost model ("agent acts iff affordable at stakes `V`"), it is the definition of feasibility. In substance the cost-vs-benefit crossing test appears in strategic classification (Hardt et al. 2016 best response) and in the Spence-threshold home of T3 (Phase 0 H1/H2) | Definitional; reading is the book's, idea has near-antecedents |
| No attainment claims (primal or dual) | T4 asserts only the value equality — no overclaim to attainment | Match (nothing to check) |

## (b) The quadratic corollary

`c(a) = sum_j a_j^2/(2 kappa_j) = (1/2) a^T Q a` with `Q = diag(1/kappa_j)`:

```
c^*(y) = (1/2) y^T Q^{-1} y = (1/2) sum_j kappa_j y_j^2
c^*(lambda w) = lambda^2 S / 2,   S = sum_j kappa_j w_j^2 = w^T diag(kappa) w
m(d) = sup_{lambda >= 0} [lambda d - lambda^2 S / 2] = d^2/(2S)   (d >= 0).
```

Two-line check of the conjugate: `sup_y [y . a - (1/2) y^T Q y]` is attained
at `y = Q^{-1} a`... (symmetrically for `c^*`); standard (Rockafellar §12 /
Boyd–Vandenberghe §3.3-grade, `[verified-secondary]` as citation). The
single-channel case recovers T3's wedge `d <= sqrt(2 kappa V)`; the
multichannel case is the `S`-denominator shared with T5/T6. Structurally this
is least-cost allocation / the equimarginal principle (Montgomery 1972,
Phase 0 D1) — **recognition anchor only; the abatement-market reading belongs
to Task 02, no double-claim.**

## (c) Protocol step 2: the Goodhart / strategic-classification side

**Question (from the plan):** does any Goodhart or strategic-classification
source already state the affordability-budget form, so the paper credits the
right antecedent? **Answered from existing repo evidence only** (per the
consume-Phase-0 constraint); no new searches were run.

**Auditable negative `[tentative]`:** no source in the repo's evidence base
states T4's form — the minimum-cost-to-close-a-score-deficit value function
with its conjugate dual `sup_{lambda >= 0} [lambda d - c^*(lambda w)]` and a
feasibility criterion against declared stakes.

What the evidence base covers:

- **Phase 0 AI near-miss lane (Area J):** Laidlaw et al. (chi²/occupancy
  regularization) and "Catastrophic Goodhart" (KL) — divergence-ball objects,
  T1/T2's neighborhood, no cost-budget duality.
- **Phase 0 signaling/strategic-classification lane (Area H):** Hardt,
  Megiddo, Papadimitriou, Wootters 2016 (ITCS) recorded as the nearest AI/CS
  analogue — costly threshold-crossing best response under declared cost
  classes. That is the *feasibility idea* (game iff cost-to-cross <= benefit)
  in substance, and the home of T3's wedge; nothing recorded there states a
  value-function conjugate dual.
- **Citation audit (Track B, closed 2026-07-11):** Hardt et al. 2016 is in
  the coded corpus (`corpus.md` F1) and was coded with **zero citations into
  any prior-art family**; the ESTIM tier finding is that Rockafellar-grade
  material appears in the 115-paper corpus **only as DRO tooling** (SUMMARY
  ESTIM row: "cited as prior theory of a Goodhart bound: 0/115"). So the AI
  corpus neither states nor cites the convex-duality budget as Goodhart
  theory.
- **`research/reviews/formal_analogue_lit_map.md`:** the Hardt row
  (`[tentative]`, carried from Codex) describes classifier-then-costly-
  feature-change with cost-class-dependent guarantees; no budget-duality
  statement recorded.

Limits of the negative (the cap): (i) it is an argument from recorded
evidence — Hardt et al. 2016's own lemmas were never read at primary level in
this evidence base, and Phase 0 ran no dedicated sweep of the strategic-
classification literature for the dual form (its Area H saturation was aimed
at T3/L3); (ii) the dual form is a one-step specialization of textbook
duality, so a buried statement in the strategic-classification or
performative-prediction literature would not be surprising and would erase
even this residual. Benchmark reads that would settle it: Hardt et al. 2016's
best-response/cost section, Milli et al. 2019 (social cost of strategic
classification), Perdomo et al. 2020 (performative prediction). **Until one
of those is read, the licensed claim is "no antecedent found in the audited
corpus and discovery record," not "no antecedent exists."**

## Closest prior art (consolidated)

| Book item | Closest prior art | Status of match | Verification status |
| --- | --- | --- | --- |
| T4 dual identity `m(d) = sup_{lambda>=0}[lambda d - c^*(lambda w)]` | Lagrangian dual / perturbation-value-function conjugacy: **Rockafellar 1970, Fenchel duality §31, perturbation conjugacy §28–30 (by section)** | verbatim specialization (two self-contained derivations above) | `[verified-secondary]` statement; primary `[paywalled-flag-for-user]` (Task 08 B5) |
| T4 regularity condition | Slater-type strict feasibility for strong duality | match; T4 names it generically | same B5 cap |
| T4 quadratic corollary `d^2/(2S)` | Quadratic conjugate `f^* = (1/2) y^T Q^{-1} y` (Rockafellar §12; Boyd–Vandenberghe §3.3-grade) | elementary, verbatim | `[verified-secondary]` as citation; standard as math (Phase 0 C2) |
| T4 quadratic, structural twin | Least-cost allocation / equimarginal (Montgomery 1972) | recognition anchor | Phase 0 D1, discovery-grade; **Task 02's claim** |
| Feasibility criterion `m(d) <= V`, in substance | Costly threshold-crossing best response (Hardt et al. 2016; Spence-threshold home H1) | idea present, form absent | `[tentative]` discovery-grade (Phase 0 H1/H2; lit-map row carried from Codex) |
| T4 conjugate-dual budget form in Goodhart/strategic-classification lane | — none found — | apparently unstated | auditable negative above, `[tentative]`, capped |

## What survives as the book's contribution

Mirroring the T5 and T1/T2 verdicts' discipline (and the
`plans/litrev-handoff.md` guardrail against overcorrecting into "it's all
trivial"):

- **The gaming-affordability reading** `[tentative]`: `m(d) <= V` as the
  *intervention-channel activation test* inside the response-modeling
  contract — a claim must declare action space, cost geometry, stakes, and
  proxy direction before importing the budget. The math is textbook; the
  *role* (a declared-model feasibility gate in a Goodhart claim contract) is
  the book's. Scoped by the Hardt near-antecedent: the cost-vs-stakes
  comparison is not itself new; the general-convex-cost packaging plus the
  contract role is what is credited.
- **The channel placement** `[tentative]`: the structural point that the
  intervention budget is **not** a `mu_0`-functional — selection bounds
  (T1/T2) are baseline-distribution statements, while `m(d)` is imported
  entirely from declared agent-side cost geometry. This selection/intervention
  contrast is the book's organizing move, not present in the convex-analysis
  home (which has no channels) nor in the strategic-classification home
  (which has no selection side).
- **The non-license clauses**: no welfare bound without a declared harm
  functional (the thread's `h = (M, 0)` counterexample), no nonconvex /
  fixed-charge claim, no ML/RLHF transfer without a declared local response
  model. Kept as stated.

Not surviving: any implication that the dual identity, the regularity
condition, the conjugate calculus, or the quadratic closed form is a result
of the book. T4 is the one core theorem whose *entire mathematical content*
is a named textbook theorem-class applied once — hence the reframe below.

## Fact-vs-Theorem recommendation (for the capstone)

Flagged to this review by the Phase 0 CROSS-REFERENCE table; recommendation
`[tentative]`, decision owned by `plans/novelty-refactor.md`:

1. **Demote T4 from boxed "Theorem" to a boxed "Fact" (or unboxed
   observation) labeled as standard convex analysis**, with the in-text
   sentence the plan asks for: the budget is the standard convex-duality
   value function (perturbation conjugacy) specialized to a linear proxy
   gain. Rationale: unlike T1/T2 (where the *assembly* — sharpness pair,
   norm packaging — carries some weight) and T5 (where the iff-reading is
   arguably unstated), T4's statement body contains no assembly beyond the
   specialization; a "Theorem" box inflates it under the
   elementary-synthesis framing.
2. **Cite Rockafellar 1970 by section** (Fenchel duality §31;
   perturbation/value-function conjugacy §28–30) — **no theorem number until
   the user's book pull lands** (upgrade path in Caveats). Boyd–Vandenberghe
   §5 (duality) / §3.3 (conjugates) may be added as an open-access
   section-level anchor, same cap.
3. **Keep the feasibility criterion `m(d) <= V` and the two readings in
   prose**, not in the Fact box — the criterion is definitional in the
   declared model, and boxing it as proved content is exactly the
   finishedness/novelty overclaim the refactor is removing.
4. **Preserve dependency labels**: T6 depends on "T4 quadratic
   specialization" and T3 is its single-channel case; give the Fact a stable
   label so those references survive the demotion. Presenting T5 as
   "T4-quadratic optimizer + a linear harm readout" (per the plan) remains
   available and is consistent with this reframe.

## Adversarial pass (required: [confident] claims above)

Target: "T4's identity is the Lagrangian / value-function dual, verbatim
specialization" and the quadratic-corollary algebra. Skeptical-referee
attempts to break them:

1. **Sign/direction conventions.** The constraint is `w . a >= d` (not
   `<=`); a mismatch would flip signs in the dual. Checked in Route 1: the
   multiplier enters as `lambda (d - w . a)` with `lambda >= 0`, giving
   `+lambda d` and `c^*(+lambda w)` — the book's exact form. A `<=`
   constraint would instead produce `c^*(-lambda w)`. **Does not break.**
2. **Equality vs weak duality.** The identity as stated is an equality;
   without regularity only `m(d) >= sup` (weak duality, equivalently
   `m >= m^{**}`) holds — e.g. value functions with a duality gap at
   boundary `d`. T4 explicitly hypothesizes the regularity condition, so the
   equality is correctly scoped. One repair adopted: the check-table row
   notes T4 names the condition generically ("standard convex-duality
   regularity") and the capstone should name Slater or the thread's concrete
   strict-feasibility form. **Does not break; forced a precision note,
   adopted.**
3. **Vacuity check.** Is "T4 = convex duality" contentless (any convex
   program has a dual)? No: the identification is exact in objects — the
   perturbation parameter is the score deficit `d`, the conjugate is
   evaluated on the ray `lambda w`, `m^*(lambda) = c^*(lambda w)` is an
   identity of functions (Route 2), not a family resemblance; two
   independent derivations produce the same form. **Does not break.**
4. **Degenerate-instance probe.** `w = 0`, `d > 0`: primal infeasible,
   `m(d) = +infty`; dual: `sup_{lambda >= 0} [lambda d - c^*(0)] = +infty`.
   Consistent (Slater fails, equality holds vacuously here). `d` below the
   unconstrained optimum's score: constraint slack, `lambda^* = 0`,
   `m(d) = -c^*(0) = inf c`. Both edges behave; no hidden hypothesis
   surfaced. **Does not break.**
5. **Does T4 prove more than the classical statement (any residual math)?**
   The only clauses not in the classical home are the feasibility criterion
   (definitional — see check table) and the gaming vocabulary (naming).
   **Partially fires in the intended direction**: it confirms the statement
   body has no residual mathematical content, which is the basis of the
   Fact reframe rather than a repair.
6. **Red-flag scan.** "Suspiciously elementary": fires by construction — the
   finding *is* that the theorem is textbook; established project posture
   (`paper1-is-elementary-synthesis`), not a new unresolved flag.
   "Conclusion rhetorically convenient": the plan predicted this verdict, so
   the risk runs toward *overcorrection*; addressed by the
   surviving-contribution section and by keeping the channel-placement
   credit explicit. No unresolved flag to log.

**Outcome: adversarial pass clear**, with one adopted precision note (item 2)
and one intended-direction confirmation (item 5).

## Caveats and caps

- **Rockafellar section-only cap (binding, Task 08 B5):** the primary is
  `[paywalled-flag-for-user]`; cite *Convex Analysis* by section (Fenchel
  duality §31; perturbation/value-function conjugacy §28–30) and assert no
  theorem number. **Upgrade path:** the user is pulling the book in
  parallel; once pulled, pin the Fenchel-duality theorem number (Task 08
  notes "commonly Thm 31.1 / Cor 31.2.1" as the expected location — recorded
  as expectation, not citation) and the §28–30 value-function statement, then
  upgrade the attribution row to `[verified-primary]`. Nothing in this
  verdict waits on the pull: the displayed derivations carry the
  mathematical claim in the meantime.
- The quadratic-conjugate citation (Rockafellar §12 / Boyd–Vandenberghe
  §3.3) is likewise section-level, `[verified-secondary]`; the algebra is
  self-contained above.
- The protocol-step-2 negative is capped as stated in §(c): corpus-and-
  discovery-record grade, with three named benchmark reads (Hardt 2016
  primary, Milli 2019, Perdomo 2020) that would sharpen or erase it. It
  licenses "no antecedent found," not "no antecedent exists."
- Montgomery/equimarginal is cross-referenced only; the econ reading is
  Task 02's (no double-claim rule from Phase 0 applied).
- Per the plan, this review changes no theorem statements and no book prose;
  integration (the Fact reframe, citations, T5-as-T4-corollary presentation)
  belongs to `plans/novelty-refactor.md`.

## Consequences (feeds the capstone)

1. Reframe T4 as Fact/Observation with the standard-convex-analysis sentence
   and the Rockafellar section-level citation (recommendation §above).
2. Keep the affordability reading and channel placement as the credited
   contribution, scoped by the Hardt near-antecedent.
3. No correction needed in `research/reviews/formal_analogue_lit_map.md`
   (unlike the T1/T2 review): its Hardt row is accurate, and T4 never had a
   false-negative "no analogue" entry — the internal thread always named
   Fenchel duality.
4. Pinned-number upgrade on the Rockafellar pull (see Caveats) — a
   bookkeeping edit to this README plus the capstone's citation, nothing
   verdict-level.

## File index / evidence pointers

- Discovery: `../cross-field-discovery/prior-art-formal.md` (C1, C2, D1;
  Area H for the Hardt lane; Area J for the AI near-misses; CROSS-REFERENCE
  table row "T4 convex budget").
- Primary verification: `../cross-field-discovery/prior-art-verification.md`
  (B5 Rockafellar `[paywalled-flag-for-user]`, statement
  `[verified-secondary]`, section-only citing guidance).
- Protocol step 2 evidence: `literature-reference-gap-paper/citation-audit/`
  (`corpus.md` F1 = Hardt et al. 2016; `coding-batches.md` cluster F batch 1;
  `SUMMARY.md` ESTIM row); `research/reviews/formal_analogue_lit_map.md`
  (Hardt row).
- Internal half-acknowledgment: `research/threads/convex_intervention_bound.md`
  §4 ("By Lagrange/Fenchel duality, under the usual regularity conditions…").
- Claim under review: `research/core-math.md` T4 (untouched).
- Plan: `plans/litrev-convex-budget.md`; guardrails: `plans/litrev-handoff.md`.
