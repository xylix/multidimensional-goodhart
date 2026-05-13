# Negative results

## Iteration 1: unconditional dimensional scaling fails

Tried claim: Goodhart-style hidden harm scales with `dim(ker phi)`.

Failure: if hidden goal dimensions are independent of the measured proxy, thresholding on the proxy leaves the hidden distribution unchanged in the Gaussian toy model. More hidden dimensions alone do not imply more harm.

Postmortem: dimensional dependence needs a coupling hypothesis and a specified harm functional. The useful object in the first toy model is the covariance-ratio vector `r`, not dimension by itself.

## Iteration 1: signed aggregate hidden error is the wrong target

Tried claim: sum of hidden errors grows with hidden dimension.

Failure: positive and negative hidden correlations can cancel in a signed sum even while normed or squared hidden displacement grows.

Postmortem: future claims should use normed drift, squared loss, tail risk, or a domain-specific loss rather than raw signed sums.

## Iteration 2: covariance is not a general coupling primitive

Tried claim: zero covariance between a hidden coordinate and a selected proxy means threshold selection does not shift the hidden coordinate.

Failure: with `P = Z ~ N(0, 1)` and `H = Z^2 - 1`, `Cov(H, P) = 0` but `E[H | P >= t] = t lambda(t) > 0` for `t > 0`.

Postmortem: covariance works in the multivariate Gaussian toy model because conditional expectations are linear. General threshold-selection claims need tail response curves or stronger dependence assumptions.

## Iteration 3: baseline covariance is not enough for finite soft optimization

Tried claim: the baseline covariance `Cov_mu(H, P)` summarizes hidden drift under soft optimization pressure.

Failure: with `P = Z ~ N(0, 1)` and `H = Z^2 - 1`, baseline covariance is zero, but Boltzmann selection by `exp(beta Z)` gives `E_beta[H] - E[H] = beta^2`.

Postmortem: covariance is a local derivative along the tilted path, not a global finite-pressure summary. One needs either the full path `Cov_beta(H, P)` or a direct response operator.

## Iteration 5: re-routing which proxy channels are measured does not reduce gaming harm

Tried claim: a regulator facing a gamed metric can cut total gaming harm by switching which channels it measures (e.g. stop counting the channel that's currently being inflated).

Failure: in the additive-metric, equally-wasteful-gaming, quadratic-cost toy, the cost-minimal allocation is water-filling `a_j = t kappa_j / K_M`, so total harm `H = sum_j a_j = t` regardless of `M` — closing a gamed channel just spreads the same total `t` over the remaining measured channels. Worse, *adding* a gameable channel raises `K_M`, lowers the cheapest gaming cost `t^2/(2K_M)`, and recruits more gamers.

Postmortem: superseded/narrowed by iteration 6. Harm is conserved under re-routing only for fixed-deficit per-agent gaming in compensatory metrics whose channels are equally harmful per score unit. The effective levers are aggregate (shrink `K_M` below `t^2/(2V)`, harden channels, raise the bar relative to real signal, cut the prize) or structural (proxies whose cheapest inflation is partly real, i.e. `gamma_j > 0`; low `h_j/w_j` channels; changed aggregation). "Add another KPI" is not a fix and is often a population-level backfire.

## Iteration 5: "more measured dimensions" has no sign without fixing the aggregation rule

Tried claim: gaming harm increases (or: stays constant, by conservation) with the number of measured proxy dimensions.

Failure: additive metric gives `H = t` (flat in `|M|`); conjunctive metric gives `H = t|M|` (linear in `|M|`); these are opposite conclusions from the same primitives. Unequal-weight additive metrics interpolate.

Postmortem: dimensional-dependence claims in the intervention regime must be stated relative to the aggregation rule. The selection-regime `sqrt(d)`-type scaling and the intervention-regime flat/linear scaling are different phenomena that should not be conflated.

## Iteration 6: strong additive conservation is not invariant to weights or population entry

Tried claim: additive/compensatory metrics conserve total gaming harm under re-routing.

Failure: with weighted additive score `sum w_j a_j`, quadratic costs, and harm `sum h_j a_j`, the fixed-deficit optimum has harm `H_M(d) = d (sum h_j kappa_j w_j)/(sum kappa_j w_j^2)`, which depends on `M` unless `h_j = c w_j` on the active channels. Separately, with heterogeneous quality, increasing `K_M` enlarges the set of agents for whom gaming is worthwhile, so aggregate population harm increases even when each fixed-deficit gamer has conserved harm.

Postmortem: the useful conservation statement is narrower: re-routing conserves fixed-deficit per-agent harm only among channels that are equally harmful per score unit. This is not a defect; it identifies the exact exchange-rate condition under which conservation Goodhart is substantive rather than a unit-weight artifact.

## Iteration 7: unconditional minimum-complexity attraction fails

Tried claim: as proxy optimization pressure increases, hidden drift converges to the lowest-complexity feasible configuration.

Failure: selection channels do not optimize over feasible hidden drifts at all; they reweight a baseline, so hidden movement follows the baseline tail response. A baseline can produce diffuse hidden drift, e.g. thresholding `P = Z` with `H_i = Z + xi_i` shifts every hidden coordinate. In intervention channels, the optimizer selects according to cost/search geometry. With quadratic cost `c(a) = (1/2) a^T C^{-1} a` and proxy target `w . a >= d`, the KKT solution is `a^* = d C w/(w^T C w)`, which can be dense under symmetric costs.

Postmortem: the surviving claim is conditional: minimum-complexity attractors require a mechanism that aligns response geometry with the chosen complexity functional, such as fixed activation costs, sparse affordances, low-rank action maps, parameter-function multiplicity, or an explicit simplicity-biased search prior. "Cheap", "simple", and "low-complexity" must remain separate until such a mechanism is specified.

## Iteration 9: overbroad response-shape predictions fail

Tried claim: the repaired Q18 table can say that quadratic costs predict dense drift, fixed activation or linear costs predict one-channel drift, low-rank action maps predict spectrally concentrated drift, and simplicity-biased search predicts low-description-length drift.

Failure: each row needs extra clauses. Quadratic costs predict `a^*` proportional to `C w`; this is sparse if `C w` is sparse and can change under rank deficiency, caps, nonnegativity, or active constraints. Linear/fixed-charge one-channel drift fails under caps, ties, convex marginal costs, detection penalties, or diversification. Low-rank maps restrict the image of possible drift but do not make a basis-invariant spectral claim. Low-description-length search bias is not predictive unless the description language or search prior is fixed before the failure is observed.

Postmortem: the geometry-to-shape table is still useful, but only as conditional claim license. Use it to generate tests with pre-specified coordinates, constraints, and search priors; do not present it as a general theorem about the shape of Goodhart drift.

## Iteration 10: capped fixed-charge response is not always sorted filling

Tried claim: adding caps to the fixed activation / linear-cost model makes the optimizer fill channels in increasing effective marginal cost `q_j/w_j` until each cap binds.

Failure: that sorted-staircase result is correct for capped linear costs with no activation costs, or after activation costs are already paid. It is not correct for the full fixed-charge model. Positive `F_j` can make a high-marginal, low-fixed-cost channel optimal for small deficits and a low-marginal, high-fixed-cost channel optimal for larger deficits. The optimizer may skip a cheaper small-deficit channel instead of filling it first.

Postmortem: the useful claim is two-stage. Capped linear costs produce ordered spillover. Fixed charges add entry thresholds, so the exact object is a finite active-set comparison. The robust Goodhart shape is lumpy regime change, not universal marginal-cost sorting.

## External analysis: absolute continuity is not the causal intervention boundary

Tried claim: intervention channels can be defined as exactly those response laws that fail `mu_theta << mu_0`.

Failure: the clean singularity example works because the baseline has `H == 0` for gaming harm. Add an `epsilon` amount of baseline variation on gaming-like behavior and an announced metric can increase gaming by changing agents' actions while the induced law remains absolutely continuous with respect to `mu_0`. The causal story is unchanged, but the measure-theoretic split collapses.

Postmortem: keep absolute continuity as the formal condition for pure reweighting and as the reason the selection bound applies. Define intervention causally as a change in the response/action kernel at fixed underlying type. Mutual singularity is sufficient evidence of intervention, not necessary.

## External analysis: coordinate-freeness of the selection bound was overclaimed

Tried claim: `||B_H||_2 <= delta ||s||_2` is a coordinate-free selection-channel drift bound.

Failure: the inequality is correct after choosing hidden coordinates and a Euclidean norm, but splitting one hidden variable into several correlated coordinates changes `||s||_2` and the bookkeeping. A rotated or duplicated representation can change the apparent dimensional dependence without changing the underlying hidden phenomenon.

Postmortem: call the result coordinate-explicit. A coordinate-invariant version would need a specified value metric, covariance operator, or other representation-aware norm. This does not weaken the pure-selection lesson; it prevents the norm bookkeeping from being mistaken for an invariant harm measure.

## Iteration 11: response-kernel boundary is not representation-free or marginally identifiable

Tried claim: the response-kernel definition gives an intrinsic, observable boundary between selection and intervention.

Failure: the boundary depends on the declared type space `U`. If `U` is enriched to include the whole policy-contingent response plan, an apparent intervention can be redescribed as selection over richer types. If `U` is too coarse, ordinary type heterogeneity can look like a kernel change. Separately, the marginal induced law `mu_theta` generally cannot identify whether change came from type weights `W_theta` or from fixed-type response kernels `K_theta`.

Postmortem: the repaired claim is relative to a causal type/action representation. This is still useful: applications must say what is fixed type, what is action, and what observations would distinguish reweighting from response. But the framework should not pretend the distinction is recoverable from marginal score distributions alone.

## Iteration 12: response-kernel decomposition is not unique

Tried claim: once the framework writes `mu_theta` using `W_theta(u)` and `K_theta(ds | u)`, observed policy-indexed distributions can be decomposed into a selection part and an intervention part.

Failure: the decomposition is not unique without type-level evidence or structural assumptions. With `U = {0, 1}`, `S = {0, 1}`, and `nu` uniform, any target marginal `Pr_theta(S = 1) = q` can be represented as pure selection if `K_0(S = 1 | u) = u` and `W_theta` reweights type `1`; the same marginal can be represented as intervention by keeping `W_theta = 1` and setting `K_theta(S = 1 | u) = q` for both types. Richer or coarser choices of `U` change the classification again.

Postmortem: the response-kernel boundary is a causal modeling discipline, not an estimator from marginals. Applications need a declared type/action representation plus evidence such as repeated observations of the same type, randomized policy exposure, action traces, or defended structural constraints.

## Iteration 13: convex affordability is not a welfare bound

Tried claim: a convex cost budget for intervention gives a general bound on hidden Goodhart harm.

Failure: the budget bounds affordable action movement only after declaring action coordinates and cost. Hidden harm is a separate functional. With `w = (1, 1)`, equal quadratic costs, and hidden harm `h = (M, 0)`, the cost-minimal action for score deficit `d` is `(d/2, d/2)`, so hidden harm is `Md/2`. For fixed private cost geometry and fixed proxy deficit, value-weighted harm can be made arbitrarily large by increasing `M`.

Postmortem: the convex-cost intervention bound is useful but conditional. It replaces baseline divergence with an affordable-action set and a score-deficit cost `m(d)`, but welfare claims require a declared hidden harm functional and value weights.
