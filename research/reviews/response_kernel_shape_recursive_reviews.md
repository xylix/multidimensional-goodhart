# Response kernel, shape, and recursive-claim review synthesis

Status after consolidation: durable technical-boundary synthesis. This file
replaces the separate response-kernel, response-shape, and recursive-Goodhart
review files. Use it for selection/intervention boundaries, geometry-to-shape
licenses, and recursive-claim cautions. Current live claims remain governed by
`research/claim_audits.md`, `research/open_questions.md`, and
`research/verification_stack.md`.

## Consolidated verdict

The technical boundary survives as a modeling discipline, not as an
identification theorem. After a causal type/action representation has been
declared, pure selection reweights fixed type-conditional behavior through
`W_theta`, while intervention changes fixed-type behavior through `K_theta`.
Observed marginal distributions alone generally cannot identify the
decomposition.

Recursive and response-shape claims survive only in conditional form. A claim
about dense, sparse, low-rank, or low-description-length residual drift needs a
predeclared response geometry, representation, shape or complexity measure, and
failure condition.

## Response-kernel boundary

With declared type space `U`, baseline type measure `nu`, participation weights
`W_theta(u)`, and fixed-type kernels `K_theta(ds | u)`, the induced law is

`mu_theta(A) =
  integral W_theta(u) K_theta(A | u) nu(du) /
  integral W_theta(u) nu(du)`.

Pure selection is the special case `K_theta = K_0`; intervention means
`K_theta != K_0` on a positive-`nu` set. The distinction is useful because it
marks where baseline reweighting bounds apply and where action/cost geometry
is needed.

The boundary is representation-relative. If `U` includes each agent's entire
policy-contingent response plan, many behavior changes can be redescribed as
selection. If `U` omits stable heterogeneity, mixture changes can look like
kernel changes. Applications therefore must justify why the chosen `U` is
substantively fixed and must name evidence such as repeated-type observations,
randomized exposure, action traces, structural constraints, or a causal model.

Kernel change is not automatically hidden harm. Proxy repair, genuine
improvement, and harmful gaming all require a separate hidden-value or welfare
model.

## Response-shape predictions

The geometry-to-shape table is useful only as a menu of conditional
predictions:

- Quadratic costs give cost-minimal drift proportional to `C w` in the
  unconstrained or interior case. The drift is dense only when `C w` is dense
  in the predeclared action basis and no sign, cap, or active-face constraint
  binds.
- Fixed activation or linear costs give one-channel response only in the
  uncapped, no-tie, linear marginal model. More generally they suggest lumpy or
  low-support response relative to active constraints.
- Low-rank action maps restrict hidden drift to `im(L)`. Calling the result
  spectrally concentrated requires a specified hidden-outcome representation
  and value basis.
- Simplicity-biased search predicts low-description-length failures only
  relative to a pre-specified search prior, coding scheme, or
  parameter-function map.

The reader-facing Goodhart claim should stay weaker: proxy pressure does not
determine hidden drift by itself; the response process and constraints
determine which residuals are reached.

## Recursive-claim boundary

Recursive Goodhart remains a conjectural family of mechanisms. The framework
supports pieces: selection response, intervention boundaries, aggregation
rules, exchange-rate conditions, and action/cost geometry. It does not yet
provide recursive dynamics, a regulator-learning model, a time-indexed proxy
update rule, or a theorem that residuals migrate monotonically toward
lower-legibility, higher-complexity, or minimum-complexity configurations.

Licensed wording: patched proxies can move residual error into harder-to-elicit
or cheaper-to-exploit directions when the relevant dimensions, legibility
measure, and response geometry are fixed in advance.

Unlicensed wording: Goodhart drift generically increases complexity, converges
to minimum-complexity hidden failures, or is derived by the current formal
chapters as a recursive theorem.

Appendix-style cartoons can orient readers only if they remain explicitly
speculative and list observations that would support or weaken the hypothesis.
