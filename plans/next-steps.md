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
- **Phase 4 — figures and final hygiene. DONE June 9, 2026.** Polish §10
  executed (Figure 1 block-diagram redesign; Figure 2/3/4 labeling and
  caption fixes; all four figures visually inspected). Hygiene re-run
  green: deterministic full rebuild (`make all`, clean tree after),
  all simulation suites pass (`research/simulations make run`,
  iterations 20/21/27/36), refs.bib has zero orphans and all citations
  resolve, claim_audits.md rows match the current T1–T6.

**The manuscript pipeline is complete.** The eight-part spine-v3 book and
its abstract are built, polished, and hygienic. What remains is research
and publishing work, not editing pipeline work.

## Active plan files

- `exchange-rate-empirics.md` — the active track: mine existing
  hidden-harm evaluations (HRRP, education accountability, NHS targets,
  reward-model overoptimization) as h_j exchange-rate evidence, plus the
  channel-level identification question. Book integration re-enters via
  the Part 6 placeholder table row and the Part 8 identification
  question.

Parked ideas (from the spine-v3 review and pipeline closeout):
- Splitting Part 7 ("Using the Framework") into its own standalone essay —
  flagged non-blocking during the spine-v3 review.
- `could-do/supporting-artifacts.md` — worked ML contract, toy notebook,
  Lean starting points (extracted from polish.md §11).

Completed or superseded plans are in `archived/`; recently archived:
`spine.md` and `spine-v3.md` (the executed spine artifacts),
`prose-pass.md` and `polish.md` (executed ledgers, kept as audit records),
`04_06_2026_human_review.md` (raw notes, fully distilled). Optional future
work lives in `could-do/`.

## Process history

The crystallization process that produced the spine (hard rule, five gated
stages, reader-interest mapping) completed June 9, 2026 and is archived at
[`archived/crystallization-history.md`](archived/crystallization-history.md).
The Era-1 closure planning before it is archived at
[`archived/era1-closure-history.md`](archived/era1-closure-history.md).
