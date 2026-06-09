// Technical extended abstract.
// Compile with: typst compile multidimensional-goodhart-abstract.typ

#set document(title: "Multidimensional Goodhart: Technical Abstract", author: "Xylix Pelttari")
#set page(numbering: "1", margin: (x: 0.8in, y: 0.74in))
#set par(justify: true, leading: 0.5em)
#set text(size: 9.1pt, font: "New Computer Modern")
#set heading(numbering: none)
#show raw: set text(font: "DejaVu Sans Mono", size: 0.9em)

#let tight(body) = block(spacing: 0.15em)[#body]

#align(center)[
  #text(size: 1.45em, weight: "bold")[Multidimensional Goodhart]
  #v(0.12em)
  #text(size: 1.02em)[Measurement Dimensions, Exchange Rates, and Hidden Harm — Technical Abstract]
  #v(0.32em)
  #text(size: 0.9em)[Kerkko "Xylix" Pelttari]
]

#v(0.35em)

#block(inset: 6pt, radius: 3pt, fill: luma(247), stroke: (left: 1.4pt + luma(150)))[
  #text(weight: "bold")[Abstract.] How do measurement dimensions affect hidden
  harm? Multidimensional Goodhart is not a theorem that more metrics help,
  hurt, or make residuals complex. In the one closed model where the question
  has a complete answer, hidden harm is conserved under changes of the
  measured set exactly when every active gaming channel does the same hidden
  harm per score point (an additive exchange-rate iff-condition); otherwise
  harm is reduced, increased, or rerouted through the channels the design
  makes cheap, and the dimension count never enters by itself. The result is
  licensed by a response-modeling contract: proxy pressure supports a
  calculation only after the response channel, action/search geometry,
  aggregation rule, hidden value or harm model, and falsifier are declared.
  Supporting closed results — pure-selection $delta$-reweighting bounds, a
  quadratic Stackelberg wedge, a convex score-deficit budget, and a
  deterministic adaptive-hardening boundary — say when the exchange-rate frame
  applies and what feeds it. The main negative result is equally important:
  score movement alone does not identify mechanism or welfare.
]

== The Measurement-Dimension Question

Should a gamed scorecard measure more things, fewer things, or different
things — and will the hidden damage shrink, grow, or just move? Scalar
Goodhart warnings compress two questions and answer neither @goodhart1975
@campbell1979 @strathern1997. First, the target is reduced to a proxy.
Second, the residual between proxy and target is often treated as an unnamed
loss. In multidimensional settings the residual is the object of interest: it
has direction, support, exchange rates, active constraints, and evidence
requirements. The question is therefore not whether proxy pressure can break
a measure, but which response model makes a proposed calculation about hidden
movement legal — and what that calculation says about the measured set.

Write $G: S -> RR^m$ for target-relevant state, $P: S -> RR^k$ for proxy
features, $phi$ for the intended proxy relation, and
$epsilon(s) = P(s) - phi(G(s))$ for residual proxy artifact. A claim must also
say how policy exposure changes the population or behavior: selection changes
weights $W_theta(u)$ over fixed types, while intervention changes the
fixed-type response kernel $K_theta(d s | u)$.

== No Generic Law

#tight[
- Dimension count alone does not determine hidden harm.
- "More measured dimensions" has no sign without an aggregation rule and harm
  exchange rates.
- Baseline covariance is only a local velocity, not a finite-pressure
  selection primitive.
- Absolute continuity is not the causal intervention boundary.
- The selection/intervention split is not representation-free or marginally
  identifiable.
- Coordinate-explicit selection bounds are not welfare or coordinate-free
  claims until a value metric is declared.
- Convex affordability is not a hidden-harm bound.
- Generic minimum-complexity attraction is not a theorem.
]

== Contract

The response-modeling contract is one paragraph: declare the type space $U$,
baseline law and behavior, policy exposure, selection weights and/or response
kernels, action/search geometry and stakes when interventions are claimed,
proxy/target relation, aggregation rule, hidden value or harm model, evidence
standard, and falsifier. Without those primitives, a Goodhart explanation is a
retrospective label. With them, the framework says which of the following
calculations can be imported and what it refuses to infer.

== The Exchange-Rate Diagnostic

With additive score over a measured channel set $M$, separable quadratic
costs, fixed score deficit $d$, and declared hidden harm rates $h_j$, the
per-agent hidden harm of the cost-minimizing response is
$ H_M(d) =
  d (sum_(j in M) h_j kappa_j w_j) /
    (sum_(j in M) kappa_j w_j^2), $
a weighted harm-per-score average. Fixed-deficit per-agent harm is conserved
across active measured sets iff $h_j = c w_j$ on those channels; otherwise a
measured-set change reduces, increases, or reroutes harm through the channels
it makes cheap. Conjunctive aggregation, population entry, and undeclared
harm rates each break the transfer.

== Supporting Calculations

#tight[
- *Selection bounds.* For pure selection with
  $delta = norm(d mu_theta / d mu_0 - 1)_(L^2(mu_0))$ and drift
  $B_H = EE_(mu_theta)[H] - EE_(mu_0)[H]$, hidden coordinates
  satisfy $abs(B_(H_i)) <= delta s_i$ and, after declaring the Euclidean
  coordinate norm, $norm(B_H)_2 <= delta norm(s)_2$. With a declared scalar
  value vector $v$, $abs(v dot B_H) <= delta sqrt(v^T Sigma_H v)$.
  The value metric is an input, not learned from score movement. Selection is
  the channel that must be excluded or bounded before any intervention
  reading.
- *Intervention budgets.* In the one-dimensional quadratic threshold toy,
  gaming is worthwhile exactly within the wedge
  $Delta = sqrt(2 kappa V)$. More generally, with convex cost $c$ and linear
  proxy gain $w dot a$, the private score-deficit cost is
  $m(d) = sup_(lambda >= 0) [lambda d - c^*(lambda w)]$. This is not a welfare
  bound without hidden harm; it supplies the "which channels are cheap" input
  the exchange-rate diagnostic prices.
- *Adaptive hardening.* Under fixed finite $M$, fixed $d$, fixed $V$, fixed
  weights, additive proxy gain, separable quadratic costs, deterministic
  observation, and monotone capacity hardening, gaming is feasible exactly when
  $S_t(M) = sum_j kappa_(j,t) w_j^2 >= d^2/(2V)$ and stops exactly below that
  threshold.
]

== Literature Relation

Goodhart, Campbell, Strathern, and Manheim--Garrabrant provide the genealogy
and taxonomy @goodhart1975 @campbell1979 @strathern1997
@manheim2018categorizing. Lucas, strategic classification, performative
prediction, multitask incentives, reward hacking, adaptive holdout work, and
scalar tail-conditioned Goodhart provide formal analogues @lucas1976critique
@hardt2016strategic @perdomo2020performative @holmstrom1991multitask
@skalse2022rewardgaming @dwork2015generalization @el-mhamdi2024goodhart
@majka2025goodhart, but each supplies only some primitives. The framework's
claim is reduction rather than unification: name the primitive a source
contributes, and name what it omits.

== Falsifiers, Refusals, and the Open Problem

The framework would be falsified by a domain where primitives are declared in
advance, response channel and action traces distinguish nearby mechanisms, and
the licensed calculation systematically predicts the wrong response shape or
direction while a simpler score-only rule predicts it correctly. Narrow theorem
failures would also falsify the relevant import: selection drift exceeding the
$delta s_i$ envelope under its hypotheses; deterministic hardening violating
the $S_t(M) < d^2/(2V)$ boundary; or additive fixed-deficit harm ignoring the
$h_j = c w_j$ exchange-rate condition.

The framework refuses policy and welfare conclusions when primitives are
unavailable. Examples include drifting type spaces, unobservable scorecard
weights, changing measured sets, no defensible hidden value model, or
applications where score movement is the only evidence.

The signature open problem is the residual-shape conjecture: under what
declared response geometry, update rule, and predeclared complexity functional
does repeated proxy repair drive hidden failure toward a predictable residual
shape? The current answer is negative without those declarations.

#bibliography("refs.bib", title: "References", style: "association-for-computing-machinery")
