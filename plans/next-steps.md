# Next steps

Index for active plans. Individual plans live in sibling files.

## Update (July 11, 2026) — lit-review program closed; current focus

All four Track A lit reviews are closed (T5, T1/T2, T4, L1–L4 — status list
below) and the Track B citation audit is closed (single source:
`literature-reference-gap-paper/citation-audit/SUMMARY.md`). The paywalled
primaries from task 08 are pulled into `sources/` (gitignored — never commit).
The Phase-0-era plan files are archived in `archived/`.

**Current focus → `handoff-2026-07-11.md`** (the active pickup doc): the
pinned-number verification pass over `sources/` (its Step 2), then the
novelty-refactor capstone (its Step 3 — **gated on Xylix's explicit
green-light**; being handed the plan does not constitute it). Track B's next
action is the human-authored LessWrong post
(`could-do/track-b-lesswrong-post.md`). **Do not re-run discovery** — Phase 0
closed June 30, 2026 (master record: `archived/phase0-handoff.md`).

## Update (July 10, 2026) — Phase 0 closed, HARD STOP lifted, Track B rescoped

Phase 0 (unified cross-field discovery) completed, gate passed, adversarially
confirmed and primary-verified (June 28–30; master doc:
`archived/phase0-handoff.md`). The human judgment calls landed July 10:

- **Track B rescoped to a LessWrong-post-size artifact** foregrounding the
  applicable math (dictionary + what-transfers); the citation-trackery content
  stays repo-internal as evidence, not the published pitch.
- **Corpus widened to include clusters F & G** (one denominator, no exclusion
  to defend).
- **Order: Track B leads, Track A follows/parallel.** Next actions at the time:
  Phase 1a residual verifies (`archived/phase0-handoff.md` §10 items 1–5), then
  task 05 freeze — **both executed July 10–11**; see the July 11 update above.

Cross-track couplings noted July 10: `empirical_goodhart`'s multidimensional-
gridworld step (its README next-step 2) waits on Track A settling T5's
congruity reframe; `divergence-thresholds` needs its re-scope gate vs
Majka–El-Mhamdi 2025 before activation
(`divergence-thresholds/plans/rescope-vs-majka-elmhamdi.md`).

## Status (updated June 24, 2026)

The manuscript pipeline (Phases 0–4: consistency fixes, spine gate, spine-v3,
structural rewrite, polish, figures/hygiene) completed June 9, 2026; its
phase ledger is archived at
[`archived/manuscript-pipeline-ledger.md`](archived/manuscript-pipeline-ledger.md).

A post-pipeline editing round ran the same day: a fresh-context seam pass, a
cold read of the built PDF, and an external GPT-5 review, each followed by a
committed fix batch (records in `quality-checks/09_06_2026_*.md`; commits
607219d, e5dca88, a5d3b1c). Neither internal pass found structural problems;
the GPT-5 round produced the T5 universal-iff precision fix, which also updated
core-math.md and claim_audits.md. The one follow-on content item — the worked
contract pass on the school example (GPT-5 review item 4) — was executed later
the same day (`archived/worked-contract-pass.md`).

That round was treated as an **"editing done" milestone at the time, but it is
now superseded**: the prior-art lit-review program (June 23) and the
literature-reference gap paper (June 24) reopened book-content work. The gap
paper's audit surfaced new prior art and a field-wide reference gap, and an
entire literature-review thread — the three pending reviews plus the gap-paper
audit — must be **finished and integrated** (via the novelty-refactor capstone)
before the manuscript is ready to circulate or publish. **Editing is not done.**

## Active plan files

**Current focus: see the July 11 update at the top of this file** —
`handoff-2026-07-11.md` Steps 2–3.

The project has bifurcated into two deliverables that **shared one discovery
phase (Phase 0)** and then run on parallel tracks.

### Phase 0 — Unified cross-field discovery (shared) — CLOSED June 30, 2026

**Executed in full; do not re-run cross-field searches.** One discovery effort
fed both tracks (AI corpus, cross-field prior art, AI↔prior-art bridges,
primary-source verification); the plan-invalidating gate PASSED, was confirmed
by 12 adversarial passes, and primary-verified on every pillar that could flip
it. Master record: `archived/phase0-handoff.md`; spec:
`archived/litrev-discovery.md`; outputs:
`research/threads/lit_review/cross-field-discovery/`. Both tracks consumed it.

### Track A — Paper 1 / the book (critical path to publishing)

**Prior-art / novelty-refactor program (added June 23, 2026)** — inserted *ahead
of circulation* because it changes the manuscript significantly. The T5
exchange-rate lit review found that core "survived" theorems are likely classical
results in other clothes (T5 = contract-theory congruence), and that each parallel
lives in the theorem's *native field*, not the Goodhart literature. The paper's
honest contribution is therefore elementary cross-field synthesis, not novel math
— stronger, stated proudly, than the current motte-and-bailey. The three lit
reviews **consume Phase 0** (no independent searches) to resolve each theorem
against its native home, then a capstone refactors prose and math to cite existing
results and reduce novelty claims:

- ✅ **T5 exchange-rate** — done (`research/threads/lit_review/looking-for-exchange-rate-results/`).
- ✅ `archived/litrev-selection-bounds.md` — done July 11, 2026
  (`research/threads/lit_review/selection-bound-chapman-robbins/README.md`).
  Verdict: T1's inequality = HCR rearranged (Polyanskiy–Wu §29.1 eq. 29.1);
  envelope = χ²-DRO worst case (Namkoong–Duchi Thm 1; Ben-Tal machinery only);
  T2 skeleton = matrix-HCR ellipsoid + support function; surviving contribution
  = selection-channel reading + declared-value-norm packaging (framing, not
  math). The `formal_analogue_lit_map.md` "no χ² analogue" false negative is
  corrected in place.
- ✅ `archived/litrev-convex-budget.md` — done July 11, 2026
  (`research/threads/lit_review/convex-budget-fenchel/README.md`).
  Verdict: T4 = textbook Lagrangian/perturbation value-function duality
  (Rockafellar 1970 §28–31, by section until pulled); quadratic corollary =
  elementary conjugate; no Goodhart/strategic-classification source states
  the budget form (auditable negative; Hardt 2016 nearest in substance);
  surviving contribution = affordability reading + channel placement
  (framing, not math). Recommend demoting T4 to "Fact" in the capstone.
- ✅ `archived/litrev-lower-tier.md` — done July 11, 2026
  (`research/threads/lit_review/lower-tier-parallels/README.md`).
  Verdict: L1 = observational equivalence / selection-vs-treatment
  identification (representation-relativity clause survives as framing); L2 =
  textbook exponential-family cumulant fact (one-line nod); L3 = quadratic-cost
  costly threshold-crossing (Spence / Hardt; Frankel–Kartik Prop. 2 the only
  verified-primary in family); L4 = static threshold exactly T4 specialized,
  security-games anchor at recognition altitude, termination argument survives
  as the book's elementary construction. No escalations.
- ⬜ `novelty-refactor.md` — capstone; **unblocked July 11, 2026 (all four
  reviews closed) but gated on Xylix's explicit green-light**; run with the
  pinned numbers from `handoff-2026-07-11.md` Step 2 in hand; reframes the
  paper as synthesis + contract + the subset-invariance reading. Reopens the
  "editing done" milestone.

Context is captured in the `t5-prior-art-congruity` and
`paper1-is-elementary-synthesis` memories. The lit-review-era pickup TL;DR
(method, per-review status, guardrails) is archived at
`archived/litrev-handoff.md`; the active pickup doc is `handoff-2026-07-11.md`.

Book content state: the exchange-rate empirics track completed June 11, 2026
(execution record in `archived/exchange-rate-empirics.md`); Part 6's empirical row
is filled and Part 8's identification question answered. The book is **not**
otherwise content-stable — the novelty-refactor will change T1–T6 prose and math,
the related work, the intro, and `refs.bib`.

Track A pipeline (revised June 24, 2026); nothing is ready to circulate or publish
until these land, in order:

0. ✅ **(Shared Phase 0)** — closed June 30, 2026 (see above).
1. ✅ **The lit reviews** — all closed July 11, 2026, per the status list above.
2. **Integrate via the novelty-refactor capstone** — **next, gated on Xylix's
   green-light** (preceded by the `handoff-2026-07-11.md` Step-2 pinned-number
   pass) — reopens book-content work: T1–T6 prose/math, related work, intro,
   `refs.bib`.
3. **Final reading round — after integration.** The June 11 LLM reviews (two
   clean-context, both "ready to circulate after fixes"; disposition at
   `quality-checks/11_06_2026_llm_reviews_disposition.md`; fix batches 3a51552,
   b74e353, d10583f, f48094a; prior-work table reflowed in 3345a59) and the
   in-progress manual human read **predate the refactor and only partly carry
   over** — the changed sections need a fresh read. Remaining human-read items
   still apply: the notation-overload TODO (`could-do/notation-overload-pass.md`),
   the divergence-seam paper-1 improvements
   (`could-do/divergence-seam-paper1-improvements.md`: I1/I2/I5 ride with the read;
   I3 is a separate pre/post-circulation decision), and the worked-positive
   subsection (book pp. 23–24).
4. **Circulate the draft** — send for comments and/or post on LessWrong; the next
   external step, not formal publishing.
5. Only then the **publishing decision** proper (venue, format, release checklist).

### Track B — Gap paper (parallel; can circulate ahead of Paper 1)

> **Rescoped July 10, 2026:** target is now a **LessWrong post**, not an academic
> paper — applicable math foregrounded, citation audit repo-internal; corpus
> includes clusters F & G. See the July 10 update above and
> `archived/phase0-handoff.md` §11.

**Gap paper (proposed June 24, 2026)** — `literature-reference-gap-paper/`
(self-contained: `plan.md` + `citation-audit/` + eventual draft). A short
*standalone* paper: the AI-safety Goodhart canon cites essentially none of the
economics / management-science / accounting prior art that contains the same math
— confirmed by a 25-paper systematic coded audit (`citation-audit/audit.md`); the
gap is real but localized to the performance-measurement branch of contract
theory. Contribution is bibliographic + synthesis (the coded audit + the
cross-field dictionary + "what AI safety can learn"). **Not blocked** on the
Track-A lit reviews; can circulate ahead of Paper 1. Seeds Paper 1's reframed
related-work; does not replace the novelty-refactor.

- ✅ Seed pass — 25-paper coded table (`citation-audit/audit.md`) and
  refined-thesis findings (`citation-audit/findings.md`). A seed, not a corpus.
- ✅ **Audit CLOSED (2026-07-11, tasks 05–10 complete, verified).** Frozen
  corpus N=117 / 115 minable; every hit two-method verified; headline:
  CONTRACT 8✓+1△/115 with **0/60 in the reward-hacking+RLHF core**;
  PUBFIN/2BEST/CORRECT 0/115; ESTIM never as prior theory; exception floor =
  2026 bridges (I1/I2/A9) + CHAI (record-version Gibbons/Kerr only) + F-cluster
  periphery. Single consolidated source: **`citation-audit/SUMMARY.md`**
  (headlines, exceptions, verified should-be-cited set, BBS delta, mechanisms,
  limitations, overclaim pass) + `citation-audit/gap-refs.bib`.
- ⬜ **Next action: write the LessWrong post from `citation-audit/SUMMARY.md`**
  — **HUMAN-AUTHORED by decision (July 11, 2026)**: prose written by Xylix on
  her own schedule; agent roles limited to outline sparring, fact-checking
  against SUMMARY.md §10, and overclaim-pass review of drafts. Plan:
  `could-do/track-b-lesswrong-post.md`. Not blocking Track A (which now
  proceeds: two remaining litrevs → novelty-refactor capstone).

Optional items live in `could-do/` (now including
`could-do/rlhf-identification-experiment.md`, the one feasible harm-side
identification design, extracted from the empirics plan at archival).

## Parked or declined

- Splitting Part 7 ("Using the Framework") into its own standalone essay —
  flagged non-blocking during the spine-v3 review.
- `could-do/supporting-artifacts.md` — worked ML contract, toy notebook,
  Lean starting points (extracted from polish.md §11).
- **Declined June 9, 2026:** moving Part 7 earlier in the book (GPT-5 review
  item 7) — the audit table is only meaningful after the contract and
  theorems exist, and the approved spine places it accordingly.

Completed or superseded plans are in `archived/`; recently archived (July 11,
2026, at lit-review-program close): `phase0-handoff.md` (the Phase-0 master
record), `phase0-todo.md`, `litrev-discovery.md` (the Phase-0 spec),
`litrev-selection-bounds.md`, `litrev-convex-budget.md`,
`litrev-lower-tier.md` (the three executed review plans), and
`litrev-handoff.md` (the lit-review-era pickup doc). Earlier:
`worked-contract-pass.md` (executed June 9),
`manuscript-pipeline-ledger.md` (the executed Phase 0–4 ledger), `spine.md`
and `spine-v3.md` (the executed spine artifacts), `prose-pass.md` and
`polish.md` (executed ledgers, kept as audit records),
`04_06_2026_human_review.md` (raw notes, fully distilled). Optional future
work lives in `could-do/`.

## Process history

The crystallization process that produced the spine (hard rule, five gated
stages, reader-interest mapping) completed June 9, 2026 and is archived at
[`archived/crystallization-history.md`](archived/crystallization-history.md).
The Era-1 closure planning before it is archived at
[`archived/era1-closure-history.md`](archived/era1-closure-history.md).
