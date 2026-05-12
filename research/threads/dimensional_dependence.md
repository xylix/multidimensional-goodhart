# Thread: dimensional dependence under Gaussian selection

## Working approach

### 1. Constraints on definitions

The notation must support cases where the proxy observes only some directions of a vector goal, and it must distinguish invisible goal dimensions from noisy observations of visible dimensions. It should not assume that dimensions are literally independent moral values; they can be coordinates in a local model.

Simplification for this thread: take `G = X in R^m` Gaussian and use one scalar proxy `P = X_1`. This intentionally removes observation noise so that any effect comes from the dimension gap rather than measurement error.

### 2. Motivation

Open question 1 asks whether Goodhart-style harm scales with `dim(ker phi)`. A threshold-selection calculation is the smallest test case: if hidden dimensions are correlated with a measured proxy, optimizing the proxy should condition the hidden coordinates.

### 3. Current pondering

No prior thread exists. The draft's live intuition is that adding proxy dimensions can reduce visible error while pushing error into more complex or less visible dimensions.

### 4. Plausible approaches

- Compute conditional expectations in a multivariate normal under `X_1 >= t`.
- Compare per-coordinate hidden drift with aggregate hidden drift as `d = m - 1` grows.
- Add observation noise later and decompose regressional versus dimension-gap effects.

### 5. Approaches not yet considered

- Replace the Gaussian with an elliptical distribution and ask which conclusions depend only on linear regression formulas.
- Use random matrix asymptotics where the measured direction is a random projection rather than a named coordinate.

### 6. Counterexample first

A counterexample to naive dimensional scaling would have hidden dimensions independent of the measured proxy. Let `X ~ N(0, I_m)` and select on `X_1 >= t`. Then for every `j > 1`, `E[X_j | X_1 >= t] = 0`; increasing `dim(ker phi)` does not change expected hidden drift. So any dimensional-dependence claim must require correlation, coupling, constraints, or adversarial response.

Another counterexample shape: hidden dimensions may have alternating positive and negative correlations with the proxy. Aggregate signed error can cancel even when absolute or squared hidden error grows. Therefore the target quantity should be normed harm, tail probability, or task-specific loss, not raw signed sum.

### 7. Outward pointers

Known ingredients: Gaussian conditioning, inverse Mills ratio, Schur complement/conditional normal formulas, and selection bias. ML analogues include distribution shift from selecting on validation score and multi-task conflict when improving one coordinate predictably moves another.

## Toy model

Let `X = (X_1, ..., X_m) ~ N(0, Sigma)`. The proxy is `P = X_1`, and selection is `A_t = {X_1 >= t}`. Hidden goal dimensions are `H = (X_2, ..., X_m)`, so `dim(ker phi) = d = m - 1` in this simplified coordinate projection.

For each hidden coordinate, write `rho_j = Cov(X_j, X_1) / Var(X_1)`. By the conditional normal formula,

`E[X_j | X_1 = x] = rho_j x`.

Therefore,

`E[X_j | A_t] = rho_j E[X_1 | X_1 >= t]`.

If `X_1 ~ N(0, sigma_1^2)`, then

`E[X_1 | X_1 >= t] = sigma_1 lambda(alpha)`, where `alpha = t / sigma_1` and `lambda(alpha) = varphi(alpha) / (1 - Phi(alpha))` is the inverse Mills ratio.

So the hidden mean shift vector is

`E[H | A_t] = sigma_1 lambda(alpha) r`,

where `r = (rho_2, ..., rho_m)`.

Claim [confident]: in this toy model, selection on the measured coordinate produces no expected hidden drift exactly when the hidden coordinates have zero covariance with the selected coordinate. Toy example: if a school rewards only test scores and student curiosity is statistically independent of test scores in the applicant pool, thresholding on test scores does not change mean curiosity.

Counterexample attempt: the claim uses Gaussian linear conditioning. For non-Gaussian variables, zero covariance need not imply `E[X_j | X_1 >= t] = 0`; a U-shaped dependence can have zero covariance but nonzero tail conditioning. So the confident claim is restricted to the Gaussian toy model.

Claim [tentative]: if all hidden dimensions have common covariance ratio `rho_j = rho`, then `||E[H | A_t]||_2 = sqrt(d) |rho| sigma_1 lambda(alpha)`, so aggregate mean hidden drift grows like `sqrt(dim(ker phi))` at fixed per-dimension coupling. Toy example: a firm selects managers by quarterly revenue, and each unmeasured dimension of organizational health has the same mild negative correlation with revenue-chasing; the total vector displacement in unmeasured health grows as more health dimensions are counted.

Counterexample attempt: fixed per-dimension coupling is a strong scaling assumption. If total correlation budget is bounded, for example `sum_j rho_j^2 <= C`, then `||E[H | A_t]||_2 <= sigma_1 lambda(alpha) sqrt(C)` and does not grow with `d`. Dimensional growth therefore depends on whether new dimensions introduce new independent coupling or merely split a fixed amount of coupling into finer coordinates.

Claim [tentative]: for squared hidden harm `L(H) = ||H||_2^2`, selection can increase either through mean shift or conditional variance changes, so expected harm is not determined by the mean drift alone. Toy example: selecting high-output employees may both shift average burnout upward and reduce diversity among selected employees; both terms affect squared distance from the pre-selection goal vector.

Counterexample attempt: if hidden dimensions are independent of `X_1`, the conditional hidden variance is unchanged and the mean shift is zero, so no increase occurs. If hidden dimensions are negatively conditionally correlated, some aggregate losses can even decrease under selection. This again blocks an unconditional "more hidden dimensions means more harm" theorem.

## Immediate takeaway

Claim [tentative]: the clean first version of dimensional dependence is not "more hidden dimensions automatically cause more Goodhart," but "under a per-dimension coupling model, threshold selection induces hidden drift whose norm scales with the coupling vector norm `||r||_2`; this becomes dimensional scaling only after a substantive assumption about how `||r||_2` grows with hidden dimension." Toy example: adding ten independent unmeasured quality dimensions each weakly correlated with speed creates more hidden displacement than splitting one quality dimension into ten labels.

## Iteration 2: covariance is not enough outside Gaussian linearity

### 1. Constraints on definitions

The next definition must not silently equate "uncorrelated" with "selection-invariant." That equivalence is valid in the multivariate Gaussian calculation above, but the draft's target domain includes organizations, humans, and adaptive systems where nonlinear dependence is normal.

The notation should preserve the linear-Gaussian result as a tractable special case while leaving room for nonlinear tail effects.

### 2. Motivation

The red flag from iteration 1 is that the clean zero-covariance claim is too easy to misread as general. Repairing it matters because the draft wants a multidimensional Goodhart framework, not just a Gaussian exercise.

### 3. Current pondering

The live question is whether the coupling object should be covariance, regression coefficient, mutual information, or something more directly tied to the selection operator.

### 4. Plausible approaches

- Construct a concrete zero-covariance but nonzero-tail-response example.
- Define a threshold response vector `b_H(t) = E[H | P >= t] - E[H]`.
- Ask later whether `b_H(t)` can be replaced by a policy response for non-threshold optimization.

### 5. Approaches not yet considered

- Use copulas to separate marginal distributions from dependence structure.
- Use monotone likelihood-ratio or positive-association assumptions as weaker replacements for Gaussianity.

### 6. Counterexample first

A covariance-based theorem would say that if `Cov(H, P) = 0`, selecting on high `P` should not move `H`. The likely counterexample shape is nonlinear dependence: `H` is small near average `P` and large in both tails, so positive and negative linear covariance cancel while upper-tail selection still moves `H`.

### 7. Outward pointers

Relevant known tools include conditional expectation as an `L^2` projection, tail conditional expectation, copulas, and selection bias. This also resembles the ML distinction between uncorrelated residuals and residuals that are conditionally structured in high-score regions.

### Counterexample

Let `P = Z` where `Z ~ N(0, 1)`, and let the hidden one-dimensional goal coordinate be

`H = Z^2 - 1`.

Then `E[H] = 0` and

`Cov(H, P) = E[(Z^2 - 1) Z] = E[Z^3] - E[Z] = 0`.

But under threshold selection `A_t = {Z >= t}`,

`E[H | A_t] = E[Z^2 - 1 | Z >= t] = t lambda(t)`,

where `lambda(t) = varphi(t) / (1 - Phi(t))`. For `t > 0`, this is positive.

Claim [confident]: zero covariance between a hidden coordinate and a scalar proxy does not imply zero hidden drift under threshold selection. Toy example: an academic evaluation score may be uncorrelated with intellectual conformity overall because both very low-score and very high-score candidates are unusual, while selecting only very high scores still enriches for a particular kind of unusualness.

Counterexample attempt: this example defines `H` as a deterministic nonlinear function of `P`, so it may feel too engineered. But that is exactly the point against covariance: nonlinear dependence can be invisible to covariance while completely determining tail behavior. A less deterministic version `H = Z^2 - 1 + xi` with independent mean-zero noise `xi` preserves the same covariance and tail mean shift while weakening the functional-dependence objection.

Claim [tentative]: for threshold-selection Goodhart, the natural local object is the response curve `b_H(t) = E[H | P >= t] - E[H]`, not just a covariance vector. Toy example: for a sales target, the relevant question is not whether burnout linearly correlates with measured sales across all employees, but how burnout changes among employees above the bonus threshold.

Counterexample attempt: if selection is not a hard threshold, `b_H(t)` gives the wrong operator. For example, soft selection proportional to `exp(beta P)` is described by `E_beta[H] - E[H]`, not by one threshold. This suggests a family of selection-response operators rather than a single universal definition.

### Repair to iteration 1

Claim [tentative]: the Gaussian result should be read as a sufficiency theorem: in the multivariate Gaussian scalar-threshold model, covariance ratios fully determine hidden mean drift at every threshold. It should not be read as saying covariance is the right dependence measure in general. Toy example: when applicant traits are approximately jointly normal, test-score covariance with curiosity predicts curiosity shift after score thresholding; when curiosity is U-shaped in test score, covariance can miss the effect.

Counterexample attempt: even in approximately Gaussian data, tail behavior is often less Gaussian than central behavior. Since Goodhart pressure selects tails, Gaussian approximations may fail exactly where the theory wants to operate. Future claims should either remain local-moderate-threshold claims or use tail-specific assumptions.

## Cross-reference: iteration 5 moved the dimensional question into the intervention regime

The iterations above study how *selection* on a proxy moves hidden coordinates as `dim(ker phi)` grows: drift norm scales with the coupling vector norm `||r||_2`, dimensional only under an extra coupling-growth assumption (and, per iteration 4, bounded by `delta·||s||_2` — every term a baseline functional). Iteration 5 (`threads/intervention_response.md`) asks the corresponding question when agents *game*: does adding a measured proxy dimension redistribute, conserve, shrink, or grow gaming harm? Answer there: it depends on the aggregation rule — additive/compensatory metrics conserve total gaming harm at `H = t` (re-routing only, and adding a gameable channel backfires by cheapening the cheapest gaming path); conjunctive metrics give `H = t|M|`. So "dimensional dependence" has two regimes with opposite character: in selection it is a bounded, baseline-visible `sqrt(d)`-type effect; in intervention it is either flat (compensatory) or linear (conjunctive) and not bounded by anything in `mu_0`.
