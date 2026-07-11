# Citation audit — SUMMARY (audit CLOSED 2026-07-11)

**What this file is.** The single self-contained source for the post-structuring
phase (Track B, rescoped 2026-07-10 to a LessWrong post: applicable math
foregrounded, the audit repo-internal as evidence — `plans/phase0-handoff.md`
§11). Consolidates tasks 01–09. Every number here traces to a named sub-artifact
section (§10 traceability index). This file states results and their licenses;
it deliberately contains **no post prose** — closing the audit is the boundary.

**Anchor (originating question, one sentence):** *Does the AI-safety Goodhart /
reward-hacking / overoptimization literature cite the economics / statistics /
management prior art that contains the same mathematics — and what exactly is
that prior art?* The answer below still serves that question: quantified gap +
named exceptions + the verified prior-art set + why.

---

## 0. Denominator and version convention (stated once, applies to every number)

- **Corpus: N = 117 frozen 2026-07-10** (`corpus.md`; clusters A 15, B 25, C 35,
  D 9, E 2, F 15, G 7, H 6, I 3; F & G included per the July-10 decision; bridge
  papers included under the bridge non-exclusion rule). **Minable N = 115** —
  A12 and I3 are access-limited OpenReview items, coded n/a.
- **Scope note (binding on any published number):** clusters C, F, G are
  unbounded populations; the frozen set is the discovery pool's anchors plus
  distinct-mechanism representative samples (saturation evidence in `corpus.md`
  §Saturation). The totals are claims about that documented denominator, **not**
  an enumeration of the 2025–26 mitigation tail.
- **Version convention:** every cell reflects the **current arXiv version**,
  which coincides with the **published version of record** for every disputed
  paper (`verification.md` §6). Hits present only in a superseded preprint are
  carried as explicit annotations, not counted. Any-version-ever deltas
  (`why-the-gap.md` §M4 table): HM1991 5→6, HM1987 1→2, Baker-2002 1→2,
  PUBFIN 0→1, MGMT 20→21. **Every headline below is invariant across the two
  readings.** Published prose must state which convention it uses.

---

## 1. Headline numbers (frozen, task-07-verified)

Source: `audit.md` §Tier totals (⟦07⟧-verified 2026-07-11); every hit cell
two-method confirmed or explicitly flagged (`verification.md` §3).

| Tier / item | Count of 115 | Structure |
|---|---|---|
| **CONTRACT** (multitask / congruity / contract theory) | **8 ✓ + 1 △** | **0/60 in the reward-hacking + RLHF core (B: 0/25, C: 0/35)**; 0 in E, G, H (except Hendrycks' Ridgway, MGMT-tier). All 8 hits in three pockets (§2). △ = A7 Zhuang–HM (transaction-cost econ, different branch) |
| Feltham–Xie 1994 (congruity) | **1** | F15 only — econ-authored platform paper; "Goodhart" absent from its text |
| Baker 1992 | **1** | I1 only |
| Baker 2002 | **1** | I2 only (D3's was v1-preprint-only) |
| Holmström–Milgrom 1991 | **5** | A9 (genealogy nod), F3 (body use), F15, I1, I2 (D2's was v1-only) |
| Holmström–Milgrom 1987 | 1 | I2 (D2's was v1-only) |
| DKL 2001 / Prendergast / Holmström 2017 | **0 / 0 / 0** | — |
| **PUBFIN** (Raj Chetty, Feldstein) | **0** | was 1: F5's Chetty lived only in its v1 preprint (Apr–Dec 2022), dropped from v2 on |
| **2BEST** (Lipsey–Lancaster) | **0** | zero across all 115; zero across all 68 PDF-grepped texts |
| **CORRECT** (Reynaert–Sallee, Baumol–Oates, Montgomery) | **0** | same — including Reynaert–Sallee, which has "Goodhart's Law" in its title |
| **ESTIM** (HCR / Cramér–Rao / Ben-Tal / Duchi–Namkoong / Rockafellar-DRO) | **6 ✓ + 7 ~** | every ✓ is *tooling* (DRO machinery: C32–C35, H5) except χPO's genealogy footnote (C31, type-ii). **Cited as prior theory of a Goodhart bound: 0/115.** The two papers that use χ² *for* Goodhart (B3 Laidlaw, C31 χPO) cite none of the estimation lineage as such |
| **MGMT** (folklore: Strathern/Campbell/Kerr/Ridgway/Rodamar) | **20** | Strathern 13, Campbell 6, Kerr 3, Rodamar 2, **Ridgway 1** (Hendrycks only); Hoskin 3 annotation-only (not scheme-listed) |
| Lucas 1976 | **3** | A4, A5, F4 — two econ-audience-adjacent |
| Goodhart eponym | **24** | 16× 1984, 8× 1975 |

**One-line licensed headline** (from `audit.md` §Headline): in the frozen
115-paper denominator, the performance-measurement contract-theory tier that
contains the multidimensional-Goodhart math (Feltham–Xie congruity, Baker
distortion, DKL) is reached only by the 2026 benchmark-design bridges, the CHAI
control lineage, and econ-authored platform work — **never by the
reward-hacking / RLHF-overoptimization core (0/60 in B+C)**, whose only econ
contact is the Goodhart eponym (24) and the Strathern/Campbell/Kerr folklore
tier (20). Public-finance, second-best, and corrective-tax tiers: **0/115** in
current versions. The estimation tier is **never cited as prior theory**.

---

## 2. The localized-gap claim: exact bounds and named exceptions

The gap is **real but localized** — the exception floor must be named up front
(gate verdict, `bridges.md` §GATE; the "totality" version of the claim is dead).
All 8 clean CONTRACT hits sit in exactly three pockets:

### Pocket 1 — the 2026 benchmark-contract bridges (in-corpus, all preprints)
| Paper | Reaches | Citation type |
|---|---|---|
| **I1 Wang–Huang** (arXiv:2603.28063, Mar 2026) | HM1991 + **Baker 1992** (+ Grossman–Hart, Hart–Moore) | **Substantive import (type-i):** instantiates the HM1991 multitask model, derives a *weight-ratio* distortion index D_i = w̃_i/w_i — **not** the 1−cosθ congruity geometry; Goodhart→Campbell framing. Ref-list primary-verified 2026-06-30 |
| **I2 Haupt et al.** (arXiv:2605.30916) | HM1987 + HM1991 + **Baker 2002** + Strathern | **Substantive import (type-i):** multitask P-A for benchmark aggregation, v\*=(M+rΣ)⁻¹Mw; cites Baker 2002 for effort-reallocation, not the congruity condition. Primary-verified |
| **A9 Marklund–Infanger–Van Roy** (arXiv:2603.15017) | HM1991 (+ Strathern) | **Genealogy nod:** HM1991 cited once in a related-work paragraph, bundled with a textbook; multitask math unused in the paper's results (`verification.md` §2.1) |
| (I3 Haupt-2, OpenReview Y5qABVr7uB) | HM1991 + Strathern **via its arXiv sibling only** | n/a-coded; own ref list unread (bot-challenge) |

Neither I1 nor I2 cites Feltham–Xie, Banker–Datar, DKL, Bénabou–Tirole, or any
estimation item — the congruity and estimation tiers stay unreached even by the
field's best bridges (`bridges.md` §2-E, §Tier-1 verification).

### Pocket 2 — the CHAI control lineage (with the preprint-only caveat)
| Paper | Version of record reaches | Caveat |
|---|---|---|
| **D2 CIRL** (1606.03137, NeurIPS 2016) | Gibbons 1998 + Kerr 1975 (+ Jensen–Meckling 1976, non-scheme) | HM1991 + HM1987 were in the **arXiv v1 preprint only** — cut at camera-ready together with the entire multitask-distortion passage (`verification.md` §2.2, `why-the-gap.md` §M4) |
| **D3 Off-Switch** (1611.08219, IJCAI 2017) | Gibbons 1998 + Kerr 1975 + Tirole 2009 (non-scheme) | Baker 2002 **v1-only** (its distortion-theorem sentence cut, citation re-attached nowhere); **"Off-Switch cites HM1991" is REFUTED in every version** (OpenAlex merge artifact) |

Citation type: control / incomplete-contracting framing (folklore + survey
tier in the record) — **not** Goodhart-math import. The celebrated
"CIRL cites Holmström–Milgrom" bridge is a preprint artifact.

### Pocket 3 — the strategic-ML / platform periphery (cluster F)
| Paper | Reaches | Citation type |
|---|---|---|
| **F3 Miller–Milli–Hardt** (1910.10362, ICML 2020) | HM1991 (+ Grossman–Hart) | One-line **body use** of HM1991 complementarity — added *at* camera-ready (opposite direction from D2/D3); strategic-ML community, not safety |
| **F13** (2508.14927) | Holmström 1979 + 1980 | Control-branch framing citation |
| **F15 Content Moderator's Dilemma** (2412.16114) | **Feltham–Xie 1994** + HM1991 | Substantive, but **econ-authored** platform-governance work; "Goodhart" absent from its text; in-corpus only via the bridge non-exclusion rule (flagged borderline in `corpus.md`) |

**Adjacent named exceptions outside the CONTRACT tier** (for the post's honesty
paragraph): Hendrycks 2021 (H6) cites **Ridgway 1956** at the genealogy/folklore
tier ("systems optimize what is measurable"), not for Ridgway's composite-measure
math; the robust-RLHF pocket (C32–C35, H5) cites Ben-Tal / Duchi–Namkoong as
**DRO tooling (type-ii)**; **χPO (C31)** cites Duchi–Namkoong 2019 as a genealogy
footnote (type-ii — its Lemma 5.1 is a χ²-change-of-measure bound, *not* the HCR
identity; do not re-inflate); **Laidlaw 2024 (B3)** is the clean reinvented-uncited
case (type-iii): uses occupancy-measure χ² for Goodhart, cites zero estimation
lineage (92-entry ref list locked 2026-07-10; cite by current title "Correlated
Proxies…", ICLR 2025 spotlight). **BBS 2023** is the qualitative bridge (§4).

---

## 3. The verified should-be-cited set (task 08 + Track A verdicts)

Rule inherited from task 08 (`prior-art-verification.md`): **no proposition /
theorem / equation number is citable unless it carries [verified-primary]**;
[verified-secondary] and [paywalled-flag-for-user] items need a user pull before
any pinned number goes into external prose. Full bibtex with per-entry status:
`gap-refs.bib` (this directory).

### Citable NOW with pinned numbers ([verified-primary], task 08, 2026-06-24)
| Item | Pinned statement |
|---|---|
| Reynaert–Sallee 2016 (NBER w22911) | **Prop. 4** = tighter standard ⇒ more gaming (the Goodhart comparative static); **Prop. 2 + Cor. 1** = gaming can raise or lower welfare. Do NOT attribute either-direction welfare to Prop. 4 |
| Chetty 2009 (NBER w13844) | **eq. (3)** Feldstein sufficient-statistic formula; **eq. (7)** generalized weighted-average (sufficient iff κ=1). Equation numbers, not "Prop. N", unless the AEJ version is pulled |
| Banker–Datar 1989 | **Prop. 1** (sufficient) / **Prop. 2** (necessary & sufficient) for linear-aggregation optimality; §4 for weight ∝ sensitivity × precision (interpretation, not a numbered prop) |
| Frankel–Kartik 2019 | **Prop. 2** (parts 2, 3) — measure degrades when used at high stakes (+ Prop. 4 LQE version) |
| HCR inequality | **Polyanskiy–Wu §29.1, eq. (29.1)** (two-measure χ² variational inequality) / **Thm 29.1, eq. (29.3)** (estimation packaging) |
| Namkoong–Duchi 2017 | **Theorem 1, eq. (10)**, constant **√(2ρ/n)** — the χ²-DRO worst-case envelope. The 2 is the φ(t)=½(t−1)² normalization; convert before equating with δ |
| Feltham–Xie congruity *substance* | **via Budde working paper eq. (5)**: congruity index φ = cos²β, full congruity iff sensitivity vector ∝ value vector (attributed to Feltham–Xie 1994 p. 433 and Baker) — primary-grade open derivation, not the original's own label |

### Substance solid, numbers NOT pinned — pull before citing a number
- **Feltham–Xie 1994** — original prop number [paywalled-flag-for-user]
- **Baker 1992 / Baker 2002** — scanned/paywalled; iff-alignment and
  distortion = 1−cosθ are [verified-secondary] via Budde/OpenAlex
- **Holmström–Milgrom 1991** — multitask / equal-compensation principle
  [verified-secondary]; prop numbers [paywalled-flag-for-user]
- **Datar–Kulp–Lambert 2001** — set-monotonicity (adding a measure can help or
  hurt) [verified-secondary]; DOI confirmed; number [paywalled-flag-for-user]
- **Ridgway 1956** — composite-measure distortion [verified-secondary]; verbatim
  quote/page needs pull
- **Lipsey–Lancaster 1956** — [verified-secondary]; **no numbered theorem exists
  in the original** — cite as named principle, prose statement
- **Matrix HCR (ellipsoid form)** — [verified-secondary] (Wikipedia verbatim);
  derivable in three lines from scalar eq. (29.1); numbered primary =
  Lehmann–Casella §2.7, needs pull
- **Rockafellar 1970** — cite **by section** (Fenchel duality §31,
  perturbation/value-function conjugacy §28–30); no theorem number until pulled
- **Ben-Tal et al. 2013** — [verified-primary] *for the correction*: it contains
  the φ-divergence conjugate-RCP **machinery only** (Tables 1–2). It has **no**
  "mean+√r·sd" proposition — do not cite it for the envelope

### The dictionary's two settled rows (Track A verdicts, closed)

**T1/T2 anchor row** (`research/threads/lit_review/selection-bound-chapman-robbins/README.md`,
closed 2026-07-11): T1's inequality **is** the Hammersley–Chapman–Robbins χ²
variational inequality, verbatim after rearrangement (Polyanskiy–Wu eq. 29.1)
[confident, verified-primary]; the same envelope is the χ²-DRO worst case with
exact constant √(2ρ/n) (Namkoong–Duchi Thm 1 eq. 10) [confident]; Ben-Tal 2013
is machinery only; T2's skeleton is classical (matrix-HCR ellipsoid + support
function); the declared-value-norm operator wrapper is an **auditable negative**
(apparently unstated, but a one-line corollary — packaging, not math)
[tentative]. Surviving contribution: the selection-channel *reading* +
declared-value-metric *packaging* + assembled sharpness pair — framing, not
mathematics.

**T5 row** (`research/threads/lit_review/looking-for-exchange-rate-results/README.md`,
closed 2026-06-23): the h = c·w condition **is** Feltham–Xie 1994 perfect
congruity / Baker 1992/2002 zero distortion (1−cosθ); (A)/(B) are equimarginal /
quadratic multitask agency standard (Baumol–Oates, Montgomery 1972, HM1991);
(C) set-monotonicity is closest to DKL 2001; only the **subset-invariance
packaging (D)** appears unstated — a one-line corollary, state it as such. Plus
the value→harm **interpretive inversion**: in contract theory h∝w is the *good*
(first-best) case; in T5 the hidden vector is harm, so the same algebra means
invariantly-high harm — do not let shared algebra read as shared meaning.

---

## 4. The BBS delta

**BBS 2023** = John, Caldwell, McCoy, Braganza, "Dead rats, dopamine,
performance metrics, and peacock tails…", *Behavioral and Brain Sciences* 47:e67
— the only document spanning econ + AI + biology. Body-verified 2026-06-30
(`bridges.md` §4; `phase0-handoff.md` §3b) [confident]:

- **What BBS already bridged:** the *concept*. It names "proxy failure" as a
  unifying cross-domain mechanism and cites both sides — econ: Holmström
  1979/2017, **Baker 2002**, Kerr 1975, Bénabou–Tirole 2016; AI: Amodei 2016,
  Manheim–Garrabrant 2018, Manheim 2018, Everitt et al. 2021.
- **What BBS is not:** formal. Its propositions (Table 2) are prose; Fig. 1 is
  an "illustrative" causal diagram; the scalar-proxy necessity is argued via
  revealed preference, no Σw_jP_j projection; it *reviews* Baker-2002 distortion
  in prose without ever restating the 1−cosθ / congruity math. Its §6 states
  outright that a formal model of the unified mechanism does not exist.
- **What BBS does not reach:** Feltham–Xie, HM1991, Banker–Datar, DKL,
  Lipsey–Lancaster, Raj Chetty, any estimation/χ²-DRO item. (Name-collision
  corrections stand: its "Chetty" is Marshini Chetty; it has no Lipsey ref;
  Holmström 1979/2017 not HM1991; Baker 2002 not 1992.)
- **Our delta:** (a) the *formal* tier BBS gestures at or omits — congruity
  geometry, HCR/χ²-DRO selection bound — carried into an explicit
  multidimensional proxy-vs-goal statement; (b) the **quantified citation
  audit** (BBS asserts no bibliometrics); (c) the subset-invariance reading.
  BBS proves the concept travels; it does not prove the theorem — and says so
  itself.
- Incidental: BBS cites **Hennessy–Goodhart 2021 (SSRN)**, an econ-authored
  Goodhart+ML item on the prior-art side (not in the AI denominator).

---

## 5. Why the gap — mechanisms with evidence levels

Compressed from `why-the-gap.md` (task 09, complete 2026-07-11); detail,
verbatim passages, and method notes live there. These are one loop seen at
four stages, not rival explanations.

| # | Mechanism | Evidence level |
|---|---|---|
| M1 | **Vocabulary divergence.** 7 of 9 econ/stats technical terms (congruity, second best, sufficient statistic in the incentive sense, Chapman–Robbins, informativeness principle, equimarginal, exchange rate) have **zero occurrences** in the corpus; "distortion"/"multitask" (agency sense) appear only in the known bridge pocket. Keyword search structurally cannot cross the gap in either direction. Two independent methods agree | **[confident]** — the strongest single mechanism claim |
| M2 | **Community boundary / reference-space composition.** Sampled core papers' bibliographies: ≈2/3 visibly ML, **≈0.3% econ/stat/mgmt venues, 0% incentive theory**; meanwhile adjacent ML communities cite the same prior art heavily (Ben-Tal: 129 CS citers, all DRO-ML; HCR: 88, all signal processing). Not an indexing artifact | **[confident]** for composition facts; the "capture process" reading [tentative]. Do not quote 67.6% as a precise statistic |
| M3 | **Inherited pruned base.** Amodei 2016 — cited by ~40% of the sampled core — carried zero contract/estimation references; the surveys are equally empty. A researcher building outward from the anchors inherits a frame where the only economics is Goodhart 1984 | **[confident]** as bibliographic fact; inheritance *as mechanism* [tentative] (no causal identification) |
| M4 | **Revision pruning.** Four version histories read in full: D2 and D3 kept every framing-tier econ ref and cut precisely the technical-import items (HM1987/HM1991; Baker 2002 with its distortion-theorem sentence); F5 dropped Chetty in an *expansion* (rules out page budget); F3 — the strategic-ML case — moved the **opposite** way, adding HM1991 at camera-ready. Pattern: "unused imports get pruned; used imports get added" | **[confident]** per-case facts; unifying pattern [tentative] (n=4); **any attribution of intent [guess]** — authors vs reviewers vs space is not recoverable |
| M5 | **The 2026 nod.** First in-corpus bridges to HM1991/Baker appeared in 2026 (I1/I2 import tier, A9 nod tier), via benchmark-design economics, not the reward-hacking lineage — and they stop at exactly the items the CHAI preprints reached a decade earlier. Congruity/sufficiency/estimation tier: still zero AI-safety-authored contact | **[tentative]** — floor observation, NOT a trend claim; all are preprints that could themselves be pruned at camera-ready |

Remaining pure conjecture (label as such if mentioned at all): reviewer-driven
de-econ pressure; bibliography-copying as the literal propagation channel.

---

## 6. Theorem-family scope decision (task 08, binding on the post's math sections)

From `prior-art-verification.md` §SCOPE DECISION, updated by the July-10
rescope: the post foregrounds the applicable math; per family it asserts the
citation gap only as evidence. Family ranking by primary-source backing:

1. **Estimation / χ²-DRO (T1/T2) — lead with this.** Two independent exact
   primaries (HCR eq. 29.1; Namkoong–Duchi Thm 1 eq. 10). The tightest place to
   assert the gap with pinned numbers. AI near-miss exemplar: Laidlaw 2024.
2. **Performance-measurement / congruity (T5) — lead alongside.** Substance
   fully settled (congruity = cos²β via Budde; Banker–Datar Props 1–2;
   Reynaert–Sallee Props 2/4; Chetty eqs. 3/7) but the Feltham–Xie / Baker /
   HM1991 / DKL **proposition labels are paywalled** — cite substance now,
   numbers after user pull.
3. **Second-best / corrective-Goodhart** — solid; Reynaert–Sallee and
   Frankel–Kartik primary-pinned; Lipsey–Lancaster has no number to pin.
4. **Convex duality (T4)** — Rockafellar by section only until pulled. (Track A
   review `litrev-convex-budget` not yet run — T4 is not one of the settled
   dictionary rows; don't present it as such.)

---

## 7. Known limitations (surfaced, not papered over)

1. **Sampled-cluster scope.** Clusters C, F, G are anchor + representative
   samples (`corpus.md` §Open-ended-region rule). Every published total must
   carry this scope note.
2. **Absence rows outside the verified sample are single-pass.** Task 07
   second-sourced every *hit* cell and PDF-verified a 24-paper absence set
   (all big bibliographies + a cross-cluster sample); absence cells outside
   that sample carry task-06 single-pass confidence (`verification.md` §7).
   The 14 named type-(iii) surnames are zero across all 68 grepped texts.
3. **A12, I3 n/a** (access-limited OpenReview; bot-challenge) — minable
   N = 115, not 117. I3's econ citations are known only via its arXiv sibling.
4. **Revision-instability error bar.** Reference lists in this corpus are
   revision-unstable (four documented v1-only hits + one v2 addition); any
   single-version coding, including ours, inherits this error bar. The
   convention (§0) and the M4 table carry both readings.
5. **2026 bridges not camera-ready-checked.** I1, I2, A9 are current-version
   preprints; per M4 their econ contacts could be pruned (or deepened) at their
   own camera-readies. Flag for a post-publication re-check.
6. **S2 transient wrong-list bug.** Semantic Scholar's references endpoint
   served two wrong lists on 2026-07-10 (B12, C28) — both rows were fully
   redone from PDF + fresh lists and confirmed; replicators should
   identity-check every S2 list (`verification.md` §2.3, §7).
7. **Four hit rows are API-dead (2X).** C15, C31, C32, H5 have zero S2/OpenAlex
   references; their hits rest on two independent text extractions of the same
   arXiv artifact class, flagged "2X" not silently promoted (`verification.md` §3).
8. **Paywalled proposition labels** (§3 list) must be pulled before any pinned
   number appears in external prose. Also grep hygiene for replicators:
   letter-spaced small-caps bibliographies and diacritic renderings defeat
   naive surname greps; normalize first (`verification.md` §1).
9. **Task-08 verification date is 2026-06-24** — proposition-number checks
   predate the freeze; nothing in tasks 05–07 touched those sources.
10. **Bolton–Dewatripont 2005 check** (does a PhD textbook co-locate framework
    pieces 1–4?) remains an open human-access item (`phase0-handoff.md` §10.6);
    affects the honest novelty scope of the dictionary, not the gap numbers.

---

## 8. Licensed-claim / overclaim pass (the headline claims)

**Claim 1 — the localized gap.** *In the frozen 115-paper corpus, the
reward-hacking + RLHF-overoptimization core (B+C, 0/60) cites zero
performance-measurement contract theory; across the whole corpus that tier is
reached only by three named pockets, and the congruity / public-finance /
second-best / corrective-tax / estimation-as-prior-theory tiers are at 0–1 of
115.*
- **What it proves:** a coded, two-method-verified bibliographic fact about a
  frozen, documented denominator, versions of record, with the exception floor
  enumerated.
- **Must NOT imply:** ❌ "AI safety ignores economics" — the corpus cites the
  eponym (24), the folklore tier (20), Lucas (3), and the CHAI lineage keeps
  Gibbons/Kerr/Tirole; the gap is at the *specific technical tier*, not econ
  wholesale. ❌ "Nobody bridged the fields" — BBS 2023 (conceptual), Wang–Huang
  and Haupt 2026 (formal, HM1991/Baker), CHAI v1 preprints. ❌ Any claim about
  papers outside the documented denominator (the 2025–26 tail is unbounded).
  ❌ Any claim about authors' *awareness* — absence of citation is not evidence
  of ignorance (M1's what-this-does-not-license).

**Claim 2 — the reinvention at the technical tier.** *The specific mathematics
of multidimensional Goodhart has named classical homes the corpus never cites
as prior theory: congruity/cos²β (Feltham–Xie/Baker; 1 econ-authored citer),
HCR/χ²-DRO (0 as prior theory — the two χ²-for-Goodhart papers cite none of the
estimation lineage), sufficiency (Banker–Datar/Chetty; 0), second-best /
corrective-Goodhart (0, incl. a paper with "Goodhart's Law" in its title).*
- **What it proves:** the field independently reinvents (Laidlaw's χ²,
  Wang–Huang's distortion index) rather than importing, at exactly the tier
  where the math already exists — and the prior art is demonstrably reachable
  (adjacent ML communities cite it heavily).
- **Must NOT imply:** ❌ "No contact at all with these literatures" — type-(ii)
  tooling citations exist (robust-RLHF cluster, χPO's footnote); state "never
  as prior theory," not "never cited." ❌ "Our math is novel" — the opposite:
  T1/T2 = HCR/χ²-DRO and T5's condition = congruity are the project's own
  settled verdicts; the post's contribution is the synthesis/dictionary +
  audit + subset-invariance reading, stated proudly as elementary
  (`paper1-is-elementary-synthesis`). ❌ "χPO's bound is the HCR identity"
  (overstatement, corrected 2026-06-30). ❌ "First to bridge contract theory
  to formal Goodhart" (Wang–Huang/Haupt hold it).

**Claim 3 — the mechanism story.** *The gap is self-reproducing: terminologically
disjoint vocabularies (M1), an almost purely ML-internal reference space (M2),
anchor documents that carried no econ base (M3), and revision pressure that
removed exactly the non-load-bearing technical-tier contacts while keeping
folklore (M4); the 2026 bridges arrive from an adjacent community and re-reach
only the pruned preprints' items (M5).*
- **What it proves:** a coherent, evidence-tagged description in which every
  component fact is verified at the level stated in §5.
- **Must NOT imply:** ❌ causal identification (M3 shows who cites the anchor,
  not that bibliographies were built from it); ❌ intent attribution (M4's
  whodunit is [guess] except where specific readings are ruled out); ❌ a trend
  ("the gap is closing" — M5 is a floor observation, n≈3, one group twice);
  ❌ that the mechanisms were *observed* operating (M2/M3 processes are
  [tentative] readings of composition snapshots).

---

## 9. References file + merge note

- **`gap-refs.bib`** (this directory): the should-be-cited set, the
  verified-absent precedents, BBS 2023, and the named exceptions — every entry
  annotated with its verification status ([verified-primary] /
  [verified-secondary] / [paywalled — needs pull] / corpus-role).
- **Do not merge into `book/refs.bib` here.** The book's bibliography is owned
  by the novelty-refactor capstone (`plans/novelty-refactor.md`); when it runs,
  merge `gap-refs.bib` entries it needs and keep the annotations out of the
  book file.

---

## 10. Traceability index (every §1–2 number → sub-artifact)

| Number | Source |
|---|---|
| N=117 / 115 minable; cluster sizes; inclusion rules; scope note | `corpus.md` (freeze 2026-07-10) |
| All tier totals, item counts, eponym split | `audit.md` §Tier totals (⟦07⟧-verified) + §Master coded table |
| Per-cell verbatim hit strings, methods, 2M/2X flags | `verification.md` §3 (hits), §4 (absences); raw batches in `coding-batches.md` |
| D2/D3/F3/F5 version histories; any-version table | `verification.md` §2.2, §6; `why-the-gap.md` §M4 |
| A9 genealogy-nod typing | `verification.md` §2.1; `bridges.md` §2-G |
| I1/I2 ref-list contents; Laidlaw type-iii lock; χPO correction | `bridges.md` §2-E, §Adversarial synthesis, §Tier-1 notes; `phase0-handoff.md` §5–6 |
| Forward-citation census (Ben-Tal 129 CS citers etc.); vocabulary probe | `bridges.md` §1, §3 |
| BBS reference list + qualitative determination | `bridges.md` §4; `phase0-handoff.md` §3b |
| M1–M5 facts (refshare composition, inheritance counts, greps) | `why-the-gap.md` (artifacts in the task-07/09 scratchpad) |
| Proposition numbers + verification tags | `prior-art-verification.md` (task 08) |
| T1/T2 verdict | `research/threads/lit_review/selection-bound-chapman-robbins/README.md` |
| T5 verdict | `research/threads/lit_review/looking-for-exchange-rate-results/README.md` |
| Rescope decisions (LW post; F&G; B leads) | `plans/phase0-handoff.md` §11 |
