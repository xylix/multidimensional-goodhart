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

## Iteration 5: conservation-under-re-routing and the additive/conjunctive dichotomy (watch item)

Claims: (a) additive metric ⇒ total gaming harm `H = t`, invariant to which channels are measured; (b) conjunctive metric ⇒ `H = t|M|`; (c) hence "add a KPI" backfires under the (realistic) additive rule.

Red-flag scan: the derivation is a one-shot Lagrange/water-filling argument — borderline "suspiciously short". Mitigation: the brevity is appropriate (cost-minimal allocation under a linear constraint is genuinely short), and the content lives in the comparative statics and the additive-vs-conjunctive contrast, both of which *use* the structural hypotheses essentially (relaxing equally-wasteful gaming, or unit weights, or additivity each visibly changes the conclusion — documented inline and in `negative_results.md`). Conclusion is not rhetorically convenient: it is a *mixed* result (conservation, not growth, under re-routing; backfire, not redistribution, on adding dims), which is not the maximally tidy story for either "Goodhart worsens" or "more dims help". All claims left `[tentative]`; no `[confident]` tag, so the scheduled adversarial trigger did not fire. Action: if a later iteration leans on conservation as load-bearing, run the adversarial sub-protocol then. Next scheduled adversarial pass: iteration 6 (and iteration 6 should treat this thread as the most-recent significant claim to attack).

## Iteration 6: scheduled adversarial pass repaired the conservation claim

Claim reviewed: additive metric conservation under re-routing from iteration 5.

Trigger: scheduled every-third-iteration adversarial pass.

Adversarial pass: not clear as originally worded. The Lagrange calculation was correct, but the summary "total harm is conserved" collapsed per-agent fixed-deficit harm with population aggregate harm, and it hid the unit-weight assumption. With weighted additive score `sum w_j a_j` and harm `sum h_j a_j`, harm is `d (sum h_j kappa_j w_j)/(sum kappa_j w_j^2)`, so re-routing can raise or lower harm unless `h_j/w_j` is constant. With heterogeneous `Q`, adding a channel increases aggregate population harm by recruiting additional agents into the gaming band.

Repair: conservation is now stated only for fixed-deficit per-agent harm among channels equally harmful per score unit. The broader framework claim becomes an exchange-rate condition: aggregation rule and harm-per-score ratios determine dimensional gaming behavior. Residual concern: real score weights may be partly arbitrary normalization choices, so future work must distinguish harmless unit changes from substantive incentive exchange rates.
