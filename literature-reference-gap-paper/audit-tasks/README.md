# Gap-paper audit — hand-off & task sequence

**For a clean Claude instance picking this up.** Goal: *land* the citation-gap
literature review with enough rigor that the central claim — "the AI-safety
Goodhart literature does not cite the economics/management/accounting prior art
that contains the same math" — survives a hostile referee. The gap has stood in
the field for years; we are now spending tokens and multi-LLM deep-research
queries freely to nail it. Accuracy and auditability beat speed.

## Read first (context, in this order)

1. `../plan.md` — the gap paper's overall plan, positioning, contribution.
2. `../citation-audit/audit.md` — current 25-paper coded table, **the coding
   scheme, the name-collision rules**, the reverse sweep, caveats. This is the
   shared reference every task depends on.
3. `../citation-audit/findings.md` — the refined thesis ("gap real but localized
   to the performance-measurement branch") and the original open items.

## How to run this

- **One task file per fresh instance.** Each `NN-*.md` is self-contained:
  objective, dependencies, protocol, output artifact, done-criteria, guardrails.
  Do not start a task until its `Depends on` tasks are done.
- **Execute precisely; do not widen scope.** If a task surfaces new work, record
  it as a note in `findings.md` for a future task — do not absorb it mid-task.
- **Every claim auditable.** Record the method (API + query + date, or PDF + grep
  term) for each cell/count. Flag anything unverifiable rather than guessing.

## Shared conventions

- **Coding scheme & name-collision rules:** defined once in `audit.md` ("Coding
  scheme" + "Name-collision rules"). Reuse verbatim; never re-invent per task.
- **Data sources:** Semantic Scholar Graph API and OpenAlex for reference lists
  and citation counts; arXiv/published PDF (`pdftotext`) as the authority when a
  list is large or an API is empty/rate-limited. S2 is often rate-limited on the
  shared pool — fall back to OpenAlex.
- **Autonomous vs. external research.** The agent runs API sweeps and spawns its
  own web sub-agents directly. For the heavy *adversarial* passes, the agent
  **writes the deep-research prompts and hands them to the user** to run on
  external ChatGPT / Claude / Gemini deep research, then stores and synthesizes
  the pasted results — exactly the proven harness in
  `../../research/threads/lit_review/looking-for-exchange-rate-results/`
  (optimistic + pessimistic prompts × 3 models, synthesized in a README).
- **Where outputs go:** `../citation-audit/` for consolidated artifacts; raw
  multi-LLM passes in a per-task subfolder (e.g.
  `../citation-audit/exceptions-hunt/`). Each task says exactly where.
- **Close each task** by appending a dated one-paragraph result note to
  `findings.md` and ticking its box in this README's checklist below.

## The sequence

| # | Task | Depends on | One line |
|---|------|-----------|----------|
| 01 | `01-freeze-corpus.md` | — | Reproducible corpus protocol; freeze N (≈30–40) |
| 02 | `02-verify-existing-coding.md` | 01 | Double-code the existing 25; line-verify big-list & survey negatives |
| 03 | `03-code-new-corpus.md` | 01 | Code the papers added by 01, double-checked |
| 04 | `04-forward-citation-census.md` | — | Quantitative reverse sweep: who cites each econ paper; count AI |
| 05 | `05-exceptions-hunt.md` | 04 | Multi-LLM adversarial hunt for EVERY AI↔econ bridge/exception |
| 06 | `06-primary-source-verification.md` | — | Verify econ "should-be-cited" results at source; scope decision |
| 07 | `07-bridge-and-why.md` | 04,06 | Lock the BBS bridge; gather evidence for the "why the gap" claims |
| 08 | `08-synthesize-and-close.md` | 01–07 | Consolidate, freeze, refs.bib, flip status to "audit closed" |

Recommended order is the table order. 04 and 06 are independent of 01–03 and can
run earlier if a fresh instance wants them, but do 01 before any coding task.

## Checklist (update as tasks land)

- [ ] 01 corpus frozen
- [ ] 02 existing coding verified
- [ ] 03 new corpus coded
- [ ] 04 forward-citation census
- [ ] 05 exceptions hunt
- [ ] 06 primary-source verification + scope
- [ ] 07 bridge + why
- [ ] 08 synthesized & audit closed

**Start here:** task 01.
