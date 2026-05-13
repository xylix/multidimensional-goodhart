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

Why watched: it is one line of Cauchy-Schwarz — flag pattern "suspiciously short/elementary" is borderline. Mitigation: the question it answers (is selection drift bounded by baseline quantities?) is not itself hard, so the brevity is appropriate, not suspicious. The load-bearing claim of iteration 4 is the *contrast* — that intervention channels require an exogenous agent response/cost model — not the inequality. Additional repair after external analysis: do not call the Euclidean vector bound coordinate-free. It is coordinate-explicit unless a value-weighted covariance/operator norm is declared. Also do not define intervention merely by failure of absolute continuity; small baseline mass on gaming-like behavior can preserve `mu_theta << mu_0` while the causal response kernel changes. Action: keep the inequality as a pure-selection bound only.

## Iteration 5: conservation-under-re-routing and the additive/conjunctive dichotomy (watch item)

Claims: (a) additive metric ⇒ total gaming harm `H = t`, invariant to which channels are measured; (b) conjunctive metric ⇒ `H = t|M|`; (c) hence "add a KPI" backfires under the (realistic) additive rule.

Red-flag scan: the derivation is a one-shot Lagrange/water-filling argument — borderline "suspiciously short". Mitigation: the brevity is appropriate (cost-minimal allocation under a linear constraint is genuinely short), and the content lives in the comparative statics and the additive-vs-conjunctive contrast, both of which *use* the structural hypotheses essentially (relaxing equally-wasteful gaming, or unit weights, or additivity each visibly changes the conclusion — documented inline and in `negative_results.md`). Conclusion is not rhetorically convenient: it is a *mixed* result (conservation, not growth, under re-routing; backfire, not redistribution, on adding dims), which is not the maximally tidy story for either "Goodhart worsens" or "more dims help". All claims left `[tentative]`; no `[confident]` tag, so the scheduled adversarial trigger did not fire. Action: if a later iteration leans on conservation as load-bearing, run the adversarial sub-protocol then. Next scheduled adversarial pass: iteration 6 (and iteration 6 should treat this thread as the most-recent significant claim to attack).

## Iteration 6: scheduled adversarial pass repaired the conservation claim

Claim reviewed: additive metric conservation under re-routing from iteration 5.

Trigger: scheduled every-third-iteration adversarial pass.

Adversarial pass: not clear as originally worded. The Lagrange calculation was correct, but the summary "total harm is conserved" collapsed per-agent fixed-deficit harm with population aggregate harm, and it hid the unit-weight assumption. With weighted additive score `sum w_j a_j` and harm `sum h_j a_j`, harm is `d (sum h_j kappa_j w_j)/(sum kappa_j w_j^2)`, so re-routing can raise or lower harm unless `h_j/w_j` is constant. With heterogeneous `Q`, adding a channel increases aggregate population harm by recruiting additional agents into the gaming band.

Repair: conservation is now stated only for fixed-deficit per-agent harm among channels equally harmful per score unit. The broader framework claim becomes an exchange-rate condition: aggregation rule and harm-per-score ratios determine dimensional gaming behavior. Residual concern: real score weights may be partly arbitrary normalization choices, so future work must distinguish harmless unit changes from substantive incentive exchange rates.

## Iteration 7: minimum-complexity attractor equivocation (`needs-adversarial-review`)

Claim reviewed: Q18's broad attractor claim — proxy pressure drives hidden drift toward the minimum-complexity feasible configuration.

Trigger: red-flag pattern fired. The conclusion is rhetorically convenient for the recursive-Goodhart story, and the argument can silently equate several different notions: low private cost, easy search, low support, low rank, low description length, and low entropy.

Adversarial pass: not clear as a generic claim. Selection does not optimize hidden drift; it follows baseline tail response. Quadratic intervention selects `a^* = d C w/(w^T C w)`, which is cost-minimal but can be dense. Sparse attraction appears in fixed-charge or linear-cost models, but that is a property of the cost geometry, not a universal property of Goodhart pressure.

Repair: state the surviving claim as a response-geometry attractor. Minimum-complexity attraction is licensed only after specifying a complexity functional and a response mechanism that favors it. Action: do not promote Appendix G's recursive cartoon into a theorem without a later review/edit iteration and a pre-specified complexity measure.

## Iteration 8: Q18 review repaired a low-information narrowing

Claim reviewed: the repair "minimum-complexity attractor -> response-geometry attractor."

Trigger: review iteration following the Iteration 7 `needs-adversarial-review` flag.

Review result: the repair is epistemically safer but can become too broad to inform the reader. "Response geometry" says the response process determines the drift, but by itself it does not say whether the drift should be sparse, dense, low-rank, high-entropy, low-description-length, or goal-improving.

Repair: keep "response-geometry attractor" only as the top-level container. Preserve information by naming geometry-to-shape predictions: quadratic cost predicts dense cost-minimal drift along `C w`; fixed activation or linear costs predict sparse one-channel drift absent caps; low-rank action maps predict spectrally concentrated drift; simplicity-biased search priors predict low-description-length drift. Action: future draft prose should use these sharper conditional subclaims rather than the generic umbrella alone.

## Iteration 9: response-shape predictions needed guardrails

Claim reviewed: the Iteration 8 geometry-to-shape table for repaired Q18.

Trigger: scheduled every-third-iteration adversarial pass. The sharper table preserved information, but each row could be overread as a representation-invariant Goodhart law.

Review result: the table survives only as a menu of conditional model predictions. Quadratic cost gives the cost-minimal direction `C w`, which is dense only when `C w` is dense and no additional constraints bind. Fixed-charge or linear costs give one-channel drift only in the uncapped, no-tie, linear marginal model; caps, convex costs, detection penalties, and diversification can spread drift. Low-rank action maps restrict drift to a low-dimensional image, but spectral concentration depends on the hidden representation and value basis. Simplicity-biased search predicts low-description-length failures only when the coding/search prior is specified before the observed failure.

Repair: keep the geometry-to-shape table, but attach model clauses to each entry. The reader-facing claim should remain separate from the math claim: response processes determine which hidden residuals are reached, but the predicted shape is licensed only under a named geometry, representation, and constraint set.

## Iteration 11: response-kernel boundary representation caveat

Claim reviewed: selection/intervention should be classified by whether the policy changes the fixed-type response kernel `K_theta(ds | u)`.

Red-flag scan: the repair is useful but could be overread as an intrinsic boundary. It is not. The type space `U` is a modeling choice: too rich a `U` can absorb future responses into type, while too coarse a `U` can make heterogeneity look like intervention. Also, marginal distributions `mu_theta` usually do not identify `W_theta` versus `K_theta`.

Repair: state the claim as relative to a declared causal type/action representation. The useful requirement for applications is not "observe `mu_theta` and classify"; it is "declare what is fixed type, what is manipulable action, and what evidence distinguishes reweighting from response."

## Iteration 12: scheduled adversarial pass on response-kernel boundary

Claim reviewed: pure selection changes only `W_theta`, while intervention changes `K_theta` at fixed type.

Trigger: scheduled every-third-iteration adversarial pass.

Review result: the boundary survives, but only as a representation-relative causal distinction. It correctly classifies participation-only response as selection and epsilon-baseline gaming as intervention despite absolute continuity. It also correctly allows proxy-only manipulation to be intervention without hidden harm. The main failure modes are still load-bearing: a too-rich `U` can encode future response plans as type, a too-coarse `U` can make stable heterogeneity look like kernel change, and the same marginal `mu_theta` can come from changed `W_theta` or changed `K_theta`.

Repair: keep the compact definition unchanged, but present it as a modeling discipline rather than an observational classifier. Applications must declare the type/action representation and state what evidence distinguishes reweighting from fixed-type response.
