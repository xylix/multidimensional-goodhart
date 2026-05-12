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

Postmortem: harm is conserved under re-routing in compensatory metrics; the effective levers are aggregate (shrink `K_M` below `t^2/(2V)`, harden channels, raise the bar relative to real signal, cut the prize) or structural (proxies whose cheapest inflation is partly real, i.e. `gamma_j > 0`; or switch to a conjunctive metric, accepting `H = t|M|`). "Add another KPI" is not a fix and is usually a backfire.

## Iteration 5: "more measured dimensions" has no sign without fixing the aggregation rule

Tried claim: gaming harm increases (or: stays constant, by conservation) with the number of measured proxy dimensions.

Failure: additive metric gives `H = t` (flat in `|M|`); conjunctive metric gives `H = t|M|` (linear in `|M|`); these are opposite conclusions from the same primitives. Unequal-weight additive metrics interpolate.

Postmortem: dimensional-dependence claims in the intervention regime must be stated relative to the aggregation rule. The selection-regime `sqrt(d)`-type scaling and the intervention-regime flat/linear scaling are different phenomena that should not be conflated.
