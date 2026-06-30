# Phase 0 → consume-phase handoff (master doc)

**Last updated: 2026-06-30.** Single self-contained entry point for the next
(clean) session. Read this first; it points to the artifacts. Supersedes the
earlier handoff and folds in `phase0-todo.md` (now a thin pointer to §11–12 here).

---

## 0. TL;DR — where we are

**Phase 0 (the unified cross-field discovery, gap-paper audit-tasks 01–04 + 08) is
COMPLETE, saturated, and the plan-invalidating gate has PASSED, been CONFIRMED by
12 adversarial deep-research passes, and been PRIMARY-VERIFIED on every pillar that
could flip it.** The gap is real and localized; the delta over BBS 2023 is real and
was *strengthened* by reading BBS. The only thing still blocking the consume phase
is the human's two strategic judgment calls (§11) and a track choice — not any
open fact.

What this phase killed, and what survives, is the important part: **the paper can
no longer claim to be "first to bridge contract theory to formal Goodhart"** (two
2026 papers now hold that), but the **citation gap, the cross-field breadth
dictionary, the specific uncited identities, and the subset-invariance reading all
survive** — see §4.

The HARD STOP is still in force: **no corpus freeze (05), no coding (06), no Track
A consumption until the human signs off.**

---

## 1. The originating question (the anchor — confirm work still serves it)

*"Does the AI-safety Goodhart literature cite the economics / statistics /
management prior art that contains the same math — and what is that prior art?"*
Track A asks it **per theorem** (cite-and-reframe each); the gap paper asks it **in
aggregate** (the citation-gap claim + the cross-field dictionary). Phase 0 is the
single shared discovery both tracks consume. Still serving the original question —
not a nicer adjacent one.

---

## 2. What Phase 0 produced (artifacts + where they live)

Shared discovery, read by BOTH tracks, in
`research/threads/lit_review/cross-field-discovery/`:

| File | What it holds |
|---|---|
| `ai-corpus.md` | The ~95-paper AI denominator pool (superset of the seed 25), clustered A–H + borderline strategic-ML (F) and benchmark-overfitting (G). |
| `prior-art-econ.md` | Econ/management prior art (~38 items, 7 subfields) + the **adversarial breadth synthesis** (new items, mapping corrections, unifier finding). |
| `prior-art-formal.md` | Estimation/DRO/convex/causal/expfam/security homes. **Headline: the "no χ² analogue" internal negative is OVERTURNED** — T1/T2 = Hammersley–Chapman–Robbins / χ²-DRO (3 independent homes); T4 = Fenchel/Rockafellar. |
| `bridges.md` | Forward-citation census + vocabulary probe + **BBS lock (body-verified)** + **the GATE VERDICT** + **the adversarial exceptions-hunt synthesis** + the Tier-1 primary-verification notes. **The canonical gate file.** |
| `prior-art-verification.md` | Task-08 primary-source verification (7 verified-primary, 6 secondary, 8 flagged-for-user-pull) + the scope decision. |
| `exceptions-hunt/`, `prior-art-hunt/` | The 12 raw adversarial passes (committed) + their prompts. |

Gap-paper interpretive layer: `literature-reference-gap-paper/citation-audit/findings.md`
(read its Phase-0 result notes) and `audit.md` (the seed coded table + coding scheme).

The full plan/spec: `plans/litrev-discovery.md`.

---

## 3. The gate verdict in full

**Plan-invalidating question:** *"Is the citation gap real, and is our delta over
BBS 2023 real?"* **Both survive.**

### 3a. The gap is real — localized, with a named exception floor

- **Forward-citation census** [autonomous, OpenAlex, query log in `bridges.md`]:
  across 11 priority prior-art items in the congruity / sufficiency / χ²-DRO tier,
  **zero** AI-alignment papers cite any of them *and connect it to Goodhart*. The
  sharpest rows are the heavily-cited results adjacent ML uses constantly yet no
  reward-hacking paper reaches: **Ben-Tal 2013** (766 cites / 129 CS citers),
  **Chapman–Robbins** (259 / 88), **HM1987** (2957 / 27). Non-citation is a
  *community boundary*, not an indexing artifact.
- **Vocabulary probe** [autonomous]: clean negative — 7 of 9 econ/stats terms
  ("congruity", "second best", "sufficient statistic", "Chapman–Robbins",
  "informativeness principle", "equimarginal", "exchange rate") entirely absent
  from the AI corpus; the two that appear ("distortion", "multitask" in the agency
  sense) appear in **exactly one** paper (Wang–Huang 2603.28063).
- **Adversarial confirmation** [12 passes]: surfaced more bridges than the census,
  but all in two pockets (benchmark/contract reaching only HM1991/Baker; robust-RLHF
  using χ²-DRO as tooling) that *confirm* the refined claim. No pass found a bridge
  connecting the cosine-congruity geometry or the χ²-DRO/HCR estimation tier to
  Goodhart as prior theory.

### 3b. The delta over BBS is real — and stronger than expected

**BBS** = John, Caldwell, McCoy, Braganza (2023), "Dead rats, dopamine,
performance metrics, and peacock tails: Proxy failure is an inherent risk in
goal-oriented systems," *Behavioral and Brain Sciences* 47:e67, DOI
10.1017/S0140525X23002753. The only document spanning econ + AI + biology.

**[PRIMARY-VERIFIED 2026-06-30 — full target article read,
`sources/Dead-rats-…_BBS_2023.pdf` pp. 1–16]:** BBS is **qualitative/conceptual,
not formal.** Its "propositions" (Table 2) are prose; Fig. 1 is an "illustrative"
causal diagram; §3.2 argues the scalar-proxy necessity verbally via revealed
preference (Houthakker/Samuelson/vNM), not a ΣwⱼPⱼ projection; §4.2 + Box 3 only
*review* Baker-2002 distortion in prose, never restating the 1−cosθ / congruity /
multitask-projection math. **Decisively, §6 has the authors themselves stating that
"formal theories and models of proxy failure tend to be highly domain specific … it
is unclear how … a formal model of the unified mechanism … might look"** — i.e. they
flag the absence of a formal unified model as the open gap. That is the gap paper's
opening, written by the paper it must differentiate from. Reference list confirms
the corrected premises (no Feltham–Xie / HM1991 / Banker–Datar / DKL / Lipsey /
Raj-Chetty; has Baker 2002, Holmström 1979/2017, Kerr, Bénabou–Tirole, Aghion–Tirole,
Hennessy–Goodhart **2021** SSRN 3639508, plus Amodei/Manheim/Manheim–Garrabrant/
Everitt-et-al 2021). **Incidental:** the Hennessy–Goodhart 2021 SSRN paper (distinct
from the 2023 IER paper, seed A5) is an econ-authored Goodhart+ML item — fold into
Track B's corpus.

---

## 4. The refined claim — what the paper CAN and CANNOT say

**CAN say** [`[confident]`, auditable]:
- The **cosine-congruity geometry** (Baker 2002 `distortion = 1−cosθ`, Feltham–Xie
  congruity) is uncited by the safety corpus *as Goodhart math*. Even the strongest
  bridges don't reach it (§5). **[primary-verified ref-lists]**
- The **χ²-DRO / Hammersley–Chapman–Robbins** estimation tier is never cited as the
  *prior theory* of the Goodhart selection bound. **Laidlaw 2024** (the cleanest
  case) uses occupancy-measure χ² for Goodhart and cites **none** of it.
- **Type-(iii) (zero citations at all), unanimous across 6 passes:** Reynaert–Sallee
  2016, Chetty 2009, Şabac–Yoo, Lipsey–Lancaster 1956.
- The quantified, reproducible citation audit itself.
- (Formal side) T1/T2 = HCR/χ²-DRO; T4 = Fenchel/Rockafellar — the math has named
  classical homes the AI literature doesn't cite.

**CANNOT say** [killed/limited by the hunt]:
- ❌ "First to connect contract theory to a formal Goodhart result." Held by
  **Wang & Huang 2026 (arXiv:2603.28063)** (HM1991 + Baker 1992 → a weight-ratio
  distortion index) and **Haupt et al. 2026 (arXiv:2605.30916)** (HM1991 + Baker
  2002 → benchmark aggregation, Goodhart-framed). Both arXiv-confirmed; ref-lists
  primary-verified (§5).
- ❌ "0 alignment citers of χ²-DRO." Sharpen to: "0 *type-(i)* bridges; a 2025–26
  robust-RLHF cluster cites Ben-Tal/Namkoong–Duchi as **DRO tooling** (type-ii),
  and χPO cites Duchi–Namkoong as a genealogy footnote (type-ii) — but none as
  Goodhart's prior theory."

**Surviving contribution (tightened):** (a) the quantified citation-gap audit;
(b) the econ⇄stats⇄AI **breadth dictionary** — no bridge paper assembles it (the
benchmark pocket reaches only HM1991/Baker, the robust-RLHF pocket only
χ²-DRO-as-tooling); (c) the specific **uncited identities** (χ²-occupancy = HCR/χ²-
DRO via Laidlaw; cosine-congruity geometry unreached); (d) the **subset-invariance
reading** (per the T5 review). **The abstract must name the expanded exception
floor** (CHAI, BBS, Hendrycks-Ridgway, Wang–Huang, Haupt), not claim totality.

---

## 5. The exception floor (every bridge, with verification status)

| Bridge | reaches | pocket / type | status |
|---|---|---|---|
| **Wang & Huang 2026** (arXiv:2603.28063) | HM1991 + **Baker 1992**; distortion index `D_i=w̃_i/w_i` (weight ratio, **not** 1−cosθ); + Grossman–Hart, Hart–Moore, Afriat | benchmark/contract, **type-(i)** | **ref-list PRIMARY-VERIFIED 2026-06-30**; does NOT reach Feltham–Xie/Baker-2002/Banker–Datar/DKL/estimation |
| **Haupt et al. 2026** (arXiv:2605.30916) "Welfare, Improvability, and Variance…" | HM1991/1987 + **Baker 2002** + Strathern; Goodhart/Campbell-framed; `v*=(M+rΣ)⁻¹Mw` | benchmark design, **type-(i)** | **ref-list PRIMARY-VERIFIED**; cites Baker 2002 for effort-reallocation, **not** the 1−cosθ congruity condition; Feltham–Xie unreached |
| CHAI (CIRL 2016, Off-Switch 2017, Zhuang–HM 2020) | HM1991/HM1987/Baker 2002/Kerr | control / off-switch, **type-(ii)** | known floor; not Goodhart framing |
| BBS 2023 | Baker 2002, Holmström, Kerr, Bénabou–Tirole (qualitative) | conceptual, no theorem | **body-verified** (§3b) |
| Hendrycks "Unsolved Problems in ML Safety" 2021 | Ridgway 1956 | genealogy tier, **type-(ii)** | known floor |
| robust-RLHF cluster: DRO-REBEL (2509.19104), Robust-DPO (2502.01930), DR-Token-Opt (2604.08577), Mandal (2503.00539) | Ben-Tal 2013, Namkoong–Duchi 2017 (DRO-REBEL appendix also HCR) | **DRO tooling, type-(ii)** | from passes; tooling role per ChatGPT/Claude |
| χPO (2407.13399) | Duchi–Namkoong 2019 (genealogy footnote) | **type-(ii)** | **PRIMARY-VERIFIED 2026-06-30** — see §6 correction |
| Content Moderator's Dilemma (2412.16114, 2024) | HM1991 + **Feltham–Xie 1994** | content-moderation econ (NOT core safety), type-(i)-ish | **unverified — residual** (§10); the *only* Feltham–Xie bridge found, and it's outside the reward-hacking corpus |
| Haupt-2 "Optimal Aggregation Mechanisms for AI Benchmarking" | HM1991 + Strathern | benchmark, type-(i) | **unverified — residual** |
| Athey et al. "AI Design: Sufficient Statistics" | Chetty 2009 | human–AI delegation method (NOT Goodhart) | **Gemini-only, unverified — residual** |

**The clean reinvented-uncited case is Laidlaw 2024 (2403.03185)** — occupancy-measure
χ² for Goodhart, cites **no** estimation lineage (type-iii, full-text checked by the
passes). Use Laidlaw, not χPO, as the headline example.

---

## 6. The χPO correction (primary-verified 2026-06-30 — don't re-inflate it)

The adversarial passes (esp. Gemini) overstated χPO. Pulling the PDF corrected two
things:
1. **χPO is type-(ii), not type-(iii).** It *does* cite **Duchi–Namkoong 2019**
   (the variance-regularization = χ²-DRO paper), but only as a genealogy footnote:
   *"More classically, χ²-divergence is known to play a fundamental role in asymptotic
   statistics (Tsybakov, 2008; Duchi and Namkoong, 2019)"* — not as the prior theory
   of its Goodhart bound. (It still cites no Chapman–Robbins / Ben-Tal / Hammersley.)
2. **χPO's bound is NOT literally the HCR identity.** Its Lemma 5.1 / F.3 is a
   χ²-*change-of-measure* bound (reward-error transfer `≲ √((1+χ²(π‖π_ref))·ε²_stat)`)
   — same χ² machinery as HCR, a *different* inequality. The "χPO's bound IS the HCR
   variational identity" near-miss was an overstatement.

---

## 7. Verification ledger (evidence grade of each load-bearing claim)

| Claim | Grade |
|---|---|
| Gap is real / 0 type-(i) bridges in congruity-sufficiency-χ²DRO tier | autonomous census + 12 passes; `[confident]` |
| BBS is qualitative, not formal (delta real) | **primary (BBS body read)**; `[confident]` |
| Wang–Huang / Haupt reach only HM1991/Baker, not the core | **primary (ref-lists pulled)**; `[confident]` |
| χPO is type-(ii); its bound ≠ HCR identity | **primary (PDF read)**; `[confident]` |
| Laidlaw 2024 is the clean type-(iii) | passes' full-text check; `[confident-tentative]` (re-grep possible) |
| Reynaert–Sallee / Chetty / Şabac–Yoo / Lipsey–Lancaster type-(iii) | 6 passes + census, auditable empty logs; `[confident]` |
| Prior-art statements (Reynaert–Sallee Prop 2/4, Chetty eq 3/7, Banker–Datar Prop 1/2, Frankel–Kartik Prop 2, HCR Thm 29.1, Namkoong–Duchi Thm 1 √(2ρ/n)) | **verified-primary** (Task 08) |
| Feltham–Xie / Baker 1992&2002 / HM1991 / DKL / Rockafellar proposition numbers | **paywalled — flagged for user pull** (substance verified-secondary) |
| T1/T2 = HCR/χ²-DRO; T4 = Fenchel/Rockafellar | discovery + Task 08 primary for HCR/ND; Track A owns the per-theorem verdict |

---

## 8. Corrections baked in (do NOT re-introduce the errors)

- **Reynaert–Sallee:** either-direction welfare result is **Prop. 2** (Prop. 4 =
  tighter-policy⇒more-gaming). [fixed in `prior-art-econ.md`]
- **Ben-Tal 2013** has **no** "mean+√r·sd" proposition — that is **Namkoong–Duchi
  2017 Thm 1**, constant **√(2ρ/n)** (the 2 = the φ=½(t−1)² χ² normalization; match
  the book's χ² before equating δ). [fixed in `prior-art-formal.md`]
- **Chetty 2009 is the weaker home for *statistical* sufficiency** — use
  **Banker–Datar 1989 / Amershi–Banker–Datar 1990 / Şabac–Yoo**; Chetty is the
  *welfare* analogue.
- **Set-monotonicity is a *naming* contribution** — DKL 2001 proves non-monotone
  *weights*, not a harm-vs-channel-count theorem.
- **Reynaert–Sallee welfare sign:** in their model gaming can *benefit buyers*; if
  the book treats gaming as unambiguously harmful that is a substantive divergence
  (echoes the T5 value→harm interpretive inversion), not a relabel.
- **χPO** — see §6.

---

## 9. Gotchas / epistemic flags

- **2026 arXiv IDs are a hallucination risk.** Several in `ai-corpus.md` are
  unverified (flagged: A12 "On the Strength of Causal Goodhart's Law", D7 "Partial
  identifiability… in IRL" — no IDs captured). The freeze (05/07) must verify every
  borderline ID before it enters the denominator. The load-bearing ones ARE verified
  (2603.28063, 2605.30916).
- **Model spread = signal.** Gemini systematically over-claims bridges (labels DRO-
  tooling and method citations type-(i); made the Bolton–Dewatripont and Athey
  claims solo; overstated χPO=HCR). ChatGPT/Claude are careful and give auditable
  negatives. Trust the careful reading; treat Gemini-only claims as leads to verify.
- **Self-flagged likely hallucinations** (do NOT cite without a source):
  "Hennessy–Goodhart formalizations" (no venue), bare "Kim 1995", "Yoo 2019", the
  exact Marschak–Radner sufficiency statement.
- **Don't re-run cross-field searches.** Phase 0 is the single shared discovery for
  both tracks; consume it.

---

## 10. Residual verifies (open — none are gate-critical)

**AI-doable (next session, Phase 1a):**
1. **Content Moderator's Dilemma (arXiv:2412.16114)** — confirm it cites Feltham–Xie
   and that it's content-moderation econ (adjacent, not core safety). The only
   Feltham–Xie bridge found.
2. **Haupt-2 "Optimal Aggregation Mechanisms for AI Benchmarking"** — confirm exists
   + what it cites (OpenReview).
3. **Athey et al. "AI Design: Sufficient Statistics"** — confirm exists + that it's a
   delegation-method use of Chetty, not a Goodhart bridge. (Gemini-only.)
4. **Re-grep Laidlaw 2403.03185 references** to lock its type-(iii) `[confident]`.
5. **Verify the unverified 2026 arXiv IDs** in `ai-corpus.md` before the freeze.

**Human-access likely needed:**
6. **Bolton–Dewatripont 2005 *Contract Theory* Ch. 4 & 8** — does it co-locate
   framework pieces 1–4? (Gemini's deflationary "already in a PhD textbook" claim;
   affects the honest novelty scope, not the gap.)
7. **Paywalled primary pulls for proposition numbers** (`prior-art-verification.md
   §MUST be pulled`): Feltham–Xie 1994, Baker 1992 & 2002 (scanned), HM1991, DKL
   2001, Rockafellar 1970 *Convex Analysis*, Ridgway 1956 (verbatim quote), Chetty
   AEJ version (only for "Prop. N" labels), Lehmann–Casella TPE §2.7 (only for a
   numbered matrix-HCR primary). Substance already verified-secondary; only the
   pinned numbers are missing.

---

## 11. The two human judgment calls (the only thing blocking unblock)

Both are strategy, not fact — they cannot be settled by more search:
1. **Is the tightened contribution strong enough to publish**, now that "first to
   bridge contract theory to formal Goodhart" is dead? Surviving pitch: quantified
   audit + breadth dictionary + uncited identities + subset-invariance.
2. **Is the corpus boundary defensible** to a hostile referee? (Excluding strategic-
   ML cluster F and benchmark-overfitting cluster G is the most likely attack line —
   "you drew the denominator to make the gap look bigger.")

Disapprove/rescope triggers if you re-examine: a spot-checked census row turns out
wrong; you judge the contribution too thin (→ kill Track B, keep Track A's
per-theorem reframes); the corpus boundary feels indefensible (→ widen it and
re-code).

---

## 12. TODO

### Human (before the next AI session)
- [ ] Make the two judgment calls (§11) → approve / disapprove / rescope.
- [ ] Choose next: **Track A** (per-theorem reviews), **Track B** (gap paper 05→10),
      or **both in parallel**.
- [ ] Set corpus-freeze scope for Track B: include/exclude clusters F & G; final N
      (~25 core, or pad to 30–40).
- [ ] (Optional) Pull the paywalled primaries (§10 item 7) and check Bolton–
      Dewatripont (§10 item 6).

### AI (clean next session)
- [ ] **Phase 1a** — clear the AI-doable residual verifies (§10 items 1–5).
- [ ] **Phase 1b** — per the chosen track:
  - **Track B:** 05 freeze corpus + tier scheme → 06 code → 07 double-verify →
    (08 done) → 09 why-the-gap → 10 synthesize/close. Fold in pulled prop numbers.
  - **Track A:** per-theorem novelty reviews (`litrev-selection-bounds` T1/T2,
    `litrev-convex-budget` T4, `litrev-lower-tier` L1–L4) → novelty-refactor capstone.
  - Both: write the abstract with the **expanded exception floor named** and **drop**
    "first to bridge contract theory to formal Goodhart."
- [ ] Standing rule: do NOT re-run cross-field searches.

---

## 13. Blocking graph from here (per `plans/litrev-discovery.md`)

```
[Phase 0 gate ✅ PASSED + CONFIRMED + PRIMARY-VERIFIED]
        │  ── human: 2 judgment calls (§11) + track choice ──┐
        ├──────────────────────────────┬─────────────────────┘
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

---

## 14. File index (quick pointers)

- Gate + bridges + adversarial synthesis: `research/threads/lit_review/cross-field-discovery/bridges.md`
- AI corpus: `…/ai-corpus.md` · Econ prior art + breadth synthesis: `…/prior-art-econ.md`
- Formal prior art: `…/prior-art-formal.md` · Primary-source verification: `…/prior-art-verification.md`
- Raw adversarial passes: `…/exceptions-hunt/`, `…/prior-art-hunt/`
- Gap-paper findings/thesis: `literature-reference-gap-paper/citation-audit/findings.md`, `audit.md`
- Plan/spec: `plans/litrev-discovery.md` · Track A plans: `plans/litrev-*.md`, `plans/novelty-refactor.md`
- BBS PDF: `sources/Dead-rats-…_BBS_2023.pdf`
- Memory: `citation-gap-finding`, `t5-prior-art-congruity`, `paper1-is-elementary-synthesis`
