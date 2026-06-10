# GPT-5 external review — triage record (June 9, 2026)

The user obtained an external GPT-5 review of the manuscript and asked for a
think-through. This file records the eight points, the verdict on each, and
where the accepted fixes landed (fix batch 3, commit a5d3b1c). Companion
records: `09_06_2026_fresh_context_seam_pass.md` (batch 1),
`09_06_2026_cold_read_pdf.md` (batch 2).

| # | GPT-5 point | Verdict | Action |
|---|---|---|---|
| 1 | T5's "conserved across compared active measured sets exactly when h_j = c w_j" is wrong for a specific pair; the iff holds for invariance across arbitrary measured-set changes. | **Correct — the most valuable catch of the three June 9 reviews.** Verified against `research/threads/core_propositions_and_value_norms.md` §7: singleton comparisons force each ratio to the common value, so the proven iff is the universal form; a particular pair can match coincidentally (e.g. rates (2, 0) vs a third channel at rate 1). | Reworded as invariance across all measured sets drawn from a channel pool, with the pairwise caveat spelled out, in: T5 box, its explanation paragraph, the Part 8 falsifier bullet, the abstract, `core-math.md`, `claim_audits.md` row 86. |
| 2 | Make the "one closed model" limitation more visible in abstract/introduction. | Already handled: it is the third sentence of the abstract and ¶3 of page 3. Further amplification risks over-hedging. | None. |
| 3 | Theorem numbering awkward; T5 appears before T1–T4. | Narrative numbering is deliberate (matches core-math inventory; spine v3 promoted T5). The forward reference at 4.2 was already explicit. | One sentence added to the Part 4 opening: numbers follow the research record's fixed inventory; T5 is the headline; T1–T4/T6 are stated in Part 5. Renumbering declined. |
| 4 | Add a worked 4–5 field pass through the school example after the contract box. | Accepted as a content addition — GPT-5's best structural suggestion. | Planned, not yet executed: `plans/worked-contract-pass.md`. |
| 5 | "Regularity for convex duality" (T4), "active channels" (T5), "progress-aware largest-action multiplicative rule" (T6) are only gestured at. | Correct for a formal reader; all three had precise definitions in the research record. | Local glosses added: Slater-type condition (after T4), active = nonzero load under positivity (T5 paragraph), α-multiplication on non-floored channels per claim_audits row 131 (after T6). |
| 6 | Add one minimal hypothetical audit showing what evidence would estimate a harm rate. | Legitimate gap, but it is the territory of the active empirics track. | Folded into `plans/exchange-rate-empirics.md` as a named deliverable (HRRP as the vehicle). |
| 7 | Move the practical section (Part 7) closer to the front, or preview it earlier. | **Declined** (user concurred June 9): the audit table is only meaningful after the contract and theorems exist; spine v3 was approved with this placement; Part 6 already hands off to Part 7 explicitly. | None. |
| 8 | Negative phrasing accumulates; counterbalance with "positive survivor" phrasing. | Half-true but largely by design and already counterbalanced: every Part 2 entry ends "What survives is…"; 7.1 has the "conclusion can be positive, but it has to be narrow" paragraph. A sweep risks diluting the voice. | None. |

Side catch during triage: the abstract still had the subscript-absorption bug
fixed in the book in batch 2 (`W_theta(u)`, `K_theta(ds|u)`, `H_M(d)`,
`S_t(M)`); fixed in batch 3.
