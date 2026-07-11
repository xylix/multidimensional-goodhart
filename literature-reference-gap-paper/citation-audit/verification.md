# Task 07 — Independent verification of the coded table (data annex)

Status: **COMPLETE 2026-07-11.** Scope per the right-sized task brief: (A) second-source
every recorded hit cell; (B) PDF-grep the big-bibliography absences + a ~12-paper
absence sample across clusters; (C) settle the four named open items (A9, D3, B12/C28,
G2). This is NOT the spec's full independent re-code of every cell; absence cells outside
(B) carry their task-06 confidence unchanged.

Convention throughout: **bibliographic facts** (paper P's version v cites/does not cite
work Q — checkable against the named artifact) are stated plainly; **interpretation**
is confined to §6 and tagged.

## 1. Protocol actually used

- **PDF second pass:** downloaded 68 arXiv PDFs (all hit rows, all big-list absences,
  the sample, the open items) to the session scratchpad; `pdftotext`; grepped for the
  full tier-surname list *and* for title-based patterns of every anchor work
  ("multitask principal", "distortion and risk", "congruity", "monetary management",
  "improving ratings", "folly of rewarding", "dysfunctional consequences",
  "variance-based regularization", "uncertain probabilities", "hammersley",
  "chapman.robbins", "cram[eé]r", etc.). Title patterns catch entries whose author
  field is garbled.
- **Normalization pass:** all texts re-grepped after collapsing letter-spaced small
  caps ("S HAVELL" → "SHAVELL") and stripping diacritic artifacts ("Holmstr¨om").
  Motivated by A7, whose NeurIPS-style small-caps bibliography evades plain surname
  greps. The normalized re-grep changed **no** absence conclusion.
- **API second pass:** for papers first-coded from arXiv HTML/ar5iv/PDF, fresh
  Semantic Scholar `references` + OpenAlex `referenced_works` queries (2026-07-11),
  each sanity-checked for identity (title match) and for at least one independently
  expected reference before use (guard against the task-06 wrong-list bug).
- **Version audit:** where a first-pass hit failed to appear in the current PDF, all
  arXiv versions were bisected and the **published venue version** fetched
  (NeurIPS 2016 proceedings PDF for CIRL; IJCAI 2017 proceedings PDF for Off-Switch;
  PMLR v119 PDF for Miller et al.).
- **Truncation guard:** one pdftotext run (F15) silently truncated before the
  bibliography; caught because the claimed hit was absent, refuted by per-page
  re-extraction. Every *negative* below was taken only from a text whose reference
  section was verified present.

**Coding convention adopted for version-variant citations** (proposal — flagged for
lead ratification, see §6): a cell reflects the **current arXiv version** (what the
frozen ID resolves to), which for every disputed paper here coincides with the
published venue version; hits present only in a superseded preprint are recorded as
explicit version annotations, not silently counted or dropped.

## 2. Resolution of the four named open items

### 2.1 A9 (arXiv:2603.15017) — new exception-floor candidate: CONFIRMED, typed genealogy-nod

- **Identity (arXiv API + PDF v3, 2026-04-24):** "Consequentialist Objectives and
  Catastrophe", Henrik Marklund, Alex Infanger, Benjamin Van Roy (Stanford); v1
  2026-03-16. Preprint (no venue on PDF).
- **HM1991 citation: confirmed in the v3 PDF** (two methods: task-06 S2 list; task-07
  PDF). Reference string: "Bengt Holmstrom and Paul Milgrom. Multitask
  principal–agent analyses: Incentive contracts, asset ownership, and job design.
  …" Cited **once**, in a dedicated related-work paragraph. Verbatim citing passage
  (PDF v3, §7 related work):
  > "**Economic principal–agent models.** The problem of specifying reward functions
  > in AI is closely related to the principal–agent problem in economics
  > [Hadfield-Menell and Hadfield, 2019], where a principal designs incentives for an
  > agent whose actions are imperfectly observable [Holmstrom and Milgrom, 1991,
  > Laffont and Martimort, 2001]. These models highlight how optimizing measurable
  > proxies can lead agents to pursue outcomes that diverge from the principal's true
  > objectives."
- **Type: genealogy/related-work nod** (analogous to χPO's type-ii): the multitask
  model's math is not used anywhere in the paper's results; HM1991 is bundled with a
  textbook (Laffont–Martimort) as "the economics analogue". NOT a substantive import
  like I1/I2. Strathern ✓ also confirmed in PDF (ref + Goodhart-related-work cite).
- **Action:** appended to `bridges.md` §2 as entry G (genealogy-tier exception);
  audit.md cell annotated "genealogy nod".

### 2.2 D3 (arXiv:1611.08219, Off-Switch Game) — HM1991 REFUTED; Baker 2002 v1-only

Bibliographic facts (all four artifacts read):
- **v1 (2016-11-24) PDF:** cites Baker 2002 ("Distortion and risk in optimal incentive
  contracts. Journal of Human Resources"), Gibbons 1998, Kerr 1975, **and Tirole 2009**
  ⟦09 correction: Tirole is in v1's list and body — the record did NOT add it; the only
  v1→record cuts were Baker 2002 + Dewey 2011; `why-the-gap.md` M4 case D3⟧. **No
  Holmström–Milgrom (any year).**
- **v2 and v3 (2017-06-16) PDFs:** Baker 2002 **removed**; Gibbons 1998, Kerr 1975,
  Tirole 2009 ("Cognition and incomplete contracts", AER) present. No HM.
- **IJCAI 2017 proceedings PDF (version of record, ijcai.org/proceedings/2017/0032):**
  identical contract-tier refs to v3 — Kerr, Gibbons, Tirole. **No Baker, no HM.**
  Citing sentence: "…cause the agent to act in the principal's interest [Kerr, 1975;
  Gibbons, 1998]" and "…directly analogous to the assumption of incompleteness
  studied in theories of optimal contracting [Tirole, 2009]".
- **Verdict:** the seed-pass/OpenAlex claim "Off-Switch cites HM1991" is **wrong in
  every version** — an indexing/merge artifact. "Off-Switch cites Baker 2002" is true
  **only of the v1 preprint** (Nov 2016–Jun 2017 window), not of the published paper.
- **Row updated:** CONTRACT ✓ retained via **Gibbons 1998** (scheme-listed);
  Baker 2002 demoted to v1-only annotation; HM1991 removed. Kerr (MGMT) ✓ all
  versions. Tier paper-count unchanged.

### 2.3 B12 + C28 — full redo from actual reference lists: first-pass rows CONFIRMED

- **B12 (2204.06601, Tien et al., "Causal Confusion and Reward Misidentification…"):**
  (i) PDF grepped on the full surname + title-pattern list: **zero tier hits** (row
  all-absent). (ii) Fresh S2 query 2026-07-11 now returns a 38-entry list that is
  B12's own (identity-checked: preference/imitation-learning titles incl. Christiano
  2017, B-Pref, "Causal Confusion in Imitation Learning" — no longer B11's
  18-entry list): **zero tier hits**. Row confirmed by three sources (ar5iv task-06,
  PDF, fresh S2).
- **C28 (2510.03231, Gehrmann, "Reward Models are Metrics in a Trench Coat"):**
  (i) PDF: Goodhart 1984 ✓ ("Charles AE Goodhart. Problems of monetary management:
  the uk experience. In Monetary theory and practice: The UK experience, pp. 91–121.
  Springer, 1984."); every other tier absent — the Kerr/Baker/Lambert/Montgomery
  surname hits are Jamie Kerr (Anthropic author lists), Bowen Baker, Nathan Lambert
  (collisions). (ii) Fresh S2 query returns a 160-entry list (matches ar5iv ~161),
  identity-checked, containing Goodhart 1984 ✓ and no other tier item. Row confirmed
  by three sources.

### 2.4 G2 (arXiv:1908.03156) — label errata RESOLVED: relabel, no swap

- **arXiv API fact:** 1908.03156 = **"Optimal multiclass overfitting by sequence
  reconstruction from Hamming queries" — Jayadev Acharya, Ananda Theertha Suresh,
  2019.** The Ladder (Blum–Hardt) is arXiv:1502.04585 and is **not** in the frozen N.
- **Decision applied (ID governs per freeze conventions):** G2 relabeled to the
  Acharya–Suresh paper in `audit.md` + `corpus.md`; still rule-3 in-scope
  (test-set-overfitting / ADA). The Ladder remains outside N — swapping it in would
  unfreeze the corpus; recorded as a known non-member.
- **Coding re-checked against the correct paper's PDF:** zero matches on the full
  surname/title pattern set → all-absent row stands.

## 3. Hit-cell verification table (every recorded hit; two methods per cell)

Methods legend: S2₆ = task-06 Semantic Scholar list; H₆ = task-06 arXiv-HTML/ar5iv;
P₆ = task-06 pdftotext; PDF₇ = task-07 pdftotext (this pass); S2₇/OA₇ = fresh API
2026-07-11; PUB = published venue PDF. Confidence: **2M** = two independent methods
agree; **2X** = two independent extractions of the same method class (API dead);
**FLAG** = see note.

| id | cell | verbatim (task-07 artifact) | methods | conf |
|---|---|---|---|---|
| A1 | MGMT Campbell | "[6] Donald T. Campbell 'Assessing the impact of planned social change'… 1979" (+ ref [3] Rodamar 2018 "There ought to be a law! Campbell v. Goodhart", newly annotated) | S2₆(seed)+PDF₇ | 2M |
| A1 | Goodhart | "[1] Charles E. Goodhart Problems of Monetary Management: The U.K. Experience **1975**. Papers in Monetary Economics. Reserve Bank of Australia." | S2₆+PDF₇ | 2M |
| A2 | Goodhart | "Goodhart, C. A. (**1975**). Problems of monetary management… Reserve Bank of Australia." | S2₆+PDF₇ | 2M |
| A3 | Goodhart | "…In C. A. E. Goodhart (ed.), Monetary Theory and Practice… Macmillan, **1984**" | S2₆+PDF₇ | 2M |
| A4 | MGMT Campbell+Strathern; Lucas; Goodhart(**1975**) | Campbell 1979, Strathern [Str97], "Robert E Lucas Jr. Econometric policy evaluation: A critique", Goodhart "…in papers in monetary economics… 1975" | S2₆(seed)+PDF₇ | 2M |
| A5 | MGMT Strathern+Hoskin; Lucas; Goodhart(**1975**) | [Str97]; [Hos96] "The 'Awful Idea of Accountability'"; [Luc76]; [Goo75] "Charles Goodhart. **Monetary relationships: A view from Threadneedle Street.** Papers in monetary economics 1975" (the original 1975 title) | S2₆(seed)+PDF₇ | 2M |
| A6 | MGMT Strathern | "Strathern, M. (1997). 'improving ratings'…" | S2₆(seed)+PDF₇ | 2M |
| A7 | CONTRACT △ transaction-cost; MGMT Kerr | Kerr [21]; Klein–Crawford–Alchian 1978 [22]; Shavell 1980 [30]; Hadfield-Menell–Hadfield [17] (small-caps normalization needed) | S2₆(seed)+PDF₇ | 2M |
| A8 | MGMT Strathern; Goodhart(1984) | [65] Strathern; [7] Goodhart 1984 Macmillan | S2₆+PDF₇ | 2M |
| A9 | CONTRACT HM1991 (genealogy nod); MGMT Strathern | see §2.1 | S2₆+PDF₇ | 2M |
| A10 | Goodhart(1984) | "[28] Charles AE Goodhart… Springer, 1984." | H₆+PDF₇+S2₇ | 2M |
| A13 | MGMT Campbell+Rodamar (+Strathern, newly annotated); Goodhart(1984) | Campbell 1979; Rodamar 2018; Strathern 1997 ref present; Goodhart 1984 (Monetary Theory and Practice, 91–121) | S2₆(seed)+PDF₇ | 2M |
| A14 | MGMT Campbell; Goodhart(**1975**) | Campbell 1979; "Goodhart… Papers in Monetary Economics; Reserve Bank of Australia: Sydney, 1975." | S2₆+PDF₇ | 2M |
| A15 | MGMT Strathern | "Strathern, M. 1997…" (Marshini-Chetty collision re-confirmed rejected; also cites Goodhart **2015** Encyclopedia entry — outside the 1975/1984 eponym definition, noted) | S2₆+PDF₇ | 2M |
| B1 | ESTIM ~ GMM/IV; Goodhart(1984) | body: "primary motivations for the generalized method of moments in econometrics [68,123,69]… instrumental variables"; Hansen 1982 ref; "Charles AE Goodhart… Springer, 1984" | S2₆(seed)+PDF₇ | 2M |
| B3 | ESTIM ~ (type-iii); Goodhart(1984) | Goodhart 1984 Macmillan ✓; **no** D–N/Tsybakov/HCR ref (type-iii re-confirmed) | S2₆(seed)+PDF₇ | 2M |
| B14 | Goodhart(**1975**) | "[62] Charles Goodhart. **1975.** Problems of Monetary Management…" (task-06 said 1984 — corrected) | S2₆+PDF₇ | 2M |
| B16 | Goodhart(1984) | "Charles AE Goodhart. 1984. Problems of monetary management… Papers in monetary economics, 1:91–121." (hybrid string; stated year 1984) | S2₆+PDF₇ | 2M |
| B19 | Goodhart(**1975**) | "Charles Goodhart. 1975. Problems of monetary management… Monetary Economics, 1." | H₆+PDF₇+S2₇ | 2M |
| C1 | MGMT Campbell (+Hoskin, newly annotated); Goodhart(**1975**) | "Donald T Campbell. Reforms as experiments. Am. Psych. 1969"; "Keith Hoskin. The 'awful idea of accountability'…" (body: "first introduced in Hoskin [1996]"); Goodhart "…in papers in monetary economics… **1975**" (task-06 said 1984 — corrected) | S2₆(seed)+PDF₇ | 2M |
| C5 | Goodhart(1984) | "Charles AE Goodhart and CAE Goodhart… Springer, 1984" | S2₆(seed)+PDF₇ | 2M |
| C6 | MGMT Strathern | "[27] Marilyn Strathern. Improving ratings…" (Namkoong-as-Wortsman-coauthor collision re-confirmed rejected) | S2₆+PDF₇ | 2M |
| C11 | Goodhart(1984) | "Charles AE Goodhart. 1984… Springer." | S2₆+PDF₇ | 2M |
| C15 | Goodhart(1984) | "Charles AE Goodhart and CAE Goodhart… Springer, 1984." | P₆+PDF₇ (S2₇/OA₇ = 0 refs) | 2X |
| C20 | MGMT Strathern | "Marilyn Strathern. 1997. 'improving ratings'…" | S2₆+PDF₇ | 2M |
| C26 | Goodhart(1984) | "C. A. E. Goodhart… pages 91–121. Macmillan… 1984." | S2₆+PDF₇ | 2M |
| C27 | Goodhart(1984) | same Macmillan 1984 string | S2₆+PDF₇ | 2M |
| C28 | Goodhart(1984) | see §2.3 | H₆+PDF₇+S2₇ | 2M |
| C31 | ESTIM ✓ D–N 2019 + Tsybakov (genealogy, type-ii) | "John Duchi and Hongseok Namkoong. Variance-based regularization…JMLR"; "Alexandre B Tsybakov. Introduction to Nonparametric Estimation. Springer, 2008."; footnote: "More classically, χ²-divergence is known to play a fundamental role in asymptotic statistics (Tsybakov, 2008; Duchi and Namkoong, 2019)" | H₆+PDF₇ (S2₇/OA₇ = 0) | 2X |
| C32 | ESTIM ✓ D–N + Rockafellar–Wets (tooling) | D–N 2021 ("uniform performance"), D(–G)–N ("Statistics of robust optimization"), N–D 2017 ("Variance-based…"), "[RWW09] R.T. Rockafellar, M. Wets, R.J.B. Wets. Variational Analysis" | H₆+PDF₇ (S2₇/OA₇ = 0) | 2X |
| C33 | ESTIM ✓ D–N cluster (tooling) | D–N 2021 Annals; N–D 2016 ("Stochastic gradient methods…"); Levy–Carmon–Duchi–Sidford 2020 | S2₆+PDF₇ | 2M |
| C34 | ESTIM ✓ D–N cluster (tooling) | Duchi–Glynn–Namkoong; N–D 2017 (body: "instantiate (6) with the Pearson χ²-divergence Namkoong and Duchi [2017]") | S2₆+PDF₇ | 2M |
| C35 | ESTIM ✓ Ben-Tal 2013 + Sinha–N–D (tooling) | "Aharon Ben-Tal, Dick Den Hertog, … 'Robust solutions of optimization problems affected by uncertain probabilities'. Management Science 59.2 (2013)"; Sinha–Namkoong–Volpi–Duchi; Levy et al. | S2₆+PDF₇ | 2M |
| D1 | ESTIM ~ Rockafellar–Uryasev CVaR | "Rockafellar, R Tyrrell and Uryasev, Stanislav. Optimization of conditional value-at-risk…" | S2₆(seed)+PDF₇ | 2M |
| D2 | CONTRACT ✓ Gibbons98; **HM1991+HM1987 v1-preprint-only**; MGMT Kerr | v1 PDF: "Holmstrom, B and Milgrom, P. Aggregation and linearity… 1987" + "Multitask principal-agent analyses…" + body "Holmstrom & Milgrom (1991) develop a multi-task model"; **NeurIPS 2016 proceedings PDF, v3 and v4: Gibbons + Kerr only, no HM** | S2₆+PDF₇(v1,v3,v4)+PUB | 2M, version-annotated |
| D3 | CONTRACT ✓ Gibbons98; **Baker 2002 v1-only; HM1991 refuted**; MGMT Kerr | see §2.2 | S2₆+PDF₇(v1,v2,v3)+PUB | 2M, version-annotated |
| F3 | CONTRACT ✓ HM1991 + Grossman–Hart; **MGMT Strathern v1-only** | v3+PMLR: body "This complementarity (Holmstrom and Milgrom, 1991)…" + refs HM1991, "Grossman, Hart. An analysis of the principal-agent problem" ; Strathern in v1 only (body+ref), absent v3+PMLR | S2₆+PDF₇(v1,v3)+PUB(PMLR v119) | 2M, version-annotated |
| F4 | Lucas | "Robert E Lucas Jr. Econometric policy evaluation: A critique…" (Hennessy–Goodhart 2020 also present — correctly not eponym-coded) | S2₆+PDF₇ | 2M |
| F5 | **PUBFIN Chetty v1-only**; ESTIM ~ Rockafellar | v1: "Raj Chetty. Sufficient statistics for welfare analysis…" + body "method… motivated by prior works [Chetty, 2009, Wager and Xu, 2021]"; **absent from v2 (2022-12-26) through v5**; "R Tyrrell Rockafellar. Convex analysis, volume 18. Princeton UP, 1970" present v2–v5 ⟦09 correction: ADDED in v2, absent from v1's complete bibliography — same revision that dropped Chetty; `why-the-gap.md` M4 case F5⟧ (author named in PDF — task-06 "authorless, inferred" upgraded) | S2₆+PDF₇(v1,v2,v3,v5) | 2M, version-annotated |
| F6 | MGMT Campbell | "Donald T Campbell. Assessing the impact of planned social change" + body "Campbell's law (Campbell, 1979)" | S2₆+PDF₇ | 2M |
| F13 | CONTRACT ✓ Holmström 1979+1980 (ctl) | "[37] Holmström, B. Moral hazard and observability. Bell J. Econ 1979"; "[38] Holmström, B. On the theory of delegation. 1980"; body: "principal-agent problems more broadly [37, 38]" | H₆+PDF₇+S2₇(1979 ✓; 1980 not in S2's 81) | 2M |
| F15 | CONTRACT ✓ Feltham–Xie 1994 + HM1991 (pm) | v3 refs (page-range extraction): "Feltham, G. A. and **J.** Xie (1994). Performance measure congruity and diversity in multi-task…"; "Holmstrom, B. and P. Milgrom (1991). Multitask principal–agent analyses… JLEO 7 (special issue), 24–52."; v1 body: "The economic theory of multitask models (Holmstrom and Milgrom, 1991; Feltham and Xie, 1994) predicts…" | H₆+PDF₇(v1+v3) (S2₇ 0 refs, OA₇ 404) | 2M (two artifact classes; API dead) |
| G5 | MGMT Strathern; Goodhart(1984) | "[44] M. Strathern…"; "[17] C. A. Goodhart… Springer, 1984" | S2₆+PDF₇ | 2M |
| G6 | MGMT Strathern | "Marilyn Strathern… European Review, 5(3):305–321, July" | S2₆+PDF₇ | 2M |
| H5 | ESTIM ✓ Ben-Tal 2009 + D–G–N 2021 (tooling); Goodhart(1984) | "[70] Aharon Ben-Tal, Laurent El Ghaoui, Arkadi Nemirovski. 2009. Robust optimization… Princeton"; "[210] John C Duchi, Peter W Glynn, Hongseok Namkoong. 2021. Statistics of robust optimization… Math. OR"; "[279] …Goodhart. 1984…" | P₆+PDF₇ (S2₇/OA₇ = 0) | 2X |
| H6 | MGMT Ridgway + Strathern; Goodhart(1984) | "V. Ridgway. 'Dysfunctional Consequences of Performance Measurements'. ASQ"; Strathern 1997; Goodhart 1984 (Brickman–Campbell hedonic collision re-confirmed rejected) | S2₆+PDF₇ | 2M |
| I1 | CONTRACT ✓ HM1991 + Baker 1992 (pm) + Grossman–Hart 1986 + Hart–Moore 1990 (ctl) | "Holmström, B., & Milgrom, P. (1991). Multitask Principal-Agent Analyses…"; "Baker, G. P. (1992). Incentive Contracts and Performance Measurement. JPE"; "Grossman, S. J., & Hart, O. D. (1986). The Costs and Benefits of Ownership. JPE"; "Hart, O., & Moore, J. (1990). Property Rights and the Nature of the Firm. JPE" | H₆+PDF₇+S2₇(HM1991, Hart–Moore in S2's partial 13)+June-30 primary read | 2M |
| I2 | CONTRACT ✓ HM1987 + HM1991 + Baker 2002 (pm); MGMT Strathern | "[22] …Aggregation and linearity…"; "[23] …Multitask principal–agent analyses…"; "[3] George P. Baker. Distortion and risk in optimal incentive contracts. JHR"; "[57] Marilyn Strathern…" | H₆+PDF₇+S2₇(HM1987, HM1991, Strathern)+June-30 primary read | 2M |

Every hit cell above is therefore either 2M or 2X; no hit rests on a single retrieval.
The 2X cells (C15, C31, C32, H5 — S2 and OpenAlex both index zero references for these
papers) rest on two independent text extractions of the same arXiv artifact class and
are flagged as such, not silently promoted.

## 4. Absence verification (big lists + sample)

PDF-grep on the full surname list (holmstrom/holmström, milgrom, baker, feltham, xie,
datar, kulp, lambert, budde, schnedler, chetty, feldstein, lipsey, lancaster, reynaert,
sallee, baumol, montgomery, ridgway, kerr, campbell, strathern, prendergast, gibbons,
lucas, chapman, robbins, cramer/cramér, ben-tal, duchi, namkoong, rockafellar) + the
title patterns of §1, on normalized text, bibliography-presence verified per file.
Every surname hit disambiguated by author+venue; collisions listed.

| id | paper | result | collisions rejected (author+venue checked) |
|---|---|---|---|
| B1 | 1606.06565 Amodei (~150 refs) | clean of all tiers except coded ~GMM/IV + Goodhart 1984 | Janet M. Baker (WSJ speech corpus); "Conditional value-at-risk" arXiv:1404.3862 (not Rockafellar) |
| B4 | 1811.07871 Leike (~165 refs) | **all-absent confirmed** | Lucas Baker (DeepMind, AlphaGo); "Chapman and Hall" (publisher) |
| B14 | 2303.09387 (206 refs) | only Goodhart **1975** | Shelby Grossman (author list); ML Xies; Casper Hansen |
| B18 | 2412.07177 thesis (~300 refs) | all-absent confirmed | Bowen Baker; Lucas Baker; S.M. Xie |
| B22 | 2604.13602 Wang survey | all-absent confirmed (incl. **no Goodhart 1975/1984 ref**; body uses the term, cites Karwowski) | Jamie Kerr (Anthropic); Bowen Baker; N./M. Lambert; ML Xies |
| C24 | 2307.15217 Casper (227 refs) | all-absent on enumerated tiers; **cites Hoskin 1996** (not scheme-listed; annotation added, cell unchanged) | Jamie Kerr; Campbell-Gillingham; Nathan Lambert; Bowen Baker |
| E2 | 2209.00626 Ngo (208 refs) | all-absent confirmed (no Goodhart 75/84 ref; body term cites M–G) | Bowen Baker; Shelby Grossman; Mike Lambert; ML Xies |
| H1 | 2504.12328 Zhong survey | all-absent confirmed (no "Goodhart" anywhere — seed re-confirmed) | Kyle Montgomery (author list ≠ Montgomery 1972); Russell Campbell; Jamie Kerr; Bowen Baker; N. Lambert |
| H2 | 2312.14925 Kaufmann survey | all-absent confirmed (no "Goodhart" anywhere — closes seed caveat "S2 empty, not a line dump": PDF now line-verified) | Bowen Baker; Bakker; Campbell-Gillingham; Jamie Kerr; N. Lambert; ML Xies |
| H7 | 2505.02666 (181 refs) | all-absent confirmed | Bowen Baker (Lightman et al.); ML Xies |
| H8 | 2506.15421 (78 refs) | all-absent confirmed | **Lai–Robbins 1985** (bandits, ≠ Chapman–Robbins) — seed rejection re-confirmed |
| A11 | 2602.13934 | all-absent confirmed (body "Goodhart" cites M–G/EH/Karwowski, no eponym ref) | Bowen Baker |
| B2 | 2201.03544 Pan | all-absent confirmed (seed "Baker trap" re-confirmed: Bowen Baker et al. 2020) | Bowen Baker |
| B7 | 1907.00452 | all-absent confirmed | — |
| B12 | 2204.06601 | see §2.3 | — |
| B20 | 2308.15605 | all-absent confirmed | Lucas Baker (AlphaGo) |
| C4 | 2312.09244 Eisenstein | all-absent confirmed | Lucas Gonzalez (author list) |
| C13 | 2502.18770 | all-absent confirmed (body "Goodhart's Law" cites Weng blog, no eponym ref) | ML Xies |
| C17 | 2603.06797 | all-absent confirmed (body "Goodhart" term only) | T. Xie |
| D8 | 2312.08358 | all-absent confirmed | Jamie Kerr; Nicolas S. Lambert (economist, Econometrica — ≠ accounting Lambert; task-06 rejection re-confirmed); Lucas Maystre |
| E1 | 1906.01820 | all-absent confirmed (body "adversarial Goodhart" cites M–G [23], no eponym ref) | — |
| F9 | 2310.16608 | all-absent confirmed | Yang Xie |
| G2 | 1908.03156 | see §2.4 | — |
| G3 | 2102.13189 | all-absent confirmed | — |

Zero occurrences, in **any** of the 68 grepped texts, of: Feldstein, Lipsey, Lancaster
(2BEST sense), Reynaert, Sallee, Baumol, Montgomery 1972, Datar, Kulp, Budde,
Schnedler, Prendergast, Hammersley, Chapman–Robbins, Cramér–Rao. (Bibliographic fact
for these 68; the all-115 claim inherits task-06 coverage for unsampled rows.)

## 5. Corrections applied to audit.md (complete list)

1. **D3 row:** HM1991 removed (refuted, §2.2); Baker 2002 → v1-only annotation;
   CONTRACT ✓ now carried by Gibbons 1998. Task-06 caveat resolved.
2. **D2 row:** HM1991 + HM1987 → v1-preprint-only annotation (absent from NeurIPS 2016
   version of record and current v4); CONTRACT ✓ carried by Gibbons 1998.
3. **F5 row:** PUBFIN Chetty → v1-only annotation (dropped in v2, 2022-12-26);
   **PUBFIN current-version total 1 → 0** (headline changed, flagged in totals).
   Rockafellar ~ upgraded from "inferred" to author-named (still ~, role: convex-analysis
   tooling in proofs).
4. **F3 row:** MGMT Strathern → v1-only annotation (absent from PMLR/ICML version of
   record and v3); **MGMT paper-total 21 → 20 current-version** (offset in the
   Strathern name-count by A13's newly-annotated Strathern — see 6).
5. **G2:** relabeled (§2.4), in table + corpus.md.
6. **Annotation additions (cell values unchanged):** A1 MGMT + Rodamar 2018; A13 MGMT
   + Strathern 1997; C1 MGMT + Hoskin 1996; C24 note (Hoskin 1996 cited; not
   scheme-listed, cell stays —); A15 note (cites Goodhart 2015 Encyclopedia entry,
   outside the 1975/1984 eponym tier).
7. **Goodhart eponym year split corrected:** "(23× 1984, 1× 1975)" → **16× 1984,
   8× 1975** (1975-string papers: A1, A2, A4, A5, A14, B14, B19, C1; A5 cites the
   original title "Monetary relationships: a view from Threadneedle Street"). Count
   of 24 papers unchanged. (Task-06/seed had B14, C1 as 1984 and left A1/A2/A4/A5/A14
   unsplit.)
8. **Reverse-sweep table + seed R1/R2 rows annotated:** CIRL-cites-HM1991 is
   v1-preprint-only; Off-Switch-cites-HM1991 refuted; Off-Switch-cites-Baker-2002
   v1-preprint-only. (bridges.md §2-A correspondingly corrected, dated.)
9. **Totals block rewritten** where affected (CONTRACT item-level counts, PUBFIN,
   MGMT, eponym split); headline CONTRACT paper-counts (8 ✓ + 1 △; B+C core 0/60)
   unchanged.

## 6. Interpretation (tagged, kept separate from the facts above)

- `[confident]` The four headline structural numbers survive verification:
  **CONTRACT 8 ✓ + 1 △ of 115 with 0/60 in the B+C core; 2BEST 0; CORRECT 0; ESTIM
  never cited as prior theory of a Goodhart bound.** No verified correction moves any
  paper across the hit/absent line for CONTRACT, and both S2 wrong-list rows were
  re-confirmed all-absent (B12) / eponym-only (C28) from their true lists.
- `[confident]` **PUBFIN drops to 0 of 115 on current versions** (was 1): the single
  Chetty citation lived only in F5's first preprint revision (Apr–Dec 2022).
- `[tentative]` **New finding — the CHAI exception floor is version-fragile:** every
  contract-tier citation beyond Kerr/Gibbons in the CHAI lineage (CIRL's HM1987+HM1991,
  Off-Switch's Baker 2002) existed only in first arXiv preprints and was dropped by the
  version of record. The famous "CIRL cites Holmström–Milgrom" bridge is a preprint
  artifact that the published paper walked back to Kerr+Gibbons. This *narrows* the
  documented exception floor and is consistent with the gap thesis, but it cuts both
  ways: reference lists in this corpus are revision-unstable, so single-version
  coding (including ours) has an inherent error bar. Flagged because the correction is
  rhetorically convenient for the project's thesis — the underlying facts are
  four-artifact-verified (v1, intermediate, latest, published PDFs read directly).
- `[tentative]` A9 is a genuine new floor entry but at the **genealogy tier** — a 2026
  formal-Goodhart paper that name-checks HM1991 in related work without using the
  multitask math. The pm-branch *substantive* bridges remain exactly I1, I2, F15 (+F3
  body-use of HM1991 complementarity).
- Convention flag for the lead: cells now follow **current-arXiv-version = version of
  record** (they coincide for all disputed papers). If the lead prefers
  any-version-ever coding, PUBFIN reverts to 1 and D2/D3 regain HM/Baker — the
  annotations carry both readings; the published prose must pick one and say so.

## 7. Unresolved / out of scope

- **A12, I3** remain n/a (access-limited; unchanged from task 06 — not in this task's
  scope to crack).
- **D3 v2 vs v1 exact diff date** — v2 not date-stamped in this pass (v2 PDF read:
  Baker already absent). Immaterial to any claim.
- Absence rows outside §4's sample keep task-06 single-pass confidence (per the
  right-sized scope); the protocol above (normalized PDF grep + title patterns) is
  ready to extend if the lead wants full coverage before publication.
- S2's reference endpoint served correct lists for B12/C28 on 2026-07-11 (wrong lists
  on 2026-07-10). Transient upstream bug; worth re-checking any future S2-only coding.
