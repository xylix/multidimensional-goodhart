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

### A. CHAI / Berkeley lineage (Hadfield-Menell / Russell) — known floor, **CORRECTED 2026-07-11 (task 07)**
| AI paper | prior-art cited | branch | connects to Goodhart? |
|---|---|---|---|
| CIRL 2016 (1606.03137) | **HM1991 + HM1987 in arXiv v1 preprint ONLY** — both absent from the NeurIPS 2016 version of record and arXiv v4; record cites Kerr 1975 + Gibbons 1998 | CONTRACT (v1: multitask/aggregation; record: Gibbons survey) | **NO** — cooperative-IRL / control framing |
| Off-Switch Game 2017 (1611.08219) | **HM1991: REFUTED — cited in NO version** (OpenAlex merge artifact). **Baker 2002 in arXiv v1 ONLY** — absent from v2/v3/IJCAI 2017 record; record cites Kerr 1975 + Gibbons 1998 + Tirole 2009 | CONTRACT (record: Gibbons + Tirole incomplete-contracting) | **NO** — off-switch / incomplete-contracting framing |
| Zhuang–Hadfield-Menell 2020 (2102.03896) | Kerr 1975 + transaction-cost cluster (Klein–Crawford–Alchian/Shavell/HM-Hadfield) | MGMT + transaction-cost econ (a *different* econ branch) | partial — the paper IS a Goodhart paper, but cites only Kerr (folklore) + transaction-cost, **not** congruity math |

**Task-07 correction (2026-07-11, all versions + venue PDFs read directly —
`citation-audit/verification.md` §2.2):** in the versions of record the CHAI
lineage reaches only **Kerr 1975 + Gibbons 1998 (+ Tirole 2009)**. The
HM1991/HM1987/Baker-2002 contacts existed only in first arXiv preprints and were
dropped at camera-ready; the earlier census line "CIRL cites HM1987
(W2106580408)" and audit reverse-sweep R1/R2 inherit this version caveat. The
exception floor here is thinner than previously recorded.

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

### G. **Marklund–Infanger–Van Roy 2026 "Consequentialist Objectives and Catastrophe"** — NEW genealogy-tier exception (task-07 confirmed, 2026-07-11)
**arXiv:2603.15017** (v1 16 Mar 2026, v3 24 Apr 2026) [cs.AI], Stanford. Surfaced
by the task-06 full-corpus coding (audit id **A9**, cluster A formal-Goodhart);
not in the June exceptions hunt's floor. Identity arXiv-API-verified; v3 PDF read
(`citation-audit/verification.md` §2.1).
- **Prior-art cited:** **Holmström–Milgrom 1991** (reference list, verified:
  "Multitask principal–agent analyses: Incentive contracts, asset ownership, and
  job design"), bundled with Laffont–Martimort 2001 (textbook) and
  Hadfield-Menell & Hadfield 2019. Also Strathern 1997 (MGMT tier).
- **Branch:** CONTRACT (pm-anchor by item), but see type.
- **Connects to Goodhart? The paper does; the citation does not carry the math.**
  HM1991 appears exactly once, in a related-work paragraph:
  > "Economic principal–agent models. The problem of specifying reward functions
  > in AI is closely related to the principal–agent problem in economics
  > [Hadfield-Menell and Hadfield, 2019], where a principal designs incentives
  > for an agent whose actions are imperfectly observable [Holmstrom and
  > Milgrom, 1991, Laffont and Martimort, 2001]."
  No multitask/congruity math is used in the paper's results (its theorems are
  about information requirements of safe consequentialist objectives). **Type:
  genealogy/related-work nod** — the Hendrycks–Ridgway pattern (§D), not the
  Wang–Huang pattern (§E).
- **Floor impact:** first cluster-A (formal-Goodhart-theory) paper to cite HM1991
  at all; leaves the substantive pm-branch floor unchanged (still I1/I2/F15 +
  F3's body use of HM1991 complementarity). The gap paper can cite it as
  evidence the nod is starting to appear without the import.

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
  a formal-results paper.
- **BODY-VERIFIED `[confident]` (2026-06-30, full target article read,
  `sources/Dead-rats-…_BBS_2023.pdf` pp. 1–16).** The determination no longer rests
  on abstract+venue. Concrete evidence:
  - **Table 2 ("Key propositions and their corollaries," p. 4)** states Props A/B/C
    + Corollaries 1–5 in **prose**, no equations (e.g. Prop B: "the use of the proxy
    for regulatory feedback creates a pressure towards proxy failure").
  - **Fig. 1 (p. 6)** is a Goal/Proxy/Regulator/Agent causal-arrow diagram,
    explicitly "illustrative rather than comprehensive" — not a vector space.
  - **§3.2** argues the scalar-proxy necessity *verbally* via revealed preference
    (Houthakker 1950; Samuelson 1938; von Neumann–Morgenstern 1944) — **no Σ wⱼPⱼ
    projection, no congruity condition.**
  - **§4.2 + Box 3** *review* the principal-agent math in prose ("'optimal incentive
    contract,' given noise or the potential for active 'distortion' (Baker, 2002;
    Hennessy & Goodhart, 2021)") — Baker's 1−cosθ / multitask projection is **never
    restated**.
  - **§6 (Conclusion), decisive:** the authors themselves state *"formal theories
    and models of proxy failure tend to be highly domain specific: It is unclear how
    they relate to each other, or how a formal model of the unified mechanism
    presently outlined might look."* → BBS openly flags the **absence of a formal
    unified model** as the open gap. This *strengthens* our delta.
  - **Reference list (read):** contains Baker 2002, Holmström 1979/2017, Kerr 1975,
    Bénabou–Tirole 2016, Aghion–Tirole 1997, Hennessy–Goodhart **2021** ("Goodhart's
    law and machine learning," SSRN 3639508); Amodei 2016, Manheim 2018, Manheim–
    Garrabrant 2018, Everitt/Hutter/Kumar/Krakovna 2021. Does **not** contain
    Feltham–Xie, HM1991, Banker–Datar, DKL, Lipsey–Lancaster, or Raj Chetty —
    confirms the corrected premises. (New incidental: BBS cites **Hennessy–Goodhart
    2021 SSRN**, distinct from the 2023 IER paper — flag for Track B corpus coding.)

**Delta over BBS (what the gap paper adds):** BBS is the qualitative cross-domain
unification ("proxy failure" as a named conceptual mechanism, citing the econ
folklore + Baker 2002 + Holmström). The gap paper's contribution over BBS is to
(a) carry the *formal* contract-theory / accounting math (Feltham–Xie congruity,
Baker distortion-geometry, Banker–Datar / Şabac–Yoo sufficiency, the χ²-DRO / HCR
selection bound) that BBS cites-but-does-not-formalize or omits entirely, into an
explicit multidimensional proxy-vs-goal vector result, AND (b) the subset-invariance
reading. BBS proves the *concept* travels; it does not prove the *theorem*.

---

## GATE VERDICT (written by lead, 2026-06-24)

**Plan-invalidating question (from `plans/litrev-discovery.md`):** *"Is the gap
real, and is our delta over BBS 2023 real?"*

**Verdict: BOTH SURVIVE — PROCEED. CONFIRMED by the adversarial multi-LLM hunt
(6 passes, synthesis at the bottom of this file, 2026-06-28): the hunt found
additional bridges but every one lands in the same two pockets already
identified (benchmark/contract papers reaching only HM1991/Baker; χ²-DRO papers
using the estimation prior art as *tooling*, not as the prior theory of
Goodhart). The gap is sharpened, not broken. Two forced scope adjustments stand;
the exception floor is expanded (see §2 and the synthesis).**

### 1. Is the gap real? — YES, localized, with an explicit exception floor.

Bibliographic facts (`[confident]` — every count auditable, query log §below):
- **Forward-citation census (§1):** across 11 priority prior-art items spanning
  the congruity / sufficiency / χ²-DRO tier, **zero** genuine AI-alignment papers
  cite any of them *and connect it to Goodhart*. The sharpest rows are the ones
  that are heavily cited inside adjacent ML (Ben-Tal 2013: 766 cites / 129 CS
  citers; Chapman–Robbins: 259 / 88; HM1987: 2957 / 27) — the χ²-DRO and
  estimation communities use this math constantly, yet **not one** of those CS
  citers is a reward-hacking / Goodhart paper. Non-citation is a *community
  boundary*, not an indexing artifact.
- **Vocabulary probe (§3):** clean negative — 7 of 9 econ/stats terms entirely
  absent from the AI corpus; the two that appear ("distortion", "multitask" in
  the agency sense) appear in *exactly one* paper (2603.28063), which imports them
  from HM1991/Baker. The literatures are terminologically disjoint.

Interpretation (`[tentative]`, pending the adversarial pass): the fields are
genuinely disconnected at the level of the *math*, not merely the eponym.

**The exception floor (the bounds the gap claim must state up front):**
- **CHAI / Berkeley (CIRL 2016, Off-Switch 2017, Zhuang–HM 2020):** reach HM1991 /
  HM1987 / Baker 2002 / Kerr 1975 only, via a control / incomplete-contracting /
  off-switch framing — **not** the congruity / multidimensional-Goodhart framing.
- **Hendrycks "Unsolved Problems in ML Safety" 2021:** cites Ridgway 1956 at the
  *genealogy/folklore* tier ("systems optimize what is measurable"), not for
  Ridgway's composite-measure math.
- **NEW, strongest exception — Wang & Huang, arXiv:2603.28063 (Mar 2026):** the
  one AI-alignment paper that *formally* bridges contract theory to Goodhart —
  instantiates HM1991, derives a "distortion index," frames a Goodhart→Campbell
  transition (existence of paper independently verified at arXiv, 2026-06-24). But
  it (a) reaches only the **same two items CHAI reached** (HM1991 + Baker 1992)
  and (b) **re-derives** the distortion geometry rather than citing Feltham–Xie /
  Banker–Datar / Baker 2002 / DKL or **any** estimation / χ²-DRO item. So even the
  field's single contract-theory→Goodhart bridge *reinvents* the math instead of
  citing the congruity/estimation tier — it **narrows but does not close** the gap.

**Refined gap claim (what survives saturation):** *the performance-measurement /
congruity prior art (Feltham–Xie, Banker–Datar, Baker 2002, DKL, Bénabou–Tirole)
and the estimation / χ²-DRO prior art (Chapman–Robbins, Ben-Tal, Namkoong–Duchi)
— which contain the actual mathematics of multidimensional Goodhart — remain
uncited by the formal-Goodhart / reward-overoptimization literature. The only
bridges reach HM1991 / Baker via a control framing (CHAI) or re-derive the
distortion geometry without citing the congruity/estimation tier (2603.28063).*
This is sharper and far harder to dismiss than "they cite nothing."

### 2. Is the delta over BBS 2023 real? — YES.

BBS ("Proxy failure," John et al., *Behavioral and Brain Sciences*) is the only
document spanning econ + AI + biology, but it stays **qualitative / conceptual**
(§4): it proposes "proxy failure" as a verbally-described unifying mechanism and
taxonomizes named phenomena across fields. It cites Baker 2002 (which carries the
distortion=cosine math) and Holmström 1979/2017 — but **does not restate them as a
proxy-vs-goal vector theorem** (no congruity condition h=c·w, no distortion=1−cosθ,
no proof) — and reaches neither Feltham–Xie nor HM1991 nor the estimation tier.
**Our delta:** carry the *formal* contract-theory + estimation math BBS only
gestures at into an explicit multidimensional proxy-vs-goal theorem, plus the
subset-invariance reading. BBS proves the *concept* travels; not the *theorem*.

### 3. Two forced scope adjustments (consequences for downstream tracks)

1. **Cite 2603.28063 and rescope the novelty.** The gap paper can no longer claim
   to be the *first* to connect contract theory to a formal Goodhart result — that
   bridge now exists (HM1991→distortion index, Mar 2026). The surviving
   contribution is the **breadth** (the congruity/sufficiency/χ²-DRO cross-field
   dictionary that 2603.28063 and CHAI both omit), the **quantified citation-gap
   audit** itself, and the **subset-invariance reading** (per the T5 verdict).
2. **State the gap as LOCALIZED with the exception floor named in the abstract**
   (CHAI + BBS + Hendrycks-Ridgway + 2603.28063), not as a totality. The seed
   audit's "localized, not total" framing is confirmed at saturation.

### 4. Caveats on this verdict (bars to clear before `[confident]`)

- **The adversarial multi-LLM exceptions hunt is now complete** (6 passes,
  synthesis below). It surfaced more bridges than the autonomous census but none
  that break the gap — they cluster in the benchmark/contract pocket (reaching
  only HM1991/Baker) and the χ²-DRO-tooling pocket (using the estimation prior art
  as machinery, not as Goodhart's prior theory). The "gap is real" interpretation
  is now `[confident]` for the χ²-DRO/HCR and cosine-congruity tiers and for the
  unanimous type-(iii) items (Reynaert–Sallee, Chetty, Feltham–Xie-as-Goodhart-
  math, Banker–Datar, DKL), `[tentative→confident]` for "the fields are
  disconnected" as a whole.
- **BBS body-PDF was not read** (Cambridge HTML/S2-null); the qualitative-not-
  formal call rests on abstract + venue + resolved reference list. A body grep for
  "theorem"/"congruity"/an explicit G,P-vector equation is flagged before coding
  the BBS-is-qualitative claim `[confident]`.
- **Several 2026 arXiv IDs in `ai-corpus.md` are unverified** (hallucination risk
  in the discovery pool) — the *freeze* phase (tasks 05/07) must verify each before
  it enters the denominator. The one load-bearing 2026 item here (2603.28063) **is**
  verified to exist.

### 5. HARD STOP

Per `plans/litrev-discovery.md`, this is the gate. **Stopping here** — no corpus
freeze (05), no coding (06), no Track A consumption — until (a) the user runs the
adversarial hunt below and the pass is synthesized, and (b) the human reviews this
verdict. Discovery (01–04 + 08) autonomous portions are complete and saturated.

---

## ADVERSARIAL MULTI-LLM EXCEPTIONS HUNT — SYNTHESIS (2026-06-28)

Six passes (ChatGPT / Claude / Gemini × optimistic / pessimistic), raw in
`exceptions-hunt/{chatgpt,claude,gemini}_{optimistic,pessimistic}.md`. Synthesis
in the T5 README format. **The spread is the signal**, not the consensus.

### Verdict (TL;DR)

All six passes converge: **the gap is real but localized; it is narrowing in two
specific 2024–2026 pockets, and is sharpest (zero genuine bridges) exactly where
the book's formal math lives.** The hunt found *more* bridges than the autonomous
census — but every one falls into a pattern that confirms, rather than breaks, the
refined claim. No pass found an alignment paper that connects the **cosine-
congruity geometry** (Feltham–Xie / Baker 2002) **or the χ²-DRO / Chapman–Robbins
estimation tier** to Goodhart *as prior theory*. The two unanimous strong results:

1. **χ²-DRO / HCR branch — zero type-(i) bridges (all six agree, sharpest result).**
   The two papers that use χ² for overoptimization *and frame it as Goodhart* are
   Laidlaw 2024 (occupancy-measure χ², arXiv:2403.03185) and χPO (Huang et al.
   2024, arXiv:2407.13399). **[PRIMARY-VERIFIED 2026-06-30 — corrects the passes:]**
   **Laidlaw is the clean type-(iii)** — full-text check finds no Hammersley /
   Chapman–Robbins / Ben-Tal / Namkoong–Duchi (only the imitation-learning lineage).
   **[LOCKED 2026-07-10 — Phase 1a re-grep:]** the COMPLETE 92-entry reference list
   (Semantic Scholar API, all letter ranges seen) contains none of: Hammersley,
   Chapman–Robbins, Ben-Tal 2013, Namkoong–Duchi, Duchi–Namkoong, Tsybakov, Csiszár,
   or any "distributionally robust"-titled paper; nearest-in-spirit cites are recent
   ML papers (χPO, Kwa "Catastrophic Goodhart", Go f-divergence). Cite it by its
   current title: **"Correlated Proxies: A New Definition and Improved Mitigation
   for Reward Hacking" (Laidlaw, Singhal, Dragan; v4 2025, ICLR 2025 spotlight)** —
   the older working title "Preventing Reward Hacking with Occupancy Measure
   Regularization" is stale. (Caveat: S2's resolver can rarely drop an unparsed
   entry; the 92-entry list was internally complete.)
   **χPO is type-(ii), NOT type-(iii):** its PDF (refs + §7 footnote) *does* cite
   **Duchi–Namkoong 2019** (the variance-regularization = χ²-DRO result), but only as
   genealogy — *"More classically, χ²-divergence is known to play a fundamental role
   in asymptotic statistics (Tsybakov, 2008; Duchi and Namkoong, 2019)"* — not as the
   prior theory of its Goodhart bound. And **χPO's bound is NOT literally the HCR
   identity**: its Lemma 5.1/F.3 is a χ²-*change-of-measure* bound (reward-error
   transfer `≲ √((1+χ²(π‖π_ref))·ε²_stat)`) — same χ² machinery as HCR, different
   inequality; the passes' (esp. Gemini's) "χPO's bound IS the HCR identity" was an
   overstatement. χPO still cites **no** Chapman–Robbins / Ben-Tal / Hammersley.
   A separate 2025–26 robust-RLHF cluster (DRO-REBEL
   arXiv:2509.19104; Robust-DPO arXiv:2502.01930; DR Token Opt. arXiv:2604.08577;
   Mandal et al. arXiv:2503.00539) *does* cite Ben-Tal/Namkoong–Duchi — but as
   **DRO machinery** for robust training, type-(ii), not as the prior mathematics
   of Goodhart. (This refines the census's "0 citers": the prior art *is* reached
   by reward-overopt papers, but only as a tool, never as Goodhart's prior theory.)

2. **Corrective-Goodhart + public-finance sufficiency — unanimous type-(iii).**
   **Reynaert–Sallee 2016, Chetty 2009, Lipsey–Lancaster 1956, Şabac–Yoo**: zero
   alignment citations, every pass, with auditable empty-search logs. Striking for
   Reynaert–Sallee, which has "Goodhart's Law" in its title.

### New bridges surfaced (the expanded exception floor)

| Bridge paper | prior art reached | pocket | type | verified |
|---|---|---|---|---|
| **Haupt et al. 2026** "Welfare, Improvability, and Variance" (arXiv:2605.30916) | HM1991, Baker 2002 | benchmark design | **(i)** Goodhart-framed multitask P-A for benchmark aggregation; derives v*=(M+rΣ)⁻¹Mw | **exists, confirmed** (title/authors via arXiv; HM1991/Baker citing-sentences from passes' body reads) |
| Haupt et al. 2026 "Optimal Aggregation Mechanisms for AI Benchmarking **and Platinum Benchmarks**" (Haupt, Reuel, Kochenderfer, Koyejo; ICLR 2026 Workshop on AI for Mechanism Design; OpenReview `Y5qABVr7uB`) | HM1991, Strathern 1997 (indirect) | benchmark design | (i) same pocket | **VERIFIED-EXISTS 2026-07-10** (author page + ICLR listing); workshop sibling of 2605.30916, same program. **Own ref list unread** (OpenReview bot-challenge) — econ cites confirmed only via the arXiv sibling (HM1991, Strathern, Baker 2002 present; Feltham–Xie absent) |
| **The Content Moderator's Dilemma: Removal of Toxic Content and Distortions to Online Discourse** (arXiv:2412.16114, 2024; Habibi, Hovy, Schwarz) | **HM1991 + Feltham–Xie 1994** (both verbatim in refs + cited together in intro) | content-moderation econ (NOT core safety) | (i)-ish — the *only* Feltham–Xie bridge found; outside the reward-hacking corpus, and **"Goodhart" does not appear anywhere in the paper** (multitask P-A framing only) | **BODY-VERIFIED 2026-07-10** (abs + full HTML + ar5iv bibliography) |
| DRO-REBEL / Robust-DPO / DR-Token-Opt / Mandal 2025–26 | Ben-Tal 2013, Namkoong–Duchi 2017, (HCR in DRO-REBEL appendix) | robust-RLHF tooling | **(ii)** — DRO machinery, not Goodhart bridge | IDs return arXiv 200; tooling role per ChatGPT/Claude |
| Hadfield-Menell & Hadfield "Incomplete Contracting and AI Alignment" (arXiv:1804.04268) | HM1991, Baker et al. 1994 | CHAI/control | (ii) — deep restatement, incomplete-contracting framing | known-lineage |
| ~~Athey et al. "AI Design: Sufficient Statistics"~~ → **Agarwal, Moehring & Wolitzky 2025, "Designing Human-AI Collaboration: A Sufficient-Statistic Approach"** (MIT WP, June 2025) | Chetty 2009 (verbatim; footnote 2 + welfare-analysis passage) | human–AI delegation (NOT Goodhart — no "Goodhart"/"proxy gaming"/"reward hacking" in text) | (ii) — sufficient-stat *method*, not reward-hacking | **RESOLVED 2026-07-10: real paper, Gemini MISATTRIBUTED** — Athey is only a cited reference (Athey–Bryan–Gans 2020) and the phantom title came from the PDF filename `AI_Design__Sufficient_Statistics.pdf`. Full PDF read. |

Plus the confirmed floor: **Wang & Huang 2026 (arXiv:2603.28063)** type-(i)
HM1991+Baker 1992 → distortion index; CHAI (control); BBS (qualitative);
Hendrycks-Ridgway (genealogy).

### Two corrections the hunt forces on the earlier census/verdict

- **The cosine-congruity geometry is still un-bridged.** Claude's close read:
  Wang & Huang's "distortion index" is a **weight ratio** D_i = w̃_i/w_i and cites
  **Baker 1992**, *not* Baker 2002's `1−cosθ`. So even the field's strongest
  contract-theory→Goodhart bridge does **not** reach the cosine/congruity geometry
  (Baker 2002, Feltham–Xie). The book's projection/cos-θ reading remains genuinely
  uncited in the safety corpus — this *sharpens* the surviving delta.
- **"0 alignment citers" → "0 type-(i) bridges; type-(ii) tooling citations exist."**
  The χ²-DRO prior art is cited by reward-overopt papers as DRO machinery. The
  defensible claim is the sharper one: *no paper recognizes HCR / χ²-DRO as the
  prior theory of the Goodhart selection bound* — and the two papers that use the
  exact χ² object for Goodhart cite none of it.

### Where the passes diverged (recorded for honesty)

- **Most willing to call tooling a "formal bridge": Gemini** (both framings) — it
  labels the DRO-tooling citations (Ben-Tal/Namkoong–Duchi in robust-RLHF) and the
  Athey sufficient-stat method as type-(i) bridges. **More careful: ChatGPT and
  Claude**, which classify the identical citations type-(ii) (machinery / different
  purpose) and give auditable empty logs for the type-(iii) items. This is the
  same Gemini-optimism signature seen in the T5 hunt; the careful reading is
  correct under the stated type-(i)/(ii) definition (connects-to-Goodhart vs
  cites-for-another-purpose).
- **Net:** the spread is over *how much credit to give χ²-DRO-as-tooling and
  benchmark-pocket bridges*, not over the headline. All six agree: cosine-congruity
  and the χ²-DRO/HCR-as-Goodhart-theory links are uncited, and Reynaert–Sallee /
  Chetty / Şabac–Yoo are type-(iii) across the board.

### Caveats

- Most new bridges are **2025–2026 preprints** (Haupt 2605.30916, Wang–Huang
  2603.28063, the robust-RLHF cluster); framing/reference lists may shift in
  revision. **[REF-LISTS PRIMARY-VERIFIED 2026-06-30:]** Wang–Huang reaches only
  **HM1991 + Baker 1992** (+ Grossman–Hart, Hart–Moore, Afriat); distortion index =
  weight ratio `w̃_i/w_i`. Haupt reaches **HM1991/1987 + Baker 2002 + Strathern**,
  Goodhart/Campbell-framed, citing Baker 2002 for effort-reallocation (not the
  1−cosθ congruity condition). **Neither cites Feltham–Xie, Banker–Datar, DKL,
  Bénabou–Tirole, or any estimation item** — cosine-congruity geometry + estimation
  tier confirmed unreached. **[Phase 1a, 2026-07-10 — the three residual
  body-verifies are DONE:** Content-Moderator Feltham–Xie bridge body-verified
  (real, both cites verbatim, not Goodhart-framed); the second Haupt paper
  verified-exists (workshop sibling of 2605.30916; own ref list unreadable behind
  OpenReview bot-challenge — the one remaining indirect link); the "Athey/Chetty"
  item resolved as a real Agarwal–Moehring–Wolitzky paper Gemini misattributed,
  type-(ii), no Goodhart content. See the updated table rows above.**]
- **χPO ≠ HCR-identity (corrected 2026-06-30).** The Claude/Gemini "χPO's bound IS
  the HCR variational identity, uncited" near-miss was **overstated**: χPO's Lemma
  5.1 is a χ²-change-of-measure bound (different inequality, same family), and χPO
  *does* cite Duchi–Namkoong 2019 as a genealogy footnote. The clean
  "reinvented-uncited" example is **Laidlaw 2024** (verified type-iii), not χPO.

### Consequence for the contribution (updated)

The hunt **tightens** the surviving delta rather than eroding it. The gap paper's
defensible contribution is now: (a) the **quantified, reproducible citation-gap
audit**; (b) the **cross-field dictionary / breadth** (congruity ⇄ sufficiency ⇄
χ²-DRO ⇄ corrective-Goodhart), which no bridge paper assembles — the benchmark
pocket reaches only HM1991/Baker, the robust-RLHF pocket only χ²-DRO-as-tooling;
(c) the **specific uncited identities** the field reinvented — χ²-occupancy =
HCR/χ²-DRO (Laidlaw/χPO), and the cosine-congruity geometry (Baker 2002 /
Feltham–Xie) still unreached; (d) the **subset-invariance reading** (per T5). It is
**no longer** "first to bridge contract theory to formal Goodhart" (Wang–Huang and
Haupt 2026 hold that), and the abstract must name the expanded exception floor.

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
