# Citation audit — methods, corpus, and master coded table

Status: **task 06 complete, 2026-07-10** — full frozen corpus (N=117, `corpus.md`)
coded via 13 parallel agents under `../audit-tasks/coding-protocol.md`; raw batch
outputs with verbatim hit strings and retrieval notes in `coding-batches.md`.
The master N=117 table and updated totals are in §Master coded table (full
corpus) below. The June 24 seed pass (25 papers) is retained beneath it as
historical data; its codes carry over unchanged (scheme identical).
Interpretation lives in `findings.md`; this file is the data. Independent
double-verification = task 07 (not yet run).

## Thesis under test

The AI-safety formalizations of Goodhart's law / reward hacking / reward
overoptimization do **not** cite the economics / management-science / accounting
prior art that contains the same formal mathematics.

## Data sources & method

- **Reference lists:** Semantic Scholar Graph API (`/paper/arXiv:<id>/references`)
  as primary; arXiv HTML/PDF, OpenReview, and published-PDF `pdftotext` as
  fallback. Per-paper access method and completeness recorded below.
- **Reverse forward-citation counts:** OpenAlex Graph API `cites:` filter +
  `group_by=primary_topic.field.id` (Semantic Scholar citations endpoint was
  rate-limited; OpenAlex substituted, equally auditable). CS-tagged citers were
  hand-inspected by title because OpenAlex's "Computer Science" tag is broad.
- **Corpus inclusion rule:** arXiv/peer-reviewed papers that state or formalize a
  proxy-vs-true-objective divergence result (or survey same), 2016–2026, reached
  by forward-citation expansion of Amodei 2016 / Manheim–Garrabrant 2018 / Skalse
  2022 / the reward-overoptimization cluster. 25 minable papers + 1 blog post.

## Coding scheme (prior-art tiers)

- **CONTRACT** — multitask principal-agent / contract theory / accounting
  congruity: Holmström–Milgrom 1991, Holmström 1979/2017, Baker 1992/2002,
  Feltham–Xie 1994, Datar–Kulp–Lambert 2001, Budde 2007, Schnedler, Hart–Moore,
  Prendergast 1999, Gibbons 1998.
- **PUBFIN** — public finance: Chetty 2009 (sufficient statistics), Feldstein 1999.
- **2BEST** — Lipsey–Lancaster 1956 (theory of the second best).
- **CORRECT** — corrective-tax / environmental: Reynaert–Sallee 2016, Baumol–Oates,
  Montgomery 1972.
- **MGMT** — management / social-measurement: Ridgway 1956, Kerr 1975, Campbell
  (any year), Strathern 1997.
- **ESTIM** — estimation theory / DRO / convex analysis: Hammersley–Chapman–Robbins,
  Cramér–Rao, Ben-Tal 2013, Duchi–Namkoong, Rockafellar (DRO sense).
- **GENEAL** — economics genealogy: Lucas 1976; and Goodhart's own 1975/1984 note
  (eponym-only, tracked separately).

### Name-collision rules applied (to prevent false positives)

- "Baker et al. 2020 / B. Baker" = **Bowen Baker / OpenAI**, not George Baker the
  economist → NOT CONTRACT. (Confirmed trap in Pan 2022, Rafailov, Zhong.)
- "Lambert" in ML = Nathan Lambert (RewardBench) ≠ accounting Lambert (DKL).
- "Xie" in ML ≠ Feltham–Xie's Xie. "Campbell-Gillingham" (DeepMind) ≠ Donald Campbell.
- Campbell 1969 "Reforms as experiments" (Am. Psychologist) = Donald Campbell → MGMT.
- BBS-bridge premise correction: its "Chetty" = Marshini Chetty (privacy/HCI), **not**
  Raj Chetty; and there is **no Lipsey reference at all** in BBS (earlier premise was wrong).

## Master coded table (full corpus, N=117, task 06, 2026-07-10)

✓ = present; ~ = borderline; — = absent; n/a = no minable list. IDs = pool IDs
(`corpus.md`). Only non-empty cells shown as text; verbatim strings + retrieval
method/completeness per paper in `coding-batches.md` (seed rows: see historical
table below). ESTIM annotations: tooling / genealogy / prior-theory. CONTRACT
annotations: pm = performance-measurement branch, ctl = control branch.

| id | Paper | CONTRACT | PUBFIN | 2BEST | CORRECT | MGMT | ESTIM | Lucas | Goodhart |
|---|---|---|---|---|---|---|---|---|---|
| A1 | 1803.04585 Manheim–Garrabrant | — | — | — | — | ✓ Campbell | — | — | ✓ |
| A2 | 2209.13085 Skalse | — | — | — | — | — | — | — | ✓ |
| A3 | 2310.09144 Karwowski | — | — | — | — | — | — | — | ✓ |
| A4 | 2410.09638 El-Mhamdi–Hoang | — | — | — | — | ✓ Campbell, Strathern | ~ robust-stats | ✓ | ✓ |
| A5 | 2505.23445 Majka–El-Mhamdi | — | — | — | — | ✓ Strathern, Hoskin | ~ copula/tail | ✓ | ✓ |
| A6 | 2407.14503 Kwa | — | — | — | — | ✓ Strathern | ~ tail-theory | — | — |
| A7 | 2102.03896 Zhuang–HM | △ transaction-cost econ (not multitask tier) | — | — | — | ✓ Kerr | — | — | — |
| A8 | 2510.02840 | — | — | — | — | ✓ Strathern | — | — | ✓ |
| A9 | 2603.15017 | ✓ HM1991 (pm) | — | — | — | ✓ Strathern | — | — | — |
| A10 | 2506.19248 | — | — | — | — | — | — | — | ✓ |
| A11 | 2602.13934 | — | — | — | — | — | — | — | — |
| A12 | OpenReview HTpPKXkUnw | n/a (refs publisher-elided) | | | | | | | |
| A13 | 2011.01010 Ashton | — | — | — | — | ✓ Campbell, Rodamar | — | — | ✓ |
| A14 | 1810.10862 Manheim | — | — | — | — | ✓ Campbell | — | — | ✓ |
| A15 | 2002.08512 Thomas–Uesato | — | — | — | — | ✓ Strathern | — | — | — |
| B1 | 1606.06565 Amodei | — | — | — | — | — | ~ GMM/IV | — | ✓ |
| B2 | 2201.03544 Pan | — | — | — | — | — | — | — | — |
| B3 | 2403.03185 Laidlaw | — | — | — | — | — | ~ uses χ², cites no ESTIM prior art (type-iii locked) | — | ✓ |
| B4 | 1811.07871 Leike | — | — | — | — | — | — | — | — |
| B5 | 1908.04734 Everitt | — | — | — | — | — | — | — | — |
| B6–B13 | (8 papers, see `coding-batches.md`) | — | — | — | — | — | — | — | — |
| B14 | 2303.09387 | — | — | — | — | — | — | — | ✓ |
| B15 | 2410.06491 | — | — | — | — | — | — | — | — |
| B16 | 2507.05619 | — | — | — | — | — | — | — | ✓ |
| B17, B18 | 2606.15385, 2412.07177 | — | — | — | — | — | — | — | — |
| B19 | 2211.08714 | — | — | — | — | — | — | — | ✓ (1975) |
| B20, B21, B23–B25 | (5 papers) | — | — | — | — | — | — | — | — |
| B22 | 2604.13602 Wang survey | — | — | — | — | — | — | — | — |
| C1 | 2210.10760 Gao | — | — | — | — | ✓ Campbell | — | — | ✓ |
| C2–C5 | Rafailov, Coste, Eisenstein, Moskovitz | — | — | — | — | — | — | — | C5 ✓ only |
| C6 | 2401.12187 WARM | — | — | — | — | ✓ Strathern | — | — | — |
| C7–C10 | (4 papers) | — | — | — | — | — | — | — | — |
| C11 | 2505.12763 | — | — | — | — | — | — | — | ✓ |
| C12, C13, C14 | (3 papers) | — | — | — | — | — | — | — | — |
| C15 | 2604.12086 | — | — | — | — | — | — | — | ✓ |
| C16–C19 | (4 papers) | — | — | — | — | — | — | — | — |
| C20 | 2310.05199 | — | — | — | — | ✓ Strathern | — | — | — |
| C21–C25 | (5 papers incl. Casper 227 refs) | — | — | — | — | — | — | — | — |
| C26 | 2409.19024 | — | — | — | — | — | — | — | ✓ |
| C27 | 2410.05584 | — | — | — | — | — | — | — | ✓ |
| C28 | 2510.03231 Trench Coat | — | — | — | — | — | — | — | ✓ |
| C29, C30 | (2 papers) | — | — | — | — | — | — | — | — |
| C31 | 2407.13399 χPO | — | — | — | — | — | ✓ Duchi–Namkoong 2019 + Tsybakov (genealogy; type-ii) | — | — |
| C32 | 2509.19104 DRO-REBEL | — | — | — | — | — | ✓ D–N 2021/2022, N–D 2017, Rockafellar–Wets (tooling) | — | — |
| C33 | 2502.01930 | — | — | — | — | — | ✓ D–N cluster (tooling) | — | — |
| C34 | 2604.08577 | — | — | — | — | — | ✓ D–N cluster (tooling) | — | — |
| C35 | 2503.00539 | — | — | — | — | — | ✓ **Ben-Tal 2013** + Sinha–N–D (tooling) | — | — |
| D1 | 1711.02827 IRD | — | — | — | — | — | ~ Rockafellar–Uryasev CVaR | — | — |
| D2 | 1606.03137 CIRL | ✓ HM1991 + HM1987 + Gibbons98 (pm) | — | — | — | ✓ Kerr | — | — | — |
| D3 | 1611.08219 Off-Switch | ✓ Baker2002 + Gibbons98 (ctl) [HM1991 UNCONFIRMED — task 07] | — | — | — | ✓ Kerr | — | — | — |
| D4–D9 | (6 papers) | — | — | — | — | — | — | — | — |
| E1, E2 | Hubinger, Ngo | — | — | — | — | — | — | — | — |
| F1, F2 | Hardt, Perdomo | — | — | — | — | — | — | — | — |
| F3 | 1910.10362 Miller | ✓ HM1991 (pm) + Grossman–Hart (ctl) | — | — | — | ✓ Strathern | — | — | — |
| F4 | 2106.12705 | — | — | — | — | — | — | ✓ **Lucas 1976** | — |
| F5 | 2204.01884 | — | ✓ **Chetty (Raj)** | — | — | — | ~ Rockafellar (role-unknown) | — | — |
| F6 | 2411.08998 | — | — | — | — | ✓ Campbell | — | — | — |
| F7–F12 | (6 papers; F7 PARTIAL refs) | — | — | — | — | — | — | — | — |
| F13 | 2508.14927 | ✓ Holmström 1979+1980 (ctl) | — | — | — | — | — | — | — |
| F14 | 2605.06324 | — | — | — | — | — | — | — | — |
| F15 | 2412.16114 Content Moderator | ✓ **Feltham–Xie 1994** + HM1991 (pm) | — | — | — | — | — | — | — |
| G1–G4, G7 | ADA foundations + contamination survey | — | — | — | — | — | — | — | — |
| G5 | 2410.09247 | — | — | — | — | ✓ Strathern | — | — | ✓ |
| G6 | 2502.06559 | — | — | — | — | ✓ Strathern | — | — | — |
| H1, H2 | Zhong, Kaufmann surveys | — | — | — | — | — | — | — | — |
| H5 | 2310.19852 Ji survey | — | — | — | — | — | ✓ Ben-Tal 2009 + D–G–N 2021 (tooling) | — | ✓ |
| H6 | 2109.13916 Hendrycks | — | — | — | — | ✓ **Ridgway 1956** + Strathern | — | — | ✓ |
| H7, H8 | (2 surveys) | — | — | — | — | — | — | — | — |
| I1 | 2603.28063 Wang–Huang | ✓ HM1991 + **Baker 1992** (pm) + Grossman–Hart + Hart–Moore (ctl) | — | — | — | — | — | — | — |
| I2 | 2605.30916 Haupt | ✓ HM1987 + HM1991 + Baker 2002 (pm) | — | — | — | ✓ Strathern | — | — | — |
| I3 | OpenReview Y5qABVr7uB | n/a (access-limited) | | | | | | | |

## Tier totals (full frozen corpus: N=117; minable N=115 — A12, I3 n/a)

- **CONTRACT: 8 clean ✓ + 1 △ of 115** — and the distribution IS the finding:
  **0 in the reward-hacking core (B: 0/25), 0 in RLHF-overoptimization (C: 0/35),
  0 in mesa-opt/ADA/surveys-but-Hendrycks (E, G, H)**. All 8 hits sit in three
  pockets: the 2026 benchmark-contract bridges (I1, I2, + new candidate A9), the
  CHAI control lineage (D2, D3), and the strategic-ML/platform periphery (F3,
  F13, F15). Branch split: pm = A9, D2, F3, F15, I1, I2; ctl = D3, F13 (+ I1's
  Grossman–Hart/Hart–Moore, F3's Grossman–Hart).
- **Feltham–Xie 1994: 1 of 115** — F15 only (econ-authored platform paper,
  "Goodhart" absent from its text). **Baker 1992: 1** (I1). **Baker 2002: 2**
  (D3, I2). **DKL 2001: 0. Prendergast: 0. Holmström 2017: 0.**
- **PUBFIN (Raj Chetty / Feldstein): 1 of 115** — F5 (strategic-ML), method use.
- **2BEST: 0 of 115. CORRECT: 0 of 115.** (Lipsey–Lancaster, Reynaert–Sallee,
  Baumol–Oates, Montgomery: zero across the entire denominator.)
- **ESTIM: 6 ✓ + 7 ~** — every ✓ is tooling except χPO's genealogy footnote
  (type-ii per the 2026-06-30 primary read). **Hammersley / Chapman–Robbins /
  Cramér–Rao as prior theory of a Goodhart bound: 0 of 115.** The two papers
  using χ² *for* Goodhart (B3 Laidlaw, C31 χPO) cite none of the estimation
  lineage as such.
- **MGMT (folklore tier): 21 of 115** — Strathern 13, Campbell 6, Kerr 3,
  Hoskin 1, Rodamar 1, **Ridgway 1** (Hendrycks only).
- **Lucas 1976: 3 of 115** (A4, A5, F4 — two of them econ-audience-adjacent).
- **Goodhart eponym: 24 of 115** (23× 1984, 1× 1975).

**Headline (licensed by this table):** in the frozen 115-paper minable
denominator, the performance-measurement contract-theory tier that contains the
multidimensional-Goodhart math (Feltham–Xie congruity, Baker distortion, DKL)
is reached only by the 2026 benchmark-design bridges, the CHAI control lineage,
and econ-authored platform work — **never by the reward-hacking /
RLHF-overoptimization core (0 of 60 in clusters B+C)**, whose only econ contact
is the Goodhart eponym (24) and the Strathern/Campbell/Kerr folklore tier (21).
The public-finance, second-best, and corrective-tax tiers are at 0–1 of 115,
and the estimation tier is never cited as prior theory. Scope note: clusters C,
F, G are anchor+representative samples per `corpus.md` — the totals are claims
about that documented denominator, not an enumeration of the unbounded 2025–26
mitigation tail.

## Historical: seed pass master coded table (2026-06-24, 25 papers)

| # | Paper | CONTRACT | PUBFIN | 2BEST | CORRECT | MGMT | ESTIM | Lucas | Goodhart |
|---|---|---|---|---|---|---|---|---|---|
| **Cluster A — Formal Goodhart** |
| A1 | El-Mhamdi & Hoang 2024 (2410.09638) | — | — | — | — | ✓ Campbell, Strathern | ~ robust-stats only | ✓ | ✓ |
| A2 | Majka & El-Mhamdi 2025 (2505.23445) | — | — | — | — | ✓ Strathern, Hoskin | ~ copula/tail only | ✓ | ✓ |
| A3 | Manheim & Garrabrant 2018 (1803.04585) | — | — | — | — | ✓ Campbell 1979 | — | — | ✓ |
| A4 | Karwowski/Skalse et al. 2023 (2310.09144) | — | — | — | — | — | — | — | ✓ (1984) |
| A5 | Hennessy & Goodhart 2023 (IER 64(3)) | — | — | — | — | — | — | ✓ | ✓ |
| A6 | Ashton 2021 (2011.01010) | — | — | — | — | ✓ Campbell, Rodamar | — | — | ✓ (1984) |
| A7 | Kwa et al. 2024 "Catastrophic Goodhart" (2407.14503) | — | — | — | — | ✓ Strathern | ~ tail-theory only | — | — (title only) |
| A8 | Zhuang & Hadfield-Menell 2020 (2102.03896) | △ transaction-cost econ (Williamson, Klein, Shavell, HM-Hadfield); **not** the multitask/congruity tier | — | — | — | ✓ Kerr 1975 | — | — | — |
| **Cluster B — Reward hacking / specification gaming** |
| B1 | Skalse et al. 2022 (2209.13085) | — | — | — | — | — | — | — | ✓ (1984) |
| B2 | Pan et al. 2022 (2201.03544) | — (Baker trap) | — | — | — | — | — | — | — |
| B3 | Amodei et al. 2016 (1606.06565) | — | — | — | — | — | ~ GMM/IV econometrics only | — | ✓ (1984) |
| B4 | Krakovna et al. 2020 (specification gaming) | n/a (blog) | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| B5 | Everitt & Hutter 2019 (1908.04734) | — | — | — | — | — | — | — | — |
| B6 | Hadfield-Menell et al. 2017 IRD (1711.02827) | — | — | — | — | — | ~ Rockafellar–Uryasev CVaR (not DRO sense) | — | — |
| B7 | Leike et al. 2018 (1811.07871) | — | — | — | — | — | — | — | — |
| B8 | Skalse & Abate 2022 IRL misspec. (2212.03201) | — | — | — | — | — | — | — | — |
| B9 | Skalse et al. 2023 STARC (2309.15257) | — | — | — | — | — | — | — | — |
| **Cluster C — Reward-model overoptimization / RLHF + surveys** |
| C1 | Gao, Schulman, Hilton 2023 (2210.10760) | — | — | — | — | ✓ Campbell 1969 | — | — | ✓ (1984) |
| C2 | Coste et al. 2023 (2310.02743) | — | — | — | — | — | — | — | — |
| C3 | Eisenstein et al. 2023 (2312.09244) | — | — | — | — | — | — | — | — |
| C4 | Moskovitz et al. 2023 (2310.04373) | — | — | — | — | — | — | — | ✓ (1984) |
| C5 | Rafailov et al. 2024 (2406.02900) | — | — | — | — | — | — | — | — |
| C6 | Laidlaw et al. 2024 (2403.03185) | — | — | — | — | — | ~ uses χ²/occupancy reg. but cites no ESTIM prior art | — | ✓ (1984) |
| C7 | Zhong et al. 2025 survey (2504.12328) | — | — | — | — | — | — | — | — (no "Goodhart") |
| C8 | Kaufmann et al. 2023 survey (2312.14925) | — | — | — | — | — | — | — | — (no "Goodhart") |
| C9 | Wang et al. 2026 reward-hacking survey (2604.13602) | — | — | — | — | — | — | — | — |
| **Discovered via reverse sweep — AI-safety papers that DO cite the contract tier** |
| R1 | Hadfield-Menell et al. 2016 CIRL | ✓ **Holmström–Milgrom 1991** | — | — | — | — | — | — | — |
| R2 | Hadfield-Menell et al. 2017 Off-Switch Game | ✓ **HM 1991 + Baker 2002** | — | — | — | — | — | — | — |

(R1/R2 coded only on the reverse-sweep contract hits, not fully re-audited.)

## Tier totals (forward corpus, A+B+C, 25 minable papers)

- CONTRACT (multitask/congruity tier): **0** clean hits (A8 is transaction-cost
  econ, a different branch; coded △).
- PUBFIN: **0**. 2BEST: **0**. CORRECT: **0**. ESTIM (DRO/HCR tier): **0**.
- MGMT: 6 (Campbell/Strathern/Kerr/Hoskin/Rodamar folklore).
- Lucas 1976: 3. Goodhart eponym: 13 of 25.

## Reverse forward-citation sweep (OpenAlex, 2026-06-24)

| Econ paper | total cites | CS-tagged | genuine AI-safety citer? |
|---|---|---|---|
| Reynaert–Sallee 2016 | 14 | 0 | **none** |
| Feltham–Xie 1994 | 949 | 4 | **none** (content-mod/VAR/causal-maps) |
| Baker 1992 (JPE) | 1098 | 5 | **none** |
| Baker 2002 (JHR) | 486 | 5 | **YES — 1:** Off-Switch Game (2017) |
| Holmström–Milgrom 1991 | 6114 | 75 | **YES — several:** CIRL 2016, Off-Switch 2017, Visibility into AI Agents 2024, Prause 2026 |

The only econ prior art AI-safety has actually reached is **HM1991** and **Baker
2002**, and almost entirely via the **Berkeley CHAI lineage (Hadfield-Menell /
Russell)** using an *incomplete-contracting / off-switch* framing — **not** the
multidimensional-Goodhart / congruity framing. Feltham–Xie congruity, Baker 1992,
and Reynaert–Sallee (the specific prior art the book leans on) have **zero**
alignment citers.

## Bridge paper: John, Caldwell, McCoy, Braganza 2023 (BBS, "Proxy failure")

Confirmed to bridge both tiers (OpenAlex W4382011620; strings from Cambridge OA PDF):
- **Econ:** Holmström 1979 & 2017; Baker 2002; Kerr 1975; Bénabou–Tirole 2016.
  (Corrections to prior premise: cites Holmström 1979/2017 **not** HM1991; Baker
  **2002 not 1992**; **no Lipsey** ref exists; "Chetty" = Marshini Chetty, privacy.)
- **AI:** Amodei 2016; Manheim–Garrabrant 2018; Manheim 2018 (separate paper);
  Everitt/Hutter/Kumar/Krakovna 2021.
Still the only document spanning econ + AI + biology — but in a neuroscience venue.

## "Should-be-cited" economics prior art (completeness check, with cites)

Strongest items the AI Goodhart literature omits (relevance + canonical weight):
- **Ridgway 1956** "Dysfunctional Consequences of Performance Measurements" (ASQ,
  361 cites) — the genealogical origin point; predates Goodhart by 19 years.
- **Prendergast 1999** "The Provision of Incentives in Firms" (JEL, 3398 cites) —
  canonical multitask-distortion survey.
- **Gibbons 1998** "Incentives in Organizations" (JEP) — general-audience statement.
- **Holmström 2017** Nobel lecture "Pay for Performance and Beyond" (AER, 165).
- **Courty–Marschke 2004** empirical gaming of performance incentives (J. Labor Econ).
- **Bénabou–Tirole 2016** "Bonus Culture" (JPE, 217); **Feltham–Xie 1994** congruity.

## Caveats / auditability flags

### Task-06 caveats (2026-07-10) — feed directly into task 07

- **Two S2 wrong-list incidents:** the S2 references endpoint returned another
  paper's list for B12 (got B11's) and C28 (got C29's); both caught by the
  agents via arXiv identity checks and re-coded from ar5iv. Consequence: task
  07 must second-source every ✓ hit and a random sample of ~10 all-absent rows.
- **D3 (Off-Switch) HM1991 UNCONFIRMED:** the complete 20-ref S2 list has
  Baker 2002 + Gibbons only; the seed pass and OpenAlex sweep claimed HM1991.
  PDF check required before publishing any D3-specific claim.
- **A9 (2603.15017) is a NEW exception-floor candidate** (HM1991, pm-branch) not
  in the June hunt's floor — verify identity + citing-sentence type in task 07,
  then fold into `bridges.md` §exception floor.
- **G2 label errata:** pool title says Blum–Hardt "The Ladder"; arXiv 1908.03156
  is actually a different overfitting paper. Fix label or swap in 1502.04585.
- **A12, I3 n/a (access-limited):** minable N = 115. Both are workshop items
  whose reference lists are behind OpenReview bot-challenges / publisher elision.
- ~14 papers had NO API-indexed references (S2 and OpenAlex both 0) and were
  coded from arXiv HTML / ar5iv / PDF / LaTeX source — method recorded per
  paper in `coding-batches.md`.
- χPO annotation discipline: its ESTIM ✓ is a genealogy footnote (type-ii per
  the 2026-06-30 primary read, `plans/phase0-handoff.md` §6) — do not re-inflate
  to a prior-theory bridge in downstream prose.

### Seed-pass caveats (2026-06-24)

- Krakovna 2020 is a DeepMind blog post — no reference list; coded n/a.
- Kaufmann 2023 survey: S2 `/references` empty; "absent" coding from arXiv
  full-text search for "Goodhart" + prior-art surnames (zero), not a line dump.
- Wang 2026 survey: very recent, S2 indexing partial; reference-level negatives
  high-confidence but not exhaustive.
- Majka 2025: S2 30 refs, not PDF-cross-checked; absences high-confidence.
- S2 mislabels Lucas 1976's author field ("Pritchett"); coded on title+year.
- For belt-and-suspenders on the big lists (Amodei 2016, Leike 2018), a PDF grep
  for Holmström/Lipsey/Kerr/Ridgway/Strathern would close the loop.
- A8 (Zhuang–HM) and B6 (IRD Rockafellar–Uryasev) coded conservatively as
  non-hits with the borderline noted; revisit if the paper wants to count them.
