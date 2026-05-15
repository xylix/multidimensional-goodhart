# Next steps

This is the active roadmap after the Iterations 35-42 staged repair sequence.
Iteration 36 is retained below as completed context for the sequence and is not
itself part of the active work.

Do not edit book or paper files without a new scoped review. The
application-template promotion gate is closed: Chapter 6 now includes the
reviewed application discipline, narrowed reusable-template boundary, and
compact hospital/scientific scorecard mappings. The adaptive-hardening theorem
boundary is closed only for the narrow finite-channel deterministic capacity
result; stochastic observation and endogenous stakes have only a tiny dynamic
toy showing that declared update rules can alter or break transfer from the
static capacity story.

The remaining work should repair reviewed-but-excluded gaps separately. Do not
promote these into theorem, empirical, or policy claims until the relevant
iteration has its own verification pass.

Current live map after Iteration 42:

- Theorem-boundary closed: adaptive hardening only inside the deterministic
  finite-channel capacity contract from Iteration 35. This licenses the exact
  `S(M) < d^2/(2V)` no-gaming boundary and the progress-aware termination
  condition, not stochastic, changing-objective, or policy-optimization claims.
- Dynamic-toy boundary closed: Iteration 36 shows only that declared stochastic
  observation and endogenous-stakes rules can alter or break transfer from the
  static capacity story. It does not license fixed-point, filtering, persistent
  cycle, or performative-stability claims.
- Empirical-design boundary closed: Iteration 37 says scorecard primitives can
  sometimes be predeclared, bounded, defended, or marked unavailable with
  design consequences. It does not license hidden-target estimates or empirical
  welfare/research-value inference.
- Policy gate blocked except for narrow audit/design/evidence actions:
  Iteration 38 permits documenting effective rules, auditing repeated-unit
  action traces, monitoring hidden-target traces where available, piloting or
  lowering leverage when primitives are unavailable, and withholding toy
  diagnostics when primitives are missing.
- Live research questions remain: primitive estimation, stochastic filtering
  and repair budgets, endogenous-stakes fixed points, changing measured sets or
  deficits, shared bottlenecks and nonconvex response geometry, frontier
  characterization in real domains, and the broader recursive/complexity
  attractor question under predeclared response geometry.
- Iteration 41 closure: book and paper prose received only the licensed
  deterministic finite-channel adaptive-hardening boundary correction and the
  short stochastic/endogenous model-dependence note. No broader theorem,
  empirical, scorecard, measurement-frontier, or policy prose was added.
- Iteration 42 closure: final consistency searches found no book or paper
  overpromotion requiring prose edits. The staged repair sequence is complete.

After finishing an iteration, delete the completed iteration step from this
document while preserving the later roadmap unless it is superseded.

## Completed context: Iteration 36 response dynamics beyond the static toy

Iteration type: `modeling`.

Iteration 36 chose a hybrid approach: a short approach-boundary note plus a
tiny executable toy. A proof-only pass was premature because the update rules
were not fixed; review-only would not close the model gap; a small simulation
gave the first falsifiable closure while keeping claims narrow.

Completed artifacts:

1. Added `research/threads/response_dynamics_boundary.md`, comparing
   proof-note, review-only, and tiny-simulation approaches and recording why
   the executable toy was the chosen first pass.
2. Added `research/simulations/iteration36_response_dynamics.py` plus the
   `make iteration36` target.
3. Toy 1: stochastic observation of current best-response actions, where noisy
   largest-channel selection can harden the wrong channel and fail to cross
   `S(M) < d^2/(2V)` within a fixed repair budget.
4. Toy 2: endogenous stakes closure, using the declared recurrence
   `V_{t+1} = (1-lambda) V_t + lambda V0 exp(-rho H_obs_t)`, showing that
   trust/stakes dynamics depend on what harm is observable.
5. Updated `open_questions.md`, `verification_stack.md`, `claim_audits.md`,
   `iteration_log.md`, and this roadmap.

License only: these dynamics can break or alter the static capacity story
under declared update rules. Do not claim a general performative-stability
result.

## Test plan

For Iteration 36, run `make iteration36` and `make run` from
`research/simulations/`; require deterministic seeded output and explicit
kill/narrow conditions.

For prose iterations, run targeted `rg` checks for the iteration's boundary
terms and excluded claims.

For every iteration, run `git diff --check` and `git status --short`.

Do not add new simulations after Iteration 36 unless a later note needs a
minimal counterexample.

## Public interfaces

No public APIs, schemas, package interfaces, or book/paper claims change
through the current roadmap. The only executable interface change is the
Iteration 36 simulation Makefile target.

## Assumptions

- The project should continue in research-iteration mode, not book-polish mode.
- Iteration 36 was hybrid: approach comparison plus tiny executable dynamic
  toy.
- Iteration 37 remains an empirical-design artifact and Iteration 38 remains a
  policy-review artifact.
- Book and paper edits now require a new scoped review because the Iteration
  40-42 integration/consistency sequence is complete.
