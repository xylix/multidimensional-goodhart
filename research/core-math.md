# Core math

Status: canonical bare theorem document after Iteration 43. This file states
objects, hypotheses, dependencies, non-transfer clauses, and book pointers. It
does not duplicate proof prose from the book.

Book pointers refer to the seven-part spine in:
`book/multidimensional-goodhart.typ`.

## Stable definitions

- `S`: observed state space.
- `G: S -> R^m`: goal or target map.
- `P: S -> R^k`: proxy map.
- `phi: R^m -> R^k`: intended proxy/goal correspondence.
- `epsilon(s) = P(s) - phi(G(s))`: residual proxy artifact.
- `U`: declared type space.
- `nu`: baseline type law on `U`.
- `K_theta(ds | u)`: policy-indexed response kernel from type to observed
  state.
- `W_theta(u)`: participation or selection weight.
- Induced law:
  `mu_theta(A) = int W_theta(u) K_theta(A | u) nu(du) / int W_theta(u) nu(du)`.
- Pure selection relative to `(U, K_0)`: `K_theta = K_0` for `nu`-almost every
  type, with policy dependence only through `W_theta`.
- Intervention relative to `(U, K_0)`: `K_theta != K_0` on a positive-`nu`
  set of types.
- Selection drift: `B_H(theta) = E_{mu_theta}[H] - E_{mu_0}[H]`.
- Selection intensity: for `mu_theta << mu_0`,
  `delta = ||d mu_theta / d mu_0 - 1||_{L^2(mu_0)}`.
- Value metric: a declared scalar value functional `v . H` or a declared norm
  `||.||_V` on hidden drifts, with dual norm `||.||_{V,*}`.
- Intervention cost geometry: action `a`, cost `c(a)`, proxy gain `w . a`,
  score deficit `d`, and stakes `V`.
- `m(d)`: minimum private cost of buying score deficit `d`.
- `H_per`: fixed-deficit per-agent hidden harm.
- `H_pop`: population hidden harm after entry/selection into gaming.
- `S(M) = sum_{j in M} kappa_j w_j^2`: deterministic additive quadratic
  score capacity of measured channel set `M`.

## Theorem set

### T1. Coordinate-explicit selection bound

Hypotheses: probability space `(S, F, mu_0)`; pure selection law
`mu_theta << mu_0`; `L = d mu_theta / d mu_0`; `E_0[L] = 1`;
`L in L^2(mu_0)`; declared hidden coordinates `H_i` with finite second
moments.

Statement: with `delta = ||L - 1||_2` and
`s_i = sd_{mu_0}(H_i)`,
`|B_{H_i}(theta)| <= delta s_i` for each coordinate, and
`||B_H(theta)||_2 <= delta ||s||_2` after the Euclidean coordinate metric is
declared.

Dependencies: measure-theoretic absolute continuity; finite second moments;
Hilbert-space Cauchy-Schwarz.

Non-license: not coordinate-free; not a welfare claim; does not apply to
fixed-type response changes; does not identify hidden coordinates or value
weights.

Book pointer: Part II, Section 5, "Selection channel", Theorem T1.

### T2. Value-weighted/operator selection bound

Hypotheses: T1 hypotheses; hidden vector `H` has covariance `Sigma_H`;
declared scalar value direction `v` or declared value norm `||.||_V`.

Statement: for scalar hidden value `V_H = v . (H - E_0 H)`,
`|E_theta[V_H] - E_0[V_H]| <= delta sqrt(v^T Sigma_H v)`.
For a declared norm,
`||B_H(theta)||_V <= delta sup_{||v||_{V,*} <= 1} sqrt(v^T Sigma_H v)`.

Dependencies: T1 objects; finite-dimensional covariance or the corresponding
operator/support-function formulation; declared value metric.

Non-license: value weights are not learned from `mu_theta`; the bound can be
uninformative when `chi^2` is large or infinite; no intervention, welfare, or
application conclusion follows without the response contract.

Book pointer: Part II, Section 5, "Selection channel", Theorem T2.

### T3. Quadratic Stackelberg wedge

Hypotheses: one-dimensional threshold toy; quality `Q`; action `a >= 0`;
private cost `a^2/(2 kappa)` with `kappa > 0`; selection value `V > 0`;
noiseless pass condition `Q + a >= t`.

Statement: for `Q < t`, gaming is privately worthwhile exactly when
`t - Q <= Delta`, where `Delta = sqrt(2 kappa V)`.

Dependencies: finite-dimensional one-dimensional optimization; declared
action, cost, threshold, and stakes.

Non-license: not a universal intervention law; not an RLHF or neural-training
model without declared analogues of action, cost, stakes, and pass condition;
not a welfare claim.

Book pointer: Part II, Section 6, "Intervention channel", Theorem T3.

### T4. Convex score-deficit budget

Hypotheses: finite-dimensional action space; closed proper convex cost
`c: R^n -> (-infty, +infty]` with feasibility absorbed into `c`; linear proxy
gain `w . a`; score deficit `d`; standard convex-duality regularity.

Statement: define `m(d) = inf_a { c(a): w . a >= d }`. Under the regularity
condition, `m(d) = sup_{lambda >= 0} [lambda d - c^*(lambda w)]`, where
`c^*` is the convex conjugate. Gaming under stakes `V` is feasible exactly when
`m(d) <= V` in this declared private-cost model.

Dependencies: finite-dimensional convex analysis; Fenchel conjugacy; declared
linear proxy gain and cost geometry.

Non-license: not a baseline-distribution theorem; not a nonconvex or
fixed-charge theorem; not an ML/RLHF training claim; not a welfare bound without
a hidden value/harm functional.

Book pointer: Part II, Section 6, "Intervention channel", Theorem T4.

### T5. Additive exchange-rate iff

Hypotheses: fixed score deficit `d > 0`; measured channel set `M`; additive
score `sum_{j in M} w_j a_j`; separable quadratic costs
`sum_{j in M} a_j^2/(2 kappa_j)` with `kappa_j > 0`, `w_j > 0`; linear hidden
harm `sum_{j in M} h_j a_j`.

Statement: the cost-minimizing fixed-deficit harm is
`H_M(d) = d (sum_{j in M} h_j kappa_j w_j) /
              (sum_{j in M} kappa_j w_j^2)`.
Fixed-deficit harm is conserved across active measured sets exactly when
`h_j = c w_j` on the compared active channels.

Dependencies: finite-dimensional quadratic optimization; additive aggregation;
declared harm exchange rates.

Non-license: no population-harm conservation; no claim for arbitrary costs,
conjunctive/Pareto aggregation, shared bottlenecks, real-improvement channels,
or empirical welfare.

Book pointer: Part II, Section 7, "Multidimensional scorecards -- the keeper",
Theorem T5.

### T6. Deterministic adaptive-hardening capacity boundary

Hypotheses: finite measured set `M`; additive proxy gain
`sum_{j in M} w_j a_j`; separable quadratic costs
`sum_{j in M} a_j^2/(2 kappa_{j,t})`; fixed deficit `d > 0`; fixed stakes
`V > 0`; fixed weights; deterministic observation; monotone hardening
`0 <= kappa_{j,t+1} <= kappa_{j,t}`. Define
`S_t(M) = sum_{j in M} kappa_{j,t} w_j^2` and `T = d^2/(2V)`.

Statement: at time `t`, gaming is feasible exactly when `S_t(M) >= T`.
Hardening reaches no-gaming exactly when `S_t(M) < T`. A progress-aware
largest-action multiplicative rule terminates in finite time if measured
channels are finite, positive-weight, and floor capacity satisfies
`S_floor(M) < T`.

Dependencies: T4 quadratic specialization; finite sums; deterministic
best-response observation; monotone capacity.

Non-license: no theorem for arbitrary hardening policies, literal
largest-action rules that can stall on floored channels, floors with
`S_floor(M) >= T`, changing `M`, `d`, `V`, or weights, stochastic observation,
shared bottlenecks, nonseparable or nonconvex geometry, empirical estimation,
welfare comparison, persistent cycles, or policy optimality.

Book pointer: Part II, Section 8, "Adaptive hardening -- narrow but real",
Theorem T6.

## Dependency map

| Result | Measure theory | Finite-dimensional convexity | Separable quadratic costs | Declared value/harm metric | Response contract |
| --- | --- | --- | --- | --- | --- |
| T1 coordinate selection | yes | no | no | hidden coordinates only | selection channel |
| T2 value/operator selection | yes | no | no | required | selection channel |
| T3 Stackelberg wedge | no | elementary 1D | yes | optional, not supplied | intervention channel |
| T4 convex budget | no | yes | quadratic only as corollary | harm not supplied | intervention channel |
| T5 exchange-rate iff | no | quadratic optimization | yes | required `h_j` | intervention plus aggregation |
| T6 hardening boundary | no | quadratic specialization | yes | no welfare metric | intervention plus deterministic update |

## Global non-transfer clauses

- No result in this file identifies the correct type space, response kernel,
  cost geometry, aggregation rule, value metric, or hidden harm functional from
  marginal score movement alone.
- Selection results do not transfer to intervention channels unless fixed-type
  response is ruled out by the declared contract.
- Intervention budgets do not transfer to welfare claims without hidden
  value/harm units.
- Theorems here do not license broad policy advice, empirical hidden-target
  estimates, or claims that more metrics are generally good or bad.
- Simulations in `research/simulations/` are Layer-3 checks for scoped toy
  regimes only.
