# Iteration log

Compact era summary after Iteration 43. The full audit trail is preserved in
`research/iteration_log_full_1_43.md`.

## Iteration 44: consolidation

Question tackled: what survived Iterations 1-43, which files are authoritative,
which questions are closed/open/parked, and what theorem set should the spine
refactor treat as canonical?

What changed: created the project-state registry, split closed/open/parked
questions, produced `research/core-math.md`, moved the full log to
`research/iteration_log_full_1_43.md`, replaced this file with an era summary,
and wrote the next-mode memo.

What's open now: era 1 should continue with spine refactor, prose pass, and
polish. Open research questions remain active only when they name a missing
primitive, cheapest verification layer, and failure condition.

Red flags fired: no new math claim. The consolidation risk was stale authority;
the repair is to make the registry and `core-math.md` the default source list.

## Iteration 46: book prose pass

Question tackled: can the re-spined book be tightened at the line level without
expanding the licensed claims, weakening caveats, or disturbing the recent
Goodhart-opening repair?

What changed: edited only `book/multidimensional-goodhart.typ` for a
Zinsser-style prose pass. The pass cut performed phrasing, removed low-value
`intentionally` language, rewrote the remaining object-style nominalizations,
and tightened several overloaded explanatory sentences. The Goodhart opening
continues to quote both the popular formulation and Goodhart's original
formulation, and the uncertain proxy-movement evidentiary claim remains absent.

What's open now: Iteration 47 should do the final polish pass: proposition
numbering, references, figures, appendices, build hygiene, and consistency
checks against `core-math.md`.

Red flags fired: no new theorem, policy, welfare, ML-transfer, or empirical
claim was added. The pass preserved the response-modeling contract, theorem
license boundaries, ML caveats, and hospital-readmissions evidence discipline.

## Iteration 47: publication polish and reproducible build

Question tackled: can the book, abstract, references, figures, active theorem
audit files, and generated outputs be made internally consistent enough to
close era 1 without adding new claims?

What changed: removed dynamic title-page date output, added literature
citations and a bibliography to the abstract, pruned unused active
`refs.bib` entries, moved current-facing proposition language to T1–T6,
promoted four generated manuscript figures, superseded the old appendix
figure set, and updated figure rationales, plan files, and the figure audit.

What's open now: era 1 has no planned research or polish work remaining in
the active plan. Remaining caveats are the framework's own boundaries:
no empirical welfare estimates, no broad policy advice, no ML-transfer claim
without declared primitives, and no stochastic/adaptive theorem beyond the
closed deterministic contract.

Red flags fired: no new theorem, welfare, empirical, ML-transfer, or policy
claim was introduced. The promoted figures are toy/structural illustrations
with explicit non-license boundaries, and raw simulation PNGs remain source
checks rather than book figures.

## Iterations 1-6: dimensional selection and intervention split

Main question: does hidden Goodhart harm scale with unmeasured dimension?

Result: no dimension-only law survived. Threshold selection depends on
baseline response/coupling; intervention depends on action geometry. The early
work introduced threshold response, weighted selection response, the
selection/intervention contrast, the quadratic Stackelberg wedge, and the
additive/conjunctive aggregation split.

Killed or narrowed: unconditional dimensional scaling, signed aggregate hidden
error, covariance as a finite-pressure primitive, generic "more metrics"
signs, and broad additive conservation.

Live carry-forward: declare harm/value functionals, aggregation rules, and
response channels before making dimensional claims.

Canonical files: `research/formalization.md`,
`research/threads/selection_response.md`,
`research/threads/intervention_response.md`,
`research/negative_results.md`.

## Iterations 7-15: response geometry and core proposition sketches

Main question: can the recursive/minimum-complexity idea be repaired, and what
mathematical primitives survive review?

Result: the generic minimum-complexity attractor failed. The replacement is a
conditional response-geometry taxonomy: quadratic, fixed-charge, capped,
low-rank, and search-prior regimes predict different shapes only after their
coordinates and constraints are declared. The response-kernel boundary and
response-modeling contract became the methodological spine. The first core
proposition sketches were stated: coordinate-explicit and value-weighted
selection bounds, the Stackelberg wedge, convex score-deficit budget, and
additive exchange-rate condition.

Killed or narrowed: absolute continuity as the causal intervention boundary,
selection/intervention identifiability from marginals, convex affordability as
welfare bound, and value-metric-free selection invariance.

Live carry-forward: applications must defend `U`, channel, action geometry,
aggregation, value/harm, and evidence standard.

Canonical files: `research/threads/response_kernel_boundary.md`,
`research/threads/response_modeling_contract.md`,
`research/threads/core_propositions_and_value_norms.md`,
`research/threads/convex_intervention_bound.md`,
`research/claim_audits.md`.

## Iterations 16-26: book propagation and literature rigor repairs

Main question: which proposition sketches and literature analogues are safe to
promote into manuscript prose?

Result: the book received the five core proposition blocks with hypotheses and
license boundaries. Simulation checks exercised selection/intervention toys,
population versus per-agent welfare, active-set response, and conditional
response shapes. The literature pass mapped external results to primitives
rather than claiming unification.

Killed or narrowed: proposition language that outruns hypotheses, direct ML or
RLHF transfer without local response geometry, and citations used as generic
support without primitive attribution.

Live carry-forward: keep formal analogues as mapped neighbors; do not treat
them as subsumed by the framework.

Canonical files: `book/multidimensional-goodhart.typ`,
`research/reviews/formal_analogue_lit_map.md`,
`research/simulations/README.md`,
`research/verification_stack.md`.

## Iterations 27-34: application discipline and promotion gates

Main question: can adaptive-hardening and institutional-scorecard material
support applications without becoming policy or welfare overclaims?

Result: the adaptive-hardening toy, hospital scorecard application, scientific
metrics application, and application template were generated and reviewed. The
reviewed promotion was application discipline: predeclare the response
contract, name discriminator observations, include failure conditions, and
change an audit/design/evidence decision before interpreting score movement.
Chapter 6 integrated only the narrowed discipline and compact mappings.

Killed or narrowed: route switching as persistent cycles, static narrow
commitment as general policy, empirical welfare/research-value inference,
optimal policy design, and full application prose dumps.

Live carry-forward: primitive estimation and real-domain frontier
characterization remain open; policy language remains gated.

Canonical files: `research/applications/application_template.md`,
`research/applications/hospital_scorecard.md`,
`research/applications/scientific_metrics.md`,
`research/reviews/application_response_modeling_reviews.md`.

## Iterations 35-43: adaptive-hardening boundary and manuscript freshness

Main question: what exactly survived the adaptive-hardening repair sequence,
and do manuscripts still match the license map?

Result: Iteration 35 promoted only the deterministic finite-channel capacity
boundary: fixed-deficit gaming is feasible iff `S_t(M) >= d^2/(2V)` and stops
exactly when capacity falls below threshold, with a progress-aware termination
condition. Iteration 36 kept stochastic observation and endogenous stakes as
dynamic-toy boundaries. Iteration 37 added empirical-auditability discipline.
Iteration 38 blocked broad policy prose except narrow audit/design/evidence
actions. Iterations 40-42 closed manuscript integration for the staged repair
sequence. Iteration 43 added the short manuscript abstract and strengthened
paper/abstract framing.

Killed or narrowed: stochastic filtering, endogenous-stakes fixed points,
changing measured sets/deficits, shared bottlenecks, nonconvex geometry,
persistent cycles, hidden-target estimates, and policy optimization remain
unlicensed.

Live carry-forward: era 1 now needs consolidation, book/abstract spine repair,
line-level prose, and polish rather than new research.

Canonical files: `research/threads/adaptive_hardening_theorem_boundary.md`,
`research/applications/empirical_auditability.md`,
`research/reviews/policy_readiness_review.md`,
`research/reviews/scoped_manuscript_review_iteration43.md`,
`plans/next-steps.md`.

## Lit-review iteration, 2026-07-11: T1/T2 selection-bound verdict (Track A)

Iteration type: `review` (literature review, per litrev-selection-bounds
plan; consumes the shared Phase 0 discovery + Task 08 verification records —
no new deep-research passes run).

Question tackled: is T1 the Hammersley–Chapman–Robbins inequality rearranged,
what is the closest chi²-DRO statement of the envelope, and is T2's
declared-value-norm operator form stated anywhere in the discovered prior
art?

What changed: wrote the verdict synthesis
`research/threads/lit_review/selection-bound-chapman-robbins/README.md`.
Verdict: T1's inequality = HCR (Polyanskiy–Wu §29.1 eq. 29.1,
verified-primary) verbatim after a three-step rearrangement, with the
hypothesis-by-hypothesis check showing exact match except the sharpness pair
(attainment + necessity-of-L² witnesses), which is standard-but-assembled
rather than verbatim prior art. Second home: Namkoong–Duchi 2017 Thm 1
eq. (10) with the phi-normalization conversion making their sqrt(2rho/n)
exactly the book's delta (verified-primary); Ben-Tal 2013 credited only for
the phi-divergence RCP machinery per the Task 08 correction. Third home
(Bayesian robustness, Gustafson) stays tentative/discovery-grade. T2: scalar
form is scalar HCR applied to v·H (verified-primary); matrix-HCR ellipsoid +
support function give the skeleton (verified-secondary citation, but
derivable in three lines from the scalar form — shown); the declared-value-
norm dual-ball wrapper is an auditable negative (unstated in Phase 0's
saturated Areas A/B/C2, but a one-line corollary — credit as a reading, like
T5(D)). Corrected the false negative in
`research/reviews/formal_analogue_lit_map.md` (Non-map pass "no chi²
analogue") in place with a dated strike-through note.

What's open now: capstone (`plans/novelty-refactor.md`) owns the T1/T2 prose
reframe and citations; pulls that would upgrade caps: Lehmann–Casella §2.7
or full Polyanskiy–Wu notes (numbered matrix HCR), Gustafson 1996 primary.
Benchmark that would erase the T2 residual: a dual-norm-ball drift bound in
those texts or a phi-divergence DRO survey's vector-mean section.

Red flags fired: "suspiciously elementary" fires by construction (the
finding is that the theorem is classical — established project posture, not
a new unresolved flag); adversarial pass on the T1=HCR identification run
and clear, with two adopted repairs (inequality-vs-named-theorem altitude
clarification; verdict language weakened from "verbatim" to "inequality
verbatim, sharpness pair assembled"). Nothing logged to red_flags.md.
