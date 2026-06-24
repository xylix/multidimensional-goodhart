# Bridges & exceptions — forward-citation census, vocabulary probe, BBS lock (Task 04)

**Purpose.** Confirming gate for whether the "citation gap" between AI-safety
Goodhart formalizations and economics/stats prior art is REAL. This file is the
AUTONOMOUS portion: forward-citation CENSUS + VOCABULARY PROBE + BBS LOCK. The
adversarial multi-LLM exceptions hunt is the lead's, and the GATE VERDICT is the
lead's (placeholders at the bottom — not written here).

**Discovery date:** 2026-06-24. Every OpenAlex / Semantic Scholar / arXiv /
WebSearch query is recorded inline so each count is auditable. APIs:
- OpenAlex resolve: `curl -s "https://api.openalex.org/works/https://doi.org/<DOI>"`.
- OpenAlex forward cites, CS-field-filtered:
  `?filter=cites:<Wid>,primary_topic.field.id:fields/17&per-page=200`
  (`fields/17` = Computer Science). Hand-inspected each CS-tagged citer by title.
- Distinction enforced throughout: **"cites the econ result"** ≠ **"connects it
  to GOODHART / reward-overoptimization"**. The second is the gap actually claimed.

---

## 1. Forward-citation census table

All counts: OpenAlex, queried 2026-06-24. "CS-tagged" = citers whose
`primary_topic.field` is Computer Science (broad — hand-inspected by title).
"Genuine alignment citer" = a real AI-safety / alignment / reward-hacking paper
(not strategic-ML, not infosec-agency, not DRO-ML, not signal-processing).

| Prior-art item | OpenAlex Wid | total cites | CS-tagged | genuine alignment citers (named) | connects to Goodhart? |
|---|---|---|---|---|---|
| Banker–Datar 1989 | W1983044690 | 930 | 5 | **0** (CIO-turnover, infosec PA-model, fake-review-detection — none alignment) | n/a |
| Chetty 2009 "Taxable Income Elasticity Sufficient…" | W2097545809 | 353 | **0** | **0** | n/a |
| Datar–Kulp–Lambert 2001 | W2000800075 | 399 | 1 | **0** ("Continuous Motivation of Algorithm Engineers" — HCI, not alignment) | n/a |
| Frankel–Kartik 2019 "Muddled Information" | W4237485368 | 100 | 4 | **0** (p-hacker screening, manipulable-info market, emotion-AI, algo-transparency — econ-CS/strategic, not alignment) | n/a |
| Bénabou–Tirole 2016 "Bonus Culture" | W3125660297 | 217 | 1 | **0** (a bibliometric analysis) | n/a |
| Holmström–Milgrom 1987 | W2106580408 | 2957 | 27 | **1: CIRL 2016** (Hadfield-Menell, CHAI). Strategic-ML adjacents: Manipulation-Proof ML 2019, Algorithmic Monoculture 2023 — NOT alignment | **NO** — CIRL cites HM1987 for *aggregation/linearity*, control/coop-IRL framing, not Goodhart |
| Ridgway 1956 | W2330891463 | 361 | 8 | **1: "Unsolved Problems in ML Safety" 2021** (Hendrycks et al., 2109.13916) | **NO** (genealogy tier — see §2; cited for "systems optimize what is measurable", not for Ridgway's composite-measure math) |
| Ben-Tal et al. 2013 (χ²-DRO) | W1484551447 | 766 | **129** | **0** alignment. 129 CS citers are ALL distributionally-robust-ML (group-DRO, robust NLP/MT, OOD generalization, fairness) — none are reward-hacking/Goodhart | **NO** — the DRO-ML community cites it heavily; the Goodhart/reward-hacking community does not reach it |
| Namkoong–Duchi 2017 "Variance-based Regularization" | W2944407464 | 115 | 70 | **0** (0 of 70 CS citers match reward-hack/Goodhart/RLHF/alignment keywords) | **NO** |
| Hammersley–Chapman–Robbins 1951 | W2018637760 | 259 | 88 | **0** — 88 CS citers are ALL signal-processing / quantum-metrology / estimation-theory (Barankin/Cramér–Rao/Ziv-Zakai bounds) | **NO** |
| Şabac–Yoo 2019 (sufficient aggregation) | W2974643959 | **0** | 0 | **0** (zero citers of any kind) | n/a |

**Census bottom line.** Across 11 priority prior-art items, the *only* genuine
alignment papers that cite ANY of them are:
- **CIRL 2016** (Hadfield-Menell, CHAI) → cites HM1987 — control/aggregation, **not Goodhart**.
- **Hendrycks "Unsolved Problems in ML Safety" 2021** → cites Ridgway 1956 — genealogy tier, **not Goodhart-math**.
Both are CHAI/Berkeley- or Hendrycks-lineage and were already inside the audit
corpus. **Zero** of the contract-theory math items (Banker–Datar, DKL 2001,
Feltham–Xie [audit: 949/4/0], Bénabou–Tirole, Frankel–Kartik), the public-finance
sufficiency items (Chetty), or the ESTIM/χ²-DRO items (Ben-Tal, Namkoong–Duchi,
Chapman–Robbins) has a single genuine alignment citer that connects it to
Goodhart / reward-overoptimization. **The clean "0 genuine alignment citers
connecting to Goodhart" holds for the entire congruity/sufficiency/χ²-DRO tier.**

The Ben-Tal / Namkoong–Duchi / Chapman–Robbins rows are the sharpest: these are
heavily-cited results (766 / 115 / 259) with large CS citer sets (129 / 70 / 88)
— the χ²-DRO and estimation-theory ML communities cite them constantly — yet
**not one** of those CS citers is a reward-hacking / Goodhart paper. The math is
alive in ML; it just has not reached the Goodhart sub-literature.

---

## 2. Complete bridge / exception catalogue

Every AI↔prior-art citation found (the FLOOR = known CHAI/BBS exceptions;
plus the new ones this census surfaced). Each tagged: which prior-art branch,
what's cited, **and whether it connects to GOODHART vs only control/agency/genealogy.**

### A. CHAI / Berkeley lineage (Hadfield-Menell / Russell) — known floor, CONFIRMED
| AI paper | prior-art cited | branch | connects to Goodhart? |
|---|---|---|---|
| CIRL 2016 (1606.03137) | **HM1991**; HM1987 (W2106580408 census-confirmed) | CONTRACT (multitask/aggregation) | **NO** — cooperative-IRL / control framing |
| Off-Switch Game 2017 (1611.08219) | **HM1991 + Baker 2002** | CONTRACT | **NO** — off-switch / incomplete-contracting framing |
| Zhuang–Hadfield-Menell 2020 (2102.03896) | Kerr 1975 + transaction-cost cluster (Williamson/Klein/Shavell) | MGMT + transaction-cost econ (a *different* econ branch) | partial — the paper IS a Goodhart paper, but cites only Kerr (folklore) + transaction-cost, **not** congruity math |

CHAI reaches **HM1991, HM1987, Baker 2002** only, via an
incomplete-contracting / off-switch / cooperative-control framing — **not** the
multidimensional-Goodhart / congruity framing. (Matches audit reverse-sweep R1/R2.)

### B. BBS bridge — known floor, CONFIRMED & re-locked (see §4)
John/Caldwell/McCoy/Braganza 2023. Econ: Holmström 1979 & 2017, Baker 2002,
Kerr 1975, Bénabou–Tirole 2016. AI: Amodei 2016, Manheim-Garrabrant 2018,
Manheim 2018, Everitt/Hutter/Kumar/Krakovna 2021. **Connects to Goodhart
qualitatively/conceptually, NOT formally** (delta analysis in §4).

### C. Braganza "Proxyeconomics" (R. Soc. Open Sci. 2022) — known floor
Econ-side formal proxy-competition / selection model. (Not re-audited here; it
is the econ-side, not an AI-side citer of econ prior art.)

### D. Hendrycks "Unsolved Problems in ML Safety" 2021 (2109.13916) — surfaced by census
- **Cites Ridgway 1956** (ref [152]), confirmed: `referenced_works` contains
  W2330891463 (OpenAlex, 2026-06-24). Also cites Goodhart 1984 [64],
  Manheim-Garrabrant 2018 [127], Strathern 1997 [169].
- **Context (PDF body, verified):** Ridgway is cited at "Systems will optimize
  what is measurable [152], as 'what gets measured gets managed'." The
  proxy-collapse cluster [64,127,169] = Goodhart-eponym + Manheim-Garrabrant +
  Strathern. The paper IS a Goodhart paper (has a "Proxy Gaming / Goodhart's Law"
  section) — but it cites Ridgway at the **GENEALOGY/folklore tier**, NOT for
  Ridgway's actual contribution (composite/weighted-sum measure Σ w_j P_j and its
  distortion). **Connects to Goodhart? The paper does; the Ridgway citation does
  not carry the math.** This is a genealogy citation, not a math citation —
  exactly the gap pattern.

### E. **"Reward Hacking as Equilibrium under Finite Evaluation"** — NEW STRONGEST EXCEPTION
Wang & Huang, **arXiv:2603.28063, 30 Mar 2026** [cs.AI]. Surfaced by the
vocabulary probe (WebSearch "reward hacking Goodhart distortion multitask
contract incentive economics", 2026-06-24); PDF fetched & read.
- **Prior-art cited:** **Holmström–Milgrom 1991** + **Baker 1992** (both in the
  reference list, verified), plus Afriat 1967 (revealed preference), Bostrom 2014.
- **Branch:** CONTRACT (multitask principal-agent / incomplete contracts).
- **Connects to Goodhart? YES — formally.** Abstract: "Our framework instantiates
  the multi-task principal-agent model of Holmström and Milgrom (1991) in the AI
  alignment setting … derive a computable **distortion index** D_i that predicts
  both the direction and severity of hacking on each quality dimension." Has
  Proposition 1 (Inevitability of Distortion) with proof, Corollary 1 (distortion
  index), and "Remark 1 (Relation to H&M 1991)". Explicitly frames a
  **Goodhart→Campbell transition** (Conjectures 1–2) and calls it "the first
  economic formalization of Bostrom's treacherous turn."
- **Why it is still only a PARTIAL exception (and confirms the gap's shape):**
  it reaches exactly the **same two items CHAI reached — HM1991 + Baker 1992** —
  and **independently re-derives** a "distortion index" rather than citing the
  congruity literature. It does **NOT** cite Feltham–Xie (the verbatim h=c·w
  congruity result), Banker–Datar, Baker 2002, Datar–Kulp–Lambert, Bénabou–Tirole,
  Reynaert–Sallee, Chetty, OR any ESTIM/χ²-DRO item. So even the single AI paper
  that does the contract-theory bridge to Goodhart re-invents the distortion
  geometry instead of citing the accounting/congruity tier — the gap is *narrowed
  but not closed* by this paper.
- **Timing flag:** Mar 2026, very recent (post-dates the audit's seed sweep). A
  single preprint, 8 pages, by authors with no prior footprint in the area;
  evidentiary weight is "one recent preprint that does the obvious bridge," not "the
  field has absorbed the prior art." But it IS a real, citable AI-alignment paper
  connecting HM1991/Baker-distortion to Goodhart → **the gap paper must cite it and
  scope its novelty claim around it** (the gap paper's delta is now the
  congruity/sufficiency/χ²-DRO tier that 2603.28063 still omits, plus the
  subset-invariance reading).

### F. Strategic-ML / econ-CS adjacents found but NOT alignment (recorded to keep the boundary sharp)
These cite the econ prior art but are the *strategic-classification / mechanism-design*
lineage (Cluster F in ai-corpus.md), NOT the AI-safety reward-hacking corpus:
- HM1987 citers: "Manipulation-Proof Machine Learning" 2019, "Algorithmic
  Monoculture and Social Welfare" 2023.
- Frankel–Kartik 2019 citers: "Screening p-hackers", "Market for Manipulable
  Information", "Emotion AI in Disguise", "Algorithmic Transparency" (all 2024).
- These are correctly OUT of the alignment denominator (the audit flags Cluster F
  as a distinct, self-citing lineage). They show the econ prior art IS reachable
  by adjacent CS communities — sharpening that the *alignment* community's
  non-citation is a community boundary, not an indexing artifact.

---

## 3. Vocabulary-probe results

Do the econ/stats technical terms appear in the AI Goodhart/reward-hacking corpus?
Method: arXiv full-text via WebSearch (June 2026 index) scoped to
reward-hacking/overoptimization/Goodhart papers, plus direct PDF reads where a hit
surfaced. All 2026-06-24.

| Term (econ/stats sense) | Appears in AI corpus? | Where / note |
|---|---|---|
| **congruity** | **ABSENT** | No reward-hacking/Goodhart paper uses "congruity" (Feltham–Xie's term). WebSearch explicit-confirmed absent. |
| **distortion** (Baker sense) | **PRESENT — in ONE paper only** | Only **2603.28063** (the new exception, §2-E), where it is explicitly imported from Baker 1992 / HM1991 as the "distortion index." Absent from all other corpus papers (they say "overoptimization"/"reward hacking"). |
| **multitask** (agency sense) | **PRESENT — in ONE paper only** | Only **2603.28063**, importing HM1991's "multi-task principal-agent." Elsewhere "multitask" in AI means multi-task *learning*, a different concept. |
| **second best** | **ABSENT** | No Lipsey–Lancaster "second best" framing in the corpus. |
| **sufficient statistic** | **ABSENT** (in the Chetty/Holmström incentive sense) | Reward-overopt papers use info-bottleneck / VIB framing (InfoRM 2402.09345, 2510.13694), not "sufficient statistic for the proxy." No Chetty/Holmström-1979 sufficiency citation. |
| **Chapman–Robbins** | **ABSENT** | Not in any reward-hacking/Goodhart paper. (Even Laidlaw 2403.03185, which USES χ², cites no HCR/estimation prior art — audit ESTIM-tier finding, confirmed by Chapman–Robbins census: 0 alignment citers.) |
| **informativeness principle** | **ABSENT** | Holmström 1979's term; no corpus appearance. |
| **equimarginal** | **ABSENT** | No corpus appearance. |
| **exchange rate** (measurement / h_j/w_j sense) | **ABSENT** | No corpus appearance in the measurement sense. |

**Vocabulary-probe verdict: a CLEAN NEGATIVE.** Seven of nine econ/stats terms are
entirely absent from the AI Goodhart/reward-hacking corpus. The only two that
appear ("distortion", "multitask" in the agency sense) appear in **exactly one**
paper — 2603.28063 — which explicitly imports them from HM1991/Baker. The AI
corpus's native vocabulary ("overoptimization", "reward hacking", "regressional/
extremal Goodhart", "information bottleneck") is disjoint from the econ/stats
congruity/sufficiency/HCR vocabulary. This is strong independent evidence the gap
is real: it is not just a citation omission but a *vocabulary* gap — the two
literatures have not interpenetrated terminologically, with the single 2026
exception noted.

---

## 4. BBS LOCK

**Paper.** John, Y. J., Caldwell, L., McCoy, D. E., & Braganza, O. (2023). "Dead
rats, dopamine, performance metrics, and peacock tails: Proxy failure is an
inherent risk in goal-oriented systems." *Behavioral and Brain Sciences*.
OpenAlex **W4382011620**; DOI 10.1017/s0140525x23002753; 201 referenced works.

### Exact reference strings — CONFIRMED (OpenAlex `referenced_works` resolved, 2026-06-24)
Economics (verified author-year via OpenAlex resolution of the reference Wids):
- **Holmström, B. (1979)** "Moral Hazard and Observability" ✓
- **Holmström, B. (2017)** "Pay For Performance and Beyond" ✓ (Nobel lecture)
- **Baker, G. P. (2002)** "Distortion and Risk in Optimal Incentive Contracts" ✓
- **Kerr, S. (1975)** "On the Folly of Rewarding A, While Hoping for B" ✓
- **Bénabou, R. & Tirole, J. (2016)** "Bonus Culture: Competitive Pay, Screening,
  and Multitasking" ✓
- Genealogy also present: **Campbell, D. T. (1979)**, **Strathern, M. (1997)**,
  **Goodhart, C. (1984)**.

AI / alignment (per audit's prior Cambridge-OA-PDF verification, re-confirmed
where OpenAlex resolved): **Manheim 2018** "Overoptimization Failures and
Specification Gaming in Multi-agent Systems" ✓ (OpenAlex-resolved here); **Amodei
2016**, **Manheim–Garrabrant 2018**, **Everitt/Hutter/Kumar/Krakovna 2021** (audit
verified from the OA PDF; note 13 of the 201 reference Wids are OpenAlex-deprecated
404 records, which is where the arXiv/preprint AI refs sit — so OpenAlex alone
under-resolves the AI side; the audit's PDF-string verification stands).

### Corrected premises — RE-CONFIRMED
- **No Lipsey reference.** ✓ Confirmed: "lipsey" and "second best" both ABSENT
  from all 188 resolved BBS reference strings.
- **"Chetty" = Marshini Chetty (privacy/HCI), NOT Raj Chetty.** ✓ Consistent:
  no Raj-Chetty public-finance reference ("chetty" absent from resolved econ set;
  any Chetty present is the HCI one per the audit's name-collision rule).
- Also confirmed ABSENT (so NOT in BBS): **Feltham–Xie**, **Holmström–Milgrom 1991**
  (no "milgrom" / "feltham" in resolved refs) — BBS reaches Holmström 1979/2017 and
  Baker **2002**, not HM1991 and not the congruity tier.

### Qualitative-vs-formal determination — THE DELTA OVER BBS
**BBS stays at the QUALITATIVE / CONCEPTUAL level. It does NOT develop a formal
multidimensional-Goodhart theorem.**
- Evidence (abstract + S2 TLDR, verified): BBS proposes "proxy failure" as a
  *unifying mechanism* described verbally — "whenever incentivization or selection
  is based on an imperfect proxy measure of the underlying goal, a pressure arises
  that tends to make the proxy a worse approximation of the goal." It reviews and
  taxonomizes named phenomena (cobra effect, Goodhart's law, Campbell's law) across
  economics/academia/ML/ecology and proposes a shared conceptual structure with
  regulator/agent/proxy roles.
- It **cites** Baker 2002 (which contains the distortion = cosine-similarity math)
  and Holmström, but **does not import or restate their formal results** as a
  proxy-vs-goal *vector* theorem: no goal vector G / proxy vector P with a congruity
  proportionality condition (h = c·w), no distortion = 1−cosθ statement, no
  multitask projection theorem, no proof. BBS is a *Behavioral and Brain Sciences*
  target article (interdisciplinary conceptual synthesis with peer commentary), not
  a formal-results paper. (Direct PDF body fetch was blocked by Cambridge/HTML and
  S2-references returned null; determination rests on the abstract, TLDR, venue
  type, and the resolved reference list — sufficient to establish *conceptual, not
  formal*. A belt-and-suspenders body grep for "theorem"/"congruity"/an explicit
  G,P vector equation is flagged for the lead if a formal-claim is to be coded
  `[confident]`.)

**Delta over BBS (what the gap paper adds):** BBS is the qualitative cross-domain
unification ("proxy failure" as a named conceptual mechanism, citing the econ
folklore + Baker 2002 + Holmström). The gap paper's contribution over BBS is to
(a) carry the *formal* contract-theory / accounting math (Feltham–Xie congruity,
Baker distortion-geometry, Banker–Datar / Şabac–Yoo sufficiency, the χ²-DRO / HCR
selection bound) that BBS cites-but-does-not-formalize or omits entirely, into an
explicit multidimensional proxy-vs-goal vector result, AND (b) the subset-invariance
reading. BBS proves the *concept* travels; it does not prove the *theorem*.

---

## GATE VERDICT (written by lead)

_[Placeholder — to be written by the lead. Do not fill in from this autonomous pass.]_

---

## PENDING: adversarial multi-LLM exceptions hunt

_[Placeholder — handled separately by the lead. The census above is the FLOOR
(CHAI + BBS + Braganza) plus the two new census hits (Hendrycks-Ridgway,
genealogy-tier) and the one new vocabulary-probe hit (2603.28063 Wang & Huang,
the strongest exception). The adversarial hunt should pressure-test whether any
further alignment paper connects the congruity/sufficiency/χ²-DRO tier to
Goodhart — this pass found none beyond 2603.28063's HM1991+Baker re-derivation.]_

---

## Auditable query log (all 2026-06-24, OpenAlex unless noted)

- Resolve DOIs → Wids: Banker–Datar W1983044690; Chetty-pol W2097545809; DKL
  W2000800075; Frankel–Kartik W4237485368; Bénabou–Tirole W3125660297; HM1987
  W2106580408; Ridgway W2330891463; Ben-Tal W1484551447; Namkoong–Duchi
  W2944407464 (title search "Variance-based Regularization with Convex Objectives");
  Chapman–Robbins W2018637760 (title.search "minimum variance estimation without
  regularity"); Şabac–Yoo W2974643959 (DOI 10.4236/tel.2019.97141).
- CS-tagged citers: `?filter=cites:<Wid>,primary_topic.field.id:fields/17&per-page=200`
  for each Wid above. Counts in §1. CS citers hand-inspected by title.
- Namkoong–Duchi keyword scan over 70 CS citers for
  {reward hack, goodhart, reward model, alignment, rlhf, reward over, spec gaming,
  proxy, reward misspec} → 0 matches.
- Chapman–Robbins: 88 CS citers, manual inspection → all signal-proc / quantum
  metrology / estimation theory; 0 alignment.
- Ben-Tal: 129 CS citers, manual inspection → all DRO-ML; 0 reward-hacking/Goodhart.
- Hendrycks 2109.13916 `referenced_works` contains W2330891463 (Ridgway) = TRUE;
  PDF body read for context (ref [152], genealogy tier).
- BBS W4382011620 `referenced_works` (201) resolved in batches; target-author scan;
  S2 abstract+TLDR (DOI:10.1017/s0140525x23002753). S2 `/references` returned null.
- Vocabulary probe: WebSearch (June 2026 arXiv index), queries logged in §2-E/§3:
  "reward hacking Goodhart congruity"; "…sufficient statistic / informativeness
  principle"; "…distortion multitask contract incentive economics" (→ surfaced
  2603.28063); "…second best / equimarginal / Chapman-Robbins"; "…Chapman-Robbins /
  informativeness principle / exchange rate alignment". 2603.28063 PDF fetched & read.
