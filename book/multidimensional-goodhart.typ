// Multidimensional Goodhart — six-part book spine
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
  #text(size: 1.18em)[Response Channels, Scorecards, and Residual Shape]
  #v(0.9cm)
  #text(size: 1em)[Working draft — six-part spine]
  #v(0.3cm)
  #text(size: 0.95em, style: "italic")[#datetime.today().display()]
]
#v(1.7cm)

#outline(depth: 2, indent: auto)

= Part I — The Licensing Problem

== 1. The slogan and what it gets wrong

Goodhart's law is often used as if proxy movement were already evidence about
hidden value. That is the mistake this book tries to remove. The empirical
phenomenon is real: once a measure is used for control, the residual error
between proxy and target can acquire direction, support, active constraints,
exchange rates, tail behavior, and response dynamics. But none of those shapes
is identified by the slogan "the proxy became a target."

The same observed score improvement can come from several mechanisms. A fixed
pool can be re-ranked so better-scoring units enter the selected set. Continuing
units can repair measurement errors with no hidden harm. The same units can
game a high-score, high-harm action channel. Or the score can improve because
the target itself improved. The aggregate score path does not distinguish those
stories. A calculation is licensed only after the response model says what is
fixed, what changes, and what hidden value or harm is being measured.

This book therefore treats "multidimensional Goodhart" as a response-modeling
framework, not as a single universal theorem. The framework asks what proxy
pressure changes and which primitives are declared before importing a bound.

== 2. What "multidimensional" actually adds

Let $S$ be a state space. A target map $G: S -> RR^m$ records target-relevant
state and a proxy map $P: S -> RR^k$ records measured features. The intended
correspondence is $phi: RR^m -> RR^k$, with residual
$epsilon(s) = P(s) - phi(G(s))$.

Two gaps matter. The *dimension gap* is the part of target variation the proxy
map cannot see, represented by directions such as $ker phi$. The *observation
gap* is residual measurement artifact inside the measured domain, represented
by $epsilon$. A scalar score may hide both gaps at once.

Two response channels matter as much as the geometry. A pure selection channel
changes participation or selection weights $W_theta(u)$ over a type space
$U$ while leaving the response kernel fixed. An intervention channel changes
the fixed-type kernel $K_theta(d s | u)$. With baseline type law $nu$,

$ mu_theta(A) =
  (integral W_theta(u) K_theta(A | u) nu(d u)) /
  (integral W_theta(u) nu(d u)). $

Selection and intervention can produce similar marginal score movement. They
do not license the same mathematics.

== 3. What we tried and what failed

The negative results are not housekeeping; they are the reason the framework
has its current shape.

#boxnote[Claim gallery.][
- *Unconditional dimensional scaling fails.* Hidden harm does not scale with
  $dim(ker phi)$ by itself. If hidden coordinates are independent of the
  selected proxy, thresholding does not move them.
- *"More measured dimensions means more error" has no sign.* Additive and
  conjunctive aggregation can give opposite comparative statics from the same
  primitive action channels.
- *Signed aggregate hidden error is unstable.* Positive and negative hidden
  movements can cancel. A value functional, norm, tail risk, or domain loss has
  to be declared.
- *Covariance is not a finite-pressure primitive.* With $P = Z$ and
  $H = Z^2 - 1$, baseline covariance is zero but threshold or Boltzmann
  selection moves $H$.
- *Absolute continuity is not the intervention boundary.* It is useful for the
  reweighting theorem, but fixed-type action changes can remain absolutely
  continuous with respect to the baseline law.
- *The selection/intervention split is not marginally identifiable.* It is
  relative to a declared type/action representation and needs repeated-type,
  exposure, action-trace, or structural evidence.
- *The selection bound is not coordinate-free by itself.* It is
  coordinate-explicit until a value norm or scalar value functional is named.
- *Convex affordability is not welfare.* A score-deficit cost bounds private
  action affordability, not hidden harm.
- *Minimum-complexity attraction is not generic.* Selection follows baseline
  tails; intervention follows cost, search, caps, fixed charges, and
  affordances.
]

These failures block a single "n-dimensional Goodhart law." What survives is a
set of conditional calculations plus a discipline for saying when each
calculation applies.

== 4. The response-modeling contract

A Goodhart claim must declare the primitives that make it a claim rather than a
retrospective label:

#boxnote[Contract.][
- #contract-row[Type representation:][what counts as fixed type $u$, and what
  belongs to post-exposure behavior.]
- #contract-row[Baseline behavior:][the baseline type law $nu$ and response
  kernel $K_0$.]
- #contract-row[Policy exposure:][the rule, threshold, ranking, scorecard, or
  incentive indexed by $theta$.]
- #contract-row[Response channel:][selection weights $W_theta$, response
  kernels $K_theta$, or an explicit mixture.]
- #contract-row[Action/search geometry:][available actions, costs, caps,
  fixed charges, search process, and stakes $V$ when an intervention bound is
  imported.]
- #contract-row[Proxy/target relation:][the maps $P$, $G$, $phi$, residual
  $epsilon$, and the relevant dimension and observation gaps.]
- #contract-row[Aggregation:][additive, conjunctive, threshold, Pareto,
  lexicographic, or institution-specific rule.]
- #contract-row[Hidden value or harm:][coordinates, scalar value vector, norm,
  or harm rates $h_j$.]
- #contract-row[Evidence standard and falsifier:][observations that would
  distinguish the claimed channel from nearby alternatives and observations
  that would make the import fail.]
]

The contract is intentionally demanding. It prevents the framework from
inferring welfare, hidden target movement, or a response channel from marginal
score movement alone.

= Part II — Licensed Calculations

== 5. Selection channel

This section covers T1 and T2 in `research/core-math.md`.

Before the theorem applies, the contract must supply a baseline law, a pure
selection channel, hidden coordinates or a value metric, and enough integrable
moments. Pure selection means $K_theta = K_0$ and the policy changes only the
weights. In the induced marginal law, write
$L = d mu_theta / d mu_0$ and
$delta = norm(L - 1)_(L^2(mu_0))$.

#theorem[1][Coordinate-explicit selection bound][
For hidden coordinates $H_i$ with finite second moments and baseline standard
deviations $s_i$,
$ abs(EE_(mu_theta)[H_i] - EE_(mu_0)[H_i]) <= delta s_i $
for each coordinate. After a Euclidean coordinate metric is declared,
$ norm(B_H(theta))_2 <= delta norm(s)_2 $.
]

#theorem[2][Value-weighted/operator selection bound][
For a declared scalar value direction $v$ and covariance $Sigma_H$,
$ abs(Delta(v dot H)) <= delta sqrt(v^T Sigma_H v) $.
For a declared norm,
$ norm(B_H(theta))_V <=
  delta sup_(norm(v)_(V,*) <= 1) sqrt(v^T Sigma_H v) $.
]

These are Hilbert-space Cauchy--Schwarz bounds. They license drift envelopes
for pure reweighting. They do not identify the hidden coordinates, the value
weights, or the welfare object. They do not apply to fixed-type response
changes.

Covariance belongs here only as a local velocity. Along a valid exponential
tilt, the derivative at zero pressure is a covariance. At finite pressure the
path response, tail shape, and moment-generating domain matter. This is why the
zero-covariance example $H = Z^2 - 1$ survives as a warning.

== 6. Intervention channel

This section covers T3 and T4 in `research/core-math.md`.

Before an intervention calculation applies, the contract must supply a
fixed-type action model: actions $a$, private cost $c(a)$, proxy gain $w dot a$,
score deficit $d$, and stakes $V$. The calculation is about affordability of
proxy movement under that model.

#theorem[3][Quadratic Stackelberg wedge][
In the one-dimensional noiseless threshold toy with quality $Q$, action
$a >= 0$, private cost $a^2 / (2 kappa)$, threshold $t$, and stakes $V$,
gaming by a below-threshold unit is privately worthwhile exactly when
$t - Q <= sqrt(2 kappa V)$.
]

The wedge $sqrt(2 kappa V)$ is a signature of this quadratic toy. It is not a
universal intervention law and should not be read as an RLHF, benchmark, or
organizational theorem unless the action, cost, stakes, and pass condition have
been declared.

#theorem[4][Convex score-deficit budget][
With finite-dimensional action space, closed proper convex cost $c$, linear
proxy gain $w dot a$, and regularity for convex duality, define
$m(d) = inf_a { c(a): w dot a >= d }$. Then
$ m(d) = sup_(lambda >= 0) [lambda d - c^*(lambda w)] $.
Gaming under stakes $V$ is feasible exactly when $m(d) <= V$ in this declared
private-cost model.
]

The cost-minimal action and the hidden-welfare action are different objects.
For example, if two proxy channels have equal private cost and equal score
weight but hidden harm vector $(M, 0)$, cost minimization splits effort while
hidden harm grows with $M$. The budget licenses private affordability; welfare
requires a hidden harm functional.

== 7. Multidimensional scorecards — the keeper

This section covers T5 in `research/core-math.md`.

The scorecard calculation needs more than "more metrics." It needs an additive
score, measured channel set $M$, weights $w_j$, separable quadratic costs
$a_j^2/(2 kappa_j)$, fixed score deficit $d$, and linear hidden harm
$sum_(j in M) h_j a_j$.

#theorem[5][Additive exchange-rate iff][
The fixed-deficit per-agent hidden harm of the cost-minimizing action is

$ H_M(d) =
  d (sum_(j in M) h_j kappa_j w_j) /
    (sum_(j in M) kappa_j w_j^2). $

Fixed-deficit harm is conserved across compared active measured sets exactly
when $h_j = c w_j$ on those active channels.
]

This is the most exportable scorecard result. It says what must be checked
before saying whether adding or removing a measured channel helped, hurt, or
only re-routed harm: the hidden harm per score unit has to be declared or
estimated. Holmstrom--Milgrom multitasking is the closest economics precedent,
but the contract here makes the hidden-harm exchange rate explicit.

The result is fixed-deficit and per-agent. Population entry is a separate
object: lowering the private cost of reaching the score can recruit more units
into gaming even when each fixed-deficit gamer has conserved harm. Conjunctive
aggregation is also a separate object; requiring every measured component to
clear a bar can make harm grow with the number of components.

== 8. Adaptive hardening — narrow but real

This section covers T6 in `research/core-math.md`.

The hardening result is intentionally narrow. The contract is fixed finite
measured set $M$, fixed deficit $d$, fixed stakes $V$, fixed weights, additive
proxy gain, separable quadratic costs, deterministic observation, and monotone
hardening of capacities $kappa_(j,t)$.

#theorem[6][Deterministic adaptive-hardening capacity boundary][
Let
$ S_t(M) = sum_(j in M) kappa_(j,t) w_j^2 $
and $T = d^2 / (2V)$. At time $t$, fixed-deficit gaming is feasible exactly
when $S_t(M) >= T$. Hardening reaches no-gaming exactly when
$S_t(M) < T$. A progress-aware largest-action multiplicative rule terminates in
finite time when channels are finite, positive-weight, and floor capacity
satisfies $S_"floor"(M) < T$.
]

Nothing broader is licensed. The theorem does not cover stochastic
observation, arbitrary hardening rules, changing measured sets, changing
deficits, changing stakes, nonconvex costs, shared bottlenecks, cycles, welfare
comparison, or policy optimality. The immediate anti-transfer is noisy
observation: once the update rule can chase noise, the deterministic threshold
is no longer a stopping theorem.

== 9. Response shape, conditionally

The project did not prove a generic residual-shape law. What survives is a
conditional taxonomy:

- Quadratic costs select the minimum-cost direction, often proportional to
  $C w$ in a smooth unconstrained model.
- Fixed charges create entry thresholds and active-set comparisons.
- Caps produce spillover only after a channel saturates.
- Low-rank affordances constrain response to an image, but do not choose a
  basis-invariant "simple" direction by themselves.
- Search-prior claims require a coding language or search process fixed before
  the failure is observed.

These are not theorem transfers between domains. They are ways to turn a
response-shape conjecture into a declared model with falsifiers.

= Part III — Across Disciplines: Primitive Attribution

== 10. Genealogy

Goodhart, Campbell, Strathern, and Manheim--Garrabrant are genealogy, not proof
sources for the calculations above. Goodhart's original macroeconomic warning
concerns policy-contaminated regularities @goodhart1975. Campbell's warning
concerns social indicators under decision pressure @campbell1979. Strathern's
formulation gives the aphorism @strathern1997. Manheim and Garrabrant provide
a useful cause taxonomy @manheim2018categorizing.

This book does not try to replace that genealogy with a grander taxonomy. It
uses the genealogy to ask which primitives are present: selection, response
kernel, action cost, proxy/target separation, aggregation, hidden value, and
evidence standard.

== 11. Formal analogues, primitive by primitive

The closest formal analogues each supply some primitives and omit others.
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

== 12. What each discipline contributes vs. omits

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
)

== 13. Reduction, not unification

There is no single equation that unifies these literatures. The framework's
claim is narrower: each formalism instantiates different fields of the
response-modeling contract. The value of the contract is that it says which
primitive is being borrowed and which transfer fails. A source about adaptive
holdouts does not identify hidden welfare. A source about costly feature change
does not identify value weights. A source about multitask contracts does not
make "more metrics" good or bad in a new application.

= Part IV — Cases as Stress Tests

== 14. MMLU

MMLU is useful because it is not one mechanism @hendrycks2021mmlu. A public
benchmark score can induce fixed-checkpoint model selection, repeated adaptive
testing, prompt search, finetuning on benchmark-like data, contamination,
reward-model overoptimization, or genuine capability transfer.

The contract separates them. Fixed-checkpoint comparison is a selection
problem: candidate checkpoints are types, the score is a proxy, and the hidden
target is performance away from the benchmark. Finetuning, prompt search,
contamination, or reward optimization is intervention/search only after an
action/search geometry is declared. MMLU alone supplies neither $kappa$ nor
stakes $V$, and it does not supply hidden welfare. Proposition 3 applies only
after a cost model and score deficit are declared. Proposition 4 applies only
after benchmark components are modeled as additive channels with harm exchange
rates.

The stress test is whether the evidence can distinguish fixed-candidate
selection from post-exposure adaptation. Necessary observations include
benchmark access, training data lineage, prompt/search budget, repeated-query
history, transfer to non-MMLU tasks, and failure modes that move when the
benchmark format changes.

== 15. Hospital readmissions

For a readmission scorecard, score improvement is compatible with hospitals
leaving the comparison pool, coding changes, observation-status changes,
delayed admissions, patient avoidance, better follow-up care, or mixtures.

The auditable primitives are concrete: effective score weights $w$, stakes
$V$, response ease $kappa$ for coding, discharge timing, follow-up, and patient
selection channels, hidden harm rates $h$, and signal adequacy $gamma$ for the
measured components. If these are unavailable, the design consequence is not
"assume the score is bad." It is: do not use the toy diagnostic, collect action
traces, monitor hidden patient outcomes where possible, pilot or lower leverage,
and mark the missing primitive.

This is an evidence contract, not policy advice. The framework can say that
aggregate readmission movement is insufficient to credit patient-welfare
improvement. It cannot rank hospital policies without the clinical and value
model the contract explicitly requires.

== 16. Scientific metrics

Publication counts, citations, grants, venue prestige, and rankings are already
covered by responsible-metrics warnings such as DORA and the Leiden Manifesto.
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

= Part V — What the Framework Refuses to Do

== 17. Anti-applications

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

== 18. Falsifiers

The contract itself is falsifiable as a modeling discipline. A concrete
falsifier would be a domain where the primitives are declared in advance,
response channel and action traces are observable enough to distinguish the
nearby mechanisms, and the licensed calculation systematically predicts the
wrong response shape or direction while a simpler score-only rule predicts it
correctly.

Examples:

- In a pure-selection setting with measured $L$ and hidden coordinates, hidden
  drift repeatedly exceeds the $delta s_i$ envelope under the stated moment and
  absolute-continuity conditions.
- In a fixed finite deterministic hardening setting, with stable $M$, $d$,
  $V$, weights, separable quadratic costs, and deterministic observation,
  gaming remains feasible after $S_t(M) < d^2/(2V)$ or stops while
  $S_t(M) >= d^2/(2V)$.
- In an additive scorecard with defended $w_j$, $kappa_j$, and $h_j$,
  fixed-deficit per-agent harm is conserved across active measured sets even
  when the exchange-rate condition $h_j = c w_j$ fails, or fails to be
  conserved when the condition holds.

If those failures survived audit, the framework would not merely need prose
repair; the licensed theorem import would be wrong or the contract fields would
not track the response mechanism they were supposed to track.

= Part VI — Open Agenda

== 19. The residual-shape conjecture

The signature open problem is Q18: when does repeated proxy repair drive hidden
failure toward a predictable residual shape, such as a low-complexity attractor?
The current answer is negative unless a mechanism is named first.

Resolving Q18 requires at least five declarations: a response mechanism, a
complexity or shape functional fixed before inspection, a policy-update rule, a
composition rule for repeated repair, and a failure condition. It would count
as progress to prove a sparse, low-rank, or low-description-length attractor
inside one of those contracts. It would not count to observe a simple-looking
failure after the fact and relabel it as the attractor.

== 20. Composition, identification, and information

Three structural gaps remain.

First, channels compose. Real cases mix selection, fixed-type response, proxy
repair, and real improvement. The current contract names mixtures but does not
give a general calculus for them.

Second, primitives are not automatically identifiable. Marginal score movement
does not identify $W_theta$ versus $K_theta$, hidden harm, action costs, or
aggregation. The framework needs identification toys and evidence thresholds
for when a primitive can be treated as declared rather than guessed.

Third, the $L^2$ selection bound may not be the portable final form. An
information-theoretic restatement could travel further if it preserves the
distinction between coordinate-explicit drift, declared value metrics, and
finite-pressure path behavior.

== 21. Toolkit gap

A practitioner should not have to re-derive the contract every time. The missing
toolkit has three parts: a primitive-elicitation protocol, worked
exchange-rate audits in real scorecards, and small identification examples that
show what observations distinguish selection, intervention, proxy repair, and
real improvement.

Until those tools exist, the framework is best read as a claim-license
discipline and a theorem inventory. It tells a reader what would have to be
true before a Goodhart calculation travels.

#bibliography("refs.bib", title: "References", style: "association-for-computing-machinery")
