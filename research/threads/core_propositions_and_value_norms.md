# Thread: core propositions and value norms

Iteration type: `rigor`

## Iteration 15: proposition pass

### 1. Motivation

The live framework now has several calculations that are stronger than informal
notes but weaker than polished theorems. This pass promotes them into
proposition sketches with hypotheses visible on the page, and repairs the
largest bookkeeping gap in the selection bound: the Euclidean coordinate norm is
not representation-free unless the hidden value metric is declared.

The goal is not a new broad Goodhart claim. The goal is to make the existing
response-modeling contract mathematically sharper.

### 2. Proposition sketch: selection-channel scalar value bound

Let `(S, F, mu_0)` be a probability space. Let `mu_theta << mu_0` be a pure
selection law with Radon-Nikodym derivative `L = d mu_theta / d mu_0`. Assume
`E_0[L] = 1`, `L in L^2(mu_0)`, and `H: S -> R^d` has finite second moments.
Let

`delta = ||L - 1||_{L^2(mu_0)} = sqrt(chi^2(mu_theta || mu_0))`,

and let `Sigma_H = Cov_0(H)`. For any declared scalar hidden-value functional

`V_H = v . (H - E_0 H)`,

with `v in R^d`,

`|E_theta[V_H] - E_0[V_H]| <= delta sqrt(v^T Sigma_H v)`.

Proof sketch:

`E_theta[V_H] - E_0[V_H] = E_0[(L - 1) V_H]`,

then apply Cauchy-Schwarz:

`|E_0[(L - 1) V_H]| <= ||L - 1||_2 ||V_H||_2`.

Since `V_H` is centered, `||V_H||_2^2 = Var_0(v . H) = v^T Sigma_H v`.

Interpretation: in a pure selection channel, value-weighted hidden drift is
bounded by selection intensity times baseline value-weighted susceptibility.
Every term is still a baseline functional, but the value direction `v` is not
identified from `mu_theta` alone. It must be supplied by the application.

### 3. Operator and norm versions

Let `B_H(theta) = E_theta[H] - E_0[H]`. The previous Euclidean coordinate bound
is the special case obtained after declaring the hidden coordinates and the
identity value metric:

`||B_H(theta)||_2 <= delta ||s||_2`,

where `s_i = sd_0(H_i)`. Indeed, each coordinate satisfies
`|B_{H_i}| <= delta s_i`, and summing gives the displayed bound.

A cleaner representation-aware version is dual-norm based. For any norm
`||.||_V` on hidden-value drifts,

`||B_H(theta)||_V = sup_{||v||_{V,*} <= 1} v . B_H(theta)
                 <= delta sup_{||v||_{V,*} <= 1} sqrt(v^T Sigma_H v)`.

If the value norm is induced by a positive definite matrix `M`,
`||x||_M = sqrt(x^T M x)`, then the bound becomes

`||B_H(theta)||_M <= delta sqrt(lambda_max(M^{1/2} Sigma_H M^{1/2}))`,

where the eigenvalue is the largest value-weighted baseline variance over unit
`M`-norm drift directions. For a positive semidefinite `M`, the same statement
holds on the quotient by `ker M`, or with the corresponding support-function
interpretation.

This fixes coordinate bookkeeping only after the value metric is declared. It
does not make hidden value weights observable from the marginal selected law.

### 4. Coordinate split check

Suppose a single hidden variable `X` with variance `sigma^2` is represented once
as `H = X`, and again as duplicate coordinates `H' = (X, X)`.

The coordinate Euclidean susceptibility changes:

`||s||_2 = sigma`, while `||s'||_2 = sqrt(2) sigma`.

But the scalar value functional "count the underlying `X` once" is represented
as `v = 1` in the first coordinate system and `v' = (1/2, 1/2)` in the duplicate
system. Then

`(v')^T Sigma_{H'} v' = sigma^2 = v^T Sigma_H v`.

So the value-weighted bound is invariant under this bookkeeping change, while
the raw Euclidean coordinate bound is not. If instead one declares the identity
metric on the duplicated coordinates, one has changed the value metric: duplicate
copies now count twice in the hidden norm.

### 5. Proposition sketch: Stackelberg wedge

Consider the one-dimensional threshold toy. An agent has quality `Q`, chooses
action `a >= 0`, pays private cost `a^2/(2 kappa)` with `kappa > 0`, and gets
selection value `V > 0` if it passes a noiseless threshold. The measured score
is `Q + a`, and passing requires

`Q + a >= t`.

An agent with `Q >= t` chooses `a = 0`. An agent with `Q < t` either chooses the
least action that passes, `a = t - Q`, or does not pass. Gaming is privately
worthwhile exactly when

`(t - Q)^2/(2 kappa) <= V`,

equivalently when

`t - Q <= Delta := sqrt(2 kappa V)`.

Thus the action response creates a gaming band of width

`Delta = sqrt(2 kappa V)`.

Proof sketch: the noiseless pass condition makes the benefit discontinuous:
passing yields `V`, failing yields `0`. For `Q < t`, any passing action larger
than `t - Q` is dominated, so the only candidate passing action costs
`(t - Q)^2/(2 kappa)`. Comparing this cost to `V` gives the displayed band.

Interpretation: the wedge is imported from action economics--ease of gaming and
stakes--not from the baseline distribution. It licenses the intervention budget
for this quadratic threshold model. It does not license a direct
RLHF/neural-training mapping without a declared analogue of the action, cost,
selection value, and pass condition.

### 6. Proposition sketch: convex intervention budget

Let the fixed-type action space be finite-dimensional. Let `c: R^n ->
(-infty, +infty]` be closed, proper, and convex, absorbing feasibility by
setting `c(a) = +infty` outside the feasible set. Let proxy gain be linear,
`p(a) = w . a`. For a score deficit `d`, define

`m(d) = inf_a { c(a): w . a >= d }`.

Under standard convex-duality regularity, for example a Slater-style feasible
point with `w . a > d` and finite cost,

`m(d) = sup_{lambda >= 0} [lambda d - c^*(lambda w)]`,

where `c^*(y) = sup_a [y . a - c(a)]`.

Proof sketch: write the Lagrangian

`c(a) + lambda(d - w . a)`,

with `lambda >= 0`; minimizing over `a` gives

`lambda d - c^*(lambda w)`.

Strong duality supplies equality under the regularity condition.

Checks:

- Single-channel quadratic `c(a) = a^2/(2 kappa)`, `w = 1`, gives
  `m(d) = d^2/(2 kappa)`, so gaming is feasible under stakes `V` iff
  `d <= sqrt(2 kappa V)`.
- Multichannel quadratic `c(a) = sum_j a_j^2/(2 kappa_j)` and additive score
  `w . a` gives
  `m(d) = d^2/(2 sum_j kappa_j w_j^2)`.

This is an intervention budget, not a welfare theorem. Hidden harm requires a
separate functional `h(a)` or value norm on action-induced hidden displacement.

### 7. Proposition sketch: additive conservation iff-condition

Consider a fixed score deficit `d > 0`, measured channel set `M`, additive score

`sum_{j in M} w_j a_j`,

separable quadratic costs

`sum_{j in M} a_j^2/(2 kappa_j)`,

with `kappa_j > 0`, `w_j > 0`, and linear hidden harm

`H(a) = sum_{j in M} h_j a_j`.

The cost-minimal action satisfying the deficit is

`a_j^* = d kappa_j w_j / W_M`,

where

`W_M = sum_{i in M} kappa_i w_i^2`.

The induced fixed-deficit harm is

`H_M(d) = d (sum_{j in M} h_j kappa_j w_j) / (sum_{j in M} kappa_j w_j^2)`.

Thus fixed-deficit harm is conserved across re-routing among active measured
sets exactly when `h_j = c w_j` on the active channels being compared. In that
case `H_M(d) = c d` for every active set. If the ratios `h_j / w_j` differ,
changing measured channels or weights can raise or lower fixed-deficit harm.

Two-channel counterexample: let `kappa_1 = kappa_2 = 1`, `w_1 = w_2 = 1`,
`h_1 = 1`, and `h_2 = 2`. Measuring only channel 1 gives harm `d`; measuring
only channel 2 gives harm `2d`; measuring both gives harm `3d/2`. Additivity
alone does not conserve harm.

### 8. What remains non-theorem

The response-modeling contract is methodological, not a theorem. It says what
must be declared before a Goodhart claim licenses a calculation: type space,
selection weights or response kernels, action space, costs, aggregation, hidden
harm/value weights, and evidence standards.

Costs, type spaces, response kernels, and hidden value weights are not
identified from `mu_theta` alone. They are modeling commitments or empirical
targets.

The proposition sketches above do not settle population harm, adaptive
hardening, repeated proxy repair, or strategic dynamics. Those still need
simulation or domain-specific empirical work.

### 9. Verification checks

- Scalar value check: the value-weighted selection bound is exactly
  Cauchy-Schwarz applied to `V_H = v . H`, with variance `v^T Sigma_H v`.
- Coordinate split check: duplicating a coordinate changes the raw Euclidean
  coordinate norm but not the variance of a fixed scalar value functional.
- Euclidean special case: declaring the identity metric on the chosen hidden
  coordinates recovers `||B_H||_2 <= delta ||s||_2`.
- Stackelberg wedge check: the noiseless quadratic threshold model gives the
  pass band `t - Q <= sqrt(2 kappa V)` by direct cost-benefit comparison.
- Convex budget check: the Fenchel formula recovers the single- and
  multichannel quadratic wedges.
- Conservation check: `h_j = c w_j` gives `H_M(d) = c d`; unequal `h_j / w_j`
  gives the two-channel counterexample above.
