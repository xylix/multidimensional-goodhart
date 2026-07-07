# Empirical Goodhart

Goal: Define a method to formally define a systems "goodharting properties" in a way where we can perform static analysis on a training system that has been described so and the static analysis will yield results on how much Goodharting to expect (possibly also what kind).

## Prototype: a programmable response-modeling contract

Design rule carried over from the main project: the analyzer is a **type
system, not a calculator**. Given a declared contract (a machine-readable
slice of the response-modeling contract in `research/formalization.md` /
`research/applications/application_template.md`), it emits

- **Certificates** — quantitative claims licensed by a named result, with
  their conditions attached; and
- **Refusals** — conclusions the declaration does *not* license, naming the
  missing contract field. Refusals are first-class outputs, not errors.

## Layout

| file | contents |
|--|--|
| `contracts.py` | the machinery: `SelectionContract` / `MDPContract` declarations, `analyze_selection` (T1/chi-squared certificates, tail-regime gate), `analyze_mdp` (spec-level value-iteration misalignment, gated basin-discovery estimate), self-checks |
| `example1_selection.py` | best-of-n selection toy, tail-thickness knob (regressional / catastrophic Goodhart) |
| `example2_gridworld.py` | 8x8 gridworld sensor-aliasing hack, tabular Q-learning, spec vs dynamics split |
| `results/` | generated markdown + json (`example1.md`, `example2.md`, ...) |

Run (repo convention):

```
uv run --with numpy python contracts.py
uv run --with numpy python example1_selection.py     # ~20 s
uv run --with numpy python example2_gridworld.py     # ~45 s
```

Each example script re-runs its full check suite and exits nonzero on any
check failure, so the scripts are their own regression tests.

## Example 1: what a chi-squared certificate can and cannot see

Hidden value `V ~ N(0,1)`, proxy `U = V + eps`, argmax over n candidates.
Knob: the tail of `eps` **relative to** `V` (the knob is the ratio of tail
weights, not heavy-tailedness per se).

Validated findings (all checks pass; `results/example1.md`):

- **Positive:** the T1 certificate `delta(n) * sd(V)` with
  `delta(n) = sqrt(n^2/(2n-1) - 1)` (closed-form chi-squared of best-of-n,
  distribution-free) upper-bounds the observed drift in *every* variant,
  including infinite-noise-variance t(2) — the hidden coordinate keeps finite
  variance and the winner likelihood ratio is bounded by n, so T1's
  hypotheses hold. [confident]
- **Boundary:** the certificate is tail-blind by construction — variants A
  (Gaussian noise) and B (t(4) noise scaled to the *same* sd) receive
  identical certificates while their realized curves diverge: A keeps
  growing (matches the analytic Gaussian curve `0.5 * E[max_n U]` to within
  MC error), B humps near n=64 and falls, C (t(2)) collapses back toward
  the baseline mean. Predicting curve *shape* therefore requires a declared
  coupling-tail field; without it the analyzer refuses. The non-monotone
  hump (not a plateau) is confirmed empirically. [confident]
- The bound is valid but loose off the worst-case coupling (factor ~18 at
  n=4096 for variant A): T1's tightness is over all couplings, and additive
  Gaussian noise is not the extremal one.

## Example 2: spec-level vs dynamics-level Goodhart, kept separate

8x8 grid, start (0,0), true goal G at (7,7); a spurious tile S' fires the
proxy sensor with probability p per entry, collectible forever. Knobs: p
(moves the spec-level question) and S' position (moves the dynamics-level
question). Q-learning: optimistic init, eps-greedy 0.2, visit-count alpha
decay, 60 seeds.

Validated findings (all checks pass; `results/example2.md`):

- **Spec-level (static, exact):** value iteration on the declared MDP flags
  misalignment exactly where the closed-form boundary
  `gamma^(d_S'-1) * p/(1-gamma) > gamma^(d_G-1)` says, for all six configs.
  p = 0.01 is aligned; p = 0.05 and 0.10 are misaligned at gamma = 0.95.
  [confident]
- **Asymptotics follow the spec certificate:** at T = 200k every aligned
  config reaches the goal in 60/60 seeds and every misaligned config camps
  the spurious tile in 60/60 seeds. The static verdict is the correct
  infinite-training predictor here. [confident]
- **Dynamics-level:** the analyzer's coarse basin model (uniform-random-walk
  hitting probability, licensed only when an exploration model is declared;
  refusal otherwise) predicts the *ordering* of early commitment (near S'
  >= far S' at T = 2000) but not the magnitude: with optimistic-init
  exploration, almost all seeds at T = 2000 are committed to *neither*
  attractor, which the walk abstraction cannot represent. At T = 10k the
  ordering is no longer clean. Honest verdict: the abstraction identifies
  which geometry is riskier, and leaks on timing. [confident about the leak;
  the ordering claim is weak evidence at these sample sizes]
- Learning-rate schedule mattered more than geometry for *when* commitment
  happens (constant alpha left misaligned configs oscillating between basins
  at T = 50k) — a reminder that "P(Goodhart | T)" is a property of the
  declared learner, not just the declared MDP, which is exactly why the
  analyzer refuses it absent the declaration.

## Non-license (project level)

- Nothing here is a welfare claim; hidden-harm functionals are declared, not
  learned.
- The channel typing (selection vs fixed-type response) is relative to the
  declared contract, exactly as in the repo caveat — the spec language does
  not make declarations honest.
- No sequential-composition result: certificates cover one selection stage
  or one declared MDP. Composing pressure across pipeline stages (the graded
  /semiring direction) is open math, deliberately not faked here.
- The tail-regime certificates are qualitative regime claims, not rates.

## Next steps (not started)

1. Multidimensional variant of example 2 (two sensor tiles, weighted proxy)
   so T5 exchange-rate predictions ("which channel absorbs the gaming") get
   a validation target.
2. chi-squared composition across sequential selection stages — the theorem
   the graded-type packaging needs.
3. Encode T1/T2 as derived rules in an f-divergence relational logic and
   check what existing infrastructure already covers.
