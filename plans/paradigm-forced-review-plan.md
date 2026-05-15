# Paradigm-forced review plan

Purpose: use the response-modeling paradigm to decide what review or
consolidation pass should happen next. This is not a new research iteration.
It is a planning gate: find what information the current project state can
force us to declare, and use those forced declarations to choose the next
review.

## Planning Rule

Do not choose the next review by topic interest alone. Choose the review that
forces the most decision-relevant missing primitives and has a concrete
consequence if those primitives are unavailable.

Every candidate review must answer:

- What claim would we be tempted to use?
- Which contract fields are missing, ambiguous, unavailable, or post-hoc?
- What does each missing field block: theorem transfer, simulation, manuscript
  promotion, diagnostic use, hidden-target credit, or policy language?
- What artifact changes if the review succeeds or fails?

## Information the Current State Can Still Force

### 1. Project-scope consolidation

Tempting claim: the project is now a settled response-modeling framework with a
clear mathematical spine.

Fields to force:

- Canonical theorem set: which propositions are stable enough to be the core?
- Canonical methodology: which documents are source of truth for the contract,
  verification stack, and application discipline?
- Dead or parked motivations: which old slogans are now only prompts?
- Reader artifact: should the next artifact be `core-math.md`, Lean setup,
  book/paper polish, or another research thread?

Consequence if missing: do not continue open-ended research by default. Do a
project-state consolidation first, because additional iterations will mostly
add audit history rather than clarify the evaluable core.

Recommended next review: **meta-consolidation after Iteration 43**.

### 2. Core-math extraction

Tempting claim: the mathematical core is ready for a single clean document or
formalization.

Fields to force:

- Stable definitions: `U`, `K_theta`, `W_theta`, selection drift, value metric,
  intervention cost geometry, `H_per`, `H_pop`, and capacity `S(M)`.
- Theorem candidates: coordinate-explicit selection bound,
  value-weighted/operator bound, Stackelberg wedge, convex score-deficit
  budget, additive exchange-rate condition, deterministic adaptive-hardening
  capacity boundary.
- Dependency map: which theorems depend on measure theory, finite-dimensional
  convexity, separable quadratic costs, or declared value metrics?
- Non-transfer clauses: what each theorem does not license.

Consequence if missing: do not start Lean. Create `research/core-math.md`
first, because formalization will otherwise encode unstable prose distinctions.

Recommended review: **core-math readiness review** after meta-consolidation.

### 3. Open-question triage

Tempting claim: the live questions are still productive research targets.

Fields to force:

- Cheapest live verification layer for each question.
- Failure condition that would kill or narrow the question.
- File target for success.
- Promotion target, if any: research note, simulation, book prose, paper prose,
  application contract, or no promotion.

Consequence if missing: archive or park the question. A question without a
failure condition should not remain in `research/open_questions.md` as active
work.

Recommended review: **open/closed/parked question split** during
meta-consolidation.

### 4. Recursive / complexity-attractor revival

Tempting claim: repeated proxy repair pushes residual error into simpler, less
legible, or cheaper hidden dimensions.

Fields to force:

- Complexity functional fixed before inspection: support, rank, spectral
  concentration, description length, KL, or another measure.
- Response mechanism: quadratic cost, capped fixed-charge, low-rank action map,
  search prior, or empirical candidate generator.
- Representation: which hidden coordinate basis or invariant object is being
  used?
- Failure condition: what result would make the attractor story uninteresting
  or false?

Consequence if missing: keep Q18 parked. Do not add another attractor iteration
or manuscript claim.

Recommended review: **predeclared attractor-test design**, only after core
scope is consolidated.

### 5. Application and policy readiness

Tempting claim: the framework can guide scorecard or benchmark design.

Fields to force:

- Type/action boundary and evidence distinguishing `W_theta` from `K_theta`.
- Primitive availability: `kappa`, `h`, `gamma`, `w`, `V`.
- Evidence standard: repeated-unit traces, composition checks, hidden-target
  monitoring, effective-rule documentation, threshold exposure, or unavailable.
- Operational consequence for unavailable primitives.

Consequence if missing: no toy diagnostic, no hidden-target credit, no broad
policy prose. The only licensed action is audit/design/evidence collection.

Recommended review: **policy/application gate only after a concrete domain is
selected**. Do not do a generic policy pass next.

### 6. Stochastic and endogenous dynamics

Tempting claim: adaptive hardening or endogenous stakes have a stable dynamic
story beyond the deterministic capacity boundary.

Fields to force:

- Observation model.
- Repair budget and update rule.
- Agent forecasting or response rule.
- Stakes update and observed-harm variable.
- Stability, convergence, or failure criterion.

Consequence if missing: keep Iteration 36 as a dynamic boundary toy only. Do not
promote fixed-point, persistent-cycle, filtering, or policy-optimization
claims.

Recommended review: **dynamic-model specification review**, but only if the
project deliberately chooses another research iteration rather than
consolidation.

## Recommended Next Move

Run the existing `plans/meta-consolidation-after-iteration43.md` plan next, but
add an explicit "paradigm-forced inventory" step:

1. For each canonical claim, fill:
   - claim;
   - contract fields declared;
   - missing or unavailable fields;
   - consequence of missing fields;
   - current artifact that owns the claim.
2. For each open question, fill:
   - tempting stronger claim;
   - missing primitive;
   - cheapest verification layer;
   - failure condition;
   - keep open / close / park.
3. End with a next-mode decision:
   - continue research only if a live question has a failure condition and file
     target;
   - create `research/core-math.md` if the theorem set is stable but scattered;
   - start Lean only after `core-math.md`;
   - switch to book/paper consolidation only if the math spine and scope are
     already clear.

## Review Order

1. **Meta-consolidation with paradigm-forced inventory.**
2. **Core-math readiness review.**
3. **Open/closed/parked question split.**
4. Then choose exactly one:
   - core math document;
   - Lean seed;
   - scoped book/paper consolidation;
   - one new research iteration with predeclared falsifier.

The current state does not justify a generic policy review or another
complexity-attractor rescue as the next move. Both would skip the information
the paradigm is now able to force.
