# Task 05 — Frozen corpus + frozen prior-art tier scheme

**Frozen: 2026-07-10.** Per the July 10 human decisions (`plans/phase0-handoff.md`
§11): clusters F & G are **included** in the denominator; the audit is
repo-internal evidence for the rescoped LessWrong post. Denominator source: the
saturated discovery pool `research/threads/lit_review/cross-field-discovery/ai-corpus.md`
(discovery 2026-06-24; saturation note therein; Phase 1a cleared the last two
flagged IDs 2026-07-10), plus the exception-floor papers surfaced by the
adversarial passes (`bridges.md`). Coding is task 06; this file only fixes N and
the tiers.

## Inclusion / exclusion criteria (the reproducible rule)

**Include** a paper iff all of:
1. **Archival:** arXiv preprint, peer-reviewed venue, or indexed workshop
   (OpenReview). Blogs/LessWrong/DeepMind posts are grey-lit → listed but coded
   n/a, outside N.
2. **Window:** 2014–2026.
3. **Topic:** states, formalizes, mitigates, or surveys proxy-vs-true-objective
   divergence (Goodhart / reward hacking / overoptimization / specification
   gaming / goal misgeneralization / strategic gaming of a deployed metric /
   benchmark-holdout corruption).
4. **Community:** AI/ML-side literature (incl. strategic-ML and benchmark/ADA
   per the F/G decision). Econ-venue papers about AI belong to the prior-art
   side, not the denominator (exception: 2412.16114, included FLAGGED — see F15).

**Bridge non-exclusion rule (anti-attack):** papers known to cite econ prior art
(the exception floor) are *in* the denominator. Excluding them would manufacture
the gap; including them is what makes the totals honest.

**Open-ended-region rule:** clusters C (RLHF-mitigation tail), F, and G are
unbounded, self-similar populations. The frozen set = the discovery pool's
anchors + distinct-mechanism representative samples (saturated by kind/lineage,
per the pool's saturation note). The claim licensed is therefore about the
*anchor/canonical* stratum plus a documented representative sample — not an
enumeration of every 2025–26 mitigation preprint. Any published number must
carry this scope note.

## Frozen prior-art tier scheme (UNCHANGED from audit.md — no re-code of seed needed)

Tiers: **CONTRACT, PUBFIN, 2BEST, CORRECT, MGMT, ESTIM, Lucas, Goodhart** —
definitions and anchor papers exactly as `audit.md` §Coding scheme, including all
name-collision rules there.

Two coding **conventions** added at freeze (annotations on hits, not new tiers):
- **ESTIM hits:** annotate *tooling* (type-ii: DRO machinery for robust training)
  vs *prior-theory* (type-i: cited as the prior mathematics of a Goodhart bound).
- **CONTRACT hits:** annotate branch — *performance-measurement* (multitask
  distortion/congruity: HM1991-as-multitask, Baker, Feltham–Xie, DKL) vs
  *control/incomplete-contracting* (CHAI-style: off-switch, Hart–Moore framing).

## Frozen AI corpus (N = 117)

IDs are the discovery-pool IDs (stable). Decision default: **INCLUDE (rules
1–4)**; only exceptions carry prose. Titles abbreviated — full rows live in
`ai-corpus.md`.

### Cluster A — Formal Goodhart theory (15)
| id | ref | decision |
|---|---|---|
| A1 | 1803.04585 Manheim–Garrabrant | include (seed, coded) |
| A2 | 2209.13085 Skalse unhackability | include (seed, coded) |
| A3 | 2310.09144 Karwowski/Skalse | include (seed, coded) |
| A4 | 2410.09638 El-Mhamdi–Hoang | include (seed, coded) |
| A5 | 2505.23445 Majka–El-Mhamdi | include (seed, coded) |
| A6 | 2407.14503 Kwa Catastrophic | include (seed, coded) |
| A7 | 2102.03896 Zhuang–HM | include (seed, coded) |
| A8 | 2510.02840 Take Goodhart Seriously | include |
| A9 | 2603.15017 Consequentialist Objectives | include |
| A10 | 2506.19248 Inference-Time RH | include |
| A11 | 2602.13934 Why Code Why Now | include |
| A12 | OpenReview `HTpPKXkUnw` Majka–Bouaziz–El-Mhamdi "On the Strength of Goodhart's Law" (ICML 2025 MoFA poster) | include — workshop-archival (rule 1); causal/hidden-variable Goodhart, directly relevant; **access-limited** (bot-challenge) — code via S2 CorpusId 281888128, else n/a-flag |
| A13 | 2011.01010 Ashton | include (seed, coded) |
| A14 | 1810.10862 Manheim multi-agent | include |
| A15 | 2002.08512 Thomas–Uesato | include FLAGGED (position essay, archival) |

### Cluster B — Reward hacking / spec gaming (25 archival; B26–B30 grey-lit → n/a)
| id | ref | decision |
|---|---|---|
| B1 | 1606.06565 Amodei | include (seed, coded) |
| B2 | 2201.03544 Pan | include (seed, coded) |
| B3 | 2403.03185 Laidlaw | include (seed, coded; type-iii locked 2026-07-10) |
| B4 | 1811.07871 Leike | include (seed, coded) |
| B5 | 1908.04734 Everitt tampering | include (seed, coded) |
| B6 | 1705.08417 CRMDP | include |
| B7 | 1907.00452 Spiky Corruption | include |
| B8 | 2011.08820 REALab | include |
| B9 | 2105.14111 Langosco GM | include |
| B10 | 2210.01790 Shah GM | include |
| B11 | 2312.03762 Colour/Shape GM | include |
| B12 | 2204.06601 Causal Confusion | include |
| B13 | 2301.03652 Fragility | include |
| B14 | 2303.09387 Characterizing Manipulation | include |
| B15 | 2410.06491 Honesty to Subterfuge | include |
| B16 | 2507.05619 Evaluator Stress Tests | include |
| B17 | 2606.15385 Gridworlds Revisited | include |
| B18 | 2412.07177 Effective Reward Spec | include |
| B19 | 2211.08714 Reward Gaming NLG | include |
| B20 | 2308.15605 Measurement Tampering | include |
| B21 | 2604.15149 RLVR Gaming | include |
| B22 | 2604.13602 Wang survey (=H3) | include, counted once here (seed, coded) |
| B23 | 2507.18742 Spec Self-Correction | include |
| B24 | 2510.01367 Thinking or Cheating | include |
| B25 | 2510.13036 Repairing Rewards | include |
| B26–B30 | Krakovna ×2, Garrabrant, Sohl-Dickstein, Thrasymachus | **EXCLUDE — grey-lit (rule 1), coded n/a**, listed for the record |

### Cluster C — RLHF overoptimization + robust-RLHF/χ² additions (35)
| id | ref | decision |
|---|---|---|
| C1 | 2210.10760 Gao | include (seed, coded) |
| C2 | 2406.02900 Rafailov | include (seed, coded) |
| C3 | 2310.02743 Coste | include (seed, coded) |
| C4 | 2312.09244 Eisenstein | include (seed, coded) |
| C5 | 2310.04373 Moskovitz | include (seed, coded) |
| C6 | 2401.12187 WARM | include |
| C7 | 2402.09345 InfoRM | include |
| C8 | 2405.16436 SFT-as-Adversarial-Reg | include |
| C9 | 2503.18130 Behavior-Supported | include |
| C10 | 2505.18126 Iterated RLHF | include |
| C11 | 2505.12763 RM Eval Lens | include |
| C12 | 2510.13694 Info-Theoretic Stable RLHF | include |
| C13 | 2502.18770 Reward Shaping | include |
| C14 | 2602.10623 Bayesian Non-negative RM | include |
| C15 | 2604.12086 Robust Opt for RH | include |
| C16 | 2606.04145 EvalStop | include |
| C17 | 2603.06797 Best-of-Tails | include |
| C18 | 2604.10727 Tail-Aware Info-Theoretic | include |
| C19 | 2310.03716 Length Correlations | include |
| C20 | 2310.05199 Loose Lips | include |
| C21 | 2403.19159 Disentangling Length | include |
| C22 | 2309.16155 Trickle-down | include |
| C23 | 2402.10184 Topological Perspective | include |
| C24 | 2307.15217 Casper open problems (=H4) | include, counted once here |
| C25 | 2501.09620 Causal Rewards | include |
| C26 | 2409.19024 Elephant in the Room | include |
| C27 | 2410.05584 Barking up the Wrong Tree | include |
| C28 | 2510.03231 Metrics in a Trench Coat | include |
| C29 | 2604.01476 RH Rebounds | include |
| C30 | 2604.26360 Uncertainty-Aware Discounting | include |
| C31 | 2407.13399 χPO (Huang et al.) | include — **added at freeze** from exceptions-hunt (χ² for alignment; type-ii per primary read 2026-06-30) |
| C32 | 2509.19104 DRO-REBEL | include — added at freeze (robust-RLHF/DRO-tooling pocket) |
| C33 | 2502.01930 Robust-DPO | include — added at freeze (same pocket) |
| C34 | 2604.08577 DR Token Opt | include — added at freeze (same pocket) |
| C35 | 2503.00539 Mandal et al. | include — added at freeze (same pocket) |

### Cluster D — Reward learning / IRD / IRL (9)
| id | ref | decision |
|---|---|---|
| D1 | 1711.02827 IRD | include (seed, coded) |
| D2 | 1606.03137 CIRL | include — seed R1 coded on CONTRACT only; **full re-code in 06** |
| D3 | 1611.08219 Off-Switch | include — seed R2 coded on CONTRACT only; **full re-code in 06** |
| D4 | 2212.03201 Skalse–Abate misspec | include (seed, coded) |
| D5 | 2309.15257 STARC | include (seed, coded) |
| D6 | 2403.06854 IRL Sensitivity | include |
| D7 | 2411.15951 Partial Identifiability (Skalse–Abate; ID resolved 2026-07-10) | include |
| D8 | 2312.08358 Hidden Context | include |
| D9 | 2412.16475 Proxies Sample Complexity | include |

### Cluster E — Mesa-optimization (2)
| id | ref | decision |
|---|---|---|
| E1 | 1906.01820 Risks from Learned Opt | include |
| E2 | 2209.00626 Ngo et al. | include |

### Cluster F — Strategic ML / performative (15) — INCLUDED per 2026-07-10 decision
| id | ref | decision |
|---|---|---|
| F1 | 1506.06980 Strategic Classification | include |
| F2 | 2002.06673 Performative Prediction | include |
| F3 | 1910.10362 Causal Modeling in Disguise | include |
| F4 | 2106.12705 Alternative Microfoundations | include |
| F5 | 2204.01884 Competing Agents | include |
| F6 | 2411.08998 Microfoundation Inference | include |
| F7 | 2408.05146 Performative Games | include |
| F8 | 2602.10176 Performative Survey | include |
| F9 | 2310.16608 Past and Future | include |
| F10 | 2509.02391 Federated Gaming | include |
| F11 | 2011.00355 Constructive Adaptation | include |
| F12 | 2412.02000 Who's Gaming the System | include |
| F13 | 2508.14927 Strategic Behaviour Testing | include |
| F14 | 2605.06324 Gaming the Metric Not the Harm | include |
| F15 | 2412.16114 Content Moderator's Dilemma | include **FLAGGED borderline** — econ-authored platform-governance (the only Feltham–Xie bridge, body-verified 2026-07-10); included under the bridge non-exclusion rule |

### Cluster G — Benchmark / ADA / leaderboard (7) — INCLUDED per 2026-07-10 decision
| id | ref | decision |
|---|---|---|
| G1 | 1506.02629 Dwork reusable holdout | include |
| G2 | 1908.03156 The Ladder | include |
| G3 | 2102.13189 Rip van Winkle | include |
| G4 | 1604.02492 Bayesian ADA | include |
| G5 | 2410.09247 Benchmark Inflation | include |
| G6 | 2502.06559 Can We Trust AI Benchmarks | include |
| G7 | 2406.04244 Contamination Survey | include |

### Cluster H — Surveys (6 unique; H3→B22, H4→C24)
| id | ref | decision |
|---|---|---|
| H1 | 2504.12328 Zhong RM survey | include (seed, coded) |
| H2 | 2312.14925 Kaufmann RLHF survey | include (seed, coded) |
| H5 | 2310.19852 Ji alignment survey | include |
| H6 | 2109.13916 Hendrycks Unsolved Problems | include |
| H7 | 2505.02666 Reward Design survey | include |
| H8 | 2506.15421 RM in Deep RL survey | include |

### Cluster I — Benchmark-design / contract bridges (3) — added at freeze from exceptions-hunt
| id | ref | decision |
|---|---|---|
| I1 | 2603.28063 Wang–Huang | include — type-(i) bridge (ref-list primary-verified 2026-06-30); in-denominator per bridge non-exclusion rule |
| I2 | 2605.30916 Haupt et al. | include — type-(i) bridge (primary-verified) |
| I3 | OpenReview `Y5qABVr7uB` Haupt-2 platinum benchmarks | include — workshop-archival; **access-limited** (bot-challenge, verified-exists 2026-07-10); code via sibling-informed S2 attempt, else n/a-flag |

### Moved OUT of the denominator (with reasons)
- **Hennessy & Goodhart 2023 (IER 64(3))** — econ-venue, econ-authored; belongs
  to the prior-art side (was audit.md seed row A5; its coded row is retained
  there as historical data, excluded from denominator totals).
- **Hennessy–Goodhart 2021 (SSRN 3639508)** — same, folded into Track B corpus
  as econ prior art per the BBS body-read note.
- **BBS 2023 (John et al.)** — the bridge document, profiled separately in
  `audit.md`; not an AI-corpus member (neuroscience venue).
- **Braganza Proxyeconomics (1803.00345)** — econ-side per discovery pool flag.
- **B26–B30 grey-lit** — rule 1, coded n/a.

## Saturation evidence (why freezing now is sound)

1. Discovery saturation per `ai-corpus.md` §SATURATION NOTE (per-cluster:
   A/B/D/E/H saturated; C by kind; F by lineage; G on foundations).
2. The 12 adversarial exceptions-hunt passes (June 28) surfaced only the
   exception-floor papers now folded in as C31–C35, F15, I1–I3 — three further
   passes found nothing new (`bridges.md`).
3. Phase 1a (2026-07-10) resolved the last two flagged IDs (A12, D7); zero
   unverified IDs remain in N.

## Bookkeeping

- **N = 117** (A 15, B 25, C 35, D 9, E 2, F 15, G 7, H 6, I 3).
- Already coded under the identical tier scheme: 24 seed rows (marked "seed,
  coded" above) — no re-code needed since the scheme is unchanged; D2/D3 need
  full re-code (seed coded CONTRACT-only).
- **To code in task 06: 93 papers** (117 − 24), incl. 2 access-limited
  (A12, I3) that may end n/a-flagged.
