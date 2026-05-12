# Thread: minimum-complexity attractors under proxy pressure

Iteration type: `generate`

## Iteration 7: Q18 as an attractor claim, not a dimension-count claim

### 1. Constraints on definitions

The notation must distinguish at least four objects that Q18 can easily collapse:

- the *feasible set* of hidden drifts consistent with hitting a proxy target;
- the *response process* that chooses one feasible drift rather than another;
- the *cost or search geometry* faced by the responding system;
- the *complexity functional* by which the observer calls one drift simpler than another.

A minimum-complexity attractor theorem cannot just say "optimization chooses a simple solution." It must name the optimization primitive. If agents optimize private cost, the attractor is cost-minimal. If SGD searches parameter space, the attractor is whatever the parameter-to-function map and training dynamics bias toward. If selection reweights a fixed baseline, the attractor is the tail response of the baseline distribution. These may align with description length, rank, sparsity, or entropy, but they need not.

For this iteration, treat the hidden drift as an action vector `a in R^k` that raises proxy score while producing hidden goal displacement. Candidate complexity proxies:

- support size `||a||_0` or sparsity;
- spectral concentration / low rank when `a` is a matrix or function;
- KL divergence from a max-entropy feasible distribution;
- description length of the selected hidden pattern;
- private intervention cost `c(a)` only as a *separate* primitive, not a synonym for complexity.

### 2. Motivation

Q18 asks whether, as optimization pressure on a proxy increases, the induced shift in `ker phi` converges to the lowest-complexity configuration consistent with hitting the target. This is stronger and more directional than Q4's "residual norm versus entropy" tradeoff. It would supply a mechanism for the recursive-Goodhart story: the system does not merely leak error into arbitrary hidden directions; it finds a simple, goal-serving hidden route that the principal did not specify.

The current paper is not yet there. Chapters 1-3 support a more conservative claim: in selection regimes, residual movement follows baseline response curves; in intervention regimes, residual movement follows agent cost geometry, stakes, aggregation, and exchange rates. Q18 would require an additional bridge from those response-channel optima to a complexity functional.

### 3. Current pondering

The selection thread already killed unconditional dimension-count claims: hidden drift can be zero, diffuse, or concentrated depending on the baseline dependence structure. The intervention thread shows a sharper attractor-like object: agents pick cost-minimal ways to hit a score target. But "cost-minimal" is not the same as "minimum-complexity" unless the cost geometry penalizes complexity.

So the immediate research question is not "does Goodhart select low complexity?" but:

> When does the response-channel optimum coincide with a low-complexity hidden drift?

### 4. Plausible approaches

- Quadratic intervention geometry. Solve `min c(a)` subject to `w . a >= d` and compare the optimizer's support/rank to the minimum-complexity feasible set. Low cost, gives a clean counterexample to unconditional Q18.
- Sparse or fixed-charge intervention geometry. Add activation costs or `l1`-style costs and check whether the optimizer becomes sparse. Medium payoff: this is the simplest route to a real minimum-complexity toy theorem.
- Selection counterexample. Build a baseline where high proxy scores correlate equally with many hidden coordinates, so threshold selection produces diffuse hidden drift. Cheap and useful for blocking a selection-regime theorem.
- Entropic comparison. Define the max-entropy distribution over feasible hidden drifts and compare it with the cost-minimal intervention path. This separates "not diffuse" from "simple."

### 5. Approaches not yet considered

- Treat complexity as representation-dependent and ask for invariants: support size is not invariant under arbitrary rotations, while rank and spectral concentration are invariant only after specifying a tensor/function representation.
- Model the optimizer as a two-stage process: first a search distribution over feasible actions, then cost selection. Minimum-complexity attraction may arise from the search prior even when private costs are symmetric.

### 6. Counterexample first

Unconditional Q18 would predict that proxy pressure converges to a lowest-complexity hidden configuration. A simple selection counterexample blocks this. Let `P = Z` and hidden coordinates `H_i = Z + xi_i` for `i = 1,...,d`, with independent mean-zero noise `xi_i`. Thresholding on `P >= t` shifts every hidden coordinate by the same amount, so `E[H | P >= t] - E[H]` is proportional to `(1, ..., 1)`. In the coordinate system where the `H_i` are substantive hidden dimensions, this drift has full support. It is not sparse. If "complexity" is support size, selection produced a maximally diffuse drift, not a minimum-complexity one.

This does not refute every possible complexity measure: the vector `(1,...,1)` has a short description in a symmetric coordinate system. That is the point. Q18 is under-specified until the complexity functional and representation are fixed. A support-size theorem and a description-length theorem are different claims.

### 7. Outward pointers

Relevant known math/tools: convex optimization and KKT conditions; Fenchel duality from the intervention-bound thread; `l1` versus `l2` regularization and sparsity; maximum entropy; minimum description length; algorithmic information theory. ML parallels include simplicity bias in parameter-to-function maps, spectral bias, and flat-minima/MDL intuitions [guess]. Evolutionary parallels include survival of the flattest and mutational robustness [guess]. These are pointers only; this iteration does not rely on them as established premises.

## Toy calculation 1: quadratic cost selects cost-minimal drift, not complexity-minimal drift

Let a responding agent choose `a in R^k` to close a score deficit `d > 0` under a linear proxy contribution `w . a`. The action is feasible if

`w . a >= d`.

Let private cost be quadratic,

`c(a) = (1/2) a^T C^{-1} a`,

where `C` is positive definite. The cost-minimal intervention solves

`min_a (1/2) a^T C^{-1} a` subject to `w . a >= d`.

By the KKT conditions, the constraint binds and

`C^{-1} a = lambda w`, so `a = lambda C w`.

The binding constraint gives

`lambda = d / (w^T C w)`,

hence

`a^* = d C w / (w^T C w)`.

Claim [tentative]: in the quadratic intervention model, proxy pressure attracts the system to the minimum-cost feasible action `a^* = d C w/(w^T C w)`, not to the minimum-complexity feasible action as such. Toy example: if every KPI-padding channel has the same cost and equal score weight, a faculty member trying to add `d` points to an additive score spreads effort evenly across all channels, because that minimizes quadratic effort. The drift is diffuse in support, even though a one-channel padding strategy would be simpler.

Counterexample attempt: equal spreading across all equal channels may itself have low description length ("do the same thing everywhere"). So the claim should not be "quadratic cost makes high-complexity drift"; it is narrower: quadratic cost does not minimize support size, and no generic complexity conclusion follows without specifying the complexity measure. If complexity means description length in a symmetric basis, the same solution may be simple.

Claim [tentative]: Q18 can be repaired by replacing "minimum-complexity attractor" with "response-geometry attractor"; minimum complexity appears only when the response geometry is aligned with the chosen complexity functional. Toy example: if the cheapest way to pass an evaluation is a single common exploit, the model repeatedly finds that exploit; if cheapness is symmetric and convex across many channels, the model spreads the distortion.

Counterexample attempt: some optimization processes have simplicity bias not captured by explicit private cost. Overparameterized neural networks may favor low-complexity functions because many parameters implement them or because training dynamics find them first [guess]. That means the repair must allow search priors and dynamics, not only explicit cost functions.

## Toy calculation 2: fixed activation costs create a sparse attractor

Now add a fixed cost `F_j >= 0` for activating channel `j`, plus linear per-unit cost `q_j a_j`, with `a_j >= 0` and score weights `w_j > 0`. The agent solves

`min sum_j F_j 1{a_j > 0} + sum_j q_j a_j`

subject to `sum_j w_j a_j >= d`.

For a fixed active set `M`, the cheapest per-unit score channel in `M` has smallest `q_j / w_j`, so all marginal effort goes to a channel with minimal ratio. If the target is a one-shot deficit and there are no caps, the global optimum uses a single channel

`j^* in argmin_j (F_j + d q_j / w_j)`.

Claim [tentative]: fixed-charge or linear-cost intervention models do produce a sparse, low-support attractor: the cheapest single route to the proxy target. Toy example: if a hospital can either change coding rules, alter discharge timing, or actually improve care, and each route has setup overhead plus roughly linear marginal cost, the cheapest route can dominate rather than the hospital spreading effort smoothly across all routes.

Counterexample attempt: this sparse result depends strongly on no capacity constraints and linear marginal costs. Add caps, convex costs after activation, risk constraints, or detection probabilities, and the optimum can use multiple channels. The theorem is therefore a toy result about lumpy/linear cost geometry, not a generic Goodhart law.

## Selection-regime contrast

In a selection channel, the policy does not choose an action `a`; it reweights a baseline. The selected hidden drift is

`B_H(theta) = E_theta[H] - E_mu[H]`.

There is no optimization over feasible hidden drifts unless the baseline distribution itself was generated by such an optimization. Therefore a minimum-complexity attractor theorem cannot be a theorem about selection alone. It would have to be a theorem about the baseline tail geometry: high proxy regions are more populated by low-complexity hidden configurations than by high-complexity ones.

Claim [tentative]: in selection regimes, Q18 reduces to an empirical or distributional assumption about the baseline: high-`P` tails must be simplicity-biased in hidden coordinates. Toy example: selecting high-scoring programs from a fixed model zoo favors simple reward hacks only if such hacks are overrepresented among high-scoring programs in the zoo; selection itself does not create the simplicity bias.

Counterexample attempt: if the baseline was produced by a prior optimization process, the simplicity bias may already be baked into `mu_0`. Then selection appears to have a minimum-complexity attractor, but the actual mechanism lives upstream in the generator of candidates, not in selection.

## Immediate takeaway

Claim [tentative]: the broad Q18 claim is false without an added mechanism. Proxy pressure does not generically converge to the lowest-complexity feasible hidden drift. In selection channels, drift follows baseline tail response. In intervention channels, drift follows the responding system's cost/search geometry. A minimum-complexity attractor appears when that geometry or search prior privileges simple, sparse, low-rank, or high-prior-probability routes to the proxy target. Toy example: a benchmark-optimizing model repeatedly discovers the same short exploit when the exploit is easy to find and high reward; a firm facing smooth quadratic effort costs may spread metric distortion across many KPIs instead.

Counterexample attempt: the surviving claim still risks becoming vacuous: "complexity attraction happens when there is a simplicity bias" can sound tautological. The non-vacuous version must specify the bias before observing the failure mode, e.g. channel activation costs, low-rank action maps, parameter-function multiplicity, or a search prior.

## Relation to the current paper

The current PDF is moving in the right direction if it keeps Appendix G speculative. Chapters 1-3 license:

- selection response, not minimum complexity;
- intervention cost geometry, not minimum complexity;
- aggregation and exchange-rate effects, not minimum complexity;
- a recursive hypothesis, not an attractor theorem.

Q18 should not be promoted into the main text as a conclusion yet. The next useful move is either (a) a review iteration that audits Appendix G and the recursive claims, or (b) a simulation/theorem iteration comparing quadratic, sparse, capped, and low-rank response geometries under a fixed complexity measure.
