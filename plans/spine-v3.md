# Spine v3.0 — section-by-section manuscript spine

Status: draft for section-by-section user review (crystallization stage 5).
Governing spec: `plans/spine.md` (approved June 9, 2026). The manuscript
source does not change until this file is approved. Review state is tracked
per part: PENDING → APPROVED / REVISE.

Conventions: "current §x.y" refers to the post-Phase-0 book
(`book/multidimensional-goodhart.typ`, commit `2ed22e0`). Spine roles 1–12
refer to `spine.md` "Prospective Section Roles". Polish §n refers to
`plans/polish.md` Phase 2/3 sections.

Thesis every part must serve: **measurement design moves hidden harm
through exchange rates, not through dimension counts.**

---

## Part 1 — The Measurement-Dimension Question

Review: PENDING. Spine roles: 1, 2.

**Brief.** Open on the design question every scorecard owner actually has:
if we measure more things, fewer things, or different things, does the
damage from gaming get better, worse, or does it move? Present the two folk
intuitions ("more metrics, nowhere to hide" vs. "every metric is a new
attack surface") and state the book's answer in preview, satisfying the
first-page rule: neither intuition is a theorem; in the one clean closed
model, harm is conserved under measurement changes exactly when every
channel does the same hidden harm per score point (T5, stated informally,
formula deferred to Part 4). Then the challenge: observed score movement
underidentifies both mechanism and harm — introduced through the
school-score story (five stories, one score path). Ends with the book's
program: declare the response model, then calculate.

**Source mapping.** Current §1.1 (Goodhart/Strathern framing — compressed,
no longer the opening); the school-score story from current §1.4; the
response-channel intuition (selection vs. intervention, in words only) from
current §1.2. The formal notation block of §1.2 moves to Part 3. New prose:
the opening design question, the folk-intuition pair, the informal T5
preview.

**Theorems/figures.** T5 qualitative statement only (no formula, no box).
No figures. Figure 1 (dimension/observation gap) moves to Part 3 with its
polish §10 redesign.

**Polish absorption.** §1 (through-line stated here and reused as the
transition device in Parts 3–5); part of §2 (contract caveat ordering no
longer arises — the contract is introduced after the problem it solves).

**Open question for review.** How much T5 on page one: qualitative
conservation/rerouting claim only (recommended), or the informal
"harm-per-score-point" sentence as well?

---

## Part 2 — No Generic Law

Review: PENDING. Spine role: 3.

**Brief.** Why there is no unconditional multidimensional Goodhart law.
The killed claims, recast from the current "claim gallery" into paired form
("Not X. What survives is Y."), split into two tiers per polish §4: proved
counterexamples (dim-ker scaling, zero-covariance pressure, signed-error
cancellation, additive conservation failure, convex affordability ≠
welfare) and methodological boundaries (type-representation relativity,
marginal non-identification, response-shape overclaiming). Each pair points
forward: the failures are why the contract (Part 3) and the conditional
calculations (Parts 4–5) have their shapes.

**Source mapping.** Current §1.3 in full. Tier assignment per the polish §4
list. Consider the appendix-style table for the full list with only the
load-bearing subset in main text (polish §4 last bullet) — decision left to
drafting, flagged in review.

**Theorems/figures.** None. The $H = Z^2 - 1$ example stays here as the
covariance counterexample, restated directly (polish §2 tone fix).

**Polish absorption.** §4 entirely; the "negative results are not
housekeeping" rewrite from §2.

**Open question.** Full gallery in main text vs. load-bearing subset +
appendix table?

---

## Part 3 — The Response-Modeling Contract

Review: PENDING. Spine role: 4.

**Brief.** The primitive declaration required before any Goodhart
calculation is imported. Leads with the school-score example carried over
from Part 1 (the contract is introduced as the instrument that separates
those five stories), then the notation: type space, baseline law, response
kernel, selection weight, induced law μ_θ — each introduced once, with the
polish §3 orienting sentences. The contract table follows in uniform
row format (primitive / question it answers / why the calculation needs
it), then contract adequacy. Makes the declared-vs-observed status of
contract fields explicit and early (polish §12): hidden value, harm rates,
and channel labels are declared or estimated inputs, hidden from the
scorecard but not necessarily from the analyst.

**Source mapping.** Current §1.4 (minus the school story's first
appearance, now in Part 1); the formal notation block from current §1.2
including the dimension/observation gap definitions and Figure 1; the
μ_θ display appears exactly once in the book, here (resolving the Phase 0
§0.3 reprise fully).

**Theorems/figures.** No theorems. Figure 1, redesigned per polish §10
(block/factor diagram, not the misleading square).

**Polish absorption.** §3 (notation), §5 (contract as evaluative tool,
"why these primitives" paragraph), §12 declared-vs-observed point; figure 1
item of §10 (redesign scheduled Phase 4, placement fixed here).

**Open question.** None — this part is the most constrained by existing
plan decisions.

---

## Part 4 — The Exchange-Rate Diagnostic

Review: PENDING. Spine roles: 5, 6.

**Brief.** The book's central theorem, promoted from its current §2.3
position to the headline. States the additive fixed-deficit model, derives
H_M(d) as a weighted harm-per-score average (one-line Lagrange reading in
prose, polish §9), states the conservation iff h_j = c w_j, and interprets:
adding or removing measured channels conserves, reduces, increases, or
reroutes harm strictly through the exchange rates of the channels the
design makes cheap — dimension count never enters. Then the non-transfer
boundary as its own section (role 6): why additive aggregation, separable
quadratic costs, fixed deficit, and declared h_j each carry load; what
breaks under conjunctive gates and population entry (full treatment of
entry deferred to Part 5). Holmstrom–Milgrom cited as economics precedent,
not grounding.

**Source mapping.** Current §2.3 in full, including Figure 4
(population gaming band) and the per-agent/population distinction (the
boundary statement stays here; the mechanics move to Part 5). The
"(h, 0)" affordability-vs-welfare example from current §2.2 moves here as
the boundary illustration between cost minimization and harm (polish §8).

**Theorems/figures.** T5 (full box). Figure 4. Figure 3 (cost
ellipse) considered for this part if the T4/T5 separation lands here —
flagged for review.

**Polish absorption.** §9 entirely; §8 (T4/T5 separation, relocated); the
"most exportable" wording fix from §9.

**Open question.** Does Figure 3 (T4/T5 cost ellipse) belong here with the
boundary discussion, or in Part 5 with T4? Recommendation: here — its
caption's whole point is the T4→T5 handoff.

---

## Part 5 — Supporting Calculations

Review: PENDING. Spine roles: 7, 8.

**Brief.** The remaining closed results, each introduced by what it
contributes to the measurement-dimension question, never as independent
headlines (refused-claims list): T1/T2 selection bounds — score movement
without any unit acting, the channel that must be excluded before
exchange-rate reasoning applies; T3/T4 affordability — when a gaming
channel activates at all, supplying the "channels the design makes cheap"
input that Part 4 consumes; T6 hardening — capacity reduction as dynamic
measurement design; response-shape taxonomy (current §2.5) as conditional
statements only. Closes with the aggregation-and-entry section (role 8):
per-agent vs. population harm, conjunctive aggregation, entry recruitment —
the three ways measurement changes move harm outside T5's fixed-deficit
frame.

**Source mapping.** Current §2.1 (T1/T2 + Figure 2), §2.2 (T3/T4, minus
the (h,0) example moved to Part 4), §2.4 (T6), §2.5 (response shape);
population-entry mechanics from current §2.3.

**Theorems/figures.** T1, T2, T3, T4, T6 boxes. Figure 2 (drift envelope);
Figure 3 if not claimed by Part 4.

**Polish absorption.** §6 (T1/T2 scaffolding: why selection first → here
reframed as why selection must be ruled out; Cauchy–Schwarz one-liner;
exponential-tilt phrase; covariance sequence), §7 (T3/T4 scaffolding:
derivation in prose, c* defined inline, Proposition-vs-Theorem relabel
decision), §8 remainder.

**Open question.** Polish §7 suggests relabeling T3 "Toy proposition" —
decide during review whether the T1–T6 labels stay uniform (recommended:
keep "T" numbering for core-math.md correspondence, add "toy" in the
title as now).

---

## Part 6 — Prior Work, Stress Tests, and the Audit Protocol

Review: PENDING. Spine roles: 9, 10.

**Brief.** Reduction, not unification, demonstrated twice. First on the
literature: the primitive-attribution table — which contract fields each
source family supplies and omits — extended with a placeholder row family
for *empirical exchange-rate estimates* (HRRP readmissions-vs-mortality,
education audit-test transfer, NHS targets, reward-model overoptimization;
content arrives from the exchange-rate-empirics track). Second on cases:
MMLU, hospital readmissions, scientific metrics, each reframed to answer
"what would the exchange-rate audit need here, and what does the contract
refuse without it." Closes with the practical audit sheet (current §5.1,
Wentworth firehose-then-contract rule + audit-field table) as the
operational protocol the cases instantiate.

**Source mapping.** Current §3.1–3.4 (genealogy now includes the Phase 0
Lucas citation), §4.1–4.3, §5.1 in full. The DORA/Leiden framing stays in
the scientific-metrics case.

**Theorems/figures.** None. Two tables (primitive attribution; audit
sheet).

**Polish absorption.** §11's worked-ML-contract idea stays repo-side (not
manuscript); empirics placeholders per `plans/exchange-rate-empirics.md`.

**Open question.** Does the audit protocol (current §5.1) deserve its own
short part ("Using the framework") instead of closing Part 6?
Recommendation: keep inside Part 6 — as its own part it reads as a second
practical-implications essay, which is the current book's diffuseness
problem.

---

## Part 7 — Refusals, Falsifiers, Open Agenda

Review: PENDING. Spine roles: 11, 12.

**Brief.** What the framework declines to do and what would count against
it. Anti-applications (no stable primitives → no verdict), the
declaration-process falsifiers (Phase 0 §0.8 reframe carries over
unchanged), then the open agenda: residual-shape conjecture, composition/
identification/information gaps, toolkit gap — now including the
channel-level exchange-rate identification question from the empirics
track (under what policy-variation designs are per-channel h_j
identifiable from aggregate score and harm movement).

**Source mapping.** Current §6.1, §6.2 (as reframed), §7.1–7.3 in full.

**Theorems/figures.** None.

**Polish absorption.** None beyond carrying the 0.8 reframe.

**Open question.** None.

---

## Old → new mapping (completeness check)

| Current | Destination |
|---|---|
| §1.1 warning | Part 1 (compressed; no longer the opener) |
| §1.2 gaps + channels | intuition → Part 1; formal block + Fig 1 → Part 3 |
| §1.3 claim gallery | Part 2 (tiered, paired form) |
| §1.4 contract | school story → Part 1; contract + adequacy → Part 3 |
| §2.1 T1/T2 + Fig 2 | Part 5 |
| §2.2 T3/T4 + Fig 3 | Part 5 ((h,0) example and possibly Fig 3 → Part 4) |
| §2.3 T5 + Fig 4 | Part 4 (entry mechanics → Part 5) |
| §2.4 T6 | Part 5 |
| §2.5 response shape | Part 5 |
| §3.1–3.4 disciplines | Part 6 |
| §4.1–4.3 cases | Part 6 |
| §5.1 practical | Part 6 (audit protocol) |
| §6.1–6.2 refusals/falsifiers | Part 7 |
| §7.1–7.3 open agenda | Part 7 |

No silent drops; no current section is cut outright. The only candidate
cut is gallery-to-appendix compression in Part 2 (open question there).

Preserved lines (prose-pass §3, those present in the current draft):
"does not license" boilerplate → Parts 4–5 theorem boxes; hospital worked
contract → Part 6; ML/RLHF non-transfer caveats → Parts 4–6; "if hidden
coordinates are independent of the selected proxy, thresholding does not
move them" → Part 2.

## Abstract note

The abstract follows the first-page rule independently: reorganize to open
with the measurement-dimension question and the informal T5 answer; the
closed-theorem inventory moves after. Same part ordering as the book.
Execute in Phase 2 alongside the book rewrite.

## Title note (user decision, not blocking)

Current subtitle: "Response Channels, Scorecards, and Residual Shape."
A thesis-aligned alternative: "Measurement Dimensions, Exchange Rates, and
Hidden Harm." Decide before or during Phase 2.

## Verification performed on this draft

- All 12 spine.md roles covered exactly once (1,2→P1; 3→P2; 4→P3; 5,6→P4;
  7,8→P5; 9,10→P6; 11,12→P7).
- Old→new table covers every current book section.
- Refused-claims check: T5 is the only front-door theorem; T1–T4, T6
  appear solely in supporting roles; no generic dimensionality claim
  appears in any brief.
- First-page rule: Part 1 brief and abstract note both lead with the
  question and the informal T5 answer before any inventory.
- Each preserved prose-pass §3 line has a named destination.
