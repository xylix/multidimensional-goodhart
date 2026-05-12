# Red flags

## Iteration 1: confident Gaussian zero-covariance claim

Claim: in the Gaussian threshold-selection toy model, selection on `X_1` produces no expected hidden drift exactly when hidden coordinates have zero covariance with `X_1`.

Trigger: tagged `[confident]`, so adversarial review was required.

Adversarial pass: the statement is valid only inside the Gaussian toy model. Reversing the Gaussian assumption kills it: zero covariance does not generally imply zero conditional tail mean. The claim remains in the thread with its scope narrowed to the Gaussian case.

Residual concern: this result is elementary and uses strong distributional assumptions, so it should not be rhetorically inflated into a general Goodhart theorem.

## Iteration 2: confident zero-covariance counterexample

Claim: zero covariance between a hidden coordinate and a scalar proxy does not imply zero hidden drift under threshold selection.

Trigger: tagged `[confident]`, so adversarial review was required.

Adversarial pass: clear for the stated claim. Checked a concrete construction `P = Z`, `H = Z^2 - 1`, with `Z ~ N(0, 1)`: covariance is zero by odd moments, while the upper-tail conditional mean is `t lambda(t)`. The result is narrow and negative; it does not establish the positive framework by itself.

Residual concern: the example is simple and somewhat engineered, so it should be used to reject covariance as a universal primitive, not to claim that real systems generically have U-shaped hidden dependence.

## Iteration 3: scheduled adversarial pass

Claim reviewed: threshold response `b_H(t)` is a better primitive than covariance for non-Gaussian threshold-selection Goodhart.

Trigger: every third iteration.

Adversarial pass: the claim is useful but too broad as originally worded. It handles hard threshold selection, not soft optimization, repeated selection, or causal/adversarial changes to the state-generating process. The repair is to place `b_H(t)` inside a wider weighted-response notation.

Residual concern: weighted response still models selection from a fixed baseline distribution. It does not yet capture causal Goodhart or strategic adaptation.

## Iteration 4: elementary selection-channel drift bound (watch item, not yet `needs-adversarial-review`)

Claim: under a selection channel, `||B_H(theta)||_2 <= delta · ||s||_2` with `delta = ||L_theta - 1||_{L^2(mu_0)}`, `s_i = sd_{mu_0}(H_i)`.

Why watched: it is one line of Cauchy-Schwarz — flag pattern "suspiciously short/elementary" is borderline. Mitigation: the question it answers (is selection drift bounded by baseline quantities?) is not itself hard, so the brevity is appropriate, not suspicious. The load-bearing claim of iteration 4 is the *contrast* — that intervention channels admit no such bound and need an exogenous agent cost model — not the inequality. Action: do not inflate the inequality into a headline theorem; if a future iteration leans on it for something substantive, run the adversarial sub-protocol then. No `[confident]` tag was used in iteration 4, so the scheduled trigger did not fire (next scheduled adversarial pass: iteration 6).
