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
