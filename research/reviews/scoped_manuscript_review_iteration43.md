# Scoped manuscript review after Iteration 42

Status after consolidation: current manuscript freshness gate unless superseded
by a later manuscript review. It should be read together with the Iteration 42
license map in `research/claim_audits.md`.

Iteration type: `scoped-manuscript-review`

## Question

Do the book and compact paper contain stale or under-updated prose after the
Iteration 35-42 repair sequence, especially around adaptive hardening,
stochastic/endogenous variants, empirical-design boundaries, policy readiness,
and paper/book integration?

High-level verdict: no book contradiction or overpromotion requires a book edit.
The compact paper should receive a scoped freshness edit: sharpen the framework
summary, foreground the current response-channel and scorecard findings, and
repair open-problem wording so the deterministic adaptive-hardening boundary is
not presented as wholly open. A short technical abstract can include the same
licensed synthesis.

## Scope and audit method

The review checked non-PDF sources for stale boundary phrases:
`optimal-policy`, `limits to`, `persistent cycle`, and `endogenous V`. It also
checked book and paper Typst sources for `theorem`, `stochastic`, `Iteration`,
`In progress`, `Future question`, `adaptive hardening`, and `policy`.

The reference license map is the Iteration 42 block in
`research/claim_audits.md`: deterministic finite-channel adaptive hardening is
closed only inside its fixed-`M`, fixed-deficit, fixed-`V`, fixed-weight,
separable-quadratic, additive-score, deterministic-observation contract;
stochastic observation, endogenous stakes, empirical primitive estimation,
measurement-frontier policy, broad policy advice, welfare/research-value
inference, and optimal-policy claims remain excluded from book/paper promotion.

## Findings

| Finding | Evidence | Classification | Action |
| --- | --- | --- | --- |
| The book already carries the deterministic adaptive-hardening boundary in the working-spine inventory. | `book/multidimensional-goodhart.typ` says fixed-deficit gaming stops exactly when `S_t(M) < d^2/(2V)` under the declared deterministic contract, then lists stochastic observation, endogenous stakes, changing sets/deficits, shared bottlenecks, nonconvex geometry, and policy comparison as open. | No action | Leave book prose unchanged. It is a work-in-progress inventory, but not a contradiction. |
| The book contains many `policy` and `theorem` hits, but they are definitional, historical, theorem-boundary, or non-license language. | The hits appear in Goodhart/Lucas background, selection/intervention definitions, proposition caveats, Chapter 6 evidence standards, and appendix summaries. | No action | No scoped book edit. |
| The compact paper open-problems bullet says adaptive hardening may "converge, cycle, or expand the attack surface" before mentioning the narrow deterministic boundary. | `book/multidimensional-goodhart-paper.typ`, open-problems section. | Paper fix now | Replace with boundary-first wording: deterministic progress has a capacity threshold; stochastic observation, endogenous stakes, changing sets/deficits, shared bottlenecks, nonconvex geometry, and policy optimization remain open. Avoid persistent-cycle language. |
| The compact paper accurately separates selection, intervention, aggregation, and response-modeling, but its abstract and opening summary understate the later licensed synthesis. | The paper already has the formulas, but the abstract and summary claim can more explicitly name response-channel geometry, selection/value drift bounds, action-cost separation, scorecard exchange-rate effects, and the response-modeling contract. | Paper fix now | Refresh abstract and intro claim without adding theorem, empirical, or policy claims. |
| The compact paper mentions MMLU application discipline and empirical implementation without importing scorecard policy or welfare claims. | The MMLU section says it is not empirical proof and does not license Stackelberg, convex-cost, RLHF, or welfare bounds without primitives. | No action | Preserve caveats. |
| A standalone short technical abstract is licensed as synthesis, not as new research. | The plan asks for a two-page technical extended abstract using the current license map. | Abstract inclusion | Add `book/multidimensional-goodhart-abstract.typ` and compile PDF. It should keep math light and list live boundaries. |
| Iteration 37-38 empirical/policy material should not be newly integrated into book or paper beyond existing application-contract caveats. | Iteration 42 license map excludes broad policy advice and empirical welfare/research-value inference. | No action | The paper can say applications need evidence standards, but should not add hospital/scientific scorecard policy prose. |

## Edit license for Iteration 43

Allowed:

- paper synthesis polish that names the current survived findings;
- paper repair of stale adaptive-hardening wording;
- a standalone technical extended abstract with the same caveats;
- build/documentation updates for the abstract target.

Blocked:

- new theorem statements;
- stochastic filtering, endogenous-stakes fixed-point, or optimal-policy claims;
- empirical primitive estimates, hidden-target estimates, patient-welfare or
  research-value inference;
- measurement-frontier policy advice or generic claims that more metrics are
  good or bad;
- book prose edits unless a direct contradiction is later found.

## Conclusion

The current manuscripts are mostly consistent with the Iteration 42 license map.
The useful Iteration 43 repair is presentation-level: make the compact paper
read like the current project rather than an earlier open-problems snapshot, and
add a short abstract that gives technical readers the framework, formulas, and
live boundaries in two pages.
