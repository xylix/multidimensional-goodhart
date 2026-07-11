# Phase 0 → consume-phase handoff (master doc)

> **CLOSED 2026-07-11; archived.** Everything this doc was blocking on has
> executed: Phase 1a (2026-07-10), Phase 1b's Track B audit through task 10
> (commits 997e7e3, 44640f8, 6cc7732; single source
> `literature-reference-gap-paper/citation-audit/SUMMARY.md`), all four Track A
> lit reviews (2026-07-11), and the §10-item-7 paywalled pulls (now in
> `sources/`, gitignored). Kept as the Phase-0 audit record. The active entry
> point is `plans/handoff-2026-07-11.md`.

**Last updated: 2026-06-30 (closure note above added 2026-07-11).** Single
self-contained entry point for the next
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

~~The HARD STOP is still in force: **no corpus freeze (05), no coding (06), no Track
A consumption until the human signs off.**~~ **RESOLVED 2026-07-10 — the human
sign-off landed and the HARD STOP is lifted.** The three decisions are recorded in
§11: Track B is rescoped to a LessWrong-post-size artifact foregrounding the
applicable math (citation-trackery stays repo-internal); the corpus is widened to
include clusters F & G; Track B leads, Track A follows.

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
| Content Moderator's Dilemma (2412.16114, 2024; Habibi–Hovy–Schwarz) | HM1991 + **Feltham–Xie 1994** (both verbatim) | content-moderation econ (NOT core safety), type-(i)-ish; **"Goodhart" absent from the paper** | **BODY-VERIFIED 2026-07-10**; the *only* Feltham–Xie bridge found, outside the reward-hacking corpus |
| Haupt-2 "Optimal Aggregation Mechanisms for AI Benchmarking and Platinum Benchmarks" (ICLR 2026 wkshp, OpenReview `Y5qABVr7uB`) | HM1991 + Strathern (indirect, via arXiv sibling) | benchmark, type-(i) | **VERIFIED-EXISTS 2026-07-10**; workshop sibling of 2605.30916; own ref list unread (bot-challenge) |
| ~~Athey~~ **Agarwal–Moehring–Wolitzky 2025** "Designing Human-AI Collaboration: A Sufficient-Statistic Approach" (MIT WP) | Chetty 2009 (verbatim) | human–AI delegation method (NOT Goodhart — term absent) | **RESOLVED 2026-07-10**: real paper, **Gemini misattributed** (Athey only in its refs; title from PDF filename); full PDF read |

**The clean reinvented-uncited case is Laidlaw 2024 (2403.03185)** — occupancy-measure
χ² for Goodhart, cites **no** estimation lineage. **Type-(iii) LOCKED 2026-07-10:**
complete 92-entry reference list (S2 API) has zero estimation/DRO-lineage items.
Cite by current title: **"Correlated Proxies: A New Definition and Improved
Mitigation for Reward Hacking"** (Laidlaw, Singhal, Dragan; ICLR 2025 spotlight).
Use Laidlaw, not χPO, as the headline example.

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
| Laidlaw 2024 is the clean type-(iii) | **primary (complete S2 ref-list re-grep 2026-07-10)**; `[confident]` |
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

**AI-doable — ALL DONE 2026-07-10 (Phase 1a executed; details written into
`bridges.md` and `ai-corpus.md`):**
1. ✅ **Content Moderator's Dilemma (arXiv:2412.16114)** — body-verified: real
   (Habibi–Hovy–Schwarz 2024), cites Feltham–Xie 1994 AND HM1991 verbatim,
   content-moderation econ, **"Goodhart" absent from the paper**.
2. ✅ **Haupt-2** — real: "…AI Benchmarking **and Platinum Benchmarks**" (Haupt,
   Reuel, Kochenderfer, Koyejo; ICLR 2026 workshop; OpenReview `Y5qABVr7uB`);
   workshop sibling of 2605.30916. Own ref list unreadable (bot-challenge);
   econ cites confirmed only via the sibling — the one residual indirect link.
3. ✅ **"Athey et al."** — resolved as **Gemini misattribution of a real paper**:
   Agarwal, Moehring & Wolitzky 2025 (MIT), "Designing Human-AI Collaboration:
   A Sufficient-Statistic Approach"; cites Chetty 2009 methodologically; no
   Goodhart/proxy-gaming content. Not a bridge.
4. ✅ **Laidlaw 2403.03185 type-(iii) LOCKED** — complete 92-entry S2 ref list,
   zero estimation/DRO lineage. Title correction: "Correlated Proxies…"
   (ICLR 2025 spotlight).
5. ✅ **Flagged IDs resolved** — A12 = "On the Strength of Goodhart's Law"
   (Majka–Bouaziz–El-Mhamdi, ICML 2025 MoFA poster, OpenReview `HTpPKXkUnw`,
   no arXiv id exists; S2's "Causal" title is garbled); D7 = arXiv:2411.15951
   (Skalse & Abate 2024). **No flagged IDs remain — corpus clear for freeze.**

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

### RESOLVED 2026-07-10 (human decisions, recorded verbatim in intent)

1. **Judgment call 1 → rescope, don't kill.** Track B becomes a
   **LessWrong-post-size artifact**, not an academic paper. The post foregrounds
   the *actually applicable math* (the breadth dictionary, the uncited identities,
   what transfers — plan.md's G2/G3 material). The academic citation-trackery
   content ("this paper deserved a citation but people re-invented the idea") is
   **de-emphasized in the post** — those observations stay noted in the repo
   (audit table, findings, census logs) as the evidence base, but are not the
   published pitch.
2. **Judgment call 2 / freeze scope → widen the corpus to include clusters F & G**
   (strategic-ML and benchmark-overfitting). One denominator, no exclusion to
   defend. Sizing note: the full 06→07 double-verify apparatus was calibrated for
   a hostile academic referee; with the audit now repo-internal evidence for a
   post, coding stays rigorous (published numbers must still rest on the coded
   table) but the paper-grade apparatus (methods note, inter-rater ceremony) can
   be right-sized by the executing session.
3. **Track choice → B leads, A follows.** Gap post first (shortest path to a
   circulatable artifact; seeds Paper 1's related work), Track A per-theorem
   reviews start in parallel/after.

---

## 12. TODO

### Human (before the next AI session)
- [x] Make the two judgment calls (§11) → **rescoped 2026-07-10** (LW-post size,
      applicable math foregrounded; trackery repo-internal).
- [x] Choose next: **Track B leads, Track A follows** (2026-07-10).
- [x] Set corpus-freeze scope for Track B: **include clusters F & G** (2026-07-10).
- [x] (Optional) Pull the paywalled primaries (§10 item 7) — **DONE 2026-07-11**:
      all hard-flagged and conditional pulls landed in `sources/` (gitignored);
      pinned-number verification pass = `handoff-2026-07-11.md` Step 2.
- [ ] Check Bolton–Dewatripont Ch. 4 & 8 (§10 item 6) — still open; affects
      honest novelty scope only, not the gap.

### AI (clean next session)
- [x] **Phase 1a** — DONE 2026-07-10: all five residual verifies cleared (§10);
      results integrated into `bridges.md` + `ai-corpus.md`. Only residual:
      Haupt-2's own ref list (OpenReview bot-challenge; verified via sibling).
- [x] **Phase 1b** — Track B leads (per the 2026-07-10 decisions) —
      **DONE 2026-07-11** except the two deliberately-gated tail items:
  - **Track B (leads):** ✅ 05 freeze DONE 2026-07-10 (N=117 incl. F & G,
    `citation-audit/corpus.md`) → ✅ 06 code DONE 2026-07-10 (N=115 minable
    coded; master table + totals in `citation-audit/audit.md`, raw batches in
    `coding-batches.md`; headline: CONTRACT 0/60 in the B+C core, all 8 hits in
    bridges/CHAI/strategic-ML pockets; NEW exception-floor candidate A9
    2603.15017) → ✅ 07 verify DONE (commit 997e7e3) → (08 done) →
    ✅ 09 why-the-gap DONE (commit 44640f8) → ✅ 10 synthesize/close DONE —
    **AUDIT CLOSED 2026-07-11** (commit 6cc7732; single source
    `citation-audit/SUMMARY.md`) → ⬜ the **LessWrong post** — HUMAN-AUTHORED
    by decision (2026-07-11); plan `could-do/track-b-lesswrong-post.md`.
  - **Track A (follows / parallel):** ✅ per-theorem novelty reviews ALL DONE
    2026-07-11 (`litrev-selection-bounds` T1/T2, `litrev-convex-budget` T4,
    `litrev-lower-tier` L1–L4; commits fef0325, d0a0471) → ⬜ novelty-refactor
    capstone (unblocked; gated on Xylix's green-light —
    `handoff-2026-07-11.md` Step 3).
  - Both: name the **expanded exception floor** and **drop**
    "first to bridge contract theory to formal Goodhart."
- [ ] Standing rule: do NOT re-run cross-field searches.

---

## 13. Blocking graph from here (per `litrev-discovery.md`, same directory)

> **2026-07-11:** fully executed except the two terminal nodes — the
> novelty-refactor capstone (gated on Xylix's green-light) and the gap post
> (human-authored). See `plans/handoff-2026-07-11.md`.

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
- Plan/spec: `litrev-discovery.md` (same directory) · Track A plans: `plans/archived/litrev-*.md`, `plans/novelty-refactor.md`
- BBS PDF: `sources/Dead-rats-…_BBS_2023.pdf`
- Memory: `citation-gap-finding`, `t5-prior-art-congruity`, `paper1-is-elementary-synthesis`
