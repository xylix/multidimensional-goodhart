# Lean validation roadmap

## Purpose

This plan consolidates the existing formalization notes, formal-analogue plan,
verification stack, and current core-claim priority list into one staged path
for validating the project's mathematical results.

The goal is not to move the whole project into Lean. The goal is to add formal
proofs for stable theorem kernels while preserving the current adversarial
research loop for live conceptual work, simulations for toy models, and
primitive-mapping discipline for external theorem analogues.

Current repo state as of the planning pass: no Lean/Lake project is present in
the checkout, and `lean`, `lake`, and `elan` were not found on PATH. Lean work
therefore begins with toolchain/project setup, not theorem editing.

## Roadmap summary

Use four verification layers:

1. **Lean core kernel** for stable finite-dimensional theorem statements.
2. **Executable response lab** for concrete toy regimes that are not yet worth
   freezing into Lean.
3. **Verification ledger and claim audits** to track which claims are prose
   reviewed, simulated, algebra-checked, Lean-proved, or deferred.
4. **Formal-analogue boundary work** to map external theorem families to the
   framework without treating those analogies as proof of the project's claims.

The first implementation step should be the Lean core kernel scaffold. Later
steps should expand only after the first kernels build and the verification
ledger makes recurring theorem use visible.

## Step 1: Lean core kernel

Create a minimal Lean 4/Lake project for theorem kernels that are already stable
in the research notes.

Implementation targets:

- Add `lean-toolchain`, `lakefile.lean`, a root `Goodhart.lean`, and a
  `Goodhart/` source tree.
- Use mathlib and finite-dimensional/discrete models first.
- Represent finite populations using finite index types and nonnegative weights
  summing to one.
- Represent vectors as `Fin n -> Real` or mathlib finite-dimensional vectors,
  choosing the simpler option for finite sums and dot products.
- Avoid full measure theory, general Markov kernels, conditional expectations,
  and empirical application contracts in the first Lean pass.

First theorem modules:

1. `Goodhart.Selection`
   - Pure-selection scalar value drift bound by Cauchy-Schwarz:
     `|E_theta[v · (H - E_0 H)]| <= ||L - 1||_2 * sqrt(v^T Sigma_H v)`.
   - Euclidean coordinate corollary after declaring hidden coordinates and the
     identity value metric.
   - Duplicate-coordinate/value-functional invariance example.

2. `Goodhart.QuadraticGaming`
   - One-dimensional noiseless Stackelberg wedge:
     gaming iff `(t - Q)^2 / (2 * kappa) <= V`, equivalently
     `t - Q <= sqrt (2 * kappa * V)` under the positive-deficit assumptions.
   - Multichannel quadratic additive allocation:
     `a_j = d * kappa_j * w_j / sum_i kappa_i * w_i^2`.
   - Minimum cost:
     `m(d) = d^2 / (2 * sum_i kappa_i * w_i^2)`.

3. `Goodhart.AdditiveConservation`
   - Weighted additive harm formula:
     `H_M(d) = d * (sum_j h_j * kappa_j * w_j) /
       (sum_j kappa_j * w_j^2)`.
   - Conservation under re-routing when `h_j = c * w_j` on active channels.
   - Counterexample or non-conservation lemma when harm-per-score ratios differ.

4. `Goodhart.Hardening`
   - Capacity definition `S_t(M) = sum_j kappa_{j,t} * w_j^2`.
   - Monotone lowering of each `kappa_j` makes `S_t` nonincreasing.
   - Gaming feasible iff `S_t >= d^2 / (2V)` in the fixed deterministic
     additive quadratic contract.
   - No-gaming exactly when capacity falls below the threshold.
   - Later, progress-aware multiplicative hardening termination under finite
     channels, positive weights, and floor capacity below threshold.

Minimum success criterion:

- The Lean project builds.
- The selection value-drift bound and Stackelberg wedge are proved.
- At least one quadratic multichannel algebra lemma is proved or reduced to
  clearly named finite-sum lemmas.

Do not include in Step 1:

- Full response-kernel formalization over arbitrary Markov kernels.
- Recursive Goodhart or minimum-complexity attractors.
- RLHF, finetuning, or reward-model applications.
- Empirical application templates.
- External formal-analogue theorem families.

## Step 2: Executable response lab

Use Python simulations and property-style tests for claims that are concrete
enough to check but not stable enough for Lean.

Existing simulation coverage already includes:

- Linear-Gaussian threshold selection.
- Non-Gaussian zero-covariance threshold response.
- Boltzmann/weighted selection paths and heavy-tail boundaries.
- Single-channel and multichannel quadratic gaming.
- Additive versus conjunctive multidimensional gaming.
- Weighted exchange-rate failures.
- Capped fixed-charge response and active-set switches.
- Adaptive hardening and measurement-frontier toys.
- Dynamic boundary checks for noisy observation and endogenous stakes.

Response-lab consolidation should:

- Keep simulations under `research/simulations/`.
- Add a README table mapping each executable check to the claim it tests.
- Mark each simulation as one of: theorem support, counterexample fixture,
  boundary test, or exploratory toy.
- Prefer property-style checks over visual-only outputs.
- Preserve negative results as regression tests when cheap.

Good near-term additions:

- A small finite response-kernel example where pure selection and intervention
  can generate the same marginal distribution.
- A finite epsilon-baseline example showing intervention can remain absolutely
  continuous with respect to baseline.
- A population-entry monotonicity check with explicit mass in the newly
  profitable deficit band.

## Step 3: Verification ledger and claim audit integration

Add a lightweight verification-status ledger, preferably
`research/formal_verification_status.md`.

Each row should contain:

- Claim name.
- Source file / section.
- Current status:
  - `prose-audited`
  - `counterexample-tested`
  - `simulated`
  - `symbolic/algebra-checked`
  - `Lean-proved`
  - `deferred`
- Current Lean target module, if any.
- Scope / non-license.
- Next verification action.

Initial ledger entries should cover:

- Pure-selection value drift bound.
- Coordinate/value-metric invariance.
- Response-kernel selection/intervention boundary.
- One-dimensional Stackelberg wedge.
- Convex action-cost budget, initially as quadratic special cases only.
- Additive conservation iff-condition.
- Population-entry additive backfire.
- Monotone adaptive-hardening capacity threshold.
- Progress-aware hardening termination.
- Formal-analogue chapter mappings.

Promotion rule:

- If a claim is used as a theorem-like result in the paper and has stable
  hypotheses, it should eventually be a Lean target.
- If a claim is methodological, empirical, or application-facing, it should be
  prose-audited and optionally simulation-backed, not forced into Lean.
- If a claim is analogy-based, it belongs in the formal-analogue map with a
  citation, primitive mapping, non-license, and falsifier.

## Step 4: Formal-analogue boundary work

Keep the formal-analogue chapter as a citation and primitive-mapping discipline,
not as an early Lean workload.

For each external theorem family, require:

- Primary-source citation.
- Formal inputs and outputs in one line.
- Closest project primitive.
- What the theorem licenses inside the framework.
- What it does not license.
- Falsifier or non-transfer condition.

Near-term analogue uses:

- Chapter 2 scalar anchor: El-Mhamdi & Hoang-style scalar Goodhart selection
  results.
- Later formal-analogue chapter rows: adaptive benchmarks/reusable holdout,
  strategic classification, performative prediction, reward overoptimization,
  multitask principal-agent models, Lucas critique, welfare aggregation, and
  instruments/targets.

Boundary:

- These mappings position the project relative to existing literature.
- They do not prove that the project's toy bounds transfer to RLHF, finetuning,
  institutional policy, or economics without a declared response model.
- They should not be Lean targets until a particular external theorem is needed
  as a formal dependency of the project's own result.

## Later Lean expansion

After Step 1 builds and at least three kernels are proved, consider expanding
Lean coverage to:

- Finite response-kernel pure-selection lemma.
- Finite counterexamples for absolute-continuity/non-identifiability boundaries.
- Population-entry monotonicity with explicit finite distributions.
- Progress-aware adaptive-hardening termination.
- Simple convex-duality special cases, after quadratic cases are complete.

Continue deferring:

- General measure-theoretic weighted selection.
- Conditional expectations and tail response curves.
- General convex duality beyond the special cases needed in the paper.
- Recursive Goodhart as a theorem.
- Minimum-complexity attractors without a fixed complexity/search prior.
- Empirical application contracts.
- Broad ML/RLHF response models.

## Acceptance criteria for the first milestone

The first milestone is complete when:

- A Lean/Lake project exists and `lake build` succeeds.
- The verification ledger exists and lists the initial core claims.
- Lean proves at least:
  - the finite pure-selection value-drift bound, and
  - the one-dimensional quadratic Stackelberg wedge.
- The roadmap is linked or referenced from the existing planning notes.
- No speculative or empirical claim has been silently promoted to theorem
  status.

## Working principle

Lean should validate the stable mathematical spine of the project. It should
not replace the current research loop, freeze open definitions prematurely, or
turn external analogies into claimed generalizations. The path is deliberately
hybrid: prose audit for conceptual discipline, simulations for model behavior,
symbolic/algebra checks for toy derivations, and Lean for load-bearing theorem
kernels.
