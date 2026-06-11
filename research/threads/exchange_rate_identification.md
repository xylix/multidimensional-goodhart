# Exchange-rate identification: when channel-level h_j is recoverable

Status: worked note, June 10, 2026. Step 1 of the empirics track
(`plans/exchange-rate-empirics.md`, agreed sequencing). Executable companion:
`research/simulations/identification_toy.py`. This is a worked note plus
simulation, not a formal era-2 result; promote only if it crystallizes into
something theorem-shaped.

## Question

The empirical literatures the track wants to mine (HRRP, education
accountability) estimate realized harm per unit of score movement — T5's
*output* H/d. The diagnostic needs T5's *inputs*, the channel-level rates
`h_j`, because the realized average does not transfer across designs: change
the scorecard and the loading weights `kappa_j w_j` change with it. This is
the Lucas critique applied to the book's own diagnostic — H/d is
design-relative; the `h_j` are design-invariant within the model's
assumptions. Under what observation designs are the `h_j` identified?

## Setup

Work entirely inside T5's hypotheses (`research/core-math.md`, T5): additive
score `sum_j w_j a_j`, separable quadratic costs `a_j^2 / (2 kappa_j)` with
`kappa_j > 0`, `w_j > 0`, linear hidden harm `H = sum_j h_j a_j`, fixed
deficit `d > 0`. The cost-minimizing response to a regime with weights `w` is

`a*_j = d kappa_j w_j / S`, with `S = sum_i kappa_i w_i^2`,

so each regime `r` (weight vector `w^(r)`, deficit `d_r`) induces a known
action profile `a*(r)` and one observable harm equation
`H(r) = a*(r) . h`. Because harm is linear in actions, identification is
linear algebra over the stacked profile matrix `A` with rows `a*(r)`.

## Cases

1. **One regime, no traces.** One equation, n unknowns. Any shift of `h`
   orthogonal to the single action profile matches the observation exactly.
   This is the formal version of the book's Part 6 placeholder row: an
   aggregate readmissions-vs-mortality estimate cannot decompose into
   channel rates, however well measured.

2. **Action traces observed.** If per-channel actions `a_ij` are observed
   (coding reclassification counts, observation-status stays, discharge
   timing), harm-on-actions is a regression `H_i = a_i . h`. One regime can
   suffice: unit-level heterogeneity in `kappa_i` varies the channel mix
   across units, so the trace matrix is generically full rank. Traces are
   what convert an average into a decomposition.

3. **No traces, policy variation.** Each regime contributes one equation.
   The `h_j` are identified on the channels of interest **iff the matrix of
   induced action profiles across regimes has full rank there**. Distinct
   sites/years with genuinely different scorecard weights — the plan's
   "trial and error" route — is exactly this design.

## Named failure modes

- **Collinear regimes.** Proportional weight vectors induce proportional
  best-response profiles (scaling `w` by `c` scales `a*` by `1/c`), so the
  profile matrix has rank 1 and the variation is fake. An alternative rate
  vector matches every observed harm and still predicts the wrong harm for
  a genuinely new design. Real-world form: every site weights channels the
  same way, differing only in stringency.

- **Selection contamination.** If realized harm includes a pool-composition
  term correlated with the design (harm moves through entry/exit without
  any action), every harm equation is biased and full-rank variation does
  not rescue the regression. The contract's response-channel field is
  exactly the needed exclusion restriction: only panel-frozen (or
  selection-corrected) observations belong in the system. This unifies the
  econometric requirement with a contract field the book already demands.

Maintained assumption throughout: structural invariance of `h_j` and
`kappa_j` across regimes — the same defense the contract demands for the
type representation. If rates or capacities are themselves design-dependent,
the system estimates nothing stable.

## What the simulation shows

`identification_toy.py`, seeded, noiseless, text-only; one check per claim:

| Check | Claim |
| --- | --- |
| `realized_average_is_design_relative` | H/d differs across designs for the same `h`; one regime leaves an orthogonal-shift alternative |
| `full_rank_regimes_identify_h` | full-rank regime variation solves `h` exactly, including a zero-harm channel |
| `collinear_regimes_leave_h_unidentified` | rank-1 profiles admit an alternative `h` that matches all observations and mispredicts a held-out design |
| `action_traces_regression_recovers_h` | traces plus `kappa` heterogeneity recover `h` from a single regime |
| `selection_contamination_biases_recovery` | design-correlated pool drift biases naive recovery; panel-frozen subset restores it |

## Non-license

- All results live inside T5's declared model (quadratic costs, linear
  harm, deterministic best response). Nothing here estimates any real
  `h_j`, and nothing licenses a claim about HRRP, education accountability,
  or any deployed scorecard. The note supplies vocabulary for the step-2
  audit: which contract fields an existing study fills, and what a
  full identification design would require.
- "Full rank" is a property of *induced action profiles*, not of the raw
  weight matrix; with nonquadratic costs the profile map changes and the
  rank condition must be re-derived.
- Noiseless exact recovery is a logic statement, not a power analysis;
  finite-sample noise, weak instruments, and near-collinearity are real
  obstacles the toy deliberately ignores.

## Kill / narrow conditions

- A demonstration that proportional weight vectors can induce
  non-proportional profiles under the declared costs would kill the
  collinearity failure mode as stated.
- A consistent estimator under design-correlated selection without an
  exclusion restriction (in this linear setting) would kill the
  contamination claim.
- If the HRRP audit (step 2) finds that no contract field maps onto the
  trace/variation/exclusion trichotomy, the vocabulary is wrong and this
  note should be reworked before book integration.

## Feeds

- Step 2 (HRRP worked audit): Wadhera/Gupta-type studies supply a contested
  H/d (case 1); Zuckerman supplies a coding-channel trace (case 2); nothing
  supplies the regime variation (case 3) — expected verdict: partial
  decomposition where traces exist, no full `h_j` vector from public
  aggregates.
- Book integration (step 4, minimal): the Part 6 placeholder row gets
  "realized averages and partial traces exist; channel-level designs
  don't"; the Part 8 identification question gets the rank condition as its
  answer. Book pipeline stays closed until that step.
