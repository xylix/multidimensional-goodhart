# Verification stack for the current research idea

Idea under test: multidimensional Goodhart is not merely "more proxy dimensions
means more failure." The working version is: selection and intervention create
different response channels; dimensional effects depend on coupling,
aggregation, exchange rates, value weights, and agent cost geometry. The broader
recursive hypothesis is that repeated proxy repair can move residual error into
less legible, cheaper-to-exploit, or more complex hidden dimensions.

Protocol: descend only as far as needed. If a claim dies at a cheap layer, do
not rescue it by moving to simulation or implementation. Narrow the claim or log
the negative result.

## Layer 1: thought experiments

Passed:
- Independent hidden dimensions: selecting on a proxy should not move hidden
  coordinates that have no dependence on it. This killed the naive claim that
  harm scales with `dim(ker phi)` alone.
- Zero covariance but nonlinear tail dependence: a hidden variable can have zero
  covariance with the proxy while still moving under threshold selection. This
  killed covariance as a general Goodhart primitive.
- Toggle-only agents: agents who can only enter or leave the pool remain a
  selection channel. This supports the selection/intervention boundary.
- Epsilon-baseline gaming: if a small amount of gaming-like behavior already
  exists, an induced intervention can remain absolutely continuous with respect
  to baseline. This killed absolute continuity as the causal boundary and
  motivated response kernels at fixed type.
- Additive vs. conjunctive scorecards: adding dimensions has opposite effects
  depending on aggregation. This killed dimension-count-only intervention
  claims.
- Iteration-16 proposition propagation: the five promoted propositions now have
  explicit hypotheses and reader-facing license boundaries: coordinate-explicit
  selection drift, value-weighted/operator selection drift, the quadratic
  Stackelberg wedge, the convex score-deficit budget, and the additive
  exchange-rate iff-condition. This raises Layer-1 rigor without removing the
  need to declare value weights, action costs, pass conditions, or aggregation
  rules.
- Convex affordability versus welfare bounds: with `w = (1, 1)`, linear hidden
  harm `h = (M, 0)`, and equal quadratic costs, the cost-minimal score-clearing
  action for deficit `d` is `(d/2, d/2)` and has harm `Md/2`. This kills any
  claim that private-cost affordability or `m(d)` bounds welfare without
  declared hidden value weights.

Survived only barely:
- "Conservation Goodhart" survives only as an exchange-rate statement:
  fixed-deficit per-agent harm is conserved under additive re-routing when
  channels are equally harmful per score unit. Unequal weights, unequal harm
  rates, population entry, or partially real improvements can flip the result.
- The recursive hypothesis survives only as a hypothesis about pre-specified
  hidden dimensions and costs/legibility. Without that, it is too elastic.
- The response-kernel boundary survives only relative to a declared type/action
  representation. It is not identifiable from marginal `mu_theta` alone.
- The response-modeling contract survives only if it names a calculation or
  falsifier. Otherwise "geometry matters" becomes too broad to discipline any
  case.

Killed:
- Unconditional dimensional scaling.
- Signed aggregate hidden drift as the welfare object.
- Baseline covariance as a finite-pressure certificate.
- "Adding more metrics helps" or "adding more metrics hurts" without specifying
  aggregation and exchange rates.

Verdict at this layer: the original slogan version dies here. The repaired
research idea survives because it has become conditional and mechanism-specific.

## Layer 2: real-world correspondence

Passed:
- Campbell's law and audit/accountability cases match the intervention picture:
  measured indicators become targets and change behavior, not just selection
  over a fixed population (`campbell1979`, `strathern1997`).
- Multitask incentive theory already says that measured tasks distort effort
  away from unmeasured tasks (`holmstrom1991multitask`, `baker1992incentive`,
  `prendergast1999provision`). This corresponds to value-weighted hidden harm
  and low-cost substitution channels.
- Strategic classification and performative prediction match the claim that
  policies can change the data-generating distribution rather than merely
  reweight it (`hardt2016strategic`, `perdomo2020performative`).
- Principal-agent models match the Iteration-11 split between type,
  participation/selection, action, and output: selection changes weights over
  types; intervention changes action/output at fixed type.
- Reward gaming and reward misspecification work match the intervention/gaming
  framing in ML (`skalse2022rewardgaming`, `pan2022rewardmisspecification`).

Survived only barely:
- The minimum-complexity attractor story has suggestive cousins in simplicity
  bias, spectral bias, and minimum-description-length intuitions, but this is
  still analogy rather than direct correspondence.
- Value-weighted susceptibility corresponds to common sense in incentives and
  safety, but empirical measurement of "value importance" is itself a hard
  problem.

Killed:
- Any claim that selection-channel bounds explain causal/adversarial Goodhart in
  the wild. Real cases often involve behavior change; baseline-only drift bounds
  should not be presented as the main empirical story.

Verdict at this layer: the selection/intervention split and incentive-exchange
rate framing correspond to known phenomena. The recursive and attractor claims
remain speculative.

## Layer 3: simulation

Passed or ready:
- Linear-Gaussian threshold selection can verify that hidden drift depends on
  the response/coupling vector, not hidden dimension alone.
- Non-Gaussian threshold examples can verify that covariance can vanish while
  threshold response is nonzero.
- Weighted/Boltzmann selection can verify that hidden drift is the integral of
  pathwise covariance on the finite-mgf domain, not baseline covariance; a
  heavy-tail case should verify that the Boltzmann path can fail to exist.
- Quadratic Stackelberg gaming can verify Proposition 2, the intervention band
  `Delta = sqrt(2 kappa V)`, and show why agent cost geometry, not baseline
  variance, controls intervention harm.
- Additive vs. conjunctive multidimensional gaming can verify the aggregation
  rule contrast.
- Convex-cost versus welfare-bound examples can compare `m(d)`,
  cost-minimizing realized harm `ell(a^*(d))`, and
  `W_ell(d,V) = sup { ell(a): c(a) <= V, w . a >= d }` under the same action
  geometry while varying the declared harm functional.
- Iteration 20 executable checks passed in
  `research/simulations/iteration20_selection_intervention.py`: linear-Gaussian
  threshold drift matched the Gaussian prediction; zero-covariance nonlinear
  threshold response was nonzero; Boltzmann normal tilting matched `beta^2`
  while Pareto exponential normalizers grew under truncation; declared value
  vectors changed scalar selection drift; the single-channel wedge flipped at
  `Delta = sqrt(2 kappa V)`; multichannel quadratic water-filling matched
  `m(d)`; noisy Stackelberg response produced a smooth interior action; and
  `ell(a^*(d))` differed from `W_ell(d,V)`.

Survived only barely:
- Adaptive hardening dynamics needs simulation before theorem work. The cheap
  toy simulation should show whether hardening the most-gamed channel converges,
  cycles, or is dominated by committing to a narrow hard-to-game metric.
- Population-vs-per-agent welfare needs simulation with heterogeneous quality
  `Q`, noise, and endogenous `V`; otherwise the framework will keep sliding
  between welfare objects.

Killed if simulation shows:
- Dimensional drift grows without coupling assumptions in the selection model.
  That would contradict the current derivation and indicate a bug in the model.
- Additive conservation persists under arbitrary `h_j/w_j`; the weighted
  exchange-rate derivation says it should not.
- Adaptive hardening always helps even when it expands the attack surface or
  lowers effective gaming cost; that would weaken the current regulator-policy
  story.
- A proposed minimum-complexity attractor vanishes under simple alternative
  complexity measures. Then the attractor claim is not well-posed yet.

Verdict at this layer: selection response, intervention bands, and aggregation
effects are at simulation/toy-model verification. Adaptive dynamics,
population welfare, and attractors should not move to implementation before
small simulations kill or sharpen them.

## Layer 4: implementation

Passed or plausible:
- An empirical selection-channel test can be run on fixed historical data:
  choose a proxy score, pre-specify hidden outcomes, compare baseline hidden
  distribution to selected or weighted subsets, and estimate response curves
  `E[H | P >= t] - E[H]`.
- An intervention-channel test needs a real policy or experiment where agents
  can change features after a metric is announced. The minimal viable test is a
  controlled scoring environment with manipulable features and observed hidden
  quality.
- An ML implementation could map proxy dimensions to benchmark/reward-model
  features, perturb which dimensions are measured, and measure whether failures
  move into cheaper or less represented hidden dimensions.

Survived only barely:
- Value-weighted susceptibility requires a defensible value gradient or proxy
  for value importance. Without pre-registration of that value weighting, the
  test becomes post hoc.
- Recursive Goodhart requires successive proxy patches and pre-specified hidden
  dimensions. It cannot be tested by looking after the fact for whatever got
  worse.

Killed if implementation shows:
- Hidden outcomes improve along with measured proxies under successive proxy
  repair, with no systematic movement into less legible or cheaper dimensions.
- The cheapest route to high score is consistently also goal-improving.
- Selection-response estimates are unstable across small threshold changes or
  dominated by unmeasured confounding, making the proposed response primitive
  practically unusable for the domain.

Verdict at this layer: implementation is premature for the recursive hypothesis
and value-weighted susceptibility. It is reasonable for narrow selection
response estimation and for controlled intervention/gaming environments.

## Current question map

| Question cluster | Current cheapest live layer | Candidate verification | Failure condition |
| --- | --- | --- | --- |
| Dimensional dependence and harm functional (`Q1-Q3`) | Simulation | Linear-Gaussian and non-Gaussian threshold models; compare signed drift, normed drift, squared loss, tail risk, regret | Drift tracks dimension count without coupling, or conclusions depend entirely on arbitrary harm units |
| Selection-response primitive (`Q6-Q9`) | Simulation | Compare covariance, threshold response, and weighted response on Gaussian, heavy-tailed, and nonlinear examples; explicitly test finite-mgf versus infinite-mgf Boltzmann cases | Baseline covariance predicts finite-pressure hidden drift across examples, or covariance velocity is used outside `B = { beta : E_mu[exp(beta P)] < infinity }` |
| Pareto selection and identifiability (`Q5`) | Thought experiment -> simulation | Construct two distributions with same observed Pareto frontier but different hidden dimensions; then simulate compression | Pareto selection preserves enough diversity to identify hidden response in the intended regimes |
| Selection vs. intervention boundary (`Q8`, `Q12`) | Thought experiment -> real-world correspondence | Classify toggle-only, feature-changing, manifold-constrained, and `P`-only manipulation agents | A feature-changing agent can always be represented as harmless reweighting of baseline data |
| General intervention bound (`Q10`) | Simulation passed for core toys; further simulation for broader variants | Iteration 20 verified the quadratic wedge, multichannel quadratic water-filling, noisy Stackelberg response, and convex-cost versus welfare-bound separation; later variants can add linear and elastic-net-like costs | Bound depends on baseline divergence rather than cost geometry, convex affordability is mistaken for a welfare bound without hidden value weights, `ell(a^*(d))` is conflated with `W_ell(d,V)`, or the convex formula is imported into non-convex ML/RLHF without a local response model |
| Response-modeling contract (`Q19`) | Thought experiment -> application mapping | Apply the contract to one ML-eval case and one institutional scorecard; identify `U`, `W_theta`, `K_theta`, actions, costs, aggregation, hidden harm, and discriminating evidence | The contract cannot distinguish nearby mechanisms, or reduces to a generic checklist with no downstream calculation |
| Multidimensional gaming and conservation (`Q13`, `Q16`, `Q17`) | Simulation | Weighted additive, conjunctive, heterogeneous-population, noisy-threshold models | Harm sign is determined by dimension count alone; exchange rates and population entry do not matter |
| Adaptive hardening (`Q14`) | Simulation | Repeated game where principal hardens the currently most-gamed channel; compare to static commitment | Dynamics cycle, increase attack surface, or lose to static narrow hardening |
| Measurement frontier (`Q15`) | Thought experiment -> simulation | Construct signal-value vs. attack-surface frontier over measured sets `M` | Frontier is vacuous because all informative metrics are safe or all safe metrics are uninformative only by assumption |
| Value-weighted susceptibility | Proposition sketch -> real-world correspondence | Propositions 1 and 1' give the coordinate-explicit and scalar/operator selection bounds; test whether declared value weighting changes rankings relative to SVD/PCA on known proxy-failure examples | Value weights are unavailable or arbitrary enough to make the scalar post hoc |
| Minimum-complexity / recursive attractor (`Q4`, `Q18`, Appendix G) | Thought experiment -> simulation | Predefine complexity measure and hidden axes; compare unconstrained and active-face quadratic, fixed-charge, sparse, capped, and low-rank response geometries | Attractor tracks cost/search geometry rather than complexity, the `C w` formula is used despite binding sign constraints, or "complexity" changes under harmless representation changes |

## Iteration 7: Q18 verification pass

Idea: proxy pressure induces hidden drift toward the minimum-complexity feasible configuration.

Layer 1: thought experiments

Passed:
- Sparse cheap exploit: if one hidden route has low activation cost and high proxy yield, optimization repeatedly uses it. This supports a conditional attractor mechanism.
- Fixed-charge/linear costs: with target `sum w_j a_j >= d`, no caps, and objective `sum F_j 1{a_j > 0} + sum q_j a_j`, the optimum uses a single cheapest channel `argmin_j (F_j + d q_j/w_j)`. This gives a toy sparse-attractor model.

Survived only barely:
- "Simple" can mean low support, low rank, short description, or high prior probability. These agree in some examples and disagree in others.
- A diffuse vector like `(1,...,1)` is high support but short description under a symmetric representation. Complexity claims require a fixed representation or an invariant complexity measure.

Killed:
- The unconditional Q18 claim. Selection follows baseline tail response and can shift all hidden coordinates diffusely. Unconstrained/interior quadratic intervention follows `a^* = d C w/(w^T C w)`, but sign constraints require active-face solutions. Proxy pressure alone does not select minimum complexity.

Layer 2: real-world correspondence

Passed:
- Some ML and evolutionary literatures plausibly support simplicity-biased search or parameter-function maps [guess], which could instantiate the missing mechanism.
- Institutional gaming often does concentrate on a small number of cheap loopholes, matching fixed-charge or lumpy-cost intuition.

Survived only barely:
- The same domains also contain diffuse adaptation: many small KPI optimizations, broad teaching-to-the-test changes, and smooth effort substitution. These look more like quadratic or convex cost geometry than sparse minimum-complexity attraction.

Killed:
- Directly importing ML simplicity-bias claims as a theorem about Goodhart drift. At most they motivate one possible response-channel mechanism.

Layer 3: simulation

Passed or ready:
- Compare quadratic costs, `l1`/linear costs, fixed activation costs, capped channels, and low-rank action maps under the same proxy target and complexity functional.
- Measure support size, rank/spectral concentration, description length proxy, and KL from a max-entropy feasible distribution.

Survived only barely:
- Simulation will only be meaningful after the complexity functional is fixed before seeing the outcome.

Killed if simulation shows:
- Sparse attraction disappears under minor caps/noise/detection penalties.
- Different reasonable complexity measures rank the same response geometries in opposite orders.

Layer 4: implementation

Passed or plausible:
- For ML evals, predefine exploit families or hidden failure axes and test whether benchmark optimization concentrates in a small number of simple failure modes versus diffuse degradation.

Survived only barely:
- Requires pre-specified hidden axes and complexity measures. Otherwise it becomes post hoc story-fitting.

Killed if implementation shows:
- Repeated proxy repair mostly produces broad, diffuse, or goal-improving adaptations rather than concentrated low-complexity routes, once hidden axes are pre-registered.

Verdict:
- The broad idea dies at Layer 1. The surviving claim is narrow: minimum-complexity attraction can occur when the response channel has a simplicity-biased cost geometry, search prior, or candidate-generation process. The strongest remaining objection is that "complexity" may be representation-dependent enough to make the claim non-invariant unless fixed by the application.

## Concise verdict

The repaired multidimensional Goodhart framework survives the verification stack
as a conditional mechanism map, not as a universal monotone law. Its strongest
remaining objection is that the most interesting claims -- value-weighted
susceptibility, minimum-complexity attractors, and recursive proxy repair -- may
depend on quantities that are hard to pre-specify without smuggling in the
answer: value weights, hidden dimensions, cost geometry, and complexity measure.
