# Adaptive-hardening theorem boundary

Iteration: 35

Status: theorem-boundary note for Q14. This note promotes only the narrow
finite-channel deterministic capacity result from the Iteration 27 simulation
contract. It does not add book prose, policy advice, or a broader dynamics
claim.

## Contract

Fix a finite measured set `M`. For measured channels `j in M`, an agent with
score deficit `d > 0` can choose nonnegative actions `a_j` that raise the
additive score by

`sum_{j in M} w_j a_j`.

Private gaming cost is separable quadratic:

`C(a) = sum_{j in M} a_j^2 / (2 kappa_j)`,

with `kappa_j >= 0` and fixed score weights `w_j`. Define measured score
capacity

`S(M) = sum_{j in M} kappa_j w_j^2`.

Stakes `V > 0`, deficit `d`, weights, observation, and measured set `M` are
fixed. Observation is deterministic: the regulator sees the current
best-response action under the current `kappa`.

The Iteration 27 water-filling calculation gives:

- minimum cost to cover deficit `d`:
  `m(d) = d^2 / (2 S(M))` when `S(M) > 0`, and `m(d)=infinity` when `S(M)=0`;
- gaming is feasible iff `d^2 / (2 S(M)) <= V`;
- when `S(M) > 0`, a cost-minimizing response is
  `a_j^* = d kappa_j w_j / S(M)`.

Equivalently, with threshold

`T = d^2 / (2V)`,

gaming is feasible exactly when `S(M) >= T`.

The strict no-gaming condition is `S(M) < T`. Equality still permits gaming,
because the agent is indifferent only in the weak-cost sense used by the
Iteration 27 feasibility test.

## Proposition: monotone-capacity boundary

Suppose a hardening process produces a sequence `kappa_{j,t}` with fixed
`M`, `d`, `V`, and `w`, and with

`0 <= kappa_{j,t+1} <= kappa_{j,t}` for every `j in M`.

Then:

1. `S_t(M) = sum_{j in M} kappa_{j,t} w_j^2` is nonincreasing.
2. At time `t`, gaming is feasible iff `S_t(M) >= T = d^2/(2V)`.
3. Gaming stops exactly at the first time `tau` such that `S_tau(M) < T`,
   if such a time exists.
4. Convergence to no-gaming is not implied by monotonicity alone. It requires
   a policy/floor condition strong enough to force `inf_t S_t(M) < T`.
5. If each channel has a hardening floor `underline{kappa}_j`, then no-gaming
   is guaranteed by this argument only when
   `S_floor(M) = sum_{j in M} underline{kappa}_j w_j^2 < T`.
   If `S_floor(M) >= T`, the capacity argument cannot stop gaming, and a
   policy that reaches the floor on every channel still leaves gaming feasible.

Proof. The first claim follows termwise because `w_j^2 >= 0`; lowering any
`kappa_j` cannot increase `kappa_j w_j^2`, so the finite sum is
nonincreasing. The second claim is the Iteration 27 quadratic calculation:
the cheapest action covering `sum_j w_j a_j >= d` has cost `d^2/(2S_t(M))`,
with infinite cost when `S_t(M)=0`; comparing this cost to fixed stakes `V`
is equivalent to `S_t(M) >= d^2/(2V)`. The third claim is just the same
equivalence applied along the sequence. For the fourth, a nonincreasing
sequence can converge to a limit at or above `T`, or can become constant
before crossing `T`. For the fifth, floors imply
`S_t(M) >= S_floor(M)` for every `t`, and full hardening can do no better
than that floor capacity. Therefore floor capacity below `T` is sufficient
for capacity-based termination when the policy actually drives all relevant
capacity down to the floors, and floor capacity at or above `T` is a direct
counterexample to guaranteed termination. QED.

## Largest-action multiplicative rules

Consider the rule implemented in Iteration 27:

- while gaming is feasible, compute the current best response
  `a_j^* = d kappa_j w_j / S(M)`;
- choose a measured channel with largest current `a_j^*`;
- update `kappa_j <- max(underline{kappa}_j, alpha kappa_j)` for fixed
  `0 < alpha < 1`;
- leave all other `kappa_i` unchanged.

The simulation instances used equal weights and a common low floor. In that
regime, a largest-action channel is also a channel with maximal current
`kappa_j`, so before all channels are floored the chosen channel can still be
hardened. But the literal rule above does not terminate under arbitrary
positive floors and weights merely because floor capacity is below threshold.

Counterexample. Let two channels be measured, let `d^2/(2V)=T=1`, set
`w_1=w_2=1`, floors
`underline{kappa}_1=0.90`, `underline{kappa}_2=0.05`, and initial capacities
`kappa_1=0.90`, `kappa_2=1.00`. Then
`S_floor=0.95<T`, so full hardening would stop gaming. With `alpha=1/2`, the
rule first hardens channel 2 to `0.50`; now `S=1.40 >= T`, so gaming remains
feasible. The largest current action is channel 1, but channel 1 is already at
its floor. Repeatedly applying
`kappa_1 <- max(0.90, alpha kappa_1)` changes nothing, so the literal policy
can stall forever above threshold.

Thus the finite-termination corollary needs a progress condition. One
sufficient version is:

- while gaming is feasible, choose a channel whose update strictly lowers
  `kappa_j`, for example the largest current best-response action among
  channels with `kappa_j > underline{kappa}_j`;
- update `kappa_j <- max(underline{kappa}_j, alpha kappa_j)` for fixed
  `0 < alpha < 1`.

Assume finite `M`, fixed strictly positive weights `w_j > 0`, fixed positive
initial capacities, and finite floors. If

`S_floor(M) = sum_{j in M} underline{kappa}_j w_j^2 < d^2/(2V)`,

then this progress-aware largest-action rule terminates after finitely many
hardening steps.

Proof. Each update is monotone, so the proposition applies. It remains only to
show finite crossing when the floor capacity is below the threshold. If
gaming is still feasible, then `S_t(M) >= T > S_floor(M)`, so at least one
measured channel has `kappa_{j,t} > underline{kappa}_j`. The progress-aware
rule chooses such a channel and strictly reduces `S_t(M)`. Repeated
multiplication by `alpha < 1` reaches any fixed neighborhood of the floor in
finitely many updates for a chosen channel. Since there are finitely many
channels, after finitely many progress updates per channel the remaining
excess capacity
`sum_j (kappa_{j,t} - underline{kappa}_j) w_j^2`
falls below `T - S_floor(M)`. Thus `S_t(M) < T`, so gaming is infeasible. QED.

This licenses the Iteration 27 route-switching description under its effective
progress assumptions, but not a cycling theorem. The identity of the largest
best-response action can move from one channel to another before termination.
Capacity itself is monotone nonincreasing, so such route switching is finite
pre-convergence behavior when the hardening policy keeps making progress, not
persistent cycling.

## Non-transfer results

The theorem boundary is deliberately thin.

Arbitrary hardening policies can fail. For example, with two measured
channels, `w_1=w_2=1`, threshold `T=1`, and initial/floor capacities
`kappa_1=2`, `kappa_2=0`, a policy that repeatedly "hardens" channel 2 or
keeps selecting an already-floored channel never lowers `S(M)=2`, so gaming
never stops. Monotone capacity is not enough without a rule that actually
drives relevant capacity below threshold.

Positive floors can fail. If `S_floor(M) >= T`, then even hardening every
measured channel to its floor leaves `S(M) >= T`; the same feasibility
criterion says gaming remains possible. This is a counterexample inside the
Iteration 27 contract, not a limitation caused by richer dynamics.

Changing the measured set is outside the theorem. Adding or removing channels
changes `M` and therefore changes the capacity object being compared to the
threshold. The monotone proof does not apply to policies that expand the
attack surface while hardening existing channels.

Changing `d`, `V`, or weights is outside the theorem. The threshold
`d^2/(2V)` and the capacity weights `w_j^2` are fixed in the proof. Endogenous
stakes, changing score deficits, score-weight redesign, gates, overrides, or
renormalizations need their own model.

Stochastic observation is outside the theorem. The largest-action rule assumes
deterministic access to the current best response. Observation error can make
the regulator harden irrelevant channels or chase noise, and is not covered by
the capacity proof.

Shared bottlenecks, nonseparable costs, and nonconvex response geometry are
outside the theorem. The scalar capacity `S(M)` exists because the cost is
separable quadratic and the score gain is additive. Correlated actions,
resource constraints, caps, fixed charges, search discontinuities, and
nonconvex feasible sets can remove the water-filling formula and the monotone
capacity invariant.

No policy-optimality claim follows. The proof says when a declared hardening
process crosses a no-gaming capacity threshold. It does not compare hardening
costs, signal loss, welfare, static commitment, measurement expansion, or any
regulator objective beyond stopping fixed-deficit gaming in this contract.

## Licensed statement

The exact theorem license is:

In the finite-channel deterministic additive-score, separable-quadratic
gaming model with fixed measured set `M`, fixed deficit `d`, fixed stakes `V`,
fixed weights, and monotone lowering of `kappa_j`, gaming is feasible exactly
when `S_t(M) >= d^2/(2V)`. Hardening reaches no-gaming exactly when capacity
falls below that threshold. A progress-aware largest-action multiplicative
rule terminates in finite time if finite measured channels have positive
weights and floor capacity is below the threshold. The literal largest-action
rule needs either that progress condition or a separate floor/weight condition
preventing it from repeatedly selecting already-floored channels.

The exact non-license is:

No convergence theorem is licensed for arbitrary hardening policies, literal
largest-action rules that can stall on already-floored channels,
positive-floor regimes with `S_floor(M) >= d^2/(2V)`, changing measured sets,
endogenous `d` or `V`, stochastic observation, shared bottlenecks,
nonseparable costs, nonconvex response geometry, or policy optimality.
