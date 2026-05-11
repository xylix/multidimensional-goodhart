# Red flags

## Iteration 1: confident Gaussian zero-covariance claim

Claim: in the Gaussian threshold-selection toy model, selection on `X_1` produces no expected hidden drift exactly when hidden coordinates have zero covariance with `X_1`.

Trigger: tagged `[confident]`, so adversarial review was required.

Adversarial pass: the statement is valid only inside the Gaussian toy model. Reversing the Gaussian assumption kills it: zero covariance does not generally imply zero conditional tail mean. The claim remains in the thread with its scope narrowed to the Gaussian case.

Residual concern: this result is elementary and uses strong distributional assumptions, so it should not be rhetorically inflated into a general Goodhart theorem.

