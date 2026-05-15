// Short technical extended abstract.
// Compile with: typst compile multidimensional-goodhart-abstract.typ

#set document(title: "Multidimensional Goodhart: Technical Abstract", author: "Xylix Pelttari")
#set page(numbering: "1", margin: (x: 0.78in, y: 0.72in))
#set par(justify: true, leading: 0.48em)
#set text(size: 9.2pt, font: "New Computer Modern")
#set heading(numbering: none)
#show raw: set text(font: "DejaVu Sans Mono", size: 0.9em)

#let compact-list(body) = block(spacing: 0.15em)[#body]

#align(center)[
  #text(size: 1.45em, weight: "bold")[Multidimensional Goodhart]
  #v(0.12em)
  #text(size: 1.03em)[Response Channels, Scorecards, and Residual Shape]
  #v(0.35em)
  #text(size: 0.9em)[Kerkko 'Xylix' Pelttari]
]

#v(0.35em)

#block(inset: 6pt, radius: 3pt, fill: luma(247), stroke: (left: 1.4pt + luma(150)))[
  #text(weight: "bold")[Abstract.] The initial hypothesis was that
  multidimensional proxy optimization would push residual error into more
  structured, perhaps more complex, hidden directions. The current framework
  replaces that with a conditional contract on what residual structure is
  licensed. Selection over fixed states licenses baseline response curves and
  $delta$-reweighting value-drift bounds. Intervention at fixed type requires
  action, cost, search, and stakes primitives. Multidimensional scorecards
  yield exchange-rate and entry effects rather than a generic "more metrics"
  sign: fixed-deficit per-agent harm is conserved across active measured sets
  if and only if harm-per-score satisfies $h_j = c w_j$. Residual shape is
  governed by these primitives together with the declared hidden value model.
  The transfer rule is a response-modeling contract, not a universal Goodhart
  theorem.
]

== Motivation and positioning

Scalar Goodhart warnings compress two things: the target is reduced to a proxy,
and the residual error is often reduced to an unnamed loss. In multidimensional
settings the residual is the object of interest. It has direction, support,
active constraints, exchange rates, and evidence requirements. The question is
therefore not whether optimization can break proxies, but which calculation
about residual structure is licensed once the response channel, action/search
geometry, aggregation rule, and hidden value model are declared.

Let $s in S$ denote the latent state of a unit (an agent, a type, or a
production realization), with baseline law $mu$ on $(S, cal(F))$. Write
$G(s) in RR^m$ for target-relevant state, $P(s) in RR^k$ for proxy features,
$phi$ for the intended proxy relation, and $epsilon(s) = P(s) - phi(G(s))$ for
proxy residual. A claim about multidimensional Goodhart must say how
optimization pressure changes the law of $s$ (selection) or the behavior of
fixed types (intervention).

This refines Manheim and Garrabrant's regressional/extremal/causal/adversarial
taxonomy by mapping the variants onto channel-specific licensed calculations,
rather than treating the taxonomy itself as the formal object: their selection
variants correspond to the reweighting channel, causal and adversarial Goodhart
to the intervention channel with declared cost and worst-case primitives. The
scorecard analysis extends Holmstrom--Milgrom multitasking to a declared
hidden-harm vector, recovering the substitution geometry and adding an
exchange-rate conservation criterion that is absent from the LEN benchmark.

== Contributions

#compact-list[
- *Channel separation.* Selection (reweighting at fixed kernel) and
  intervention (kernel change at fixed type) are formally distinct channels
  with distinct licensed calculations.
- *Selection bounds.* $delta$-reweighting bounds for hidden-coordinate drift
  and for any declared scalar value $v dot H$; the coordinate norm and value
  vector are declared inputs, not inferred from proxy movement.
- *Exchange-rate conservation.* Fixed-deficit per-agent harm $H_"per"(M,d)$ is
  conserved across active measured sets if and only if $h_j = c w_j$, the
  scorecard analogue of, and extension to, Holmstrom--Milgrom multitasking.
- *Adaptive-hardening boundary.* Under the additive, separable-quadratic,
  fixed-$(M, d, V)$ contract, fixed-deficit gaming stops exactly when
  $S_t(M) < d^2 / (2V)$.
- *Response-modeling contract.* The deflationary framework itself: each
  applicable calculation requires a declared set of primitives, and unlicensed
  transfers are named as such.
]

== Current Findings

#compact-list[
- *Selection response.* A pure selection channel reweights a fixed baseline
  law: $mu_theta = L_theta mu$. Hidden drift is
  $B_H(theta) = EE_(mu_theta)[H] - EE_mu[H]$. Threshold response and Boltzmann
  response are baseline path functionals; covariance is only a local velocity
  where the tilted moment-generating function is finite.

- *Selection/value bounds.* If
  $delta = norm(L_theta - 1)_(L^2(mu))$ and hidden coordinates have standard
  deviations $s_i$, then
  $abs(B_(H_i)) <= delta s_i$ and
  $norm(B_H)_2 <= delta norm(s)_2$ after declaring the coordinate norm. For a
  declared scalar value vector $v$,
  $abs(Delta(v dot H)) <= delta sqrt(v^T Sigma_H v)$. The value metric is a
  modeling input, not inferred from proxy movement.

- *Intervention channels.* Intervention means the response kernel changes at
  fixed type: $K_theta(d s | u) != K_0(d s | u)$ on a positive-mass set. The
  one-dimensional quadratic threshold toy gives a gaming wedge
  $Delta = sqrt(2 kappa V)$; this is a signature of ease of gaming and stakes,
  not a baseline covariance result. For convex action cost $c$ and score
  deficit $d$, the private score-deficit cost is
  $m(d) = sup_(lambda >= 0) [lambda d - c^*(lambda w)]$. This is not a welfare
  bound without a hidden-harm functional.

- *Scorecards: the exchange-rate criterion.* The cleanest empirical-design
  hook in the framework. With additive score, separable quadratic costs, fixed
  deficit $d$, score weights $w_j$, and hidden harm rates $h_j$, fixed-deficit
  per-agent harm is
  $H_"per"(M,d) =
    d (sum_(j in M) h_j kappa_j w_j) /
      (sum_(j in M) kappa_j w_j^2)$.
  Conservation across active measured sets requires $h_j = c w_j$, the
  invariance criterion that tells designers what to measure to know whether
  adding a metric helped, hurt, or merely re-routed harm. Population harm is a
  separate entry object; conjunctive aggregation changes the comparison again.

- *Response shape.* Proxy pressure does not generically select
  minimum-complexity residuals. Quadratic costs select cost-minimal directions;
  fixed charges and caps can create lumpy active-set switches; low-rank
  affordances constrain drift to an image; search-prior claims require a
  predeclared coding or search process, so they are not free-floating
  simplicity statements but contracts on the description language.
]

== Why the Framework Matters

The framework replaces slogan transfer with primitive transfer. A domain
application must declare type space $U$, baseline behavior, policy exposure,
selection weights $W_theta$ and/or response kernels $K_theta$, action/search
geometry, proxy/target relation, aggregation, hidden harm/value, and evidence
standard. The same score movement can be selection, harmful fixed-type gaming,
harmless proxy repair, real improvement, or a mixture. Without the contract, a
Goodhart explanation is often just a retrospective label.

This matters most when importing formal analogues. Lucas-style policy
non-invariance, strategic classification, multitask incentives, adaptive
holdout reuse, reward-model overoptimization, and benchmark contamination are
nearby warnings, but each supplies only some primitives. None by itself gives a
hidden welfare model, an action-cost geometry, an empirical estimate of
$kappa$, or a scorecard exchange rate. The contract says which calculation is
licensed: a selection response curve, a reweighting bound, an intervention
budget, an aggregation comparison, or a shape prediction.

The framework is also intentionally lossy about policy. It can say that a toy
diagnostic is unavailable when effective weights, hidden harm, response ease,
or stakes are not declared. It can say that aggregate score movement is
insufficient evidence for hidden-target improvement. It cannot rank policies or
infer welfare from score movement without additional empirical and value
commitments.

== Live Boundaries and Next Work

#compact-list[
- The deterministic adaptive-hardening boundary is closed only in the
  finite-channel additive-score, separable-quadratic, fixed-$M$, fixed-$d$,
  fixed-$V$, fixed-weight, deterministic-observation contract:
  fixed-deficit gaming stops exactly when
  $S_t(M) = sum_j kappa_(j,t) w_j^2 < d^2/(2V)$.
- Stochastic observation, repair-budget design, endogenous stakes, changing
  measured sets or deficits, shared bottlenecks, nonconvex geometry, and
  policy optimization remain separate dynamic problems.
- Empirical applications require repeated-type observations, exposure
  variation, action traces, cost variation, or predeclared hidden outcomes.
  The framework does not license hidden-target estimates, welfare or
  research-value inference, RLHF claims, or generic advice that more metrics
  are good or bad without those primitives.
- *Anti-application and falsification.* The framework is most useful where
  primitives are declarable and reasonably stable. It fails to be useful when
  type space drifts, measured sets are unobservable, or no defensible hidden
  value model is available; a framework that infers welfare from score
  movement alone does something this contract refuses to do, and that refusal
  is a limitation when stakeholders need a verdict without primitives. The
  contract itself would be falsified by a domain where licensed calculations
  systematically disagree with outcomes that primitive declarations were
  supposed to track.
]
