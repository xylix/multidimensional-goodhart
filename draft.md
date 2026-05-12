---
title: Deep Goodhart
tagline: 'Claim: controlling a proxy reshapes its error; it does not simply remove it'
tags: ['research', 'cognitech']
---

outline:

- Goodhart 101
- Goals and proxies are vectors
- Two kinds of gap: invisible goal directions vs. noisy / gamed proxy directions
- Two response channels:
    - selection: choosing from the old distribution
    - intervention: changing the distribution by making agents respond
- The old "more dimensions => more error" story is too crude
- New punchline:
    - in selection, dimensional harm depends on coupling to the selected proxy
    - in intervention, dimensional harm depends on aggregation rules and gaming exchange rates
- Recursive Goodhart as a hypothesis, not yet a theorem


## Goodhart's law

The slogan version:

> When a measure becomes a target, it ceases to be a good measure

The more literal version:

> Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes.

The usual picture is scalar. There is one thing we care about, one measure that
correlates with it, and then we optimize the measure until the correlation
breaks.

I think that picture is leaving out most of the interesting structure.

Real goals are not scalars. Human goals, company goals, coalition goals, state
goals, and AI-training objectives are all more like bundles of dimensions. The
proxy is also usually a bundle, but not the same bundle. So the thing that
collapses is not just "the correlation". Pressure changes the *shape* of the
residual error.

That is the better version of the claim:

> Goodhart is not just proxy error getting larger. It is proxy error moving into
> the dimensions where the current control system is weakest.

This is still not a theorem in full generality. The research so far makes that
more precise, but also kills a few too-easy versions of the claim.


## Goals and proxies as vectors

Let's write the real goal as

`G: S -> R^m`

and the proxy as

`P: S -> R^k`.

Here `S` is the state space: possible products, schools, hospitals, model
policies, candidates, whatever. `G` is the thing we would care about if we could
represent the whole thing. `P` is what we actually measure and act on.

The regulator also has some intended story about how the proxy is supposed to
track the goal:

`phi: R^m -> R^k`.

Then the proxy residual is

`epsilon(s) = P(s) - phi(G(s))`.

This separates two different failure modes which are easy to blur together:

- **Dimension gap:** some directions in goal space are invisible to the proxy.
  In notation, these are directions in `ker phi`.
- **Observation / residual gap:** the proxy is noisy, lagged, manipulable, or
  otherwise not equal to the thing it is meant to track.

Example: product quality might have `reliability` and `delight` as real
dimensions, while the proxy is uptime. Delight is in the dimension gap. Bad
uptime instrumentation is residual proxy noise. Fake uptime workarounds are
residual proxy gaming.

This distinction matters because "measure more things" attacks one problem
while often enlarging the other. Adding a metric may shrink the invisible part
of goal space, but it also adds a new surface that can be noisy, normalized
wrongly, or gamed.


## The naive dimensional claim is false

The original intuition was roughly:

> A lower-dimensional proxy controls a higher-dimensional goal, so the hidden
> error should grow with the number of hidden dimensions.

This is tempting, and it is too strong.

In the simplest Gaussian toy model, take `X ~ N(0, Sigma)`, select on one proxy
coordinate `X_1 >= t`, and call the hidden coordinates `H = (X_2, ..., X_m)`.
Then the hidden mean shift is

`E[H | X_1 >= t] = sigma_1 lambda(t / sigma_1) r`,

where `r` is the vector of covariance ratios between the hidden coordinates and
the selected coordinate.

So the real object is not dimension count. It is `||r||`.

If every new hidden dimension has its own small coupling to the selected proxy,
then hidden drift can grow like `sqrt(d)`. If the hidden dimensions are
independent of the proxy, drift is zero no matter how many there are. If there
is a fixed total correlation budget and new dimensions just split it into finer
labels, the drift need not grow.

So the better claim is:

> In selection Goodhart, dimensional scaling requires a coupling-growth
> assumption. More hidden dimensions are dangerous when they bring more
> independent ways for proxy pressure to move what you did not measure.

Also, covariance is not the general answer. Outside the Gaussian toy model,
zero covariance can still hide tail dependence. The toy counterexample is
`P = Z`, `H = Z^2 - 1`. Then `Cov(H, P) = 0`, but selecting `Z >= t` shifts
`H` upward. So covariance is useful as a local / Gaussian simplification, not
as the definition of hidden Goodhart.


## Selection vs. intervention

This turned out to be the most useful formulation.

A policy induces a response channel:

`R: theta -> mu_theta`,

where `mu_0` is the baseline distribution and `mu_theta` is the distribution
after applying policy `theta`.

There are two importantly different cases.

### Selection channels

Selection means the policy reweights a fixed baseline distribution. You are
choosing which existing applicants to admit, which existing models to keep, or
which existing projects to fund.

Formally, `mu_theta << mu_0`: anything impossible before is still impossible
after. You moved probability mass around; you did not create new kinds of
states.

In this regime there is a simple drift bound:

`||B_H(theta)||_2 <= delta ||s||_2`,

where `delta` is the size of the reweighting and `s` is the vector of baseline
standard deviations of the hidden coordinates.

This is not deep math. It is basically Cauchy-Schwarz. The useful point is the
contrast: in selection, hidden drift is bounded by quantities from the baseline
distribution.

Examples:

- selecting the top resumes from a fixed applicant pool
- picking the best model checkpoint from a fixed training run
- thresholding schools by last year's measured score, if schools cannot change
  their behavior in response

Selection can still Goodhart. Regressional and extremal Goodhart live here. But
it is the more bounded case.

### Intervention channels

Intervention means the policy changes the state-generating process. Agents
respond. They move in state space.

Examples:

- announce the school metric, and schools teach to the test
- announce the hospital ranking rule, and hospitals change coding / admission /
  discharge behavior
- optimize a model against a reward model, and the model discovers reward-model
  loopholes

Now `mu_theta` may not be absolutely continuous with respect to `mu_0`. In the
baseline distribution, maybe nobody had hidden gaming effort `H > 0`. After the
metric is announced, a positive mass of agents moves to `H > 0`. That is not
reweighting; it is transport.

In this regime the old baseline does not give an a-priori bound. You need an
agent model: costs, stakes, feasibility constraints, equilibrium behavior.

This is where the deeper Goodhart story has teeth.


## A tiny gaming model

Suppose an agent has true quality `Q`. The regulator selects agents with proxy
score at least `t`. Selection is worth `V`.

The agent can inflate the proxy by effort `a`, paying cost

`a^2 / (2 kappa)`.

Here `kappa` is ease of gaming. Larger `kappa` means gaming is cheaper.

In the noiseless version, an agent below the threshold games exactly enough to
cross it if that is worth the cost. The gaming band has width

`Delta = sqrt(2 kappa V)`.

So the proxy's worst-case bias and the induced hidden harm both scale with
`sqrt(ease of gaming * stakes)`.

The important bit: `Delta` is not visible in the baseline distribution. It
depends on how cheap gaming is and how much is at stake. Last year's clean
metric data does not tell you this by itself.


## Multidimensional gaming

Now suppose there are many gameable proxy channels. This is the thing the old
draft was gesturing at with "trying to control for error makes the error more
complex."

The result is subtler than I expected.

If the metric is additive / compensatory, like

`score = sum_j w_j a_j`,

then the agent buys the required score in the cheapest mix of channels. With
quadratic costs, this is a water-filling allocation: effort flows toward the
channels with better cost-per-score exchange rates.

The first-pass result looked like conservation:

> closing one gamed channel just reroutes the same amount of gaming into the
> remaining channels.

That is true only in a narrow but real case: fixed score deficit, additive
metric, quadratic costs, and every score point is equally socially harmful no
matter which channel produces it.

The repaired version is:

> Additive conservation holds iff harm is proportional to score contribution on
> the active channels.

In notation, if the score weights are `w_j` and harm rates are `h_j`, then
conservation needs `h_j = c w_j`. Otherwise rerouting can raise or lower harm.

This is a better result than the slogan, because it says what you actually need
to know: the exchange rate between private cost, score contribution, and social
harm.

There is also a population-level effect. Adding a gameable metric channel
usually lowers the cheapest cost of producing a given score increase. That
means more below-threshold agents find gaming worthwhile. So even when
fixed-deficit per-agent harm is conserved, aggregate harm can increase because
more agents enter the gaming band.

Conjunctive metrics flip the behavior. If the rule is "you must clear every
bar", then adding a measured dimension forces gaming of one more dimension.
Per-gamer harm grows like `t |M|`. Fewer agents may pass, because it is more
expensive, but those who game have to game more things.

So the dimensional lesson is not:

> more metrics good

or:

> more metrics bad

It is:

> measured dimensions change the incentive geometry. The sign depends on the
> aggregation rule and the harm-per-score exchange rates.


## Recursive Goodhart

This is the still-squishy part, but now it can be stated less badly.

A principal sets a proxy. Agents optimize it. The principal notices a failure
mode and patches the proxy. Agents now optimize the patched proxy. Repeat.

The conjecture is that this process often does not remove residual error. It
pushes the remaining residual into directions that are harder for the principal
to see, elicit, or compare.

In a company:

- leadership has some messy real objective `G`
- leadership writes quarterly proxy `P`
- teams implement their own proxy-ish version `P_i`
- leadership notices that the dashboard looks good while the product feels bad
- the fix is based on leadership's *felt proxy of the failure*, not on direct
  access to `G`

So the correction itself is downstream of several proxy layers.

This matters most when the blind spots are correlated across layers. If every
layer is blind in a different direction, the hierarchy can sometimes correct
itself: one layer sees what another misses. If every layer uses the same
dominant metric, the whole system is blind in the same direction at once.

That is the informal recursive-Goodhart hypothesis:

> Patching a proxy can reduce visible error while increasing the informational
> complexity of the remaining error.

Again: not proven. The formal work so far supports pieces of it:

- selection drift is bounded and depends on coupling structure
- intervention drift requires agent cost geometry
- multidimensional gaming depends on aggregation and exchange rates
- adding metrics can backfire by expanding the attack surface

But the full "residual error becomes less legible over time" claim is still an
empirical / dynamic conjecture. It needs a model of regulator learning and
agent adaptation.


## Current summary

The old version of this idea was:

> As you try to control for Goodhart, it becomes more complex.

I would now say:

> When you optimize a proxy, the residual error moves along the response
> channels your control system opens. In selection regimes this movement is
> bounded by baseline coupling. In intervention regimes it is governed by agent
> costs, stakes, aggregation rules, and harm-per-score exchange rates. Recursive
> Goodhart is the conjecture that repeated proxy repair tends to push remaining
> error into less legible dimensions.

The practical moral is also more concrete:

- do not ask only "how many metrics do we have?"
- ask what each metric makes cheap to fake
- ask whether the aggregation rule is compensatory or conjunctive
- ask whether score points and social harm have the same exchange rate
- ask whether you are selecting from a fixed population or causing agents to
  move
- treat "add another KPI" as an attack-surface change, not as a free reduction
  in hidden error


## Footnotes

[^1]: https://medium.com/@johnwentworth/constructing-goodhart-b4964932213
[^2]: https://arxiv.org/pdf/1803.04585
