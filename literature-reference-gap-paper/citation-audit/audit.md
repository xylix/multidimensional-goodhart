# Citation audit — methods, corpus, and master coded table

Status: first systematic pass, 2026-06-24. Executed via four parallel research
agents (clusters A–C forward audit + reverse/bridge sweep), each retrieving full
reference lists and coding them against a fixed scheme. This is the auditable
spine of the gap paper's central empirical claim. Interpretation lives in
`findings.md`; this file is the data.

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

## Master coded table

✓ = present (author-year); — = absent; n/a = no minable reference list.
"Goodhart" column = the eponym (Goodhart 1975/1984) only.

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
