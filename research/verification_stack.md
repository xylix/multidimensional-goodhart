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
- Additive vs. conjunctive scorecards: adding dimensions has opposite effects
  depending on aggregation. This killed dimension-count-only intervention
  claims.

Survived only barely:
- "Conservation Goodhart" survives only as an exchange-rate statement:
  fixed-deficit per-agent harm is conserved under additive re-routing when
  channels are equally harmful per score unit. Unequal weights, unequal harm
  rates, population entry, or partially real improvements can flip the result.
- The recursive hypothesis survives only as a hypothesis about pre-specified
  hidden dimensions and costs/legibility. Without that, it is too elastic.

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
  pathwise covariance, not baseline covariance.
- Quadratic Stackelberg gaming can verify the intervention band
  `Delta = sqrt(2 kappa V)` and show why agent cost geometry, not baseline
  variance, controls intervention harm.
- Additive vs. conjunctive multidimensional gaming can verify the aggregation
  rule contrast.

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
| Selection-response primitive (`Q6-Q9`) | Simulation | Compare covariance, threshold response, and weighted response on Gaussian, heavy-tailed, and nonlinear examples | Baseline covariance predicts finite-pressure hidden drift across examples |
| Pareto selection and identifiability (`Q5`) | Thought experiment -> simulation | Construct two distributions with same observed Pareto frontier but different hidden dimensions; then simulate compression | Pareto selection preserves enough diversity to identify hidden response in the intended regimes |
| Selection vs. intervention boundary (`Q8`, `Q12`) | Thought experiment -> real-world correspondence | Classify toggle-only, feature-changing, manifold-constrained, and `P`-only manipulation agents | A feature-changing agent can always be represented as harmless reweighting of baseline data |
| General intervention bound (`Q10`) | Simulation/theorem sketch | Replace quadratic costs with convex costs; check whether Fenchel conjugates give the right gaming budget | Bound depends on baseline divergence rather than cost geometry, or fails for simple convex costs |
| Multidimensional gaming and conservation (`Q13`, `Q16`, `Q17`) | Simulation | Weighted additive, conjunctive, heterogeneous-population, noisy-threshold models | Harm sign is determined by dimension count alone; exchange rates and population entry do not matter |
| Adaptive hardening (`Q14`) | Simulation | Repeated game where principal hardens the currently most-gamed channel; compare to static commitment | Dynamics cycle, increase attack surface, or lose to static narrow hardening |
| Measurement frontier (`Q15`) | Thought experiment -> simulation | Construct signal-value vs. attack-surface frontier over measured sets `M` | Frontier is vacuous because all informative metrics are safe or all safe metrics are uninformative only by assumption |
| Value-weighted susceptibility | Thought experiment -> real-world correspondence | Test whether value weighting changes rankings relative to SVD/PCA on known proxy-failure examples | Value weights are unavailable or arbitrary enough to make the scalar post hoc |
| Minimum-complexity / recursive attractor (`Q4`, `Q18`, Appendix G) | Thought experiment | Predefine complexity measure and hidden axes; ask whether plausible counterexamples route residuals into high-complexity or goal-improving paths | No invariant notion of "minimum complexity" survives simple representation changes |

## Concise verdict

The repaired multidimensional Goodhart framework survives the verification stack
as a conditional mechanism map, not as a universal monotone law. Its strongest
remaining objection is that the most interesting claims -- value-weighted
susceptibility, minimum-complexity attractors, and recursive proxy repair -- may
depend on quantities that are hard to pre-specify without smuggling in the
answer: value weights, hidden dimensions, cost geometry, and complexity measure.
