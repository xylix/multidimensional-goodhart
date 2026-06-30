# Phase 0 → consume-phase handoff

Status: **Phase 0 (unified cross-field discovery, audit-tasks 01–04 + 08) is
COMPLETE and saturated; the plan-invalidating gate PASSED and is CONFIRMED by 12
adversarial deep-research passes.** This file is the entry point for the next
(clean) session. Read it first, then the artifacts it points to. Created
2026-06-30 as a session handoff so the consume phase can start cold.

The HARD STOP is at human review of the gate verdict + the manual paywalled pulls
(below). Once those are done, the consume phase (Track A reviews and/or gap-paper
tasks 05–10) is unblocked.

---

## 1. The gate verdict (one paragraph)

The plan-invalidating question was *"is the citation gap real, and is our delta
over BBS 2023 real?"* **Both survive.** Across a saturated AI corpus (~95 papers),
a saturated econ prior-art set (~38), and the formal-math homes, the AI-safety
Goodhart / reward-overoptimization literature does **not** cite the contract-
theory/congruity or estimation/χ²-DRO prior art that holds the actual
multidimensional-Goodhart math. The gap is **localized, not total**, with a known
exception floor, and the delta over BBS 2023 (which is qualitative, not formal) is
real. **But** the hunt killed one specific claim: the paper is **no longer "first
to bridge contract theory to formal Goodhart"** — two 2026 papers now hold that.

## 2. What is established (and where it lives)

Shared discovery outputs, read by BOTH tracks, in
`research/threads/lit_review/cross-field-discovery/`:
- `ai-corpus.md` — the ~95-paper AI denominator pool (superset of the seed 25).
- `prior-art-econ.md` — econ/management prior art + the **adversarial breadth synthesis** at the bottom.
- `prior-art-formal.md` — estimation/DRO/convex/causal/etc. homes. **Headline: the "no χ² analogue" internal negative is OVERTURNED** — T1/T2 = Hammersley–Chapman–Robbins / χ²-DRO (3 independent homes); T4 = Fenchel/Rockafellar.
- `bridges.md` — forward-citation census + vocabulary probe + BBS lock + **the GATE VERDICT** + **the adversarial exceptions-hunt synthesis**. The canonical gate file.
- `prior-art-verification.md` — primary-source verification (7 verified-primary, 6 secondary, 8 flagged for user pull) + the scope decision.
- `exceptions-hunt/` and `prior-art-hunt/` — the 12 raw adversarial passes (committed) + their prompts.

Gap-paper interpretive layer: `literature-reference-gap-paper/citation-audit/findings.md` (read its Phase-0 result notes) and `audit.md` (the seed coded table).

## 3. The refined claim (what the paper can and cannot say)

**CAN say** (`[confident]`, auditable):
- The **cosine-congruity geometry** (Baker 2002 `distortion = 1−cosθ`, Feltham–Xie
  congruity) is uncited by the safety corpus *as Goodhart math*. Even the strongest
  bridge (Wang–Huang) uses Baker **1992** + a *weight-ratio* index, not the cosine.
- The **χ²-DRO / Hammersley–Chapman–Robbins** estimation tier is never cited as the
  *prior theory* of the Goodhart selection bound. The two papers that use χ² for
  Goodhart (Laidlaw 2024 occupancy-measure, χPO 2025) cite **none** of it; χPO's
  bound *is* the HCR identity, uncited.
- **Type-(iii) (zero citations at all), unanimous across 6 passes:** Reynaert–Sallee
  2016, Chetty 2009, Şabac–Yoo, Lipsey–Lancaster 1956.
- The quantified, reproducible citation audit itself.

**CANNOT say** (killed/limited by the hunt):
- ❌ "First to connect contract theory to a formal Goodhart result." Held by
  **Wang & Huang 2026 (arXiv:2603.28063)** (HM1991 + Baker 1992 → distortion index)
  and **Haupt et al. 2026 (arXiv:2605.30916)** (HM1991 + Baker 2002 → benchmark
  aggregation, Goodhart-framed). Both arXiv-confirmed real.
- ❌ "0 alignment citers of χ²-DRO." Sharpen to "0 type-(i); a 2025–26 robust-RLHF
  cluster (DRO-REBEL, Robust-DPO, DR-Token-Opt, Mandal) cites Ben-Tal/Namkoong–Duchi
  as **DRO tooling**, type-(ii), not as Goodhart's prior theory."

**Surviving contribution (tightened):** (a) the quantified citation-gap audit; (b)
the econ⇄stats⇄AI **breadth dictionary** — no bridge paper assembles it (benchmark
pocket reaches only HM1991/Baker; robust-RLHF pocket only χ²-DRO-as-tooling);
(c) the specific **uncited identities** (χ²-occupancy = HCR/χ²-DRO; cosine-congruity
unreached); (d) the **subset-invariance reading** (per T5). The abstract must name
the expanded exception floor: CHAI, BBS, Hendrycks-Ridgway, Wang–Huang, Haupt.

## 4. Corrections made to the discovery files (don't re-introduce the errors)

- **Reynaert–Sallee:** either-direction welfare result is **Prop. 2** (not Prop. 4;
  Prop. 4 = tighter-policy⇒more-gaming). Fixed in `prior-art-econ.md`.
- **Ben-Tal 2013** has **no** "mean+√r·sd" proposition — that is **Namkoong–Duchi
  2017 Thm 1**, constant **√(2ρ/n)** (the 2 is the φ=½(t−1)² χ² normalization —
  match the book's χ² before equating δ). Fixed in `prior-art-formal.md`.
- **Chetty 2009 is the weaker home for *statistical* sufficiency** — use
  **Banker–Datar 1989 / Amershi–Banker–Datar 1990 / Şabac–Yoo**; Chetty is the
  *welfare* analogue.
- **Set-monotonicity is a *naming* contribution** — DKL 2001 proves non-monotone
  *weights*, not a harm-vs-channel-count theorem.

## 5. Gotchas / epistemic flags for the next session

- **2026 arXiv IDs are a hallucination risk.** Several IDs in `ai-corpus.md` are
  unverified (explicitly flagged: A12 "On the Strength of Causal Goodhart's Law",
  D7 "Partial identifiability… in IRL" — no IDs captured). The freeze phase (05/07)
  must verify every borderline ID before it enters the denominator. The *load-bearing*
  2026 papers ARE verified to exist (2603.28063, 2605.30916).
- **Model spread = the signal.** Gemini systematically over-claims bridges (it labels
  DRO-*tooling* and method citations as type-(i) "formal bridges," and made the
  aggressive "Bolton–Dewatripont already unifies pieces 1–4" claim alone). ChatGPT
  and Claude are careful and give auditable negatives. Trust the careful reading;
  treat Gemini-only claims as leads to verify, not facts.
- **Self-flagged likely hallucinations from the breadth pass** (do NOT cite without a
  source): "Hennessy–Goodhart formalizations", bare "Kim 1995", "Yoo 2019", the exact
  Marschak–Radner sufficiency statement.
- **BBS body now READ (2026-06-30) — delta CONFIRMED `[confident]`.** The "BBS is
  qualitative, not formal" call is body-verified (target article pp. 1–16, in
  `sources/`): prose propositions (Table 2), illustrative causal diagram (Fig. 1),
  scalar-proxy argued via revealed preference not ΣwⱼPⱼ, Baker-2002 distortion only
  *reviewed* in prose, and §6 states outright that no formal unified model exists.
  Strengthens the delta. Details in `bridges.md §4`. (No longer a residual item.)
- **Reynaert–Sallee welfare sign:** in their model, gaming can *benefit buyers*. If
  the book treats gaming as unambiguously harmful, that's a substantive divergence
  (echoes the T5 value→harm interpretive inversion), not a relabel.
- **Don't re-run cross-field searches.** Phase 0 is the single shared discovery for
  both tracks. Consume it; don't re-search.

## 6. Residual body-verifies (open; some need the human, some the AI — see TODOs)

1. **Haupt-2** "Optimal Aggregation Mechanisms for AI Benchmarking" — confirm exists + what it cites (OpenReview).
2. **The Content Moderator's Dilemma (arXiv:2412.16114)** — the *only* Feltham–Xie bridge found; confirm it cites Feltham–Xie and that it's content-moderation econ (adjacent, not core safety).
3. **Bolton–Dewatripont 2005 *Contract Theory* Ch. 4 & 8** — does it really co-locate pieces 1–4 (Gemini's deflationary claim)? (Textbook — may need the human.)
4. ~~χPO (arXiv:2407.13399) HCR check~~ **DONE 2026-06-30 — corrected.** χPO is **type-(ii)** (cites Duchi–Namkoong 2019 as a genealogy footnote), and its Lemma 5.1 bound is a χ²-change-of-measure inequality, **not** the literal HCR identity. The clean type-(iii) "reinvented uncited" example is **Laidlaw 2024**, not χPO. Wang–Huang + Haupt ref-lists also primary-verified (reach only HM1991/Baker; cosine-congruity + estimation tier unreached). See `bridges.md`.
5. ~~BBS PDF body grep~~ **DONE 2026-06-30** — read in full; qualitative confirmed (see `bridges.md §4`).
6. **Athey et al. "AI Design: Sufficient Statistics"** (Gemini-only Chetty bridge) — confirm exists + that it's human–AI delegation method, not a Goodhart bridge.

## 7. Manual pulls the AI cannot do (paywalled / scanned — from prior-art-verification.md §"MUST be pulled")

Feltham–Xie 1994 (own prop number), Baker 1992 & Baker 2002 (scanned images),
Holmström–Milgrom 1991, Datar–Kulp–Lambert 2001, Rockafellar 1970 *Convex Analysis*
(Fenchel/perturbation theorem number), Chetty AEJ version (only if "Proposition N"
labels wanted vs the w13844 equation numbers), Ridgway 1956 (verbatim composite-
measure quote), Lehmann–Casella TPE §2.7 (only if a *numbered* matrix-HCR primary
is wanted). The substance of each is already verified-secondary; only the pinned
proposition/theorem number is missing.

## 8. The blocking graph from here (from plans/litrev-discovery.md)

```
[Phase 0 gate ✅ PASSED + CONFIRMED] ── human review + manual pulls ──┐
        ├──────────────────────────────┬───────────────────────────────
        ▼ TRACK A (per-theorem)         ▼ TRACK B (gap paper)
  litrev-selection-bounds (T1/T2)    05 freeze → 06 code → 07 verify
  litrev-convex-budget   (T4)        (08 done) → 09 why → 10 synthesize
  litrev-lower-tier      (L1–L4)
        ▼                                 ▼
  novelty-refactor capstone          structure + draft the gap paper
```
Both tracks consume the shared Phase-0 discovery and may run in parallel. Neither
re-runs cross-field searches. Track A cites the math; the gap paper claims only the
*citation gap* per family.
