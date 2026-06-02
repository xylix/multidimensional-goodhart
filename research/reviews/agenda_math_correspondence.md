# Agenda-math correspondence audit

Audit date: 2026-06-02.

Scope: independent audit of the 12 agenda-to-repo correspondence claims in
`plans/agenda-math-correspondence-PROMPT.md`. Source edits were limited to this
new report plus the O8 cross-reference in `research/open_questions.md`.

External source checked: Zhuang and Hadfield-Menell, "Consequences of Misaligned
AI", NeurIPS 2020 / arXiv:2102.03896. The arXiv abstract states the `L`
attribute, `J < L` proxy-support setup and the necessary/sufficient
overoptimization result; the NeurIPS PDF gives the formal model and theorems.

## Executable and derivation evidence

- `cd research/simulations && make run` completed successfully.
- Relevant simulation lines:
  - `iteration20_selection_intervention.py`: hidden drift follows declared
    coupling, not dimension count; zero covariance can coexist with nonzero
    threshold drift; Boltzmann finite-pressure response is not summarized by
    baseline covariance; T3/T4 toy checks pass.
  - `iteration21_population_active_sets.py`: active-face quadratic response
    invalidates the unconstrained `Cw` direction when signs bind; fixed-deficit
    `H_per` and population `H_pop` are distinct.
  - `iteration27_adaptive_hardening.py`: T6-style adaptive hardening and
    measurement-frontier toys pass.
  - `iteration36_response_dynamics.py`: stochastic observation and
    endogenous-stakes dynamics are model-dependent boundary cases, not generic
    iteration laws.
- Scratch derivations run with `uv run --with sympy --with numpy --with scipy`
  confirmed:
  - T5 optimizer:
    `a_j* = d kappa_j w_j / sum_i kappa_i w_i^2`.
  - T5 harm:
    `H_M(d) = d sum_j h_j kappa_j w_j / sum_j kappa_j w_j^2`.
  - T5 conservation iff:
    `H_M(d)` is set-independent across compared active sets exactly when
    `h_j = c w_j` on those active channels.
  - T1:
    `B_H = E_0[(L-1)H]`, so Cauchy-Schwarz gives
    `|B_{H_i}| <= ||L-1||_2 sd(H_i)` after coordinates are declared.
  - Quadratic KKT:
    for `c(a) = (1/2) a^T C^-1 a`, `w.a >= d`, PD `C`,
    `a* = d Cw/(w^T Cw)` in the unconstrained/interior case; generic full
    support follows when `Cw` has no zero components. With `C=I`,
    `w=(1,-1)`, the unconstrained direction has a negative component and fails
    under `a >= 0`.
  - Selection counterexamples:
    for `P=Z`, `H=Z^2-1`, `Cov(H,P)=0` but
    `E[H | Z >= t] = t phi(t)/(1-Phi(t)) > 0`; exponential tilting gives
    `E_beta[H]-E[H] = beta^2`.
  - Diffuse selection:
    with `H_i=Z+xi_i`, thresholding on `P=Z` shifts every coordinate by
    `phi(t)/(1-Phi(t))`, proportional to `(1,...,1)`.

## Claim 1

Claim as stated: Thesis "displacement+rotation" = KILLED as a generic law.

Repo math object: the response-modeling contract plus the negative-result
boundary around dimension count, re-routing, covariance, and Q18.

Document layer: confirmed. `research/negative_results.md` rejects dimension
count alone (lines 3-9), re-routing as a generic harm reducer (35-41), and
unconditional minimum-complexity attraction (59-65). `plans/spine.md` says
measurement dimensions have no generic effect and depend on declared primitives
(13-21), and lists generic dimensionality and transfer claims as refused
(40-51).

Re-derivation layer: confirmed. The scratch checks produced countermodels in
which hidden drift is zero when uncoupled, nonzero despite zero covariance, and
cost-minimal rather than "rotated toward illegibility".

Simulation layer: confirmed. `iteration20` reports hidden drift follows
declared coupling, not dimension count; `iteration21` separates per-agent and
population harm; `iteration36` turns dynamic iteration into a boundary problem.

Final verdict: confirmed.

## Claim 2

Claim as stated: P1 displacement law = KILLED.

Repo math object: failed generic dimensional scaling and failed re-routing law.

Document layer: confirmed. `research/negative_results.md` says more hidden
dimensions alone do not imply more harm (3-9), additive re-routing can leave
fixed-deficit harm unchanged while adding channels can recruit more gamers
(35-41), and more measured dimensions has no sign without aggregation (43-49).

Re-derivation layer: confirmed. Independent threshold-selection checks showed
uncoupled coordinates do not move; T5 shows re-routing is conserved only under
the exchange-rate condition.

Simulation layer: confirmed. `iteration20` reports hidden drift follows
declared coupling, not dimension count. `iteration21` reports coincident
`H_per` curves in the equal-harm model and expanding `H_pop` under entry.

Final verdict: confirmed.

## Claim 3

Claim as stated: P1 toy already committed and the agenda's "stays metaphor"
risk is retired.

Repo math object: committed theorem/simulation stack around T3-T6 rather than a
mere metaphor.

Document layer: confirmed with clarification. `research/core-math.md` contains
canonical theorem statements T3-T6 (84-170), and the book has matching theorem
blocks for T3-T6 at lines 339, 351, 380, and 417.

Re-derivation layer: confirmed. T5 and the quadratic intervention formula were
rederived; T3/T4 are covered by the simulation checks and the same convex-cost
calculus.

Simulation layer: confirmed. `make run` executed all four simulation files.
`iteration27` directly exercises adaptive hardening and measurement-frontier
toys; `iteration20` and `iteration21` exercise the intervention calculations.

Final verdict: confirmed, with the correction that the committed object is a
small theorem/simulation stack, not one standalone P1 toy.

## Claim 4

Claim as stated: P2 selection vs intervention = `W_theta` reweighting vs
`K_theta` fixed-type response.

Repo math object: stable response-kernel definitions and the T1/T2 versus
T3/T4 split.

Document layer: confirmed. `research/core-math.md` defines `W_theta`,
`K_theta`, pure selection as `K_theta = K_0` with policy dependence through
weights, and intervention as `K_theta != K_0` on positive type mass (17-27).
T1/T2 are selection theorems (43-82); T3/T4 are intervention/action-cost
theorems (84-120).

Re-derivation layer: confirmed. T1 follows from
`B_H = E_0[(L-1)H]` and Cauchy-Schwarz, and is coordinate-explicit rather than
coordinate-free.

Simulation layer: confirmed. `iteration20` labels selection checks separately
from Stackelberg and multichannel intervention checks.

Final verdict: confirmed.

## Claim 5

Claim as stated: P2 "correlations set displacement direction" = KILLED as a
general primitive.

Repo math object: nonlinear threshold and finite-pressure Boltzmann
counterexamples.

Document layer: confirmed. `research/negative_results.md` gives the
`H=Z^2-1`, `Cov(H,P)=0`, nonzero threshold response example (19-25), and the
Boltzmann finite-pressure failure of baseline covariance (27-33).

Re-derivation layer: confirmed. For standard normal `Z`,
`Cov(Z^2-1,Z)=0` by oddness, while
`E[Z^2-1 | Z >= t] = t phi(t)/(1-Phi(t)) > 0`; exponential tilting shifts the
normal to `N(beta,1)`, so `E_beta[Z^2-1]=beta^2`.

Simulation layer: confirmed. `iteration20` reports near-zero covariance with
threshold drift about `1.5281`, and normal tilt `E_beta[Z^2-1]` matching
`beta^2` within sampling error.

Final verdict: confirmed.

## Claim 6

Claim as stated: P3 conservation = T5 `h_j = c w_j`, PROVEN, is the project's
keeper.

Repo math object: additive exchange-rate iff-condition.

Document layer: confirmed. `research/core-math.md` states T5, its fixed-deficit
harm formula, and the iff condition (122-143). The book theorem block agrees
at lines 380-389 and calls it the exportable scorecard result at 391-395.
`plans/spine.md` centers the manuscript around T5 (13-21, 25-27, 63-66).

Re-derivation layer: confirmed. Lagrange multipliers give
`a_j* = d kappa_j w_j / S(M)` and the stated `H_M(d)`. Requiring the weighted
average `sum h_j kappa_j w_j / sum kappa_j w_j^2` to be constant across active
sets forces, and is forced by, `h_j/w_j` being constant on those channels.

Simulation layer: confirmed. `iteration21` reports `H_per` curves coincide
where gaming is feasible in the equal-harm/equal-exchange-rate model, while
`H_pop` changes separately.

Final verdict: confirmed.

## Claim 7

Claim as stated: P4 illegible-subspace iteration = KILLED unconditional /
PARKED conditional (Q18).

Repo math object: Q18 as a response-geometry or baseline-tail question, not a
generic iteration theorem.

Document layer: confirmed. `research/negative_results.md` kills unconditional
minimum-complexity attraction (59-65). `minimum_complexity_attractor.md` says
Q18 needs a response process, cost/search geometry, and complexity functional
(9-24), and concludes broad Q18 is false without an added mechanism (131-146).
`research/claim_audits.md` keeps recursive Goodhart speculative and conditional
(28-39).

Re-derivation layer: confirmed. The selection diffuse-drift example and the
quadratic KKT example both violate unconditional attraction toward a lowest
support-size or inherently "illegible" direction.

Simulation layer: confirmed. `iteration36` shows dynamic behavior depends on
declared observation and stakes recurrences; it supports parking dynamic
extensions rather than promoting a generic law.

Final verdict: confirmed.

## Claim 8

Claim as stated: P4 quadratic intervention gives DENSE drift
`a* = dCw/(w^T Cw)`, a concrete refutation of "rotation toward illegibility".

Repo math object: unconstrained/interior quadratic intervention KKT.

Document layer: revised. `minimum_complexity_attractor.md` derives
`a* = dCw/(w^T Cw)` (62-87), but immediately narrows it under nonnegativity and
active-face constraints (88-93). `research/claim_audits.md` likewise says the
right claim is "cost-minimal drift along `Cw` in the unconstrained/interior
case; otherwise active-face solution" (91-93).

Re-derivation layer: confirmed with the same caveat. For PD `C`, stationarity
gives `C^-1 a = lambda w`, and binding gives the stated formula. Generic `Cw`
has full support, so the formula refutes a support-sparse or complexity-minimal
attractor. But density is not guaranteed under sparse `Cw`, sign constraints,
caps, or active faces.

Simulation layer: confirmed with caveat. `iteration21` reports an invalid
unconstrained action `[0.8500, -0.8500]` under `a >= 0` and the corrected
active-face action `[1.7000, 0.0000]`.

Final verdict: revised. Corrected claim: quadratic intervention gives
`a* = dCw/(w^T Cw)` in the unconstrained/interior model, generically full
support, which refutes an unconditional sparse/illegible-rotation story; it is
not a blanket dense-drift theorem.

## Claim 9

Claim as stated: Selection produces DIFFUSE drift proportional to `(1,...,1)`
in the `H_i = Z + xi_i` example.

Repo math object: selection-regime counterexample to Q18.

Document layer: confirmed. `minimum_complexity_attractor.md` states that with
`P=Z` and `H_i=Z+xi_i`, thresholding shifts every hidden coordinate equally,
giving full support in the substantive hidden-coordinate basis (52-56).
`research/negative_results.md` records the same diffuse selection counterexample
(59-65).

Re-derivation layer: confirmed. Since `xi_i` are independent mean-zero noises,
`E[H_i | Z >= t] - E[H_i] = E[Z | Z >= t] = phi(t)/(1-Phi(t))` for every `i`.

Simulation layer: indirect confirmation. `iteration20` confirms selection drift
follows declared baseline coupling, not dimension count. No existing simulation
is exactly this `H_i=Z+xi_i` toy; the scratch derivation is the direct check.

Final verdict: confirmed.

## Claim 10

Claim as stated: The agenda's "illegible" is a complexity claim in disguise,
contradicting its "Excluded: complexity" note.

Repo math object: Q18 complexity-functional boundary.

Document layer: confirmed. `minimum_complexity_attractor.md` explicitly requires
a complexity functional and keeps cost separate from complexity (9-24). It says
Q18 is under-specified until the complexity functional and representation are
fixed (52-56), and that broad complexity attraction is false without an added
mechanism (131-146).

Re-derivation layer: confirmed. The same vector can be full support under a
support-size complexity measure and short-description under a symmetry-aware
description language. Therefore "illegible" is not a mathematical primitive
until the representation and complexity measure are declared.

Simulation layer: n/a directly. Existing simulations exercise response geometry
and dynamic boundaries, but no simulation can validate "illegibility" without a
predeclared complexity measure.

Final verdict: confirmed.

## Claim 11

Claim as stated: Refs Manheim-Garrabrant / Skalse 2022 / Gao /
"Leo"=El-Mhamdi-Hoang are present in the lit map; Z&HM is ABSENT from the whole
repo.

Repo math object: formal analogue literature map and O8.

Document layer: revised. The lit map contains El-Mhamdi/Hoang, Skalse 2022,
Gao/Pan, Manheim-Garrabrant-adjacent genealogy/primitive rows (for example
`research/reviews/formal_analogue_lit_map.md` 95-108 and 115-124). However,
Z&HM is not absent from the whole repo: `research/open_questions.md` already has
O8 for "Zhuang & Hadfield-Menell incorporation or rejection" (105-143), and the
prompt file itself also mentioned Z&HM before deletion. The accurate narrower
statement is that Z&HM is absent from the formal lit-map rows, the book, and the
bibliography as a settled analogue.

Re-derivation layer: n/a. This is a repository-presence claim.

Simulation layer: n/a.

Final verdict: revised. Corrected claim: the named existing references are
present in the lit map; Z&HM is present only as O8/open work and is not yet a
settled lit-map/book/bibliography analogue.

## Claim 12

Claim as stated: The Z&HM characterization itself ("static below-baseline result
over a `J<L` attribute subset") is accurate.

Repo math object: O8 external-fork question.

Document layer: revised. The source does use an `L`-attribute state space and a
proxy objective supported on `J<L` attributes. In the NeurIPS PDF, the formal
model defines `S subset R^L`, lower-bounded attributes, strictly increasing
`C` and `U`, proxy attributes `J`, unmentioned attributes `K`, and complete
proxy optimization over feasible state sequences. Theorem 1 says convergent
proxy optimization drives unmentioned attributes to their lower bounds; Theorem
2 gives compact-upper-contour and low-lower-bound conditions under which
optimization is `u`-costly. Taking `u = U(s(0))` when the theorem's lower-bound
condition permits it gives the below-initial/no-optimization reading.

Re-derivation layer: confirmed at the level needed for this audit. Z&HM's result
is not a dimension-count theorem: the loss comes from strict monotonicity,
resource/feasibility tradeoffs, compact upper-contour assumptions, and the
ability to push at least one unmentioned attribute sufficiently low. That is a
stronger intervention/allocation setup than the generic agenda slogan.

Simulation layer: n/a. No local simulation implements Z&HM.

Final verdict: revised. Corrected claim: Z&HM is accurately characterized as an
incomplete-proxy result over `J<L` attributes with below-baseline consequences
under stated resource/compactness/lower-bound assumptions, but it is not a
static selection result and should be treated here as a contrast class, not an
anchor.

## Overall result

Claims 1-7, 9, and 10 are confirmed. Claims 8, 11, and 12 are revised. None are
fully refuted once corrected for scope.

The main correction is that the agenda's surviving correspondence is narrower
than the prior analysis suggested: the repo supports response-channel and
exchange-rate diagnostics, not a generic displacement/rotation/illegibility law.
Z&HM is the closest direct prior statement of the incomplete-proxy phenomenon,
but because its conclusion relies on a specific intervention/allocation model
with resource tradeoffs and compactness/lower-bound assumptions, it is a
contrast class for this repo's refusal discipline rather than the current
mathematical anchor.
