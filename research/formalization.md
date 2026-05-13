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

Elementary trichotomy [confident]: when a new measured coordinate is added in a
selection model, its baseline dependence with a hidden coordinate is positive,
negative, or approximately zero. Correspondingly, selecting on that coordinate
can move the selected population toward the hidden coordinate, away from it, or
not much at all. This is just correlation / conditional-expectation bookkeeping,
but it is load-bearing intuition: "more measured dimensions" has no sign until
the dependence structure and selected functional are declared. Toy example:
adding a project-quality metric that positively tracks maintenance effort can
select for maintenance; adding a speed metric that negatively tracks
maintenance can select against it; adding a decorative metric unrelated to
maintenance does little in a pure reweighting model.

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

## Response channels (selection vs. intervention)

A **response channel** is a map `R: Theta -> P(S)`, `theta |-> mu_theta`, with `mu_{theta_0} = mu_0` (a null policy). Hidden drift along it: `B_H(theta) = E_{mu_theta}[H] - E_{mu_0}[H]`.

Iteration 11 repair: the causal version of the selection/intervention boundary
should be stated with a type space and response kernel. Let `U` be a declared
type space with baseline type law `nu`, let `K_theta(ds | u)` be the
policy-indexed response kernel from types to observed states, and optionally let
`W_theta(u)` be a participation/selection weight. Then

`mu_theta(A) = int W_theta(u) K_theta(A | u) nu(du) / int W_theta(u) nu(du)`.

`R` is a **pure selection channel relative to `(U, K_0)`** if `K_theta = K_0`
for `nu`-almost every type and policy dependence enters only through
`W_theta`. It is an **intervention channel relative to `(U, K_0)`** if
`K_theta != K_0` on a positive-`nu` set of types: agents can choose actions that
move `(P, H)` or otherwise change the state-generating mechanism. Mutual
singularity with `mu_0` is decisive evidence of intervention, but it is not
required for the causal distinction.

Claim [tentative]: all of the above (covariance, threshold response `b_H(t)`, weighted response `B_H(theta)`) is the pure-selection case, with `L_theta = W_theta / E_{mu_0}[W_theta]`. Intervention channels — Manheim & Garrabrant's causal Goodhart (the policy structurally breaks `P ≈ phi(G)`) and adversarial Goodhart (the policy is chosen worst-case for the regulator) — are not just passive reweightings, even when their induced distributions are technically absolutely continuous. Toy example: choosing which of a fixed applicant pool to admit is a selection channel; announcing the admissions formula and letting applicants re-train is an intervention channel.

Counterexample attempt: an agent model that only lets agents toggle their own inclusion (participate or not) has `K_theta = K_0` and changes only `W_theta`, so it is selection. Conversely, the old absolute-continuity boundary is too brittle: if baseline behavior already has `epsilon` probability on gaming-like actions, an announced metric can increase those actions while preserving `mu_theta << mu_0`. The selection/intervention distinction is substantive exactly when agents can move in state space (change `(P, H)` at fixed type), not merely choose inclusion. Representation caveat: this is relative to the declared type space `U`; if `U` is allowed to include the whole future policy-contingent response plan, the distinction can be trivialized.

## Response-modeling contract

Iteration 14 repair: a Goodhart claim is incomplete unless it declares the
response model. The minimum contract is:

- fixed type space `U`, baseline type law `nu`, and the reason `U` is treated as
  fixed rather than as future response;
- observed state space `S` and baseline kernel `K_0(ds | u)`;
- policy exposure `theta` and who can observe/respond to it;
- selection weights `W_theta(u)` and/or response kernel `K_theta(ds | u)`;
- action space, feasible movement, costs, caps, fixed charges, or search prior
  for any fixed-type behavior change;
- proxy, target, residual relation `P approx phi(G)`, and hidden welfare/harm
  functional;
- aggregation rule for multidimensional proxies;
- evidence standard distinguishing type reweighting from fixed-type response and
  testing the proposed action geometry.

Claim [tentative]: proxy pressure alone does not determine Goodhart behavior.
The response contract determines which result applies: baseline response curves
and reweighting bounds for selection; action/cost/search bounds for
intervention; aggregation/exchange-rate calculations for multidimensional
gaming; and pre-specified shape measures for response-shape predictions.

Counterexample attempt: if the contract only says "geometry matters," it is
vacuous. A useful contract must name the downstream calculation or observation
it licenses. For example, a school test-score claim should say whether the
policy selects schools, changes the same schools' teaching kernel, changes only
reporting, or changes participation; what costs/caps govern those moves; and
what evidence would distinguish these stories.

Drift bound, selection channel: by Cauchy-Schwarz in `L^2(mu_0)`, for
`L_theta = d mu_theta / d mu_0`,
`delta = ||L_theta - 1||_{L^2(mu_0)}` (`delta^2 = chi^2(mu_theta || mu_0)`),
and any declared scalar hidden-value functional
`V_H = v . (H - E_{mu_0} H)`,

`|E_{mu_theta}[V_H] - E_{mu_0}[V_H]|
 <= delta sqrt(v^T Sigma_H v)`,

where `Sigma_H = Cov_{mu_0}(H)`. More generally, for a declared value norm
`||.||_V`,

`||B_H(theta)||_V
 <= delta sup_{||v||_{V,*} <= 1} sqrt(v^T Sigma_H v)`.

For a positive definite matrix norm `||x||_M = sqrt(x^T M x)`, this is
`||B_H(theta)||_M <= delta sqrt(lambda_max(M^{1/2} Sigma_H M^{1/2}))`
(with the corresponding quotient/support-function reading for semidefinite
`M`). The old coordinate Euclidean bound is the special case after declaring
hidden coordinates and the identity value metric:
`||B_H(theta)||_2 <= delta ||s||_2`, `s_i = sd_{mu_0}(H_i)`. This fixes the
coordinate-bookkeeping problem only after the hidden value metric is declared;
value weights are not identified from `mu_theta` alone.

Iteration 13 repair: no baseline-only analogue holds for intervention channels;
even when `L_theta` exists, it describes the induced distribution after response
rather than the cost geometry that made the response available. A conditional
intervention bound must be imported from an action/cost model. For type `u`,
action `a in A(u)`, cost `c_u(a)`, hidden displacement `h_u(a)`, and stakes
`V`, the affordable set is `B_u(V) = {a: c_u(a) <= V}` and any best response
with upside at most `V` satisfies

`||h_u(a^*)|| <= sup_{a in B_u(V)} ||h_u(a)||`.

For linear proxy gain `w . a` and closed proper convex cost `c` (feasibility
absorbed as `c = +infty` outside `A`), the minimum cost of buying score deficit
`d` is

`m(d) = inf{c(a): w . a >= d}
      = sup_{lambda >= 0} [lambda d - c^*(lambda w)]`

under standard convex-duality regularity. Gaming is feasible iff `m(d) <= V`.
In the one-dimensional quadratic toy this recovers `Delta = sqrt(2 kappa V)`.
Convexity and affordability bound action movement, not welfare by themselves:
hidden harm still depends on the declared harm functional `h_u`.

## Multidimensional gaming: aggregation rule controls dimensional scaling

Intervention regime, `k` gameable proxy channels, channel `j` costs `a_j^2/(2 kappa_j)` per unit and produces hidden harm `H_j = a_j`; regulator measures set `M`, selection (worth `V`) at bar `t`. Keep two welfare objects separate: fixed-deficit per-agent harm `H_per(M, d)` and population harm `H_pop(M; F_Q, V)` after heterogeneous agents decide whether gaming is worthwhile. Then (see `threads/intervention_response.md`):

- **Additive/compensatory metric** (`score = sum_{j in M} a_j`): cost-minimal allocation is water-filling `a_j = d kappa_j / K_M` with `K_M = sum_{j in M} kappa_j`; gaming occurs iff `K_M >= d^2/(2V)`; **fixed-deficit per-agent harm is `H_per(M, d) = d`, independent of `M`** in the unit-weight equal-harm case — closing a gamed channel only re-routes that fixed deficit across the rest. Expanding `M` raises `K_M`, *lowers* the cheapest gaming cost, and recruits more gamers; the population object `H_pop(M; F_Q, V) = E[H_per(M, t-Q) 1{0 < t-Q <= sqrt(2K_M V)}]` increases whenever there is mass in the newly profitable deficit band.
- **Conjunctive metric** (must clear `a_j >= t` for every `j in M`): per-gamer harm is `H_per^conj(M, t) = t|M|`, while population harm depends on how the higher cost changes entry.

Adversarial repair from iteration 6: for weighted additive score `sum w_j a_j` and harm `sum h_j a_j`, fixed-deficit per-agent harm is

`H_per(M, d) = d · (sum_{j in M} h_j kappa_j w_j) / (sum_{j in M} kappa_j w_j^2)`.

Thus conservation under re-routing holds for `H_per` iff social harm is proportional to score contribution (`h_j = c w_j`) on the active measured channels. Otherwise changing measured channels or weights can raise or lower fixed-deficit harm. Claim [tentative]: the dimensional dependence of gaming harm is governed by aggregation, exchange rates, and the welfare object, not by dimension count alone; compensatory metrics conserve `H_per` only in the equal-harm-per-score case, while their `H_pop` can rise through entry; conjunctive metrics multiply per-gamer harm but may reduce entry. Scope: if channel `j` also contributes `gamma_j in [0,1]` to the true goal then `H_per(M, t) = sum_{j in M}(1-gamma_j) t kappa_j/K_M` in the unit-weight case and the regulator *can* shrink harm by steering effort onto high-`gamma` channels. Effective regulator levers under the additive rule are aggregate (shrink `K_M` below `t^2/(2V)`, harden channels, raise `t` vs. real signal, cut `V`) or structural (high-`gamma` / low-`h_j/w_j` proxies; switch aggregation rule), not mere re-routing among equally harmful-per-score channels.

Selection/intervention distinction [confident]: baseline correlation and action
geometry are different primitives. Correlation asks how a fixed population's
hidden coordinates move when the policy reweights it by a measured coordinate.
Action geometry asks what causal moves agents can make, how costly those moves
are, which measured coordinates they move together, and what hidden harm or
benefit they produce. The intervention analogue of the selection trichotomy is:
an added metric opens a cheap harmful action channel, blocks substitution by
forcing a costly real improvement or extra bar, or is redundant because it
shares the same bottleneck as existing metrics. Toy example: adding a formatting
metric to a benchmark can open a cheap exploit; adding an adversarial robustness
gate can block an exploit by requiring another costly capability; adding a
second wording of the same test may be redundant if both are gamed by the same
memorized pattern.

## Minimum-complexity attractor: repaired as response-geometry attractor

Q18 asks whether increasing optimization pressure makes the hidden drift in `ker phi` converge to the lowest-complexity configuration compatible with hitting the proxy target. Iteration 7 (`threads/minimum_complexity_attractor.md`) found that this is not a generic consequence of the current framework.

Claim [tentative]: in selection channels, there is no independent optimization over hidden drifts; the selected drift is the baseline response `B_H(theta) = E_theta[H] - E_mu[H]`. Therefore a minimum-complexity attractor in selection requires a distributional assumption that high-proxy tails are already biased toward low-complexity hidden configurations. Toy example: selecting high-scoring programs from a fixed model zoo favors a short reward hack only if that hack is overrepresented among high-scoring programs in the candidate distribution.

Counterexample attempt: if the baseline distribution was produced by training or search, the simplicity bias may be real but upstream. Then the selection channel appears to select low-complexity failures, but the mechanism is the candidate generator, not selection itself.

For intervention channels with linear proxy deficit `w . a >= d` and quadratic cost `c(a) = (1/2) a^T C^{-1} a`, the KKT conditions give the cost-minimal action

`a^* = d C w / (w^T C w)`.

Claim [tentative]: intervention pressure selects a response-geometry optimum, not a complexity optimum by default. In the quadratic model, the attractor is minimum-cost; it is low-support, low-rank, or low-description-length only when the cost/search geometry is aligned with that complexity measure. Toy example: if all KPI-padding channels are equally cheap and equally weighted, a quadratic-cost agent spreads distortion across all of them; if one common exploit has a much lower activation cost, the agent repeatedly uses that exploit.

Counterexample attempt: some processes have simplicity bias not represented as explicit private cost, e.g. parameter-function multiplicity, spectral bias, or training dynamics [guess]. The formalization should therefore allow search priors and dynamics as part of the response channel, not equate "cost" with "complexity."
