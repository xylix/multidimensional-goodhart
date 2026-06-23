# Could-do: divergence-seam improvements for paper 1

Status: could-do, fix-batch plan. These are scoping/phrasing improvements to the
*current* book (paper 1), surfaced by spinning off the divergence/catastrophe
work into a separate track (`divergence-thresholds/`). None adds math. All are
freeze-compatible and meant to ride with the pending **manual human reading
round** (`plans/next-steps.md` step 1), alongside `notation-overload-pass.md`,
with the usual deterministic rebuild verification.

## Why this exists

Paper 2 (`divergence-thresholds/`) takes the *severity* half of the story:
once gaming activates, is degradation bounded or catastrophic, governed by the
tail index of hidden value/harm relative to the optimization channel. That
reframes several of paper 1's claims as *one half* of a story, which gives paper
1 new obligations: don't over-read the activation thresholds as severity claims,
and don't foreclose the conditional-threshold sequel rhetorically.

The theme is already half-present in paper 1, so this is consistency work, not
new scope:

- `research/claim_audits.md` (Majka & El-Mhamdi row) already states the
  light-tail/heavy-tail dichotomy and calls the heavy-tail boundary "the natural
  next step for a sharper scalar-generalization story."
- `research/claim_audits.md` (Iteration 15, T2 row) already records that the
  selection bound is "not a practically useful bound when `chi^2` is huge or
  infinite."

Paper 2 is that natural next step; these edits make paper 1 read as deliberately
deferring it rather than missing it.

## Improvement items

### I1. Scope the threshold theorems as *activation*, not *severity*

- Issue: T3/T4/T6 answer "does gaming switch on." Readers will over-read them as
  "crossing the threshold = catastrophe / staying under = safe," which is the
  severity claim paper 2 owns.
- Where: book sections 5.2 ("Intervention: when a gaming channel activates") and
  5.3 ("Adaptive hardening"), near the T3/T4/T6 statements.
- Minimal fix: one explicit sentence — these thresholds say whether gaming is
  *worthwhile/feasible*, not how much true value is lost once it is.
- Why (seam): makes paper 2 a sequel rather than an erratum.
- Risk if skipped: paper 2's severity results read as contradicting paper 1.

### I2. Foreground the finite-second-moment / `chi^2` caveat in T2

- Issue: presenting `|Delta V_H| <= delta sqrt(v^T Sigma_H v)` as the story and
  burying the moment condition makes paper 2 look like it patches a gap paper 1
  missed.
- Where: T2 statement (book section 5.1) and any reader-facing summary of the
  selection theorem.
- Minimal fix: state the finite-second-moment (light-tail) hypothesis as a
  *named, load-bearing* assumption, and note the heavy-tailed regime is a
  separate question. The audit row already exists; this carries it into the
  prose as a live assumption, not fine print.
- Why (seam): that caveat is paper 2's thesis in seed form (conjecture C1).
- Risk if skipped: paper 2 has to re-introduce the tail condition as if new.
- Status (2026-06-23, from the sharpness session): **effectively done — reconcile,
  don't restate.** Commit 1d939c4 added a T1/T2 necessity witness (finite hidden
  variance + infinite `delta` => infinite drift) with a reader-facing "Sharpness"
  paragraph in book §5.1 and worked witnesses in `core-math.md`. That promotes the
  `L^2`/finite-`chi^2` hypothesis from fine print to a named load-bearing
  assumption *and* sharpens the non-license: the conclusion genuinely fails, not
  just the bound. The remaining I2 action is to ensure the fix batch
  cross-references that paragraph rather than adding a second caveat.

### I3. Add a named open-problem subsection to Part 8, anchored to the Extremal boundary clause

Consolidates the former I3 (cite El-Mhamdi/Majka as tail-dependent) and I4
(defer below-baseline / catastrophic) into one curated pointer. Scattering them
as one-line edits is weaker than a single named agenda item, and the book
already provides the anchor.

- Insight: the book already names the shoe to fill. In Part 7's
  `== The four variants by channel` the Extremal variant is left as a *boundary
  clause, no theorem* (`research/reviews/mg_taxonomy_correspondence.md`):
  `delta -> infinity` marks where the selection envelope *retires*, and the
  reversal that makes Extremal dangerous lives in the relationship change
  (heavy-tailed `epsilon`, regime break), which the book *imports* from
  El-Mhamdi / Majka tail families rather than proves. Paper 2's tail-index
  divergence (conjecture C1) is precisely the formalization of that retired
  regime.
- Anchor now concrete (2026-06-23, from the sharpness session): commit 1d939c4
  added the `delta -> infinity => infinite drift` necessity witness and a
  "Sharpness" paragraph in book §5.1. That witness *is* the precise "where the
  envelope retires" statement, so the Part 8 subsection should **cite it as its
  anchor** rather than re-derive the retirement. Scope caution: the witness
  isolates the *selection-intensity* route (`delta -> infinity`, finite hidden
  variance); paper 2's C1 is the *hidden-value tail-index* route. They are two
  faces of "tails diverge," not the same statement — mark the `delta` half as
  in-scope-and-witnessed and the heavy-tailed-value severity half as deferred to
  the track.
- Where: Part 8 ("Refusals, Falsifiers, and the Open Agenda", book ~line 1097),
  a new subsection parallel to `== The residual-shape conjecture` (~line 1155).
  Cross-reference the Part 7 Extremal treatment (`== The four variants by
  channel`, ~line 731).
- Minimal fix: one named subsection (e.g. `== When the envelope retires` or
  `== The severity question`) that does three things in one place:
  1. States the open problem: once gaming activates, is degradation bounded or
     catastrophic? The activation thresholds (T3/T6) do not answer this.
  2. Anchors it to the Extremal boundary clause — "the regime where the
     selection envelope retires" — citing El-Mhamdi/Majka tail dependence
     honestly. (This is the former I3.)
  3. Defers the catastrophic / below-baseline regime, including Zhuang &
     Hadfield-Menell (O8) and Gao et al. overoptimization curves, to separate
     work — without claiming to generalize Z&HM, explain the Gao curves, or
     pre-commit to conjecture C1. (This is the former I4.)
- Why (seam): one deliberate hand-off reads as a curated agenda item, not a gap;
  it keeps the anchor citations consistent across both papers and reserves the
  territory for paper 2.
- Risk if skipped: tail dependence is acknowledged in the lit map but has no
  agenda item in the book; deferrals are scattered; the sequel territory is
  unmarked and invites an "why no overoptimization?" objection.
- Guardrails: keep it curated — one subsection, not a dump of `open_questions.md`
  (cross-reference O8 at most). Respect M&G guardrail 6 (reduction plus selective
  sharpening, not a rival taxonomy); do **not** relabel Part 7 as "solved."
- Scope note: unlike I1/I2/I5/I6 (phrasing fixes), this is an *additive
  subsection* — real book-content work that reopens the "editing done" milestone
  (`plans/next-steps.md`). Decide separately whether it rides pre- or
  post-circulation; a future-work pointer strengthens a circulation draft, so
  pre-circulation is defensible.

### I5. Keep "no universal scalar" without denying conditional thresholds

- Issue: paper 1's anti-universal-scalar message (the title-doc "Main Caution")
  must attack *universality*, not the *existence* of sharp conditional regimes —
  otherwise it rhetorically forecloses paper 2's conditional threshold.
- Where: the title/subtitle framing, the abstract, and anywhere the
  no-universal-effect-size message appears (`plans/could-do/titles-and-subtitles.md`).
- Minimal fix: phrase as "severity is not one number; it is conditional on
  declared tail/value structure and characterized separately" rather than
  anything that reads as "Goodhart has no thresholds."
- Why (seam): paper 2 asserts a conditional threshold; paper 1's rhetoric must
  leave room for it.
- Risk if skipped: paper 1 appears to contradict its own sequel's premise.

### I6. Lock the notation paper 2 will crank (fold into the notation pass)

- Issue: paper 2 dials "optimization pressure" (selection intensity `delta` /
  `chi^2`; the `exp(beta P)` tilt strength `beta`) and leans on the value
  functional `v` / value norm `||.||_V`. Loose handles in paper 1 become
  confusion in paper 2.
- Where: fold into `plans/could-do/notation-overload-pass.md`, which already
  flags the `V` overload (stakes in T3/T4/T6 vs the value-norm subscript in T2)
  — exactly the two symbols paper 2 uses most.
- Minimal fix: when the notation pass runs, ensure (a) one stable handle for
  "optimization pressure," and (b) a clean, unambiguous symbol for the value
  functional / value norm distinct from stakes.
- Why (seam): paper 2 inherits whatever paper 1 fixes here.
- Risk if skipped: the `V` ambiguity compounds across two papers.

## What this plan deliberately does not do

- No new theorem, no new math, no new empirical claim in paper 1.
- No promise that conjecture C1 is true — paper 1 only defers the question.
- No edits to the frozen manuscript or to canonical `core-math.md` /
  `claim_audits.md` outside a reviewed reading-round fix batch.

## Execution

- I1, I2, I5 are phrasing fixes: batch them with the manual human reading round
  (`plans/next-steps.md` step 1). Route I6 through `notation-overload-pass.md`.
- I3 is an additive Part 8 subsection, not a phrasing fix: it reopens
  book-content work, so it needs a separate pre- vs post-circulation decision
  before drafting (prose draft deferred to a follow-up; see the note in the
  conversation that produced this plan).
- After the edits land, add one license/non-license row to
  `research/claim_audits.md` recording the activation-vs-severity seam (so the
  boundary is auditable), and rebuild the book deterministically to verify.
