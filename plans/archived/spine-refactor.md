# Re-spining Multidimensional Goodhart

Status: archived. This plan guided the previous six-part book/abstract
re-spining and paper deprecation pass. The current gating spine work is
`plans/spine.md`; active prose and polish follow-ups live in
`plans/prose-pass.md` and `plans/polish.md`.

## Context

The project has accumulated a strong stack of results over ~42 iterations, but the current spine (book Intro + 7 chapters + appendices; deprecated paper in 5 sections; abstract in 4 + open) was shaped narratively as the work unfolded, not chosen to foreground the results that survived audit. The goal of this plan is a tabula-rasa critique and a re-spining of the long-form book and standalone abstract organized around what actually holds.

What the exploration confirmed:

- **Load-bearing closed results** (under stated conditions): selection δ-reweighting bounds (T1/T2), quadratic Stackelberg wedge (T3), convex score-deficit budget `m(d)` (T4), additive conservation iff `h_j = c w_j` (T5), deterministic finite-channel adaptive-hardening capacity (T6). The response-modeling contract is the methodological lynchpin.
- **Useful conditional toys**: Stackelberg wedge √(2κV) as a quadratic *signature*; response-shape taxonomy by cost geometry; population-vs-per-agent harm separation; capped-fixed-charge support switching; scorecard primitive partial auditability.
- **Explicitly killed claims**: unconditional dimensional scaling; "more dims = more error" generic; signed aggregate hidden error as a stable primitive; covariance as a finite-pressure primitive; absolute-continuity as intervention boundary; coordinate-freeness of selection bound; marginal identifiability of `W_θ` vs `K_θ`; convex affordability as welfare bound; generic minimum-complexity attraction.
- **Cross-disciplinary mapping** already exists at `research/reviews/formal_analogue_lit_map.md`: Lucas, Holmström-Milgrom, El-Mhamdi/Hoang, Skalse, Hardt, Perdomo, Gao/Pan, Manheim-Garrabrant are mapped to primitives row-by-row. No "discipline contributes vs omits" table yet. Campbell/Strathern cited as genealogy without primitive map. Muller's "Tyranny of Metrics" absent.
- **Current spine problems**:
  - Response-modeling contract is **Chapter 6 of 7** in the book (paper does better — Section 5 of 6).
  - Book Intro + Chapter 2 duplicate the "why dimension count fails" motivation.
  - Chapter 7 (formal analogues) re-tables primitives that Chapter 6 just scoped.
  - Chapter 5's "generic attractor fails" reads as a guardrail but sits inside the response-shape chapter, not as motivation.
  - Negative results are scattered across `research/negative_results.md` and `red_flags.md` but never appear as load-bearing content in the book.

The intended outcome is a recommended new spine for the long-form book (and, by extension, the abstract) that puts the contract first, foregrounds the closed results as licensed calculations, makes the negative results part of the case for the framework rather than internal hygiene, and reorganizes the cross-disciplinary chapter as a primitive-attribution table (reduction, not unification).

This is not just a table-of-contents exercise. The rewrite has to make the
contribution legible immediately, calibrate the claim's size honestly, and
organize the manuscript by the logic of the argument rather than by the order in
which the research was discovered. A reader should be able to leave the
introduction knowing the main result, why it is new, why it is worth caring
about, what earlier work it clarifies or limits, where the proof burden sits,
and what remains open.

### Front-door contribution contract

The first page of each active artifact must answer the following in plain
language before any theorem inventory:

- **Main result.** Goodhart claims require a declared response model; once the
  response channel and value/harm primitive are declared, the project supplies a
  small set of licensed calculations and refusal rules rather than a universal
  multidimensional Goodhart law.
- **Novelty.** The contribution is a methodological reframing plus several
  conditional formal tools: it separates selection from intervention, separates
  private action affordability from welfare, and gives scorecard designers an
  additive exchange-rate test `h_j = c w_j` that exposes when extra metrics
  conserve or reroute hidden harm.
- **Calibration.** This is not a major breakthrough resolving a famous
  conjecture, not a proof that "more dimensions make Goodhart worse," and not a
  policy recipe. It is a modest but useful formal framework, a clarification of
  what common Goodhart claims do and do not license, and a technical toolkit for
  later empirical or theoretical work.
- **Comparison target.** The manuscript improves on slogan-level Goodhart
  arguments and unlicensed theorem transfer by requiring primitive declarations
  before importing bounds from selection, strategic response, scorecard design,
  or adaptive dynamics. It reframes rather than refutes the Campbell/Strathern
  warning and reduces, rather than unifies, nearby formal analogues.
- **Proof idea.** The negative results show that marginal proxy movement is
  underidentified. The contract names the missing primitives. The closed results
  then become examples of what can be proved once those primitives are declared.
- **Reader map.** The introduction must name where each key result is proved:
  killed-claims gallery in Part I, closed calculations in Part II, primitive
  attribution in Part III, cases in Part IV, refusal/falsifier rules in Part V,
  and open agenda in Part VI.

If the precise theorem statements are too technical for the introduction, use a
clean informal version and one concrete special case. Do not bury the keeper
claim (`h_j = c w_j`) in a later subsection without previewing it in the
introduction.

### Decisions confirmed with user

- **Scope: reorganize + add the three new sections.** Killed-claims gallery (Part I §3), discipline contributes-vs-omits table (Part III §12), concrete falsifier section (Part V §18). Source material for all three already exists in `research/`; the additions are synthesis, not new research.
- **Artifact scope: two artifacts, in lockstep on framing.** Re-spine the book as the long-form deliverable. Re-spine `multidimensional-goodhart-abstract.typ` to a 2–4 page form that carries project motivation, core findings, and minimal literature relation — no deep context (deep context lives in the book). The medium-length `multidimensional-goodhart-paper.typ` is being deprecated and should be archived as part of this pass, not re-spined.
- **Abstract content boundary.** The abstract is the standalone discussion starter. It must include: the project's motivating phenomenon, the response-modeling contract in one paragraph, the closed theorems as named results with hypothesis sketches, the killed-claims list in compressed form, the falsifier, and one paragraph relating to the closest prior literature. It must not include: full proofs, application contracts, the cross-disciplinary attribution table, the open agenda beyond Q18 as the signature conjecture.
- **Q18 placement: Part VI open agenda as the signature conjecture.** Part II §9 carries only the licensed conditional cost-geometry taxonomy; the unconditional minimum-complexity attractor stays explicitly open in Part VI §19. Matches the Iteration-7 repair history. The abstract names Q18 as the signature open problem in one sentence.

## Recommended new spine (six parts, ~21 sections)

The names below are working headers — the point is the order and the framing, not the prose.

Dependency graph to preserve while editing:

`primitive declarations -> negative-result motivation -> response-modeling contract -> channel-specific lemmas -> closed calculations -> cross-domain attribution -> cases/stress tests -> refusals/falsifiers -> open questions`

Early sections should reward the reader with orientation and visible progress
before demanding heavy notation. Technical machinery belongs where it first
earns its keep.

### Part I — The licensing problem (replaces book Intro + Ch.1 + Ch.2)

1. **The slogan and what it gets wrong.** Goodhart-as-correlation-collapse treats proxy movement as evidence about hidden value. It isn't, without a declared response model. One worked failure: the same proxy movement is consistent with selection-only re-ranking, harmless proxy repair, harmful fixed-type gaming, and real improvement — and no aggregate statistic distinguishes them.
2. **What "multidimensional" actually adds.** Two failure modes: dimension gap (`ker φ`) and residual gap (`ε`). Two response channels: selection over fixed types (`W_θ` changes) and intervention at fixed type (`K_θ` changes). Channel choice precedes any quantitative claim.
3. **What we tried and what failed.** A short, named gallery of killed claims, each with a one-line reason: unconditional dimensional scaling; "more dims = more error"; absolute-continuity intervention boundary; coordinate-free selection bound; marginal identifiability; convex affordability as welfare. This is content, not hygiene — it explains why a single "n-dimensional Goodhart" object does not exist.
4. **The response-modeling contract.** Seven primitives required to license any Goodhart calculation: type space `U`, baseline `μ`, selection weights `W_θ` and/or response kernels `K_θ`, action/cost/search geometry, proxy/target relation `(P, φ)`, aggregation rule, hidden value/harm model, evidence standard. Framed as: this is what a Goodhart claim has to declare to be a claim and not a slogan.

### Part II — Licensed calculations (replaces book Ch.3–5)

5. **Selection channel.** δ-reweighting drift bound (Prop 1/1') with the coordinate-explicit and declared-value-metric forms. Covariance as local velocity inside the finite-mgf domain. What pure selection licenses: drift bounds and value-weighted bounds. What it doesn't: anything about fixed-type response or welfare.
6. **Intervention channel.** Convex score-deficit budget `m(d) = sup_λ [λd − c*(λw)]` (T4). Stackelberg wedge √(2κV) (T3) as a **signature of the quadratic toy**, not a universal intervention law. Explicit refusal: this is not a welfare bound; the cost-minimal action and the worst-case-harm action are different objects.
7. **Multidimensional scorecards — the keeper.** Foreground the additive conservation iff-condition `h_j = c w_j` (T5) as the project's most exportable result: a one-line generalization of Holmström-Milgrom that gives empirical designers a checkable test for whether adding a metric helped, hurt, or re-routed harm. Conjunctive aggregation flips the sign. Population entry vs per-agent re-routing as separate objects.
8. **Adaptive hardening — narrow but real.** Iteration-35 deterministic finite-channel capacity theorem: gaming stops exactly when `S_t(M) < d²/(2V)`. State the boundary conditions sharply (fixed `M`, `d`, `V`, weights; separable quadratic; monotone `κ_j`; deterministic observation). Iteration-36 noisy-observation negative example as immediate falsifier of any broader claim.
9. **Response shape, conditionally.** Cost-geometry → drift-pattern taxonomy: quadratic costs give dense cost-minimal drift; fixed charges give entry thresholds and active-set switches; low-rank affordances constrain drift to an image; search-prior claims require predeclared coding. Frame as **the conjecture the project did not prove unconditionally** (Q18: minimum-complexity attractor). This is honest about scope; it is also the live agenda.

### Part III — Across disciplines: a primitive attribution table (replaces book Ch.7)

10. **Genealogy (informal anchors).** Goodhart 1975, Campbell 1976/79, Strathern 1997, Manheim-Garrabrant 2018. Pre-formal warnings and a taxonomy by cause. State that none of these supplies primitives; they are starting points, not analogues.
11. **Formal analogues, primitive by primitive.** Lucas → response kernel (regime-dependent decision rules); Holmström-Milgrom → aggregation + action/cost (the closest precedent for the exchange-rate result); El-Mhamdi & Hoang → selection + proxy/target (scalar tail-conditioned anchor); Skalse 2022 → proxy/target separation; Skalse 2023 → RL response kernel + action/cost (occupancy-measure specific); Hardt → response kernel + action/cost (strategic classification); Perdomo → response kernel with endogenous deployment; Gao/Pan → empirical response-geometry candidates.
12. **What each discipline contributes vs omits.** A single explicit table (this does not exist yet in the project). Columns: discipline; primitives supplied; primitives omitted; what the contract says is licensed under those declarations; where transfer fails. This converts the existing `formal_analogue_lit_map.md` rows into the artifact the framework actually needs.
13. **Reduction, not unification.** State clearly that no single equation generalizes all of these. The framework's claim is narrower and stronger: each formalism instantiates the contract with different declared primitives, and the contract names which transfers across boundaries are licensed.

### Part IV — Cases as stress tests (replaces scattered application content)

14. **MMLU.** Full primitive declaration from Iteration 23. What the contract licenses (selection-channel claims under fixed-checkpoint comparison) and refuses (finetuning/contamination/reward optimization without declared `K_θ`).
15. **Hospital readmissions.** Empirical-auditability boundary from Iterations 29–30, 37. Which primitives are auditable (`κ`, `h`, `γ`, `w`, `V`), which require predeclaration, which must be marked unavailable — and the design consequence in each case.
16. **Scientific metrics.** Novelty boundary from Iteration 31. The framework's contribution is only the discriminator/evidence contract; responsible-metrics work (DORA, Leiden) already covers the warning. Use this case to show the contract refusing to overclaim.

### Part V — What the framework refuses to do

17. **Anti-applications.** When type space drifts, measured sets are unobservable, or no defensible hidden value model is available — the contract returns "no verdict." That refusal is a load-bearing claim, not a hedge.
18. **Falsifiers.** What would falsify the contract: a domain where licensed calculations systematically disagree with outcomes that primitive declarations were supposed to track. State this concretely so the framework is testable.

### Part VI — Open agenda

19. **The residual-shape conjecture.** Minimum-complexity attractor (Q18) as the project's signature open problem, with the five sub-questions from the iteration log. Honest about what would and would not count as resolving it.
20. **Composition, identification, information-theoretic restatement.** Three structural gaps: how channels compose; when primitives are identifiable from observable data; an information-theoretic version of the δ-bound that would travel further than L².
21. **Toolkit gap.** What would have to be true for a practitioner to use this without re-deriving the contract: identification toys, a primitive-elicitation protocol, worked exchange-rate audits at real sites.

## Drafting rules for the re-spine

These rules should govern the actual manuscript rewrite, not sit as generic
advice. They turn the spine into a readable paper/book structure.

### Section openings

Every major section should begin with a short purpose paragraph that states:

- the local goal of the section;
- how it serves the global contract-first claim;
- whether the section is proving a closed result, motivating a boundary,
  translating prior work, or naming an open problem;
- what the reader can safely forget after the section.

Before a technical theorem, give either a toy case, a special case, or a
one-paragraph informal statement. Label informal explanations as informal and
keep proof claims separate from intuition.

### Lemma and theorem interface

Use lemmas as information-hiding devices. A lemma should expose the conclusion a
later section needs, restate the relevant assumptions, and hide disposable
intermediate quantities. Write lemma statements to be easy to use, not merely
easy to prove.

Concrete application to this project:

- Selection lemmas should say what kind of drift bound is licensed and under
  which value metric; do not force the reader to remember proof-internal
  covariance or mgf details unless they are reused.
- Intervention lemmas should separate private score-deficit affordability from
  welfare/harm claims at the statement level.
- Scorecard lemmas should foreground the exchange-rate interface
  `h_j = c w_j`; proofs may contain the coordinate algebra, but the statement
  should make the design test visible.
- Adaptive-hardening lemmas should carry their finite-channel deterministic
  hypotheses in the statement rather than relying on nearby prose.

Avoid splitting technical machinery too finely. If two technical lemmas only
matter together, merge them into one natural interface and hide the intermediate
condition inside the proof.

### Notation policy

Define global notation once in Part I and keep it stable: `U`, `nu`, `K_theta`,
`W_theta`, `P`, `G`, `phi`, `epsilon`, value/harm functional, action/cost
geometry, and aggregation rule. Define local notation near use. Introduce a
symbol only when it is used repeatedly or makes a central theorem readable.

Use conventional notation where possible and translate cited results into this
notation explicitly. Avoid self-branded symbols for concepts already known in
the nearby literature. Reinforce notation in prose when it reduces load: "the
response kernel `K_theta`" is often better than "`K_theta`" alone.

Because the notation is still being stabilized, use Typst macros for symbols
likely to change during the rewrite.

### English as proof interface

The prose should carry role and causality, not just decoration. Use words such
as "therefore," "however," "by contrast," "for future reference," and
"more generally" to mark the logical relationship between facts. Do not
compress important conceptual transitions into symbolic shorthand.

Spend detail on new ideas, nonstandard arguments, central definitions, unusual
notation, obscure cited lemmas, and places where confusion has already appeared
in the iteration log. Compress standard facts, routine calculations, and
arguments the intended reader can reconstruct.

The intended reader is not an omniscient expert; use the "past self from twelve
months ago" standard. For interdisciplinary sections, explain enough economics,
ML, policy, or mechanism-design background for a reader from the other side to
understand the primitive mapping.

### Claim calibration and open questions

Each contribution should be labeled as one of:

- conceptual reframing;
- closed formal result under stated assumptions;
- simplified proof or translation of a known idea;
- technical tool for later use;
- conditional toy model;
- partial result toward Q18;
- open problem.

Do not use a famous conjecture or broad social-science warning as decoration.
When Campbell, Strathern, Lucas, Holmström-Milgrom, or strategic-classification
work appears, state exactly which primitive the present framework borrows,
clarifies, limits, or refuses to transfer.

Open questions are not an afterthought. Q18 should be named as the signature
open problem; identification, composition, and information-theoretic restatement
should be named as structural gaps rather than hidden weaknesses.

### Result-to-effort policy

Include cheap natural consequences, examples, variants, counterexamples, and
sanity checks when they prevent readers from rediscovering obvious follow-ons.
Move minor extensions that require heavy machinery to remarks, appendices, or
future work.

Do not overoptimize statements before the spine is stable. Prefer readability,
correctness, and checkability over elegance. In particular, do not strengthen
the Stackelberg wedge or adaptive-hardening claims beyond their audited
hypotheses just to make the narrative smoother.

### Professional finish

Citations must be accurate and credit must be assigned carefully. Separate
theorem/proof content from opinion, speculation, and agenda-setting. Keep the
voice plain and direct; do not imitate cited authors or use cleverness as a
substitute for clarity.

Journal strategy is downstream of the rewrite. Once the book/abstract spine is
stable, choose venues by fit with the contribution's actual level: presentation,
checkability, audience, and similarity to accepted papers matter more than
prestige.

## What this changes vs the current spine

**Promoted (moved earlier or made headline):**
- Response-modeling contract: from book Ch.6 → Part I §4. The single highest-leverage move.
- Exchange-rate criterion `h_j = c w_j`: from a subsection inside Ch.4 → Part II §7 with explicit "the keeper" framing.
- Negative results: from `research/negative_results.md` → Part I §3 as motivating content.
- Falsifier / anti-application discussion: from a closing footnote in the abstract → Part V as a section.

**Demoted (kept but smaller / later):**
- Stackelberg wedge √(2κV): demoted from co-headline with selection bounds → explicitly framed as quadratic-toy signature only.
- Manheim-Garrabrant taxonomy: moved from Ch.1 anchor → Part III §10 genealogy. The project's framing is "we taxonomize by mechanism, not by cause" rather than "we generalize the taxonomy."
- Recursive Goodhart / minimum-complexity attractor: from intro motivation → Part VI §19 open agenda. Honest about its conjectural status.

**Merged / removed:**
- Book Intro + Ch.2 conceptual setup duplication → collapsed into Part I §1–§2.
- Ch.7 primitive table + Ch.6 contract table → merged into Part III, with the new contributes-vs-omits table replacing the duplication.
- Appendix B (selection vs intervention as reweighting vs transport) → folded into Part II §6 opening.

**Added (new content needed):**
- Part III §12: the "what each discipline contributes vs omits" table. The row data already exists in `research/reviews/formal_analogue_lit_map.md`; the synthesis does not.
- Part V §18: a concrete falsifier statement. The abstract gestures at this; no section currently develops it.
- Part I §3: the killed-claims gallery as load-bearing content. The data exists in `research/negative_results.md`; the foregrounding is new.

## Critical files

Re-spining touches two written deliverables and one new synthesis file, and archives the deprecated paper. No research-content rewrites are required to execute the spine; this is reorganization plus three additions plus one removal.

- `book/multidimensional-goodhart.typ` (2337 lines) — primary re-spine target.
- `book/multidimensional-goodhart-abstract.typ` (185 lines) — re-spine into a 2–4 page standalone discussion starter as scoped above. The current artifact lists channel separation / selection bounds / exchange rate / hardening / contract as five contributions; reorder around the new spine (contract → selection → exchange rate → hardening → response shape conjectural) and trim everything that is not motivation, core findings, killed claims, falsifier, or minimal literature relation.
- `book/multidimensional-goodhart-paper.typ` (~334 lines) — **deprecate.** Archive to `book/archive/` (or equivalent) rather than re-spine. Git history preserves it. Update any cross-references in `README.md`, `AGENT.md`, and Makefile targets so the paper artifact is no longer built.
- `research/reviews/formal_analogue_lit_map.md` — source rows for the new Part III §12 table. No new research needed; only synthesis.
- `research/negative_results.md` — source for Part I §3 killed-claims gallery.
- `research/applications/{mmlu,hospital_scorecard,scientific_metrics,empirical_auditability}.md` — sources for Part IV; promotion to book sections is mostly cut-and-tighten.

## Execution sequence

Do not start by polishing the manuscript line by line. Build a rapid prototype
first:

1. Draft the front-door contribution paragraph and informal theorem map.
2. Draft the Part I killed-claims gallery and response-modeling contract.
3. Draft Part II theorem statements with hypothesis sketches and proof-location
   notes, leaving proof details as stubs where the existing manuscript already
   contains them.
4. Draft the Part III contributes-vs-omits table from the existing literature
   map.
5. Draft the Part V anti-application and falsifier section.
6. Only then tighten proofs, notation, citations, cross-references, examples,
   and prose flow.

Use stubs for side ideas rather than interrupting the spine rewrite. A side
idea graduates into the main text only if it improves the contract-first
argument at low additional reader/author cost.

## Verification

This plan is structural, not computational; verification is editorial and consistency-based.

- **Front-door legibility test.** After the rewrite, the title/subtitle,
  abstract, and first two pages should answer: main result, novelty, interest,
  comparison target, proof idea, proof locations, and open questions. If an
  expert can read the introduction and miss the response-modeling contract or
  the exchange-rate keeper result, the introduction has failed.
- **Claim-calibration audit.** Every headline contribution should be labeled as
  conceptual reframing, closed theorem, conditional toy, technical tool, partial
  result, or open problem. Remove or rewrite any sentence that implies a
  universal multidimensional law, policy prescription, or resolved famous
  problem.
- **Dependency-order check.** The book should follow the declared dependency
  graph: primitives before calculations, calculations before applications,
  refusals before broad agenda. If a section asks the reader to understand a
  technical object before its role is clear, move or preview it.
- **Section-purpose check.** Each major section should open with its local goal,
  relation to the global claim, and status of the content. Sections that begin
  directly with notation or literature summary need a purpose paragraph.
- **Lemma-interface check.** Lemma/theorem statements should expose reusable
  conclusions and relevant assumptions without leaking disposable proof
  internals. Merge pairs of technical lemmas that only matter together.
- **Notation-load check.** Global notation should be introduced once and reused
  consistently; local symbols should be introduced near use; one-off expressions
  should remain prose unless notation makes a central statement clearer.
- **Detail-allocation check.** New ideas, central definitions, subtle steps,
  unusual notation, and obscure citations should receive explanation. Routine
  calculations should be compressed after their type is clear.
- **Cross-reference audit.** After re-spine, every closed result in `research/claim_audits.md` should map to exactly one Part II section; every killed claim in `research/negative_results.md` should appear in Part I §3 or be explicitly handled in Part V.
- **Contract-first sanity check.** Read each Part II calculation alone and confirm it cites the contract primitives from Part I §4 before stating the result. If any Part II section can be read without those primitives, the section is doing slogan transfer.
- **Build artifacts.** `cd book && make` should compile `multidimensional-goodhart.typ` and `multidimensional-goodhart-abstract.typ` without errors and produce PDFs whose tables of contents match the new spine. The deprecated `multidimensional-goodhart-paper.typ` should no longer be built by default; if it remains in the source tree before archiving, exclude it from default targets.
- **Spine-divergence check.** Diff the new book TOC against `book/multidimensional-goodhart-abstract.typ`'s section headers; the abstract should carry motivation + the core findings from Parts I–II + Q18 as the signature conjecture, in that order, with the book extending further into cross-disciplinary attribution / cases / refusals / open agenda.
- **Paper-archive check.** Confirm `multidimensional-goodhart-paper.typ` has been moved out of the active build set, Makefile targets do not reference it, and orientation files (`README.md`, `AGENT.md`) no longer point to it as a current artifact.
- **Negative-space test.** Confirm Part V §17–18 contains at least one concrete falsifier and one concrete anti-application; if it's all hedging, the section isn't doing the work the abstract claims for it.
- **No-overpromotion gate.** Iteration 38's policy gate (audit/design/evidence only) should be visible in Part IV and Part V; if any application section reads as policy advice, it has slipped past the gate.
