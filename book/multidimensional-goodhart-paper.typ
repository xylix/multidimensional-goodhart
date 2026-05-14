// Compact paper extract from multidimensional-goodhart.typ
// Compile with:  typst compile multidimensional-goodhart-paper.typ

#set document(title: "Multidimensional Goodhart: Response Channels and Residual Shape", author: "Xylix Pelttari")
#set page(numbering: "1", margin: (x: 1.05in, y: 1in))
#set par(justify: true, leading: 0.58em)
#set text(size: 10.5pt, font: "New Computer Modern")
#set heading(numbering: "1.1")
#show raw: set text(font: "DejaVu Sans Mono", size: 0.92em)

#let claim(body) = block(
  width: 100%, inset: 7pt, radius: 3pt, fill: luma(246),
  stroke: (left: 1.5pt + luma(155)),
)[#body]
#let per = "per"
#let pop = "pop"

#align(center)[
  #text(size: 1.7em, weight: "bold")[Multidimensional Goodhart]
  #v(0.25em)
  #text(size: 1.15em)[Response Channels and Residual Shape]
  #v(0.6em)
  #text(size: 0.95em)[Kerkko 'Xylix' Pelttari]
]

#v(0.8em)

#block(inset: 8pt, fill: luma(248), radius: 3pt)[
  #text(weight: "bold")[Abstract.] Goodhart's law is often summarized as
  proxy failure under optimization. The motivating hypothesis here was more
  specific: in multidimensional proxy systems, optimizing a set of measured
  dimensions should make the remaining error directions more structured and
  perhaps more complicated. Working through selection, intervention, and
  aggregation models narrows that hypothesis. The surviving object is not a
  universal complexity law, but response-dependent error geometry: selection
  over a fixed baseline, intervention through fixed-type response, and
  multidimensional aggregation generate different distortion shapes. The useful
  transfer rule is therefore a response-modeling contract, checked against a
  literature map that treats external Goodhart, ML, and incentive results as
  primitive-specific analogues rather than generic support.
]

= Introduction: the original hypothesis

The familiar slogan is that when a measure becomes a target, it ceases to be a
good measure @goodhart1975 @strathern1997. The original research hypothesis
behind this paper was a multidimensional mathematical version of that slogan:
when a proxy system optimizes some set of measured dimensions, the error in the
remaining unmeasured or undermeasured dimensions should not merely grow. It
should acquire structure. As successive proxy dimensions are modelled, measured,
or optimized away, residual error should migrate into the other dimensions in a
more complicated geometric pattern.

In informal terms, the expectation was recursive Goodhart with geometry. A
scalar proxy leaves a residual. Adding dimensions constrains some visible
failure modes. But optimization pressure may then move into the residual degrees
of freedom that the expanded proxy still does not control. If this is right, a
multidimensional model should reveal how error becomes redistributed,
concentrated, rerouted, or made less legible as the measured coordinate set
changes.

That broad hypothesis is too elastic as stated. More dimensions do not by
themselves imply more failure. Selection over a fixed baseline is not the same
mechanism as agents changing behavior at fixed type. A compensatory scorecard
does not have the same geometry as a conjunctive one. And "more complicated"
is not a prediction until the response process and the complexity or shape
measure are fixed in advance. Scalar tail-conditioned Goodhart already has
sharp external treatments, notably El-Mhamdi and Hoang's top-$alpha$
selection analysis under target/discrepancy assumptions
@el-mhamdi2024goodhart; the contribution here is a multidimensional
response-modeling envelope and transfer rule.

The narrower result of the modelling work is therefore this: residual error has
a response-dependent geometry. The core object is not bare dimension count, but
the channel that connects optimization pressure to movement in state space.
Selection, intervention, and aggregation each impose different mathematical
constraints on the shape of residual error.

Write the target-relevant state as $G(s) in RR^m$, the proxy as
$P(s) in RR^k$, the intended proxy relation as $phi : RR^m -> RR^k$, and the
residual as $epsilon(s) = P(s) - phi(G(s))$. A proxy can fail through hidden
goal directions in $ker phi$, through proxy residuals, or through agents moving
after the score is used for control. The framework below separates those cases
by the response channel.

#claim[
  The original hypothesis was that multidimensional Goodhart pressure would
  make off-proxy error more complicated as measured dimensions are optimized.
  The licensed result is sharper and more conditional: the shape of residual
  error is governed by the declared response channel, action/search geometry,
  aggregation rule, and hidden value model.
]

= Relation to existing formulations

The literature review changes how the contribution should be stated. Goodhart's
monetary-policy warning, Campbell's social-indicator warning, and Strathern's
target/measure slogan are genealogy and motivation, not theorem statements
@goodhart1975 @campbell1979 @strathern1997. Manheim and Garrabrant's taxonomy
separates regressional, extremal, causal, and adversarial variants
@manheim2018categorizing, but a taxonomy does not by itself supply a response
channel, cost model, aggregation rule, or welfare functional.

The scalar mathematical anchor is El-Mhamdi and Hoang's top-$alpha$ selection
analysis under a target/discrepancy split @el-mhamdi2024goodhart. Their
theorems give sharp tail-conditioned asymptotics under independence and named
tail families. The selection bound below is different: it is a looser
chi-square envelope for arbitrary baseline dependence and declared hidden
coordinates. Majka and El-Mhamdi's independence-free scalar formalization is the
closest external neighbor to that independence stance, but it remains scalar
and discrepancy-structured @majka2025goodhart. Smith and Winkler's optimizer's
curse is a precursor selection-bias inequality, not an intervention or welfare
model @smith2006optimizerscurse.

The late-stage formal-analogue map gives the same discipline for ML and
economics results. Lucas's critique and performative prediction support the
idea that policy can change the data-generating response channel
@lucas1976critique @perdomo2020performative. Strategic classification gives an
action-cost analogue of fixed-type response @hardt2016strategic.
Holmstrom--Milgrom multitask incentives are the closest economics-side
precedent for measured-task substitution and aggregation geometry
@holmstrom1991multitask. Skalse et al.'s reward-hacking result is a
proxy/target primitive, not a welfare or action-geometry theorem
@skalse2022rewardgaming. None of these sources is used below as generic
authority; each maps to a primitive and carries a non-transfer boundary.

= Selection channels

In a pure selection channel, the policy reweights a fixed baseline law. Let
$(S, cal(F), mu)$ be the baseline space, $H : S -> RR^d$ hidden coordinates, and
$P : S -> RR$ the scalar proxy. A selection policy has nonnegative weight
$W_theta$ with finite positive expectation, likelihood ratio
$L_theta = W_theta / EE_mu[W_theta]$, selected law $mu_theta = L_theta mu$, and
hidden response

$ B_H(theta) = EE_(mu_theta)[H] - EE_mu[H]. $

Hard thresholds use $W_t = bb(1){P >= t}$ and define the threshold response
$b_H(t) = EE[H mid(|) P >= t] - EE[H]$. Boltzmann selection uses
$W_beta = exp(beta P)$ only on the finite-mgf domain
$cal(B) = { beta : EE_mu[exp(beta P)] < infinity }$. Where differentiation is
valid,

$ dif EE_beta[H] slash dif beta = "Cov"_beta(H, P), $

so covariance is a local velocity along a selection path, not a finite-pressure
primitive. The toy example $P = Z$, $H = Z^2 - 1$ has zero baseline covariance
but nonzero threshold and finite Boltzmann response.

The Gaussian threshold model gives the cleanest coordinate picture. If
$X ~ cal(N)(0, Sigma)$, $P = X_1$, and $H = (X_2, dots, X_m)$, then

$ EE[H mid(|) X_1 >= t] = sigma_1 lambda(t slash sigma_1) r, $

where $r_j = "Cov"(X_j, X_1) / "Var"(X_1)$. Dimensional growth appears only if
the coupling-vector norm grows with the number of hidden coordinates; a bounded
total coupling budget blocks it.

#claim[
  *Selection bounds.* If
  $delta = norm(L_theta - 1)_(L^2(mu)) = sqrt(chi^2(mu_theta parallel mu))$
  and hidden coordinate standard deviations are $s_i$, then

  $ abs(B_(H_i)(theta)) <= delta s_i, quad
    norm(B_H(theta))_2 <= delta norm(s)_2. $

  For a declared value vector $v$,

  $ abs(Delta(v dot H)) <= delta sqrt(v^T Sigma_H v). $

  The first form is coordinate-explicit Euclidean drift. The second is
  declared value/operator drift; it is the right form when the scalar welfare
  direction is part of the model.
]

These are baseline-only claims. They stop at reweighting. They do not analyze
what fixed agents can do after a metric is announced.

= Intervention channels

Intervention begins when the policy changes behavior at fixed type. Declare a
type space $U$, baseline type law $nu$, baseline kernel $K_0(d s mid(|) u)$,
participation weights $W_theta(u)$, and policy-indexed response kernels
$K_theta(d s mid(|) u)$. The induced law is

$ mu_theta(A) =
  (integral W_theta(u) K_theta(A mid(|) u) nu(d u))
  slash
  (integral W_theta(u) nu(d u)). $

Pure selection relative to $(U, K_0)$ has $K_theta = K_0$ almost everywhere and
all policy dependence in $W_theta$. Intervention has $K_theta != K_0$ on a
positive-mass set of types. Mutual singularity with baseline is sufficient
evidence that baseline-only selection fails, but it is not the definition:
absolute continuity can survive when the baseline already contains epsilon mass
on the response image.

The smallest algebraic intervention toy is a Stackelberg threshold game. An
agent has true quality $Q$, can choose action $a >= 0$, receives score $Q + a$,
passes if $Q + a >= t$, gains prize $V$, and pays cost $a^2/(2 kappa)$. In the
noiseless case, agents with $Q in [t - Delta, t)$ game just enough to pass, with

$ Delta = sqrt(2 kappa V). $

The wedge is controlled by ease of gaming and stakes, not by baseline
covariance. It is a toy signature of quadratic threshold gaming, not a law of
neural training or RLHF.

#figure(
  image("figures/appendix-b-selection-vs-intervention.pdf", width: 92%),
  caption: [
    Selection reweights fixed support; intervention transports fixed types into
    new states. The distinction is why the selection-channel drift bound has no
    baseline-only analogue for intervention channels.
  ],
) <fig:paper-selection-vs-intervention>

For a more general local intervention budget, declare an action $a$, convex
cost $c(a)$, linear score gain $w dot a$, and score deficit $d$. The score-deficit
cost is

$ m(d) = sup_(lambda >= 0) [lambda d - c^*(lambda w)], $

under the usual finite-dimensional convex regularity. Gaming the deficit is
privately feasible when $m(d) <= V$. This is not a welfare bound until a hidden
harm functional has also been declared.

= Multidimensional scorecards

Adding measured dimensions has no sign by itself. In an additive scorecard with
measured set $M$, separable quadratic costs
$sum_(j in M) a_j^2/(2 kappa_j)$, score $sum_(j in M) w_j a_j$, and hidden harm
$sum_(j in M) h_j a_j$, the cost-minimal action for fixed deficit $d$ is

$ a_j^* = d kappa_j w_j slash W_M, quad
  W_M = sum_(i in M) kappa_i w_i^2, $

and fixed-deficit per-agent harm is

$ H_per(M, d) =
  d dot (sum_(j in M) h_j kappa_j w_j)
    slash (sum_(j in M) kappa_j w_j^2). $

Thus $H_per(M,d)$ is conserved across active measured sets if and only if
$h_j = c w_j$ on the channels being compared. In the unit-weight equal-harm
case, re-routing conserves fixed-deficit per-gamer harm, but increasing the
aggregate gaming capacity can expand entry and raise population harm
$H_pop(M, F_Q, V)$.

#figure(
  image("figures/appendix-c-welfare-objects.pdf", width: 92%),
  caption: [
    In the unit-weight equal-harm additive model, feasible fixed-deficit
    $H_per(d)$ curves coincide, while $H_pop$ grows as gaming capacity expands
    the profitable deficit band.
  ],
) <fig:paper-welfare-objects>

A conjunctive scorecard flips the per-gamer comparison. If passing requires
$a_j >= t$ for every $j in M$, then
$H_per^"conj"(M,t) = t abs(M)$ under equal harm. The population sign still
depends on entry, because the cost of passing also rises. The contrast is the
point: aggregation and exchange rates determine the distortion geometry.

= Response-modeling contract and MMLU

The surviving framework is methodological. A claim should declare: type space,
baseline behavior, policy exposure, response channel, action/search geometry,
proxy and target, aggregation rule, hidden harm, and evidence standard. This
contract is the transfer rule for applications. Domains do not inherit toy
bounds by analogy; they inherit the obligation to declare the primitives that
make a calculation or falsifier meaningful.

MMLU is a useful worked example because one score can support several different
channels @hendrycks2021mmlu. Selecting among fixed checkpoints is a selection
claim over candidates and may use $W_theta$ plus declared hidden value weights.
Finetuning, prompt search, contamination, synthetic data filtering, and
reward/proxy optimization are response-kernel claims and require $K_theta$ plus
action/search geometry. Model-selection overfitting @cawley2010overfitting,
adaptive holdout reuse @dwork2015generalization, strategic classification
@hardt2016strategic, performative prediction @perdomo2020performative, and
reward-model overoptimization @gao2023rewardmodeloveroptimization are nearby
formal warnings, but none by itself supplies $kappa$, $V$, a convex cost, or a
welfare functional.

#claim[
  MMLU is Layer-2 application discipline, not empirical proof. It shows how the
  contract separates fixed-checkpoint selection from finetuning/search/
  contamination/reward-proxy mechanisms. It does not license Stackelberg,
  convex-cost, RLHF, or welfare bounds without additional primitives and
  falsifiers.
]

= Open problems

Several problems remain deliberately open.

- *Welfare-bound packaging.* Convex private affordability and realized
  cost-minimizing harm are distinct from worst-case welfare bounds for a
  declared hidden-harm functional.
- *Endogenous value and stakes.* $V$ may depend on observed gaming, trust,
  institutional response, or future proxy repair.
- *Adaptive hardening.* Hardening the currently exploited channel may converge,
  cycle, or expand the attack surface; it needs dynamic models.
- *Empirical implementation.* Applications need repeated-type observations,
  randomized or staggered exposure, action traces, cost variation, or
  pre-registered hidden outcomes.
- *Non-convex ML and RLHF mappings.* Gradient accessibility, benchmark
  contamination, reward-model simplicity, and optimizer search are not
  interchangeable substitutes for $kappa$ or convex costs.

Iterations 20--21.1 provide deterministic Layer-3 checks for the toy regimes:
linear-Gaussian and nonlinear selection response, finite-mgf Boltzmann behavior,
declared value vectors, the Stackelberg wedge, quadratic water-filling, noisy
response diagnostics, welfare-bound separation, active-face quadratic repairs,
capped fixed-charge switches, and additive/conjunctive population checks. They
are toy checks of the framework's bookkeeping, not empirical confirmation of a
general Goodhart law.

#bibliography("refs.bib", title: "References", style: "association-for-computing-machinery")
