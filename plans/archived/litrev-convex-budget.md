# Lit review: T4 convex score-deficit budget vs Fenchel/Rockafellar duality

Status: done, 2026-07-11. Verdict: T4 = textbook Lagrangian/perturbation
(value-function) conjugate duality specialized to a linear proxy constraint —
cite Rockafellar 1970 by section (§31 Fenchel duality, §28–30 perturbation
conjugacy; theorem number pending the user's book pull); no Goodhart/
strategic-classification antecedent states the budget form (auditable
negative, Hardt 2016 nearest in substance); survives = the affordability
reading + channel placement; recommend demoting T4 to "Fact." Synthesis:
`research/threads/lit_review/convex-budget-fenchel/README.md`. One of three
feeding the novelty-refactor capstone (`plans/novelty-refactor.md`). This was
the cheapest of the three: the prior art was already half-acknowledged
internally, so the task was confirmation and a clean citation, not a full
adversarial sweep.

**Consumes the unified cross-field discovery** (`plans/litrev-discovery.md`); the
Fenchel/Rockafellar prior art is discovered once there (outputs in
`research/threads/lit_review/cross-field-discovery/`). Do not run independent
searches — this review produces the **T4 per-theorem verdict / citation** from
that shared discovery.

## Why this exists

T4 is the one core result whose standardness is already named in the research
threads (`research/threads/convex_intervention_bound.md`: "By Lagrange/Fenchel
duality, under the usual regularity conditions …", "the support function of …").
What is missing is a primary citation and an explicit in-paper statement that
this is textbook convex analysis, not a discovery. Left as-is, T4 is numbered and
boxed like the other theorems, which inflates it under the elementary-synthesis
framing (`paper1-is-elementary-synthesis` memory).

## The claim under review

T4 (book §5.2, `core-math.md` T4): for finite-dimensional action space, closed
proper convex cost `c`, linear proxy gain `w . a`, and convex-duality regularity,
`m(d) = inf_a { c(a) : w . a >= d } = sup_{lambda >= 0} [lambda d - c^*(lambda w)]`,
with gaming feasible iff `m(d) <= V`.

## Suspected prior art (to confirm)

- **Fenchel duality / convex conjugacy (Rockafellar, *Convex Analysis*).** `m(d)`
  is the optimal value of a linearly-constrained convex program; its conjugate /
  dual is the standard perturbation-function duality. The `sup_{lambda>=0}`
  form is the Lagrangian dual; the `c^*(lambda w)` term is the conjugate
  evaluated on the scaled proxy direction. The "support function" interpretation
  is the support function of the sublevel/feasible geometry.
- The quadratic special case (`m(d) = d^2/(2 S)` with `S = w^T diag(kappa) w`) is
  elementary least-cost allocation — the same `|b|^2` quantity that recurs in T5
  and T6 after cost-normalization.

## Protocol

A full three-model adversarial sweep is overkill here. Minimum sufficient:

1. One pessimistic ("find the textbook statement") pass to pin the exact
   Rockafellar / standard convex-analysis reference (theorem name and number)
   for value-function conjugacy under a Slater-type regularity condition.
2. A quick check on whether any Goodhart/strategic-classification source already
   states this exact budget form (Hardt et al. is the nearest), so the paper
   credits the right antecedent if one exists.
3. Store under `research/threads/lit_review/convex-budget-fenchel/`.

## Resolution criterion

Resolved when a primary convex-analysis citation for the conjugate-dual value
function (and its regularity condition) is identified and verified, and we have a
yes/no on whether a Goodhart-side source already wrote the affordability budget.

## Consequence if confirmed (feeds the capstone)

- Cite Rockafellar (or equivalent) for T4; state in-paper that the budget is the
  standard convex-duality value function specialized to a linear proxy gain.
- Consider presenting T4 as "Fact/Observation" rather than a boxed "Theorem,"
  and present T5 explicitly as "T4-quadratic optimizer + a linear harm readout"
  (the projection form), per the capstone.

## What this plan deliberately does not do

- No change to the T4 statement; no new generality (fixed-charge / nonconvex
  cases stay out of scope, as in the current non-license clause).
