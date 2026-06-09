# Next steps

Index for active plans. Individual plans live in sibling files.

## Execution pipeline

Phases run in order. An LLM iteration should pick the earliest phase that is
unblocked, finish or hand off cleanly, and not reach into later phases.

- **Phase 0 — spine-neutral consistency fixes.** Unblocked now.
  `polish.md` Phase 0: undefined notation, symbol collision, stale
  core-math.md pointers, bibliography loose ends, repo-internal references,
  falsifier framing. These survive any spine restructuring, which is the
  carve-out from the hard rule below. Items 0.7 and 0.8 need user input;
  batch ends with a user check-in before commit.
- **Gate — `spine.md` approval. PASSED June 9, 2026.** The user approved
  the central question, core answer (T5 exchange-rate focus), and section
  roles after discussion. Phase 1 is unblocked. Note on semantics:
  `spine.md` is a specification, not a task list — it stays the governing
  reference through Phases 1–2 and moves to `archived/` only after the
  manuscript rewrite lands. The exchange-rate-empirics track feeds its
  section roles 9 and 12 at Phase 2+.
- **Phase 1 — `spine-v3.md`. DONE June 9, 2026.** Drafted, reviewed
  section-by-section, and approved the same day (five open questions
  resolved in review; resolutions recorded inline in the file). Phase 2 is
  unblocked.
- **Phase 2 — structural rewrite. DONE June 9, 2026.** Manuscript rewritten
  to the eight-part spine v3 (three commits); abstract reorganized per the
  first-page rule; subtitle now "Measurement Dimensions, Exchange Rates,
  and Hidden Harm"; core-math.md pointers and book README updated;
  `polish.md` Phase 2/3 reconciled (see its reconciliation ledger);
  `spine.md` archived per the gate-note semantics. Phase 3 is next.
- **Phase 3 — local polish and prose. DONE June 9, 2026.** The Phase 2
  rewrite had absorbed most items; the residue was the "licenses" sweep,
  the H–M lit-note verification, and a five-edit read-through pass (see
  the polish.md ledger and prose-pass.md final status). Phase 4 is next.
- **Phase 4 — figures and final hygiene.** `polish.md` section 10 figure
  work, then re-run the completed Iteration-47 hygiene checks
  (reproducible build, refs.bib audit, cross-file consistency).

## Active plan files

- `polish.md` — manuscript polish ledger; Phases 0–3 executed. Remaining:
  §10 figure work (Phase 4) and the optional §11 repo-side artifacts.
- `exchange-rate-empirics.md` — research-side track, runs in parallel with
  the manuscript pipeline: mine existing hidden-harm evaluations (HRRP,
  education accountability, NHS targets, reward-model overoptimization) as
  h_j exchange-rate evidence, plus the channel-level identification
  question. Book integration re-enters via the Part 6 placeholder table
  row and the Part 8 identification question.

Completed or superseded plans are in `archived/`; recently archived:
`spine.md` and `spine-v3.md` (the executed spine artifacts),
`prose-pass.md` (executed Phase 3), `04_06_2026_human_review.md` (raw
notes, fully distilled into polish.md). Optional future work lives in
`could-do/`.

## Process history

The crystallization process that produced the spine (hard rule, five gated
stages, reader-interest mapping) completed June 9, 2026 and is archived at
[`archived/crystallization-history.md`](archived/crystallization-history.md).
The Era-1 closure planning before it is archived at
[`archived/era1-closure-history.md`](archived/era1-closure-history.md).
