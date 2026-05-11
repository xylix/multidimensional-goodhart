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

