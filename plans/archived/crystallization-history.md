# Crystallization process (completed June 9, 2026)

Archived from `plans/next-steps.md` after the full pipeline (crystallization
→ spine → spine v3 → manuscript rewrite → prose pass) completed. All five
stages were executed and gated as designed; `archived/spine.md` and
`archived/spine-v3.md` are the artifacts the process produced.

## Original section: Current direction: crystallization before spine v3.0

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
