# Task 06 — raw coding-batch results (staging; merge into audit.md when all batches done)

Status: **PAUSED 2026-07-10** (usage limit). 6 of 13 batches complete (below);
7 batches stopped mid-run and must be **re-run from scratch** (§Resume). Coding
protocol: `../audit-tasks/coding-protocol.md` (agents read it verbatim).
Tier scheme + name-collision rules: `audit.md`; frozen N=117: `corpus.md`.

Cell values: `—` absent · `✓` present · `~` borderline · n/a no minable list.

## Completed batch: cluster A (7 papers, 2026-07-10)

| id | Paper (arXiv) | CONTRACT | PUBFIN | 2BEST | CORRECT | MGMT | ESTIM | Lucas | Goodhart |
|---|---|---|---|---|---|---|---|---|---|
| A8 | 2510.02840 | — | — | — | — | ✓ Strathern | — | — | ✓ Goodhart 1984 |
| A9 | 2603.15017 | ✓ **HM1991 (perf-measurement)** | — | — | — | ✓ Strathern | — | — | — |
| A10 | 2506.19248 | — | — | — | — | — | — | — | ✓ Goodhart 1984 |
| A11 | 2602.13934 | — | — | — | — | — | — | — | — |
| A12 | (OpenReview HTpPKXkUnw) | n/a — refs publisher-elided on S2; OpenReview bot-walled; OpenAlex 0 hits | | | | | | | |
| A14 | 1810.10862 | — | — | — | — | ✓ Campbell (Donald) | — | — | ✓ Goodhart 1984 |
| A15 | 2002.08512 | — | — | — | — | ✓ Strathern | — | — | — |

Methods: A8 S2 COMPLETE 69 refs; A9 S2 COMPLETE 38; A10 arXiv-HTML COMPLETE 85
(S2 429); A11 S2 COMPLETE 45 (list partly noisy/garbled — no tier impact);
A14 S2 COMPLETE 61; A15 S2 COMPLETE 54.

Verbatim hits:
- A9 CONTRACT: "Multitask Principal–Agent Analyses: Incentive Contracts, Asset
  Ownership, and Job Design — Bengt R. Holmstrom, P. Milgrom, 1991". Also
  cites Laffont–Martimort (single-task P-A, not scheme-listed) and
  Hadfield-Menell & Hadfield "Incomplete Contracting and AI Alignment".
  **NEW EXCEPTION-FLOOR CANDIDATE — a 2026 cluster-A formal-Goodhart paper
  reaching HM1991; not surfaced by the June exceptions hunt. Task-07: verify +
  type (i)/(ii) from citing sentence.**
- A8/A9/A15 MGMT: "'Improving ratings': audit in the British University system —
  M. Strathern, 1997". A14 MGMT: "Assessing the Impact of Planned Social
  Change — D. Campbell" (Donald).
- A8/A10/A14 Goodhart: "Problems of Monetary Management: The UK Experience —
  C. Goodhart, 1984".
- Collision rejections: Nathan Lambert (A10), Marshini Chetty (A15),
  Goodhart-in-AI-title (A8/A11/A14 — Manheim–Garrabrant, El-Mhamdi–Hoang,
  Karwowski titles not coded as eponym).
- A12 title discrepancy logged: ICML virtual page shows "On the Strength of
  Goodhart's Law" (Phase-1a agent); OpenReview/S2 metadata show "…of Causal
  Goodhart's Law" (this agent). Same item (CorpusId 281888128).

## Completed batch: cluster B batch 1 (B6–B12, 2026-07-10)

| id | Paper | CONTRACT | PUBFIN | 2BEST | CORRECT | MGMT | ESTIM | Lucas | Goodhart |
|---|---|---|---|---|---|---|---|---|---|
| B6 | 1705.08417 | — | — | — | — | — | — | — | — |
| B7 | 1907.00452 | — | — | — | — | — | — | — | — |
| B8 | 2011.08820 | — | — | — | — | — | — | — | — |
| B9 | 2105.14111 | — | — | — | — | — | — | — | — |
| B10 | 2210.01790 | — | — | — | — | — | — | — | — |
| B11 | 2312.03762 | — | — | — | — | — | — | — | — |
| B12 | 2204.06601 | — | — | — | — | — | — | — | — |

Methods: all S2 COMPLETE (21/24/71/51/48/18 refs) except **B12 coded from ar5iv
HTML (36 refs) — S2's references endpoint returned the WRONG list for
2204.06601 (byte-identical to B11's). MAJOR CAVEAT for task 07: S2 can return
contaminated lists; spot-check via a second source.** Zero hits across batch.

## Completed batch: cluster B batch 3 (B19–B25, 2026-07-10)

| id | Paper | CONTRACT | PUBFIN | 2BEST | CORRECT | MGMT | ESTIM | Lucas | Goodhart |
|---|---|---|---|---|---|---|---|---|---|
| B19 | 2211.08714 | — | — | — | — | — | — | — | ✓ Goodhart 1975 |
| B20 | 2308.15605 | — | — | — | — | — | — | — | — |
| B21 | 2604.15149 | — | — | — | — | — | — | — | — |
| B23 | 2507.18742 | — | — | — | — | — | — | — | — |
| B24 | 2510.01367 | — | — | — | — | — | — | — | — |
| B25 | 2510.13036 | — | — | — | — | — | — | — | — |

Methods: B19 ar5iv COMPLETE 79; B20 ar5iv COMPLETE 34; B21 S2 short-but-complete
11 (sparse metadata, ID→paper mapping consistent); B23 arXiv-HTML COMPLETE 12;
B24 S2 COMPLETE 37; B25 arXiv-HTML COMPLETE 59. (S2 429'd on 4/6; HTML fallbacks
used.) Verbatim: B19 Goodhart = "Goodhart (1975). Problems of monetary
management: the UK experience…". Collision rejections: Bowen Baker (B19, B24),
"Lucas Baker" DeepMind (B20).

## Completed batch: cluster C batch 2 (C14–C21, 2026-07-10)

| id | Paper | CONTRACT | PUBFIN | 2BEST | CORRECT | MGMT | ESTIM | Lucas | Goodhart |
|---|---|---|---|---|---|---|---|---|---|
| C14 | 2602.10623 | — | — | — | — | — | — | — | — |
| C15 | 2604.12086 | — | — | — | — | — | — | — | ✓ Goodhart 1984 |
| C16 | 2606.04145 | — | — | — | — | — | — | — | — |
| C17 | 2603.06797 | — | — | — | — | — | — | — | — |
| C18 | 2604.10727 | — | — | — | — | — | — | — | — |
| C19 | 2310.03716 | — | — | — | — | — | — | — | — |
| C20 | 2310.05199 | — | — | — | — | ✓ Strathern | — | — | — |
| C21 | 2403.19159 | — | — | — | — | — | — | — | — |

Methods: C14 S2+HTML COMPLETE 68; C15 **arXiv PDF direct** COMPLETE ~75 (S2 &
OpenAlex unindexed, HTML truncated); C16 S2 COMPLETE 27 (some garbled entries,
no tier impact); C17 S2 COMPLETE 64 (tail/EVT refs present — Hill, de Haan —
but none in ESTIM canon); C18 **arXiv PDF direct** COMPLETE ~52 (Ben-DAVID ≠
Ben-Tal; James Ridgway ML ≠ V.F. Ridgway — collisions correctly rejected);
C19 S2 COMPLETE 40; C20 S2 COMPLETE 33; C21 S2 COMPLETE 32.
Verbatim: C15 Goodhart = "Charles AE Goodhart and CAE Goodhart. Problems of
monetary management: the UK experience. Springer, 1984" (garbled author field,
unambiguous). C20 MGMT = "'Improving ratings': audit in the British University
system (1997) — M. Strathern". Collision rejections: Nathan Lambert (C14, C21),
Campbell-Gillingham (C20), Goodhart-in-AI-title (C17, C18, C21).

## Completed batch: cluster D (D2–D9, 2026-07-10)

| id | Paper | CONTRACT | PUBFIN | 2BEST | CORRECT | MGMT | ESTIM | Lucas | Goodhart |
|---|---|---|---|---|---|---|---|---|---|
| D2 | 1606.03137 CIRL | ✓ HM1991 + HM1987 + Gibbons98 (perf-measurement) | — | — | — | ✓ Kerr 1975 | — | — | — |
| D3 | 1611.08219 Off-Switch | ✓ Baker2002 + Gibbons98 (control) | — | — | — | ✓ Kerr 1975 | — | — | — |
| D6 | 2403.06854 | — | — | — | — | — | — | — | — |
| D7 | 2411.15951 | — | — | — | — | — | — | — | — |
| D8 | 2312.08358 | — | — | — | — | — | — | — | — |
| D9 | 2412.16475 | — | — | — | — | — | — | — | — |

Methods: D2 S2 COMPLETE 34; D3 S2 COMPLETE 20 (several garbled venue-string
entries); D6/D7/D8/D9 raw arXiv/ar5iv HTML bibitem parse (S2 AND OpenAlex both
0 refs for all four), COMPLETE 28/63/52/39.
Verbatim (D2): "Multitask Principal–Agent Analyses… Holmstrom, Milgrom 1991";
"AGGREGATION AND LINEARITY IN THE PROVISION OF INTERTEMPORAL INCENTIVES —
Holmstrom, Milgrom 1987"; "Incentives in Organizations — R. Gibbons 1998"; "On
the folly of rewarding A, while hoping for B — S. Kerr 1975". (D3): "Distortion
and Risk in Optimal Incentive Contracts — G. Baker 2002"; Gibbons 1998; Kerr
1975; also Tirole "Cognition and Incomplete Contracts" (not scheme-listed).
**CORRECTION vs seed R2 + June reverse sweep: D3's complete 20-ref S2 list has
NO HM1991. Unconfirmed, not refuted (garbled entries exist; OpenAlex forward
sweep disagreed) → task-07 PDF check.** Collision rejections: Nicolas Lambert
economist ≠ accounting Lambert (D8); "Jamie Kerr" Anthropic ≠ Steven Kerr (D8);
Goodhart-in-title (D7).

## Completed batch: cluster F batch 1 (F1–F8, 2026-07-10)

| id | Paper | CONTRACT | PUBFIN | 2BEST | CORRECT | MGMT | ESTIM | Lucas | Goodhart |
|---|---|---|---|---|---|---|---|---|---|
| F1 | 1506.06980 | — | — | — | — | — | — | — | — |
| F2 | 2002.06673 | — | — | — | — | — | — | — | — |
| F3 | 1910.10362 | ✓ HM1991 (perf-meas) + Grossman–Hart | — | — | — | ✓ Strathern | — | — | — |
| F4 | 2106.12705 | — | — | — | — | — | — | ✓ Lucas 1976 | — |
| F5 | 2204.01884 | — | ✓ **Chetty (Raj) suff-stats** | — | — | — | ~ Rockafellar Convex Analysis (role-unknown) | — | — |
| F6 | 2411.08998 | — | — | — | — | ✓ Campbell (Donald) | — | — | — |
| F7 | 2408.05146 | — | — | — | — | — | — | — | — |
| F8 | 2602.10176 | — | — | — | — | — | — | — | — |

Methods: all S2; COMPLETE 14/43/36/45/47/40/67 except F7 PARTIAL (49 shown, ~9
metadata-less entries omitted).
Verbatim: F3 = HM1991 (as above) + "AN ANALYSIS OF THE PRINCIPAL-AGENT
PROBLEM — Grossman, Hart 1983" + Strathern 1997. F4 Lucas = "Econometric policy
evaluation: A critique (1976)" (S2 mis-attributes author to "Pritchett" — known
S2 metadata bug, title/year unambiguous; F4 also cites Hennessy–Goodhart 2021
"Goodhart's Law and Machine Learning" — econ-authored, NOT the eponym tier).
F5 PUBFIN = "Sufficient Statistics for Welfare Analysis: A Bridge Between
Structural and Reduced-Form Methods — Raj Chetty" (S2 dates it 2008); ESTIM ~ =
"Convex analysis, volume 18 (1970)" authorless, inferred Rockafellar, borderline
only. F6 MGMT = "Assessing the Impact of Planned Social Change — D. Campbell".
Near-miss logged (F3): Oates–Schwab window-tax excess-burden paper ≠
Baumol–Oates → not CORRECT.
**Cluster-F signal: strategic-ML papers DO reach the econ tiers (HM1991, Raj
Chetty, Lucas, Grossman–Hart) — the citation gap is specific to the AI-safety
reward-hacking lineage, visible from both sides. Feed to task 09.**

## Partial (killed mid-run — findings NOT to be trusted; re-run fully)

- C batch 1: C6 (WARM, 152 refs) had MGMT ✓ Strathern; Namkoong-as-coauthor
  collisions correctly rejected. UNFINISHED — re-run whole batch.

## Resume — batches to re-run from scratch

Use the protocol at `../audit-tasks/coding-protocol.md`, one agent per batch:
1. **B batch 2:** B13 2301.03652, B14 2303.09387, B15 2410.06491, B16 2507.05619, B17 2606.15385, B18 2412.07177
2. **C batch 1:** C6 2401.12187, C7 2402.09345, C8 2405.16436, C9 2503.18130, C10 2505.18126, C11 2505.12763, C12 2510.13694, C13 2502.18770
3. **C batch 3:** C22 2309.16155, C23 2402.10184, C24 2307.15217, C25 2501.09620, C26 2409.19024, C27 2410.05584, C28 2510.03231, C29 2604.01476
4. **C batch 4:** C30 2604.26360, C31 2407.13399 (χPO — other tiers + confirm Duchi–Namkoong genealogy footnote), C32 2509.19104 (DRO-REBEL — annotate ESTIM roles), C33 2502.01930, C34 2604.08577, C35 2503.00539
5. **E+H batch:** E1 1906.01820, E2 2209.00626, H5 2310.19852, H6 2109.13916 (expect Ridgway 1956 — quote verbatim), H7 2505.02666, H8 2506.15421
6. **F batch 2:** F9 2310.16608, F10 2509.02391, F11 2011.00355, F12 2412.02000, F13 2508.14927, F14 2605.06324, F15 2412.16114 (confirm Feltham–Xie + HM1991 verbatim)
7. **G+I batch:** G1 1506.02629, G2 1908.03156, G3 2102.13189, G4 1604.02492, G5 2410.09247, G6 2502.06559, G7 2406.04244; I1 2603.28063 (confirm HM1991 + Baker 1992 verbatim); I2 2605.30916 (confirm HM1991/1987 + Baker 2002 + Strathern); I3 OpenReview Y5qABVr7uB (api.openreview.net + S2 title search; n/a-flag if unreachable — do NOT copy sibling's codes)

After all 13 batches: merge into `audit.md` master table (keep cluster order,
one row per paper), recompute tier totals over N=117 (117 = 24 seed-coded + 93
here; A12/I3 may be n/a), carry ALL verbatim strings + method/completeness
notes + anomalies (esp. the B12 wrong-list S2 caveat and the D3 HM1991
correction), then commit. Task 07 (independent double-verify) follows.
