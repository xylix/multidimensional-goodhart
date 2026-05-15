# Next steps

This file is the index for active plans. It states the order of execution and
the reasoning for that order. Individual plans live in sibling files.

## Where the project is

The staged repair sequence (Iterations 35–42) is closed. Iteration 43 added
the manuscript abstract and strengthened its framing. The math spine is stable
under stated conditions: selection δ-reweighting bound (Props 1/1'), additive
conservation iff `h_j = c w_j` (Prop 4), convex score-deficit budget `m(d)`
(Prop 3), deterministic finite-channel adaptive-hardening capacity
(Iteration 35), and the response-modeling contract as the methodological
spine. Six claims are explicitly killed; the conditional toys and
applications are scoped.

The remaining era-1 work is not new research. It is making what survived
legible: consolidate the project state, produce a canonical theorem
document, re-spine the manuscripts around what holds, bring the prose up to
publication quality, and finish figures.

## Era-1 deliverables

Era 1 closes when these artifacts exist and are mutually consistent:

1. **The book** — `book/multidimensional-goodhart.typ`, re-spined per
   `spine-refactor.md`. Long-form, comprehensive, the deep-context
   reference.
2. **The abstract** — `book/multidimensional-goodhart-abstract.typ`, 2–4
   pages, standalone discussion starter. Project motivation, core findings,
   killed claims in compressed form, falsifier, minimal literature
   relation. No deep context (deep context lives in the book).
3. **The theorem document** — `research/core-math.md`. Bare statements,
   hypotheses, dependencies, non-license clauses, and book pointers for
   proofs. Independently auditable by a mathematician or LLM. **No proof
   prose duplicated between this file and the book.**
4. **The project-state registry** — `research/project_state_after_iteration43.md`,
   produced by `consolidation.md` Workstream A. The file a future reviewer
   (human or LLM) reads first.
5. **The question split** — `research/{closed,open,parked}_questions.md`,
   produced by `consolidation.md` Workstream E.
6. **Clean repo** — archive/delete pass complete; `cd book && make` builds
   the book and abstract from a clean checkout; all simulation targets run
   deterministically; `git status --short` is clean after a build.

The medium-length `multidimensional-goodhart-paper.typ` is **deprecated**
during the spine refactor and archived rather than rebuilt. The abstract
absorbs its discussion-starter role; the book absorbs its long-form role.

## Era 2: deliberately open

Era 2 is not chartered here. By the time era 1 closes, the project will have
a clean repo, a re-spined book, a 2–4 page abstract, `core-math.md`, and a
question split. What to do next — whether to start Lean, pursue a new
research thread, or pause — is a decision for the moment era 1 ships, not
now.

The one parked option with an existing plan is
`could-do/lean_validation_roadmap.md`. Its gate is `core-math.md`, which
era 1 produces. The roadmap remains available; it does not become active
unless and until someone deliberately picks it up.

### Parked era-1 source material

- `could-do/example_draft.md` — worked hospital scorecard contract with
  action geometry, gaming condition, and evidence split. Alt source for
  spine-refactor Part IV §15 (which currently cites
  `research/applications/hospital_scorecard.md`). Pull from either; do not
  treat as an active obligation.

## Ordering reasoning, summarized

The execution order is forced by data dependencies, not preference:

1. **Source authority** — what is canonical, what is parked, what the
   canonical theorem set is — has to be settled before any manuscript reorg,
   because the reorg's source list is exactly that classification.
   `core-math.md` is produced inside consolidation for the same reason.
2. **Structure** before **prose**, because structural moves invalidate
   line-level work.
3. **Prose** before **figures, references, and build green-light**, because
   figure references and proposition numbers shift through both upstream
   passes.
4. **Era 2 is left open.** No era-2 work is gated by this document; the
   parked Lean roadmap waits for someone to deliberately pick it up.

This ordering is also what the paradigm-forced review would force: each step
declares which contract primitives it needs (canonical theorem set, stable
section names, fixed proposition numbers, stable figure list) and what
artifact changes if it succeeds.

## Guardrails carried from prior plans

- Do not edit book or paper files outside the spine-refactor and prose-pass
  scopes. The application-template promotion gate (Iteration 38) and the
  Iteration-35 deterministic-finite-channel adaptive-hardening boundary are
  closed; do not re-promote claims past those gates.
- Do not start new simulations unless consolidation's Workstream F selects a
  concrete research question that needs one. Iteration 36's dynamic-toy
  boundary is the current stop.
- The recursive / minimum-complexity attractor question (Q18) stays parked
  until a complexity functional is fixed before inspection and a failure
  condition is declared.

## What this file replaces

- `meta-consolidation-after-iteration43.md` and `paradigm-forced-review-plan.md`
  are merged into `consolidation.md`.
- The Iteration-36 "completed context" block from the previous `next-steps.md`
  is removed per its own deletion rule. The live map after Iteration 42 is
  preserved in `consolidation.md` as the starting inventory.
- `could-do/prose-iteration.md` is promoted to active as `prose-pass.md`,
  with sections absorbed by `spine-refactor.md` marked accordingly.

## Era 1: execution order

Run these in order. Reasoning for the ordering follows each entry.

## Iteration 44: `consolidation.md` — project-state consolidation and `core-math.md`

Inventory what survived 1–43, classify files canonical/archive/delete, split
open/closed/parked questions, compact the iteration log, produce
`research/core-math.md` as a default deliverable (bare statements with book
pointers, no proof duplication), and end with a short next-mode memo
confirming the era-1 finishing order below.

**Why first.** Until this pass runs, the downstream manuscript work has the
wrong source list. The spine refactor cites `formal_analogue_lit_map.md` and
`negative_results.md` as authoritative inputs and assumes the open-question
split is current — both depend on this pass. `core-math.md` is produced here
because the spine refactor will use it as the canonical statement of which
theorems land in Part II; producing it after the spine would reverse the
authority direction.

## Iteration 45: `spine-refactor.md` — book and abstract structural reorganization

Re-spine the long-form book into six parts (~21 sections) around what holds:
licensing problem → licensed calculations → primitive-attribution table →
cases → refusals → open agenda. Re-spine the abstract to 2–4 pages carrying
project motivation, core findings, killed claims, falsifier, and minimal
literature relation. Archive the deprecated `multidimensional-goodhart-paper.typ`.
Three new content additions are in scope (killed-claims gallery,
contributes-vs-omits table, falsifier section); the source material for all
three already exists in `research/`.

**Why second.** Structural moves must precede line-level prose work, or the
prose work re-touches sections that get rewritten by the spine. The spine
also depends on consolidation's question-split and archive decisions: it
cannot foreground "the residual-shape conjecture (Q18) in Part VI" if the
open/closed/parked split is still ambiguous.

## Iteration 46: `prose-pass.md` — Zinsser-style line-level pass

Tics to grep out (`deliberately`, throat-clearing list intros, "I do not
think the right claim is X" pattern, nominalizations, overloaded sentences,
apologetic preambles). Lines to preserve through both passes are listed.

**Why third.** Several structural items in the original prose-iteration plan
are absorbed by spine-refactor (intro reorganization, Ch.7 retitle, demoting
meta-commentary). The remaining work is line-level and applies to the
re-spined book. Running this before spine would waste effort on text that
gets moved or rewritten.

## Iteration 47: `polish.md` — figures, references, appendices, build green-light

Proposition numbering audit; `refs.bib` audit against book and abstract;
figure regeneration or removal; decisions about generated appendix PDFs and
simulation PNGs; cross-check `core-math.md` book pointers; reproducible-build
green-light (`make` builds book and abstract from clean checkout, all
simulation targets run deterministically, `git status --short` clean after
build).

**Why last.** Everything upstream changes proposition numbering, figure
references, and prose. Doing figures before spine wastes the figure pass;
doing the citation audit before the prose pass wastes it. The plan's own
note ("Ask user before implementing these — they are most efficient to do
before actually publishing") supports this position.
