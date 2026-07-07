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
| `contracts.py` | the machinery: `SelectionContract` / `MDPContract` declarations, `analyze_selection` (chi-squared and KL drift certificates, four-way regime verdict), `analyze_mdp` (spec-level value-iteration misalignment, gated basin-discovery estimate), self-checks |
| `example1_selection.py` | best-of-n selection toy, tail-thickness knob (regressional Goodhart regimes) |
| `example1b_kl.py` | KL-route certificate: exponential-tilt tightness witness, chi-squared vacuousness comparison |
| `example2_gridworld.py` | 8x8 gridworld sensor-aliasing hack, tabular Q-learning, spec vs dynamics split |
| `results/` | generated markdown + json (`example1.md`, `example2.md`, ...) |

Run (repo convention):

```
uv run --with numpy python contracts.py
uv run --with numpy python example1_selection.py     # ~20 s
uv run --with numpy python example1b_kl.py           # ~5 s
uv run --with numpy python example2_gridworld.py     # ~45 s
```

Each example script re-runs its full check suite and exits nonzero on any
check failure, so the scripts are their own regression tests.

## Prior art / positioning

Verified by reading (2026-07-07): Majka & El-Mhamdi 2025 (arXiv 2505.23445)
primary PDF; El-Mhamdi & Hoang 2024 (arXiv 2410.09638) abstract. Litreview
sweep results incorporated for the rest.

- **Regime verdicts are adopted, not contributed.** The four-way
  No/Benign/Weak/Strong taxonomy and its tail-and-dependence table are
  Majka & El-Mhamdi 2025, building on El-Mhamdi & Hoang 2024. Our analyzer
  *encodes* their Table 2 and must recover their verdicts in the 1-D
  additive limit — a failed reduction is a bug in this analyzer, not a
  disagreement. Kwa & Thomas 2024 (arXiv 2407.14503) own the narrower
  KL-regularization-specific catastrophic result (an earlier version of
  this README's certificate basis mis-attributed the regime taxonomy to
  them; corrected).
- **beta*-from-structure exists** (Karwowski et al. 2024, arXiv 2310.09144,
  MDP occupancy geometry + provable early stopping) — planned adoption for
  the MDP side, not yet done here.
- **Structural incentive detection from a graph spec is owned by the
  CID/PyCID line** (Everitt et al. 2021; Fox et al. SciPy 2021). This
  prototype declares channels rather than detecting them from a DAG; if a
  structural pass is added, PyCID is the machinery to adopt.
- **The defensible novelty** per the litreview: the analyze-vs-simulate
  harness (one declaration checked against its own simulation, certificates
  AND refusals as first-class outputs) and, ahead, compositionality across
  pipeline stages. The per-cell verdicts are deliberately unoriginal.

## Example 1: what moment-route certificates can and cannot see

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
- **KL route:** best-of-n also has closed-form `KL = log n - (n-1)/n`, so a
  declared subgaussian coordinate gets the transportation-lemma certificate
  `sigma * sqrt(2 KL)`. It holds in every variant and, unlike the chi-squared
  route, stays non-vacuous: 3.83 vs 45.2 at n=4096, within 1.5x of the true
  Gaussian curve (the sqrt(log n) vs sqrt(n) growth rates). The routes cross
  at small n (chi-squared is tighter at n=2). [confident]
- **Tail-blindness boundary (recovers known results):** moment-only
  declarations are tail-blind — variants A (Gaussian noise) and B (t(4)
  noise scaled to the *same* sd) receive identical drift bounds while their
  realized curves diverge: A keeps growing (matches the analytic Gaussian
  curve to within MC error), B humps near n=64 and falls, C (t(2)) collapses
  back toward the baseline mean. Predicting curve *shape* requires declared
  tails, and with them the analyzer emits the Majka & El-Mhamdi regime
  verdict: A maps to **Benign** (goal keeps rising, correlation dies), B/C
  under declared independence map to **Weak** (reversion toward baseline —
  useless, not harmful; C's curve reverting to ~0.06 rather than diverging
  downward confirms weak-not-strong), and B/C with dependence undeclared get
  the worst-case **strong-not-excluded** verdict. These verdicts are their
  results, recovered; the reduction checks are the contribution. [confident]
- The chi-squared bound is valid but loose off the worst-case coupling
  (factor ~18 at n=4096 for variant A): T1's tightness is over all
  couplings, and additive Gaussian noise is not the extremal one.

## Example 1b: KL tightness witness and the declaration trade

Exponential tilting of the baseline (`mu_theta = N(t,1)`, `KL = t^2/2`) is
the attainment witness for the KL route: the certificate equals the true
drift exactly at every t tested, while the chi-squared bound on the same
shift (`sqrt(e^{t^2} - 1)`) is 30x vacuous by t=3. A KL budget with only a
declared variance gets a refusal — the KL route prices in subgaussianity.
This is the second instance of the design thesis: declaration strength
trades against conclusion strength, visibly. (`results/example1b.md`)

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

1. Karwowski et al. 2024 occupancy-measure beta* as example 2's quantitative
   pressure-knob output (adoption + reduction benchmark on the MDP side).
2. Multidimensional variant of example 2 (two sensor tiles, weighted proxy)
   so T5 exchange-rate predictions ("which channel absorbs the gaming") get
   a validation target — the one quantitative verdict none of the litreview
   neighbors has.
3. One-spec-two-semantics refactor: a single spec object compiling to both
   the analyzer input and the simulator (the litreview's headline novelty);
   PyCID adoption decision lives here.
4. Composition across sequential selection stages — litrev first
   (Renyi-DP composition; Renyi-2 = log(1+chi^2)), then the theorem the
   graded-type packaging needs. Load-bearing for the compositional claim.
5. Encode the certificate rules in an f-divergence relational logic and
   check what existing infrastructure already covers.
6. Heavy-goal/heavy-noise cell: encode El-Mhamdi & Hoang's relative-Pareto
   rule (currently an honest refusal citing it as future adoption).
