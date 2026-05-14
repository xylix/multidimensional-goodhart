// Multidimensional Goodhart — draft of Chapters 1–7
// Compile with:  typst compile multidimensional-goodhart.typ
//
// Source material: research/formalization.md, research/threads/*.md,
// research/iteration_log.md, draft.md (this repo). This is an *expository*
// rewrite of the research-journal content; the journal's iteration history
// is preserved in remarks/footnotes rather than in the main text.

#set document(title: "Multidimensional Goodhart", author: "Xylix Pelttari")
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
#let proposition(num, title, body) = claim[
  *Proposition #num (#title).* #body
]
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
#let per = "per"
#let pop = "pop"

#align(center)[
  #v(2cm)
  #text(size: 2.1em, weight: "bold")[Multidimensional Goodhart]
  #v(0.4cm)
  #text(size: 1.2em)[How measurement reshapes the terrain under measurement]
  #v(1cm)
  #text(size: 1em)[Working draft — Intro and Chapters 1–7]
  #v(0.3cm)
  #text(size: 0.95em, style: "italic")[#datetime.today().display()]
]
#v(2cm)

#outline(depth: 2, indent: auto)

// =============================================================================
= Intro: Working spine
// =============================================================================

== The empirical phenomenon

The empirical phenomenon I want this paper to help science model is not just
"the proxy stops working". Scalar Goodhart already says that. The phenomenon is:
optimization pressure reshapes the residual error landscape. Once a measure is
used for control, the error between the proxy and the target gets a structure:
direction, support, curvature, tail behavior, exchange rates, and response
dynamics. If the system is multidimensional, that structure is the interesting
object. The proxy can fail by drifting along hidden goal coordinates, by
changing the coupling between visible and hidden variables, by recruiting new
agents into gaming, by moving from one cheap action channel to another, or by
changing which residuals remain legible to the evaluator.

The licensed claims in this draft are deliberately narrower than that
phenomenon. In a pure selection channel, hidden drift is a baseline-response
object and admits two Cauchy--Schwarz bounds: a coordinate-explicit Euclidean
bound after hidden coordinates are declared, and a declared value/operator bound
after the value metric is declared. In a toy intervention channel, quadratic
Stackelberg gaming gives a wedge of width $sqrt(2 kappa V)$, while the convex
score-deficit proposition gives a private-cost budget only after action geometry
is declared. In multidimensional scorecards, additive and conjunctive
aggregation have different signs, and additive fixed-deficit conservation holds
only under the harm-per-score exchange-rate condition. In response-shape
claims, quadratic costs, fixed charges, caps, low-rank affordances, and search
priors are guardrails on different models, not evidence for a generic
complexity attractor. For applications, the transfer rule is the
response-modeling contract: declare type, response channel, action/search
geometry, aggregation, hidden harm, and falsifiers before importing any
calculation.

The obvious objection is that this could become a way of naming the residue
after the fact. If the story is "there were many dimensions, something bad
happened in one of them, and now we call it multidimensional Goodhart", then
that is not a theory. The point of the framework has to be stronger and more
brittle: before seeing the next failure, it should say which response model is
being claimed and what shape of distortion that model predicts.

== Why this approach

I do not think the right claim is "more dimensions means more Goodhart". That
failed almost immediately. In a pure selection model, if hidden coordinates are
independent of the selected proxy, thresholding does not move them. Even when
they move, the dimension count enters through a coupling or variance budget, not
by itself. The elementary intuition is worth keeping visible: an added measured
coordinate can be positively associated with a hidden value coordinate,
negatively associated with it, or approximately unrelated to it; under selection
these three cases can respectively move the selected population toward that
hidden value, away from it, or not much at all. This is obvious as a matter of
correlation and conditional expectation, but it is one of the main reasons
dimension count alone cannot carry the theory. I also do not think the right
claim is "Goodhart pressure makes
residual error more complex". Selection channels do not optimize residuals at
all; they reweight a baseline. Intervention channels optimize according to cost,
search, caps, fixed charges, and aggregation. Complexity only becomes predictive
after the response geometry and the complexity measure are named in advance.

The narrower motivation is that scalar Goodhart is often doing two different
compressions at once. First, it compresses the target into a single number.
Second, it compresses the residual error into a single loss, usually without
declaring the metric that says which directions of error are comparable. That is
not wrong when the scalar value functional is genuinely part of the model: a
declared $v dot H$, utility function, or loss norm is exactly what Chapter 3's
operator bound asks for. But if the scalar is only a reporting convenience, it
can make incomparable errors look interchangeable. A proxy can improve in the
reported scalar while moving along a hidden direction that the scalarization has
priced at zero, or while trading a small loss on a high-value coordinate for a
large gain on a low-value coordinate because the weights were inherited from the
dashboard rather than from the goal.

The opposite repair, running scalar Goodhart separately on each coordinate, also
loses the object of interest. Coordinate-wise analyses can tell us whether each
proxy component becomes noisy, biased, or gameable on its own. They do not by
themselves say how the error vector moves: whether gaming substitutes across
dimensions, whether a closed channel spills pressure into another, whether a
conjunctive gate changes the active constraint set, or whether a Pareto rule
preserves diversity that a weighted sum would collapse. Those are geometric
questions about the response channel and aggregation rule. The multidimensional
framework is motivated by this gap: not by the claim that scalar models are
false, but by the claim that scalar models silently choose, or omit, the metric
that makes the residual shape intelligible.

The specific approach here is to make proxy-induced distortion modelable. That
requires more objects than scalar Goodhart usually keeps visible. A model has to
say whether pressure only reweights fixed states or changes behavior at fixed
type. It has to say what the hidden coordinates are, how proxy components are
aggregated, what actions are feasible, what they cost, what hidden harm
functional is being protected, and what evidence would distinguish the proposed
response channel from nearby alternatives. Without those declarations, "the
metric broke" is too underspecified to imply a prediction.

This is why the selection/intervention split matters. In a selection channel,
the policy changes weights over a fixed baseline distribution. Then the natural
tools are statistical: covariance as local velocity, threshold response curves,
weighted selection response, and reweighting bounds. In an intervention channel,
the policy changes the response kernel at fixed type. Then the natural tools are
geometric and economic: action spaces, cost functions, caps, fixed charges,
stakes, feasible sets, and support functions. The same observed score movement
can be selection in one declared type space and intervention in another, so the
type/action representation is not a nuisance caveat. It is where the empirical
claim enters.

== What looks promising

The promising part is that several pieces already have the right shape. For
selection, the framework gives response functionals of the baseline
distribution. Covariance is not promoted into a universal primitive; it is the
local derivative of hidden drift under infinitesimal Boltzmann selection only
on the finite-mgf domain where that path exists and is differentiable.
Threshold response handles hard cutoffs. Weighted response handles generic
reweighting. The chi-square selection bound says that, once the hidden
coordinates and norm are declared, bounded reweighting plus bounded baseline
hidden variance implies bounded hidden drift. That is not a grand theorem, but
it is exactly the kind of baseline-only statement selection deserves.

For intervention, the promising part is that the controlling quantities are not
baseline statistics. In the quadratic Stackelberg toy, the gaming wedge is
$sqrt(2 kappa V)$: ease of gaming times stakes, not a property of last year's
joint distribution. In the convex sketch, the analogue is an affordable-action
envelope or score-deficit cost derived from the agents' cost geometry. In
fixed-charge and capped models, pressure creates active-set switches and lumpy
spillover. These are not the same prediction, which is the point. Once the
response geometry is declared, different mathematical tools predict different
distortion shapes.

The multidimensional scorecard results are also promising because they explain
why proxy repair can have signs that scalar Goodhart cannot express. Under an
additive compensatory score, adding an independently gameable dimension can
lower the cheapest cost of clearing a score deficit and recruit more agents into
gaming, raising $H_pop$ through entry. Under a conjunctive score, the same added
dimension can block substitution but raise per-gamer burden and false-negative
risk, so the population sign depends on entry. Conservation of $H_per$ appears
only under an exchange-rate condition: hidden harm must be proportional to score
contribution on the active channels. This is the
kind of claim I want from the paper: not "more metrics are bad", but "given this
aggregation rule and these exchange rates, here is the distortion geometry".
Notice the parallel with the selection case, but also the difference. For
selection, the basic question is how the added metric depends on hidden
coordinates in the baseline distribution. For intervention, the basic question
is action geometry: which score-improving moves the metric opens, blocks, or
makes redundant, and how those moves affect hidden value. The two can be related
empirically, but they are not the same mathematical primitive.

The live work-in-progress questions (collected as a bulleted inventory below)
belong here in the spine rather than as a separate shopping list. A general
convex intervention bound is promising if it stays conditional
on action geometry, stochastic response, stakes, and hidden harm. Application
evidence standards are promising if they force each case to declare type,
response kernel, action traces, and falsifiers. Adaptive hardening is promising
as a dynamic question: hardening the currently exploited channel lowers
$kappa_j$, but whether that converges faster than choosing a narrow hard metric
from the start is open. The measurement frontier is promising because it names
the regulator's real tradeoff: measure enough dimensions to recover signal while
not adding so much independent gaming capacity that the attack surface wins.

== What does not look promising

Several tempting framings should be rejected by name.

Unconditional dimensional scaling does not work. More hidden coordinates do not
automatically imply more Goodhart; the claim needs a coupling model and a harm
functional.

Baseline covariance as a universal primitive does not work. With nonlinear tail
dependence, hidden drift can be zero-covariance and still move under threshold
or finite soft selection.

Absolute continuity as the causal intervention boundary does not work. If the
baseline has even epsilon mass on gaming-like behavior, an announced metric can
change fixed-type behavior while the post-policy law remains absolutely
continuous. The boundary has to be response-kernel change relative to a declared
type representation.

Generic minimum-complexity attraction does not work. Quadratic costs select
minimum-cost directions, which can be dense. Selection follows baseline tails.
Fixed charges, low-rank affordances, or search priors can produce sparse or
low-description-length failures only when those mechanisms are specified first.

Strong additive conservation does not work. Re-routing conserves $H_per(M, d)$
only when harm-per-score exchange rates match. Change weights, harm
coefficients, or the participating population, and the relevant welfare object
changes.

The scalar-$kappa$ mapping to neural training does not work yet. In the toy
model, $kappa$ is ease of gaming. In RLHF or benchmark-driven finetuning, the
analogue might be gradient accessibility, pretraining density, benchmark
contamination, reward-model feature simplicity, or optimizer search efficiency.
Those are not interchangeable.

So the rest of the paper answers a narrower and better question: does
multidimensional Goodhart make proxy-induced distortion modelable, by predicting
the shape of distortion from the declared response channel, aggregation rule,
and action geometry, in regimes where scalar Goodhart can only say that
optimization pressure broke the proxy?

== Work in progress

Threads that are live in the sense that fragments of math exist but are not
yet promoted into the formal chapters. They shape what the rest of the book
is trying to prove.

- *Convex intervention budget.* The selection-channel bound governs hidden
  drift through a chi-square / reweighting budget on baseline statistics.
  The intervention analogue (@sec:convex-cost-bound) gives a score-deficit
  cost after declaring a finite-dimensional action space, linear score gain,
  convex agent cost, and regularity condition. The quadratic case recovers the
  $sqrt(2 kappa V)$ wedge. What remains open is not the convex-duality
  calculation, but the application mapping: stochastic response, participation,
  hidden harm, and the link between selection value and realised action cost.

- *Evidence standards / domain templates.* Chapter 6 states the
  response-modeling contract abstractly. The in-progress work is per-domain
  instantiation — ML evaluations, RLHF and finetuning, institutional
  scorecards, scientific metrics — each naming concrete referents for
  $kappa$, $V$, type space $U$, response kernel $K_theta$, action/cost
  geometry, aggregation rule, and hidden welfare model. The template must
  force a declaration of falsifiers and action traces, not degenerate into a
  generic checklist.

- *Adaptive hardening.* A regulator that each period lowers $kappa_j$ on
  whichever measured channel is currently most-gamed drives aggregate gaming
  capacity $K_M$ downward. Open: does this policy converge to no-gaming
  ($K_M < t^2 slash (2V)$), and at what rate? Does it dominate the
  alternative of committing from the start to a narrow hard-to-game measured
  set $M$?

- *Measurement frontier.* The dual of hardening. More measured channels
  recover more real signal about $G$ but enlarge the gaming attack surface
  $K_M$. Characterise the frontier between "informative enough" and "small
  enough attack surface" — including whether the frontier is sometimes
  empty (no good choice exists).

- *Response-shape simulation comparison.* The Chapter 5 conditional menu —
  quadratic costs spread drift along $C w$; fixed activation or linear costs
  concentrate drift in the uncapped no-tie case; caps and convex
  post-activation costs spread it again, sometimes lumpily; low-rank action
  maps restrict drift to $"im"(L)$ — has not been simulated head-to-head
  under a fixed hidden coordinate system and a pre-specified shape measure
  (support size, rank, KL from a max-entropy prior, description length under
  a fixed coding). This is the cheapest next test of the menu before any row
  is upgraded.

- *Recursive toy model.* Appendix E draws a cartoon; the formal chapters do
  not prove that successive proxy patches push residual error into
  less-legible dimensions. Needed: a two- or three-round refinement model
  with declared hidden dimensions, a declared response geometry, and a
  legibility measure fixed *before* the patching sequence is used as
  evidence. Without that, the recursive hypothesis is not yet testable.

- *Per-agent versus population welfare.* The additive gaming section now
  separates fixed-deficit harm $H_per(M, d)$ from population harm
  $H_pop (M, F_Q, V)$. In the unit-weight equal-harm model,
  $H_pop = EE[(t - Q) bb(1){0 < t - Q <= sqrt(2 K_M V)}]$ for heterogeneous
  quality $Q$. Open: which population welfare object is right under noise,
  nonlinear costs, and endogenous $V$?

- *ML mappings for $kappa$.* In the toy Stackelberg model $kappa$ is scalar
  ease of gaming. In RLHF, finetuning, and benchmark-driven optimisation,
  candidate referents include gradient accessibility, pretraining density,
  benchmark contamination, reward-model feature simplicity, and optimizer
  search efficiency. These are not interchangeable. Open: which carry the
  load of $kappa$, jointly or separately, and which (if any) are measurable
  from training-time signals rather than only post-hoc.

- *Endogenous stakes.* Selection value $V$ is treated as exogenous, but
  trust in a metric decays as gaming is observed, so $V$ falls as the metric
  is used. Open: does the regulator–agent game with endogenous $V$ have a
  performative-stable fixed point, and does that fixed point still carry
  hidden harm rather than collapsing to zero gaming and zero stakes? A tempting
  toy closure is $V(H_"obs") = V_0 exp(-gamma H_"obs")$, but this book does not
  solve that fixed point. Endogenous $V$ changes the response channel itself
  and needs a separate performative-response model specifying what $H_"obs"$ is,
  how agents forecast it, and how the regulator updates the metric. Until then,
  all Stackelberg and convex-cost calculations use exogenous $V$.

== Open questions

A separate class of questions surfaced during this work and is deliberately
*not* on the critical path. Each needs a substantial new piece of machinery;
none of them blocks Chapters 1–7. They are recorded here so they are not
rediscovered from scratch.

- *Spectral / basis decomposition of the error.* Three decompositions
  carrying different information should be kept distinct: the SVD of $phi$
  (right singular vectors are the $G$-directions $phi$ distinguishes; small
  singular values mark structural blind spots in the *dimension gap*); the
  eigendecomposition of $"Cov"(epsilon)$ (principal directions of
  measurement noise, the *observation gap*); and the selection-induced shift
  of $G$ before vs after restricting to the selected set — the most
  diagnostic of actual Goodhart and the least obvious to compute. Bad-case
  corner: a $G$-direction where $phi$ has small singular value,
  $"Cov"(epsilon)$ has mass, and the selection shift is large. Each
  decomposition is easy individually; open whether the joint object is
  useful without first declaring a value-weighting on $G$-space.

- *Value-weighted Goodhart susceptibility.* PCA/SVD is value-neutral;
  Goodhart is value-laden. A huge principal component orthogonal to the
  value structure of $G$ is harmless; a tiny one aligned with a load-bearing
  $G$-coordinate can dominate. Proposed scalar per $G$-direction: (value
  importance) $times$ ($1 slash$ singular value of $phi$) $times$ (noise
  variance) $times$ (selection shift), under a value-weighted inner product
  on $G$-space. Open: whether reasonable proxies for value importance (the
  principal's true utility gradient or a proxy for it) recover useful
  structure, and whether the value-weighted version closes the geometric
  blind spot of PCA-based detection against value-aware adversaries who
  route $epsilon$ into low-variance components of historical observation.

- *Pareto selection rather than scalarisation.* Chapter 3 fixes a weighted
  score and then a threshold. Pareto-frontier selection is a different
  operator: it preserves diversity across measured dimensions in a way
  scalar thresholding destroys. Open: when does selecting the
  Pareto-undominated set compress the selected distribution enough to break
  identifiability of the *unmeasured* dimensions, and when does it not?
  Chapter 3's selection-channel response theory does not transport to it
  for free.

- *$phi$-as-partial-observation alternative.* The chapters fix
  $phi : RR^m -> RR^k$ as the principal's intended correspondence and read
  $ker phi$ as the dimension gap. An alternative represents the proxy as a
  partial observation of $G$ plus independent artifacts; this changes what
  "$ker phi$" means and may interact better with partial-hypothesis
  formalisms in the style of infra-Bayesianism. Worth a side-by-side
  comparison once a live thread settles; doing it prematurely risks
  rebuilding the same machinery in a different alphabet.

- *Incomputable noise / over-dimensional agents.* If a human writes a proxy
  intended to align a system whose objectives have *more* dimensions than
  the human's, the proxy contains error in directions the human's $G$ has
  no coordinate for — error that cannot be scored, only suffered. Open:
  whether partial hypotheses (infra-Bayesian style) recover any handle on
  this, and whether there is any reason to expect a more capable system to
  have *fewer* goal dimensions than its principal rather than more.
  Recorded because the multidimensional framing makes the question
  articulable; parked because none of the current tools answers it.

The shared property of the five parked questions is that each requires new
machinery — a value-weighted norm on $G$-space, a Pareto-selection response
operator, a partial-observation rephrasing of $phi$, a partial-hypothesis
formalism, or a precise sense in which the agent has more goal dimensions
than the principal. They are blocked on the right object to define, not on
effort.

// =============================================================================
= Existing Goodhart formulations and their scope
// =============================================================================

== Genealogy and formal status

The phrase "Goodhart's law" now points to several related claims that should
not be treated as one theorem. Goodhart's original monetary-policy warning was
about observed statistical regularities collapsing when used for control
@goodhart1975. Campbell's social-science version emphasized that quantitative
social indicators are corrupted by decision pressure @campbell1979. Strathern's
later formulation compressed the point into the familiar target/measure slogan
@strathern1997. These are useful genealogy, but in this book they are not used
as theorem statements.

The formal-status ancestor is Lucas's policy-evaluation critique @lucas1976critique.
Its relevant content is not "metrics are bad"; it is that a reduced-form
relation estimated under one policy regime need not be invariant when the
policy changes, because decision rules can change with the regime. In the
language used below, Lucas is a response-kernel warning: a policy parameter can
change the joint distribution of observables, so a calculation that holds the
old distribution fixed is not licensed unless the response channel has been
declared. This is one reason the book separates pure selection from
fixed-type intervention.

== Taxonomy is not a theorem

Manheim and Garrabrant's taxonomy @manheim2018categorizing is the cleanest
local vocabulary for the variants: regressional, extremal, causal, and
adversarial Goodhart. The categories are not mutually exclusive; a single
application can have regressional selection, extremal tails, and strategic
response at once. The taxonomy is useful because it names distinct mathematical
phenomena that a model should not collapse into one slogan. Regressional and
extremal components can often be modeled as selection against a fixed baseline;
causal and adversarial components require a response process. But the taxonomy
by itself supplies no bound, cost geometry, welfare functional, or falsifier.
The response-modeling contract in Chapter 6 is where a concrete Goodhart claim
has to say which components are present and what observation would make that
classification fail.

== Scalar anchor: tail-conditioned selection

The scalar mathematical anchor for this book is El-Mhamdi and Hoang's
tail-conditioned analysis @el-mhamdi2024goodhart. Their setup has a goal $G$, a
proxy $nu = G + xi$, independence $G perp xi$, and selection of the top
$alpha$ values of $nu$. Two theorem families are the reference point here.

First, in the bounded-goal / exponential-discrepancy case, with
$G$ uniform on $[0, 1]$, $xi$ exponential, and noise-to-signal ratio
$epsilon = "Var"(xi) slash "Var"(G)$, sufficiently strong top-$alpha$
selection yields $rho_alpha = 0$ and

$ EE_alpha[G] = (1 slash lambda) dot (lambda e^lambda - e^lambda + 1) slash
  (e^lambda - 1) = 1 - epsilon sqrt(12) + O(epsilon^2). $

Second, in the power-law case, with $G$ having tail exponent $gamma > 3$ and
$xi$ tail exponent $beta > 3$, $beta != 4$, the critical selection pressure
scales as

$ alpha ~ sqrt((beta - 1) slash (beta - 3)) dot epsilon, $

and the selected correlation tends to the explicit negative limit

$ rho_alpha -> max{-sqrt((beta - 3) slash (2(beta - 2))), -1 slash (beta - 2)}. $

This is the right anchor because it is a sharp scalar result about selection
on a proxy with a target/discrepancy split. It also shows exactly where this
book is doing something different. Chapter 3's selection propositions do not
try to recover El-Mhamdi and Hoang's tail rates. They give a looser envelope:
after hidden coordinates and a value norm are declared, pure reweighting obeys
a Cauchy--Schwarz drift bound in terms of
$sqrt(chi^2(mu_theta parallel mu))$ and baseline hidden variance. El-Mhamdi and
Hoang are sharper under independence and named tail families; the book's
selection bound covers arbitrary dependence and arbitrary baseline
distributions but can become uninformative at extreme selection depths.

Majka and El-Mhamdi's independence-free extension @majka2025goodhart is the
closest outside work to the book's independence stance. It keeps the scalar
target/discrepancy paradigm but removes $G perp xi$, showing that light-tailed
goal plus light-tailed discrepancy keeps the qualitative effect, while a
heavy-tailed discrepancy changes the rate. That result is still scalar and
tail-structured; it is not a vector theorem. It belongs here as a sharp
external neighbor, not as a replacement for the multidimensional envelope.

Smith and Winkler's optimizer's curse @smith2006optimizerscurse is a useful
precursor inequality: optimizing over noisy estimates biases the chosen
estimate upward relative to the chosen option's true value. It supports the
selection-bias intuition, but it is not a Goodhart theorem for response
channels, multidimensional targets, or welfare harm.

== What this chapter does not generalize

This chapter does not turn Strathern, Campbell, or the Manheim--Garrabrant
taxonomy into formal assumptions. It uses them to locate the problem. The
formal anchor is narrower: scalar proxy selection with declared target and
discrepancy variables. The next chapter generalizes only the selection-channel
part of that story. It does not generalize every Goodhart slogan, does not
claim that the taxonomy is complete, and does not license causal or
adversarial claims without a response model.

// =============================================================================
= Goodhart's law, multidimensionally
// =============================================================================

== The shape of the problem

The previous chapter fixed the scope of the inherited Goodhart literature: the
scalar slogans are genealogy, and the scalar mathematical anchor is a sharp
selection result under declared target/discrepancy assumptions. The thesis of
this book is that the scalar framing hides most of the structure. Real goals —
the goals of a person, a team, a company, a state, or a trained model — are
*multidimensional*, and the proxies we use to steer toward them are
multidimensional too, usually with a different (and smaller) set of dimensions.
Once that is taken seriously, "the regularity collapses" is replaced by a more
precise and more useful question: *how does pressure on a proxy reshape the
distribution of its residual error?*

This is not a rejection of scalar analysis. Sometimes the principal really has a
declared scalar objective, or the application has a defensible value-weighted
loss. Then scalar Goodhart is the right projection. The problem appears when the
scalar is introduced only because the dashboard, benchmark, or theorem wants one
number. A vector residual has length and direction only after a norm or value
metric is chosen. Without that choice, saying that "proxy error increased" is
ambiguous; with the wrong choice, the model can hide exactly the direction in
which optimisation caused damage. Treating each coordinate as a separate scalar
problem avoids one compression but loses the cross-coordinate geometry:
substitution, cancellation, bottlenecks, active constraints, and tail dependence.
Those cross-terms are where many proxy repairs succeed or fail.

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
intervention channels, multidimensional gaming, and response-modeling
contracts. Second, those models imply
conditional design lessons: additive scorecards, conjunctive scorecards, and
different harm-per-score exchange rates behave differently. Third, the
recursive story — that residual error may migrate into less-monitored or
harder-to-elicit dimensions as the proxy stack is patched — is an empirical
conjecture. The job of these first chapters is to make all three layers
statable without pretending they have the same epistemic status.

#remark[*Licensed claims.* These chapters license five narrow uses. First, when
pressure only reweights a fixed baseline distribution, the right quantities are
selection-response functionals of that baseline: covariance locally, threshold
response in the tails, and a chi-square drift budget for bounded selection.
Second, when agents can change the state-generating process, the drift budget is
not a baseline statistic; in the quadratic Stackelberg toy model it is
$sqrt(2 kappa V)$, a function of gaming ease and stakes. Third, for intervention
channels with compensatory additive scores and separable quadratic gaming
costs, adding an independently gameable measured dimension increases aggregate
gaming capacity $K_M$, lowers the minimum cost of clearing a fixed score gap,
and weakly expands the population of agents for whom gaming pays; this is a
population-harm statement, while fixed-deficit $H_per$ is conserved only under
the exchange-rate condition. These claims are meant for designing scorecards,
benchmarks, and evaluation suites. Fourth,
proxy pressure does not generically select a minimum-complexity residual; a
response-shape prediction needs a named response geometry, constraint set, and
complexity or shape measure. Fifth, a Goodhart claim is incomplete until it
declares the response model: type, action, cost, aggregation, hidden welfare,
and evidence standard. These claims do not prove the recursive-Goodhart
hypothesis, do not say that "more metrics is worse" as a rule, and do not
apply to RLHF or other non-convex training dynamics until the application has
declared a response model that matches their assumptions.]

The contribution here is to make the vector structure explicit. The Goodhart
taxonomy supplies failure-mode vocabulary; the formal chapters below supply
response channels, drift bounds, cost geometry, and aggregation conditions.

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
geometry, stakes, and available gaming channels for intervention. If those
objects have not been declared, the application is underspecified; that is not
evidence for or against the framework's toy bounds.]

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
  meant to track are corrupted — by noise, by lag, or (Chapter 4) by deliberate
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

Throughout Chapter 3 we work the simplest non-trivial case: $G(s) = X in RR^m$
with $X$ Gaussian, a single scalar proxy that is one coordinate (or one linear
combination) of $X$ plus noise, and *selection* — keep the states scoring above
a threshold. This isolates the two classical "easy" Goodhart effects,
*regressional* and *extremal* Goodhart @manheim2018categorizing, from the
harder ones. It is the right
first probe precisely because it is the regime where, as Chapter 3 shows, hidden
harm turns out to be *bounded by quantities visible in the pre-selection
distribution*. That selection analysis stops at reweighting: it does not say
what fixed agents can do after a metric is announced. Chapter 4 therefore starts
again from declared response kernels, actions, costs, stakes, and aggregation
geometry. It shows where the Chapter 3 baseline-only bound no longer has an
analogue, and what must replace it.

A reader who wants the punchline before the construction: there is a clean
dichotomy between *selection channels* (the policy reweights a fixed baseline
distribution; all classical regressional/extremal Goodhart lives here; hidden
drift $<= delta dot norm(s)$ with every term a baseline functional) and
*intervention channels* (the policy moves probability mass to where the baseline
had none; causal and adversarial Goodhart live here; no baseline bound exists,
and any bound must be imported from a model of what the responding agents can
afford to do). Chapters 3 and 4 are those two halves.

The appendices are organised the same way. Appendices A--D are visual aids for
claims made in the formal chapters: selection response, dimensional coupling,
selection versus intervention, additive versus conjunctive gaming, and the
exchange-rate condition for conservation. Appendix E is deliberately different:
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
- Under Boltzmann selection on the finite-mgf domain
  $cal(B) = { beta : EE_mu[exp(beta P)] < infinity }$, covariance is the local
  velocity at differentiability points:
  $dif EE_beta[H] slash dif beta = "Cov"_beta(H, P)$.
- Selection-channel drift satisfies the coordinate-explicit bound
  $norm(B_H(theta))_2 <= delta dot norm(s)_2$, with
  $delta^2 = chi^2(mu_theta parallel mu_0)$.
- The same selection argument gives the declared value/operator bound
  $abs(Delta(v dot H)) <= delta sqrt(v^T Sigma_H v)$, and its dual-norm form
  after a value metric is declared.
- In the quadratic Stackelberg gaming model, the gaming wedge is
  $Delta = sqrt(2 kappa V)$.
- In the additive multidimensional gaming model, quadratic costs give the
  water-filling allocation, and the weighted additive case gives the
  exchange-rate condition $h_j = c w_j$ for conservation of fixed-deficit
  $H_per(M, d)$.
- In the quadratic response-shape model, an intervention target $w dot a >= d$
  with cost $(1/2) a^T C^(-1) a$ selects the unconstrained/interior
  minimum-cost direction $a^* = d C w slash (w^T C w)$, not a
  minimum-complexity direction as such; sign constraints require active-face
  solutions.
- In fixed-charge or linear-cost response models, the uncapped no-tie case can
  produce one-channel drift; caps convert this into ordered spillover only when
  activation costs are absent or already paid; positive activation costs add
  thresholded regime switches.

The additive-versus-conjunctive flip and the noisy Stackelberg refinement are
illustrative models, not general theorems. The convex-cost intervention analogue
of the selection bound is stated below as a score-deficit proposition with a
Fenchel-duality proof sketch. Chapter 5's response-shape taxonomy is a
conditional prediction menu,
not a theorem that residual error generically becomes more complex. The live
open questions are pulled forward into the intro as modelling obligations.

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
honest version is weaker, and Chapter 3's final bound gives the clean statement.
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
coordinates. Appendix A visualises both parts of the claim.

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
@fig:threshold-response for the corresponding three-case picture.

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
$b_H(t)$). Soft optimisation by Boltzmann weights is available only on the
finite-mgf domain

$ cal(B) = { beta in RR : EE_mu[exp(beta P)] < infinity }. $

For $beta in cal(B)$, write $W_beta = exp(beta P)$. Probabilistic funding with
score-increasing odds, replicator-style repeated reweighting by performance,
top-$q$-fraction selection (thresholding at an endogenous quantile): all are
weight functions when their normalizing expectations are finite.

#remark[Two caveats on the soft-optimisation case. First, if $P$ is heavy-tailed,
$EE[exp(beta P)]$ may be infinite for positive $beta$ — the Boltzmann path may
not exist. This is not a technicality; Goodhart is often precisely about extreme
tails. For heavy tails, bounded weights or quantile selection are safer models.
Second, not every control process is a reweighting of a fixed baseline at all —
interventions can change the state-generating mechanism. That is Chapter 4.]

=== Covariance as a local velocity

For Boltzmann selection on the finite-mgf domain $cal(B)$,
$EE_beta[H] = EE[H exp(beta P)] / EE[exp(beta P)]$. At values of $beta$ where
the tilted expectation of $H P$ is finite and differentiation through the
normalizer is valid — in particular at interior points of a finite neighborhood
inside $cal(B)$ under the usual domination conditions —

$ dif / (dif beta) EE_beta[H] = EE_beta[H P] - EE_beta[H] EE_beta[P] = "Cov"_beta(H, P). $

#claim[Covariance is best read as the *local velocity* of hidden drift under
infinitesimal soft optimisation only where the Boltzmann path exists and is
differentiable, evaluated under the *current* selected distribution — not as a
global finite-pressure summary. _Toy example:_ at low bonus pressure, the rate
at which burnout changes with sales incentives is the current covariance
between burnout and sales; after employees adapt or the selected population
shifts, the covariance must be recomputed under the new weighted distribution.]

That local velocity does not pin down finite movement. Take again $P = Z ~ cal(N)(0,1)$,
$H = Z^2 - 1$. Boltzmann tilting by $exp(beta Z)$ gives $Z_beta ~ cal(N)(beta, 1)$,
so

$ EE_beta[H] = EE[Z_beta^2 - 1] = beta^2. $

The covariance at $beta = 0$ is zero — matching @sec:cov-not-enough — yet finite
pressure gives strictly positive hidden drift for every $beta != 0$. Baseline
covariance alone is insufficient even for *finite* soft optimisation; one needs
the covariance field $"Cov"_beta(H, P)$ along the whole tilted path, and the
path itself must remain inside $cal(B)$. Heavy-tailed proxies for which
$EE[exp(beta P)] = infinity$ at the pressure of interest are not covered by
the Boltzmann calculation; they require bounded, truncated, or quantile-based
selection models.

#claim[*The hierarchy of selection primitives.* covariance (infinitesimal
Boltzmann velocity) $subset$ threshold response $b_H(t)$ (hard cutoffs) $subset$
weighted response $B_H(theta)$ (generic non-causal selection). All three are
functionals of the baseline $mu$ alone. Causal and adversarial Goodhart need a
further layer in which $mu$ itself changes with the principal's policy — the
subject of Chapter 4.]

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

#proposition("1", "coordinate-explicit selection drift")[
Under a pure selection channel with likelihood ratio $L_theta = d mu_theta slash d mu$,
finite coordinate variances, and
$delta = norm(L_theta - 1)_(L^2(mu)) = sqrt(chi^2(mu_theta parallel mu))$, each
hidden coordinate satisfies

$ abs(B_(H_i)(theta)) <= delta s_i, quad
  norm(B_H(theta))_2 <= delta norm(s)_2. $

Licenses: after the hidden coordinates and Euclidean norm are declared,
selection-regime drift is bounded by reweighting intensity and baseline hidden
variability. The $sqrt(d)$ growth from Chapter 3's per-dimension model is the
$norm(s)_2$ term.

Does not license: a coordinate-free welfare claim, or a value metric inferred
from the selected law.]

For a declared scalar hidden-value functional $v dot H$, the same proof gives

$ abs(Delta(v dot H)) <= delta sqrt(v^T Sigma_H v), $

where $Sigma_H = "Cov"_mu(H)$. More generally, for any hidden-drift value norm
$norm(.)_V$,

$ norm(B_H(theta))_V <=
  delta sup_(norm(v)_(V,*) <= 1) sqrt(v^T Sigma_H v). $

If $norm(x)_M = sqrt(x^T M x)$ for a positive definite value matrix $M$, this is
the corresponding covariance-operator bound after the value metric has been
declared.

#proposition("1'", "value-weighted/operator selection drift")[
Let $L = d mu_theta slash d mu$, $L in L^2(mu)$, $EE_mu[L] = 1$, and let $H$ have
finite second moments. For every declared value vector $v$,

$ abs(EE_(mu_theta)[v dot H] - EE_mu[v dot H])
  <= sqrt(chi^2(mu_theta parallel mu)) sqrt(v^T Sigma_H v). $

The dual-norm/operator form above is the same statement optimized over the
declared value unit ball.

Licenses: coordinate bookkeeping is repaired once the application supplies a
scalar value direction or value norm. Splitting a hidden coordinate does not
change the bound for the same underlying value functional.

Does not license: hidden value weights observable from $mu_theta$, or a useful
numerical prediction when $chi^2$ is huge or infinite. In that case the
inequality remains valid where defined, but becomes practically vacuous.]

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
available action channels. Appendix B draws the reweighting-versus-transport
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

#claim[*Definition.* Declare a type space $U$ with baseline type law $nu$, a
baseline kernel $K_0(d s mid(|) u)$, optional participation weights
$W_theta(u)$, and policy-indexed response kernels $K_theta(d s mid(|) u)$. The
induced law is

$ mu_theta(A) =
  (integral W_theta(u) K_theta(A mid(|) u) nu(d u))
  slash
  (integral W_theta(u) nu(d u)). $

The channel is *pure selection relative to $(U, K_0)$* if $K_theta = K_0$ for
$nu$-almost every type and all policy dependence enters through $W_theta$. It is
an *intervention relative to $(U, K_0)$* if $K_theta != K_0$ on a positive-mass
set of types. Mutual singularity with $mu_0$ is decisive evidence of
intervention, but not required for the causal distinction.]

The entire apparatus of Chapter 3 — covariance, threshold response, weighted
response — is the pure-selection case, with $L_theta = W_theta / EE_(mu_0)[W_theta]$.
In Manheim and Garrabrant's taxonomy @manheim2018categorizing, *causal* Goodhart
is an intervention channel in which the policy structurally breaks
$P approx phi(G)$, and *adversarial* Goodhart is an intervention channel in
which $theta$ is chosen worst-case for the principal. The ML instances of this
regime are *strategic classification* @hardt2016strategic — agents manipulate
features in response to a published classifier — and *performative prediction*
@perdomo2020performative — the act of deploying a predictor changes the
distribution it is predicting. The drift bound of Chapter 3 has no
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
  *identically zero* in this model — consistent with Chapter 3's bound, since
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

#proposition("2", "Stackelberg wedge")[
In the one-dimensional noiseless threshold model, let true quality be $Q$, action be $a >= 0$, score be $Q + a$,
pass condition be $Q + a >= t$, selection value be $V > 0$, and private action
cost be $a^2 slash (2 kappa)$ with $kappa > 0$. Then the privately profitable
gaming band has width

$ Delta = sqrt(2 kappa V). $

Agents with $Q in [t - Delta, t)$ choose the least passing action
$a^*(Q) = t - Q$; agents below the band do not game enough to pass, and agents
above threshold need no action.

Licenses: in this quadratic threshold toy, the intervention budget comes from
action economics--ease of gaming and stakes--not from the baseline distribution.
The metric's worst-case bias is at most $Delta$, and hidden action harm scales
with the same band.

Does not license: a direct RLHF, finetuning, or neural-training mapping without
declared analogues of $a$, $kappa$, $V$, and the pass condition. _Toy example:_
doubling the funding tied to a test score multiplies the gaming wedge by
$sqrt(2)$; halving the cost of test-prep drilling does the same.]

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
default. Appendices C and D give the geometric picture for the additive,
conjunctive, and exchange-rate cases.

=== The exchange-rate condition

Start with the general additive case, because it is the result that survives
changes of units. There are two welfare objects to keep separate. The first is
fixed-deficit per-agent harm, written $H_per(M, d)$: conditional on an agent
choosing to buy score deficit $d$, how much hidden harm does the cost-minimal
gaming action cause? The second is population harm, written
$H_pop (M, F_Q, V)$: after heterogeneous agents draw quality $Q$ from $F_Q$ and
decide whether gaming is worth the prize $V$, how much harm is produced in the
population?

Let the additive score be $sum_(j in M) w_j a_j$, costs
$sum_j a_j^2 slash (2 kappa_j)$, and hidden harm $H = sum_j h_j a_j$. The
cost-minimal allocation for a score deficit $d$ is
$a_j = d kappa_j w_j slash W_M$ with $W_M = sum_(i in M) kappa_i w_i^2$, and its
per-agent harm is

$ H_per(M, d) =
  d dot (sum_(j in M) h_j kappa_j w_j) / (sum_(j in M) kappa_j w_j^2). $

This is *not* invariant in $M$. (Two equally easy channels, $kappa_1 = kappa_2 = 1$,
equal physical harm $h_1 = h_2 = 1$: measuring only channel 1 with $w_1 = 2$
gives $H = d slash 2$; measuring only channel 2 with $w_2 = 1$ gives $H = d$;
measuring both gives $H = 3 d slash 5$.) Re-routing can raise *or* lower harm,
depending on the score weights. The conservation result is an exchange-rate
condition, not a dimension-count result.

#proposition("4", "additive exchange-rate iff")[
Fix a score deficit $d > 0$. For active measured channels $M$, suppose costs are separable quadratic,
$sum_(j in M) a_j^2 slash (2 kappa_j)$ with $kappa_j > 0$, the score is
$sum_(j in M) w_j a_j$ with $w_j > 0$, and hidden harm is linear,
$H(a) = sum_(j in M) h_j a_j$. The cost-minimal action satisfying the deficit is

$ a_j^* = d kappa_j w_j slash W_M, quad
  W_M = sum_(i in M) kappa_i w_i^2, $

and fixed-deficit per-agent harm is

$ H_per(M, d) =
  d dot (sum_(j in M) h_j kappa_j w_j)
    slash (sum_(j in M) kappa_j w_j^2). $

Therefore fixed-deficit per-agent harm is conserved across active measured sets if and
only if $h_j = c w_j$ on the channels being compared, in which case
$H_per(M, d) = c d$.

Licenses: under separable quadratic costs, additive score, linear harm, and a
fixed score deficit, conservation of $H_per$ is an exchange-rate theorem, not a
dimension count slogan.

Does not license: population-level conservation, arbitrary costs, arbitrary
aggregation rules, or conservation when harm-per-score ratios differ. Shared
bottlenecks and correlated costs are different action geometries, not
exceptions to this theorem. _Toy example:_ if every point of score inflation is
equally socially wasteful no matter which KPI supplies it, re-routing conserves
harm; if grant-padding produces less waste per score point than
citation-padding, moving weight toward grant-padding genuinely reduces harm.]

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
is $H_per(M, t) = sum_(j in M) a_j = lambda K_M = t$ — *independent of $M$*.
Thus the earlier slogan $H = t$ is only the fixed-deficit pure-gaming object
$H_per(M, t)$, not a population welfare claim. What $M$ controls is (i)
*whether* $K_M$ clears $K_"min"$, and (ii) *how* the fixed harm $t$ is split
across the measured channels — proportional to $kappa_j$. @fig:welfare-objects
shows the same separation between fixed-deficit and population harm.

#claim[*Conservation under re-routing (narrow form).* With a unit-weight
additive metric and gaming that is equally wasteful per unit of score, the
principal cannot reduce per-agent harm for a fixed pure-gaming score deficit by
changing *which* channels it measures, as long as the measured set keeps enough
aggregate gaming capacity ($K_M >= K_"min"$): $H_per(M, t)$ is pinned at $t$
and merely re-routes. Closing a gamed channel just spreads $t$ over the others.
_Toy example:_ a hospital ranked on readmission rates clamps down on coding of
"readmission" — the gaming reappears as patient selection, discharge timing,
observation-status reclassification; the per-case distortion needed to clear the
cutoff is unchanged.]

#claim[*Adding a gameable measured dimension backfires at population level.* Expanding $M$ strictly
increases $K_M$, which *lowers* the gaming cost $t^2 slash (2 K_M)$, which
weakly *enlarges* the population that finds gaming worthwhile, even though
$H_per(M, d) = d$ for each fixed deficit in the unit-weight equal-harm case.
With quality
heterogeneity $Q ~ cal(N)(0, sigma^2)$ — an agent needs $"score" >= t - Q$, at
cost $(t - Q)^2 slash (2 K_M)$, and games iff $t - Q <= sqrt(2 K_M V)$ — the
gaming-eligibility cutoff $Q >= t - sqrt(2 K_M V)$ moves *down* as $K_M$ grows.
The population object is

$ H_pop (M, F_Q, V) =
  EE[H_per(M, t - Q) bb(1){0 < t - Q <= sqrt(2 W_M V)}], $

with $W_M = sum_(j in M) kappa_j w_j^2$; in this unit-weight case,
$W_M = K_M$ and $H_per(M, t - Q) = t - Q$. More agents game; the fraction of
selected agents who are pure gamers rises, and $H_pop$ increases whenever there
is positive mass in the newly admitted gaming band.
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
$sum_(j in M) t^2 slash (2 kappa_j)$, and per-gamer harm
$H_per^"conj"(M, t) = sum_(j in M) t = t abs(M)$. Now per-gamer harm grows
*linearly in the number of measured dimensions*: adding a dimension
unambiguously increases harm conditional on gaming — though it also raises the
cost of clearing the metric, so fewer agents may do it. The sign of $H_pop$ is
a genuine trade-off between harm-per-gamer and gamer-count.

#claim[Gaming harm's dependence on the *number* of measured proxy dimensions is
governed by the aggregation rule and by the welfare object. Unit-weight
compensatory/additive metrics conserve fixed-deficit per-agent harm
($H_per(M, t) = t$, re-routing only) — when measured channels are equally
harmful per score unit; conjunctive/$min$ metrics *multiply* per-gamer harm
($H_per^"conj"(M, t) = t abs(M)$). Real scorecards are usually compensatory
(weighted sums of KPIs), which is the regime where "just add another metric" can
backfire for $H_pop$ by cheapening the cheapest gaming path and expanding the
gaming population. The selection-regime $sqrt(d)$-type scaling from Chapter 3
and these intervention-regime flat/linear behaviours are *different phenomena*
and should not be conflated. See @fig:welfare-objects for the welfare-object
separation in the additive case.]

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

== A convex-cost intervention bound <sec:convex-cost-bound>

The selection-channel bound says that hidden drift is controlled by a
chi-square/reweighting budget $delta$. The intervention examples say that, once
agents can move in state space, the analogous budget has to come from the
agents' cost geometry. In the quadratic one-dimensional model that budget is
$Delta = sqrt(2 kappa V)$.

#proposition("3", "convex score-deficit budget")[
Let the fixed-type action space be finite-dimensional. Let $c: RR^n -> (-infinity, +infinity]$ be closed,
proper, and convex, absorbing feasibility by setting $c(a) = +infinity$ outside
the feasible set. Let proxy gain be linear, $p(a) = w dot a$. For a score
deficit $d$, define

$ m(d) = inf_a { c(a): w dot a >= d }. $

Under standard convex-duality regularity, for example a finite-cost feasible
point with $w dot a > d$,

$ m(d) = sup_(lambda >= 0) [lambda d - c^*(lambda w)], $

where $c^*(y) = sup_a [y dot a - c(a)]$.

Licenses: a score-deficit/private-cost budget after the action space, proxy
gain, convex cost, and regularity condition have been declared. In the
single-channel quadratic case $c(a) = a^2 slash (2 kappa)$, this gives
$m(d) = d^2 slash (2 kappa)$, so stakes $V$ permit deficits
$d <= sqrt(2 kappa V)$.

Does not license: a welfare bound without a hidden harm functional,
nonconvex/fixed-charge dynamics, non-convex ML/RLHF training dynamics, or
inference of the cost geometry from the baseline distribution. An ML
application can import this proposition only after declaring a local action
space, response model, and convex cost geometry.]

The proof sketch is the standard Fenchel move. Write the Lagrangian
$c(a) + lambda(d - w dot a)$ with $lambda >= 0$. Minimizing over $a$ gives
$lambda d - c^*(lambda w)$, and strong duality supplies equality under the
regularity condition. This is the clean convex analogue of the Stackelberg
wedge: the budget is imported from declared action costs, not from
$mu_0$.

== What we have, and what is open <sec:openq>

Chapters 3 and 4 give a clean dichotomy. *Selection channels* — the policy
reweights a fixed baseline — contain all of regressional and extremal Goodhart;
hidden drift is bounded, $norm(B_H(theta))_2 <= delta dot norm(s)_2$, with
every term a baseline functional, and the number of dimensions enters only
through $norm(s)_2$. *Intervention channels* — the policy changes fixed-type
behavior through a response kernel — contain causal and adversarial Goodhart;
there is no baseline-only bound, and the controlling quantity (e.g.
$Delta = sqrt(2 kappa V)$ in quadratic Stackelberg gaming) is exogenous to
$mu_0$, set by the responding agents' cost geometry. In the multidimensional
intervention regime, "fight
Goodhart by measuring more dimensions" has a precise predicted failure mode:
under a compensatory rule it conserves $H_per(M, d)$ only when channels are
equally harmful per score unit, and it lowers the cheapest gaming cost,
recruiting more gamers — an $H_pop (M, F_Q, V)$ backfire; under a conjunctive
rule it multiplies per-gamer harm while the population sign depends on entry.
The principal's real levers are
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

Chapter 5 sharpens that last sentence. The recursive hypothesis is tempting to
summarise as "residual error becomes more complex". That is not licensed. The
right next object is a *response-shape prediction*: once a response channel and
its constraints are specified, what shape of hidden residual should it produce?

#figure(
  kind: table,
  table(
    columns: (1.15fr, 1.35fr, 1.15fr),
    inset: 6pt,
    align: horizon,
    [*Claim one might use*], [*What the chapters show*], [*Boundary*],
    [Adding additive metrics can worsen gaming.],
    [In the deterministic quadratic water-filling model, adding an independently
      gameable measured channel increases $K_M$, lowers $t^2 slash (2 K_M)$,
      and weakly expands the gaming band; this is an $H_pop$ claim, not a claim
      that fixed-deficit $H_per$ rises.],
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
    [No monotone complexity law follows from Chapters 1--5.],
    [Minimum-complexity attractors explain recursive Goodhart.],
    [Only conditionally: fixed-charge costs can yield sparse drift, low-rank
      affordances restrict drift to an image, and search priors can favour low
      description length.],
    [Quadratic costs and selection channels both block the generic theorem.],
  ),
  caption: [Claim audit: what these chapters license, and where the license
    stops.],
) <tab:claim-audit>

The remaining appendices are visual. They keep only figures that carry a
comparison: threshold response versus covariance, selection versus
intervention, fixed-deficit versus population harm, and response-shape
active-set regimes. The speculative recursive-Goodhart cartoon is gone; that
hypothesis remains prose until it has pre-specified hidden axes and data. The
research inventory — both the work-in-progress threads and the parked open
questions that earlier drafts kept as separate appendices — now lives in the
intro §§1.5–1.6.

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

with $C$ positive definite. The KKT conditions give the unconstrained binding
solution:

$ C^(-1) a = lambda w, quad
  a^* = d C w slash (w^T C w). $

If the feasible action set also requires $a >= 0$, this formula is an interior
solution only when $C w >= 0$ componentwise (and the nonzero components can meet
the deficit). If some component of $C w$ is negative, the constrained optimum is
found by solving the same quadratic problem on the active feasible face, with
the negative action coordinates fixed at zero or other active bounds imposed.
For example, with $C = "diag"(1, 1)$ and $w = (1, -1)$, the unconstrained
direction is proportional to $(1, -1)$, which is invalid under $a >= 0$; the
active-face solution uses $a_2 = 0$ and buys the deficit through $a_1$.

#claim[*Quadratic response-shape result.* In the unconstrained quadratic model,
or on a nonnegative interior face satisfying $C w >= 0$, proxy pressure selects
the minimum-cost direction proportional to $C w$. This is not a
minimum-complexity direction by default. It is dense only when $C w$ is dense in
the pre-specified action basis and no sign, cap, or other active constraints
bind.
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
  kind: table,
  table(
    columns: (1.05fr, 1.35fr, 1.45fr),
    inset: 6pt,
    align: horizon,
    [*Response geometry*], [*Licensed prediction*], [*Guardrail*],
    [Quadratic intervention cost],
    [Cost-minimal drift along $C w$ in the unconstrained/interior case.],
    [For $a >= 0$, require $C w >= 0$; otherwise solve on the active feasible
      face. Dense only when that face solution is dense.],
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
) <tab:response-shape-taxonomy>

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
= Response modeling: what a Goodhart claim must declare
// =============================================================================

== Proxy pressure is not a complete model

The preceding chapters narrow the project in a useful way. The original
temptation was to look for a characteristic shape of Goodhart pressure: error
spreads, concentrates, becomes more complex, or migrates into unmeasured
dimensions. Each of those can happen in a model. None is forced by proxy
pressure alone.

In Chapter 3, pressure only reweights a fixed baseline, so hidden drift follows
the baseline response curve. In Chapter 4, pressure changes fixed-type behavior,
so the relevant object is an action or cost geometry. In Chapter 5, hidden
residual shape depends on the response process: quadratic costs, fixed charges,
caps, low-rank affordances, and search priors make different predictions.

So the next object is methodological. A Goodhart claim should not merely say
that a proxy was optimized and then an outcome changed. It should declare the
response model that connects proxy pressure to target-relevant distortion.

#claim[*Response-modeling contract.* A Goodhart claim is incomplete unless it
declares the response model: what is fixed type, what can respond, what movement
is feasible, what it costs, how proxy components are aggregated, what hidden
target or welfare quantity is protected, and what evidence would distinguish
the proposed response channel from nearby alternatives.]

This is not a retreat into "everything depends on assumptions." It is the
condition under which the earlier results become usable. Once the response
model is declared, the claim can point to a selection response curve, a
reweighting bound, a convex intervention budget, a fixed-charge active-set
comparison, an aggregation exchange-rate calculation, or a response-shape
prediction. Without that declaration, "Goodhart happened" is usually too
underspecified to be evidence for any particular mechanism.

This is also the transfer rule for applications. A domain such as RLHF,
benchmark-driven finetuning, hospital rankings, or institutional scorecards
does not inherit the algebraic bounds by analogy. It inherits the obligation to
declare the type space, response channel, action/search geometry, aggregation,
hidden harm, and falsifiers. If those objects match one of the toy regimes, the
corresponding calculation becomes available; if they do not, the contract says
which new model is missing.

== The contract

The minimum contract has eight fields.

+ *Type representation.* Declare the type space $U$ and baseline law $nu$.
  Explain why these features are treated as fixed for this comparison rather
  than as future responses to the policy.
+ *State and baseline behavior.* Declare the observed state space $S$ and the
  baseline kernel $K_0(d s mid(|) u)$.
+ *Policy exposure.* State what policy, score, threshold, prize, or feedback
  variable $theta$ creates pressure, and which actors observe it.
+ *Response channel.* State whether $theta$ changes participation weights
  $W_theta(u)$, fixed-type response kernels $K_theta(d s mid(|) u)$, or both.
+ *Action geometry.* If behavior changes at fixed type, declare the action
  space, feasible movements, costs, caps, fixed charges, search prior, or other
  geometry that makes some moves available and others unavailable.
+ *Proxy and target.* State the proxy, the intended target relation
  $P approx phi(G)$, and the hidden welfare or harm quantity whose distortion
  matters.
+ *Aggregation rule.* If the proxy is multidimensional, state whether components
  are combined additively, by weights, conjunctively, by a Pareto rule, or by
  some other rule.
+ *Evidence standard.* State what observation would distinguish reweighting of
  fixed types from fixed-type behavior change, and what observation would
  falsify the proposed action or cost geometry.

Each field blocks a common overclaim. Without $U$, selection and intervention
can be redescribed after the fact. Without the action geometry, intervention
has no budget. Without the aggregation rule, measured dimension count has no
sign. Without a hidden harm functional, proxy movement is not yet welfare harm.
Without an evidence standard, the model cannot be wrong.

== Selection, intervention, and evidence

The selection/intervention split is useful precisely because it says which
evidence matters. Under pure selection, policy changes only the weights on fixed
type-conditional behavior. The right evidence is the baseline joint
distribution, the weighting rule, the selection depth, and the hidden response
curve such as $EE[H mid(|) P >= t] - EE[H]$. The Chapter 3 drift bound is
available because the post-policy law is a reweighting of the baseline joint law
on types and states.

Under intervention, the policy changes $K_theta(d s mid(|) u)$ at fixed type.
Marginal distribution shifts alone usually cannot identify this. Stronger
evidence comes from repeated observations of the same type before and after
policy exposure, randomized or staggered exposure, action traces, exogenous
variation in costs or stakes, or a structural model that makes the response
geometry explicit.

The distinction is representation-relative. A type space rich enough to include
the whole future response plan can make behavior change look like selection over
types. A type space too coarse can make ordinary heterogeneity look like
intervention. That is not a defect to hide. It is the empirical commitment the
model must declare.

#claim[*Evidence claim.* Outcome distributions can support or falsify a declared
response model, but they do not by themselves identify the model. A credible
Goodhart application must say what is fixed type, what is response, and what
observation would separate reweighting from fixed-type behavior change.]

Toy examples show the difference. If a grant agency raises a score cutoff for a
fixed applicant pool and applicants do not revise their proposals, the model is
pure selection. If applicants rewrite proposals after the scoring formula is
announced, the same marginal score improvement may be an intervention. If a
hospital ranking induces the same hospital to change coding, repeated-hospital
data support a fixed-type kernel change. If only hospitals already good at
coding enter the ranked population, a selection model may be adequate. A single
post-policy cross-section rarely decides.

== What the contract licenses

The contract turns the framework into a menu of conditional claims rather than
a universal theorem.

- If the response is pure selection, use baseline response curves and
  reweighting bounds.
- If the response is smooth costly action, use an affordable-action set or a
  convex score-deficit cost.
- If the response has fixed charges or caps, expect threshold regimes,
  spillover, and active-set switches.
- If the proxy is multidimensional, analyze the aggregation rule and
  harm-per-score exchange rates.
- If the claim is about residual shape, pre-specify the response geometry and
  the shape measure before observing the failure.

This is why the project becomes less like a theorem saying "Goodhart has this
shape" and more like a response-modeling framework. The gain is not maximal
generality. The gain is that a reader can ask, for any application: what
mechanism is being claimed, what calculation follows from it, and what evidence
would make the claim weaker?

== Application discipline

The contract is especially important for ML and institutional examples because
outcome distributions invite overinterpretation. A benchmark score rise could
mean selection among fixed model checkpoints, finetuning that changes behavior,
contamination, prompt adaptation, tool-use strategy, or reporting changes. A
school score rise could mean selecting different students, changing teaching,
changing attendance, changing reporting, or real learning. These are different
response models.

For an empirical, ML, or institutional-scorecard application, the minimum
mapping should say:

- what plays the role of type, and where the boundary lies between fixed type
  and later response;
- whether the score changes the composition of who is selected, the behavior of
  the same actors, or both;
- what responses are easy, cheap, repeated, hard to observe, or already built
  into the workflow;
- which proxy components are aggregated and how they are effectively weighted,
  including thresholds, gates, overrides, and informal committee rules;
- which hidden outcome, harm, value, or capability is at stake;
- how much signal each metric component has for that hidden target;
- what stakes make adaptation, gaming, or proxy repair worth doing;
- what data would distinguish the proposed mechanism from selection,
  confounding, reporting change, proxy-only repair, or real improvement.

This gives a narrower boundary for reusable applications. The application must
predeclare $U$ and the type/action boundary; identify whether pressure changes
$W_theta$, $K_theta$, or both; declare the proxy, hidden target, aggregation
rule, hidden harm or value quantity, and evidence standard; name discriminator
observations stronger than aggregate score movement; include contract-failure
conditions that could actually fire; and change an audit, design, or
evidence-collection decision. A template that only says, after the fact, which
metric was gamed has not yet done enough.

The symbols from the toy chapters can be useful shorthand only after these
plain-language audit questions are answered. Ease or cheapness of response is
what $kappa$ abbreviates in the quadratic toys. Hidden harm or hidden value is
what $h$, $gamma$, and the declared target model try to represent. Effective
score weights are the practical content of $w$. Stakes are what $V$ records. If
an application cannot estimate, bound, defend, or mark one of these quantities
as unavailable before interpreting the score movement, the corresponding toy
calculation is unavailable too. The toy models show what calculations become
possible when the audit dimensions are made precise; they do not make the
dimensions true by notation.

Institutional scorecards show the point. In a hospital readmission scorecard, a
lower measured readmission rate could reflect changed patient mix, better
follow-up care, altered discharge decisions, coding changes, or avoidance of
patients who are costly to manage. The application contract asks which of these
responses the same hospital can cheaply move, which patient-welfare trace would
show hidden harm or value, how readmissions are combined with other quality
components, and which repeated-hospital or patient-level observations would
separate welfare improvement from score-only movement. Its practical output is
an audit plan: inspect the response channels with high score leverage, low
friction, and plausible hidden harm before crediting the score gain as patient
welfare.

Scientific metrics are the harder case because long-run research value is
delayed and contested. A rise in publications, citations, grant income, venue
prestige, or rankings could come from selecting different researchers or
fields, changing fixed researchers' project choices, repairing a noisy proxy,
manufacturing citation or publication artifacts, or genuinely improving
research quality. The contract does not claim to estimate research value from
the score. It asks for field-appropriate evidence that separates those
mechanisms before the institution raises the leverage of a fast scalar metric.

That mapping does not need to be perfect before the framework can be useful. It
does need to be explicit enough that the claim can fail. The main error this
chapter is meant to prevent is treating "the metric improved and the target did
not" as enough to infer the response channel, the welfare mechanism, and the
next fix.

== Worked contract: MMLU benchmark pressure

MMLU is a useful worked example precisely because it is not one mechanism.
Hendrycks et al. introduce it as a broad multitask accuracy benchmark across
many subject areas @hendrycks2021mmlu. Once the score becomes visible, the same
reported improvement can come from several response channels: choosing among
fixed checkpoints, repeatedly testing and adapting, finetuning on benchmark-like
data, data contamination, prompt search, or optimizing a proxy reward whose
improvements happen to transfer to the benchmark. Model-selection overfitting
@cawley2010overfitting, adaptive holdout reuse @dwork2015generalization, and
reward-model overoptimization @gao2023rewardmodeloveroptimization are therefore
nearby warnings, not automatic explanations.

The contract for an MMLU claim has eight fields:

- *Type.* The object is either fixed model checkpoints or model-development
  pipelines. A claim about selecting the best checkpoint is a selection claim.
  A claim about training, search, contamination, or reward optimization is a
  response-kernel claim.
- *Baseline behavior.* The baseline is pre-exposure answer behavior on
  benchmark-like questions: accuracy by subject, error type, calibration, and
  transfer to related but unpublished tasks.
- *Exposure.* The exposure can be the public MMLU score, reporting and
  leaderboard/status pressure, or an internal score used for model selection.
  These exposures need not induce the same response.
- *Channel.* Fixed-checkpoint selection changes weights over candidates
  through $W_theta$. Finetuning, prompt search, contamination, synthetic data
  filtering, and reward/proxy optimization change the behavior-generating
  process through $K_theta$.
- *Action geometry.* No action geometry is implied by the benchmark alone. It
  must be declared: available finetuning data, benchmark access, prompt-search
  budget, contamination path, reward-model loop, compute, KL penalty, or other
  search costs.
- *Proxy and target.* The proxy is MMLU accuracy, usually aggregated across
  subjects. The target might be broad multitask understanding, robustness on
  regenerated private tests, or a declared hidden capability vector. Without
  that declaration, "better MMLU" is not yet a welfare or capability claim.
- *Aggregation.* The subject/task average is a score aggregation rule. It is
  not automatically a welfare rule, and it does not say which subjects are
  substitutable for which hidden capabilities.
- *Evidence.* Relevant evidence includes same-checkpoint before/after behavior,
  private or regenerated tests, contamination probes, traces of prompt or
  training search, transfer to non-MMLU tasks, and failures that move when the
  benchmark format changes.

What do the propositions license here? Propositions 1 and 1' apply only to
fixed-candidate checkpoint selection with declared hidden value weights. They
do not describe finetuning or contamination. Proposition 2 applies only after a
one-dimensional pass threshold, stakes $V$, and cost parameter $kappa$ have
been declared; MMLU alone supplies none of these. Proposition 3 applies only
after a local convex action/search geometry has been specified. Proposition 4
applies only if benchmark components are modeled as additive channels with
declared costs and hidden-harm exchange rates. Thus MMLU can instantiate the
framework, but it does not by itself license Stackelberg, convex-cost, RLHF, or
welfare bounds.

#claim[*Book-level conclusion.* Goodhart behavior is not determined by proxy
pressure alone. It is determined by the response channel: selection over fixed
types or intervention through fixed-type action and response kernels, with
shape governed by costs, caps, aggregation, affordances, search geometry, and
the declared hidden welfare model.]

// =============================================================================
= Formal analogues across fields
// =============================================================================

== Why this chapter exists

The framework above is not a survey of Goodhart-like effects. It is a contract
for declaring response models. The question in this chapter is narrower: which
existing formal results instantiate one of the framework primitives, and where
does each result stop? A source enters only if it names a primitive and carries
a falsifier. Analogy without a non-transfer condition stays out of the chapter.

== Primitive map

#text(size: 8pt)[
#table(
  columns: (1.05fr, 0.9fr, 1.3fr, 1.45fr),
  inset: 4pt,
  align: horizon,
  [*Source*], [*Primitive*], [*What it licenses*], [*Boundary / falsifier*],
  [El-Mhamdi--Hoang @el-mhamdi2024goodhart],
  [selection + proxy/target],
  [Sharp scalar top-$alpha$ asymptotics under independence and named tails.],
  [Does not license vector, dependent, non-tail, or intervention claims; fails
    without a clean $G + xi$ decomposition or threshold/top-$alpha$ selection.],
  [Majka--El-Mhamdi @majka2025goodhart],
  [selection + proxy/target],
  [Independence-free scalar extension for target/discrepancy Goodhart.],
  [Does not license vector targets or cases with no natural discrepancy
    decomposition; fails when $nu = G + xi$ is not the operative proxy model.],
  [Skalse et al. RL Goodhart @skalse2023goodhart],
  [response kernel + action/cost],
  [RL-specific stopping criterion in occupancy-measure geometry.],
  [Does not license non-MDP, nonlinear-reward, non-concave, or coordinate-free
    claims; fails outside linear occupancy-measure rewards.],
  [Skalse et al. reward hacking @skalse2022rewardgaming],
  [proxy/target separation],
  [Definitions of reward hacking and unhackability for proxy and true rewards.],
  [Does not license welfare or response geometry; unrestricted stochastic
    policy classes make non-trivial unhackability vacuous.],
  [Hardt et al. strategic classification @hardt2016strategic],
  [response kernel + action/cost],
  [Classifier first, then costly feature response: a Stackelberg analogue.],
  [Does not license hidden welfare or quadratic costs by default; fails if
    agents only select participation or observed changes are real improvements.],
  [Perdomo et al. performative prediction @perdomo2020performative],
  [response kernel],
  [Deployment-induced distribution shift and performative stability.],
  [Does not license welfare or type/action identification; fails if the shift is
    exogenous or deployment does not change the data-generating distribution.],
  [Dwork et al. reusable holdout @dwork2015generalization],
  [evidence standard],
  [Validity discipline for adaptive queries and repeated benchmark use.],
  [Does not identify hidden welfare or agent costs; fails for leakage or direct
    feedback mechanisms better modeled as intervention.],
  [Cawley--Talbot @cawley2010overfitting],
  [selection],
  [Model-selection over a fixed candidate set with noisy validation proxy.],
  [Does not license finetuning or contamination claims; fails when candidates
    are generated adaptively from leaderboard feedback.],
  [Blum--Hardt, Roelofs et al., Recht et al. @blum2015ladder @roelofs2019testset @recht2019imagenet],
  [evidence standard],
  [Public/private and regenerated-test-set checks for benchmark claims.],
  [Does not prove leaderboards are safe; fails if transfer loss is from
    difficulty shift rather than adaptive overfitting.],
  [Pan et al. and Gao et al. @pan2022rewardmisspecification @gao2023rewardmodeloveroptimization],
  [search geometry],
  [Empirical thresholds for reward misspecification and overoptimization.],
  [Does not identify $kappa$ with model size, gradient access, or $V$ with a
    benchmark prize; fails if gold reward does not decline under proxy search.],
  [Lucas @lucas1976critique],
  [response kernel],
  [Policy-regime changes can invalidate reduced-form correlations.],
  [Does not license a quantitative bound or welfare model; fails when decision
    rules are stable across the policy change.],
  [Holmstrom--Milgrom @holmstrom1991multitask],
  [aggregation + action/cost],
  [Measured-signal incentives can distort multidimensional effort allocation.],
  [Does not license coordinate-free welfare or non-LEN contracts; fails when
    effort is not multidimensional or all relevant signals are observable.],
  [Smith--Winkler @smith2006optimizerscurse],
  [selection],
  [Finite-sample bias of choosing the maximum noisy estimate.],
  [Does not license multidimensional or response-channel claims; fails without
    finite noisy estimates and max selection.],
)
]

== Machine-learning analogues

The ML rows split cleanly by primitive. Strategic classification is the closest
published neighbor to the simple Stackelberg model: a decision rule is chosen,
then agents alter features at a declared cost @hardt2016strategic. The mapping
is structural, not literal. The book's $Delta = sqrt(2 kappa V)$ result assumes
a one-dimensional quadratic cost; Hardt et al. work with their own cost classes
and learnability conditions. The common primitive is costly fixed-type response
after a policy is announced.

Performative prediction gives the response-kernel version: deploying a
predictor changes the future data distribution @perdomo2020performative. That
licenses the idea that $K_theta$ can change under policy exposure, not a hidden
welfare theorem. Reward hacking and reward misspecification sit beside it.
Skalse et al. define the proxy/target separation sharply @skalse2022rewardgaming;
Pan et al. and Gao et al. show empirical overoptimization regimes
@pan2022rewardmisspecification @gao2023rewardmodeloveroptimization. None of
these identifies the book's $kappa$, $V$, or convex cost geometry for neural
training. They say what an ML application must declare before importing those
symbols.

Benchmark work supplies evidence standards rather than welfare bounds. Cawley
and Talbot describe selection bias in model choice @cawley2010overfitting.
Dwork et al. give reusable-holdout tools for adaptive analysis
@dwork2015generalization. Blum and Hardt's Ladder, plus regenerated-test-set
work by Roelofs et al. and Recht et al., give ways to separate adaptive
leaderboard overfitting from other explanations @blum2015ladder
@roelofs2019testset @recht2019imagenet. These are selection-channel tools. If
the model was finetuned, contaminated, or reward-optimized in response to the
benchmark, the primitive has changed.

Skalse et al.'s RL Goodhart paper is stronger but narrower
@skalse2023goodhart. Its optimal-stopping theorem depends on finite MDPs,
occupancy polytopes, linear rewards, concavity, and an angle bound in projected
reward space. It is valuable precisely because it declares its geometry. It
does not support a generic stopping rule for institutional scorecards, RLHF, or
arbitrary optimization pressure.

== Economics analogues

Lucas is the formal genealogy item for response kernels @lucas1976critique. A
reduced-form relation can fail under a new policy because agents' decision
rules change with the regime. In this framework that is a $K_theta$ warning:
holding the old joint distribution fixed is a selection-style calculation, and
it fails if the policy changes fixed-type behavior. The result does not give a
Goodhart harm bound. It gives a reason the contract must distinguish stable
structure from policy-dependent behavior.

Holmstrom and Milgrom are the main economics analogue for multidimensional
aggregation @holmstrom1991multitask. The principal sees measured signals tied
to an agent's effort vector; rewarding the measured dimensions can pull effort
away from unmeasured dimensions, making low-powered incentives attractive in
the LEN benchmark. That is the same primitive as the book's additive scorecard
analysis: aggregation weights and action costs jointly determine substitution
across dimensions. The boundary matters. Their result is not coordinate-free
welfare and does not cover arbitrary nonlinear contracts by default.

Smith and Winkler's optimizer's curse is a small but useful selection precursor
@smith2006optimizerscurse. It says that choosing the best noisy estimate creates
postdecision disappointment in expectation. That is close to model-selection
overfitting and far from intervention. It enters as selection intuition, not as
a response model.

== What this chapter does not license

This chapter does not claim that the framework subsumes the listed theorem
families. It maps primitives. The selection envelope in Chapter 3 is not
El-Mhamdi and Hoang's tail rate; the Stackelberg toy in Chapter 4 is not
strategic classification in full generality; the response-kernel contract in
Chapter 6 is not the Lucas critique; and the additive scorecard model is not
Holmstrom--Milgrom contract theory.

It also does not license ML transfers by vocabulary. $kappa$ is not gradient
accessibility, model size, benchmark contamination, feature simplicity, or
optimizer search efficiency unless an application declares that model and a
falsifier. $V$ is not automatically a leaderboard prize, a deployment benefit,
or a training objective. $V$ and $kappa$ are placeholders for primitives that a
domain model must earn.

The useful output is the negative one: every promoted source carries a stopping
point. If an application cannot name a primitive and a non-transfer condition,
it should not cite this chapter as support for a Goodhart claim.

// =============================================================================
= Visual appendices
// =============================================================================

The appendices are visual rather than foundational. Appendices A--D illustrate
claims made in the formal chapters: selection drift depends on baseline
response curves, intervention channels transport mass rather than reweight it,
adding measured dimensions separates fixed-deficit harm from population harm,
and response-shape predictions depend on active constraints. The formal chapters
do not show that residual error generically becomes more dimensional or more
complex under repeated proxy refinement; Chapter 5 instead gives conditional
response-shape predictions and shows which quantities would have to be measured
for such a claim to become precise.

// =============================================================================
= Appendix A — Selection drift is coupling-dependent, not dimension-dependent
// =============================================================================

The selection results in Chapter 3 are deliberately conditional. A proxy
threshold moves hidden coordinates through the baseline response curve
$b_H(t) = EE[H mid(|) P >= t] - EE[H]$. In the Gaussian-linear model,
covariance ratios summarize this curve. Outside that model, covariance is only a
local linear summary and can miss the tail response that selection actually
uses.

#figure(
  image("figures/appendix-a-threshold-response.pdf", width: 100%),
  caption: [
    Selection only moves hidden dimensions through the baseline response curve.
    In the Gaussian-linear case, covariance summarizes this response. Outside
    that case, covariance can vanish while threshold response remains large. The
    right primitive is not baseline covariance but the selection response
    $EE[H mid(|) P >= t] - EE[H]$.
  ],
) <fig:threshold-response>

The same point controls dimension. More hidden dimensions do not automatically
create more drift. Dimensional growth appears only when adding dimensions also
adds coupling to the selected proxy.

// =============================================================================
= Appendix B — Selection versus intervention as reweighting versus transport
// =============================================================================

#figure(
  image("figures/appendix-b-selection-vs-intervention.pdf", width: 92%),
  caption: [
    Selection reweights; intervention transports. A selection policy can only
    increase the weight of states already present in the baseline distribution.
    An intervention channel changes the state-generating mechanism, moving mass
    into regions the baseline never visited. This is why the selection-channel
    drift bound has no baseline-only analogue for intervention channels.
  ],
) <fig:selection-vs-intervention>

The Stackelberg toy model in Chapter 4 is the smallest algebraic version of the
right panel. At baseline, $H = 0$. After the metric is announced, an agent can
pay cost $a^2 slash (2 kappa)$ to raise the proxy by $a$, and selection is worth
$V$. In the noiseless threshold case, the gaming band has width
$Delta = sqrt(2 kappa V)$: agents with $Q in [t - Delta, t)$ game just enough to
pass. The resulting proxy bias and hidden harm depend on $kappa$ and $V$, not on
baseline hidden variance. Indeed, the baseline hidden variance is zero in this
toy model.

// =============================================================================
= Appendix C — Fixed-deficit harm versus population harm
// =============================================================================

Under additive aggregation, the agent can substitute between measured gaming
channels. For unit weights and quadratic costs, the cost-minimal allocation for
score threshold $t$ is $a_j = t kappa_j slash K_M$, where
$K_M = sum_(j in M) kappa_j$. The minimum cost is $t^2 slash (2 K_M)$, so gaming
occurs iff $K_M >= t^2 slash (2 V)$. Adding a gameable measured dimension weakly
increases $K_M$ and weakly lowers the cost of reaching the same score deficit.
It leaves $H_per(M, d) = d$ in the unit-weight equal-harm case where gaming is
feasible, but can increase $H_pop (M, F_Q, V)$ by admitting more agents into the
gaming band.

#figure(
  image("figures/appendix-c-welfare-objects.pdf", width: 92%),
  caption: [
    Fixed-deficit and population harm are different objects. In the
    unit-weight equal-harm additive model, feasible $H_per(d)$ curves coincide:
    the same score deficit causes the same per-gamer harm. As aggregate gaming
    capacity $K$ grows, the profitable deficit band expands and population harm
    $H_pop$ rises for both the normal and skewed quality distributions used in
    the Iteration 21 stress check.
  ],
) <fig:welfare-objects>

The sign of a "more metrics" result is therefore not determined by the number of
dimensions. It is determined by the aggregation rule.

The narrow conservation result in the additive model assumes that a point of
score inflation is equally socially harmful no matter which channel supplies it.
With weighted additive score $sum w_j a_j$, quadratic costs, and hidden harm
$sum h_j a_j$, the fixed-deficit per-agent harm is

$ H_per(M, d) = d dot (sum_(j in M) h_j kappa_j w_j) / (sum_(j in M) kappa_j w_j^2). $

// =============================================================================
= Appendix D — Response-shape predictions are conditional
// =============================================================================

Chapter 5 replaces the generic minimum-complexity attractor story with a
conditional response-shape story. The relevant visual distinction is between the
shape of the feasible target set and the geometry that selects one feasible
response. Quadratic costs select a smooth minimum-cost direction; linear or
fixed-charge costs can select one route; caps force spillover only after a route
saturates.

#figure(
  image("figures/appendix-d-response-geometry.pdf", width: 100%),
  caption: [
    Response geometry selects the residual shape. A quadratic cost can spread
    effort along $C w$; a linear or fixed-charge model can concentrate effort on
    the cheapest route; positive fixed costs plus caps can switch active sets.
    None of these is a generic law of increasing complexity.
  ],
) <fig:response-geometry>

Positive activation costs make the capped story less smooth. The optimizer may
use a cheap-to-start channel for small deficits, then switch to a different
channel with lower marginal cost once the deficit is large enough to justify the
entry cost. Thus the robust prediction is lumpy regime change, not universal
sorted filling.

#bibliography("refs.bib", title: "References", style: "association-for-computing-machinery")
