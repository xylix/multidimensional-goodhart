# Polish TODOs — COMPLETE (archived June 9, 2026)

All phases executed: Phase 0 (consistency batch), Phases 2/3 (structural
polish, absorbed into the spine-v3 rewrite + prose pass), Phase 4 (figures
+ hygiene re-run). §11's optional repo-side artifacts moved to
`could-do/supporting-artifacts.md`. Retained as the audit record of what
was checked and where each item landed.

Phase labels refer to the execution pipeline in `plans/next-steps.md`.

## Phase 0 — Spine-neutral consistency fixes — EXECUTED June 9, 2026

Executed as Iteration A; all items below done and verified (build clean,
defect greps clean, no orphan bib keys, citations resolve). The identical
`Delta(v dot H)` and Q18 defects in the abstract were fixed in the same
batch, which also resolved an abstract-only `Delta` overload with the T3
wedge symbol.

Source: consistency review of the Iteration 47 draft (June 9, 2026),
cross-checking `book/multidimensional-goodhart.typ` against
`research/core-math.md` and `book/refs.bib`.

Verified context, so future iterations do not redo it: the draft compiles
cleanly; T1–T6 statements match core-math.md hypotheses and non-license
clauses; T1/T3/T5/T6 algebra re-derived and confirmed; all four figure PDFs
exist; all 21 cited bib keys resolve. The items below are the residue. They
survive any spine-v3 restructuring, which is why they may run before spine
approval without violating the hard rule in `next-steps.md`.

### 0.1 Undefined notation in the book

- [x] Define `B_H(theta) = E_theta[H] - E_0[H]` (selection drift) in §2.1
      before T1 uses it. `core-math.md` defines it; the book never does.
- [x] Define or rewrite `Delta(v . H)` in T2 (§2.1). core-math.md states the
      centered form `v . (H - E_0 H)`; the book's `Delta` is unexplained.
- [x] `gamma` ("signal adequacy", §4.2 hospital readmissions) is defined
      nowhere in the book or in core-math.md — likely a leftover from an
      earlier draft. Define it or cut the symbol.
- [x] State `mu_theta << mu_0` explicitly in §2.1 before writing
      `L = d mu_theta / d mu_0`. core-math.md states it; the book only says
      "enough integrable moments" yet a later falsifier bullet leans on
      "the stated moment and absolute-continuity conditions."

### 0.2 Symbol collision on `M`

- [x] §2.2 uses a hidden harm vector `(M, 0)` with `M` as a scalar magnitude
      ("hidden harm grows with `M`"), while `M` is the measured channel set
      in T5, T6, and the falsifiers. Rename the scalar to a letter unused in
      the theorem set.

### 0.3 Verbatim duplication of the `mu_theta` block

- [x] The `mu_theta(A)` display equation plus the "Pure selection means…
      Intervention means…" paragraph appears nearly verbatim in §1.2 and
      §1.4. Phase 0 fix: make the §1.4 occurrence visibly reference §1.2
      ("as in §1.2") so it reads as deliberate reprise, not editing
      artifact. Whether to fully deduplicate is a spine-v3 decision.

### 0.4 Stale cross-file pointers in core-math.md

- [x] `research/core-math.md` book pointers still say "Part II, Section
      5/6/7/8" — pre-dating the "Remove manual heading numbering" commit.
      Update to current numbering: T1/T2 → §2.1, T3/T4 → §2.2, T5 → §2.3,
      T6 → §2.4. Section titles already match; only the numbers are stale.

### 0.5 Bibliography loose ends

- [x] `lucas1976critique` is in refs.bib but never cited, so Typst silently
      omits it from the rendered references. Either cite it in the Part III
      genealogy (natural companion to @goodhart1975) or delete the entry.
- [x] §4.3 name-checks DORA and the Leiden Manifesto with no citations, in a
      document that otherwise cites everything. Add bib entries and cite, or
      drop the names.

### 0.6 Repo-internal references a book reader cannot resolve

- [x] §7.1 leads with "The signature open problem is Q18" — internal
      question numbering. Name the conjecture (the residual-shape
      conjecture) and drop the index.
- [x] Same category as the "This section covers T1 and T2 in
      `research/core-math.md`" lines (also flagged in the human review and
      in Phase 2 §6 below). Scrub all repo-internal addressing from the
      manuscript as one batch.

### 0.7 Title-page decisions — needs user input, do not guess

- [x] Resolved (June 9, 2026): author name stays "Xylix Pelttari" per user
      decision. The book already reads this way; no change needed.
- [x] Decided (June 9, 2026): drop the iteration string from the title
      page; iteration tracking stays in source comments and git history.
      Execute the edit with the Phase 0 batch.

### 0.8 Falsifier framing in §6.2 — approved June 9, 2026

Signed off after discussion: the reframe shifts falsifiability from the
theorems (which, being proved, cannot be empirically violated under their
hypotheses) to the declaration methodology (audited primitives + failed
prediction ⇒ the contract fields do not track the mechanism). User chose
honesty over rhetoric; included in the Phase 0 batch.

- [x] Two falsifier bullets describe empirically observing a violation of a
      proven theorem "under the stated conditions," which cannot happen if
      the conditions hold — a hostile reviewer can call the falsifiers
      vacuous. Reframe as tests of the declaration process: independently
      audited primitives satisfy the contract, yet the prediction fails,
      which localizes the failure to the contract's field definitions
      rather than to the mathematics. The closing paragraph of §6.2 already
      gestures at this; promote it into the bullets themselves.

### 0.9 Verification for the Phase 0 batch

- [x] `cd book && make` (or `typst compile`) passes after the edits.
- [x] For every symbol in core-math.md "Stable definitions" that the book
      uses, confirm the book defines it.
- [x] Re-run the refs.bib orphan/resolution audit from the completed
      Iteration 47 hygiene pass below.

## Phase 2/3 — Human-review structural polish pass

**Phase 2 reconciliation ledger (June 9, 2026).** The spine-v3 structural
rewrite executed most of this pass. Per-section status:

- §1 (through-line) — **absorbed/done**: Part 1 states the design question
  and five-stories through-line; Parts 4–5 transitions reuse it.
- §2 (insider wording) — **done**: "not housekeeping" rewritten (Part 2
  intro), "survives as a warning" replaced (Part 5 covariance sequence),
  contract caveat reordered after what-it-does (Part 3). "Licenses" sweep
  executed June 9, 2026 (Phase 3): the two vocabulary-justification uses
  replaced (Figure 1 caption, T1/T2 envelope sentence); the remaining
  sites are theorem-boundary or claim-licensing uses and stay.
- §3 (notation block) — **done**: ker-φ/level-sets sentence, K_θ reading
  order, μ_θ averaging sentence all in Part 3.
- §4 (negative-results hierarchy) — **absorbed/done**: Part 2 paired
  two-tier form; full gallery in the new appendix table.
- §5 (contract as evaluative tool) — **absorbed/done**: school example
  leads via Part 1, "why these primitives" paragraph, declared-vs-observed
  early, adequacy kept with a concrete school-path example.
- §6 (T1/T2 scaffolding) — **done** in Part 5 (exclusion framing,
  Cauchy–Schwarz inner-product reason, tilt phrase, covariance sequence).
- §7 (T3/T4 scaffolding) — **done** in Part 5 (derivation prose, c\* and
  λ inline, RLHF non-transfer tied to missing primitives). Relabel to
  "Toy proposition" declined per spine-v3 review (T-numbering kept).
- §8 (T4/T5 separation) — **done** in Part 4 ("Affordability is not the
  diagnostic", (h, 0) stated plainly). *Figure 3 caption revision stays
  Phase 4 (§10).*
- §9 (T5 polish) — **done** in Part 4 (sums-don't-cancel sentence, direct
  iff reading, "main additive-scorecard result", H–M as analogue, entry
  bridge sentence, conjunctive kept separate). H–M lit-review note verified
  substantive June 9, 2026 (Phase 3): formal-analogues sentence plus the
  multitask attribution-table row carry the relation.
- §10 (figures) — **done** June 9, 2026 (Phase 4): Figure 1 redesigned as
  a block/factor diagram; Figure 2 visualization-only note; Figure 3
  element labels + caption naming the four elements; Figure 4 per-bar
  clutter replaced with one H_per-vs-H_pop annotation.
- §11 (repo-side artifacts) — moved to `could-do/supporting-artifacts.md`;
  optional, outside the manuscript.
- §12 (synthesis) — first point (declared-vs-observed prominence) done in
  Part 3; the other two were execution-ordering guidance, now moot.

*Phase 3 residue:* executed June 9, 2026 — §2 "licenses" sweep done, §9
lit-review note verified, `prose-pass.md` executed (see its final
absorption status). Remaining manuscript work is Phase 4 only (§10
figures + final hygiene).

Source: `plans/04_06_2026_human_review.md` plus follow-up investigation of
`book/multidimensional-goodhart.typ`, `research/core-math.md`,
`research/negative_results.md`, figure sources, and claim audits.

Goal: preserve the paper's expected mathematical level while making the
structure legible. Do not ELI5 the theory in the manuscript. Instead, make the
reader's path clear: marginal score movement is underidentified; a declared
response model chooses which conditional calculation is valid.

### 1. State the main thread earlier and reuse it

- Add a compact through-line near the beginning of Part I: the same observed
  score movement can come from selection, fixed-type response, proxy repair,
  hidden-harmful gaming, or true target improvement; the framework's job is to
  declare which response story is being used before importing a calculation.
- Use that through-line as the transition into the contract and again before
  T1/T2, T3/T4, and T5. Each theorem section should answer: "which response
  story does this calculation cover?"
- Reduce local meta-prose that says a section "licenses" or "blocks" something
  without naming the concrete downstream calculation.

### 2. Replace insider wording with precise manuscript wording

- Replace caption/prose uses of "licenses" where it means "justifies the
  vocabulary" or "supports this calculation." Keep "does not license" only
  where it is doing explicit theorem-boundary work.
- Rewrite "The negative results are not housekeeping; they are the reason the
  framework has its current shape." Suggested direction: "The failed stronger
  claims determine the framework's shape: they rule out a single
  n-dimensional Goodhart law and leave conditional calculations tied to
  declared response models."
- In the contract opener, present what the contract does before saying what it
  is not. The caveat that it is not a theorem can move after the school-score
  example or into a short boundary sentence.
- Replace tonal phrases like "survives as a warning" with direct claims, e.g.
  "The example shows why zero baseline covariance is not enough at finite
  pressure."

### 3. Clarify the first notation block without lowering the level

- Tighten the dimension-gap sentence. If `phi` is being treated as linear,
  write that the dimension gap is represented by `ker phi`; if not, write in
  terms of fibers or level sets of `phi`. Avoid "directions such as `ker phi`"
  unless a broader non-linear case is actually intended.
- Add one compact sentence after `K_theta(ds | u)` explaining the reading:
  fixed type first, then policy exposure, then distribution over observed
  states. Keep the notation; just orient the conditional order.
- Add one compact sentence after the `mu_theta(A)` formula: it averages
  fixed-type response laws over the baseline type law, weighted by
  participation/selection, then normalizes. This should be enough for a
  mathematically proficient reader.

### 4. Rebuild the negative-results section as a hierarchy

- Separate "proved counterexample / toy theorem failure" from "scope audit /
  non-identification boundary." The current claim gallery mixes both.
- For each negative result, state the failed stronger claim and the surviving
  replacement in paired form:
  "Not X. What survives is Y."
- Make clear which negative results are proved by explicit counterexample
  (`dim ker phi` scaling, covariance, additive conservation, convex
  affordability) and which are methodological boundaries
  (type-representation relativity, marginal non-identification, response-shape
  overclaiming).
- Consider moving the full list of negative results to an appendix-style
  table, while keeping only the load-bearing subset in main text.

### 5. Make the response-modeling contract read as an evaluative tool

- Lead with the school-score example, then introduce the contract as the
  object that distinguishes the competing explanations.
- In the contract list, reduce hybrid math/plain-language noise by making each
  row use the same pattern: primitive, question it answers, why it matters for
  the calculation.
- Add a short "why these primitives" paragraph: hidden value/harm is needed
  for welfare claims; `W_theta` is needed for selection; `K_theta` is needed
  for fixed-type response; action costs/stakes are needed for intervention;
  aggregation is needed for scorecards.
- Keep the type-representation paragraph, but make its point explicit: the
  selection/intervention boundary is relative to the declared fixed type, so
  `U` is part of the empirical claim, not bookkeeping.
- Keep "contract adequacy," but decide whether it belongs in main text. If it
  remains, tie it to one concrete output example instead of leaving it as a
  general information-accounting checklist.

### 6. Add local theorem scaffolding before T1/T2

- Replace "This section covers T1 and T2 in `research/core-math.md`" with a
  reader-facing reason for starting with selection: it is the regime where
  policy changes only weights over a fixed baseline, so baseline variance and
  reweighting intensity can bound hidden drift.
- Briefly state why the bounds are Hilbert-space Cauchy-Schwarz bounds:
  hidden drift is an inner product between the reweighting residual `L - 1`
  and the centered hidden variable. Do not expand into a tutorial.
- Explain "valid exponential tilt" in one phrase: `exp(beta P)` must be
  normalizable on the pressure range being discussed.
- Replace the covariance paragraph with a sequence: covariance is the
  derivative at zero tilt; finite pressure depends on the whole tilted path;
  `H = Z^2 - 1` is the zero-covariance counterexample.

### 7. Add local theorem scaffolding before T3/T4

- Make the intervention transition explicit: once fixed types can act,
  baseline-distribution bounds are no longer the right object; the relevant
  primitive is action affordability under costs and stakes.
- For T3, include the one-line derivation in prose: a below-threshold unit must
  buy deficit `d = t - Q`; the cheapest passing action costs
  `d^2/(2 kappa)`; gaming is worthwhile iff this is at most `V`.
- Consider renaming the displayed result from "Theorem" to "Proposition" or
  "Toy proposition" if the current label reads too universal. The result is
  valid, but the rhetorical weight may be too high.
- For T4, define `c^*` inline as the convex conjugate and say that `lambda`
  is the multiplier/pricing variable for the score-deficit constraint.
- Keep the non-transfer sentence to ML/RLHF, but attach it to the missing
  primitives: action, cost, stakes, and pass condition.

### 8. Strengthen the T4/T5 separation

- Before Figure 3, say explicitly that T4 answers "can the agent afford the
  proxy movement?" while T5 or a hidden-harm model answers "what does that
  movement do to the protected target?"
- Revise the Figure 3 caption to identify the visual elements: score-clearing
  half-plane, private-cost contour, cost-minimizing action, and hidden-harm
  direction. The current caption assumes too much.
- In the hidden-harm example `(M, 0)`, state the point plainly: private cost is
  unchanged while value-weighted harm can grow arbitrarily with `M`, so
  affordability is not welfare.

### 9. Polish the T5 scorecard result

- Add one sentence after the formula explaining why the sums do not generally
  cancel: `kappa_j`, `w_j`, and `h_j` vary by channel, so the result is a
  weighted harm-per-score average.
- Explain the iff condition directly: harm is conserved across active measured
  sets exactly when every active channel has the same hidden harm per score
  unit, `h_j / w_j = c`.
- Replace "most exportable scorecard result" with a more precise phrase, e.g.
  "the main additive-scorecard result."
- Keep the Holmstrom-Milgrom reference, but cite it as an economics analogue,
  not grounding for the theorem. Add or verify a substantive note in the lit
  review before leaning on it in prose.
- Keep the fixed-deficit/per-agent versus population-entry distinction, but
  add one bridge sentence: lowering the cost of reaching the score can recruit
  additional below-threshold units, so conserved per-gamer harm does not imply
  conserved population harm.
- Keep conjunctive aggregation separate: it is a different aggregation rule,
  not a corollary of the additive formula.

### 10. Redesign or relabel figures whose visual grammar misleads

- Figure 1: replace the target-space square with a block/factor diagram or
  explicitly label it as a schematic decomposition, not a literal 2D space. A
  radar chart is probably only appropriate if named target dimensions are being
  shown.
- Figure 2: add visual labels explaining that two hidden coordinates are drawn
  only for visualization and that the ellipse is a declared covariance/value
  envelope.
- Figure 3: reduce ambiguity in the gray region and the near-linear contour by
  labeling score feasibility, cost contours, cost minimizer, and harm direction.
- Figure 4: when reviewing the next pages, check whether the gaming-band visual
  cleanly separates `H_per` from `H_pop`; that distinction is structurally
  important.

### 11. Optional supporting artifacts outside the paper

Moved to `plans/could-do/supporting-artifacts.md` (June 9, 2026) — optional
repo-side work, not manuscript polish.

### 12. Synthesis additions from the June 9, 2026 review session

Points raised by combining the human review with the consistency review;
neither pass alone captured them.

- **Declared-vs-observed status needs early prominence.** The human
  reviewer's Figure 3 question ("Requires hidden harm exchange rates? Can
  these even be defined? The harm is hidden..") and the §6.2 falsifier
  problem (Phase 0 §0.8) are the same gap seen from two sides: the book
  never makes prominent, early, that `h_j`, value weights, and most
  contract fields are *declared or estimated*, not observed. Add this to
  the contract section's framing so T5 and §6.2 read as conditional
  diagnostics rather than claims about observables. Feeds the same
  through-line work the spine gates.
- **Notation fixes are a prerequisite for the comprehension fixes.** The
  reviewer's T1/T2 questions ("Why are they Hilbert-space Cauchy-Schwarz
  bounds?") partly trace to `B_H(theta)` never being defined — the reader
  cannot reconstruct what is being bounded. Run Phase 0 §0.1 before
  executing the §6 theorem scaffolding, and likewise the `(M, 0)` rename
  (§0.2) before the §8 T4/T5 separation work: the reviewer's "not quite
  getting it" at that example lands exactly on the broken notation.
- **Two independent reads confirmed the main-thread problem.** The
  reviewer's "hardly a coherent main thread" note and the structural
  observation that Parts III–V are inventory restating the
  underidentification point converge from different reading modes. This
  validates the crystallization-first gate; it is not an item to fix here
  but the reason sections 1/4/5 above must wait for spine v3.

### 13. Execution order

Superseded by the phase pipeline in `plans/next-steps.md`. Within Phase 2/3,
the old local ordering still applies: through-line and contract setup first,
then notation block, then negative-results recast, then theorem scaffolding,
then T5 polish, then captions/figures, then the final prose pass.

## Proposition and reference hygiene — completed in Iteration 47

- Checked theorem numbering against the T1–T6 spine after the refactor landed.
- Audited `book/refs.bib`: every Typst citation in the book and abstract must
  resolve; no orphan bib entries. (The deprecated paper artifact is excluded
  from this audit.)
- Cross-checked `research/claim_audits.md` against the renumbered theorems
  so every claim audit row points at the current proposition number.
- Cross-checked `research/core-math.md` book pointers: every theorem statement
  there must reference the book section that proves it; no proof prose
  duplicated across the two files.

## Figures and appendices — completed in Iteration 47

- Rebuilt the generated figure set around four promoted manuscript figures:
  dimension/observation gap, T1/T2 drift envelope, T4/T5 cost ellipse, and
  population gaming band.
- Decided not to include raw simulation PNGs in the book; they remain
  verification artifacts.
- Superseded the old generated appendix PDFs and updated `book/FIGURE_AUDIT.md`
  plus `book/figures/RATIONALES.md`.

## Reproducible-build green-light — completed in Iteration 47

Before declaring era 1 closed:

- `cd book && make` builds the book and abstract from a clean checkout
  without errors, producing both PDFs.
- All `make iteration*` simulation targets run with deterministic seeds and
  match their recorded expected outputs.
- No stale generated PDFs are tracked in git; `git status --short` is clean
  after a build.
- The deprecated `book/multidimensional-goodhart-paper.typ` is archived per
  `plans/archived/spine-refactor.md` and not part of any default Makefile
  target.

## Consistency pass — completed in Iteration 47

- Checked that the book matches the latest research theorem files.
- Checked that the abstract is a denser version of the book.
