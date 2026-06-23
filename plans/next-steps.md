# Next steps

Index for active plans. Individual plans live in sibling files.

## Status (June 9, 2026)

The manuscript pipeline (Phases 0–4: consistency fixes, spine gate, spine-v3,
structural rewrite, polish, figures/hygiene) completed June 9, 2026; its
phase ledger is archived at
[`archived/manuscript-pipeline-ledger.md`](archived/manuscript-pipeline-ledger.md).

A post-pipeline editing round ran the same day and is the project's
**"editing done" milestone**: a fresh-context seam pass, a cold read of the
built PDF, and an external GPT-5 review, each followed by a committed fix
batch (records in `quality-checks/09_06_2026_*.md`; commits 607219d,
e5dca88, a5d3b1c). Neither internal pass found structural problems; the
GPT-5 round produced the T5 universal-iff precision fix, which also updated
core-math.md and claim_audits.md. The one follow-on content item — the
worked contract pass on the school example (GPT-5 review item 4) — was
executed later the same day (`archived/worked-contract-pass.md`). What
remains is research work and publishing — not editing or book-content work.

## Active plan files

None. The exchange-rate empirics track completed June 11, 2026 (all four
steps plus a fresh-context review gate; execution record in
`archived/exchange-rate-empirics.md`). The book's Part 6 empirical row is
filled and Part 8's identification question answered; the book remains
content-stable otherwise.

Agreed direction (June 11, 2026), in order:

1. **One more reading round** before circulation. *LLM half done June 11:*
   two clean-context reviews (GPT + Claude), both "ready to circulate
   after fixes"; disposition record at
   `quality-checks/11_06_2026_llm_reviews_disposition.md`; fix batches
   committed (3a51552 refs, b74e353 book text, d10583f worked-positive
   example, f48094a abstract; the prior-work table was separately
   converted to per-family blocks in 3345a59). *Remaining: the manual
   human read* — check items include the notation-overload TODO
   (`could-do/notation-overload-pass.md`), the divergence-seam paper-1
   improvements (`could-do/divergence-seam-paper1-improvements.md`: I1/I2/I5
   ride with this read; I3 is a separate pre/post-circulation decision), and a
   read of the new worked-positive subsection (book pp. 23–24).
2. **Circulate the draft** — send to someone for comments and/or post on
   LessWrong. This, not formal publishing, is the next external step.
3. Only then start the **publishing decision** proper (venue, format,
   release checklist).

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
