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
- **Gate — `spine.md` approval.** User decision, not LLM work. Note on
  semantics: `spine.md` is a specification, not a task list. "Drafted and
  meets its definition of done" means the document is complete enough to
  evaluate; "approval" means the user endorses its central question, core
  answer, and section roles as the thesis the book must serve. Approval
  does not archive it — it stays the governing reference through Phases
  1–2 and moves to `archived/` only after the manuscript rewrite lands.
- **Phase 1 — `spine-v3.md`.** After the gate: expand `spine.md` into a
  section-by-section manuscript spine per crystallization stage 5 below,
  reviewed section-by-section.
- **Phase 2 — structural rewrite.** Rewrite the manuscript to spine v3.
  Before executing, reconcile `polish.md` Phase 2/3 sections 1, 4, 5
  against `spine-v3.md` and strike what the rewrite absorbs.
- **Phase 3 — local polish and prose.** Remaining `polish.md` Phase 2/3
  items (sections 2, 3, 6–9, 12), then `prose-pass.md`. Note prose-pass
  section references predate the seven-part spine; re-map them against the
  then-current draft before editing.
- **Phase 4 — figures and final hygiene.** `polish.md` section 10 figure
  work, then re-run the completed Iteration-47 hygiene checks
  (reproducible build, refs.bib audit, cross-file consistency).

## Active plan files

- `spine.md` — compact source of truth for the next manuscript spine;
  drafted, awaiting user approval (the pipeline gate).
- `04_06_2026_human_review.md` — active raw human-review notes on the book
  PDF. Source material; actionable items are distilled into `polish.md`.
- `polish.md` — Phase 0 consistency fixes (executable now) plus the
  structural polish pass (Phases 2–4).
- `prose-pass.md` — line-level prose cleanup; Phase 3.
- `exchange-rate-empirics.md` — research-side track, runs in parallel with
  the manuscript pipeline (not gated by spine approval): mine existing
  hidden-harm evaluations (HRRP, education accountability, NHS targets,
  reward-model overoptimization) as h_j exchange-rate evidence, plus the
  channel-level
  identification question. Book integration lands Phase 2+ via spine roles
  9 and 12.

Completed or superseded plans are in `archived/`. Optional future work lives in
`could-do/`.

## Current direction: crystallization before spine v3.0

### Hard rule

Do not structurally rewrite `book/multidimensional-goodhart.typ` until
`spine.md` is user-approved. The manuscript may be read as source material;
it is not the active editing target.

**Carve-out (June 9, 2026):** `polish.md` Phase 0 consistency fixes
(undefined symbols, symbol collisions, stale pointers, citation hygiene) are
spine-neutral line edits, not structural rewriting, and may run before the
gate.

### Why crystallization, why now

The trigger is concrete: the argument cannot currently be stated in one
or two sentences. The manuscript has results, a stable math spine, and an
abstract, but no single thesis that the rest of the document obviously
serves. Further structural editing on the book before that thesis is fixed
would be premature.

This is a narrowing step, not another manuscript rewrite. It should produce the
claim that later editing serves, or fail quickly enough that direct editing can
resume without much lost motion.

**Abandonment criterion.** A wall-clock budget plus user judgment: if
`spine.md` is not approved within roughly one week of focused work, or if
the user calls the process stuck before then, drop crystallization and
return to direct editing under the constraint that every change must name
the claim it is in service of.

### Target artifact: `spine.md`

`spine.md` is the compact, mostly non-mathematical source of truth that
future section planning and manuscript rewriting must obey. It is not a
scratchpad.

**Definition of done for `spine.md`:**

- ≤ 2 pages.
- Central question stateable in one sentence.
- Core answer stateable in 2–3 sentences, without theorem inventory.
- Each prospective section named with a one-sentence role.
- Refused claims listed explicitly.
- Reader-interest order honored: context → challenge → typical approach →
  limitations → proposal and desired properties → evaluation method →
  roadmap.

### Process

Five stages, each gated on user approval. The LLM drafts; the user decides.

1. **Lock the question and the answer.** LLM proposes 3–5 candidate central
   questions and, for each, a plain-language answer separating main result,
   strongest support, and what remains open. User selects or revises both
   together — question and answer co-determine each other. *Gate:* question
   + answer pair is locked before moving on.

2. **Lock the contribution stack and the comparison target.** LLM maps the
   answer to conceptual / formal / methodological contribution, implications,
   and open questions, then names the specific limitation in the typical
   approach the manuscript responds to (scalar Goodhart slogans, unlicensed
   theorem transfer, generic dimensionality claims, score-only
   interpretation, insufficient response modeling, …). User picks the
   primary contribution level and approves the comparison target. *Gate:*
   contribution hierarchy and limitation are sharp and fair.

3. **State the proposal and desired properties.** LLM drafts the proposal
   in non-technical terms and proposes desired properties: declaring the
   response channel before calculation, separating selection from
   intervention, separating private affordability from welfare, naming
   hidden value or harm before scorecard claims, making failure conditions
   explicit. User marks each property essential or supporting. *Gate:*
   success criteria are explicit.

4. **Choose the evidence mix.** LLM proposes how to convince the reader:
   formal theorem inventory, killed-claims gallery, falsifiers, worked
   stress-test cases, literature primitive-attribution table. User decides
   the mix and what belongs in `spine.md` vs. later. *Gate:* proof and
   evidence strategy agreed.

5. **Draft `spine.md`, then spine v3.0.** First produce `spine.md` per the
   definition of done above. After user approval, expand it into spine v3.0:
   a section-by-section manuscript spine in a separate file (`spine-v3.md`),
   reviewed section-by-section. Only after spine v3.0 is approved does the
   manuscript source change.

### Reader-interest mapping

Stage 1 supplies the challenge and the proposal-answer. Stage 2 supplies
the typical approach and its limitations. Stage 3 supplies the proposal
and desired properties. Stage 4 supplies the evaluation method. Stage 5
supplies the roadmap and section roles.

## Era-1 audit trail

The Era-1 closure planning is archived at
[`archived/era1-closure-history.md`](archived/era1-closure-history.md).
Superseded for active planning by the crystallization process above.
