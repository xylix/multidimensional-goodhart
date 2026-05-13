// Multidimensional Goodhart — draft of Chapters 1–4
// Compile with:  typst compile multidimensional-goodhart.typ
//
// Source material: research/formalization.md, research/threads/*.md,
// research/iteration_log.md, draft.md (this repo). This is an *expository*
// rewrite of the research-journal content; the journal's iteration history
// is preserved in remarks/footnotes rather than in the main text.

#set document(title: "Multidimensional Goodhart", author: "Kerkko 'Xylix' Pelttari")
#set page(numbering: "1", margin: (x: 1.4in, y: 1.2in))
#set par(justify: true, leading: 0.62em)
#set text(size: 11pt, font: "New Computer Modern")
#set heading(numbering: "1.1")
#show raw: set text(font: "DejaVu Sans Mono", size: 0.92em)

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(1.2em)
  text(size: 1.4em, weight: "bold")[#it]
  v(0.6em)
}

// ---- small environments -----------------------------------------------------
#let claim(body) = block(
  width: 100%, inset: 8pt, radius: 3pt, fill: luma(245),
  stroke: (left: 2pt + luma(160)),
)[#body]
#let remark(body) = block(width: 100%, inset: (left: 10pt))[
  #text(style: "italic")[Remark.] #body
]
#let wip(body) = block(width: 100%, inset: 8pt, radius: 3pt,
  fill: rgb(235, 245, 255), stroke: (left: 2pt + rgb(70, 130, 200)))[
  #text(weight: "bold")[In progress.] #body
]
#let openq(body) = block(width: 100%, inset: 8pt, radius: 3pt,
  fill: rgb(255, 250, 235), stroke: (left: 2pt + rgb(210, 170, 60)))[
  #text(weight: "bold")[Future question.] #body
]

#align(center)[
  #v(2cm)
  #text(size: 2.1em, weight: "bold")[Multidimensional Goodhart]
  #v(0.4cm)
  #text(size: 1.2em)[How controlling for a proxy reshapes, rather than removes, its error]
  #v(1cm)
  #text(size: 1em)[Working draft — Chapters 1–4]
  #v(0.3cm)
  #text(size: 0.95em, style: "italic")[#datetime.today().display()]
]
#v(2cm)

#outline(depth: 2, indent: auto)

// =============================================================================
= Goodhart's law, multidimensionally
// =============================================================================

== The shape of the problem

Goodhart's law is usually quoted in one of two forms. The popular slogan,
which is actually Strathern's compression @strathern1997:

#quote(block: true)[When a measure becomes a target, it ceases to be a good measure.]

and Goodhart's own statement @goodhart1975:

#quote(block: true)[Any observed statistical regularity will tend to collapse once pressure
is placed upon it for control purposes.]

Both are stated about a *scalar* measure: a single number that was correlated
with something we cared about, until we started optimising it. The thesis of
this book is that the scalar framing hides most of the structure. Real goals —
the goals of a person, a team, a company, a state, or a trained model — are
*multidimensional*, and the proxies we use to steer toward them are
multidimensional too, usually with a different (and smaller) set of dimensions.
Once that is taken seriously, "the regularity collapses" is replaced by a more
precise and more useful question: *how does pressure on a proxy reshape the
distribution of its residual error?*

The answer depends on the channel. In a *selection* regime, the policy reweights
a fixed baseline distribution; hidden drift is governed by the baseline response
of hidden coordinates to the selected proxy, and dimensionality matters only
through coupling and variance structure. In an *intervention* regime, agents
respond; the response kernel changes at a fixed underlying type, so mass can
move to states the old baseline assigned little or no probability. The drift is
governed by cost geometry, stakes, and available gaming channels. A
broader recursive-Goodhart hypothesis is that repeated proxy refinement often
pushes the remaining error into dimensions that are less legible to the
evaluator. This book treats that as a hypothesis suggested by the framework, not
as a theorem of the framework.

So there are three layers to keep separate. First, the formal chapters prove or
derive toy results about selection response, baseline drift bounds,
intervention channels, and multidimensional gaming. Second, those models imply
conditional design lessons: additive scorecards, conjunctive scorecards, and
different harm-per-score exchange rates behave differently. Third, the
recursive story — that residual error may migrate into less-monitored or
harder-to-elicit dimensions as the proxy stack is patched — is an empirical
conjecture. The job of these first chapters is to make all three layers
statable without pretending they have the same epistemic status.

#remark[*Licensed claims.* These chapters license four narrow uses. First, when
pressure only reweights a fixed baseline distribution, the right quantities are
selection-response functionals of that baseline: covariance locally, threshold
response in the tails, and a chi-square drift budget for bounded selection.
Second, when agents can change the state-generating process, the drift budget is
not a baseline statistic; in the quadratic Stackelberg toy model it is
$sqrt(2 kappa V)$, a function of gaming ease and stakes. Third, for intervention
channels with compensatory additive scores and separable quadratic gaming
costs, adding an independently gameable measured dimension increases aggregate
gaming capacity $K_M$, lowers the minimum cost of clearing a fixed score gap,
and weakly expands the population of agents for whom gaming pays. These claims
are meant for designing scorecards, benchmarks, and evaluation suites. Fourth,
proxy pressure does not generically select a minimum-complexity residual; a
response-shape prediction needs a named response geometry, constraint set, and
complexity or shape measure. These claims do not prove the recursive-Goodhart
hypothesis, do not say that "more metrics is worse" as a rule, and do not
generalize automatically to RLHF or other non-convex training dynamics.]

The starting point is the variant taxonomy of Manheim and Garrabrant
@manheim2018categorizing — regressional, extremal, causal, and adversarial
Goodhart — and Wentworth's geometric reconstruction of the regressional case
@wentworth2018constructing, plus Wentworth's later warning that experiments and
metrics often measure a different latent quantity than their designers think
they do @wentworth2022notmeasuring. The economic ancestor is the multitask
principal-agent line: Holmstrom and Milgrom's canonical model of measurable and
unmeasurable tasks @holmstrom1991multitask, Baker's performance-measurement
model @baker1992incentive, and Prendergast's survey of incentive provision
@prendergast1999provision. In AI safety, the closest formal neighbours are
reward gaming and misspecification models @skalse2022rewardgaming
@pan2022rewardmisspecification and the partial-objective model of misaligned AI
@zhuang2020consequences. The contribution here is to put these literatures in
one frame: the Goodhart taxonomy supplies the failure modes, strategic
classification and performative prediction supply adaptive distribution shift,
principal-agent theory supplies substitution toward measured tasks, and the
selection/intervention split makes the vector structure of both regimes
explicit.

== A worked intuition: the hierarchy of proxies

Consider a company with leadership whose real objectives are something like
_make a product customers want_, _make money_, _enjoy the work_, _gain
prestige_, and a dozen other things, in some weighting that no written document
captures. Call that vector of objectives $G$. Each quarter the leadership sets a
proxy $P$: a handful of metrics — revenue, delivery dates, an NPS number.
The teams that implement $P$ have their own objectives, and the proxy they
*actually* optimise, $P_i$, folds their incentives into the official one. Its
dimensionality is at least that of the most complex implementer's goals.

Now suppose leadership notices that Team 1 is "optimising too hard on the
metrics" — the dashboard looks better than the product. They intervene. The
correction they apply is _not_ the gap between $G$ and Team 1's true output. It
is the gap between the *felt proxy* by which leadership noticed the problem and
Team 1's measured performance. The error term is being filtered through several
layers of proxy, each with its own residual.

Two things follow, and they recur throughout the book:

+ When a principal constrains an agent whose behaviour has more degrees of
  freedom than the principal's proxy, the proxy must compress, ignore, or invent
  coordinates. Some residuals are ordinary measurement errors. Others are closer
  to incomputable noise: not noise the principal is failing to measure well, but
  behaviour whose relation to the principal's goal has not been represented in
  the proxy space at all.
  This is the *dimension gap*: if the proxy map has no coordinate for a
  goal-relevant degree of freedom, optimisation can move that degree of freedom
  without registering as proxy error. The later formal claims are about special
  cases where that movement is observable as either selection response or
  intervention cost.

+ Whether the multi-layer correction process converges depends on whether the
  layers' perception errors are roughly independent. If each layer's residual is
  its own, a dimension of error that one layer sees can be corrected even though
  no layer sees the whole picture. If the residuals are strongly correlated — a
  centrally-planned organisation, a single dominant metric — the system is
  fragile: every layer is blind in the same direction at once.

#remark[There is an ML reading of all this, but it is diagnostic rather than a
finished model of training. Pretraining, validation-set selection, and model
selection are selection regimes when they choose among behaviours already
present in the candidate distribution. RLHF and reward-model optimisation become
intervention-like once the learner changes its policy to exploit the reward
channel; this is the reward-gaming setting studied by @skalse2022rewardgaming
and @pan2022rewardmisspecification. What plays the role of $kappa$ in a neural
network is not settled: it might be gradient accessibility, representation
density from pretraining, benchmark contamination, reward-model feature
simplicity, or optimiser search efficiency. The framework below therefore does
not claim that quadratic Stackelberg gaming describes RLHF. It says what an ML
version would have to estimate: baseline response curves for selection; cost
geometry, stakes, and available gaming channels for intervention.]

== Setup: goals, proxies, and two kinds of gap

Fix a state space $S$ — the set of configurations the world (or the
organisation, or the model) can be in. A *true goal map* is a function
$G : S -> RR^m$; its $m$ coordinates are substantively distinct things the
principal cares about. A *proxy map* is $P : S -> RR^k$, the $k$ things actually
measured and acted on. The principal also has in mind an *intended model*
$phi : RR^m -> RR^k$ — "the proxy should be roughly $phi$ of the goal" — and the
discrepancy is the *residual*

$ epsilon(s) = P(s) - phi(G(s)). $

This little decomposition already separates two distinct Goodhart channels:

- A *dimension gap*: $ker phi != {0}$, so some directions in goal space are
  invisible to the proxy. No amount of measuring $P$ accurately tells you
  anything about movement along $ker phi$.
- An *observation gap*: $epsilon != 0$, so even the directions the proxy is
  meant to track are corrupted — by noise, by lag, or (Chapter 3) by deliberate
  manipulation.

#claim[*Toy example.* Let product quality be $G = ("reliability", "delight")$ and
let the proxy be uptime. Then "delight" lies in $ker phi$ — the dimension gap.
Noisy uptime instrumentation is part of $epsilon$ — the observation gap. A
research-evaluation example: citation count is *intended* to track research
quality; "long-run conceptual fertility" may be in $ker phi$, while bot
citations and citation cartels are residual variation in proxy space.]

#remark[A caution that will shape the notation. If the principal's "true"
objective is genuinely scalar, then $ker phi != {0}$ may be an artefact of
having written that scalar goal in redundant coordinates. So dimension-gap
claims should always be made *after* choosing coordinates whose components are
substantively distinct goal variations, not arbitrary embeddings. We will keep
$phi : RR^m -> RR^k$ as the principal's intended correspondence and consistently
distinguish three subspaces:
- $ker phi$: goal variation invisible to the intended proxy;
- $im phi$: proxy variation intended to track goal variation;
- residual proxy directions: variation of $P$ not explained by $phi(G)$.]

== A first specialisation, and a roadmap

Throughout Chapter 2 we work the simplest non-trivial case: $G(s) = X in RR^m$
with $X$ Gaussian, a single scalar proxy that is one coordinate (or one linear
combination) of $X$ plus noise, and *selection* — keep the states scoring above
a threshold. This isolates the two classical "easy" Goodhart effects,
*regressional* and *extremal* Goodhart @manheim2018categorizing, from the
harder ones. It is the right
first probe precisely because it is the regime where, as Chapter 2 shows, hidden
harm turns out to be *bounded by quantities visible in the pre-selection
distribution*. Chapter 3 then asks what changes when the principal's policy does
not merely re-select from a fixed population but changes the population itself —
when agents *respond* — and shows that this is where the "deep Goodhart" story
has teeth, and where the bound from Chapter 2 has no analogue.

A reader who wants the punchline before the construction: there is a clean
dichotomy between *selection channels* (the policy reweights a fixed baseline
distribution; all classical regressional/extremal Goodhart lives here; hidden
drift $<= delta dot norm(s)$ with every term a baseline functional) and
*intervention channels* (the policy moves probability mass to where the baseline
had none; causal and adversarial Goodhart live here; no baseline bound exists,
and any bound must be imported from a model of what the responding agents can
afford to do). Chapters 2 and 3 are those two halves.

The appendices are organised the same way. Appendices C--F are visual aids for
claims made in the formal chapters: selection response, dimensional coupling,
selection versus intervention, additive versus conjunctive gaming, and the
exchange-rate condition for conservation. Appendix G is deliberately different:
it is a speculative cartoon of the recursive-Goodhart intuition. Its purpose is
to say what the framework might help test, not to smuggle an additional theorem
into the paper.

== Summary of results

The proved or directly derived results in these chapters are:

- Gaussian threshold selection shifts hidden means by
  $EE[H mid(|) A_t] = sigma_1 lambda(t slash sigma_1) r$ in the linear-Gaussian
  model.
- Covariance is not a universal coupling primitive: with $P = Z$ and
  $H = Z^2 - 1$, baseline covariance vanishes while threshold and finite
  Boltzmann selection still move $H$.
- Under Boltzmann selection, covariance is the local velocity:
  $dif EE_beta[H] slash dif beta = "Cov"_beta(H, P)$.
- Selection-channel drift satisfies the coordinate-explicit bound
  $norm(B_H(theta))_2 <= delta dot norm(s)_2$, with
  $delta^2 = chi^2(mu_theta parallel mu_0)$.
- In the quadratic Stackelberg gaming model, the gaming wedge is
  $Delta = sqrt(2 kappa V)$.
- In the additive multidimensional gaming model, quadratic costs give the
  water-filling allocation, and the weighted additive case gives the
  exchange-rate condition $h_j = c w_j$ for conservation of fixed-deficit harm.
- In the quadratic response-shape model, an intervention target $w dot a >= d$
  with cost $(1/2) a^T C^(-1) a$ selects the minimum-cost direction
  $a^* = d C w slash (w^T C w)$, not a minimum-complexity direction as such.
- In fixed-charge or linear-cost response models, the uncapped no-tie case can
  produce one-channel drift; caps convert this into ordered spillover only when
  activation costs are absent or already paid; positive activation costs add
  thresholded regime switches.

The additive-versus-conjunctive flip and the noisy Stackelberg refinement are
illustrative models, not general theorems. The convex-cost intervention analogue
of the selection bound is stated below as a conjecture with a Fenchel-duality
sketch. Chapter 4's response-shape taxonomy is a conditional prediction menu,
not a theorem that residual error generically becomes more complex. The
remaining items in Appendix A are open.

// =============================================================================
= Selection channels: when the principal only re-selects
// =============================================================================

== The Gaussian threshold model

Let $X = (X_1, dots, X_m) ~ cal(N)(0, Sigma)$. Take the proxy to be the first
coordinate, $P = X_1$, with selection $A_t = {X_1 >= t}$; the *hidden* goal
coordinates are $H = (X_2, dots, X_m)$, so in this stripped-down picture
$dim(ker phi) = d = m - 1$. (We have set the observation noise to zero on
purpose: whatever effect appears here comes from the dimension gap, not from
measurement error.)

For each hidden coordinate write $rho_j = "Cov"(X_j, X_1) / "Var"(X_1)$. The
Gaussian conditional-mean formula gives $EE[X_j mid(|) X_1 = x] = rho_j x$, and
hence

$ EE[X_j mid(|) A_t] = rho_j dot EE[X_1 mid(|) X_1 >= t]. $

If $X_1 ~ cal(N)(0, sigma_1^2)$ then $EE[X_1 mid(|) X_1 >= t] = sigma_1 lambda(alpha)$
with $alpha = t / sigma_1$ and $lambda(alpha) = phi.alt(alpha) / (1 - Phi(alpha))$
the inverse Mills ratio. So the hidden mean-shift vector is

$ EE[H mid(|) A_t] = sigma_1 lambda(alpha) dot r, quad quad r = (rho_2, dots, rho_m). $

#claim[*Selection moves only what correlates with the proxy (in this model).* In
the Gaussian threshold model, thresholding on $X_1$ produces no expected drift
in a hidden coordinate $X_j$ exactly when $"Cov"(X_j, X_1) = 0$. _Toy example:_
if a school rewards only test scores and student curiosity is statistically
independent of test scores in the applicant pool, thresholding on scores does
not change mean curiosity.]

#remark[This is a *Gaussian* fact and must not be read as a general one — see
@sec:cov-not-enough. It is true here only because Gaussian conditional
expectations are linear; for non-Gaussian variables, zero covariance does not
imply a flat tail-conditional mean. Read correctly, it is a *sufficiency*
statement: in the multivariate-Gaussian scalar-threshold model, the covariance
ratios $r$ are a complete summary of hidden mean drift at every threshold.]

== Does the harm scale with the number of hidden dimensions?

The motivating intuition wants "more hidden dimensions $=>$ more Goodhart". The
honest version is weaker, and Chapter 2's final bound gives the clean statement.
This Gaussian calculation is only the first view.

If every hidden dimension has the *same* covariance ratio $rho_j = rho$, then
$ norm(EE[H mid(|) A_t])_2 = sqrt(d) dot abs(rho) dot sigma_1 lambda(alpha), $
so the aggregate hidden mean drift grows like $sqrt(dim(ker phi))$ at fixed
per-dimension coupling. But "fixed per-dimension coupling" is a strong scaling
assumption. If instead the *total* correlation budget is bounded,
$sum_j rho_j^2 <= C$, then $norm(EE[H mid(|) A_t])_2 <= sigma_1 lambda(alpha) sqrt(C)$,
which does not grow with $d$ at all. Whether dimensional growth is real depends
entirely on whether new dimensions bring new *independent* coupling to the proxy
or merely subdivide a fixed amount of coupling into finer coordinates.

#claim[The clean first version of dimensional dependence is therefore *not*
"more hidden dimensions automatically cause more Goodhart". It is: under a
per-dimension coupling model, threshold selection induces hidden drift whose
*norm scales with the coupling-vector norm* $norm(r)_2$; this becomes
*dimensional* scaling only after a substantive assumption about how $norm(r)_2$
grows with $d$.]

This is the same lesson that the selection-channel drift bound will express in a
declared hidden coordinate system: dimension enters through the hidden
variability and coupling budget, not through a bare count of unmeasured
coordinates. Appendix C visualises both parts of the claim.

#remark[Two shortcuts fail. If hidden dimensions are independent of the proxy,
thresholding leaves them unchanged. And the signed aggregate hidden error is the
wrong target: positive and negative hidden correlations can cancel while normed
or squared displacement grows.]

== Covariance is not a general coupling primitive <sec:cov-not-enough>

Outside Gaussian linearity, covariance fails. Let $P = Z$ with $Z ~ cal(N)(0, 1)$
and let the hidden coordinate be

$ H = Z^2 - 1. $

Then $EE[H] = 0$ and $"Cov"(H, P) = EE[(Z^2 - 1) Z] = EE[Z^3] - EE[Z] = 0$. But
under threshold selection $A_t = {Z >= t}$,

$ EE[H mid(|) A_t] = EE[Z^2 - 1 mid(|) Z >= t] = t lambda(t) > 0 quad "for" t > 0. $

#claim[Zero covariance between a hidden coordinate and a scalar proxy does *not*
imply zero hidden drift under threshold selection. _Toy example:_ an academic
evaluation score may be uncorrelated with intellectual conformity overall —
because both very-low-score and very-high-score candidates are unusual — while
selecting only the very highest scores still enriches for one particular kind of
unusualness.]

#remark[The example writes $H$ as a deterministic function of $P$, which feels
engineered; but that is exactly the point against covariance — nonlinear
dependence can be invisible to covariance while completely determining tail
behaviour. A less deterministic version $H = Z^2 - 1 + xi$ with independent
mean-zero $xi$ keeps the same covariance and the same tail-mean shift while
weakening the functional-dependence objection. The right takeaway is *not* that
real systems generically have U-shaped hidden dependence; it is that covariance
cannot be the universal coupling primitive.]

The repair is to take the *response curve itself* as primitive. For a scalar
proxy $P$ and hidden vector $H$, define the *threshold response*

$ b_H(t) = EE[H mid(|) P >= t] - EE[H], $

whenever the conditional expectation exists. This describes the actual
displacement caused by selection at pressure level $t$, with no linearity
assumption. In the Gaussian scalar model it reduces to what we already have:
$b_H(t) = sigma_1 lambda(t / sigma_1) r$, so $r$ is a sufficient statistic for
*all* threshold responses in that restricted model — but only there. See
@fig:selection-thresholds for the corresponding three-case picture.

#remark[$b_H(t)$ is a *threshold-selection* primitive, not the final one. It
says nothing about smoother optimisation policies — funding everyone above a
cutoff is one thing; funding probabilistically with odds increasing in score is
another. The next section generalises.]

== Weighted selection response

Let $(S, cal(F), mu)$ be the baseline probability space, $H : S -> RR^d$ the
hidden coordinates, $P : S -> RR$ the scalar proxy. A *selection policy* is a
nonnegative weight $W_theta : S -> [0, infinity)$ with $0 < EE_mu[W_theta] < infinity$.
Define the *selected expectation* and the *hidden response*

$ EE_theta[F] = (EE_mu[F W_theta]) / (EE_mu[W_theta]), quad quad
  B_H(theta) = EE_theta[H] - EE_mu[H]. $

Hard thresholding is the special case $W_t = bb(1){P >= t}$ (recovering
$b_H(t)$). Soft optimisation is $W_beta = exp(beta P)$ — Boltzmann selection —
whenever $EE[exp(beta P)]$ is finite. Probabilistic funding with score-increasing
odds, replicator-style repeated reweighting by performance, top-$q$-fraction
selection (thresholding at an endogenous quantile): all are weight functions.

#remark[Two caveats on the soft-optimisation case. First, if $P$ is heavy-tailed,
$EE[exp(beta P)]$ may be infinite for positive $beta$ — the Boltzmann path may
not exist. This is not a technicality; Goodhart is often precisely about extreme
tails. For heavy tails, bounded weights or quantile selection are safer models.
Second, not every control process is a reweighting of a fixed baseline at all —
interventions can change the state-generating mechanism. That is Chapter 3.]

=== Covariance as a local velocity

For Boltzmann selection, $EE_beta[H] = EE[H exp(beta P)] / EE[exp(beta P)]$, and
assuming enough integrability to differentiate under the expectation,

$ dif / (dif beta) EE_beta[H] = EE_beta[H P] - EE_beta[H] EE_beta[P] = "Cov"_beta(H, P). $

#claim[Covariance is best read as the *local velocity* of hidden drift under
infinitesimal soft optimisation, evaluated under the *current* selected
distribution — not as a global finite-pressure summary. _Toy example:_ at low
bonus pressure, the rate at which burnout changes with sales incentives is the
current covariance between burnout and sales; after employees adapt or the
selected population shifts, the covariance must be recomputed under the new
weighted distribution.]

That local velocity does not pin down finite movement. Take again $P = Z ~ cal(N)(0,1)$,
$H = Z^2 - 1$. Boltzmann tilting by $exp(beta Z)$ gives $Z_beta ~ cal(N)(beta, 1)$,
so

$ EE_beta[H] = EE[Z_beta^2 - 1] = beta^2. $

The covariance at $beta = 0$ is zero — matching @sec:cov-not-enough — yet finite
pressure gives strictly positive hidden drift for every $beta != 0$. Baseline
covariance alone is insufficient even for *finite* soft optimisation; one needs
the covariance field $"Cov"_beta(H, P)$ along the whole tilted path.

#claim[*The hierarchy of selection primitives.* covariance (infinitesimal
Boltzmann velocity) $subset$ threshold response $b_H(t)$ (hard cutoffs) $subset$
weighted response $B_H(theta)$ (generic non-causal selection). All three are
functionals of the baseline $mu$ alone. Causal and adversarial Goodhart need a
further layer in which $mu$ itself changes with the principal's policy — the
subject of Chapter 3.]

== The selection-channel drift bound

This is the structural payoff of staying inside the reweighting picture. With
$W_theta$ a selection policy, write the likelihood ratio
$L_theta = W_theta / EE_mu[W_theta]$, so the selected law is $mu_theta = L_theta mu$.
By Cauchy–Schwarz in $L^2(mu)$, for each hidden coordinate $H_i$,

$ abs(B_(H_i)(theta)) = abs(EE_mu[(L_theta - 1)(H_i - EE_mu H_i)])
  <= norm(L_theta - 1)_(L^2(mu)) dot norm(H_i - EE_mu H_i)_(L^2(mu)). $

So, writing $delta := norm(L_theta - 1)_(L^2(mu))$ — a *reweighting budget*,
with $delta^2 = chi^2(mu_theta parallel mu)$ the chi-square divergence — and
$s_i := "sd"_mu(H_i)$,

$ abs(B_(H_i)(theta)) <= delta dot s_i, quad quad norm(B_H(theta))_2 <= delta dot norm(s)_2. $

#claim[Under a selection channel, hidden Goodhart drift is controlled by two
things that *are* visible in the baseline distribution: how hard you reweight
($delta$) and how variable the hidden coordinates are ($s$). Bounded reweighting
budget plus bounded hidden variance $=>$ bounded hidden drift — full stop. The
$sqrt(d)$ growth from Chapter 2's per-dimension model is exactly the
$norm(s)_2$ term, and that term is the *only* way the number of declared hidden
coordinates enters.]

#remark[The proof is only Cauchy–Schwarz, but the formulation is doing real
work. It is the clean coordinate-explicit statement of why selection-regime
Goodhart is tame after the hidden coordinates and norm have been chosen: if a
policy only reweights a baseline distribution, then hidden drift is bounded by a
reweighting budget and baseline hidden variability, both $mu$-functionals. It is
not invariant to arbitrary relabellings of the hidden space. Splitting one
hidden variable into ten correlated coordinates changes the bookkeeping unless
the norm is replaced by a declared covariance or value-weighted operator norm.
The caveats are still important: this is a worst-case envelope, not a
prediction, and it can be vacuous under extreme selection when $delta$ is large.
The rest of the book is about what breaks when the policy is not a reweighting
and no such baseline-only budget exists.]

// =============================================================================
= Intervention channels: when agents respond
// =============================================================================

== Why selection is not enough

A selection policy can only move probability mass that already exists toward
high-$P$ regions: the selected law $mu_theta = L_theta mu$ is absolutely
continuous with respect to $mu$, so any event with baseline probability zero
keeps probability zero. That measure-theoretic criterion is a useful sufficient
formalism for pure selection, but it is not the causal boundary by itself. If
the baseline already assigns tiny probability to test-specific drilling or
fabrication, an announced metric can induce much more of the same behaviour
while the new law remains absolutely continuous. The causal distinction is that
the policy changes the response kernel at a fixed underlying type: agents can
move their measured and hidden features, not merely be reweighted.

Teaching to the test, metric-specific optimisation, outright fabrication — none
of these are ordinary reweightings of last year's population, even when an
$epsilon$ amount of similar behaviour existed before. They transport mass along
available action channels. Appendix D draws the reweighting-versus-transport
distinction.

#claim[*The sharp boundary.* The selection/intervention distinction is
substantive exactly when agents can *move in state space* — change their
$(P, H)$ at a fixed underlying type — not merely toggle their own inclusion. If
agents only choose whether to *participate* (apply, submit, enter the pool) but
cannot alter their measured features, then the post-policy law is just $mu$
restricted to the participating set and renormalised — a selection channel after
all. Genuine causal Goodhart lives in features that are *cheap to change without
changing the thing they were supposed to proxy*.]

== Response channels: the top-level object

Let $(S, cal(F))$ be a measurable state space, $mu_0$ the baseline law,
$H : S -> RR^d$ the hidden goal coordinates, $P : S -> RR$ the scalar proxy, and
$phi$ the principal's intended model $P approx phi(G)$. A *response channel* is a
map

$ cal(R) : Theta -> cal(P)(S), quad theta |-> mu_theta, quad mu_(theta_0) = mu_0, $

for some null policy $theta_0$. Hidden drift along the channel is
$B_H(theta) = EE_(mu_theta)[H] - EE_(mu_0)[H]$, exactly as before.

#claim[*Definition.* $cal(R)$ is a *pure selection channel* if $mu_theta << mu_0$
for all $theta$ and the policy only reweights fixed states or fixed types — then
$L_theta := dif mu_theta slash dif mu_0$ exists and $mu_theta$ is $mu_0$
reweighted by $L_theta$. An *intervention channel* changes the response kernel:
at fixed type, agents can choose actions that change $(P, H)$ or the
state-generating mechanism. Mutual singularity with $mu_0$ is decisive evidence
of intervention, but not required for the causal distinction.]

The entire apparatus of Chapter 2 — covariance, threshold response, weighted
response — is the pure-selection case, with $L_theta = W_theta / EE_(mu_0)[W_theta]$.
In Manheim and Garrabrant's taxonomy @manheim2018categorizing, *causal* Goodhart
is an intervention channel in which the policy structurally breaks
$P approx phi(G)$, and *adversarial* Goodhart is an intervention channel in
which $theta$ is chosen worst-case for the principal. The ML instances of this
regime are *strategic classification* @hardt2016strategic — agents manipulate
features in response to a published classifier — and *performative prediction*
@perdomo2020performative — the act of deploying a predictor changes the
distribution it is predicting. The drift bound of Chapter 2 has no
baseline-only analogue here: even when an intervention law is technically
absolutely continuous because the baseline had $epsilon$ mass on the action
image, the relevant likelihood ratio reflects the induced response, not a
passive selection rule. Any useful bound on intervention drift must be
*imported from the agent side* — a feasibility set or cost function describing
what re-arrangements of mass agents can afford. The rest of the chapter
computes such a bound in toy models and reads off the controlling quantity.

== A linear–Gaussian Stackelberg gaming model

A continuum of agents; an agent's type is its true quality $Q ~ cal(N)(0, sigma_Q^2)$,
and the true scalar goal is $G = Q$. There is a hidden coordinate $H$ = "gaming
externality": effort spent corrupting the proxy rather than improving $Q$ —
teaching to the test, metric-specific optimisation, Campbell's-law distortion
@campbell1979. The principal believes $P approx Q$.

*Baseline channel $mu_0$* (metric not announced, not gameable): the agent does
nothing special, $P_0 = Q + eta$ with $eta ~ cal(N)(0, sigma_eta^2)$ independent,
and $H_0 equiv 0$. So $mu_0$ is supported on the plane ${H = 0}$ in
$(Q, P, H)$-space.

*Intervention channel* (metric announced, agents best-respond; Stackelberg,
principal commits first): the principal picks a threshold policy $A_t = {P >= t}$;
selection is worth $V > 0$ to an agent. An agent of type $Q$ chooses gaming
effort $a >= 0$, getting $P = Q + a + eta$ at private cost $c(a) = a^2 slash (2 kappa)$
($kappa > 0$ measures the ease of gaming) and incurring hidden externality
$H = a$. The agent maximises $V dot Pr(Q + a + eta >= t) - a^2 slash (2 kappa)$.

=== The noiseless cut

Set $sigma_eta = 0$, so selection is $Q + a >= t$. An agent with $Q >= t$ sets
$a = 0$. An agent with $Q < t$ either games to exactly $a = t - Q$ (cost
$(t - Q)^2 slash (2 kappa)$, payoff $V$) or sets $a = 0$ (payoff $0$). Gaming is
worth it iff $(t - Q)^2 slash (2 kappa) <= V$, i.e.

$ t - Q <= Delta, quad quad Delta := sqrt(2 kappa V). $

So the best response is $a^*(Q) = (t - Q) dot bb(1){t - Delta <= Q < t}$, and the
selected set is ${Q >= t - Delta}$. Compared to the *selection* counterfactual
(agents cannot game; the principal thresholds $P = Q$ at the same nominal $t$;
selected set ${Q >= t}$; $H equiv 0$):

+ *The metric lies, by up to $Delta$.* The principal believes selection $=>$
  $P >= t$ $=>$ (under $phi$) $Q >= t$. Actually $Q$ among the selected ranges
  down to $t - Delta$. The proxy-to-goal gap $epsilon = P - phi(G) = a$ is no
  longer noise — it is a deliberate wedge of size up to $Delta$.

+ *Hidden harm appears at order $Delta$.* $EE[H mid(|) "selected"]
  = EE[(t - Q) bb(1){t - Delta <= Q < t}] slash Pr(Q >= t - Delta) > 0$, monotone
  increasing in $Delta = sqrt(2 kappa V)$. In the selection regime $H$ is
  *identically zero* in this model — consistent with Chapter 2's bound, since
  $s_H = 0 => B_H = 0$. The harm is created entirely by the intervention.

+ *The controlling quantity is not a $mu_0$-functional.* $Delta$ depends on
  $kappa$ (technological ease of gaming) and $V$ (the stakes), neither of which
  is visible in the baseline $(Q, P_0, H_0)$ law. This is the promised
  contrast: intervention drift is bounded by the agents' cost–benefit ratio, not
  by any reweighting budget.

+ *Why this is not a selection channel.* In the clean version, $mu_0$ lives on
  ${H = 0}$; the post-intervention law puts positive mass on ${H > 0}$ (the
  gamers — a set of types of positive measure). The two laws are mutually
  singular in the $(Q, H)$-marginal: there is no $L_theta$. If the baseline
  instead had a small amount of pre-existing gaming variation, singularity could
  disappear, but the same fixed-type action response would remain. The state was
  *transported* along an action channel, not merely reweighted.

#claim[In a Stackelberg gaming model with quadratic gaming cost $a^2 slash (2 kappa)$
and selection value $V$, the metric's worst-case bias and the induced hidden
harm both scale with $Delta = sqrt(2 kappa V)$ — the square root of (ease of
gaming $times$ stakes) — and this regime is invisible to, and unbounded by, the
baseline distribution. _Toy example:_ doubling the funding tied to a test score
multiplies the gaming wedge by $sqrt(2)$; halving the cost of test-prep drilling
does the same.]

#remark[The quadratic cost is a modelling choice. A cost with a hard cap
$a <= a_"max"$ bounds gaming at $a_"max"$ regardless of $V$; a cost that is
cheaper at the margin for high-$Q$ agents skews *who* games. So
$Delta = sqrt(2 kappa V)$ is the quadratic-cost signature, not a universal law —
but the qualitative point (a positive-measure set of agents leaves the $H = 0$
locus; drift is set by agent economics, not by $mu_0$) is robust to the cost's
shape. And if $V$ is itself endogenous — selection is valuable only if the
metric is trusted, and trust erodes as gaming is observed — there is a feedback
loop not modelled here. @sec:openq flags it.]

#remark[*For ML evals.* This toy model maps cleanly to evaluator behaviour before
it maps to neural training. For a benchmark designer, $V$ is the prize attached
to passing or ranking well, and $kappa$ is the ease of benchmark-specific score
inflation. For a trained model, the corresponding quantity may not be a scalar
cost at all: it could be an optimiser-dependent route through representation
space, a memorised benchmark feature, or a reward-model vulnerability. Treating
RLHF as this Stackelberg game is therefore a hypothesis to test, not a licensed
conclusion of the chapter.]

=== The noisy refinement (sketch)

With Gaussian proxy noise, $Pr("selected" mid(|) Q, a) = 1 - Phi((t - Q - a) slash sigma_eta)$
is smooth in $a$, so the best response is interior everywhere:

$ a^*(Q) = (kappa V slash sigma_eta) dot phi.alt((t - Q - a^*(Q)) slash sigma_eta) $

(implicit; the right side is the marginal selection-probability gain). Every
agent games a little: $a^*(Q) > 0$ for all $Q$, peaking near $Q approx t - a^*$
and decaying in $abs(Q - (t - a^*))$. Hidden harm $EE[H mid(|) "selected"]
= EE[a^*(Q) mid(|) "selected"] > 0$ for every threshold. The hard-threshold
version is the $sigma_eta -> 0$ limit, where gaming concentrates on the band
$[t - Delta, t)$. The lesson: noise *spreads* gaming across the whole population
rather than removing it.

== Multidimensional gaming: does adding a measured dimension help?

Now the dimensional thread of Chapter 1 rejoins the picture, inside the
intervention regime. The motivating "deep Goodhart" move is: the principal,
fighting scalar Goodhart, *adds proxy dimensions*. When agents game, does adding
a measured dimension redistribute harm, conserve it, shrink it, or grow it? The
answer depends critically — and instructively — on how the metric *aggregates*
its dimensions, so the aggregation rule must be a visible parameter, not a hidden
default. Appendices E and F give the geometric picture for the additive,
conjunctive, and exchange-rate cases.

=== The exchange-rate condition

Start with the general additive case, because it is the result that survives
changes of units. Let the score be $sum_(j in M) w_j a_j$, costs
$sum_j a_j^2 slash (2 kappa_j)$, and hidden harm $H = sum_j h_j a_j$. The
cost-minimal allocation for a score deficit $d$ is
$a_j = d kappa_j w_j slash W_M$ with $W_M = sum_(i in M) kappa_i w_i^2$, and its
harm is

$ H_M (d) = d dot (sum_(j in M) h_j kappa_j w_j) / (sum_(j in M) kappa_j w_j^2). $

This is *not* invariant in $M$. (Two equally easy channels, $kappa_1 = kappa_2 = 1$,
equal physical harm $h_1 = h_2 = 1$: measuring only channel 1 with $w_1 = 2$
gives $H = d slash 2$; measuring only channel 2 with $w_2 = 1$ gives $H = d$;
measuring both gives $H = 3 d slash 5$.) Re-routing can raise *or* lower harm,
depending on the score weights. @fig:exchange-rate-condition records the
numbers.

#claim[*Conservation, correctly stated.* For a fixed score deficit $d$, quadratic
separable costs, and additive score $sum w_j a_j$, per-agent harm is conserved
under re-routing *if and only if* social harm is proportional to score
contribution on every available channel — $h_j = c w_j$ on the active measured
set. Then $H_M (d) = c d$, independent of $M$; otherwise $H_M (d)$ depends on
$M$ through the cost-weighted average above. _Toy example:_ if every point of
score inflation is equally socially wasteful no matter which KPI supplies it,
re-routing conserves harm; if grant-padding produces less waste per score point
than citation-padding, moving weight toward grant-padding genuinely reduces harm.]

#remark[This is the same structure as cost-benefit-weighted strategic
classification @hardt2016strategic, and as isoquant choice in production theory:
agents pick the cheapest input bundle for a target output, while social damage
is a *different* linear functional of the bundle. Conservation appears only when
target output and social damage use the same exchange rates. One residual worry
for later: real score weights are sometimes partly arbitrary normalisation
choices, so future work must distinguish harmless unit changes from substantive
incentive exchange rates.]

=== Unit-weight additive model

The narrow conservation slogan is the unit-weight illustration of the
exchange-rate result. Take $k$ gaming channels and, in the base case, true
quality $Q = 0$ for everyone (pure gaming). An agent allocates effort
$a = (a_1, dots, a_k) >= 0$; channel $j$ costs $a_j^2 slash (2 kappa_j)$ and
produces hidden harm $H_j = a_j$ (all gaming equally wasteful,
$H = sum_j a_j$). The principal *measures* a set
$M subset.eq {1, dots, k}$ and scores additively, $"score" = sum_(j in M) a_j$
(unit weights); selection (worth $V$) iff $"score" >= t$. An agent never games
an unmeasured channel.

The agent's problem is $min_(a_j >= 0, j in M) sum_(j in M) a_j^2 slash (2 kappa_j)$
subject to $sum_(j in M) a_j >= t$, then game iff that minimum cost is $<= V$.
At the optimum the constraint binds and $a_j slash kappa_j = lambda$ for all
$j in M$ (a water-filling allocation), so with $K_M := sum_(j in M) kappa_j$,

$ lambda = t slash K_M, quad a_j = t kappa_j slash K_M, quad
  "min cost" = lambda^2 K_M slash 2 = t^2 slash (2 K_M). $

Hence *gaming occurs iff $K_M >= t^2 slash (2 V)$* (call the right side $K_"min"$),
and when it occurs, the per-agent hidden harm for this fixed pure-gaming target
is $H = sum_(j in M) a_j = lambda K_M = t$ — *independent of $M$*. What $M$
controls is (i) *whether* $K_M$ clears $K_"min"$, and (ii) *how* the fixed harm
$t$ is split across the measured channels — proportional to $kappa_j$.
@fig:additive-substitution shows the same water-filling geometry in effort
space.

#claim[*Conservation under re-routing (narrow form).* With a unit-weight
additive metric and gaming that is equally wasteful per unit of score, the
principal cannot reduce per-agent harm for a fixed pure-gaming score deficit by
changing *which* channels it measures, as long as the measured set keeps enough
aggregate gaming capacity ($K_M >= K_"min"$): the harm is pinned at $H = t$ and
merely re-routes. Closing a gamed channel just spreads $t$ over the others.
_Toy example:_ a hospital ranked on readmission rates clamps down on coding of
"readmission" — the gaming reappears as patient selection, discharge timing,
observation-status reclassification; the per-case distortion needed to clear the
cutoff is unchanged.]

#claim[*Adding a gameable measured dimension backfires.* Expanding $M$ strictly
increases $K_M$, which *lowers* the gaming cost $t^2 slash (2 K_M)$, which
weakly *enlarges* the population that finds gaming worthwhile. With quality
heterogeneity $Q ~ cal(N)(0, sigma^2)$ — an agent needs $"score" >= t - Q$, at
cost $(t - Q)^2 slash (2 K_M)$, and games iff $t - Q <= sqrt(2 K_M V)$ — the
gaming-eligibility cutoff $Q >= t - sqrt(2 K_M V)$ moves *down* as $K_M$ grows.
More agents game; the fraction of selected agents who are pure gamers rises.
_Toy example:_ a university worried that "publication count" is gamed adds "grant
income" and "media mentions" to the scorecard; each is independently inflatable,
so the cheapest path to any target score is now cheaper, and more faculty shift
from research to portfolio-padding.]

#claim[*The effective levers are aggregate, not allocative.* In this model the
principal reduces gaming harm only by (a) shrinking aggregate gaming capacity
$K_M$ below $K_"min"$ — narrowing the measured set to channels that are
individually hard to game (small $kappa_j$), or hardening channels; (b) raising
the bar $t$ (but this raises $K_"min"$ too; the net effect on the
$K_M >= t^2 slash (2 V)$ test depends on whether real signal scales with $t$);
(c) cutting the prize $V$; or (d) abandoning additive aggregation. Shuffling
attention between channels of equal hardness does nothing. _Toy example:_
anti-cheating in exams works by making the exam itself hard to game — proctoring,
item rotation — not by adding more graded components.]

=== A conjunctive metric flips the sign

Suppose instead that passing requires $a_j >= t$ for *every* $j in M$ — the
principal demands the agent clear a bar on all measured dimensions. The
cost-minimal way to pass is $a_j = t$ for all $j in M$, at cost
$sum_(j in M) t^2 slash (2 kappa_j)$, and total harm $H = sum_(j in M) t = t abs(M)$.
Now harm grows *linearly in the number of measured dimensions*: adding a
dimension unambiguously increases per-gamer gaming harm — though it also raises
the cost of clearing the metric, so fewer agents do, a genuine trade-off
(harm-per-gamer up, gamer-count down).

#claim[Gaming harm's dependence on the *number* of measured proxy dimensions is
governed by the aggregation rule. Unit-weight compensatory/additive metrics
conserve fixed-deficit per-agent harm ($H = t$, re-routing only) — when measured
channels are equally harmful per score unit; conjunctive/$min$ metrics *multiply*
per-gamer harm ($H = t abs(M)$). Real scorecards are usually compensatory
(weighted sums of KPIs), which is the regime where "just add another metric" can
backfire by cheapening the cheapest gaming path and expanding the gaming
population. The selection-regime $sqrt(d)$-type scaling from Chapter 2 and these
intervention-regime flat/linear behaviours are *different phenomena* and should
not be conflated. See @fig:additive-vs-conjunctive.]

#remark[Scope, made explicit. The additive claims assume linear score
aggregation and quadratic separable gaming costs. The unit-weight conservation
illustration further assumes equal harm per score unit, a fixed pure-gaming
target deficit, and the binding-constraint deterministic regime. Relax equal
harm — let channel $j$ also contribute $gamma_j in [0, 1]$ to the true goal, so
$H = sum_j (1 - gamma_j) a_j$ — and the principal can shrink harm by steering
effort onto high-$gamma$ channels. Relax fixed participation with quality
heterogeneity, and aggregate population harm rises with $K_M$ because more
agents enter the gaming band. Real scorecards are often nonlinear within each
KPI — saturating, threshold-clipped, rubric-scored, or capped — so the linear
additive model is not innocuous. Its value is that it isolates the exchange-rate
condition under which conservation is real rather than an artefact of units. The
empirical discriminator is not whether a scorecard is literally quadratic; it is
whether added dimensions contribute independent, substitutable gaming capacity.
If the new channel is cost-correlated with existing channels, if gaming has a
hard bottleneck, or if the principal dynamically reweights after seeing attacks,
$kappa_"new"$ should not be counted as a full additive increment to $K_M$.]

== Evaluation-suite design implications

The selection/intervention split is directly useful for benchmarks and
leaderboards. An evaluation suite should first ask what kind of pressure it
creates. If it only chooses among fixed candidates, the relevant audit is a
selection audit: which hidden properties covary with the reported score, how far
into the tail the selection goes, and whether the weighting rule amplifies a
known residual. If training or submission behaviour adapts to the eval, the
audit becomes an intervention audit: what score-increasing moves are available,
what they cost, what prize they buy, and which hidden harms they induce.

#claim[*Scorecard design claim.* Adding a benchmark dimension is protective only
when it either measures real capability cheaply enough to displace gaming, or
raises the cost of gaming more than it raises the menu of compensatory
substitutes. Under an additive leaderboard, a low-cost gameable task is an
extra route to the same aggregate score. Under a conjunctive leaderboard, every
task becomes a gate: substitution is blocked, but false negatives rise and any
system gaming its way through must clear more bars.]

This makes the usual "more metrics means less Goodhart" heuristic conditional.
For an additive benchmark, the design question is whether a proposed task adds
real signal or mostly adds independent $kappa_j$; cost-correlated tasks,
shared bottlenecks, hard caps, and dynamic reweighting all break the clean
additive-capacity calculation. For a conjunctive benchmark, the design question
is whether the extra bar screens out benchmark-specific optimisation or merely
filters out genuinely capable systems with one narrow deficit.

The practical checklist is correspondingly split. For a fixed candidate pool:
audit baseline tail response, hidden-score covariances, and the selection depth.
For finetuning or repeated submissions: audit the cheapest score-increasing
maneuvers, their hidden harms, the prize for passing, and whether the proposed
new task is an independent route or a real bottleneck. For additive leaderboards:
ask whether the new component adds signal or compensatory gaming capacity. For
conjunctive gates: ask whether the added gate blocks substitution enough to
justify the extra per-gamer burden and false-negative risk. Either way, eval
results should be treated as experiments rather than leaderboard decorations:
pre-state the comparison the score is meant to support, report uncertainty where
stochasticity matters, document prompts/configs, and
separate the measured score from the broader capability or alignment claim.

== A convex-cost intervention bound? <sec:convex-cost-conjecture>

The selection-channel bound says that hidden drift is controlled by a
chi-square/reweighting budget $delta$. The intervention examples say that, once
agents can move in state space, the analogous budget has to come from the
agents' cost geometry. In the quadratic one-dimensional model that budget is
$Delta = sqrt(2 kappa V)$.

#claim[*Conjecture.* Let an agent choose an intervention $a$ at convex cost
$c(a)$ in order to gain value at most $V$ from selection, and let hidden harm be
bounded by a linear functional $ell(a)$. Then the intervention analogue of the
selection budget should be governed by the convex conjugate $c^*(lambda ell)$:
schematically, stakes $V$ buy a feasible displacement set whose support function
is controlled by Fenchel duality, not by any divergence from $mu_0$.]

The proof sketch is the standard Fenchel move. For any multiplier $lambda > 0$,

$ ell(a) = (1 slash lambda) dot lambda ell(a)
  <= (1 slash lambda) dot (c(a) + c^*(lambda ell)). $

If the agent only takes actions with cost at most the selection value $V$, this
gives $ell(a) <= (V + c^*(lambda ell)) slash lambda$, then optimises over
$lambda$. For quadratic cost this recovers a square-root scale, matching the
$sqrt(2 kappa V)$ wedge above. This is not yet a theorem at the level of the
selection-channel bound: the exact statement must specify the action space, the
harm functional, stochastic policies, participation, and how selection value
constrains realised cost. Appendix A keeps those variants open.

== What we have, and what is open <sec:openq>

The two-chapter arc gives a clean dichotomy. *Selection channels* — the policy
reweights a fixed baseline — contain all of regressional and extremal Goodhart;
hidden drift is bounded, $norm(B_H(theta))_2 <= delta dot norm(s)_2$, with
every term a baseline functional, and the number of dimensions enters only
through $norm(s)_2$. *Intervention channels* — the policy transports mass to
where the baseline had none — contain causal and adversarial Goodhart; there is
no baseline bound, and the controlling quantity (e.g. $Delta = sqrt(2 kappa V)$
in quadratic Stackelberg gaming) is exogenous to $mu_0$, set by the responding
agents' cost geometry. In the multidimensional intervention regime, "fight
Goodhart by measuring more dimensions" has a precise predicted failure mode:
under a compensatory rule it conserves fixed-deficit per-agent harm only when
channels are equally harmful per score unit, and it lowers the cheapest gaming
cost, recruiting more gamers — a population-level backfire; under a conjunctive
rule it multiplies harm by the number of bars. The principal's real levers are
aggregate (shrink total gaming capacity, harden channels, raise the bar relative
to real signal, cut the prize) or structural (pick low-harm-per-score proxies
whose cheapest inflation is partly real; change weights; or go conjunctive and
accept harm scaling with the number of bars).

That is the strong claim. The weaker, broader conjecture is recursive: in many
real systems, once the visible failures are patched, the residual error that
remains will be concentrated in dimensions that are less legible, less
represented in the training or evaluation signal, or cheaper for agents to
exploit. The chapters above do not prove that conjecture. They say what one
would have to measure to make it precise: the baseline response curve, the
coupling norm, the cost geometry, the aggregation rule, the gaming capacity, and
the score-to-harm exchange rates.

Chapter 4 sharpens that last sentence. The recursive hypothesis is tempting to
summarise as "residual error becomes more complex". That is not licensed. The
right next object is a *response-shape prediction*: once a response channel and
its constraints are specified, what shape of hidden residual should it produce?

#figure(
  table(
    columns: (1.15fr, 1.35fr, 1.15fr),
    inset: 6pt,
    align: horizon,
    [*Claim one might use*], [*What the chapters show*], [*Boundary*],
    [Adding additive metrics can worsen gaming.],
    [In the deterministic quadratic water-filling model, adding an independently
      gameable measured channel increases $K_M$, lowers $t^2 slash (2 K_M)$,
      and weakly expands the gaming band.],
    [Does not cover non-substitutable, capped, correlated, or dynamically
      reweighted channels.],
    [Selection and intervention are different Goodhart channels.],
    [Pure selection reweights fixed states or types. Intervention changes the
      response kernel at fixed type; singularity with $mu_0$ is sufficient but
      not necessary evidence.],
    [Absolute continuity alone does not settle causal status when the baseline
      already contains $epsilon$ mass on the induced behaviour.],
    [$Delta = sqrt(2 kappa V)$ describes neural training.],
    [Only in the one-dimensional quadratic Stackelberg toy. It says that a
      future ML mapping must identify a real analogue of $kappa$ and $V$.],
    [No mapping to RLHF, finetuning, or reward-model optimisation is licensed
      without that primitive map.],
    [Recursive Goodhart is plausible.],
    [The framework identifies mechanisms by which patched proxies can leave
      residual error in hidden dimensions.],
    [Not a theorem; it requires empirical estimates of legibility, coupling,
      and gaming cost.],
    [Goodhart drift becomes more complex.],
    [Only after a complexity measure and response mechanism are fixed. The
      current results separate support, rank, description length, cost, and
      search accessibility.],
    [No monotone complexity law follows from Chapters 1--4.],
    [Minimum-complexity attractors explain recursive Goodhart.],
    [Only conditionally: fixed-charge costs can yield sparse drift, low-rank
      affordances restrict drift to an image, and search priors can favour low
      description length.],
    [Quadratic costs and selection channels both block the generic theorem.],
  ),
  caption: [Claim audit: what these chapters license, and where the license
    stops.],
) <fig:claim-audit>

The appendices serve two different roles. Appendix A lists the questions
*currently being worked on* — they have partial answers in toy models, but not
yet at the level of polish the chapters above aim for. Appendix B lists
questions that *surfaced during this work and are deliberately parked* — worth
recording so they are not rediscovered from scratch, but not on the critical
path. Appendices C--F are visual aids for the first three formal chapters.
Appendix G is a speculative cartoon of the recursive hypothesis, explicitly not
a conclusion of the formal results. Appendix H visualises the Chapter 4
response-shape repair.

// =============================================================================
= Response shape: when hidden residuals concentrate
// =============================================================================

== The repaired recursive question

The previous chapters leave a natural question. If a principal patches a visible
failure, does the remaining error drift toward the "simplest" or
"minimum-complexity" way to pass the proxy? This would make the recursive
Goodhart picture much sharper: the system would not merely leak error into
arbitrary hidden directions; it would find the easiest hidden route the
principal failed to specify.

That claim is too strong as stated. "Complexity" is not one object. It can mean
support size, rank, description length, entropy, KL from a reference
distribution, private cost, or search accessibility. These agree in some toy
cases and disagree in others. So the live question is not whether Goodhart
generically selects minimum complexity. It is:

#quote(block: true)[Given a response channel, its constraints, and a pre-specified
shape measure, what hidden residual shape should proxy pressure select?]

This chapter gives the first answer. Selection channels follow baseline tails.
Intervention channels follow cost or search geometry. A minimum-complexity
attractor appears only when that geometry is aligned with the chosen complexity
functional.

== Why the generic attractor fails

In a selection channel, there is no optimisation over hidden residuals at all.
The policy reweights a fixed baseline, and the hidden drift is still

$ B_H(theta) = EE_theta[H] - EE_mu[H]. $

Thus any simplicity bias in selected hidden residuals must already live in the
baseline candidate distribution. A direct counterexample is diffuse: let
$P = Z$ and let $H_i = Z + xi_i$ for $i = 1, dots, d$, with independent mean-zero
noise $xi_i$. Thresholding on $P >= t$ shifts every hidden coordinate by the
same amount. In the substantive coordinate system $H_1, dots, H_d$, the response
has full support, not minimum support.

#remark[The vector $(1, dots, 1)$ may still have a short description in a
symmetric representation. That is exactly the point: support-size complexity and
description-length complexity are different claims.]

Intervention channels give a second obstruction. Suppose an agent chooses
$a in RR^k$ to close a linear proxy deficit $w dot a >= d$ under quadratic cost

$ c(a) = (1 slash 2) a^T C^(-1) a, $

with $C$ positive definite. The KKT conditions give an interior binding
solution:

$ C^(-1) a = lambda w, quad
  a^* = d C w slash (w^T C w). $

#claim[*Quadratic response-shape result.* In the unconstrained quadratic model,
proxy pressure selects the minimum-cost direction proportional to $C w$. This is
not a minimum-complexity direction by default. It is dense only when $C w$ is
dense in the pre-specified action basis and no additional constraints bind.
_Toy example:_ if all KPI-padding channels are smooth substitutes with symmetric
quadratic effort costs, the cheapest way to add score spreads effort rather than
using one obvious loophole.]

The result is useful precisely because it blocks a rhetorical shortcut.
Quadratic cost can generate diffuse drift; fixed-charge cost can generate sparse
drift; search priors can generate low-description-length drift. The response
process decides the shape.

== A conditional response-shape taxonomy

The safe replacement for "minimum-complexity attractor" is not the empty slogan
"geometry matters". It is a table of conditional predictions:

#figure(
  table(
    columns: (1.05fr, 1.35fr, 1.45fr),
    inset: 6pt,
    align: horizon,
    [*Response geometry*], [*Licensed prediction*], [*Guardrail*],
    [Quadratic intervention cost],
    [Cost-minimal drift along $C w$.],
    [Dense only when $C w$ is dense in the chosen action basis and no constraints
      bind.],
    [Fixed activation or linear marginal cost],
    [Low-support or one-channel drift in the uncapped, no-tie case.],
    [Caps, convex post-activation costs, detection risk, and ties can force
      spreading.],
    [Low-rank action map $L$],
    [Hidden drift is restricted to $"im"(L)$.],
    [Spectral concentration requires a specified hidden representation and value
      basis.],
    [Simplicity-biased search prior],
    [Failures are biased toward low description length under that prior.],
    [The coding language or search prior must be fixed before observing the
      failure.],
  ),
  caption: [Response-shape predictions. The framework licenses conditional
    geometry-to-shape claims, not a representation-invariant law of increasing
    complexity.],
) <fig:response-shape-taxonomy>

#claim[*Response-shape claim.* Proxy pressure does not determine hidden drift by
itself. A prediction needs a response process, a constraint set, and a
pre-specified residual shape measure. Once those are fixed, the model can
predict dense, sparse, low-rank, low-description-length, or goal-improving
responses. Without them, "complexity increase" is only a post-hoc label.]

== Fixed charges, caps, and lumpy spillover

The fixed-charge row is the most concrete sparse-attractor toy. Let channels
$j = 1, dots, k$ have action $a_j$, score weight $w_j > 0$, marginal cost
$q_j > 0$, fixed activation cost $F_j >= 0$, and cap $u_j in (0, infinity]$.
For a score deficit $d > 0$, the agent solves

$ min sum_j F_j bb(1){a_j > 0} + sum_j q_j a_j $

subject to

$ sum_j w_j a_j >= d, quad 0 <= a_j <= u_j. $

Write the effective marginal cost per score unit as $r_j = q_j slash w_j$.
The problem is infeasible iff $d > sum_j w_j u_j$.

First, if all caps are infinite, the cost of using only channel $j$ is
$F_j + r_j d$. If the minimiser is unique, the optimum is one-channel:

$ j^*(d) in arg min_j (F_j + r_j d), quad
  a_(j^*) = d slash w_(j^*), quad a_i = 0 " for " i != j^*. $

The active channel can change as pressure rises. Low fixed cost can win for
small deficits; low marginal cost can win for large deficits.

Second, if $F_j = 0$ or activation costs are already paid, finite caps convert
one-channel drift into ordered spillover. Sort channels so
$r_1 < r_2 < dots < r_k$ and define cumulative score capacities
$S_m = sum_(j <= m) w_j u_j$. If $S_(m - 1) < d <= S_m$, then channels
$1, dots, m - 1$ are full, channel $m$ is partially used, and later channels are
unused:

$ a_j = u_j " for " j < m, quad
  a_m = (d - S_(m - 1)) slash w_m, quad
  a_j = 0 " for " j > m. $

Third, positive fixed costs plus caps break universal sorted filling. The exact
object is a finite active-set comparison: for each paid set $M$, pay
$sum_(j in M) F_j$ and fill within $M$ by increasing $r_j$; then choose the
cheapest feasible candidate. A high-marginal, low-fixed-cost channel can win at
small $d$, while a low-marginal, high-fixed-cost channel wins later. The
optimizer may skip the small-deficit channel instead of filling it first.

#claim[*Capped fixed-charge shape.* Uncapped linear or fixed-charge costs can
produce one-channel drift. Caps convert this into lumpy spillover only in the
no-activation or already-activated linear case. Positive activation costs add
entry thresholds and channel switching. _Toy example:_ once a visible benchmark
exploit saturates or becomes detectable, additional pressure can spill into the
next available exploit, but the path is a sequence of thresholded regimes rather
than smooth diffusion.]

== What this licenses for recursive Goodhart

The recursive hypothesis remains live, but it is now better scoped. Repeated
proxy repair may move residual error into dimensions that are less legible, less
represented, lower-rank, cheaper to exploit, or easier to find. The framework
does not say this must happen. It says what would make each version testable:
pre-specified hidden axes, a response model, and a shape measure fixed before
observing the failure.

#claim[*Recursive-Goodhart license after the response-shape pass.* The chapters
license mechanism-level plausibility and conditional predictions: selection
follows baseline tail response; intervention follows cost/search geometry; fixed
charges and caps produce lumpy support paths; low-rank affordances restrict the
image of drift; search priors can bias toward low description length. They do
not license a theorem that residual error generically becomes more complex over
time.]

// =============================================================================
= Appendix A — Currently in progress
// =============================================================================

These are the live research questions feeding the chapters above. Each has a
toy-model partial answer in the working notes; what is missing is generality,
the right level of abstraction, or an adversarial pass that the chapter
treatment would require.

#wip[*An intervention bound for general convex gaming costs.* The
selection-channel bound is $norm(B_H) <= delta dot norm(s)$ (Chapter 2). Is
there an intervention analogue that factors through the agents' cost geometry —
a "gaming budget" — rather than through any divergence from $mu_0$? The
quadratic case gives $Delta = sqrt(2 kappa V)$. Conjecture: a version holds for
general convex gaming costs, with the bound governed by the convex conjugate of
the cost. Section @sec:convex-cost-conjecture states the conjecture and the
Fenchel sketch; the exact theorem is still open.]

#wip[*The exact selection-class condition.* Agents who can only toggle their own
inclusion stay inside the selection class; agents who can move $(P, H)$ at fixed
type do not. The absolute-continuity test is too brittle as a causal boundary:
if the baseline contains $epsilon$ mass on gaming-like behaviour, the induced
post-policy law may still satisfy $mu_theta << mu_0$ even though the policy
changed the response kernel. The wanted theorem should classify response
kernels at fixed type, including intermediate cases where agents can move $P$
but not $H$, or can move only within a sub-manifold.]

#wip[*Adaptive hardening dynamics.* A principal that each period hardens
whichever measured channel is currently most-gamed (lowers its $kappa_j$) drives
$K_M$ down over time. Does this converge to no-gaming ($K_M < t^2 slash (2 V)$),
and how fast? Is "harden the active channel" optimal among principal policies,
or does committing to a narrow, hard-to-game $M$ from the start dominate?
Currently only a heuristic argument that attrition eventually wins.]

#wip[*The measurement frontier.* The principal must measure enough channels to
recover real signal about $G$, but every gameable channel measured enlarges the
attack surface $K_M$. Characterise the frontier between "informative enough" and
"small enough attack surface". Is it ever empty — i.e. are there goal/proxy
geometries where no admissible measured set is both informative and safe?]

#wip[*Sub- vs. super-modularity of $H(M)$.* In the measured set $M$ the
unit-weight equal-harm additive case is modular-trivial ($H = t$ on the gaming
region, with a discontinuity at the $K_M = K_"min"$ boundary) and conjunctive is
modular ($H = t abs(M)$). Weighted aggregation and population entry may be
genuinely sub- or super-modular — which would say something about whether greedy
principal policies (add/remove one channel at a time) are sane. Not yet
computed.]

#wip[*Response-shape comparisons after Chapter 4.* Chapter 4 narrows Q18 to
conditional response-shape predictions. The next step is to compare capped
fixed-charge response against active-face quadratic response under the same
hidden coordinates; specify a low-rank affordance model with a fixed value
basis; and build a search-prior toy where description length is fixed before the
failure is observed. These are simulation/theorem tasks, not claims already
licensed by the chapter.]

#wip[*A worked recursive toy.* Appendix G is still a cartoon until paired with a
time-indexed proxy-repair example. The useful target is not another slogan but a
pre-specified response-shape change across rounds: for example, a principal
closes the currently visible low-cost channel, agents move to the next cheapest
hidden channel under capped fixed-charge costs, and a pre-declared legibility or
support-size statistic changes in the predicted direction. Without that
pre-specified statistic, the recursive thesis should remain illustrative.]

#wip[*Per-agent vs. population welfare.* For heterogeneous quality $Q$, aggregate
gaming harm is $EE[(t - Q) bb(1){0 < t - Q <= sqrt(2 K_M V)}]$ in the
unit-weight additive model. How does this change under proxy noise, nonlinear
costs, and endogenous $V$ — and which aggregate (per-gamer, population total,
population mean, tail) is the right welfare object for the framework? The
chapters above currently slide between these; the book version should not.]

#wip[*Mapping $kappa$ to neural training.* In the Stackelberg toy model,
$kappa$ is a scalar ease-of-gaming parameter. For RLHF or benchmark-driven
finetuning, the analogue might be gradient accessibility, pretraining density,
benchmark contamination, reward-model feature simplicity, or optimiser search
efficiency. These are not interchangeable. A useful ML version of the theory
has to say which one predicts reward hacking under a specified training setup,
and what observation would distinguish it from the others.]

#wip[*Endogenous stakes / performative fixed points.* Make $V$ endogenous:
selection is valuable only if the metric is trusted, and trust decays as gaming
is observed. Does the principal–agent game have a performative-stable fixed
point, and does hidden harm persist at it? Sketched as a Stackelberg toy with a
trust state variable; the fixed-point analysis is not done.]

// =============================================================================
= Appendix B — Future open questions (not currently pursued)
// =============================================================================

These surfaced during the work and are recorded for later. They are not blocking
anything in Chapters 1–4, and most need a substantial new piece of machinery.

#openq[*Spectral / basis decomposition of the error.* Three decompositions, each
carrying different information, should be kept distinct: (i) the SVD of $phi$ —
right singular vectors are the $G$-directions $phi$ distinguishes; small singular
values mark structural blind spots, decomposing the *dimension gap*; (ii) the
eigendecomposition of $"Cov"(epsilon)$ — principal directions of measurement
noise, decomposing the *observation gap*; (iii) the selection-induced shift of
$G$ — compare the law of $G(s)$ before and after restricting to the selected set,
the most diagnostic of actual Goodhart and the least obvious to compute. The
bad-case corner is the *conjunction*: a $G$-direction where $phi$ has a small
singular value (low signal), $"Cov"(epsilon)$ has mass (high noise), and the
selection shift is large.]

#openq[*Value-weighted Goodhart susceptibility.* PCA/SVD is value-neutral;
Goodhart is value-laden. A huge principal component orthogonal to the value
structure of $G$ is harmless; a tiny one aligned with a load-bearing
$G$-dimension can dominate harm. Proposed scalar per $G$-direction: (value
importance) $times$ ($1 slash$ singular value of $phi$) $times$ (noise variance)
$times$ (selection shift), under a value-weighted inner product on $G$-space.
*Open:* whether the value-weighting requirement makes this a non-starter in
practice, or whether reasonable proxies for value importance (the principal's
true utility gradient, or a proxy for it) recover useful structure. *Also open:*
a strategic system can shape $epsilon$ to lie in low-variance components of the
historical observation while remaining maximally goal-harmful, so PCA-based
detection is geometrically blind to value-aware adversaries — does the
value-weighted version close that hole?]

#openq[*Pareto selection rather than scalarisation.* Chapter 2 scalarises (a
weighted score, then a threshold). Pareto-frontier selection preserves diversity
across measured dimensions in a way scalar thresholding destroys. When does
selecting the Pareto-undominated set compress the selected distribution enough to
break identifiability of the *unmeasured* dimensions — and when does it not? This
is a different selection operator and needs its own response theory.]

#openq[*The $phi$-as-partial-observation alternative.* The chapters fix
$phi : RR^m -> RR^k$ as the principal's intended correspondence. An alternative
is to represent the proxy as a partial observation of $G$ plus independent
artifacts, which changes what "$ker phi$" means and may interact better with
partial-hypothesis formalisms. Worth a comparison; not done.]

#openq[*Incomputable noise and agents more complex than their principals.* If a
human writes a proxy intended to align a system whose objectives have *more*
dimensions than the human's, the proxy contains error in directions the human's
$G$ has no coordinate for — error that cannot be scored, only suffered. Can
partial hypotheses (in the style of infra-Bayesianism) recover any handle on
this? And: is there any reason to expect a more capable system to have *fewer*
goal dimensions than a human, rather than more? Both are wide open and somewhat
speculative.]

// =============================================================================
= Visual appendices
// =============================================================================

The following appendices are visual rather than foundational. Appendices C--F
illustrate claims made in the formal chapters: selection drift depends on
baseline response curves, dimensional scaling requires coupling assumptions,
intervention channels transport mass rather than reweight it, and adding
measured dimensions changes gaming through aggregation and cost geometry.
Appendix G is different: it sketches a broader recursive-Goodhart hypothesis
motivated by the framework but not proved by it. The formal chapters do not show
that residual error generically becomes more dimensional or more complex under
repeated proxy refinement; Chapter 4 instead gives conditional response-shape
predictions, and shows which quantities would have to be measured for such a
claim to become precise. Appendix H illustrates those Chapter 4 predictions:
quadratic cost can spread response, fixed-charge/linear cost can concentrate it,
and caps plus activation costs can create lumpy spillover rather than a universal
complexity increase.

// =============================================================================
= Appendix C — Selection drift is coupling-dependent, not dimension-dependent
// =============================================================================

The selection results in Chapter 2 are deliberately conditional. A proxy
threshold moves hidden coordinates through the baseline response curve
$b_H(t) = EE[H mid(|) P >= t] - EE[H]$. In the Gaussian-linear model,
covariance ratios summarize this curve. Outside that model, covariance is only a
local linear summary and can miss the tail response that selection actually
uses.

#figure(
  image("figures/appendix-c-selection-thresholds.pdf", width: 100%),
  caption: [
    Selection only moves hidden dimensions through the baseline response curve.
    In the Gaussian-linear case, covariance summarizes this response. Outside
    that case, covariance can vanish while threshold response remains large. The
    right primitive is not baseline covariance but the selection response
    $EE[H mid(|) P >= t] - EE[H]$.
  ],
) <fig:selection-thresholds>

The same point controls dimension. More hidden dimensions do not automatically
create more drift. Dimensional growth appears only when adding dimensions also
adds coupling to the selected proxy.

#figure(
  image("figures/appendix-c-dimensional-scaling.pdf", width: 72%),
  caption: [
    More hidden dimensions do not automatically imply more Goodhart drift.
    Dimensional scaling appears only when adding dimensions also adds coupling
    to the selected proxy. If total coupling is conserved, hidden drift need not
    grow with dimension.
  ],
) <fig:dimensional-scaling>

// =============================================================================
= Appendix D — Selection versus intervention as reweighting versus transport
// =============================================================================

#figure(
  image("figures/appendix-d-selection-vs-intervention.pdf", width: 88%),
  caption: [
    Selection reweights; intervention transports. A selection policy can only
    increase the weight of states already present in the baseline distribution.
    An intervention channel changes the state-generating mechanism, moving mass
    into regions the baseline never visited. This is why the selection-channel
    drift bound has no baseline-only analogue for intervention channels.
  ],
) <fig:selection-vs-intervention>

The Stackelberg toy model in Chapter 3 is the smallest algebraic version of the
right panel. At baseline, $H = 0$. After the metric is announced, an agent can
pay cost $a^2 slash (2 kappa)$ to raise the proxy by $a$, and selection is worth
$V$. In the noiseless threshold case, the gaming band has width
$Delta = sqrt(2 kappa V)$: agents with $Q in [t - Delta, t)$ game just enough to
pass. The resulting proxy bias and hidden harm depend on $kappa$ and $V$, not on
baseline hidden variance. Indeed, the baseline hidden variance is zero in this
toy model.

// =============================================================================
= Appendix E — Adding measured dimensions can expand the attack surface
// =============================================================================

Under additive aggregation, the agent can substitute between measured gaming
channels. For unit weights and quadratic costs, the cost-minimal allocation for
score threshold $t$ is $a_j = t kappa_j slash K_M$, where
$K_M = sum_(j in M) kappa_j$. The minimum cost is $t^2 slash (2 K_M)$, so gaming
occurs iff $K_M >= t^2 slash (2 V)$. Adding a gameable measured dimension weakly
increases $K_M$ and weakly lowers the cost of reaching the same score deficit.

#figure(
  image("figures/appendix-e-additive-substitution.pdf", width: 68%),
  caption: [
    Under additive aggregation, adding a gameable measured dimension can lower
    the cost of reaching the score threshold. The per-agent harm for a fixed
    pure-gaming score deficit may be conserved under equal harm-per-score
    assumptions, but the population of agents for whom gaming is worthwhile
    expands as aggregate gaming capacity increases.
  ],
) <fig:additive-substitution>

The sign of a "more metrics" result is therefore not determined by the number of
dimensions. It is determined by the aggregation rule.

#figure(
  image("figures/appendix-e-additive-vs-conjunctive.pdf", width: 82%),
  caption: [
    Aggregation rule controls dimensional effects. Additive scorecards permit
    substitution across dimensions; conjunctive scorecards require clearing
    every measured dimension. Thus adding metrics can either create cheaper
    routes to the same score or raise the cost of passing, depending on how the
    metric aggregates.
  ],
) <fig:additive-vs-conjunctive>

// =============================================================================
= Appendix F — Exchange-rate condition for conservation
// =============================================================================

The narrow conservation result in the additive model assumes that a point of
score inflation is equally socially harmful no matter which channel supplies it.
With weighted additive score $sum w_j a_j$, quadratic costs, and hidden harm
$sum h_j a_j$, the fixed-deficit harm is

$ H_M(d) = d dot (sum_(j in M) h_j kappa_j w_j) / (sum_(j in M) kappa_j w_j^2). $

#figure(
  image("figures/appendix-f-exchange-rate-condition.pdf", width: 78%),
  caption: [
    Re-routing conserves harm only when social harm uses the same exchange rates
    as the score. If $h_j = c w_j$ on the active measured set, then every unit
    of score inflation is equally socially harmful and per-agent harm is
    conserved. Otherwise, moving weight across channels can raise or lower harm.
  ],
) <fig:exchange-rate-condition>

// =============================================================================
= Appendix G — A speculative recursive-Goodhart cartoon
// =============================================================================

This appendix is not a theorem of Chapters 1--4. It is a cartoon of a broader
empirical hypothesis suggested by the framework. The axes labelled $h_1$ through
$h_5$ are deliberately not proxy dimensions. They stand for outcome-relevant
properties of the policy or model that the proxy stack does not fully capture:
long-horizon effects, strategic pressure, rare-context behaviour, objective
stability, institutional fit, or whatever the domain-specific hidden variables
turn out to be. The cartoon assigns them synthetic, mixed movements because the
framework alone does not say whether their correlations with the monitored proxy
dimensions are positive, negative, or close to zero.

The hypothesis would earn support if successive proxy patches predictably
reduced visible residuals while increasing residuals on pre-specified hidden
dimensions that were less legible, less represented in training/evaluation, or
cheaper to exploit. It would lose support if hidden residuals improved along
with the monitored axes, moved idiosyncratically with no relation to legibility
or cost, or if the cheapest route to high score became genuinely goal-improving
rather than merely less visible.

Chapter 4 supplies the guardrail for reading this cartoon. A recursive pattern
should not be inferred from "complexity" after the fact. The hidden axes, the
response geometry, and the relevant shape measure — support, rank, description
length, cost, or search accessibility — must be specified before the patching
sequence is used as evidence.

#figure(
  image("figures/appendix-g-recursive-goodhart-cartoon.pdf", width: 83%),
  caption: [
    Speculative recursive-Goodhart cartoon. As more proxy dimensions are
    explicitly constrained, the cheapest route to high score changes. The
    monitored axes can improve while unproxied hidden dimensions $h_1, dots, h_5$
    move differently, depending on their empirical correlations with the proxy
    stack and on the available gaming channels. In favorable cases, hidden
    outcome quality improves too. In unfavorable cases, residual error moves
    into dimensions that are less legible to the evaluator, less represented in
    the training signal, or cheaper for the model to exploit. The plotted values
    are synthetic and illustrative; they are not empirical measurements, and the
    hypothesis needs pre-specified hidden dimensions before it can be tested.
  ],
) <fig:recursive-goodhart-cartoon>

// =============================================================================
= Appendix H — Response-shape predictions are conditional
// =============================================================================

Chapter 4 replaces the generic minimum-complexity attractor story with a
conditional response-shape story. The relevant visual distinction is between the
shape of the feasible target set and the geometry that selects one feasible
response. Quadratic costs select a smooth minimum-cost direction; linear or
fixed-charge costs can select one route; caps force spillover only after a route
saturates.

#figure(
  image("figures/appendix-h-response-geometry.pdf", width: 100%),
  caption: [
    Response geometry selects the residual shape. A quadratic cost can spread
    effort along $C w$; a linear or fixed-charge model can concentrate effort on
    the cheapest route; a cap converts that concentration into spillover. None
    of these is a generic law of increasing complexity.
  ],
) <fig:response-geometry>

Positive activation costs make the capped story less smooth. The optimizer may
use a cheap-to-start channel for small deficits, then switch to a different
channel with lower marginal cost once the deficit is large enough to justify the
entry cost. Thus the robust prediction is lumpy regime change, not universal
sorted filling.

#figure(
  image("figures/appendix-h-fixed-charge-caps.pdf", width: 88%),
  caption: [
    Fixed charges plus caps produce active-set switches. In this example, a
    high-marginal, zero-fixed-cost channel wins at small deficits, but a
    low-marginal, positive-fixed-cost channel wins later. The optimizer can skip
    the small-deficit route instead of filling it first.
  ],
) <fig:fixed-charge-caps>

#bibliography("refs.bib", title: "References", style: "association-for-computing-machinery")
