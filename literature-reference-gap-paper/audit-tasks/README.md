# Gap-paper audit — hand-off & task sequence

**For a clean Claude instance picking this up.** Goal: *land* the citation-gap
literature review with enough rigor that the central claim — "the AI-safety
Goodhart literature does not cite the economics/management/accounting/statistics
prior art that contains the same math" — survives a hostile referee. The gap has
stood for years; we are now spending tokens and multi-LLM deep-research queries
freely to nail it. Accuracy and auditability beat speed.

## The shape of this sequence (read this first)

The work is **discovery-first, freeze-last**. The existing 25-paper pass
(`../citation-audit/audit.md`, `findings.md`) was assembled by *narrow* hunts —
T5/exchange-rate congruity alternatives and one "look outside ML" sweep. It is a
**seed, not a corpus.** We must comprehensively discover the full related
literature on **both sides** (the AI corpus we audit, and the cross-field prior
art it should cite) and map the bridges **before** freezing a denominator.
Freezing earlier would bake in selection bias and sink the bibliometric claim.

- **Phase 1 — Discovery (01–04):** saturate the literature, both sides + bridges.
- **Phase 2 — Freeze & code (05–07):** freeze once saturated, then code + double-code.
- **Phase 3 — Verify & contextualize (08–09):** primary sources + the "why."
- **Phase 4 — Close (10):** synthesize, freeze, flip status.

## Read first (context, in this order)

1. `../plan.md` — the gap paper's overall plan, positioning, contribution.
2. `../citation-audit/audit.md` — the seed 25-paper table, **the coding scheme,
   the name-collision rules**, the reverse sweep, caveats. The shared reference.
3. `../citation-audit/findings.md` — refined thesis ("gap real but localized")
   and known exceptions (CHAI lineage, BBS bridge).

## How to run this

- **One task file per fresh instance.** Each `NN-*.md` is self-contained. Do not
  start a task until its `Depends on` tasks are done.
- **Execute precisely; do not widen scope.** New work a task surfaces → record it
  as a note in `findings.md` for a later task; don't absorb it mid-task.
- **Every claim auditable.** Record the method (API + query + date, or PDF + grep
  term) per cell/count. Flag unverifiable items rather than guessing.

## Shared conventions

- **Coding scheme & name-collision rules:** defined once in `audit.md`. Reuse
  verbatim; never re-invent per task.
- **Data sources:** Semantic Scholar Graph API + OpenAlex for reference lists and
  citation counts; arXiv/published PDF (`pdftotext`) as authority for long lists
  or empty/rate-limited APIs (S2's shared pool rate-limits often → use OpenAlex).
- **Autonomous vs. external research.** The agent runs API sweeps and spawns web
  sub-agents directly. For the heavy *adversarial* passes it **writes the
  deep-research prompts and hands them to the user** to run on external ChatGPT /
  Claude / Gemini deep research, then stores + synthesizes the pasted results —
  the proven harness in
  `../../research/threads/lit_review/looking-for-exchange-rate-results/`.
- **Where outputs go:** `../citation-audit/` for consolidated artifacts; raw
  multi-LLM passes in per-task subfolders (e.g. `../citation-audit/exceptions-hunt/`).
- **Adversarial harness method (reuse the T5 recipe).** When running the
  optimistic/pessimistic × ChatGPT/Claude/Gemini passes: (a) **name the suspected
  classical result explicitly in the prompt** so the models pattern-match — this
  is exactly what avoids the Goodhart-only false negative that started this
  program; (b) **the spread is the signal** — record where the optimistic and
  pessimistic framings and the three models *disagree*, not just the consensus;
  (c) **synthesis output follows the T5 README format** (verdict · consolidated
  closest-prior-art table · what survives as contribution · where the passes
  diverged · caveats), per
  `../../research/threads/lit_review/looking-for-exchange-rate-results/README.md`.
- **Close each task** by appending a dated result note to `findings.md` and
  ticking its box below.

## Relationship to Track A — unified discovery (do not double-run)

**Tasks 01–04 (+ 08) ARE the project's unified cross-field discovery (shared
Phase 0)** — see `../../plans/litrev-discovery.md` for the spec, anchor,
plan-invalidating gate, and blocking graph. They serve *both* paper-1 tracks:
Track A (`../../plans/litrev-selection-bounds.md`, `litrev-convex-budget.md`,
`litrev-lower-tier.md`, capstone `novelty-refactor.md`) consumes them for
per-theorem cite-and-reframe; the gap paper consumes them for the aggregate
citation-gap claim + dictionary. **Their outputs go to the neutral home
`../../research/threads/lit_review/cross-field-discovery/`, not this folder**, so
both tracks read the same artifacts. Run discovery once; neither track runs
independent cross-field searches.

Tasks **05–10** are gap-paper-specific (freeze its corpus view, code, verify,
why, synthesize) and write to `../citation-audit/`. Task 04 is the confirming
gate for the plan-invalidating question — if it shows no real gap / no BBS delta,
stop before 05–10.

## The sequence

| # | Task | Depends on | One line |
|---|------|-----------|----------|
| 01 | `01-discover-ai-corpus.md` | — | Broad multi-modal hunt: all AI/ML proxy-divergence work (superset of the 25) |
| 02 | `02-discover-prior-art-econ.md` | — | Comprehensive cross-field hunt: econ / accounting / management / welfare / public finance |
| 03 | `03-discover-prior-art-formal.md` | — | Comprehensive hunt: statistics / estimation / DRO / OR / control / index-number |
| 04 | `04-bridge-mapping.md` | 01,02,03 | Census + multi-LLM adversarial hunt for ALL AI↔prior-art bridges; lock BBS |
| 05 | `05-freeze-corpus.md` | 01–04 | Freeze the AI corpus + prior-art tier scheme — *now justified by saturation* |
| 06 | `06-code-corpus.md` | 05 | Code the full frozen corpus (first pass) |
| 07 | `07-verify-coding.md` | 06 | Independent double-code; PDF-grep big lists; line-verify negatives |
| 08 | `08-primary-source-verification.md` | 02,03 | Verify prior-art statements at source; theorem-family scope |
| 09 | `09-why-the-gap.md` | 04,07 | Evidence the mechanisms (vocabulary probe, citation-graph siloing) |
| 10 | `10-synthesize-and-close.md` | 01–09 | Consolidate, freeze, refs.bib, flip status to "audit closed" |

Discovery tasks 01–03 are independent and may run in parallel; 04 needs all
three; nothing freezes (05) until 01–04 have saturated. 08 needs only the
prior-art discovery (02,03) and can run early.

## Checklist (update as tasks land)

- [x] 01 AI corpus discovered (saturated) — `cross-field-discovery/ai-corpus.md`
- [x] 02 prior art discovered — econ/management side (saturated) — `prior-art-econ.md` (autonomous; adversarial breadth passes in `prior-art-hunt/` pending user)
- [x] 03 prior art discovered — formal-math side (saturated) — `prior-art-formal.md`
- [~] 04 bridges mapped + BBS locked — `bridges.md` (census/vocab/BBS + gate verdict done; **adversarial exceptions hunt pending user**, prompts in `exceptions-hunt/`)
- [ ] 05 corpus + tier scheme frozen
- [ ] 06 full corpus coded
- [ ] 07 coding double-verified
- [x] 08 prior-art primary sources verified + scope set — `prior-art-verification.md`
- [ ] 09 why-the-gap evidenced
- [ ] 10 synthesized & audit closed

**GATE (task 04) preliminary verdict: PASS — gap real + BBS delta real. HARD STOP
before 05–10 / Track A** until the adversarial multi-LLM passes are run and
synthesized. See `cross-field-discovery/bridges.md` § GATE VERDICT.
