# Project-state consolidation (post-Iteration 43)

Status: archived. The consolidation pass produced the current source registry,
core theorem file, question split, and next-mode decision. It is preserved as
audit trail, not an active plan.

Purpose: pause open-ended iteration work long enough to clarify what the first
43 iterations achieved, what they closed, what they left open, and what the
project should become next. This plan merges the former
`meta-consolidation-after-iteration43.md` (workstream structure) and
`paradigm-forced-review-plan.md` (paradigm-forced inventory step) into a single
gating pass.

This is not Iteration 44 research. It is a project-state consolidation pass.
Do not use it to add new theorem claims, application claims, policy advice, or
speculative research threads.

## Planning rule (carried from paradigm-forced plan)

Do not choose the next review by topic interest alone. Choose the review that
forces the most decision-relevant missing primitives and has a concrete
consequence if those primitives are unavailable.

Every candidate review must answer:

- What claim would we be tempted to use?
- Which contract fields are missing, ambiguous, unavailable, or post-hoc?
- What does each missing field block: theorem transfer, simulation, manuscript
  promotion, diagnostic use, hidden-target credit, or policy language?
- What artifact changes if the review succeeds or fails?

Applied to the current state, the paradigm-forced review identified
project-scope consolidation as the next move, not a policy review or another
complexity-attractor rescue. Those would skip the information the paradigm is
now able to force.

## Trigger

Start only after:

- Iteration 43 manuscript review and scoped book/paper/abstract changes are
  complete;
- generated PDFs and source edits from Iteration 43 have either been committed
  or explicitly parked;
- `git status --short` has been checked so the consolidation pass does not
  overwrite in-progress manuscript work.

## Starting state (live map after Iteration 42)

Carry this in as the starting inventory. It is what Workstream A is meant to
classify and clean, not new content.

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
  short stochastic/endogenous model-dependence note.
- Iteration 42 closure: final consistency searches found no book or paper
  overpromotion requiring prose edits. The staged repair sequence is complete.
- Iteration 43 closure: manuscript abstract added; abstract framing and
  contributions strengthened.

## Target state

The repository should end this pass with:

- a clarified project scope in the root README and research overview files;
- a compact account of what Iterations 1-43 established;
- a closed/open question map that separates resolved boundaries from live
  research;
- archive/delete decisions for obsolete files, stale plans, old approaches,
  and fragments that point at dead phenomena;
- a compacted iteration log that preserves audit value without making every
  future reader re-read the full journal;
- a decision gate between continuing open-ended research and solidifying the
  core math into Lean or a single `core-math.md`.

## Scope clarification

Draft a short scope statement before editing other files.

Working scope candidate:

> The project is a response-modeling framework for Goodhart-like failures.
> It studies how proxy pressure changes hidden error through declared response
> channels, aggregation rules, action/cost/search geometry, and hidden
> value/harm functionals. Its strongest outputs are conditional mathematical
> primitives and claim-license discipline, not a universal theorem that more
> metrics help or hurt, and not a policy recipe.

The scope statement should answer:

- What is the current thesis?
- Which original motivations survived only as prompts?
- Which claims are mathematical results, toy-model implications, application
  contracts, or conjectures?
- What would count as future progress?
- What should no longer be treated as an active target?

## Workstream A: Inventory

Create `research/project_state_after_iteration43.md`.

It should contain:

- survived core primitives;
- closed questions and killed claims;
- live questions grouped by type;
- files that are canonical;
- files that are historical but still useful;
- files that are stale, duplicative, or candidates for archive/delete.

Suggested grouping:

- **Core math:** selection response, response kernels, value-weighted drift,
  Stackelberg wedge, convex score-deficit budget, additive exchange-rate
  condition, adaptive-hardening capacity boundary.
- **Methodology:** response-modeling contract, application discipline,
  verification stack, claim audits.
- **Applications:** MMLU/eval framing, hospital scorecard, scientific metrics,
  empirical auditability.
- **Speculative or parked:** recursive/minimum-complexity attractor,
  response-shape tests, real-domain frontier characterization, stochastic
  filtering, endogenous stakes.

### Paradigm-forced inventory step

For each canonical claim, fill:

- claim;
- contract fields declared;
- missing or unavailable fields;
- consequence of missing fields (theorem transfer, simulation, manuscript
  promotion, diagnostic use, hidden-target credit, or policy language);
- current artifact that owns the claim.

For each open question, fill:

- tempting stronger claim;
- missing primitive;
- cheapest verification layer;
- failure condition;
- keep open / close / park.

Reference the six paradigm-forced topic areas as prompts for which claims to
inventory:

1. **Project-scope consolidation.** Canonical theorem set, canonical
   methodology, dead motivations, next reader artifact.
2. **Core-math extraction.** Stable definitions (`U`, `K_theta`, `W_theta`,
   selection drift, value metric, intervention cost geometry, `H_per`,
   `H_pop`, `S(M)`); theorem candidates (coordinate-explicit selection bound,
   value-weighted/operator bound, Stackelberg wedge, convex score-deficit
   budget, additive exchange-rate condition, deterministic adaptive-hardening
   capacity boundary); dependency map (measure theory, finite-dimensional
   convexity, separable quadratic costs, declared value metrics); non-transfer
   clauses.
3. **Open-question triage.** Cheapest live verification layer; failure
   condition; file target; promotion target (research note, simulation, book
   prose, paper prose, application contract, or no promotion).
4. **Recursive / complexity-attractor revival.** Complexity functional fixed
   before inspection (support, rank, spectral concentration, description
   length, KL, or other); response mechanism (quadratic cost, capped fixed
   charge, low-rank action map, search prior, empirical candidate generator);
   representation; failure condition. If unavailable, keep Q18 parked.
5. **Application and policy readiness.** Type/action boundary; evidence
   distinguishing `W_theta` from `K_theta`; primitive availability (`kappa`,
   `h`, `gamma`, `w`, `V`); evidence standard. If unavailable, only
   audit/design/evidence actions are licensed.
6. **Stochastic and endogenous dynamics.** Observation model; repair budget
   and update rule; agent forecasting/response rule; stakes update and
   observed-harm variable; stability/convergence/failure criterion. If
   unavailable, keep Iteration 36 as a dynamic boundary toy only.

## Workstream B: Scope edits

Update only orientation files first:

- `README.md`
- `AGENT.md`
- `plans/next-steps.md`
- `research/open_questions.md`
- `research/claim_audits.md`
- `research/verification_stack.md`

Editing rule: make scope sharper, not more apologetic. Prefer direct
classification over added caveats.

Blocked until after the orientation pass:

- substantive book edits (handled separately by `spine-refactor.md`);
- compact-paper edits beyond Iteration 43;
- new simulations;
- new research threads.

## Workstream C: Archive/Delete pass

Use a three-way disposition for each candidate file:

- **canonical:** current source of truth;
- **archive:** historically useful but no longer active;
- **delete:** obsolete generated artifact, superseded scratch, or dead approach
  with no audit value.

Likely archive candidates:

- completed root-level plans whose work is fully represented elsewhere;
- old approach plans in `plans/archived/` if they should be grouped by era;
- review files that are useful audit trail but not active reading material.

Delete candidates must be enumerated in a deletion-candidate list inside
`research/project_state_after_iteration43.md` before anything is removed.
Each entry should name the file, the reason it is a delete candidate, and
where its surviving content (if any) now lives. Do not delete research notes
that contain negative results unless the negative result is preserved in
`research/negative_results.md` or the new project-state file.

Archive convention:

- move inactive plans to `plans/archived/`;
- preserve historical review files under `research/reviews/`;
- if larger archival cleanup is needed, create a `research/archive/` directory
  only after listing the intended contents.

## Workstream D: Compact the iteration log

Do not erase the full audit trail without first preserving it.

Preferred structure:

- move the current full `research/iteration_log.md` to an archive file such as
  `research/iteration_log_full_1_43.md`;
- replace `research/iteration_log.md` with a compact era-based summary;
- include pointers back to the full log and key review files.

Suggested eras:

1. Iterations 1-6: dimensional selection and intervention split.
2. Iterations 7-15: response geometry, killed minimum-complexity claim, core
   proposition sketches.
3. Iterations 16-26: book propagation and rigor repairs.
4. Iterations 27-34: application discipline and promotion gates.
5. Iterations 35-43: adaptive-hardening boundary, policy gate, manuscript
   freshness.

Each era should list:

- main question;
- result;
- killed or narrowed claim;
- live carry-forward;
- canonical files.

## Workstream E: Open/closed question map

Split the current question map into:

- `research/closed_questions.md`
- `research/open_questions.md`
- possibly `research/parked_questions.md`

Closed does not mean solved universally. It means closed under the project's
current license, for example:

- dimension count alone does not determine hidden harm;
- covariance is only a local/conditional primitive, not a finite-pressure
  summary;
- minimum-complexity attraction is not generic;
- selection/intervention boundary is representation-relative;
- adaptive hardening has only the narrow deterministic finite-channel capacity
  result.

Open questions should be shorter and grouped around decisions the project
might actually pursue next:

- primitive estimation;
- stochastic filtering and repair budgets;
- endogenous-stakes fixed points;
- changing measured sets or deficits;
- shared bottlenecks and nonconvex response geometry;
- real-domain frontier characterization;
- predeclared response-geometry/complexity-attractor tests;
- formalization of core math in Lean or a consolidated core document.

A question without a failure condition should not remain in
`research/open_questions.md` as active work. Park it instead.

## Workstream F: Core-math document and next-mode decision

End the consolidation pass with two outputs: the `research/core-math.md`
document (default era-1 deliverable) and a short written next-mode memo.

### Default deliverable: `research/core-math.md`

Produce a single canonical theorem document that strips away iteration
history, applications, and narrative framing. Era 1 closes with this file
existing whether or not Lean work begins.

**Anti-duplication rule.** The book is the authoritative source for proofs
and discursive context. `core-math.md` is a minimal reference: theorem
name, precise hypotheses, statement, dependency on other theorems,
non-license / non-transfer clauses, and a pointer back to the book section
that proves it. **No proof prose lives in both files.** If a proof is in
the book, `core-math.md` cites the book section; if a derivation only lives
in `core-math.md`, the book should reference it and not restate.

Required contents:

- The stable theorem set: coordinate-explicit selection bound,
  value-weighted/operator bound, Stackelberg wedge, convex score-deficit
  budget `m(d)`, additive exchange-rate condition `h_j = c w_j`,
  deterministic adaptive-hardening capacity boundary `S(M) < d²/(2V)`.
- Stable definitions referenced by these theorems: `U`, `K_theta`,
  `W_theta`, selection drift, value metric, intervention cost geometry,
  `H_per`, `H_pop`, `S(M)`.
- Dependency map: which theorems rely on measure theory, finite-dimensional
  convexity, separable quadratic costs, declared value metrics.
- Non-transfer clauses: what each theorem does not license.
- Book pointers: section/proposition number for each statement's proof.

What `core-math.md` is **not**:

- not a tutorial — no motivation prose, no examples, no applications;
- not a duplicate of the book's Part II — bare statements only;
- not a Lean blueprint — the lean roadmap can reference it but
  `core-math.md` itself is human-readable theorem text, not Lean-flavored;
- not an audit log — claim audits stay in `research/claim_audits.md`.

This document is independently auditable by a mathematician or LLM and is
the gate for any future Lean work, without committing era 1 to starting Lean.

### Next-mode memo

After `core-math.md` exists, write a short memo at
`research/next_mode_decision_after_iteration43.md` deciding what comes next.
The memo is a standalone artifact: a future reader (human or LLM) should be
able to find it without re-reading the project-state file.

Options:

1. **Era-1 finishing path (default).**
   Run `spine-refactor.md`, `prose-pass.md`, `polish.md` in order. Era 1
   closes with the book, abstract, and `core-math.md` as the three
   reader-facing deliverables.

2. **Continue open-ended research before finishing era 1.**
   Choose only if a live question has a named falsifier and a clear file
   target that would change the manuscript. Otherwise it adds audit history,
   not clarity.

3. **Start Lean now (era-2 launch inside era 1).**
   Do not choose this. Era 2 is deliberately deferred; Lean starts after
   era 1's deliverables are committed. See
   `could-do/lean_validation_roadmap.md`.

Decision criteria for the memo:

- Are the target definitions stable enough that `core-math.md` will not
  churn during the spine refactor?
- Is there a theorem-shaped core worth formalizing later? (Used to size
  `core-math.md`'s scope, not to start Lean now.)
- Are open questions still productive, or mostly vague pressure to continue?
- Would another research iteration change the manuscript, or just add audit
  history?
- Which artifact would make the project easiest for a skeptical human reader
  to evaluate?

## Verification

At the end of the pass:

- run targeted `rg` checks for stale phrases introduced by the old project
  scope, especially `minimum-complexity`, `conservation of weirdness`,
  `policy`, `optimal-policy`, `persistent cycle`, and `endogenous V`;
- run `git diff --check`;
- run `git status --short`;
- do not run book/PDF builds unless manuscript sources changed.

## Non-goals

- no new mathematical conjecture rescue;
- no broad policy prose;
- no empirical welfare or research-value inference;
- no new simulations unless the decision memo selects a concrete research
  question that needs one;
- no deletion of audit material before its surviving content is summarized or
  archived;
- no substantive book/paper restructuring (that is `spine-refactor.md`'s job
  and runs after this pass).
