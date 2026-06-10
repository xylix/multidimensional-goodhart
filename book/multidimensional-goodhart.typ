// Multidimensional Goodhart — eight-part book spine (spine v3)
// Compile with: typst compile multidimensional-goodhart.typ
//
// Source authority: research/project_state_after_iteration43.md and
// research/core-math.md. This draft is structural manuscript work: it
// organizes the survived theorem set and response-modeling contract without
// adding new research claims.

#set document(title: "Multidimensional Goodhart", author: "Xylix Pelttari")
#set page(numbering: "1", margin: (x: 1.35in, y: 1.15in))
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

#let boxnote(title, body) = block(
  width: 100%, inset: 8pt, radius: 3pt, fill: luma(246),
  stroke: (left: 2pt + luma(150)),
)[#text(weight: "bold")[#title] #body]

#let theorem(num, title, body) = boxnote[
  T#num. #title.
][#body]

#let contract-row(a, b) = [#text(weight: "bold")[#a] #b]

#align(center)[
  #v(2cm)
  #text(size: 2.1em, weight: "bold")[Multidimensional Goodhart]
  #v(0.35cm)
  #text(size: 1.18em)[Measurement Dimensions, Exchange Rates, and Hidden Harm]
]
#v(1.7cm)

#outline(depth: 2, indent: auto)

= The Measurement-Dimension Question

== More metrics, fewer metrics, different metrics

Every scorecard owner eventually faces the same design question. A measure is
under pressure and the gaming has begun. Should the scorecard measure more
things, fewer things, or different things — and will the hidden damage from
gaming shrink, grow, or just move?

Two folk intuitions answer immediately, in opposite directions. The first says
more metrics leave nowhere to hide: every added dimension closes an escape
route, so a gamed system should be measured more finely. The second says every
metric is a new attack surface: every added dimension is one more channel that
can be manufactured, so measurement should stay sparse and robust. Both sound
like engineering judgment. They cannot both be right as stated, and neither is.

In the one closed model where this book can answer the design question
completely, the outcome is decided not by how many dimensions are measured but
by each gaming channel's exchange rate: how much hidden harm the channel does
per point of score it produces. Changing the measured set conserves hidden harm
exactly when every active channel does the same hidden harm per score point.
When the rates differ, adding or removing metrics reduces, increases, or
reroutes harm according to which channels the design leaves cheap. The
dimension count never enters by itself. That statement is made precise as Theorem 5 (T5)
once the model behind it has been declared. Everything before the theorem
exists to establish what such a declaration requires; everything after it, to
say when the calculation does and does not transfer.

== The warning and what it does not identify

Goodhart's law is usually introduced through the compressed formulation "When a
measure becomes a target, it ceases to be a good measure" @strathern1997. The
original macroeconomic warning is sharper about policy use: "Any observed
statistical regularity will tend to collapse once pressure is placed upon it for
control purposes" @goodhart1975. Both describe a real empirical phenomenon:
once a measure is used for control, the residual error between proxy and target
can acquire direction, support, active constraints, exchange rates, tail
behavior, and response dynamics. But none of those shapes is identified by the
claim that the proxy became a target — and neither is the answer to the design
question above. The warning says a controlled measure will stop tracking its
target. It does not say what an observed score movement means, and it does not
say whether measuring differently would help.

== Five stories, one score path

The identification problem is concrete. A district announces that school
funding will depend on a test-score metric. Next year the average score rises.
That one fact is compatible with several different stories:

- stronger schools entered the funded pool;
- the same schools taught the underlying material better;
- the same schools drilled the test format while learning did not improve;
- low-scoring students were excluded from the tested population;
- reporting errors were repaired with little hidden harm.

The same score path fits all five stories; they differ in who changed and
through which channel. Two channel families matter most and recur through the
book. *Selection* changes who is represented: the pool is re-ranked or
re-weighted while each unit keeps behaving as before. *Intervention* changes
what a fixed unit does: the same school alters its teaching, its test
preparation, or its reporting. Selection and intervention can produce identical
marginal score movement, and they do not license the same mathematics. Hidden
harm is no more readable off the path than mechanism is: the format-drilling
story and the better-teaching story can move the score by the same amount.

So observed score movement underidentifies both mechanism and harm, and the
designer's question cannot be answered by watching the score. The book's
program follows: declare the response model — who can respond, through which
channels, at what cost, with what hidden harm — and then calculate. There is no
shortcut around the declaration; the next part shows that every unconditional
law we tried to prove in its place is false. The part after that states the
declaration itself, and then the design question gets its answer.

= No Generic Law

The failed stronger claims determine the framework's shape: they rule out a
single $n$-dimensional Goodhart law and leave conditional calculations tied to
declared response models. Each failure below also dictates a field of the
declaration introduced in the next part. The failures come in two tiers:
stronger laws refuted by explicit counterexample, and methodological
boundaries — claims that fail because marginal data cannot identify what they
assert. The load-bearing members of both tiers follow in paired form; the full
gallery is tabulated in the appendix.

== Refuted by counterexample

*Not: hidden harm scales with the number of unmeasured dimensions.* Hidden harm
does not scale with $dim(ker phi)$ — the count of directions the proxy map
cannot see, in the notation of the next part — by itself. In a pure selection model, if
hidden coordinates are independent of the selected proxy, thresholding does not
move them — however many of them there are. What survives is a coupling
question: unmeasured dimensions matter through their dependence on the selected
proxy and through the declared value metric, not through their count.

*Not: more measured dimensions means more error — or less.* Additive and
conjunctive aggregation can give opposite comparative statics from the same
primitive action channels. What survives is an aggregation-conditional
calculation: the comparative static has a sign only after the aggregation rule
is declared.

*Not: signed aggregate hidden error measures damage.* Positive and negative
hidden movements can cancel in a signed aggregate. What survives is a
declaration requirement: a value functional, norm, tail risk, or domain loss
must be named before "damage" has a magnitude.

*Not: baseline covariance predicts response under pressure.* With standard
normal $Z$, proxy $P = Z$, and hidden variable $H = Z^2 - 1$, baseline
covariance between proxy and hidden variable is zero,
yet threshold or Boltzmann selection moves $H$. The example shows why zero
baseline covariance is not enough at finite pressure. What survives is
covariance as a local velocity: the derivative at zero pressure, with
finite-pressure behavior depending on the whole tilted path.

*Not: what an agent can afford to game is what gaming costs the world.* A
convex score-deficit cost bounds the proxy movement a unit can privately
afford; it says nothing about hidden harm. Two channels with equal private cost
and equal score weight can carry arbitrarily different harm. What survives is a
division of labor: affordability calculations license affordability claims, and
welfare claims need a declared harm functional.

== Methodological boundaries

*Not: the data says whether the response was selection or intervention.* The
selection/intervention split is not identifiable from marginal score movement,
and it is relative to the declared type representation: enrich the types enough
and every intervention looks like selection over richer types. What survives is
the split as a declared, defended field of the claim, supported by
repeated-type, exposure, action-trace, or structural evidence.

*Not: optimization pressure drives failure toward simple shapes.*
Minimum-complexity attraction is not generic: selection follows baseline tails,
and intervention follows costs, caps, fixed charges, and affordances. What
survives is the response-shape question as a conditional one, taken up with the
supporting calculations.

Two further boundary entries — absolute continuity as an intervention marker,
and the coordinate-dependence of the selection bound — are in the appendix
table; they refine the calculations rather than redirect the design question.
Together the tiers explain the shape of what follows: no unconditional law
survives, so the route to the exchange-rate answer runs through a declaration
discipline.

= The Response-Modeling Contract

== What the contract does

The school-score example left five stories on the table for one score path. The
response-modeling contract is the instrument that separates them: a
declaration, made before any calculation is imported, of who can respond, what
they can do, at what cost, and what hidden value is at stake. The contract has
three plain-language jobs:

1. State what the claim wants to conclude.
2. State what response story would make that conclusion meaningful.
3. State what evidence would distinguish that story from nearby alternatives.

Different stories require different mathematics. Selection bounds apply to
reweighting a fixed population. Intervention bounds need actions, costs, and
stakes. Welfare claims need a hidden value or harm model. The contract is the
rule that says which story is being claimed before the corresponding
calculation is imported.

One status distinction does most of the work: nearly every contract field is
*declared or estimated, not observed*. "Hidden" in this book means hidden from the
scorecard, not necessarily from the analyst. Harm rates, value weights,
response channels, and action costs are inputs the analyst supplies and
defends — from audits, side data, or structural knowledge — and every licensed
calculation is conditional on those declarations. The theorems convert
declared primitives into conclusions; they do not extract the primitives from
the score path.

The contract is not a theorem about what proxy pressure will do. It is a
methodological definition: the minimum declaration needed before a proposed
Goodhart calculation can be evaluated. Its content comes from the failures of
the previous part — marginal score movement does not identify hidden welfare,
the type weights $W_theta$, the response kernels $K_theta$, the action costs,
or the aggregation rule — so the declaration has to supply what the data
cannot.

== The notation

Let $S$ be a state space. A target map $G: S -> RR^m$ records target-relevant
state and a proxy map $P: S -> RR^k$ records measured features. The intended
correspondence is $phi: RR^m -> RR^k$, with residual
$epsilon(s) = P(s) - phi(G(s))$.

Two gaps matter. The *dimension gap* is the part of target variation the proxy
map cannot see: when $phi$ is linear it is carried by $ker phi$, and in general
by variation within the level sets of $phi$. The *observation gap* is residual
measurement artifact inside the measured domain, represented by $epsilon$. A
scalar score may hide both gaps at once.

#figure(
  image("figures/part-i-dimension-observation-gap.pdf", width: 90%),
  caption: [Dimension and observation gaps are different contract fields. The schematic fixes the vocabulary; it draws no quantitative conclusion.]
) <fig:dimension-observation-gap>

A type space $U$ is the model's description of the units before the policy
response. In the school example, $u in U$ might be one school with baseline
traits such as size, neighborhood, student mix, prior resources, and
administrative capacity. It contains the attributes treated as fixed for the
comparison; choices made because of the policy are not part of $u$. The
baseline type law $nu$ says how common those school types are. The observed
state $s in S$ contains what the evaluation later sees, such as test scores,
curriculum, student participation, and hidden learning outcomes when they are
measured.

The response kernel $K_theta (d s | u)$ is the conditional law of the observed
state for a fixed type $u$ after policy exposure $theta$ — read the
conditioning in that order: fix the type, expose it to the policy, and the
kernel returns the distribution over observed states. It is where the model
puts what the same school does after seeing the funding rule. The selection
weight $W_theta (u) >= 0$ is where the model puts changes in which fixed types
appear in the realized population. With these objects, the induced law is

$ mu_theta (A) =
  (integral W_theta (u) K_theta (A | u) nu(d u)) /
  (integral W_theta (u) nu(d u)). $

The formula averages fixed-type response laws over the baseline type law,
weighted by participation, and normalizes. Pure selection means
$K_theta = K_0$ for $nu$-almost every type and policy dependence enters only
through $W_theta$. Intervention means $K_theta$ changes on a positive-$nu$ set
of fixed types. Mixtures are allowed, but they must be named.

== The declaration

A Goodhart claim must therefore declare the primitives that make it a claim
rather than a retrospective label:

#boxnote[Contract.][
- #contract-row[Claimed output:][What are you trying to conclude: score drift,
  hidden drift, a distribution, a selection/intervention label, an intervention
  feasibility bound, a welfare comparison, or a response-shape prediction?]
- #contract-row[Type representation:][What is one fixed unit $u in U$? For a
  school score, is $u$ a school before the funding rule, a student, a classroom,
  or a district? Which attributes are fixed, and which are later choices?]
- #contract-row[Baseline behavior:][What does a fixed type produce before the
  policy response? Declare $nu$ and $K_0(d s | u)$: the baseline distribution of
  observed states conditional on type.]
- #contract-row[Policy exposure:][What creates pressure, and who sees it:
  threshold, ranking, scorecard, prize, penalty, benchmark, or feedback signal
  indexed by $theta$?]
- #contract-row[Response channel:][Does $theta$ only reweight fixed types through
  $W_theta (u)$, change fixed-type behavior through $K_theta (d s | u)$, or both?
  Selection changes who is represented; intervention changes what a fixed unit
  does or produces.]
- #contract-row[Action/search geometry:][If fixed-type behavior changes, what
  actions are available, what do they cost, what caps or fixed charges exist,
  what search process is used, and what stakes $V$ make response worthwhile?]
- #contract-row[Proxy/target relation:][What proxy $P$ is optimized, what target
  $G$ or hidden quantity $H$ is protected, what relation $P approx phi(G)$ is
  intended, and where are the dimension and observation gaps?]
- #contract-row[Aggregation:][If there are multiple proxy components, how are
  they combined: additive weights, thresholds, conjunctive gates, Pareto rules,
  lexicographic rules, or an institution-specific formula?]
- #contract-row[Hidden value or harm:][What makes a response good or bad beyond
  the proxy: hidden coordinates, scalar value vector, norm, loss, or harm rates
  $h_j$?]
- #contract-row[Evidence standard and falsifier:][What observations would
  distinguish the claimed story from nearby alternatives, and what observation
  would make this contract the wrong one?]
]

Each primitive is in the list because some claimed output needs it. Hidden
value or harm is needed for any welfare conclusion. The selection weight
$W_theta$ is needed for selection claims, and the response kernel $K_theta$
for fixed-type response claims. Action costs and stakes are needed for
intervention feasibility. The aggregation rule is needed before any scorecard
comparison has content. A claim that skips a primitive is implicitly asserting
that its output does not depend on it.

The first field is load-bearing. The contract is not a single formula with one
fixed output. It is an adequacy test for a proposed output. A scalar hidden
drift claim needs less information than a full response kernel. A distribution
over $k$ discrete states has $k - 1$ degrees of freedom. A hidden drift vector
in $RR^m$ needs $m$ value-relevant coordinates. A response-kernel claim can be
infinite-dimensional unless the model restricts it. A selection/intervention
label has a small output alphabet, but it is causal: it cannot usually be read
from the marginal score path.

The type representation is part of the empirical claim, not notation to hide
inside the model. If $U$ includes each school's whole future response plan, it
can make every intervention look like selection over richer types. If $U$ is too
coarse, stable heterogeneity can look like a kernel change. The contract
therefore has to defend why the chosen $u$ is fixed for the comparison and why
omitted variation belongs in $K_theta$, $W_theta$, or the action model. The
induced marginal law $mu_theta$ usually cannot distinguish those choices by
itself.

== Contract adequacy

After the output is named, the contract should pass a small information
accounting check:

#boxnote[Contract adequacy.][
1. State the output object and its degrees of freedom or identifying data.
2. List the raw primitives the claim uses: type law, kernels, weights, proxy and
   target maps, aggregation, action costs, stakes, hidden value, and evidence.
3. Subtract constraints, such as probability normalization, declared equality
   $K_theta = K_0$, additive aggregation, convex cost, or fixed deficit.
4. Subtract redundancies, such as the arbitrary scale of $W_theta$ or coordinate
   rescalings that leave the represented situation unchanged.
5. Check units: costs must be comparable to stakes, proxy gains to score
   deficits, and hidden harm rates to the declared value units.
6. Check rank or relevance: independent changes in the declared inputs should
   affect the claimed output, unless the redundancy has been stated.
7. Check invariance: the conclusion should not depend on arbitrary naming,
   coordinate splitting, units, or post-hoc enrichment/coarsening of $U$.
]

In shorthand, a contract is adequate only if
$ "true input information" =
  "raw variables" - "constraints" - "redundancies" $
is enough to identify the claimed output up to the intended invariances. If two
meaningfully different response stories still satisfy the same declared inputs,
the contract has not licensed that output. It may still license a weaker output:
for example, an aggregate score path may license a monitoring trigger while not
licensing a welfare verdict or a selection/intervention classification. The
school-score path is exactly such a case: the declared inputs — a score rise
and a known funding rule — leave all five response stories standing, so the
licensed output is "investigate," not a verdict on any one story.

The contract is demanding by design. It prevents the framework from inferring
welfare, hidden target movement, or a response channel from marginal score
movement alone.

= The Exchange-Rate Diagnostic

The design question of Part 1 — more metrics, fewer metrics, different
metrics — has a complete answer in one closed model. This part declares the
model, proves the answer, and then marks the boundary of the model's
assumptions. The contract fields it consumes are the ones the previous part
introduced: a fixed-type intervention channel, an action-cost geometry, an
aggregation rule, and declared hidden harm rates. Theorem numbers follow the
research record's fixed inventory T1--T6; the headline result is T5, and the
supporting results T1--T4 and T6 are stated in the next part.

== The additive fixed-deficit model

The scorecard calculation needs more than "more metrics." It needs an additive
score over a measured channel set $M$ with weights $w_j$, separable quadratic
action costs $a_j^2/(2 kappa_j)$, a fixed score deficit $d$ that the gaming
unit must close, and linear hidden harm $sum_(j in M) h_j a_j$. Each declared
rate $h_j$, set against the score weight $w_j$, is the channel's exchange
rate: how much hidden harm channel $j$ does per unit of score it produces.

#theorem[5][Additive exchange-rate iff][
With $kappa_j > 0$ and $w_j > 0$ on the measured set, the fixed-deficit
per-agent hidden harm of the cost-minimizing action is

$ H_M (d) =
  d (sum_(j in M) h_j kappa_j w_j) /
    (sum_(j in M) kappa_j w_j^2). $

Fixed-deficit harm is conserved across all measured sets drawn from a channel
pool exactly when $h_j = c w_j$ on that pool.
]

The formula is a weighted harm-per-score average. The cost-minimizing unit
closes the deficit by loading each channel in proportion to $kappa_j w_j$ —
the Lagrange condition prices every channel's score gain at equal marginal
private cost, and under the positivity hypotheses every measured channel
carries nonzero load ("active" means exactly this) — so each channel's harm
rate enters weighted by exactly that load. The sums do not cancel in general
because $kappa_j$, $w_j$, and $h_j$ vary by channel. The iff condition reads
off the average: fixed-deficit harm is conserved across every measured-set
change within a channel pool exactly when each channel in the pool does the
same hidden harm per score unit, $h_j \/ w_j = c$ — singleton sets force
every ratio to the common value. The universality matters: one particular
pair of measured sets can have equal weighted averages by coincidence,
without proportional rates. The condition characterizes invariance across
all comparisons, not a single match.

That is the answer to the design question. Adding or removing measured
channels conserves, reduces, increases, or reroutes the harm of
cost-minimizing gaming strictly through the exchange rates of the channels
the change makes cheap or expensive. The dimension count never enters by
itself. This is the main additive-scorecard result, and it converts the folk
intuitions of Part 1 into a checkable condition: before saying whether a
measured-set change helped, hurt, or only re-routed harm, the hidden harm per
score unit of the affected channels has to be declared or estimated.
Holmstrom--Milgrom multitasking is the closest economics precedent
@holmstrom1991multitask — an analogue for the aggregation-and-effort
structure, not grounding for the theorem — and the contract here makes the
hidden-harm exchange rate explicit.

== Affordability is not the diagnostic

The diagnostic sits on top of an affordability calculation and must not be
confused with it. The convex score-deficit budget (T4, stated with the
supporting calculations) answers "can the unit afford the proxy movement?"
under a declared private-cost model; the exchange-rate diagnostic answers
"what does that movement do to hidden harm?" The two come apart cleanly: if
two proxy channels have equal private cost and equal score weight but harm
rates $(h, 0)$, cost minimization splits effort between them while hidden
harm grows with $h$. Private cost is unchanged; value-weighted harm is not.
Affordability is not welfare.

#figure(
  image("figures/part-ii-t4-t5-cost-ellipse.pdf", width: 88%),
  caption: [Left (T4): private-cost contours, the score-clearing half-plane $w dot a >= d$, and the cost-minimizing action on its boundary. Right (T5): from that action, channels with equal private cost carry different hidden-harm directions, so reading the action as welfare movement requires the declared exchange rates $h_j$.]
) <fig:t4-t5-cost-ellipse>

== The non-transfer boundary

Each assumption in the model carries load, and the diagnostic does not
survive losing any of them.

*Additive aggregation.* The weighted-average form exists because score
contributions add. Conjunctive aggregation — requiring every measured
component to clear a bar — is a different rule with different comparative
statics, not a corollary; under it, harm can grow with the number of
components.

*Separable quadratic costs.* Proportional loading, and with it the closed
form of $H_M (d)$, is quadratic-cost algebra. Other convex costs still give an
affordability budget but not the exchange-rate formula.

*Fixed deficit, per agent.* The result prices one unit closing one deficit.
Lowering the private cost of reaching the score can recruit additional
below-threshold units into gaming, so conserved per-gamer harm $H_"per"$ does
not imply conserved population harm $H_"pop"$.

*Declared harm rates.* The $h_j$ are contract inputs, hidden from the
scorecard but declared or estimated by the analyst. Without them there is no
diagnostic — only the affordability statement.

#figure(
  image("figures/part-ii-population-gaming-band.pdf", width: 88%),
  caption: [The gaming band separates fixed-deficit per-gamer harm $H_"per"$ from population harm $H_"pop"$. More capacity widens entry without by itself changing the per-gamer exchange-rate formula.]
) <fig:population-gaming-band>

The mechanics deferred here — population entry, conjunctive rules, and the
step from per-agent harm to welfare — are taken up at the end of the next
part.

= Supporting Calculations

The remaining closed results support the exchange-rate diagnostic; none is an
independent headline. The selection bounds say when an intervention reading
is licensed at all — score movement with no unit acting is a different
mechanism. The affordability results say which channels a design makes cheap,
the input the diagnostic prices. The hardening result treats capacity
reduction as measurement design in time. The response-shape taxonomy and the
aggregation-and-entry mechanics mark where the fixed-deficit frame ends.

== Selection: the channel to exclude first

The same score path the diagnostic explains can be produced with no unit
acting at all: pure selection reweights a fixed population. Before any
intervention calculation is licensed, the contract has to rule selection out
or bound it. Selection is the regime where policy changes only the weights
over a fixed baseline, so baseline variance and reweighting intensity are
enough to bound hidden drift.

Before the theorem can be used, the contract must supply a baseline law, a pure
selection channel, hidden coordinates or a value metric, and enough integrable
moments. Pure selection means $K_theta = K_0$ and the policy changes only the
weights, with the induced law absolutely continuous with respect to baseline,
$mu_theta << mu_0$. Write
$L = d mu_theta / d mu_0$ and
$delta = norm(L - 1)_(L^2(mu_0))$, and call
$B_H (theta) = EE_(mu_theta)[H] - EE_(mu_0)[H]$
the selection drift of the hidden vector $H$.

#theorem[1][Coordinate-explicit selection bound][
For hidden coordinates $H_i$ with finite second moments and baseline standard
deviations $s_i$,
$ abs(EE_(mu_theta)[H_i] - EE_(mu_0)[H_i]) <= delta s_i $
for each coordinate. After a Euclidean coordinate metric is declared,
$ norm(B_H (theta))_2 <= delta norm(s)_2 . $
]

#theorem[2][Value-weighted/operator selection bound][
For a declared scalar value direction $v$ and covariance $Sigma_H$,
$ abs(v dot B_H (theta)) <= delta sqrt(v^T Sigma_H v) . $
For a declared norm,
$ norm(B_H (theta))_V <=
  delta sup_(norm(v)_(V,*) <= 1) sqrt(v^T Sigma_H v) . $
]

These are Hilbert-space Cauchy--Schwarz bounds because hidden drift is an
inner product: it pairs the reweighting residual $L - 1$ with the centered
hidden variable, and Cauchy--Schwarz turns the pairing into an envelope. The
bounds give drift envelopes for pure reweighting. They do not identify the
hidden coordinates, the value weights, or the welfare object. They do not
apply to fixed-type response changes.

Part 2's covariance refutation gets its mechanism here. Covariance enters as
a local velocity and nothing more: along a valid exponential tilt — one whose
$exp(beta P)$ stays normalizable over the pressure range — the derivative at
zero pressure is a covariance, while at finite pressure the whole tilted
path, tail shape, and moment-generating domain matter. That is what the
$H = Z^2 - 1$ example exploited: baseline covariance zero, finite-pressure
drift nonzero.

#figure(
  image("figures/part-ii-t1-t2-drift-envelope.pdf", width: 78%),
  caption: [T1/T2 give a declared hidden-space envelope. Boltzmann-style pressure paths are trajectories inside that declared geometry, not replacements for the finite-pressure bound.]
) <fig:t1-t2-drift-envelope>

== Intervention: when a gaming channel activates

Once fixed types can act, baseline-distribution bounds are no longer the
right object; the relevant primitive is action affordability under costs and
stakes. The affordability results say which channels a design makes cheap
enough to activate — the input the exchange-rate diagnostic consumes.

Before an intervention calculation can be used, the contract must supply a
fixed-type action model: actions $a$, private cost $c(a)$, proxy gain $w dot a$,
score deficit $d$, and stakes $V$. The calculation measures the affordability
of proxy movement under that model.

#theorem[3][Quadratic Stackelberg wedge][
In the one-dimensional noiseless threshold toy with quality $Q$, action
$a >= 0$, private cost $a^2 / (2 kappa)$, threshold $t$, and stakes $V$,
gaming by a below-threshold unit is privately worthwhile exactly when
$t - Q <= sqrt(2 kappa V)$.
]

In prose: a below-threshold unit must buy the deficit $d = t - Q$; the
cheapest passing action costs $d^2/(2 kappa)$; gaming is worthwhile exactly
when that cost is at most $V$. The wedge $sqrt(2 kappa V)$ is a signature of
this quadratic toy. It is not a universal intervention law and should not be
read as an RLHF, benchmark, or organizational theorem unless the missing
primitives — action, cost, stakes, and pass condition — have been declared.

#theorem[4][Convex score-deficit budget][
With finite-dimensional action space, closed proper convex cost $c$, linear
proxy gain $w dot a$, and regularity for convex duality, define
$m(d) = inf_a { c(a): w dot a >= d }$. Then
$ m(d) = sup_(lambda >= 0) [lambda d - c^*(lambda w)] . $
Gaming under stakes $V$ is feasible exactly when $m(d) <= V$ in this declared
private-cost model.
]

In T4, $c^*$ is the convex conjugate of the cost and $lambda$ is the
multiplier pricing the score-deficit constraint; the regularity hypothesis is
the standard strong-duality requirement of convex analysis, a Slater-type
interior-feasibility condition. The budget licenses private
affordability under the declared model and nothing more; the boundary between
affordability and hidden harm is drawn with the exchange-rate diagnostic.

== Adaptive hardening: measurement design in time

Hardening is the dynamic face of the design question: instead of changing
which channels are measured, the designer reduces channel capacities over
time and asks when gaming stops being feasible. The result is narrow by
design. The contract is fixed finite measured set $M$, fixed deficit $d$,
fixed stakes $V$, fixed weights, additive proxy gain, separable quadratic
costs, deterministic observation, and monotone hardening of capacities
$kappa_(j,t)$.

#theorem[6][Deterministic adaptive-hardening capacity boundary][
Let
$ S_t (M) = sum_(j in M) kappa_(j,t) w_j^2 $
and $T = d^2 / (2V)$. At time $t$, fixed-deficit gaming is feasible exactly
when $S_t (M) >= T$. Hardening reaches no-gaming exactly when
$S_t (M) < T$. A progress-aware largest-action multiplicative rule terminates in
finite time when channels are finite, positive-weight, and floor capacity
satisfies $S_"floor" (M) < T$.
]

The terminating rule is concrete: at each step, multiply by a fixed
$alpha in (0, 1)$ the capacity of a largest-action channel among those not
yet at their floor — "progress-aware" rules out stalling on an
already-floored channel.

Nothing broader is licensed. The theorem does not cover stochastic
observation, arbitrary hardening rules, changing measured sets, changing
deficits, changing stakes, nonconvex costs, shared bottlenecks, cycles, welfare
comparison, or policy optimality. The immediate anti-transfer is noisy
observation: once the update rule can chase noise, the deterministic threshold
is no longer a stopping theorem.

== Response shape, conditionally

The project did not prove a generic residual-shape law. What survives is a
conditional taxonomy:

- Quadratic costs select the minimum-cost direction, often proportional to
  $C w$ — $C$ the declared cost matrix in $c(a) = a^T C^(-1) a \/ 2$, $w$
  the score weights — in a smooth unconstrained model.
- Fixed charges create entry thresholds and active-set comparisons.
- Caps produce spillover only after a channel saturates.
- Low-rank affordances constrain response to an image, but do not choose a
  basis-invariant "simple" direction by themselves.
- Search-prior claims require a coding language or search process fixed before
  the failure is observed.

These are not theorem transfers between domains. They are ways to turn a
response-shape conjecture into a declared model with falsifiers.

== Aggregation and entry

Three mechanisms move harm outside the fixed-deficit frame of the
exchange-rate diagnostic, and each needs its own declared rule.

*Population entry.* The diagnostic prices one unit closing one deficit.
Lowering the private cost of reaching the score — adding cheap channels,
raising capacities — can recruit additional below-threshold units into
gaming. Per-gamer harm can be conserved while population harm grows on the
entry margin; the gaming band of @fig:population-gaming-band separates the
two quantities.

*Conjunctive aggregation.* Requiring every measured component to clear a bar
is a different aggregation rule with different comparative statics: harm can
grow with the number of components because gates are cleared, not traded off.
Nothing in the additive formula transfers without re-derivation.

*From harm to welfare.* Per-agent harm, population harm, and welfare are
three different objects. Moving between them needs the declared value
model — who counts, how harms aggregate, and what offsets are allowed. The
contract treats that as a separate declaration, never a corollary.

The supporting calculations close here: they say when the exchange-rate frame
applies, what feeds it, and where it ends.

= Prior Work and Stress Tests

This part demonstrates the same claim twice: reduction, not unification.
First on the literature — each nearby formalism supplies some fields of the
response-modeling contract and omits others, so what transfers is a
primitive, never a theorem. Then on cases — MMLU, hospital readmissions, and
scientific metrics are run against the question the book is organized
around: what would the exchange-rate audit need here, and what does the
contract refuse without it?

== Genealogy

Goodhart, Campbell, Strathern, and Manheim--Garrabrant are genealogy, not proof
sources for the calculations above. Goodhart's original macroeconomic warning
concerns policy-contaminated regularities @goodhart1975; the Lucas critique is
its companion precedent, arguing that policy change invalidates the estimated
relations policy relies on @lucas1976critique. Campbell's warning
concerns social indicators under decision pressure @campbell1979. Strathern's
formulation supplies the familiar compressed warning @strathern1997. Manheim
and Garrabrant provide a useful cause taxonomy @manheim2018categorizing.

This book does not replace that genealogy with a grander taxonomy. It uses the
genealogy to ask which primitives are present: selection, response kernel,
action cost, proxy/target separation, aggregation, hidden value, and evidence
standard.

== Formal analogues, primitive by primitive

The closest formal analogues supply some primitives and omit others.
El-Mhamdi--Hoang and Majka--El-Mhamdi are scalar tail-conditioned selection
anchors @el-mhamdi2024goodhart @majka2025goodhart. Hardt et al. strategic
classification supplies costly feature-change intervention @hardt2016strategic.
Perdomo et al. performative prediction supplies deployment-induced response
kernels @perdomo2020performative. Skalse et al. supply proxy/target and
RL-specific response-kernel tools @skalse2022rewardgaming @skalse2023goodhart.
Holmstrom--Milgrom supplies the closest multitask incentive analogue for
aggregation and action costs @holmstrom1991multitask. Cawley--Talbot, reusable
holdout, leaderboard work, and optimizer's curse supply selection and evidence
standards @cawley2010overfitting @dwork2015generalization @blum2015ladder
@roelofs2019testset @recht2019imagenet @smith2006optimizerscurse. Pan and Gao
provide empirical response-geometry candidates, not plug-in parameters
@pan2022rewardmisspecification @gao2023rewardmodeloveroptimization.

== What each discipline contributes vs. omits

#table(
  columns: (1.25fr, 1.35fr, 1.35fr, 1.35fr),
  inset: 5pt,
  align: horizon,
  table.header[*Source family*][*Primitives supplied*][*Primitives omitted*][*Licensed transfer*],
  [Tail-conditioned Goodhart],
  [Selection, scalar proxy/target, tail assumptions.],
  [Vector aggregation, intervention, hidden welfare.],
  [Sharp scalar asymptotics where the tail contract holds; otherwise only a
   reweighting analogy.],
  [Strategic classification and performative prediction],
  [Response kernels, costly action or endogenous deployment.],
  [General hidden value, scorecard exchange rates, marginal identification.],
  [Intervention framing after action/cost or deployment response is declared.],
  [RL reward hacking],
  [Proxy/target separation, MDP occupancy geometry, optimization pressure.],
  [Non-MDP domains, empirical welfare, generic cost parameter.],
  [RL-specific response calculations only inside the MDP/occupancy contract.],
  [Multitask incentives],
  [Aggregation and multidimensional effort/cost.],
  [The book's value-metric contract, non-LEN settings unless separately shown.],
  [External precedent for the scorecard exchange-rate question, not a proof of
   this book's theorem.],
  [Adaptive holdout and leaderboard hygiene],
  [Selection/evidence standards for repeated benchmark use.],
  [Fixed-type finetuning, contamination, welfare, action cost.],
  [Evidence discipline for selection over fixed candidates and public/private
   score interpretation.],
  [Reward overoptimization empirics],
  [Candidate search and optimization-pressure variables.],
  [A defended mapping from model size, KL, data access, or prize to $kappa$ or
   $V$.],
  [Hypothesis generators for response geometry; no automatic theorem transfer.],
  [Empirical exchange-rate estimates (placeholder)],
  [Candidate evidence for per-channel harm rates $h_j$: hospital readmissions
   versus mortality, education audit-test transfer, public-target gaming,
   reward-model overoptimization curves.],
  [Identified per-channel rates; policy-variation designs that separate
   channel loads from harm movement.],
  [None yet. This row family is a placeholder for a parallel empirical track;
   the diagnostic's measured content lands here.],
)

== Reduction, not unification

No single equation unifies these literatures. The framework's claim is narrower:
each formalism fills different fields of the response-modeling contract. The
contract says which primitive is being borrowed and which transfer fails. A
source about adaptive holdouts does not identify hidden welfare. A source about
costly feature change does not identify value weights. A source about multitask
contracts does not make "more metrics" good or bad in a new application.

The same reduction discipline now runs on three concrete cases. Each case
asks what the exchange-rate audit would need and what the contract refuses
without it.

== MMLU

MMLU is useful because it is not a single mechanism @hendrycks2021mmlu. A public
benchmark score can induce fixed-checkpoint model selection, repeated adaptive
testing, prompt search, finetuning on benchmark-like data, contamination,
reward-model overoptimization, or genuine capability transfer.

The contract separates these mechanisms. Fixed-checkpoint comparison is a
selection problem: candidate checkpoints are types, the score is a proxy, and
the hidden target is performance away from the benchmark. Finetuning, prompt
search, contamination, or reward optimization is intervention/search only after
an action/search geometry is declared. MMLU alone supplies neither $kappa$ nor
stakes $V$, and it does not supply hidden welfare. T3/T4 apply only after a
cost model and score deficit are declared. T5 applies only after benchmark
components are modeled as additive channels with harm exchange rates.

The stress test is whether the evidence can distinguish fixed-candidate
selection from post-exposure adaptation. Necessary observations include
benchmark access, training data lineage, prompt/search budget, repeated-query
history, transfer to non-MMLU tasks, and failure modes that move when the
benchmark format changes.

== Hospital readmissions

For a readmission scorecard, score improvement is compatible with hospitals
leaving the comparison pool, coding changes, observation-status changes,
delayed admissions, patient avoidance, better follow-up care, or mixtures.

What the exchange-rate audit would need here is concrete: effective score
weights $w$, stakes $V$, response ease $kappa$ for coding, discharge timing,
follow-up, and patient selection channels, hidden harm rates $h$, and the
signal adequacy of the measured components. If these are unavailable, the design consequence is not
"assume the score is bad." It is: do not use the toy diagnostic, collect action
traces, monitor hidden patient outcomes where possible, pilot or lower leverage,
and mark the missing primitive.

This is an evidence contract, not policy advice. The framework can say that
aggregate readmission movement is insufficient to credit patient-welfare
improvement. It cannot rank hospital policies without the clinical and value
model the contract explicitly requires.

== Scientific metrics

Publication counts, citations, grants, venue prestige, and rankings are already
covered by responsible-metrics warnings such as DORA @dora2013 and the Leiden
Manifesto @hicks2015leiden.
The framework does not claim novelty for the warning that crude metrics can
distort science.

The stress test is discriminator value. A scientific scorecard application must
separate selection over researchers, labs, fields, and institutions from
fixed-researcher response. It must distinguish harmful proxy manufacture
from harmless metadata/discoverability repair and from genuine improvements in
methods, robustness, replication value, useful synthesis, or long-run uptake.

The contract refuses broad research-value inference from score movement. If an
institution cannot declare the target, aggregation, action traces, and hidden
value model before interpreting a score rise, the framework returns "no
licensed hidden-value claim."

What the three cases share is the protocol shape: collect the discriminating
traces, declare the primitives, and let the contract say which claim is
licensed. The next part states that protocol in a form meant to be used.

= Using the Framework

== What to do before crediting score movement

Wentworth's practical warning is that experiments often measure something other
than what the experimenter thinks they are measuring: an unexpected confounder,
a secondary channel, a sampling artifact, or an operational detail that happens
to track the named quantity @wentworth2022notmeasuring. The proposed repair is
not to stare harder at the headline metric. It is to measure many auxiliary
traces so the unexpected channel has somewhere to show up.

This book agrees with the first half and adds a second step. Auxiliary traces
are necessary for discovery, but they are not sufficient for interpretation.
They must feed a declared response contract. The combined rule is: collect the
firehose for discovery, then use the contract for claim licensing. Without the
firehose, the analyst misses the confounder. Without the contract, the analyst
has many traces and still no disciplined statement of which score movement
counts as selection, fixed-type response, proxy repair, harmful gaming, real
improvement, or a mixture.

The practical workflow is therefore not to ask first, "did the score improve?"
Ask instead: what changed, who changed, by what channel, at what cost, with
what hidden target evidence, and what observation would make this interpretation
fail? A score rise is an observation to be explained, not a conclusion to be
credited.

#table(
  columns: (1.1fr, 2.7fr),
  inset: 5pt,
  align: horizon,
  table.header[*Audit field*][*Entry before crediting score movement*],
  [Observed score movement],
  [Magnitude, timing, affected units, score components, and whether the
   movement is marginal, thresholded, ranked, or aggregate.],
  [Candidate mechanisms],
  [Selection, fixed-type response, proxy repair, harmful gaming, real
   improvement, or an explicit mixture.],
  [Required discriminator traces],
  [Repeated-type evidence, exposure timing, action logs, search or query
   budget, component-level score changes, participation changes, and
   off-score outcomes that separate nearby mechanisms.],
  [Hidden value/harm evidence],
  [Declared target coordinates, value weights, harm rates, residual measures,
   or domain outcomes; if absent, mark the hidden-value claim unlicensed.],
  [Missing primitives and operational consequence],
  [The undeclared type space, baseline law, response channel, action cost,
   aggregation rule, or hidden value model, plus the resulting consequence:
   collect traces, lower leverage, pilot, or withhold the claim.],
  [Licensed claim],
  [The narrow statement supported by the declared contract: for example,
   pure-selection drift envelope, private affordability under a cost model,
   exchange-rate diagnostic, or no hidden-value conclusion.],
  [Blocked claim],
  [The stronger statement not supported: welfare improvement, target
   improvement, policy optimality, channel identification, or generic
   anti-metric advice.],
  [Contract-failure condition],
  [A concrete observation that would defeat the interpretation, such as
   action traces inconsistent with the named channel, hidden outcomes moving
   opposite the claimed target, or theorem conditions failing.],
)

This sheet is smaller than the full application template. Its job is to slow
down the common interpretive jump. If the observed movement is a
readmission decline, a benchmark rise, a citation increase, or a ranking gain,
the first audit question is the same: what response channel could have produced
this movement? The second is which traces would discriminate that channel from
its nearest rivals. The third is which hidden value or harm evidence is present,
and which claim remains blocked if it is absent.

The conclusion can be positive, but it has to be narrow. "The score improved
and auxiliary outcomes moved in the declared target direction under stable
exposure" is a different claim from "the policy improved welfare." "The action
logs fit a low-cost proxy-repair story" is a different claim from "the metric is
safe." "The selection envelope bounds hidden coordinate drift under the stated
law" is a different claim from "selection is harmless." Practical use of the
framework is mostly this discipline of replacing a large conclusion with the
smaller one the evidence actually licenses.

= Refusals, Falsifiers, and the Open Agenda

== Anti-applications

The framework is least useful when its primitives cannot be stably declared.
Concrete anti-applications include:

- A rapidly shifting online platform where type space, measured set, policy
  exposure, and available actions all change between measurements.
- A black-box institutional ranking where effective weights and thresholds are
  unobservable and participants cannot tell which action channel is being
  rewarded.
- A high-stakes public decision where stakeholders demand a welfare verdict
  but no defensible hidden value model exists.

In these cases, the contract returns "no verdict." That is not a hedge; it is
the framework refusing to convert score movement into causal mechanism or
welfare language without the primitives that would make the claim testable.

== Falsifiers

The contract is falsifiable as a modeling discipline, but the failure point
has to be located honestly. The theorems themselves cannot be empirically
violated while their hypotheses hold; they are proved. What can fail is the
claim the contract makes about a domain: that independently audited
declarations of channel, costs, stakes, and harm rates track the response
mechanism well enough for the licensed calculation to predict response shape
or direction. A concrete falsifier is therefore a domain where the primitives
are declared and audited in advance, response channel and action traces are
observable enough to distinguish nearby mechanisms, and the licensed
calculation still systematically predicts wrongly while a simpler score-only
rule predicts correctly.

Examples include:

- A setting independently audited as pure selection, with the declared moment
  and absolute-continuity conditions checked, where hidden drift repeatedly
  exceeds the $delta s_i$ envelope. The bound cannot fail under its
  hypotheses, so repeated excess drift would show that the audit and the
  contract's response-channel field failed to detect a fixed-type response
  channel.
- A hardening setting audited as having stable $M$, $d$, $V$, weights,
  separable quadratic costs, and deterministic observation, where gaming
  remains feasible after $S_t (M) < d^2/(2V)$ or stops while
  $S_t (M) >= d^2/(2V)$ — showing the audited capacities or observation model
  were not the ones the agents faced.
- An additive scorecard with defended $w_j$, $kappa_j$, and $h_j$ where
  fixed-deficit per-agent harm stays conserved across every audited
  measured-set change even
  though the exchange-rate condition $h_j = c w_j$ fails, or moves even
  though the condition holds — showing the declared channels, costs, or harm
  rates were not the ones generating the response.

Such failures, if they survived audit, would not call for prose repair. They
would mean the contract fields do not track the response mechanisms they were
designed to track — that disciplined declaration does not buy predictive
power. That is the falsifiable content of the framework.

== The residual-shape conjecture

The signature open problem is the residual-shape conjecture: when does
repeated proxy repair drive hidden failure toward a predictable residual
shape, such as a low-complexity attractor?
The current answer is negative unless a mechanism is named first.

Resolving it requires at least five declarations: a response mechanism, a
complexity or shape functional fixed before inspection, a policy-update rule, a
composition rule for repeated repair, and a failure condition. It would count
as progress to prove a sparse, low-rank, or low-description-length attractor
inside one of those contracts. It would not count to observe a simple-looking
failure after the fact and relabel it as the attractor.

== Composition, identification, and information

Three structural gaps remain.

First, channels compose. Real cases mix selection, fixed-type response, proxy
repair, and real improvement. The current contract names mixtures but does not
give a general calculus for them.

Second, primitives are not automatically identifiable. Marginal score movement
does not identify $W_theta$ versus $K_theta$, hidden harm, action costs, or
aggregation. The framework needs identification toys and evidence thresholds
for when a primitive can be treated as declared rather than guessed. The
sharpest version of this gap belongs to the exchange-rate diagnostic: under
what policy-variation designs are per-channel harm rates $h_j$ identifiable
from aggregate score and harm movement? Until that question has an answer,
the diagnostic's empirical row stays a placeholder.

Third, the $L^2$ selection bound may not be the portable final form. An
information-theoretic restatement could travel further if it preserves the
distinction between coordinate-explicit drift, declared value metrics, and
finite-pressure path behavior.

== Toolkit gap

A practitioner should not have to re-derive the contract every time. The missing
toolkit has three parts: a primitive-elicitation protocol, worked exchange-rate
audits in real scorecards, and small identification examples that show what
observations distinguish selection, intervention, proxy repair, and real
improvement.

Until those tools exist, the framework is best read as a claim-license
discipline and a theorem inventory. It tells a reader what would have to be
true before a Goodhart calculation travels.

#heading(numbering: none)[Appendix: The Killed-Claims Gallery]

The full set of failed stronger claims behind the no-generic-law part. Each
row records the refuted claim and what survives it; load-bearing rows appear
in paired form in the main text.

#table(
  columns: (1.2fr, 1.8fr, 0.65fr),
  inset: 5pt,
  align: horizon,
  table.header[*Failed claim*][*What survives*][*Tier*],
  [Hidden harm scales with $dim(ker phi)$ by itself.],
  [A coupling question: unmeasured dimensions matter through dependence on the
   selected proxy and the declared value metric. Independent hidden coordinates
   do not move under thresholding.],
  [Counterexample],
  [More measured dimensions means more (or less) hidden error.],
  [Aggregation-conditional comparative statics: additive and conjunctive rules
   give opposite signs from the same action channels.],
  [Counterexample],
  [Signed aggregate hidden error measures damage.],
  [A declared value functional, norm, tail risk, or domain loss; signed hidden
   movements can cancel.],
  [Counterexample],
  [Baseline covariance predicts finite-pressure response.],
  [Covariance as the zero-pressure derivative. With $P = Z$ and
   $H = Z^2 - 1$, baseline covariance is zero while threshold or Boltzmann
   selection moves $H$.],
  [Counterexample],
  [Convex affordability is welfare.],
  [Affordability claims under the declared private-cost model; welfare needs a
   declared harm functional.],
  [Counterexample],
  [Absolute continuity marks the intervention boundary.],
  [Absolute continuity as a hypothesis of the reweighting theorem; fixed-type
   action changes can remain absolutely continuous with respect to the
   baseline law.],
  [Boundary],
  [The selection/intervention split is identifiable from marginal data.],
  [The split as a declared field, relative to a defended type representation,
   supported by repeated-type, exposure, action-trace, or structural
   evidence.],
  [Boundary],
  [The selection bound is coordinate-free by itself.],
  [A coordinate-explicit bound until a value norm or scalar value functional
   is named.],
  [Boundary],
  [Optimization pressure drives failure toward minimum-complexity shapes.],
  [Conditional response-shape statements: selection follows baseline tails;
   intervention follows cost, search, caps, fixed charges, and affordances.],
  [Boundary],
)

#bibliography("refs.bib", title: "References", style: "association-for-computing-machinery")
