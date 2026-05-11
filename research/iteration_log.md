# Iteration log

## Iteration 1

Question tackled: dimensional dependence of hidden Goodhart harm under threshold selection.

What changed: created the research file structure and added a first linear-Gaussian toy model. The main calculation shows that, for `X ~ N(0, Sigma)` and selection on `X_1 >= t`, hidden mean drift is `sigma_1 lambda(t / sigma_1) r`, where `r` is the vector of covariance ratios between hidden coordinates and the selected proxy.

What's open now: dimensional scaling requires assumptions about how `||r||_2` grows with the number of hidden dimensions. The correct harm functional remains unsettled.

Red flags fired: one `[confident]` claim triggered adversarial review. It survived only with explicit restriction to the Gaussian toy model.

Commit: `d210cff` (`Add first dimensional Goodhart iteration`).

## Iteration 2

Question tackled: the red-flagged dependence on Gaussian covariance from iteration 1.

What changed: added a nonlinear counterexample showing that `Cov(H, P) = 0` can coexist with nonzero threshold drift. Added threshold response notation `b_H(t) = E[H | P >= t] - E[H]` to the formalization.

What's open now: `b_H(t)` handles hard-threshold selection but not soft optimization, repeated selection, or adversarial adaptation. We still need assumptions under which covariance is an acceptable approximation.

Red flags fired: one `[confident]` negative claim triggered adversarial review and was logged as clear but narrow.

Commit: `5e62ebe` (`Refine dimensional dependence coupling`).

## Iteration 3

Question tackled: what selection-response operator should replace threshold response for soft optimization.

What changed: added weighted selection response notation to `formalization.md` and created `research/threads/selection_response.md`. The main derivation shows that under Boltzmann selection `W_beta = exp(beta P)`, `d E_beta[H] / d beta = Cov_beta(H, P)`, so covariance is a local velocity along a selection path rather than a finite-pressure summary.

What's open now: weighted response still assumes a fixed baseline distribution. Causal and adversarial Goodhart need a model where the distribution `mu` changes with the regulator's policy.

Red flags fired: the scheduled iteration-3 adversarial pass downgraded the scope of threshold response and motivated the weighted-response generalization.

Commit: pending.
