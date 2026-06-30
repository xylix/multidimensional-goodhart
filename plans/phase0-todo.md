# Phase 0 → consume-phase TODO

Companion to `phase0-handoff.md` (read that for the gate verdict, the established
facts, and the insights/gotchas). This file is just the action lists. Created
2026-06-30.

The HARD STOP is at **human review of the gate verdict + the manual pulls**. The
informed approve/disapprove checklist is in §0; once that's cleared, work the two
lists below.

---

## 0. Informed approve/disapprove on the gate verdict (do FIRST)

The verdict is built largely from AI-run searches + AI classification, so spot-check
the load-bearing joints rather than trusting wholesale. Minimum viable due diligence
≈ 2 hours. Ranked by (impact if false) × (how well-verified now):

**Tier 1 — the three things that would flip the verdict (check personally):**
- [ ] **Read BBS 2023 yourself** (`sources/Dead-rats-dopamine-performance-metrics-and-peacock-tails-proxy-failure_BBS_2023.pdf`). The "BBS is qualitative, not formal → our delta is real" pillar was decided **without reading the body**. Check: does it state a formal proxy-vs-goal *vector* theorem (G/P vectors, congruity/proportionality, distortion=1−cosθ, a proof), or stay verbal while merely *citing* Baker 2002/Holmström? Latter → delta intact; former → rescope. **Weakest-verified pillar.**
- [ ] **Confirm the two new bridges don't reach the core.** Wang–Huang (arXiv:2603.28063) and Haupt (arXiv:2605.30916) are verified to *exist*; the load-bearing claim that they reach **only HM1991/Baker** (not Feltham–Xie / Baker-2002 cosine / HCR) is from the passes. Skim their reference lists / relevant sections.
- [ ] **Sanity-check χPO = HCR identity** (arXiv:2407.13399): confirm its χ² bound is the HCR variational form and its refs exclude Chapman–Robbins/Ben-Tal/Namkoong–Duchi. Strongest "reinvented uncited" data point. (AI-doable.)

**Tier 2 — spot-check the bibliographic spine (~20 min; makes/breaks method trust):**
- [ ] Re-run ONE OpenAlex census query yourself (log in `bridges.md §Auditable query log`) — e.g. does Ben-Tal 2013 really have 0 reward-hacking papers among its 129 CS citers? does Feltham–Xie have 0 alignment citers?
- [ ] Read the citing sentence in ONE "type-(ii)" paper (e.g. DRO-REBEL citing Namkoong–Duchi) and decide for yourself whether "tooling, not a Goodhart bridge" is fair. The verdict hinges on the type-(i)/(ii) distinction.

**Tier 3 — judgment calls (no fact-check; only you can make these):**
- [ ] Is the tightened contribution strong enough to publish, given "first to bridge" is dead (Wang–Huang/Haupt hold it)? Surviving pitch: quantified audit + breadth dictionary + uncited identities + subset-invariance.
- [ ] Is the corpus boundary defensible? (Excluding strategic-ML cluster F + benchmark-overfitting cluster G is the most likely referee attack — a framing call, not in the data.)

**Disapprove / rescope triggers:** BBS carries a formal theorem → kill the gap-paper framing (Track A reframes may still stand); a spot-checked census row is wrong → send back before any freeze; contribution judged too thin → kill Track B, keep Track A.

---

## 1. YOUR TODO (manual — before the next AI session)

**A. Decide & approve:**
- [ ] Approve/disapprove the gate verdict (per §0).
- [ ] Choose next: **Track A** (per-theorem reviews), **Track B** (gap paper 05→10), or **both in parallel**.
- [ ] Set the corpus-freeze scope for Track B: include/exclude clusters F (strategic-ML) and G (benchmark-overfitting); final denominator N (~25 core, or pad to 30–40).

**B. Pull paywalled/scanned primaries the AI can't reach** (substance already verified-secondary; you're fetching the pinned proposition/theorem numbers — list in `prior-art-verification.md §MUST be pulled`):
- [ ] Feltham–Xie 1994 (own prop #) · Baker 1992 & 2002 (scanned — need clean copy/OCR) · Holmström–Milgrom 1991 · Datar–Kulp–Lambert 2001 · Rockafellar 1970 *Convex Analysis* (Fenchel/perturbation theorem #) · Ridgway 1956 (verbatim composite-measure quote) · Chetty AEJ version (only if "Prop. N" vs w13844 eq. numbers) · Lehmann–Casella TPE §2.7 (only if a *numbered* matrix-HCR primary is wanted).

**C. Body-verifies that likely need your access:**
- [ ] BBS body grep (covered by §0 read).
- [ ] Bolton–Dewatripont 2005 *Contract Theory* Ch. 4 & 8 — does it co-locate framework pieces 1–4? (Gemini-only deflationary claim; textbook, hard to verify online.)

**D. Optional:** run any further adversarial deep-research passes (the harness is yours to run).

---

## 2. AI TODO (for the clean next session)

**Phase 1a — clear the AI-doable verifies (cheap; gate `[confident]` in both tracks):**
- [ ] Verify open-access residual checks: **Haupt-2** "Optimal Aggregation Mechanisms for AI Benchmarking" (OpenReview); **Content Moderator's Dilemma arXiv:2412.16114** (the only Feltham–Xie bridge — confirm citation + that it's content-moderation econ, adjacent); **χPO arXiv:2407.13399** (bound = HCR identity?); **Athey "AI Design: Sufficient Statistics"** (Gemini-only — confirm it's delegation-method, not a Goodhart bridge).
- [ ] Verify the unverified 2026 arXiv IDs in `ai-corpus.md` (A12, D7, and the rest) before any enter the frozen denominator.

**Phase 1b — per the chosen track:**
- [ ] **Track B:** 05 freeze corpus + tier scheme → 06 code → 07 double-verify → (08 done) → 09 why-the-gap → 10 synthesize/close. Fold in the pulled proposition numbers.
- [ ] **Track A:** per-theorem novelty reviews (`litrev-selection-bounds` T1/T2, `litrev-convex-budget` T4, `litrev-lower-tier` L1–L4) → novelty-refactor capstone, consuming the shared Phase-0 discovery.
- [ ] Both: write the abstract with the **expanded exception floor named** (CHAI, BBS, Hendrycks-Ridgway, Wang–Huang, Haupt) and **drop** "first to bridge contract theory to formal Goodhart."

**Standing rule:** do NOT re-run cross-field searches — Phase 0 is the single shared discovery; consume it.
