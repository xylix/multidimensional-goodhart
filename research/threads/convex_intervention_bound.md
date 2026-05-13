# Thread: convex-cost intervention bounds

Iteration type: `generate`

## 1. Motivation

The selection-channel bound is a baseline-distribution statement:

`||B_H(theta)||_2 <= ||L_theta - 1||_{L^2(mu_0)} ||s||_2`.

Every term is a `mu_0`-functional. Iterations 11 and 12 repaired the
selection/intervention boundary by moving intervention to fixed-type response
kernels. The missing analogue is Q10: what kind of bound exists once fixed
types can act?

The candidate answer is not another divergence from `mu_0`. It is an
agent-side feasibility or cost bound. Intervention drift is bounded by what
actions are affordable under the stakes, not by how much baseline variation was
already present.

## 2. Fixed-type action model

For a declared type `u`, let:

- `A(u)` be the feasible action set, with baseline action `0 in A(u)`;
- `c_u(a) >= 0` be private action cost, with `c_u(0) = 0`;
- `p_u(a)` be the proxy gain bought by action `a`;
- `h_u(a)` be hidden displacement or hidden harm;
- `V >= 0` be the private value of crossing the metric threshold.

The affordable action set is

`B_u(V) = {a in A(u): c_u(a) <= V}`.

Any deterministic best response with outside option `a = 0` must lie inside
`B_u(V)` whenever the only upside of action is worth at most `V`. Therefore the
trivial but important fixed-type envelope is

`||h_u(a^*)|| <= sup_{a in B_u(V)} ||h_u(a)||`.

This is the intervention analogue of "bounded reweighting plus bounded baseline
hidden variance." It says: bounded stakes plus costly action imply bounded
fixed-type hidden movement, after the action representation and hidden norm are
declared.

## 3. Proxy-deficit cost

For a type with proxy deficit `d > 0`, define the minimum private cost of buying
that deficit:

`m_u(d) = inf { c_u(a): a in A(u), p_u(a) >= d }`.

Then gaming the deficit is privately feasible iff

`m_u(d) <= V`.

The intervention band is the set of deficits `d` satisfying this inequality.
The previous quadratic wedge `Delta = sqrt(2 kappa V)` is one special case of
this more general budget test.

## 4. Convex linear-gain case

Specialize to a finite-dimensional action space, convex feasible set `A`, and a
closed proper convex cost `c`. Absorb feasibility into the cost by setting
`c(a) = +infty` outside `A`. Let proxy gain be linear:

`p(a) = w . a`.

The cost of buying deficit `d` is

`m(d) = inf_a { c(a): w . a >= d }`.

By Lagrange/Fenchel duality, under the usual regularity conditions such as
closed proper convex `c` and a feasible point with `w . a > d`,

`m(d) = sup_{lambda >= 0} [lambda d - c^*(lambda w)]`,

where `c^*(y) = sup_a [y . a - c(a)]` is the convex conjugate.

Interpretation: the intervention budget is governed by the support function of
the agent's affordable action geometry in the score direction `w`. The baseline
law `mu_0` does not supply this object. This is a convex action-cost result,
not a general theorem about non-convex ML training or arbitrary adaptive
optimization; those applications must declare a local response model and cost
geometry before importing the formula.

## 5. Recovering previous toy models

### Single-channel quadratic

Let `a >= 0`, `p(a) = a`, and `c(a) = a^2/(2 kappa)`. Then

`c^*(lambda) = kappa lambda^2 / 2` for `lambda >= 0`,

so

`m(d) = sup_{lambda >= 0} [lambda d - kappa lambda^2/2]
      = d^2/(2 kappa)`.

Gaming is feasible iff `d^2/(2 kappa) <= V`, i.e.

`d <= sqrt(2 kappa V)`.

This recovers the Iteration 4 Stackelberg wedge.

### Multichannel quadratic additive score

Let `a_j >= 0`, proxy gain `w . a = sum_j w_j a_j` with `w_j > 0`, and

`c(a) = sum_j a_j^2/(2 kappa_j)`.

Then

`c^*(lambda w) = lambda^2 sum_j kappa_j w_j^2 / 2`,

and therefore

`m(d) = d^2 / (2 sum_j kappa_j w_j^2)`.

The cost-minimal action is

`a_j^* = d kappa_j w_j / sum_i kappa_i w_i^2`.

For unit weights this is the earlier `K_M = sum_j kappa_j` result. The
population-entry band expands when `sum_j kappa_j w_j^2` grows.

### Linear-cost edge case

Let `a >= 0`, `c(a) = sum_j q_j a_j`, and `p(a) = sum_j w_j a_j` with
`q_j, w_j > 0`. Then

`m(d) = d min_j (q_j / w_j)`,

and any cheapest effective channel can carry the whole response. This is still
convex, but nonsmooth and usually non-strict; sparse or nonunique optima are
expected. This connects the convex-bound thread to the fixed-charge and capped
response-shape threads without reducing them to the smooth quadratic case.

## 6. Hidden harm is a separate functional

The score-deficit cost `m(d)` says when an agent can afford to move the proxy.
It does not by itself say whether the movement is harmful. If hidden harm is
linear, `H(a) = h . a`, then the relevant harm among affordable proxy-gaining
actions is

`sup { h . a: c(a) <= V, w . a >= d }`

or, for a cost-minimizing best response, `h . a^*(d)`.

These can differ sharply. If `h` is proportional to `w`, each score point has a
fixed harm exchange rate. If `h` and `w` point in different directions, cheap
proxy gain can be high-harm, low-harm, or even goal-improving. Convexity of
private cost alone does not bound hidden harm in value units unless the hidden
harm functional is also declared and bounded on the affordable set.

Counterexample: with two actions, `w = (1, 1)`, `h = (M, 0)`, and quadratic
costs with equal `kappa`, the cost-minimal action for deficit `d` is
`a^* = (d/2, d/2)`, so hidden harm is `Md/2`. For fixed score deficit and fixed
private cost geometry, hidden harm can be made arbitrarily large by increasing
the value weight `M`. A private-cost budget is not a welfare bound unless value
weights are part of the model.

## 7. Iteration 19: welfare-bound packaging

For a fixed type/action geometry, welfare analysis needs one more declared
object. Let `ell(a)` be the hidden-harm functional attached to the action. The
welfare-bound problem for deficit `d` and private value budget `V` is

`W_ell(d,V) = sup { ell(a): c(a) <= V, w . a >= d }`.

This is the worst declared hidden harm among affordable actions that can clear
the proxy deficit. It is not the same object as the realized harm of a
cost-minimizing response,

`ell(a^*(d))`, where `a^*(d) in argmin { c(a): w . a >= d }`.

The two coincide only under extra behavioral or alignment assumptions. The
private-cost calculation `m(d)` answers whether score movement is affordable.
The welfare-bound calculation `W_ell(d,V)` answers how bad affordable
score-clearing movement can be after the evaluator has declared the value
weights in `ell`.

In later models `ell` may be linear, nonlinear, or prevalence-sensitive, but
this iteration only packages the declared-functional problem. It does not add a
third population welfare notation beyond `H_per` and `H_pop`; `ell` is the
fixed-action harm functional whose aggregation can be specified later.

The required failure example is already visible in the linear case. Let
`w = (1, 1)`, linear hidden harm `ell(a) = h . a` with `h = (M, 0)`, and equal
quadratic costs. The cost-minimal action for deficit `d` is
`a^*(d) = (d/2, d/2)`, so realized hidden harm is `ell(a^*(d)) = Md/2`.
For fixed deficit and fixed private-cost geometry, this can be arbitrarily
large as the value weight `M` grows. Thus private-cost affordability does not
bound welfare without declared value weights.

## 8. What this licenses

The convex-cost intervention bound licenses:

- replacing baseline divergence with an affordable-action set `B_u(V)`;
- classifying gaming feasibility by `m_u(d) <= V`;
- using Fenchel duality to compute `m(d)` for convex costs and linear proxy
  gains;
- recovering the previous quadratic single- and multichannel wedges as special
  cases;
- explaining why nonsmooth convex costs can produce sparse response shapes.

It does not license:

- a baseline-only intervention bound;
- an intrinsic classification from observed `mu_theta`;
- a welfare conclusion from proxy movement alone;
- a claim that convexity makes hidden harm small;
- direct transfer to non-convex ML/RLHF training without a declared local
  response model or cost geometry;
- empirical use without a declared action space, cost model, stakes, and hidden
  harm functional.

## 9. Verification-stack pass

Layer 1: thought experiments
- Passed: single-channel quadratic recovers `Delta = sqrt(2 kappa V)`.
- Passed: multichannel quadratic recovers the weighted `K_M` denominator.
- Passed: linear costs produce cheapest-route sparsity, showing the bound
  covers nonsmooth convex response without implying dense drift.
- Failed stronger claim: convexity alone does not bound welfare harm; hidden
  value weights can make an affordable action arbitrarily harmful.

Layer 2: real-world correspondence
- Passed at schema level: incentives, strategic classification, and
  performative prediction all require action costs or feasible manipulations.
- Still open: estimating `c_u`, `V`, and `h_u` in real domains is hard and is
  not solved by the formal bound.

Layer 3: simulation
- Ready: simulate convex costs with quadratic, linear, and elastic-net-like
  costs under the same `w` and `h`; compare support, harm, and gaming bands.
- Ready: compare stochastic best response to the deterministic affordable-set
  envelope.

Layer 4: implementation
- Premature: empirical use requires observed action traces, intervention
  experiments, or a defensible structural cost model.

Verdict: Q10 has a partial answer. Intervention has an analogue of the
selection bound, but it is conditional on action geometry. The bound is not
`mu_0`-internal; it is imported from the declared cost and feasibility model.
