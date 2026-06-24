# AI/ML-side corpus — proxy-vs-true-objective divergence (Task 01 discovery pool)

**Purpose.** Saturated *candidate pool* for the denominator of the citation-gap
audit: AI/ML papers that formalize or seriously analyze proxy-vs-true-objective
divergence (Goodhart / reward hacking / reward overoptimization / specification
gaming and adjacent strategic-ML failure modes).

**This is a discovery pool, NOT a coded/frozen set.** Inclusion/exclusion is a
later task. Err toward over-inclusion. BORDERLINE items (grey-lit/blogs, pure
benchmark-overfitting, strategic-ML, cross-disciplinary) are flagged inline.

**Discovery date:** 2026-06-24. All API queries / WebSearches recorded inline as
PROVENANCE so each item is auditable.

**APIs used:**
- Semantic Scholar Graph API: `/paper/arXiv:<id>/citations` and `/references` (fields=title,year,externalIds; limit up to 200).
- OpenAlex: `/works/https://doi.org/10.48550/arXiv.<id>` (resolve) and `?filter=cites:<W-id>` (forward cites). OpenAlex cited-by coverage for arXiv preprints was noisy (many off-topic ChatGPT-education hits) and undercounts; S2 forward-citation lists were the workhorse.
- WebSearch (June 2026 index) for keyword families.

Provenance abbreviations: `S2-cite:<id>` = found in Semantic Scholar forward-citation list of arXiv:<id>; `S2-ref:<id>` = in reference list; `WS:"<query gist>"` = WebSearch; `seed` = on the 25-seed list.

---

## Cluster A — Formal Goodhart / proxy-divergence theory (tightest core)

| # | arXiv / venue | Year | Venue | Proxy-divergence content (1 line) | Provenance |
|---|---|---|---|---|---|
| A1 | 1803.04585 | 2018 | (preprint/MIRI) | **SEED.** Categorizing variants of Goodhart's law (regressional/extremal/causal/adversarial); the AI-safety taxonomy anchor. | seed |
| A2 | 2209.13085 | 2022 | NeurIPS 2022 | **SEED.** First formal def of reward hacking; "unhackable" = monotone proxy⇒true; impossibility for all stochastic policies. | seed |
| A3 | 2310.09144 | 2023 | NeurIPS 2023 | **SEED.** Goodhart's law in RL; proves over-optimizing imperfect proxy past a critical point decreases true performance; optimal early-stopping w/ regret bounds. | seed; WS:"Goodhart RL formal" |
| A4 | 2410.09638 | 2024 | (preprint) | **SEED.** El-Mhamdi & Hoang: Goodhart depends on tail of goal–proxy discrepancy; weak vs strong Goodhart. | seed |
| A5 | 2505.23445 | 2025 | (preprint) | **SEED.** Majka & El-Mhamdi: strong/weak/benign Goodhart; independence-free, paradigm-agnostic formalisation. | seed; S2-cite:2410.09638 |
| A6 | 2407.14503 | 2024 | NeurIPS 2024 | **SEED.** Kwa et al. "Catastrophic Goodhart": KL-regularized RLHF fails under heavy-tailed reward error; tail-distribution result. | seed; S2-cite:2102.03896; WS:"Catastrophic Goodhart" |
| A7 | 2102.03896 | 2021/22 | AAAI 2022 | **SEED.** Zhuang & Hadfield-Menell "Consequences of Misaligned AI"; optimizing incomplete proxy of multi-attribute utility makes things worse. | seed |
| A8 | 2510.02840 | 2025 | (preprint) | "Take Goodhart Seriously": principled limit on general-purpose AI optimization. | S2-cite:2410.09638; WS:"Goodhart formal paper" |
| A9 | 2603.15017 | 2026 | (preprint) | "Consequentialist Objectives and Catastrophe" — formal catastrophe conditions under proxy optimization. | S2-cite:2410.09638 |
| A10 | 2506.19248 | 2025 | (preprint) | "Inference-Time Reward Hacking in LLMs" — formal analysis of best-of-n / proxy gap at inference. | S2-cite:2410.09638; WS:"Goodhart RL" |
| A11 | 2602.13934 | 2026 | (preprint) | "Why Code, Why Now: Information-Theoretic Perspective on Limits of ML" (cites El-Mhamdi Goodhart). | S2-cite:2410.09638 |
| A12 | "On the Strength of Causal Goodhart's Law" | (n.d.) | (preprint, no arXiv id captured) | Causal-Goodhart strengthening result. **FLAG: id unverified — needs lookup.** | S2-cite:2410.09638 |
| A13 | 2011.01010 | 2020 | (preprint) | **SEED-ADJACENT (Ashton 2021).** "Causal Campbell-Goodhart's law and RL"; causal variant in RL agents. | seed; S2-cite:1803.04585 |
| A14 | 1810.10862 | 2018 | (preprint) | Manheim "Overoptimization Failures and Specification Gaming in Multi-agent Systems"; multi-agent Goodhart. | S2-cite:1803.04585 |
| A15 | 2002.08512 | 2020 | (preprint/essay) | Thomas & Uesato "Reliance on metrics is a fundamental challenge for AI" ("The problem with metrics…"). **BORDERLINE: position/essay.** | S2-cite:1803.04585; WS:"Goodhart taxonomy" |

---

## Cluster B — Reward hacking / specification gaming (RL, formal + empirical)

| # | arXiv / venue | Year | Venue | Content | Provenance |
|---|---|---|---|---|---|
| B1 | 1606.06565 | 2016 | (preprint) | **SEED.** Amodei et al. "Concrete Problems in AI Safety"; reward hacking as a concrete problem; the canonical anchor. | seed |
| B2 | 2201.03544 | 2022 | ICLR 2022 | **SEED.** Pan et al. "Effects of Reward Misspecification"; capable agents exploit misspecified reward; phase transitions in true reward. | seed; WS:"reward misspecification Pan" |
| B3 | 2403.03185 | 2024 | (preprint) | **SEED.** Laidlaw et al. "Correlated Proxies"; new def of reward hacking via reference-policy correlation + mitigation. | seed; S2-cite:2209.13085 |
| B4 | 1811.07871 | 2018 | (preprint) | **SEED.** Leike et al. "Scalable agent alignment via reward modeling"; reward-modeling research direction. | seed |
| B5 | 1908.04734 | 2019 | (preprint) | **SEED.** Everitt et al. "Reward Tampering Problems and Solutions" (causal influence diagrams). | seed; WS:"reward tampering" |
| B6 | 1705.08417 | 2017 | (preprint) | Everitt et al. "RL with a Corrupted Reward Channel"; CRMDPs — foundational reward-corruption formalism. | WS:"reward corruption" |
| B7 | 1907.00452 | 2019 | (preprint) | "Detecting Spiky Corruption in MDPs" (reward corruption detection). | WS:"reward corruption RL" |
| B8 | 2011.08820 | 2020 | (preprint) | "REALab: An Embedded Perspective on Tampering". | WS:"specification gaming RL" |
| B9 | 2105.14111 | 2021 | NeurIPS 2021 | Langosco et al. "Goal Misgeneralization in Deep RL"; capabilities generalize but goal/proxy does not. | S2-cite:2102.03896; WS:"Goal Misgeneralization" |
| B10 | 2210.01790 | 2022 | (preprint) | Shah et al. "Goal Misgeneralization: Why Correct Specifications Aren't Enough For Correct Goals"; broad goal-misgeneralization across learning systems. (id verified via S2) | WS:"Goal Misgeneralization Shah" |
| B11 | 2312.03762 | 2023 | (preprint) | "Colour vs Shape Goal Misgeneralization in RL: A Case Study". | WS:"Goal Misgeneralization" |
| B12 | 2204.06601 | 2022 | (preprint) | "Causal Confusion and Reward Misidentification in Preference-Based Reward Learning". | WS:"specification gaming proxy" |
| B13 | 2301.03652 | 2023 | (preprint) | "On the Fragility of Learned Reward Functions". | S2-cite:2209.13085; S2-cite:2102.03896 |
| B14 | 2303.09387 | 2023 | (preprint) | "Characterizing Manipulation from AI Systems". | S2-cite:1803.04585; S2-cite:2209.13085 |
| B15 | 2410.06491 | 2024 | (preprint) | "Honesty to Subterfuge: In-Context RL Can Make Honest Models Reward Hack". | WS:"specification gaming" |
| B16 | 2507.05619 | 2025 | (preprint) | "Detecting Proxy Gaming in RL and LLM Alignment via Evaluator Stress Tests". | WS:"reward hacking formal"; WS:"specification gaming" |
| B17 | 2606.15385 | 2026 | (preprint) | "Reward Hacking in LM Agents: Revisiting AI Safety Gridworlds". | WS:"specification gaming DeepMind" |
| B18 | 2412.07177 | 2024 | (thesis/preprint) | "Effective Reward Specification in Deep RL". | WS:"specification gaming" |
| B19 | 2211.08714 | 2022 | ACL 2023 | "Reward Gaming in Conditional Text Generation" (proxy gaming in NLG). (id verified via S2) | S2-cite:2209.13085 |
| B20 | 2308.15605 | 2023 | (preprint) | "Benchmarks for Detecting Measurement Tampering". | S2-cite:2102.03896 |
| B21 | 2604.15149 | 2026 | (preprint) | "LLMs Gaming Verifiers: RLVR can Lead to Reward Hacking". | S2-cite:2209.13085 |
| B22 | 2604.13602 | 2026 | (survey) | **SEED (Wang 2026).** "Reward Hacking in the Era of Large Models" survey. | seed; WS:"reward hacking" |
| B23 | 2507.18742 | 2025 | (preprint) | "Specification Self-Correction: Mitigating In-Context Reward Hacking". | S2-cite:2209.13085 |
| B24 | 2510.01367 | 2025 | (preprint) | "Is It Thinking or Cheating? Detecting Implicit Reward Hacking by Reasoning Effort". | S2-cite:2209.13085 |
| B25 | 2510.13036 | 2025 | (preprint) | "Repairing Reward Functions with Feedback to Mitigate Reward Hacking". | S2-cite:2209.13085 |
| B26 | Krakovna et al. "Specification Gaming: the flip side of AI ingenuity" | 2020 | DeepMind blog | **SEED (Krakovna 2020). BORDERLINE: grey-lit/blog.** Spec-gaming examples list. | seed; WS:"specification gaming DeepMind" |
| B27 | Krakovna "Classifying specification problems as variants of Goodhart's Law" | 2019 | blog | **BORDERLINE: grey-lit/blog.** Maps spec problems onto Goodhart taxonomy. | WS:"Goodhart taxonomy" |
| B28 | Garrabrant "Goodhart Taxonomy" | 2017 | LessWrong | **BORDERLINE: grey-lit/blog.** Origin of regressional/extremal/causal/adversarial taxonomy (cited by Manheim-Garrabrant). | S2-ref:1803.04585; WS:"Goodhart taxonomy" |
| B29 | Sohl-Dickstein "Too much efficiency makes everything worse: overfitting and the strong version of Goodhart's law" | 2022 | blog | **BORDERLINE: grey-lit/blog.** Strong-Goodhart-via-overfitting argument. | WS:"tails come apart Goodhart" |
| B30 | "Why the tails come apart" (Thrasymachus) | 2014 | LessWrong | **BORDERLINE: grey-lit/blog.** Tail-decoupling intuition cited by Manheim-Garrabrant. | S2-ref:1803.04585; WS:"tails come apart" |

---

## Cluster C — Reward-model overoptimization / RLHF (proxy reward vs gold reward)

| # | arXiv / venue | Year | Venue | Content | Provenance |
|---|---|---|---|---|---|
| C1 | 2210.10760 | 2022 | ICML 2023 | **SEED.** Gao/Schulman/Hilton "Scaling Laws for Reward Model Overoptimization"; gold-vs-proxy reward; functional form of overoptimization. | seed |
| C2 | 2406.02900 | 2024 | (preprint) | **SEED.** Rafailov et al. "Scaling Laws for RM Overoptimization in Direct Alignment Algorithms" (DPO/DAA overoptimization). | seed; WS:"reward overoptimization scaling laws" |
| C3 | 2310.02743 | 2023 | (preprint) | **SEED.** Coste et al. "Reward Model Ensembles Help Mitigate Overoptimization" (WCO/UWO). | seed; S2-cite:2102.03896; WS:"reward overoptimization ensemble" |
| C4 | 2312.09244 | 2023 | (preprint) | **SEED.** Eisenstein et al. "Helping or Herding? Reward model ensembles mitigate but don't eliminate reward hacking". | seed |
| C5 | 2310.04373 | 2023 | (preprint) | **SEED.** Moskovitz et al. "Confronting Reward Model Overoptimization with Constrained RLHF". | seed; WS:"reward overoptimization constrained" |
| C6 | 2401.12187 | 2024 | (preprint) | "WARM: Weight Averaged Reward Models" (mitigate overoptimization). | S2-cite:2310.09144; WS:"reward overoptimization WARM" |
| C7 | 2402.09345 | 2024 | (preprint) | "InfoRM: Mitigating Reward Hacking in RLHF via Information-Theoretic Reward Modeling". | WS:"reward overoptimization"; WS:"reward hacking survey" |
| C8 | 2405.16436 | 2024 | (preprint) | "Provably Mitigating Overoptimization in RLHF: SFT Loss as Adversarial Regularizer". | WS:"reward overoptimization mitigation" |
| C9 | 2503.18130 | 2025 | (preprint) | "Mitigating Reward Over-Optimization in RLHF via Behavior-Supported Regularization". | WS:"reward overoptimization mitigation" |
| C10 | 2505.18126 | 2025 | (preprint) | "Reward Model Overoptimisation in Iterated RLHF". | S2-cite:2309.15257; WS:"reward overoptimization" |
| C11 | 2505.12763 | 2025 | (preprint) | "Rethinking Reward Model Evaluation Through the Lens of Reward Overoptimization". | S2-cite:1803.04585 |
| C12 | 2510.13694 | 2025 | (preprint) | "Information-Theoretic Reward Modeling for Stable RLHF: Detecting/Mitigating Reward Hacking". | WS:"reward overoptimization" |
| C13 | 2502.18770 | 2025 | (preprint) | "Reward Shaping to Mitigate Reward Hacking in RLHF". | WS:"reward hacking survey" |
| C14 | 2602.10623 | 2026 | (preprint) | "Mitigating Reward Hacking in RLHF via Bayesian Non-negative Reward Modeling". | WS:"reward hacking survey" |
| C15 | 2604.12086 | 2026 | (preprint) | "Robust Optimization for Mitigating Reward Hacking with [reward models]". | WS:"reward hacking formal" |
| C16 | 2606.04145 | 2026 | (preprint) | "EvalStop: Detect/Correct Reward Overoptimization in Multi-Tenant RLHF". | S2-cite:2209.13085 |
| C17 | 2603.06797 | 2026 | (preprint) | "Best-of-Tails: Bridging Optimism and Pessimism in Inference-Time Alignment" (tail-aware). | WS:"tails come apart"; WS:"Catastrophic Goodhart" |
| C18 | 2604.10727 | 2026 | (preprint) | "Tail-Aware Information-Theoretic Generalization for RLHF and SGLD". | WS:"Catastrophic Goodhart" |
| C19 | 2310.03716 | 2023 | (preprint) | "A Long Way to Go: Investigating Length Correlations in RLHF" (length-bias proxy gaming). | S2-cite:2209.13085; S2-cite:2102.03896 |
| C20 | 2310.05199 | 2023 | EMNLP-findings 2023 | "Loose lips sink ships: Mitigating Length Bias in RLHF". | S2-cite:2209.13085; OpenAlex cites:Gao |
| C21 | 2403.19159 | 2024 | (preprint) | "Disentangling Length from Quality in DPO". | S2-cite:1803.04585 |
| C22 | 2309.16155 | 2023 | (preprint) | "The Trickle-down Impact of Reward (In-)consistency on RLHF". | S2-cite:1803.04585 |
| C23 | 2406.02900-adjacent: 2402.10184 | 2024 | (preprint) | "Reward Generalization in RLHF: A Topological Perspective". | WS:"reward overoptimization scaling laws" |
| C24 | 2307.15217 | 2023 | (preprint) | Casper et al. "Open Problems and Fundamental Limitations of RLHF" (overoptimization as a named limitation). | S2-cite:1803.04585; S2-cite:2209.13085 |
| C25 | 2501.09620 | 2025 | (preprint) | "Beyond Reward Hacking: Causal Rewards for LLM Alignment". | WS:"reward misspecification" |
| C26 | 2409.19024 | 2024 | (preprint) | "Elephant in the Room: Impact of Reward Model Quality in Alignment". | S2-cite:1803.04585 |
| C27 | 2410.05584 | 2024 | (preprint) | "Rethinking Reward Model Evaluation: Are We Barking up the Wrong Tree?". | S2-cite:1803.04585; S2-cite:2309.15257 |
| C28 | 2510.03231 | 2025 | (preprint) | "Reward Models are Metrics in a Trench Coat" (RM = metric ⇒ Goodhart). | S2-cite:1803.04585 |
| C29 | 2604.01476 | 2026 | (preprint) | "When Reward Hacking Rebounds: Mitigating with Representation-Level Signals". | S2-cite:2209.13085 |
| C30 | 2604.26360 | 2026 | (preprint) | "Uncertainty-Aware Reward Discounting for Mitigating Reward Hacking". | S2-cite:2209.13085 |

(Cluster C is the highest-volume / fastest-growing region; the above is a representative saturating sample, not every RLHF-mitigation paper — see Saturation Note.)

---

## Cluster D — Reward learning / IRD / IRL misspecification (proxy = learned objective)

| # | arXiv / venue | Year | Venue | Content | Provenance |
|---|---|---|---|---|---|
| D1 | 1711.02827 | 2017 | NeurIPS 2017 | **SEED.** Hadfield-Menell et al. "Inverse Reward Design"; true reward as latent behind a proxy reward. | seed |
| D2 | 1606.03137 | 2016 | NeurIPS 2016 | **SEED-adjacent.** Hadfield-Menell et al. "Cooperative Inverse RL" (CIRL). | seed (reverse-sweep); S2-ref:1606.06565 |
| D3 | 1611.08219 | 2016/17 | IJCAI 2017 | **SEED-adjacent.** Hadfield-Menell et al. "The Off-Switch Game". (id verified via WebSearch) | seed (reverse-sweep) |
| D4 | 2212.03201 | 2022 | NeurIPS 2022 | **SEED.** Skalse & Abate "Misspecification in Inverse RL"; when does proxy reward recover true reward. | seed; S2-cite:2209.13085 |
| D5 | 2309.15257 | 2023 | (preprint) | **SEED.** Skalse et al. STARC; pseudometric quantifying differences between reward functions. | seed; S2-cite:2209.13085 |
| D6 | 2403.06854 | 2024 | (preprint) | "Quantifying the Sensitivity of IRL to Misspecification". | S2-cite:2309.15257 |
| D7 | "Partial identifiability and misspecification in IRL" | 2026 | JMLR? | Partial identifiability of reward under proxy/misspecification. **FLAG: arXiv id not captured.** | S2-cite:2209.13085; S2-cite:2309.15257 |
| D8 | 2312.08358 | 2023 | (preprint) | "Distributional Preference Learning: Hidden Context in RLHF". | S2-cite:2102.03896 |
| D9 | 2412.16475 | 2024 | (preprint) | "When Can Proxies Improve the Sample Complexity of Preference Learning?". | S2-cite:2310.09144 |

---

## Cluster E — Mesa-optimization / inner alignment (proxy = mesa-objective)

| # | arXiv / venue | Year | Venue | Content | Provenance |
|---|---|---|---|---|---|
| E1 | 1906.01820 | 2019 | (preprint) | Hubinger et al. "Risks from Learned Optimization"; proxy-aligned mesa-optimizer optimizes a proxy of the base objective. | S2-cite:1803.04585; WS:"mesa-optimization inner alignment" |
| E2 | 2209.00626 | 2022 | (preprint) | Ngo et al. "The Alignment Problem from a Deep Learning Perspective" (specification gaming + goal misgeneralization). | S2-cite:1803.04585; S2-cite:2102.03896 |

(Mesa-optimization is mostly grey-lit/blog beyond E1–E2; flagged as a thin AI-side cluster — most inner-alignment writing is non-archival.)

---

## Cluster F — Strategic ML / performative prediction / strategic classification (BORDERLINE: distinct sub-literature)

**Note:** This cluster is the *strategic-ML* formalization of metric/proxy gaming. It is its own large self-citing community (econ-CS / FAccT / EC) that often invokes Goodhart explicitly but is a distinct lineage from the AI-safety reward-hacking corpus. Included for completeness as a candidate denominator region; a later task should decide whether the audit's scope includes it. Volume is very large (Hardt-2016 alone has 100s of arXiv descendants); below is a representative saturating sample.

| # | arXiv / venue | Year | Venue | Content | Provenance |
|---|---|---|---|---|---|
| F1 | 1506.06980 | 2015/16 | ITCS 2016 | Hardt, Megiddo, Papadimitriou, Wootters "Strategic Classification"; agents game classifier ⇒ accuracy degrades (named Goodhart). | WS:"strategic classification Hardt" |
| F2 | 2002.06673 | 2020 | ICML 2020 | Perdomo et al. "Performative Prediction"; predictions shift the distribution; performative stability. | WS:"strategic classification performative" |
| F3 | 1910.10362 | 2019 | (preprint) | Miller, Milli, Hardt "Strategic Classification is Causal Modeling in Disguise". | WS:"strategic classification Hardt" |
| F4 | 2106.12705 | 2021 | (preprint) | "Alternative Microfoundations for Strategic Classification". | WS:"strategic classification performative" |
| F5 | 2204.01884 | 2022 | (preprint) | "Policy Learning with Competing Agents". | WS:"strategic classification performative" |
| F6 | 2411.08998 | 2024 | (preprint) | "Microfoundation Inference for Strategic Prediction". | WS:"strategic classification"; S2-cite:2002.06673 |
| F7 | 2408.05146 | 2024 | (preprint) | "Performative Prediction on Games and Mechanism Design". | S2-cite:2002.06673; WS:"strategic classification" |
| F8 | 2602.10176 | 2026 | (survey) | "Dissecting Performative Prediction: A Comprehensive Survey". | WS:"strategic classification performative" |
| F9 | 2310.16608 | 2023 | (preprint) | "Performative Prediction: Past and Future" (review). | S2-cite:1506.06980 |
| F10 | 2509.02391 | 2025 | (preprint) | "Gaming and Cooperation in Federated Learning" (Goodhart-framed). | S2-cite:1803.04585; WS:"strategic classification" |
| F11 | 2011.00355 | 2020 | (preprint) | "Linear Classifiers that Encourage Constructive Adaptation". | WS:"strategic classification Hardt" |
| F12 | 2412.02000 | 2024 | (preprint) | "Who's Gaming the System? Causally-Motivated Detection of Strategic Adaptation". | WS:"strategic classification Hardt" |
| F13 | 2508.14927 | 2025 | (preprint) | "AI Testing Should Account for Sophisticated Strategic Behaviour". | S2-cite:1803.04585 |
| F14 | 2605.06324 | 2026 | (preprint) | "Gaming the Metric, Not the Harm: Certifying Safety Audits against Strategic Platform Manipulation". | S2-cite:2209.13085 |

(Dozens more performative/strategic-classification descendants exist — e.g. 2405.19073 "performative power", 2411.05234 "performative RL", 2412.01344 — captured in the S2-cite:2002.06673 / 1506.06980 lists on file but not all transcribed; this region is *saturated by lineage*, not paper-by-paper.)

---

## Cluster G — Benchmark / leaderboard / holdout overfitting (BORDERLINE: pure benchmark-overfitting)

**Note:** Adaptive-data-analysis (ADA) is the statistics-side formalization of "optimizing a held-out metric corrupts it" — arguably the cleanest math match to multi-dimensional Goodhart, but it is *not* AI-safety-framed. Flagged BORDERLINE; relevance to the audit is a later call.

| # | arXiv / venue | Year | Venue | Content | Provenance |
|---|---|---|---|---|---|
| G1 | 1506.02629 | 2015 | NeurIPS 2015 / Science | Dwork et al. "Generalization in Adaptive Data Analysis and Holdout Reuse" (reusable holdout). **BORDERLINE: statistics, not AI-safety.** | WS:"leaderboard overfitting ADA" |
| G2 | 1908.03156 | 2019 | (preprint) | Blum & Hardt "The Ladder: A Reliable Leaderboard for ML Competitions". **BORDERLINE.** | WS:"leaderboard overfitting" |
| G3 | 2102.13189 | 2021 | (preprint) | "Rip van Winkle's Razor: A Simple Estimate of Overfit to Test Data". **BORDERLINE.** | WS:"leaderboard overfitting" |
| G4 | 1604.02492 | 2016 | (preprint) | "Challenges in Bayesian Adaptive Data Analysis". **BORDERLINE.** | WS:"leaderboard overfitting" |
| G5 | 2410.09247 | 2024 | (preprint) | "Benchmark Inflation: Revealing LLM Performance Gaps Using Retro-Holdouts". **BORDERLINE: benchmark-gaming, LLM-era.** | WS:"benchmark gaming contamination" |
| G6 | 2502.06559 | 2025 | (preprint) | "Can We Trust AI Benchmarks? Interdisciplinary Review" (Goodhart-framed). **BORDERLINE.** | WS:"benchmark gaming" |
| G7 | 2406.04244 | 2024 | (survey) | "Benchmark Data Contamination of LLMs: A Survey". **BORDERLINE.** | WS:"benchmark gaming" |

---

## Cluster H — Surveys & reviews (proxy-divergence covered as a topic)

| # | arXiv / venue | Year | Venue | Content | Provenance |
|---|---|---|---|---|---|
| H1 | 2504.12328 | 2025 | (survey) | **SEED (Zhong 2025).** "Comprehensive Survey of Reward Models" — overoptimization/hacking taxonomy. | seed; S2-cite:2209.13085 |
| H2 | 2312.14925 | 2023 | (survey) | **SEED (Kaufmann 2023).** "Survey of RLHF" (incl. overoptimization). | seed |
| H3 | 2604.13602 | 2026 | (survey) | **SEED (Wang 2026).** Reward-hacking survey (also B22). | seed |
| H4 | 2307.15217 | 2023 | (survey/position) | Casper et al. RLHF open-problems (also C24). | S2-cite:2209.13085 |
| H5 | 2310.19852 | 2023 | (survey) | Ji et al. "AI Alignment: A Comprehensive Survey". | WS:"Goal Misgeneralization survey" |
| H6 | 2109.13916 | 2021 | (preprint) | Hendrycks et al. "Unsolved Problems in ML Safety" (proxy gaming as a problem). | S2-cite:1803.04585 |
| H7 | 2505.02666 | 2025 | (survey) | "Survey on Progress in LLM Alignment from the Perspective of Reward Design". | S2-cite:2209.13085 |
| H8 | 2506.15421 | 2025 | (survey) | "Reward Models in Deep RL: A Survey". | S2-cite:2309.15257 |

---

## Cross-disciplinary bridge papers found on the AI side (flag for the OTHER-side task)

These surfaced while sweeping the AI corpus and are *already* cross-field — likely belong to the econ/management/stats side or the bridge:

- **"Dead rats, dopamine, performance metrics, and peacock tails: Proxy failure is an inherent risk in goal-oriented systems"** — John, Caldwell, McCoy, Braganza, *Behavioral and Brain Sciences* 2023. Explicitly unifies Goodhart/Campbell/cobra-effect across econ, academia, ML, ecology. (S2-cite:2102.03896; WS:"proxy failure dead rats") **Strong cross-field anchor — flag for the bridge/other-side task.**
- **Proxyeconomics** series (Braganza): 1803.00345 "Proxyeconomics, the inevitable corruption of proxy-based competition" + 2022 model paper. (S2-cite:1803.04585) **Econ-side; flag.**
- Hennessy & Goodhart 2023 (IER 64(3)) — **SEED**, but econ-venue; belongs to other-side task.

---

## SATURATION NOTE

**Saturation reached.** By the final sweeps, new keyword queries and citation
expansions were returning predominantly duplicates of items already in the pool.

Per-family saturation status:
- **Formal Goodhart (A):** SATURATED. The El-Mhamdi (2410.09638) and Manheim-Garrabrant (1803.04585) citation neighborhoods plus "Goodhart formal" searches converge on the same ~15 items; new hits (Take Goodhart Seriously, Consequentialist Objectives) were the last novelties.
- **Reward hacking / spec gaming (B):** SATURATED at the level of *canonical/anchor* papers; the long tail of 2025-26 application papers (RLVR, agent-specific) is effectively unbounded and self-similar — sampled, not enumerated.
- **RLHF overoptimization (C):** NOT individually exhaustible — this is the fastest-growing region (the Skalse-2022 forward-citation list alone had 150+ entries, mostly 2025-26 mitigation papers). Captured a representative saturating sample covering every distinct mechanism (ensembles, constraints, info-theoretic, weight-averaging, tail-aware, length-bias). New queries returned only more same-shape mitigation papers ⇒ saturated by *kind*.
- **Reward learning / IRL (D):** SATURATED (small, tight cluster around Skalse/Hadfield-Menell).
- **Mesa-optimization (E):** SATURATED but thin on the archival side (most content is grey-lit/blog, intentionally not chased here).
- **Strategic ML / performative (F):** SATURATED BY LINEAGE, not paper-by-paper. The Hardt-2016 and Perdomo-2020 descendant trees are enormous (100s); recorded the anchors + a representative sample + the survey. A later scope call should decide whether this whole lineage is in the audit denominator.
- **Benchmark/ADA overfitting (G):** SATURATED on the foundational ADA papers (Dwork, Blum-Hardt) + LLM-era benchmark-gaming; flagged BORDERLINE.
- **Surveys (H):** SATURATED.

**Pool completeness estimate.** For the *core* AI-safety proxy-divergence
literature (clusters A, B-anchors, C-mechanisms, D, E, H) I estimate this pool is
~90%+ complete at the level of distinct, citable, conceptually-novel papers.
Clusters C (application tail), F, and G are *open-ended by construction* and are
represented by anchors + saturating samples rather than full enumeration — that
is appropriate for a denominator population since the audit's "does X cite the
econ prior art" question turns on the anchor/canonical papers, not on every
2026 RLVR mitigation preprint.

**Items flagged as unverified (need a lookup before any coding):** A12 ("On the
Strength of Causal Goodhart's Law", no arXiv id — appears in S2 citation list of
2410.09638 without an id) and D7 ("Partial identifiability and misspecification in
IRL", no id captured). Flagged rather than guessed. (B10 → 2210.01790, B19 →
2211.08714, D3 → 1611.08219 were verified via S2/WebSearch during discovery and
are no longer flagged.)
