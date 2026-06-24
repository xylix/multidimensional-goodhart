# Lit review: lower-tier parallels (identification, exponential tilt, T3, T6)

Status: active, bundled lit review. Third of three feeding the novelty-refactor
capstone (`plans/novelty-refactor.md`). These are lower-stakes than T1/T2 and T4
— some are framing claims rather than headline theorems — but each has a strong
native-field parallel that the paper should anchor rather than re-derive. Bundled
because none individually justifies a full three-model sweep.

**Consumes the unified cross-field discovery** (`plans/litrev-discovery.md`); the
L1–L4 native homes (causal inference, exponential-family cumulants, signaling/
Spence, greedy/security games) are discovered once there (outputs in
`research/threads/lit_review/cross-field-discovery/`). Do not run independent
searches — this review produces the **per-item verdicts** from that shared discovery.

## Why this exists

The same discipline as the other two plans: review each claim against its own
mathematical home, not the Goodhart literature. These four are the remaining
core claims with likely existing parallels. Treat as a single review with four
clearly separated items; escalate any one to its own plan only if a pass turns
up a closer-than-expected precedent that needs deeper work.

## Items

### L1. Selection/intervention non-identifiability = causal-inference fundamentals

- Claim (book Part 2/3): the `W_theta` (selection) vs `K_theta` (intervention)
  split is not identifiable from marginal score movement and is relative to the
  declared type representation.
- Suspected parallel: observational equivalence / the fundamental problem of
  causal inference; Heckman selection models; Rubin potential outcomes; Pearl
  do-calculus; mixture-model non-identifiability; Manski partial identification.
- Stakes: medium. Asserted unanchored, it invites "this is just selection bias."
- Seeds: Heckman selection; Rubin causal model; observational equivalence;
  identifiability of mixtures; Manski bounds / partial identification.

### L2. Covariance-as-local-velocity / exponential tilt = exponential families

- Claim (book §5.1 + Part 2 covariance refutation): with `H = Z^2 - 1`, baseline
  covariance is zero yet threshold/Boltzmann selection moves `H`; covariance is
  only the zero-pressure derivative, finite-pressure drift depends on the whole
  tilted path.
- Suspected parallel: exponential families / cumulant generating functions
  (derivative of the tilted mean = covariance), Gibbs–Boltzmann measures, large
  deviations, importance sampling. The threads already name these tools
  (`research/threads/selection_response.md`).
- Stakes: low — illustrative refutation, not a headline. Needs only a nod to the
  standard cumulant fact.
- Seeds: exponential family / natural-parameter tilting; cumulant generating
  function derivatives; Gibbs measure; large deviations; importance sampling.

### L3. T3 quadratic Stackelberg wedge = signaling / costly threshold-crossing

- Claim (book §5.2, `core-math.md` T3): below-threshold gaming worthwhile iff
  `t - Q <= sqrt(2 kappa V)`.
- Suspected parallel: Spence (1973) job-market signaling; contest / all-pay
  auction theory; strategic classification (Hardt et al. 2016, already cited and
  flagged as nearest analogue in `formal_analogue_lit_map.md`).
- Stakes: low — explicitly a toy "signature." Confirm the antecedent and cite.
- Seeds: Spence signaling; costly threshold-crossing; contest theory / all-pay
  auctions; strategic classification cost models.

### L4. T6 adaptive-hardening boundary = static T4 + greedy capacity reduction

- Claim (book §5.3, `core-math.md` T6): gaming feasible iff `S_t(M) >= d^2/(2V)`;
  a progress-aware multiplicative rule terminates under floor conditions.
- Suspected parallel: the static threshold is T4 specialized (`S(M) = |b|^2`); the
  dynamic is monotone greedy resource reduction with a security-game / moving-
  target-defense flavor. The termination claim is likely the most genuinely
  original-but-small piece in the set.
- Stakes: low. Goal is to confirm the static part is T4 and locate any
  scheduling / security-game precedent for the dynamic, so the paper does not
  over-claim novelty for the threshold.
- Seeds: Stackelberg security games; moving-target defense; greedy monotone
  resource-reduction scheduling; equimarginal capacity.

## Protocol

One combined pass per item is enough (not the full optimistic/pessimistic ×3 for
each). Use the pessimistic ("find the precedent") framing as the default since
the goal is anchoring, with an optimistic check only on L1 (where a genuine
identification subtlety might survive). Store under
`research/threads/lit_review/lower-tier-parallels/`, one subsection per item.

## Resolution criterion

Resolved when each of L1–L4 has either a named anchor citation or an auditable
"no closer parallel found than X" note, and any item that surprises us with a
near-exact precedent is flagged for escalation before the capstone runs.

## Consequence if confirmed (feeds the capstone)

- L1: anchor the non-identifiability claim in causal inference; frame the
  selection/intervention split as the Goodhart-specific instance of a known
  identification problem.
- L2: add a one-line cumulant/exponential-family nod to the covariance refutation.
- L3: cite Spence / strategic classification at T3; keep the toy framing.
- L4: state T6's threshold as the T4 specialization; scope any novelty to the
  termination argument.

## What this plan deliberately does not do

- No new theorems; no change to any claim statement. Anchoring and citation only.
