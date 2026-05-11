# Negative results

## Iteration 1: unconditional dimensional scaling fails

Tried claim: Goodhart-style hidden harm scales with `dim(ker phi)`.

Failure: if hidden goal dimensions are independent of the measured proxy, thresholding on the proxy leaves the hidden distribution unchanged in the Gaussian toy model. More hidden dimensions alone do not imply more harm.

Postmortem: dimensional dependence needs a coupling hypothesis and a specified harm functional. The useful object in the first toy model is the covariance-ratio vector `r`, not dimension by itself.

## Iteration 1: signed aggregate hidden error is the wrong target

Tried claim: sum of hidden errors grows with hidden dimension.

Failure: positive and negative hidden correlations can cancel in a signed sum even while normed or squared hidden displacement grows.

Postmortem: future claims should use normed drift, squared loss, tail risk, or a domain-specific loss rather than raw signed sums.

