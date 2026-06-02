# Open questions

This file now tracks only active questions with a missing primitive, cheapest
verification layer, and failure condition. Historical questions and closed
boundaries are split into `closed_questions.md`; vague or deferred questions
are split into `parked_questions.md`.

## O1. Primitive estimation for applications

Question: when can application primitives such as response ease `kappa`, hidden
harm/value `h`, signal value `gamma`, effective weights `w`, stakes `V`, hidden
targets, and action traces be predeclared, bounded, or defended before score
movement is interpreted?

Cheapest layer: real-world correspondence before simulation.

Failure condition: primitives are assigned only after metric movement, or an
unavailable primitive carries no deployment, monitoring, or evidence-collection
consequence.

Target files: `research/applications/empirical_auditability.md`;
domain-specific application notes.

## O2. Stochastic observation and repair budgets

Question: what observation model, filtering rule, repair budget, and stopping
criterion replace deterministic best-response observation in adaptive
hardening?

Cheapest layer: simulation after the observation-error model and repair budget
are declared.

Failure condition: simple noise makes the rule harden irrelevant channels,
miss `S(M) < d^2/(2V)` within budget, or depend entirely on post-hoc filtering
choices.

Target files: `research/threads/response_dynamics_boundary.md`;
`research/simulations/iteration36_response_dynamics.py`.

## O3. Endogenous-stakes fixed points

Question: can a declared trust/stakes recurrence plus strategic response rule
produce a stable fixed point, and what hidden harm remains there?

Cheapest layer: thought experiment, then simulation.

Failure condition: different plausible observed-harm variables or forecasting
rules produce incompatible stakes paths from the same static capacity state.

Target files: `research/threads/response_dynamics_boundary.md`.

## O4. Changing measured sets, deficits, stakes, or weights

Question: what replaces the scalar capacity invariant when `M`, `d`, `V`, or
weights change over time?

Cheapest layer: thought experiment.

Failure condition: adding a measured channel or changing the deficit can
increase attack capacity while existing channels harden, so monotone capacity
no longer controls feasibility.

Target files: new thread only after the update rule is fixed.

## O5. Shared bottlenecks and nonconvex response geometry

Question: how do caps, fixed charges, shared resources, correlated costs,
search discontinuities, or nonconvex feasible sets change the convex
score-deficit budget?

Cheapest layer: simulation or finite active-set calculation.

Failure condition: active-set switches, fixed charges, or bottlenecks reverse
the convex prediction, or no local convex approximation is defensible.

Target files: `research/threads/capped_fixed_charge_response.md`;
`research/threads/convex_intervention_bound.md`.

## O6. Real-domain measurement frontier

Question: can real domains characterize the frontier among signal value, hidden
harm, gaming ease, effective aggregation, and stakes before deployment?

Cheapest layer: real-world correspondence.

Failure condition: signal adequacy, harm, attack surface, or stakes cannot be
estimated or bounded before deployment, or they are chosen after observing the
score movement.

Target files: application notes; no policy prose without a separate review.

## O7. Value-weighted susceptibility

Question: can applications declare value functionals or value norms strongly
enough for the value-weighted/operator selection bound to rank hidden-risk
directions non-post-hoc?

Cheapest layer: real-world correspondence.

Failure condition: value weights are unavailable, arbitrary, or chosen after
observing the selected distribution.

Target files: `research/claim_audits.md`; future application notes.

## O8. Zhuang & Hadfield-Menell incorporation or rejection

Question: does the Zhuang & Hadfield-Menell 2020 below-baseline overoptimization
result (state with `L` utility attributes, proxy optimizing a strict subset of
`J < L` of them, true utility driven below the no-optimization baseline as
optimization pressure rises) instantiate the response-modeling contract, and if
so under which declared primitives? Concretely: which response channel does it
declare (allocation/intervention over states, not baseline reweighting), what
aggregation rule and attribute-coupling assumptions drive the below-baseline
conclusion, and does the result embed into an existing theorem (T1/T2 selection
envelope, or the T4/T5 intervention-aggregation calculations) or expose a
primitive the project has not captured?

Motivation: before this entry, the project had no citation to Z&HM anywhere in
`book/`, `research/`, or the bibliography, yet it is the most direct prior
statement of the "optimize a proxy over a subset of attributes, harm the
unmeasured ones" phenomenon. Any framing of the project as a generalization of
Z&HM is currently unsupported until the embedding is worked out the way
El-Mhamdi & Hoang 2024 already was in
`research/reviews/formal_analogue_lit_map.md`.

Cheapest layer: literature reading plus an embedding attempt against the
contract primitives, before any new theorem or simulation. Reuse the
El-Mhamdi/Hoang embedding template: state Z&HM's objects, map them to
`(U, K_theta, W_theta, P, phi, aggregation, harm)`, and identify the exact
hypothesis (e.g. unbounded attributes, monotone coupling, fixed resource
budget) that produces the below-baseline divergence.

Failure condition: the below-baseline result depends on an assumption the
project has explicitly refused -- unconditional dimensional scaling, a generic
"more measured dimensions is worse" claim (`negative_results.md` Iter 1, 5), or
a coupling primitive the project killed (covariance as general primitive, Iter
2-3). In that case Z&HM is a contrast class, not an anchor, and the project must
say which refused assumption its own results decline to inherit rather than
claim to generalize it.

Target files: `research/reviews/formal_analogue_lit_map.md` (new primitive-map
row, mirroring the El-Mhamdi rows); `research/claim_audits.md` (license/non-
license row once the embedding is settled).
