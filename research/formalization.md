# Formalization notes

## Baseline objects

Let `S` be a state space. A true goal map is `G: S -> R^m`; a proxy map is `P: S -> R^k`. The regulator's intended proxy model is a map `phi: R^m -> R^k`, giving the residual

`epsilon(s) = P(s) - phi(G(s))`.

Claim [tentative]: this separates two distinct Goodhart channels: a dimension gap, where `ker phi != {0}` leaves some goal directions invisible to the proxy, and an observation gap, where `epsilon != 0` corrupts visible directions. Toy example: if product quality is `(reliability, delight)` and the proxy is uptime, then delight can lie in `ker phi`, while noisy uptime instrumentation is part of `epsilon`.

Counterexample attempt: if the regulator's "true" objective is already scalar, then `ker phi` may be an artifact of writing a scalar goal in redundant coordinates. This means dimension-gap claims should be stated after choosing coordinates whose components correspond to substantively distinct goal variations, not arbitrary embeddings.

## Linear specialization for first toy work

For the first iteration, use the simplified case `G(s) = X in R^m`, `P(s) = a^T X + eta`, where `a in R^m` is a measured direction and `eta` is scalar observation noise. Selection is `A_t = {P >= t}`.

Claim [tentative]: the scalarized selection case is a useful first probe because it isolates regressional and extremal Goodhart from Pareto-frontier complications. Toy example: a company rates teams by a weighted score over delivery metrics, then promotes only teams above a threshold.

Counterexample attempt: Pareto selection can preserve diversity across measured dimensions in a way scalar thresholding destroys, so scalarization may overstate compression effects. This limits the current toy model to organizations or algorithms that actually aggregate dimensions before selection.

## Definitional question surfaced

Question: should `phi` be a map from goals to proxies, or should proxies be represented as partial observations of `G` plus independent artifacts?

Proposed resolution [tentative]: keep `phi: R^m -> R^k` as the regulator's intended correspondence, but distinguish three spaces in notation:

- `ker phi`: goal variations invisible to the intended proxy.
- `im phi`: proxy variation intended to track goal variation.
- residual directions in proxy space: variation of `P` not explained by `phi(G)`.

Toy example: citation count is intended to track research quality. Some quality dimensions, like long-run conceptual fertility, may be in `ker phi`; bot citations or citation cartels live mostly in residual proxy variation.

## Selection response notation

For a scalar proxy score `P` and hidden goal vector `H`, define the threshold response

`b_H(t) = E[H | P >= t] - E[H]`,

whenever the conditional expectation exists.

Claim [tentative]: `b_H(t)` is a better primitive than the covariance vector `Cov(H, P)` for non-Gaussian Goodhart questions, because it describes the actual displacement caused by selection at pressure level `t`. Toy example: a hiring score may have zero linear correlation with "weird but valuable research taste" while still selecting against it among only the highest-score applicants.

Counterexample attempt: `b_H(t)` depends on the selected threshold and ignores what happens under smoother optimization policies, such as Boltzmann weighting by `exp(beta P)`. So it is not the final primitive for all selection mechanisms; it is a threshold-selection primitive.

In the Gaussian scalar-selection toy model, `b_H(t) = sigma_1 lambda(t / sigma_1) r`, so the earlier covariance-ratio vector `r` is a sufficient statistic for all threshold responses in that restricted model.

## Weighted selection response

Let `mu` be the baseline distribution over states, and let a selection policy be represented by a nonnegative weight function `W_t(s)` with `0 < E_mu[W_t] < infinity`. Define the selected expectation

`E_t[F] = E_mu[F W_t] / E_mu[W_t]`

and the response of a hidden goal vector `H` as

`B_H(t) = E_t[H] - E_mu[H]`.

Claim [tentative]: weighted response is a more general primitive than threshold response, since hard thresholding is recovered by `W_t = 1{P >= t}` and soft optimization is recovered by choices such as `W_beta = exp(beta P)`. Toy example: a grant process might either fund every proposal above a cutoff or fund probabilistically with odds increasing in score; both are selection policies that reweight the applicant distribution.

Counterexample attempt: not every control process is pure reweighting of a fixed baseline distribution. Interventions can change the state-generating mechanism itself, especially when agents adapt strategically. Weighted response is therefore a selection model, not yet a full causal-control model.

For Boltzmann selection `W_beta = exp(beta P)`, whenever differentiation under the expectation is valid,

`d/d beta E_beta[H] = Cov_beta(H, P)`.

Claim [tentative]: covariance is best interpreted as the local velocity of hidden drift under infinitesimal soft optimization, not as a global finite-pressure summary. Toy example: at low bonus pressure, the initial rate at which burnout changes with sales incentives is the current covariance between burnout and sales; after employees adapt or the selected population shifts, the covariance must be recomputed under the new weighted distribution.

Counterexample attempt: if `P` has heavy tails, `E[exp(beta P)]` may be infinite for positive `beta`; the Boltzmann path may not exist. This is not a small technicality, because Goodhart often concerns extreme tails.
