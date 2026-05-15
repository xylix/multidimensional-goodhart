# Next steps

This is the active roadmap. Iterations 39-42 are the remaining staged repair
sequence: consolidate the roadmap, and only then decide whether any book or
paper integration is licensed. Iteration 36 is retained below as completed
context for the sequence and is not itself part of the active work.

Do not edit book or paper files before the Iteration 40 integration-readiness
gate. The
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

## Iteration 39: roadmap consolidation

Iteration type: `roadmap`.

### Purpose

Reconcile the project map after the Iterations 36-38 repair sequence. This
pass is bookkeeping on research/roadmap docs only; Iteration 42 is a separate
post-prose-edit consistency check across book/paper prose, and the two should
not be merged.

### Work

1. Reconcile `plans/next-steps.md`, `research/open_questions.md`,
   `research/verification_stack.md`, and `research/claim_audits.md`.
2. Close or rename roadmap items that are now theorem-boundary, dynamic-toy,
   empirical-design, or policy-blocked.
3. Produce a compact "what is now live" map for the project.

### Success condition

The roadmap and tracking docs agree on live questions, closed questions,
blocked claims, and licensed next actions.

## Iteration 40: integration-readiness review

Iteration type: `integration-review`.

### Purpose

Decide whether any results from Iterations 35-39 should enter book or paper
prose.

### Work

1. Use the same include/footnote/exclude format as the prior
   promotion-readiness review.
2. Default to no integration unless a result changes the main argument and
   has a clearly stated boundary on what is excluded from the claim.
3. Do not edit book or paper prose during this review.

### Success condition

A review note that explicitly permits, footnotes, or excludes each candidate
book/paper integration.

## Iteration 41: scoped book/paper integration, only if licensed

Iteration type: `integration`.

### Purpose

Make a narrow prose edit only if Iteration 40 permits it.

### Work

1. If licensed, add at most a narrow footnote or appendix paragraph on the
   adaptive-hardening theorem boundary.
2. If licensed, add one short note that stochastic/endogenous dynamics remain
   model-dependent.
3. Do not add broad policy advice.
4. If Iteration 40 licenses nothing, record that outcome in the integration
   review note and skip directly to Iteration 42 without touching prose.

### Success condition

Any book/paper edit is traceable to the Iteration 40 integration-readiness
review and does not broaden the licensed claim. If no edit was licensed, the
review note explicitly records the no-edit closure.

## Iteration 42: final consistency pass

Iteration type: `consistency`.

### Purpose

Verify that book/paper prose, research notes, and roadmap agree on licenses and
open questions.

### Work

1. Run repo-wide claim-audit searches for forbidden overpromotions. Use
   scoped patterns to avoid false positives on notes that legitimately discuss
   boundaries: `optimal-policy\b`, `\blimits to\b`, `persistent cycle`,
   `endogenous V`, and a `\btheorem\b` check limited to `book/` and `paper/`
   prose. Run a separate `\bstochastic\b` check limited to `book/` and
   `paper/` prose; do not flag matches in `research/` notes.
2. Check book/paper prose, research notes, and roadmap against the Iterations
   35-41 licenses.
3. Fix only consistency and overpromotion problems; do not add new substantive
   claims.

### Success condition

No tracked prose overpromotes theorem, dynamics, empirical, integration, or
policy licenses beyond the review notes.

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
- Book and paper edits are deferred until Iteration 40 explicitly licenses
  them.
