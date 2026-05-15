# Meta-consolidation after Iteration 43

Purpose: after Iteration 43 concludes, pause open-ended iteration work long
enough to clarify what the first 43 iterations achieved, what they closed, what
they left open, and what the project should become next.

This is not Iteration 44 research. It is a project-state consolidation pass.
Do not use it to add new theorem claims, application claims, policy advice, or
speculative research threads.

## Trigger

Start only after:

- Iteration 43 manuscript review and scoped book/paper/abstract changes are
  complete;
- generated PDFs and source edits from Iteration 43 have either been committed
  or explicitly parked;
- `git status --short` has been checked so the consolidation pass does not
  overwrite in-progress manuscript work.

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

## Scope Clarification

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

Create a file such as `research/project_state_after_iteration43.md`.

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

## Workstream B: Scope Edits

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

- substantive book edits;
- compact-paper edits beyond Iteration 43;
- new simulations;
- new research threads.

## Workstream C: Archive/Delete Pass

Use a three-way disposition for each candidate file:

- **canonical:** current source of truth;
- **archive:** historically useful but no longer active;
- **delete:** obsolete generated artifact, superseded scratch, or dead approach
  with no audit value.

Likely archive candidates:

- completed root-level plans whose work is fully represented elsewhere;
- old approach plans in `plans/archived/` if they should be grouped by era;
- review files that are useful audit trail but not active reading material.

Likely delete candidates should be handled conservatively and listed before
removal. Do not delete research notes that contain negative results unless the
negative result is preserved in `research/negative_results.md` or the new
project-state file.

Archive convention:

- move inactive plans to `plans/archived/`;
- preserve historical review files under `research/reviews/`;
- if larger archival cleanup is needed, create a `research/archive/` directory
  only after listing the intended contents.

## Workstream D: Compact the Iteration Log

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

## Workstream E: Open/Closed Question Map

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

## Workstream F: Next-Mode Decision

End the meta pass with a written decision memo.

Options:

1. **Continue open-ended research.**
   Choose this only if there is a sharply named next research question, a
   falsifier, and a clear file target.

2. **Create `research/core-math.md`.**
   Choose this if the main need is one coherent mathematical spine that strips
   away iteration history and applications.

3. **Begin Lean formalization.**
   Choose this only after `core-math.md` identifies a small, stable theorem set
   with formalization value. Good candidates are finite-dimensional selection
   drift bounds or the deterministic adaptive-hardening capacity boundary.

4. **Book/paper consolidation mode.**
   Choose this if the math is stable enough and the main bottleneck is reader
   experience, figure quality, and proposition ordering.

Decision criteria:

- Are the target definitions stable?
- Is there a theorem-shaped core worth formalizing?
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
  archived.
