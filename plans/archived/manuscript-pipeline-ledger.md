# Manuscript pipeline ledger (completed June 9, 2026)

Archived verbatim from `next-steps.md` during the June 9 plans housekeeping,
after the pipeline closed. Kept as the audit record of the phased execution.

## Execution pipeline

Phases run in order. An LLM iteration should pick the earliest phase that is
unblocked, finish or hand off cleanly, and not reach into later phases.

- **Phase 0 — spine-neutral consistency fixes.** `polish.md` Phase 0:
  undefined notation, symbol collision, stale core-math.md pointers,
  bibliography loose ends, repo-internal references, falsifier framing. These
  survive any spine restructuring, which is the carve-out from the hard rule
  below. Items 0.7 and 0.8 needed user input; batch ended with a user
  check-in before commit. Executed June 9, 2026 (Iteration A).
- **Gate — `spine.md` approval. PASSED June 9, 2026.** The user approved
  the central question, core answer (T5 exchange-rate focus), and section
  roles after discussion. Phase 1 unblocked. Note on semantics:
  `spine.md` is a specification, not a task list — it stayed the governing
  reference through Phases 1–2 and moved to `archived/` only after the
  manuscript rewrite landed. The exchange-rate-empirics track feeds its
  section roles 9 and 12 at Phase 2+.
- **Phase 1 — `spine-v3.md`. DONE June 9, 2026.** Drafted, reviewed
  section-by-section, and approved the same day (five open questions
  resolved in review; resolutions recorded inline in the file).
- **Phase 2 — structural rewrite. DONE June 9, 2026.** Manuscript rewritten
  to the eight-part spine v3 (three commits); abstract reorganized per the
  first-page rule; subtitle now "Measurement Dimensions, Exchange Rates,
  and Hidden Harm"; core-math.md pointers and book README updated;
  `polish.md` Phase 2/3 reconciled (see its reconciliation ledger);
  `spine.md` archived per the gate-note semantics.
- **Phase 3 — local polish and prose. DONE June 9, 2026.** The Phase 2
  rewrite had absorbed most items; the residue was the "licenses" sweep,
  the H–M lit-note verification, and a five-edit read-through pass (see
  the polish.md ledger and prose-pass.md final status).
- **Phase 4 — figures and final hygiene. DONE June 9, 2026.** Polish §10
  executed (Figure 1 block-diagram redesign; Figure 2/3/4 labeling and
  caption fixes; all four figures visually inspected). Hygiene re-run
  green: deterministic full rebuild (`make all`, clean tree after),
  all simulation suites pass (`research/simulations make run`,
  iterations 20/21/27/36), refs.bib has zero orphans and all citations
  resolve, claim_audits.md rows match the current T1–T6.

## Post-pipeline editing round (same day)

After pipeline closure, a three-review editing round ran June 9, 2026 and is
the project's "editing done" milestone:

- Fresh-context seam pass (Opus, cold context):
  `quality-checks/09_06_2026_fresh_context_seam_pass.md` → fix batch 1
  (commit 607219d).
- Cold read of the built PDF in the June 4 raw-notes style:
  `quality-checks/09_06_2026_cold_read_pdf.md` → fix batch 2
  (commit e5dca88).
- External GPT-5 review, triaged:
  `quality-checks/09_06_2026_gpt5_review_triage.md` → fix batch 3
  (commit a5d3b1c), including the T5 universal-iff precision fix that also
  touched core-math.md and claim_audits.md.
