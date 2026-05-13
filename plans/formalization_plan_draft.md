# Formalization and verification plan draft

## Purpose

This note estimates what would happen if the multidimensional Goodhart project
moved from the current adversarial-notes methodology into Lean or another
formal verification stack. It also proposes a hybrid path: keep the current
research loop for live conceptual work, add executable verification for toy
models, and use Lean only for stable theorem kernels.

Current local state: there is no Lean/Lake project in the repo, and `lean` /
`lake` are not installed in the checked environment as of 2026-05-13.

## Current methodology

The current methodology is already a verification-oriented research loop:

- every nontrivial claim should be tagged `[confident]`, `[tentative]`, or
  `[guess]`;
- claims should be paired with toy examples and counterexample attempts;
- negative results are logged rather than discarded;
- red flags trigger adversarial review;
- the verification stack descends from thought experiments to real-world
  correspondence, simulation, and implementation only when cheaper layers do not
  kill the idea;
- claim audits separate what a claim licenses from stronger claims it does not
  support.

This is well-suited to the current project because many important objects are
still being chosen: the type space `U`, the response kernel `K_theta`, hidden
harm functionals, aggregation rules, complexity measures, and empirical evidence
standards. Formalizing these too early would freeze definitions before the
research has finished discovering which distinctions matter.

## Lean slowdown estimate

Full Lean-first methodology would likely slow the current project substantially.

Estimated slowdown:

- initial setup, Lean onboarding, and mathlib orientation: `10x-20x` for the
  first few weeks;
- stable finite-dimensional theorem work: `3x-8x` slower than handwritten
  derivations;
- probability and measure-theory-heavy selection claims: `6x-15x` slower,
  especially around conditional expectations, tail events, integrability, and
  threshold selection;
- speculative or definition-finding work: often `>10x` slower or blocked,
  because Lean would force premature choices of formal objects.

Overall estimate: requiring every research iteration to be Lean-formalized
before moving on would make progress roughly `5x-12x` slower for the current
project.

Hybrid estimate: keeping natural-language research as the main loop while
formalizing only stable kernels would likely slow overall progress by only
`1.3x-2.5x`, while giving better regression checks for load-bearing claims.

## Recommended hybrid stack

Use three verification layers in addition to the existing prose review process.

### 1. Executable toy-model layer

Build small Python simulations or notebooks for the claims that are currently
too exploratory for Lean but concrete enough to test.

Good targets:

- linear-Gaussian threshold selection;
- non-Gaussian examples where `Cov(H, P) = 0` but threshold response is nonzero;
- Boltzmann or weighted selection paths;
- additive vs. conjunctive multidimensional gaming;
- weighted additive exchange-rate failures;
- quadratic, linear, fixed-charge, capped, and low-rank response geometries;
- adaptive hardening dynamics;
- measurement-frontier toy models.

This layer should use property-style checks where possible. Examples:

- dimension count alone should not determine hidden harm;
- baseline covariance should fail as a finite-pressure primitive in constructed
  examples;
- additive fixed-deficit harm should be conserved only when harm-per-score
  ratios are equal;
- response shape should change when the cost geometry changes from quadratic to
  fixed-charge or capped.

### 2. Symbolic and algebraic layer

Use symbolic or small executable derivation checks for finite-dimensional
algebra that is likely to enter the paper.

Good targets:

- the one-dimensional quadratic gaming wedge
  `Delta = sqrt(2 kappa V)`;
- multichannel quadratic additive allocation
  `a_j = d kappa_j w_j / sum_i kappa_i w_i^2`;
- the weighted additive harm formula
  `H_M(d) = d (sum h_j kappa_j w_j) / (sum kappa_j w_j^2)`;
- special cases of the convex linear-gain dual expression
  `m(d) = sup_{lambda >= 0} [lambda d - c^*(lambda w)]`.

This layer is not a substitute for proof, but it is a cheap guard against
algebra slips and inconsistent toy-model claims.

### 3. Lean core kernel

Start Lean only after a claim has survived review and its assumptions are
stable. The first Lean project should be finite-dimensional and avoid general
measure theory unless the payoff is clear.

Best first targets:

- a finite/discrete version of the Cauchy-Schwarz selection drift bound;
- the single-channel quadratic gaming wedge;
- the multichannel quadratic additive allocation;
- the weighted additive exchange-rate condition for conservation;
- a theorem/counterexample pair showing that private-cost bounds do not imply
  welfare bounds without declared hidden harm weights.

Avoid as first Lean targets:

- the full response-kernel framework over arbitrary probability kernels;
- Pareto-selection identifiability;
- recursive Goodhart as a general theorem;
- minimum-complexity attractors before the complexity functional is fixed;
- empirical application contracts, which are mostly modeling discipline rather
  than theorem statements.

## LLM automation estimate

With the current natural-language methodology, LLMs can automate a meaningful
share of review work, but not final mathematical trust.

Current-methodology estimate:

- `60-80%` of review scaffolding: red-flag passes, claim-audit drafts,
  counterexample brainstorming, and consistency checks;
- `40-70%` of toy simulation generation, assuming a human checks that the model
  matches the claim;
- low reliability for final verification of nontrivial math unless paired with
  executable checks, Lean, or human review.

With a Lean scaffold in place:

- `50-80%` of theorem-statement drafting for simple finite-dimensional results;
- `30-60%` of routine proof completion for algebra, order facts, finite sums,
  and basic linear/quadratic calculations;
- `10-30%` of novel formalization design, especially where the hard part is
  choosing definitions rather than filling proof gaps;
- nearly `100%` automated regression checking for already-formalized claims
  through CI.

Lean would therefore increase the share of verification that can be automated,
but LLMs would not remove the main cost: deciding which definitions and
assumptions are the right ones.

## Alternative verifiable model: Goodhart response lab

Before committing heavily to Lean, build a small executable "Goodhart response
lab" that mirrors the response-modeling contract.

Core objects:

- type space or population representation;
- baseline law or sample generator;
- selection weights `W_theta`;
- response kernels or action maps `K_theta`;
- proxy and target maps;
- multidimensional aggregation rule;
- action costs, caps, fixed charges, or search priors;
- hidden harm or value functional.

The lab should make the current framework harder to fool by rhetoric. Each
simulation should state:

- which response contract it instantiates;
- which claim it is testing;
- what qualitative behavior would kill or narrow the claim;
- which stronger claim remains unsupported.

Useful first experiments:

- selection response under Gaussian and non-Gaussian baselines;
- covariance failure cases;
- additive vs. conjunctive gaming;
- weighted exchange-rate cases where re-routing raises or lowers harm;
- capped fixed-charge response paths;
- adaptive hardening versus static commitment;
- measurement frontier between informativeness and attack surface.

This executable model would verify much of the math currently being done
without freezing the entire framework into Lean too early. Lean should then
formalize only the stable algebraic kernels that survive this layer.

## Proposed next steps

1. Create a small simulation directory for response-contract toy models.
2. Encode the current load-bearing toy results as executable tests before
   adding new speculative dynamics.
3. Pick one finite-dimensional theorem kernel for Lean after the simulation
   layer exposes the assumptions cleanly.
4. Add a claim-audit field recording verification status: prose review,
   simulation, symbolic check, Lean proof, or empirical implementation.
5. Revisit full Lean investment only after at least three stable kernels have
   clear statements and recurring use in the paper.

## Working conclusion

The project should not move to full Lean-first research now. That would slow
conceptual progress by roughly an order of magnitude and would force premature
formal choices in the most important open areas.

The better path is a hybrid verification stack: current adversarial research
loop, executable response-contract simulations, symbolic checks for algebra,
and Lean for stable finite-dimensional kernels. This gives much of the benefit
of formal verification while preserving the exploratory speed needed for the
framework.
