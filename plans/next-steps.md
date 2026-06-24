# Next steps

Index for active plans. Individual plans live in sibling files.

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

**Prior-art / novelty-refactor program (added June 23, 2026)** — inserted
*ahead of circulation* because it changes the manuscript significantly. The T5
exchange-rate lit review found that core "survived" theorems are likely
classical results in other clothes (T5 = contract-theory congruence), and that
each parallel lives in the theorem's *native field*, not the Goodhart
literature. The paper's honest contribution is therefore elementary cross-field
synthesis, not novel math — which, stated proudly, is stronger than the current
motte-and-bailey. Three lit reviews resolve this against each theorem's home,
then a capstone refactors prose and math to cite existing results and reduce
novelty claims:

1. `litrev-selection-bounds.md` — T1/T2 vs Chapman–Robbins / χ²-DRO (highest
   priority; our own `research/reviews/formal_analogue_lit_map.md` currently
   asserts the opposite, "no χ² analogue").
2. `litrev-convex-budget.md` — T4 vs Fenchel/Rockafellar (low-effort confirm).
3. `litrev-lower-tier.md` — selection/intervention identification, exponential
   tilt, T3, T6 (bundled).
4. `novelty-refactor.md` — capstone; **blocked on 1–3 plus the completed T5
   review** (`research/threads/lit_review/looking-for-exchange-rate-results/`);
   reframes the paper as synthesis + contract + the subset-invariance reading.
   Reopens the "editing done" milestone.

Context is captured in the `t5-prior-art-congruity` and
`paper1-is-elementary-synthesis` memories.

**Gap paper (proposed June 24, 2026)** — `literature-reference-gap-paper/plan.md`
(self-contained directory: plan + citation audit + eventual draft). A short
*standalone* paper spun out of the June 24 lit-review session: the AI-safety Goodhart canon
cites essentially none of the economics / management-science / accounting prior
art that contains the same math — confirmed by a 25-paper systematic coded audit
(`literature-reference-gap-paper/citation-audit/`); the gap is real but localized
to the performance-measurement branch of contract theory. Contribution
is bibliographic + synthesis (a coded citation audit + the cross-field
dictionary + "what AI safety can learn"), so it is **not blocked** on the T1/T2,
T4, lower-tier verdicts and could circulate ahead of Paper 1. Seeds Paper 1's
reframed related-work; does not replace the novelty-refactor.

The exchange-rate empirics track completed June 11, 2026 (all four steps plus a
fresh-context review gate; execution record in
`archived/exchange-rate-empirics.md`). The book's Part 6 empirical row is filled
and Part 8's identification question answered. The book is **not** otherwise
content-stable: the prior-art / novelty-refactor program and the gap-paper
integration above will change T1–T6 prose and math, the related work, the intro,
and `refs.bib`.

Agreed direction (revised June 24, 2026). The lit-review program reordered this:
nothing is ready to circulate or publish until the literature-review thread is
finished and integrated. In order:

1. **Finish the literature-review thread.** The three pending reviews —
   `litrev-selection-bounds.md` (T1/T2), `litrev-convex-budget.md` (T4),
   `litrev-lower-tier.md` — plus the gap-paper citation audit
   (`literature-reference-gap-paper/`, recorded in `citation-audit/`). The gap
   paper is a parallel track and can circulate independently, ahead of Paper 1.
2. **Integrate via the novelty-refactor capstone** (`novelty-refactor.md`),
   which reopens book-content work: T1–T6 prose/math, the related work, the
   intro, and `refs.bib`.
3. **Final reading round — after integration.** The June 11 LLM reviews (two
   clean-context, both "ready to circulate after fixes"; disposition at
   `quality-checks/11_06_2026_llm_reviews_disposition.md`; fix batches 3a51552,
   b74e353, d10583f, f48094a; prior-work table reflowed in 3345a59) and the
   in-progress manual human read **predate the refactor and only partly carry
   over** — the changed sections need a fresh read. Remaining human-read items
   still apply: the notation-overload TODO
   (`could-do/notation-overload-pass.md`), the divergence-seam paper-1
   improvements (`could-do/divergence-seam-paper1-improvements.md`: I1/I2/I5
   ride with the read; I3 is a separate pre/post-circulation decision), and the
   worked-positive subsection (book pp. 23–24).
4. **Circulate the draft** — send for comments and/or post on LessWrong; the
   next external step, not formal publishing.
5. Only then the **publishing decision** proper (venue, format, release
   checklist).

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

Completed or superseded plans are in `archived/`; recently archived:
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
