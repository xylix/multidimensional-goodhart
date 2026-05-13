# New research findings since iteration 6

Iterations 7-10 shifted the project from the earlier multidimensional-gaming
question into Q18: whether repeated proxy pressure or proxy repair drives hidden
drift toward a "minimum-complexity" residual. The main finding is negative but
productive: proxy pressure does not, by itself, select minimum-complexity hidden
drift. What it selects depends on the response channel. Selection channels
follow the baseline tail response. Intervention channels follow cost geometry,
search geometry, constraints, and aggregation.

## 1. Minimum-complexity attraction is not generic

The broad Q18 claim was rejected. In a selection channel, the policy only
reweights an existing baseline distribution, so hidden drift is

`B_H(theta) = E_theta[H] - E_mu[H]`.

There is no independent optimization over hidden residuals. A
minimum-complexity story can hold in selection only if the high-proxy tail of the
baseline is already biased toward low-complexity hidden configurations.

The intervention counterexample is also simple. If an agent must close a proxy
deficit `w . a >= d` and faces quadratic cost

`c(a) = (1/2) a^T C^{-1} a`,

then the KKT solution is

`a^* = d C w / (w^T C w)`.

This is the minimum-cost action, not the minimum-complexity action. It can be
dense, sparse, low-description-length, or not, depending on `C`, `w`, the
coordinate system, and any active constraints. The finding is therefore
[tentative] but important: "cheap", "simple", "sparse", "low-rank", and
"low-description-length" must remain separate primitives unless a response model
explicitly links them.

Toy example: a firm with smooth quadratic costs for improving several measured
KPIs spreads gaming effort across all cheap channels; a firm with one
low-setup-cost loophole concentrates effort on that loophole. Both are
Goodhart-like, but only the second supports a sparse-attractor interpretation.

## 2. The repaired object is a response-shape prediction

The safe repair is not merely "response geometry matters." That slogan is true
but too low-information. The useful repaired claim is a menu of conditional
response-shape predictions:

| Response geometry | Licensed prediction | Main guardrail |
| --- | --- | --- |
| Quadratic intervention cost | Cost-minimal drift along `C w` in the unconstrained/interior case | Dense only when `C w` is dense in the pre-specified action basis and no extra constraints bind; for `a >= 0`, require `C w >= 0` or solve on the active face |
| Fixed activation or linear marginal cost | Low-support or one-channel drift in the uncapped, no-tie case | Caps, convex post-activation costs, detection risk, and ties can force spreading |
| Low-rank action map `L` | Drift is restricted to `im(L)` | Spectral concentration requires a specified hidden representation and value basis |
| Simplicity-biased search prior | Failures are biased toward low description length under that prior | The coding language or search prior must be fixed before observing the failure |

This preserves the information in Q18 without promoting a generic theorem. The
reader-facing claim should be: proxy pressure does not determine hidden drift
alone; the response process and its constraints determine which hidden residuals
are reached. The mathematical claim must then name the response geometry and the
shape prediction it licenses.

## 3. Fixed-charge models now have a sharper spillover story

Iteration 10 developed the fixed activation / linear-cost row in detail. With
channels `j`, action `a_j`, score weight `w_j > 0`, marginal cost `q_j`, fixed
activation cost `F_j`, cap `u_j`, and deficit `d`, the agent solves

`min sum_j F_j 1{a_j > 0} + sum_j q_j a_j`

subject to

`sum_j w_j a_j >= d`, and `0 <= a_j <= u_j`.

Three regimes emerged:

1. Uncapped fixed-charge or linear costs can produce one-channel drift:
   `j^*(d) in argmin_j (F_j + d q_j / w_j)`.
2. Capped linear costs with no activation thresholds produce ordered spillover:
   channels fill in increasing effective marginal cost `q_j / w_j` until caps
   bind.
3. Fixed charges plus caps do not obey universal sorted filling. Positive
   activation costs create entry thresholds, channel switching, and sometimes
   skipping of a previously cheap small-deficit channel.

The Goodhart reading is concrete: closing, saturating, or hardening the visible
exploit need not remove hidden drift. It can push pressure into the next
available route, but the support path is lumpy and model-dependent rather than
a smooth or universal "complexity increase."

## 4. Recursive Goodhart remains a conjecture, now better scoped

The recursive hypothesis survived only as a conditional empirical conjecture:
successive proxy repairs can move residual error into dimensions that are less
legible, less represented, cheaper to exploit, lower-rank, or easier to find,
but only when those dimensions and mechanisms are specified in advance.

What is licensed:

- selection response curves and intervention cost geometry can explain why
  hidden residuals move after proxy pressure;
- fixed-charge, capped, low-rank, and search-prior models give testable residual
  shape predictions;
- Appendix G-style recursive Goodhart is useful as orientation if it remains
  explicitly speculative.

What is not licensed:

- a theorem that residual error generically becomes more complex over time;
- a generic minimum-complexity attractor for Goodhart drift;
- post-hoc labeling of whatever failure occurred as "simple", "complex",
  "low-rank", or "less legible";
- using support size, rank, entropy, KL, or description length interchangeably.

## 5. Iteration 11 repaired the response-channel boundary

The external audit exposed a weakness in the earlier selection/intervention
definition. Failure of absolute continuity is too brittle: if the baseline has
even small mass on gaming-like behavior, a policy can change behavior while the
post-policy law remains absolutely continuous.

The repaired object is a type-conditioned response kernel. With type space `U`,
type law `nu`, participation weight `W_theta(u)`, and response kernel
`K_theta(ds | u)`, the induced law is

`mu_theta(A) = int W_theta(u) K_theta(A | u) nu(du) / int W_theta(u) nu(du)`.

Pure selection changes `W_theta` while keeping `K_theta = K_0`. Intervention
changes `K_theta` at fixed type. This preserves the selection-response bound for
true reweighting while routing behavior change toward cost/action geometry.

Main guardrail: the distinction is relative to a declared type/action
representation and is not identifiable from marginal `mu_theta` alone.

## 6. Updated research direction

The next useful work is not to defend minimum-complexity attraction in general.
It is to choose one response geometry and one pre-specified shape or complexity
measure, then test the prediction under explicit coordinates and constraints.
The most natural candidates from the current notes are:

- a convex-cost intervention bound stated in terms of action kernels rather than
  induced-law singularity;
- an ML mapping that declares type, action, and candidate referents for
  `kappa`;
- capped fixed-charge response versus active-face quadratic response under the
  same hidden coordinate system;
- a low-rank affordance model with a fixed value basis;
- a search-prior toy model where description length is fixed before observing
  the failure;
- simulations comparing support-size paths under uncapped linear, capped
  linear, fixed-charge, convex, and detection-penalized geometries.

The post-iteration-6 picture is therefore a conditional mechanism map. It is
weaker than the original recursive/minimum-complexity slogan, but stronger as
research: it says what to measure, which counterexamples kill each subclaim, and
which residual shapes each response model should predict.
