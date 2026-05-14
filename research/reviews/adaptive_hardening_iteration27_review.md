# Review iteration: adaptive hardening and measurement frontier

Iteration type: `review`

Review target:

- `research/simulations/iteration27_adaptive_hardening.py`
- Q14 and Q15 in `research/open_questions.md`
- Adaptive-hardening and measurement-frontier rows in
  `research/verification_stack.md`

## High-level verdict

Iteration 27 licenses a narrow Layer-3 claim:

Under a declared finite-channel additive quadratic scorecard with fixed
`kappa`, `h`, `gamma`, `w`, fixed stakes `V`, and deterministic deficits,
reactive hardening changes the capacity
`S(M) = sum_{j in M} kappa_j w_j^2`. In that contract, hardening can converge
to no-gaming once `S(M) < d^2/(2V)`, active gaming routes can switch before
convergence, added metrics can either expand attack surface or improve net
benefit depending on signal/harm/attack primitives, and static narrow
commitment can dominate broad reactive measurement when signal adequacy is
already met.

What it does not license: theorem-level convergence for arbitrary hardening
policies, empirical claims about real metric systems, endogenous-stakes
dynamics, stochastic observation, policy optimality, or a general sign claim
that adding metrics helps or hurts.

The review result is promotion-permitted only as a toy frontier classification.
Do not promote it beyond Layer 3 without either theorem hypotheses or an
application contract with estimable primitives and falsifiers.

## Lakatos: scoping moves

The finite-channel, additive-score, separable-quadratic setup is mostly
lemma-incorporation. Earlier failures showed that dimensional claims need
declared aggregation, exchange rates, cost geometry, and welfare/value weights.
Iteration 27 incorporates those missing lemmas into explicit primitives:
`kappa_j` for gaming ease, `w_j` for score exchange, `h_j` for harm, and
`gamma_j` for signal/benefit.

The fixed `V`, deterministic deficit grid, and noiseless observation are
exception-barring. They are legitimate for a minimal toy, but they exclude
performative trust decay, forecast error, stochastic score estimates, and
agent uncertainty rather than resolving them.

The largest monster-barring risk is the signal-adequacy clause in
`static_commitment_dominates`. It is acceptable as a declared policy premise,
but it must not become an ex post way to call a narrow metric adequate only
after it wins. In applications, signal adequacy has to be defended before the
policy comparison.

The second monster-barring risk is the frontier vocabulary. "High signal" and
"low attack surface" are not observations by themselves; they are model
parameters. Real applications need evidence that bounds or estimates `gamma`,
`kappa`, `h`, and `V` before the frontier claim can do policy work.

## Tao: do the toy checks carry the claims?

1. `reactive_hardening_converges`

This check does real work for the declared contract. Feasibility is equivalent
to `d^2/(2S(M)) <= V`; multiplying a chosen `kappa_j` downward lowers `S(M)`,
and the run stops after four rounds with `S_final = 3.0000` below the
threshold `3.3333`. It supports existence of convergence in a finite-channel
hardening regime, not a universal convergence theorem. The code's termination
assertion depends on the chosen factor, floor, and finite measured set.

2. `route_switching_before_convergence`

This check carries the route-switching claim. Near-symmetric channels produce
the hardening path `[1, 2, 3, 4]` before the threshold is crossed. It shows that
reactive patching need not keep attacking the original route. It does not show
cycles: the capacity path is monotone downward because hardening only reduces
`kappa`.

3. `add_dimension_expands_attack_surface`

This check carries a one-sided existence claim: adding declared-signal
dimensions can increase both capacity and deterministic population harm. The
path `{1} -> {1,2} -> {1,2,3}` raises `S` from `1.1000` to `4.6000` and
`H_pop` from `0.3031` to `1.0000`. It does not prove that informative metrics
generically backfire, because the choice rule adds dimensions by signal per
capacity increment and the harm/signals are declared.

4. `static_commitment_dominates`

This is the strongest policy warning but also the easiest to overread. It
shows a regime where a narrow hard-to-game commitment is already adequate and
has much lower cumulative net harm than broad reactive measurement
(`0.0029` versus `7.4448`). It licenses "reactive hardening can lose to static
commitment" only under a predeclared adequacy floor and fixed primitives. It
does not license a general anti-adaptation policy.

5. `beneficial_high_signal_low_harm_addition`

This is the key anti-slogan check. It prevents the review from turning
"measurement frontier" into "more metrics are worse." A high-`gamma`,
low-`h`, low-`kappa` metric raises signal from `0.1000` to `3.1000`, keeps
gaming infeasible, and lowers forced-action net harm. It supports a genuine
frontier view: additions differ by signal, harm, and attack surface.

6. `conjunctive_gate_contrast`

This check is consistent with the earlier aggregation story. Conjunctive gates
raise fixed-deficit burden while shrinking feasible entry. It belongs as a
contrast case, not as a substitute for the additive hardening analysis.

## Renormalization stress test

Harmless unit changes should not decide the qualitative story. The Iteration 27
checks survive the following only when the corresponding primitives are
transformed consistently:

- Score-weight units: replacing `w_j` by `c_j w_j` is harmless only if the
  channel action unit or `kappa_j` is changed so that score capacity
  `kappa_j w_j^2` represents the same real response opportunity. Changing
  `w_j` alone is substantive because it changes incentives.
- Harm units: multiplying all `h_j` and all benefit weights `gamma_j` by the
  same positive scalar preserves net-harm rankings up to scale. Multiplying
  only `h` or only `gamma` changes the welfare tradeoff and is substantive.
- Signal units: `gamma` can be rescaled only together with adequacy floors and
  benefit comparisons. Otherwise "adequate signal" becomes arbitrary.
- Stakes/threshold units: scaling the score deficit `d` and stakes `V`
  independently changes the entry threshold `d^2/(2V)` and is not harmless.
  A units-only change must preserve the feasibility inequality.
- Hardening factors: the existence checks do not require the exact numerical
  factor, but convergence and route paths depend on the policy rule, factor,
  floor, and tie structure. Those are part of the model, not mere notation.

The review therefore keeps the finite scorecard result, but the license must
always mention the invariant object: score capacity, feasibility threshold, and
declared signal/harm exchange rates.

## Hossenfelder: framework-level falsifiers

Adaptive hardening loses framework value if:

1. Real applications cannot estimate, bound, or experimentally perturb the
   primitives that drive the toy: `kappa`, `h`, `gamma`, `w`, and `V`.
2. Plausible response contracts fit the same observations while recommending
   opposite policies, with no independent evidence to choose between them.
3. Hardening policy conclusions reverse under unit changes that should be
   harmless in the application.
4. Signal adequacy is always set after seeing which metric performs best.
5. Stochastic observation or endogenous stakes destroy the capacity-threshold
   logic in the domains where the project wants to apply it.

Measurement-frontier claims lose framework value if every useful metric can be
called safe only by assuming low `kappa` or high `gamma` after the fact, or if
the framework cannot name one observation that distinguishes a high-signal
addition from an attack-surface expansion before deployment.

## Feynman: failure modes and retraction conditions

The toy could be fooling the project in several ways:

- Capacity `S(M)` is clean because the model is separable and quadratic. Shared
  bottlenecks, correlated actions, caps, fixed charges, or nonconvex search may
  make hardening one channel increase effective opportunity elsewhere.
- Deterministic deficits hide learning and observation. A noisy regulator may
  harden the wrong channel, overfit to transient gaming, or invite gaming of
  the hardening process itself.
- Fixed `V` hides trust dynamics. If visible gaming lowers stakes, hardening
  and entry can form a performative fixed point rather than a monotone path to
  no-gaming.
- Net harm is only as good as the declared `h` and `gamma`. If real benefit and
  hidden harm are badly estimated, the frontier can look precise while being
  policy-empty.
- Static commitment dominates in one toy because adequacy is assumed. In a
  real domain, a narrow metric may miss important target variation and create a
  different failure.

Retraction conditions:

- Retract any general "reactive hardening converges" statement if convergence
  relies on separability, monotone lowering of `S(M)`, and fixed `V` but the
  prose omits those clauses.
- Retract any "adding metrics backfires" statement if it ignores the
  beneficial high-signal/low-harm/low-kappa addition.
- Retract any "static commitment dominates" statement if signal adequacy is
  not predeclared.
- Retract any policy recommendation if the primitives cannot be estimated or
  bounded before observing the policy outcome.

## Review decision

Iteration 27 survives review as a narrow, useful Layer-3 toy. It is strong
enough to guide the next workstream toward application-template hardening:
the project should now ask whether real domains can populate the frontier
contract and name observations that would make the contract wrong.

It is not yet strong enough for theorem promotion or book-paper promotion
except as a clearly labeled toy example. Endogenous-stakes modeling remains
important, but should not start until the application contract says whether
fixed `V` is actually the blocking assumption in practice.
