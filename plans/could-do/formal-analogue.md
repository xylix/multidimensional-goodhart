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

## Chapter 2 scalar anchor decision

The Chapter 2 anchor proposition is **El-Mhamdi & Hoang 2024**
("On Goodhart's law, with an application to value alignment",
arXiv:2410.09638). Skalse et al. 2023 (arXiv:2310.09144, "Goodhart's Law
in Reinforcement Learning") is cited in the late formal-analogue chapter
as an RL-specific analogue, not as the anchor.

Reasoning:

- El-Mhamdi's selection-pressure parameterization and tail-conditioned
  correlation bound match the geometry of Chapter 3's selection-channel
  propositions directly. The generalization story reads as
  "scalar correlation collapse → multidimensional V drift."
- El-Mhamdi gives closed-form quantitative bounds (Theorems 1 and 4)
  that the book has a clear target to extend.
- Skalse 2023's RL-specific assumptions (convex occupancy polytope,
  linear rewards in occupancy space, concave optimization, angle bound
  between proxy and true reward in projected reward space) do not
  transfer to the book's general framework. Anchoring on Skalse would
  force Chapter 2 to explicitly disclaim that the multidim propositions
  are analogues, not generalizations.
- Skalse 2023 still belongs in the book — as a primitive-map row in the
  late formal-analogue chapter, under reward misspecification / RL
  response modeling. It is `load-bearing` for that chapter, just not
  for Chapter 2.

Anchor theorem statements (verbatim, from
`research/threads/lit_review/verification_notes.md`):

**Theorem 1 (Bounded Goal, Exponential Discrepancy):**
- Hypotheses: G uniform on [0,1]; ξ exponential with parameter λ;
  independence G ⊥ ξ; noise-to-signal ratio ε = Var(ξ)/Var(G); selection
  pressure α with 0 < α ≤ ε√12(1 - e^{-1/(ε√12)}).
- Conclusion: ρ_α = 0, and E_α[G] = (1/λ)·(λe^λ - e^λ + 1)/(e^λ - 1),
  with E_α[G] = 1 - ε√12 + O(ε²) as ε → 0.

**Theorem 4 (Power-Law Goal and Discrepancy):**
- Hypotheses: G has power-law decay g^{-γ} with γ > 3; ξ has power-law
  decay x^{-β} with β > 3, β ≠ 4; independence; scalar.
- Conclusion: α ~ √((β-1)/(β-3))·ε, and
  ρ_α → max{-√((β-3)/(2(β-2))), -1/(β-2)} as ε → 0.

Open issue carried to Stage 3 of `plans/lit-review.md`: El-Mhamdi assumes
G ⊥ ξ. Does Chapter 3's selection-channel proposition assume
independence? If yes, the book inherits the assumption and cites
Majka–El-Mhamdi 2025 as the independence-free extension. If no, the
book's contribution is partial independent rediscovery of the
independence-free case and should be flagged in §2.3 accordingly.

## Promotion decision (chapter versus appendix)

Decided at Stage 4 of `plans/lit-review.md` based on Stage 3 row count.
Default: chapter, on the argument that the book's thesis includes the
claim that the framework clarifies cross-field work. Downgrade to
appendix only if fewer than three theorem families produce clean
primitive maps with falsifiers, in which case the comparative-mapping
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

## Gemini deep-research prompts (economics-side and shared)

These prompts feed the chapter. Codex is running the ML-side survey
separately. Prompts 1 and 2 (standard scalar Goodhart math; genealogy) have
already been run; their outputs feed Chapter 2 directly. Prompts 3-8 below
remain to be run as needed.

Each prompt should be paired with the shared preamble: "You are surveying
primary-source literature for a research monograph that builds a
multidimensional generalization of Goodhart's law. Cite original papers and
arXiv preprints with year and venue. Distinguish theorems with explicit
assumptions from informal claims. If you cannot find a primary source for a
claim, say so explicitly — do not synthesize. Keep the response under ~800
words. Output format: (1) one-paragraph summary, (2) canonical statement with
inputs/outputs and key assumptions, (3) known generalizations, (4) known
failure modes / where the assumptions are typically violated, (5) ≤5
primary-source citations with full bibliographic info. Do not editorialize
about Goodhart's law or AI alignment."

### Prompt 3 — Holmström–Milgrom multitask principal-agent (1991)

Give a thorough survey of the Holmström–Milgrom 1991 "Multitask
Principal-Agent Analyses" paper and the surrounding literature on multitask
incentive contracts. Cover: the formal model (agent effort vector, principal's
reward as a function of measured signals, agent's cost function, the
linear-contract restriction and its rationale), the central theorem(s) on how
rewarding measured tasks distorts effort allocation away from unmeasured
tasks, and the conditions under which it is optimal to provide low-powered
incentives. I am particularly interested in whether any result in this
literature can be stated as: "if a principal can only reward measurable
signals and the value function has a component depending on unmeasurable
effort, then increasing reward intensity on measured signals strictly
decreases value above some threshold." Also identify generalizations to
nonlinear contracts (Mirrlees, more recent contract-theory work).

### Prompt 4 — Lucas critique, formalized

Survey the formal content of the Lucas critique (Lucas 1976) and its
descendants. Cover: the original statement, what makes a reduced-form
correlation policy-invariant versus policy-dependent, the formal econometric
literature on this (structural versus reduced-form identification,
rational-expectations restrictions). I want a precise statement of the Lucas
critique that can be cast as a claim about response kernels: optimizing over a
policy parameter changes the joint distribution of observables, so estimates
of the policy's effect that hold the joint distribution fixed are wrong.
Identify whether modern formulations (e.g., in causal inference or invariant
prediction) state this as a theorem with explicit conditions.

### Prompt 5 — Welfare aggregation: Arrow and Sen impossibility

Survey the formal impossibility results for welfare aggregation that are
relevant to aggregating multidimensional value into a scalar proxy. Cover:
Arrow's impossibility theorem (1951), Sen's liberal paradox (1970), Sen's
later impossibility results, and any directly relevant
multidimensional-welfare-aggregation impossibilities (e.g.,
d'Aspremont–Gevers, Roberts, Maskin). For each, give the formal axioms, the
impossibility statement, and a short note on what positive results survive
(single-peaked preferences, cardinal utility, restricted domains). I want to
use these as analogues for the aggregation primitive in a framework where a
scalar proxy is built from multidimensional value. I am specifically
interested in whether any of these results give a quantitative bound (rather
than a binary impossibility) — most do not, but flag any that do.

### Prompt 6 — Tinbergen and Mundell: instruments and targets

Survey the Tinbergen rule (Tinbergen 1952, "On the Theory of Economic
Policy") and the Mundell assignment problem. Cover: the formal "n instruments
for n targets" requirement, the linear-policy framework Tinbergen used,
Mundell's principle of effective market classification, and any subsequent
generalizations (Theil, modern optimal-control formulations). I want to use
this as a precedent for the claim that dimensional mismatch between proxies
and targets has formal consequences, distinct from but related to
Goodhart-style proxy degradation. Identify whether the Tinbergen result is a
theorem (and under what assumptions) or a heuristic, and what the modern
statement looks like.

### Prompt 7 — Strategic classification and performative prediction (economics roots)

Codex is surveying the ML literature on strategic classification (Hardt et
al. 2016 onward) and performative prediction (Perdomo et al. 2020 onward). I
need the *economics-side* roots of these ideas. Cover: Stackelberg
leader-follower games (von Stackelberg 1934, modern formulations), rational
expectations equilibria (Muth 1961, Lucas), self-fulfilling prophecies in
macro (Azariadis, Cass-Shell sunspots), Bayesian persuasion
(Kamenica-Gentzkow 2011) and information design more broadly. For each, give
the formal setup and the central theorem, and identify whether the modern ML
formalizations cite or rediscover these. I want to know whether strategic
classification is a special case of a known game-theoretic result and whether
performative prediction has a clean rational-expectations precedent.

### Prompt 8 — Mechanism design impossibilities (optional, only if cheap)

Briefly survey mechanism-design impossibility results that bear on
proxy/target misalignment under strategic agents. Gibbard-Satterthwaite
(manipulability of social choice rules), Myerson-Satterthwaite (no efficient
bilateral trade), and the revelation principle. For each: formal statement,
conditions, and whether the result has been cited as a precedent for AI
alignment / Goodhart issues. Keep this short — under 400 words total — since
I am unsure whether this material will enter the monograph at all.

Suggested order: 3, 4, 7 first (most directly load-bearing for the
formal-analogue chapter); 5 and 6 in parallel; 8 only if research budget
allows.

## Test plan

- After drafting, run the same `rg` check as Iteration 22 over the book file,
  not just `research`, to confirm every mapped theorem family in the chapter
  has both a primitive map and a "does not license" or falsifier sentence.
- Build the Typst book and confirm the chapter does not silently introduce
  new propositions or mutate existing ones.
- Confirm Chapter 2's anchor proposition (the standard scalar Goodhart bound)
  is cited as the limiting case wherever this chapter generalizes it.
