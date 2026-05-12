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

Commit: `f6186d8` (`Add weighted selection response iteration`).

## Iteration 4

Question tackled: open question 8 — how the framework should represent policies that change the baseline distribution `mu`, not merely reweight it (causal/adversarial Goodhart).

What changed: introduced the **response channel** `R: Theta -> P(S)` as the top-level object, split into selection channels (`mu_theta << mu_0`; contains all of iterations 1-3) and intervention channels (`mu_theta` can be singular w.r.t. `mu_0`). Proved an elementary drift bound for selection channels (`||B_H|| <= delta · ||s||`, all baseline functionals) and argued no baseline analogue exists for intervention channels. Built a linear-Gaussian Stackelberg gaming toy model: agents pay quadratic cost `a^2/(2kappa)` to inflate the proxy, selection worth `V`; equilibrium gaming wedge `Delta = sqrt(2 kappa V)` sets both the proxy's worst-case bias and the induced hidden harm, and is exogenous to `mu_0`. Created `research/threads/intervention_response.md`; updated `formalization.md`, `open_questions.md` (added Q10-13), `red_flags.md`.

What's open now: a general intervention-channel bound for convex (non-quadratic) gaming costs (Q10); endogenous-stakes / performative fixed point (Q11); exact agent-model condition for staying inside the selection class (Q12); multidimensional gaming reconnecting to the dimensional thread (Q13).

Red flags fired: none triggered the adversarial sub-protocol (no `[confident]` claims; iteration 4 is not a multiple of 3). Logged one watch item in `red_flags.md`: the selection-channel bound is elementary — don't over-sell the inequality; the contrast is the content. Next scheduled adversarial pass: iteration 6.

Commit: (recorded in a follow-up bookkeeping commit).
