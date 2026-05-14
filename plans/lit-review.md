# Literature review integration plan

## Context

This plan covers Stages 3–6 of the lit-review integration work. Stages 1–2
(folder consolidation, triage, primary-source verification, plan-file
creation) have been executed; their outputs live in
`research/threads/lit_review/` (README + verification notes + Gemini
outputs + Codex's ML survey).

Inputs available at the start of Stage 3:

- `research/threads/lit_review/README.md` — triage table for all sources.
- `research/threads/lit_review/verification_notes.md` — verified theorem
  statements for El-Mhamdi 2024, Skalse 2023, Skalse 2022, Majka–El-Mhamdi
  2025; deferred-verification notes for the rest.
- `research/threads/lit_review/ml_formal_analogue_survey.md` §3 — Codex's
  ML primitive-map table, ready to extend.
- `research/threads/lit_review/gemini_*.md` — Gemini Prompts 1 and 2
  outputs (genealogy table reusable near-verbatim).
- `plans/formal-analogue.md` — late chapter plan, including queued Gemini
  Prompts 3–8 and the chapter-vs-appendix downgrade clause.

Guardrails (Codex): "let the lit review constrain the framework, but do
not let it bloat the project into a survey." No source enters the
framework unless it maps to a primitive.

## Pre-Stage-3 — Anchor decision

Before Stage 3 can finalize the primitive-map table, the Chapter 2 scalar
anchor must be picked. Options (verbatim from master plan):

1. **El-Mhamdi anchors Chapter 2, Skalse 2023 cited in late
   formal-analogue chapter.** Recommended.
2. **Skalse 2023 anchors Chapter 2, El-Mhamdi cited in the late chapter.**
3. **Both anchor.** Rejected unless explicitly requested.

User is finishing the El-Mhamdi paper at time of writing. Once the choice
is made:

- Record decision and reasoning in `plans/formal-analogue.md`.
- Reproduce the chosen theorem statement verbatim from the paper in the
  plan.

## Stage 3 — Primitive Map Table

Goal: produce the canonical artifact at
`research/reviews/formal_analogue_lit_map.md`.

Format:

- One unified table with rows from both ML and econ sides.
- Columns: source / theorem, primary citation, framework primitive
  (selection / response-kernel / action-cost / proxy-target / aggregation
  / evidence-standard), what it licenses inside the framework, what it
  does not license, falsifier / non-transfer condition.
- Extend rather than redo Codex's `ml_formal_analogue_survey.md` §3
  table.

Sub-tasks:

1. **Copy Codex's ML rows.** Bring §3 rows in unchanged; tighten only if
   the assumption-clash audit (sub-task 3 below) surfaces issues.
2. **Add anchor row.** From Stage 1 verification notes — El-Mhamdi or
   Skalse 2023 per the anchor decision.
3. **Add econ rows.** Initial set: Lucas 1976, Holmström–Milgrom 1991.
   Add more only after running Gemini Prompts 3–8 from
   `plans/formal-analogue.md` if budget allows.
4. **Assumption-clash audit.** Cross-check each surveyed paper's
   assumptions against the book's existing propositions:
   - Does Chapter 3's selection-channel proposition assume independence
     (as El-Mhamdi does)? Read `book/multidimensional-goodhart.typ`
     around lines 668–930 (Chapter 3 selection chapter) and the
     `research/threads/selection_response.md` thread to settle this. If
     independence is assumed, Majka–El-Mhamdi 2025 becomes a candidate
     "extends the anchor" citation. If independence is not assumed,
     the book's contribution is partial independent rediscovery and
     should be flagged in §2.3 / late chapter accordingly.
   - Skalse 2023's occupancy-measure + linear-reward + concave-
     optimization assumptions do not transfer. Note explicitly.
   - Lucas critique requires rational expectations. Holmström–Milgrom
     requires linear contracts in the LEN benchmark.
5. **Genealogy vs theorem boundary.** Final call per source. Genealogy
   items (Goodhart 1975, Campbell 1976/1979, Strathern 1997, Manheim–
   Garrabrant 2018) do not get table rows; they appear only in Chapter 2
   §2.1 prose.
6. **Update research/claim_audits.md and research/red_flags.md** if
   the audit surfaces inconsistencies. If no inconsistencies, append a
   single audit row noting the lit-review supplement was clean.

Stage 3 gate: `formal_analogue_lit_map.md` exists with rows from
ML + anchor + at least Lucas and Holmström–Milgrom on the econ side;
assumption-clash audit is documented in the file; any
claim-audit/red-flag updates are committed.

## Stage 4 — Decide chapter vs appendix

Goal: lock in the late formal-analogue chapter's status per
`plans/formal-analogue.md`'s downgrade clause.

- Count rows in `formal_analogue_lit_map.md` that have all four
  promotion criteria: primary citation + primitive map + falsifier +
  "does not license" sentence.
- ≥3–5 rows → real chapter. Otherwise → appendix.
- Update `plans/formal-analogue.md` with the decision and the row count.

Stage 4 gate: decision recorded in `plans/formal-analogue.md`.

## Stage 5a — Chapter 2 book integration

Goal: insert the early lit-review chapter at line 397 of
`book/multidimensional-goodhart.typ`.

This stage is distinct from Stage 5b. Codex's plan does not cover it.

Target length: approximately 5 pages of rendered output.

Structure:

- **§2.1 Genealogy** (~1.5 pp). Lucas as the sole formal-status
  genealogy item, one paragraph. Goodhart 1975, Campbell 1976/1979,
  Strathern 1997 collectively in one paragraph as pre-formal context.
  Build from the Gemini Prompt 2 structured table near-verbatim.
- **§2.2 Manheim–Garrabrant typology** (~0.5 pp). Present taxonomy with
  explicit "not a theorem" status. Position the response-modeling
  contract (Chapter 6) as where a Goodhart claim declares which type it
  is.
- **§2.3 Scalar anchor proposition** (~2 pp). State the chosen anchor
  theorem in book notation. Cite original paper. Single-line citation of
  Smith & Winkler 2006 as precursor inequality, only if Stage 3 retained
  it. Load-bearing sentence: "Chapter 3's selection-channel propositions
  generalize this scalar bound to multidimensional V."
- **§2.4 What this chapter does not generalize** (~0.5 pp). Strathern,
  Campbell, M–G typology. Brief.

Other Stage 5a sub-tasks:

- **Audit existing intro for overlap.** Lines 60–397 contain "Why this
  approach," "What looks promising," "What does not look promising."
  Audit for material that should move into Chapter 2 rather than
  duplicating. Lines 60–397 may shrink as a result.
- **Update `book/refs.bib`** with BibTeX entries for every Chapter 2
  citation. Use stable kebab-case keys. Check duplicates against
  Iteration 22 additions.
- **Paper extract update.** Decide whether
  `book/multidimensional-goodhart-paper.typ` should also pick up the
  anchor citation. Default: yes, one-line citation. Recompile via
  `cd book && make paper`.
- **Append iteration log entry.** Label as "Iteration 26 (lit-review
  supplement)" describing the retroactive Chapter 2 insertion. Not a
  re-opening of math-rigor work.

Stage 5a gate: book builds via `cd book && make`; Chapter 2 ≤6 rendered
pages; `refs.bib` parses; `git diff` confirms Chapter 3+ propositions
unchanged.

## Stage 5b — Late formal-analogue chapter execution

Goal: execute `plans/formal-analogue.md` per the Stage 4 chapter-or-
appendix decision.

Position: between current line 1812 ("Application discipline") and line
1845 ("Visual appendices"), per `plans/formal-analogue.md`.

Target length: 6–10 pages of body + the Stage 3 primitive-map table.

Sections (per `plans/formal-analogue.md`):

1. Framing paragraph with falsifier discipline statement.
2. Primitive map (the Stage 3 table, reproduced).
3. ML analogues prose section.
4. Economics analogues prose section.
5. "What this chapter does not license" boundary.

Promotion criteria from `plans/formal-analogue.md` apply: every promoted
row must have primary-source citation + primitive map + falsifier +
"does not license" sentence.

Stage 5b can run in the same book-edit iteration as Stage 5a or be
split — user choice. If appendix per Stage 4, slot at the appendix
section (line 1864+) instead.

Stage 5b gate: book builds; late chapter or appendix is internally
consistent with `formal_analogue_lit_map.md`; falsifier discipline holds
for every promoted row.

## Stage 6 — Close lit-review integration

Goal: avoid letting the lit-review work bloat the project, and leave a clean
handoff once Stages 4, 5a, and 5b are complete.

This stage does **not** reserve an iteration number. Use whatever iteration
number naturally follows the Stage 4 and Stage 5 execution work.

Sub-tasks:

- Confirm the Chapter 2 and late formal-analogue chapter/appendix work is
  complete and build-verified.
- Record any remaining citation or source-verification leftovers as open
  follow-ups, not as blockers to returning to research.
- Point future research to `plans/adaptive-hardening.md`, which records the
  adaptive-hardening / measurement-frontier simulation idea without assigning
  it a fixed iteration number.

Stage 6 gate: lit-review integration is closed; no adaptive-hardening
simulation has been started as part of this plan.

## Critical files

- `plans/formal-analogue.md` — anchor decision recorded; chapter/appendix
  call in Stage 4.
- `research/reviews/formal_analogue_lit_map.md` — created in Stage 3
  (canonical primitive-map artifact).
- `research/threads/lit_review/` — read-only inputs after Stage 1.
- `research/claim_audits.md`, `research/red_flags.md` — possibly updated
  in Stage 3.
- `research/iteration_log.md` — appended in Stages 5a, 5b, 6.
- `research/verification_stack.md` — annotated in Stages 5a, 5b, 6.
- `book/multidimensional-goodhart.typ` — Chapter 2 (Stage 5a) and late
  chapter/appendix (Stage 5b).
- `book/multidimensional-goodhart-paper.typ` — possibly updated in
  Stage 5a.
- `book/refs.bib` — new entries in Stages 5a and 5b.
- `plans/adaptive-hardening.md` — future research plan referenced at
  Stage 6 handoff; not executed by this lit-review plan.

## Reuse

- Codex's ML survey §3 table — backbone of Stage 3 table.
- Gemini Prompt 2 structured genealogy table — backbone of Chapter 2
  §2.1.
- Verification notes (`research/threads/lit_review/verification_notes.md`)
  — source-of-truth for theorem statements in Stage 3 and 5a/5b.
- Existing book voice for falsifier discipline at
  `book/multidimensional-goodhart.typ` ~line 1721 (the contract) and
  ~line 1812 (application discipline).

## Verification

After Stage 3:
- `rg -n "primitive|falsifier|does not license" research/reviews/formal_analogue_lit_map.md`
  shows columns populated per row.
- Every citation in the table resolves to a paper accessible on arXiv
  or in print (no Gemini-numbered-footnote artifacts).

After Stage 5a:
- `cd book && make` builds; Chapter 2 ≤6 rendered pages.
- `git diff book/multidimensional-goodhart.typ` confirms Chapter 3+
  propositions unchanged.
- `book/refs.bib` parses; rendered bibliography includes new entries.

After Stage 5b:
- `cd book && make` builds; new chapter or appendix is consistent with
  Stage 3 table.

After Stage 6:
- Lit-review integration has a closure/handoff note.
- No iteration number is reserved for adaptive hardening.
