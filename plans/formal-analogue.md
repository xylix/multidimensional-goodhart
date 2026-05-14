# Formal analogue chapter plan

## Purpose

This note plans the late book chapter (working title: "Formal analogues across
fields") that consumes the Iteration 22 ML and economics survey work and
presents the primitive-mapping results to the reader.

It is distinct from:

- **Chapter 2** ("Existing Goodhart formulations and their scope"), which is
  short, historical, and prerequisite-only.
- The Iteration 22 research notes (`research/threads/`), which remain the
  research audit trail.

This chapter is the reader-facing consolidation of the comparative mapping
work. Whether it ships as a chapter or an appendix is decided at Iteration 25,
not now (see "Promotion decision" below).

## Position in the book

Inserted between the current response-modeling contract chapter and the visual
appendices. Concretely, after the section currently around line 1812
("Application discipline") and before line 1845 ("Visual appendices"). This
ordering is load-bearing: the chapter only makes sense once the framework's
primitives (selection, action/cost/search, response-kernel, proxy/target,
aggregation, evidence standard) and the response-modeling contract are on the
page.

## Target length

Six to ten pages of body text, plus one mapping table. Tighter than a survey,
denser than a related-work paragraph. If the iteration 22 survey produces more
material than this absorbs, the residue stays in the research notes.

## Proposed structure

1. **Framing paragraph** (half page). State that the framework is a contract
   for declaring response models, and that the rest of the chapter asks which
   existing formal results in ML and economics instantiate which primitives.
   State the falsifier discipline: a mapping that does not name a falsifier
   does not enter this chapter.

2. **The primitive map** (one to two pages, table-driven). One row per
   established theorem family that survived Iteration 22's filter. Columns:
   theorem family, primary citation, formal inputs/outputs in one line, the
   framework primitive it instantiates, what it licenses inside the framework,
   what observation would falsify the mapping.

3. **ML analogues** (two to three pages). Prose section walking through the
   three or four ML families that produced clean primitive maps. Likely
   candidates from the Iteration 22 plan: adaptive benchmark / reusable
   holdout, performative prediction, strategic classification, reward-model
   overoptimization. Each gets one to two paragraphs: what the theorem says,
   what primitive it instantiates, where its assumptions stop matching ours.

4. **Economics analogues** (two to three pages). Same shape for the economics
   families produced by the Gemini survey. Likely candidates: multitask
   principal-agent (Holmström-Milgrom), Lucas critique, Arrow/Sen welfare
   aggregation, Tinbergen/Mundell instruments-and-targets.

5. **What this chapter does not license** (half to one page). Explicit list:
   no claim that the toy bounds transfer to RLHF or finetuning without a
   declared action/cost/search model; no claim that kappa is gradient
   accessibility or benchmark contamination or feature simplicity; no claim
   that the framework subsumes any listed theorem family; no implicit Lean
   correspondence. This section is the boundary, not throat-clearing.

## What gets promoted from Iteration 22

A theorem family enters this chapter only if the Iteration 22 survey produced
all of:

- A specific primary-source citation, not a textbook gesture.
- A primitive map that names exactly one framework primitive as the closest
  fit.
- A falsifier sentence stating what observation would break the mapping.
- A "does not license" sentence stating what the mapping does not let the
  framework claim.

Families that fail any of these stay in `research/threads/` and may be
revisited in a later iteration. Non-binding analogies (Campbell's law,
original Goodhart, Strathern) live in Chapter 2 with the genealogy, not here.

## Promotion decision (chapter versus appendix)

Decided at Iteration 25, not now. Default: chapter, on the argument that the
book's thesis includes the claim that the framework clarifies cross-field
work. Downgrade to appendix only if fewer than three theorem families produce
clean primitive maps with falsifiers, in which case the comparative-mapping
contribution is too thin to carry a chapter.

## Open questions for the chapter

- Should each primitive-map row carry a row in `research/claim_audits.md`?
  Probably yes for any row promoted into the book; defer the audit-row write
  to the iteration that drafts the chapter prose.
- Should the chapter close with a "candidate future model choices" subsection
  collecting speculative correspondences (kappa as gradient accessibility,
  proxy/target as benchmark contamination) explicitly as non-current claims?
  Lean yes, kept short.
- Does the chapter need its own simulation hook? Default no; simulations stay
  in the relevant earlier chapters.

## Iteration assignment

This plan does not introduce a new iteration. The chapter is drafted as part
of Iteration 23 ("Worked Contract Application") if Iteration 22 produces
enough clean maps, otherwise deferred to a new iteration inserted between 23
and 24. The Iteration 25 polish pass makes the chapter-versus-appendix call.

## Test plan

- After drafting, run the same `rg` check as Iteration 22 over the book file,
  not just `research`, to confirm every mapped theorem family in the chapter
  has both a primitive map and a "does not license" or falsifier sentence.
- Build the Typst book and confirm the chapter does not silently introduce
  new propositions or mutate existing ones.
- Confirm Chapter 2's anchor proposition (the standard scalar Goodhart bound)
  is cited as the limiting case wherever this chapter generalizes it.
