# Auditing the Structural Bridge: A Skeptical Assessment of Citation Gaps Between Economic Contract Theory, Robust Statistics, and AI Reward Overoptimization

The claim under audit asserts that the machine learning and artificial intelligence safety literature addressing Goodhart's law, reward hacking, and reward-model overoptimization has fundamentally reinvented mathematical results proven decades earlier in economics, accounting, and statistics without providing proper citations. Specifically, the claim states that the performance-measurement/congruity prior art (Feltham–Xie 1994, Banker–Datar 1989, Baker 1992/2002, Datar–Kulp–Lambert 2001, Bénabou–Tirole 2016) and the estimation/$\chi^2$-distributionally robust optimization (DRO) prior art (Hammersley–Chapman–Robbins, Ben-Tal et al. 2013, Namkoong–Duchi 2017) are not cited by the formal-Goodhart or reward-overoptimization literature in a way that connects them directly to Goodhart's law or proxy-vs-true-objective divergence.

This audit aggressively stress-tests this claim. Acting as a skeptical, hostile referee, this analysis assumes that cross-disciplinary bridges must exist and seeks out the specific citations that would refute the claim of a total literature gap. To establish a rigorous evaluation, every identified citation is classified into one of three categories:

- **Type (i):** The paper cites the prior art and explicitly connects it to Goodhart's law, reward hacking, or reward overoptimization, thereby refuting the claim of a gap for that item.
- **Type (ii):** The paper cites the prior art but for an entirely different purpose (e.g., control theory, off-switch safety, robust temporal difference learning, distributionally robust training on subpopulations, fairness, or historical genealogy/folklore), which does not refute the claim.
- **Type (iii):** The prior art is not cited at all by the relevant safety corpus.

## Evaluation of the Congruity and Performance-Measurement Branch

The performance-measurement and congruity literature in economic contract theory addresses the classic multi-task principal-agent problem, wherein a principal must incentivize an agent using noisy, incomplete performance metrics. The mathematical formulations in this branch—such as Baker's metric of distortion represented by $1 - \cos\theta$—measure the angular divergence between the sensitivity of a performance proxy and the true organizational value objective. This formulation is mathematically isomorphic to the alignment problem in machine learning, where an optimization algorithm exploits the geometric divergence between an empirical reward model proxy and the true human utility function.

A systematic search of the reward-hacking and formal-Goodhart literature reveals that while the citation gap was historically absolute, a cluster of highly recent papers published between 2023 and 2026 has successfully constructed explicit Type (i) bridges to portions of this economic prior art.

### The Multi-Task Finite Evaluation Bridge

The formal-Goodhart literature has recently achieved a direct mathematical integration of contract theory. In the work *Reward Hacking as Equilibrium under Finite Evaluation* (Wang & Huang, 2026), the authors explicitly address the structural inevitability of reward hacking by instantiating the multi-task principal-agent model of Holmstrom and Milgrom (1991) and the performance distortion framework of Baker (1992).

Rather than treating reward hacking as an engineering anomaly, this work proves that under finite evaluation, any optimized AI agent will systematically under-invest effort in quality dimensions not covered by its evaluation system, establishing reward hacking as a structural equilibrium. By exploiting the differentiable architecture of modern reward models, the paper derives a computable distortion index directly descended from Baker's multidimensional incentive distortion framework. This represents a definitive Type (i) refutation for Holmstrom-Milgrom (1991) and Baker (1992).

### The Benchmark Aggregation and Welfare Bridge

A parallel Type (i) bridge occurs in the benchmarking and evaluation literature. In *Welfare, Improvability, and Variance: A Principal–Agent Approach to Optimal Benchmark Item Aggregation* (Haupt et al., 2026), the authors model benchmarking as a multi-task principal-agent game.

The paper adapts the multi-task framework of Holmstrom and Milgrom (1991) to analyze how test-item aggregation rules steer the development efforts of machine learning laboratories. It explicitly references Baker (2002) to define how a single scalar index applied to a multidimensional capability reallocates effort toward what is measured and away from what is valued, mapping this phenomenon directly to the canonical Goodhart/Campbell pathology. This work provides a mathematically rigorous Type (i) connection linking benchmark gaming and reward overoptimization to economic incentive distortion.

### The Qualitative Proxy Failure Bridge

In the interdisciplinary literature examining the cognitive and biological underpinnings of optimization pathologies, a qualitative Type (i) bridge has been established. The paper *Dead Rats, Dopamine, Performance Metrics, and Peacock Tails: Proxy Failure is an Inherent Risk in Goal-Oriented Systems* (McCoy et al., 2023) unifies various Goodhart-like phenomena under the term "proxy failure".

The authors explicitly cite Baker (2002) and Bénabou & Tirole (2016) to show how a principal's incentive schemes are gamed by rational agents in economic systems, and they use this economic foundation to explain why reinforcement learning agents exploit vulnerabilities in automated reward functions. Because this paper lacks a formal mathematical theorem linking the two, it represents a borderline qualitative Type (i) bridge, yet it successfully refutes the claim of a complete literature separation for Bénabou & Tirole (2016).

### Persistent Architectural Gaps

Despite these recent breakthroughs, several critical pillars of the performance-measurement literature remain entirely un-cited by the reward-hacking and overoptimization corpus. The foundational linear agency frameworks of Feltham and Xie (1994) and Banker and Datar (1989) are entirely absent.

These papers proved how performance measure congruity and noise interact to determine total agency surplus, and they established the necessary and sufficient conditions for linear aggregation of performance measures. Similarly, the multi-measure weighting insights of Datar, Kulp, and Lambert (2001) are un-cited, forcing the modern RLHF multi-objective optimization literature to re-derive similar trade-offs in isolation.

| Prior-Art Reference | Citing ML Safety Paper | Citation Type | Citing Context and Evaluative Verdict |
| --- | --- | --- | --- |
| Holmstrom & Milgrom (1991) | *Reward Hacking as Equilibrium under Finite Evaluation* (Wang & Huang, 2026) | Type (i) | Refutes the gap. Citing context: "Our framework instantiates the multi-task principal-agent model of Holmstrom and Milgrom (1991) in the AI alignment setting... to derive a computable distortion index". |
| Baker (1992, 2002) | *Welfare, Improvability, and Variance* (Haupt et al., 2026) | Type (i) | Refutes the gap. Citing context: "The lessons generalize known multitask-distortion findings from manager incentives (Baker, 2002)... predictably reallocates effort toward what is measured". |
| Bénabou & Tirole (2006, 2016) | *Dead Rats, Dopamine...* (McCoy et al., 2023) | Type (i) | Refutes the gap qualitatively. Citing context: "The economics literature abounds with analogous cases: A 'principal's' incentive schemes are 'gamed' by rational agents (Baker, 2002; Bénabou & Tirole, 2016)". |
| Feltham & Xie (1994) | None | Type (iii) | Confirms the gap. The mathematics of performance measure congruity under multiple tasks remain un-cited in the reward-modeling literature. |
| Banker & Datar (1989) | None | Type (iii) | Confirms the gap. The informativeness principle and linear aggregation weights are entirely omitted from the formal-Goodhart corpus. |
| Datar, Kulp, & Lambert (2001) | None | Type (iii) | Confirms the gap. Relative weights of financial and nonfinancial measures are not cited to explain multi-objective reward aggregation. |

## Evaluation of the Estimation, HCR, and Distributionally Robust Optimization Branch

The estimation and distributionally robust optimization (DRO) prior art addresses the statistical challenge of optimizing decisions under uncertainty and model misspecification. In classical statistics, the Hammersley-Chapman-Robbins (HCR) lower bound establishes a non-parametric limit on the variance of estimators, which is crucial when standard regularity conditions fail. In modern optimization, $\chi^2$-DRO and KL-DRO formulations protect estimators from distribution shift by bounding the worst-case expected loss over a designated ambiguity set.

In the context of reward model overoptimization, these mathematical tools are highly relevant: the policy acts as an optimizer seeking out local inaccuracies in a proxy reward model, and bounding the policy's deviation within a distributionally robust region is mathematically equivalent to setting uncertainty-aware pessimism penalties.

### The KL-DRO and Pessimism Equivalence

A powerful Type (i) refutation of the citation gap in this branch is found in *A Unifying Lens on Reward Uncertainty in RLHF* (2026). The authors address the bottleneck of reward hacking by replacing scalar reward models with a distributional reward model $p(r \mid x,y)$.

They formally prove that under a KL-regularized RLHF objective, both a Bayesian inference framework and a KL-distributionally robust optimization (KL-DRO) framework yield the exact same closed-form pessimistic effective reward. Crucially, the paper explicitly cites Ben-Tal et al. (2009) and Hansen & Sargent (2008) to anchor this AI safety mitigation directly in the robust optimization prior art.

### The Modern DRO LLM Alignment Bridge

Another significant Type (i) exception has emerged with the development of distributionally robust preference fine-tuning algorithms designed to counter reward hacking. In *DRO-REBEL: Distributionally Robust Relative-Reward Regression for Fast and Efficient LLM Alignment* (Sahu et al., 2025/2026), the authors construct robust policy updates using type-$p$ Wasserstein, KL, and $\chi^2$ ambiguity sets.

To establish the statistical properties and generalization limits of these robust models under preference shift, the paper explicitly utilizes and cites the statistical limit theorems of Blanchet and Shapiro (2023) and Blanchet et al. (2021). This represents a successful Type (i) bridge linking modern distributionally robust optimization theory to the prevention of reward overoptimization.

### Orthogonal and Absent Citations

Outside of these recent breakthroughs, much of the traditional estimation prior art is either cited for completely unrelated purposes or omitted entirely.

The Hammersley-Chapman-Robbins (HCR) bound is cited in distributional reinforcement learning to establish efficient temporal difference estimators under leptokurtic, outlier-heavy reward distributions. It is also cited in cyber-physical systems literature to analyze and mitigate training-data privacy leakage. Because these citations are not connected to proxy overoptimization or Goodhart's law, they are classified as Type (ii).

Furthermore, a significant gap exists in the occupancy-measure regularization literature. In *Preventing Reward Hacking with Occupancy Measure Regularization* (Laidlaw et al., 2024), the authors introduce the ORPO algorithm, which regularizes the policy's state occupancy measure using $\chi^2$ and $\sqrt{\chi^2}$ divergence constraints to prevent reward hacking.

Despite the mathematical core of the paper relying entirely on $\chi^2$ divergence metrics over probability distributions to enforce safety boundaries, an audit of its reference list reveals that Laidlaw et al. do not cite Namkoong & Duchi (2017), Ben-Tal et al. (2013), or Chapman–Robbins. Instead, the paper derives its theoretical guarantees entirely through the lens of infinite-horizon Markov decision processes and reinforcement learning occupancy duals, completely bypassing the rich distributionally robust optimization literature.

| Prior-Art Reference | Citing ML Safety Paper | Citation Type | Citing Context and Evaluative Verdict |
| --- | --- | --- | --- |
| Ben-Tal et al. (2009, 2013) | *A Unifying Lens on Reward Uncertainty in RLHF* (2026) | Type (i) | Refutes the gap. Citing context: "either marginalization over reward uncertainty... or KL-distributionally robust optimization (KL-DRO) (Ben-Tal et al., 2009; Hansen & Sargent, 2008)—yields a closed-form effective reward". |
| Blanchet & Shapiro (2021, 2023) | *DRO-REBEL* (Sahu et al., 2025/2026) | Type (i) | Refutes the gap. Citing context: "to the best of our knowledge, this is the first such characterization... these are the statistical limits of DRO". |
| Hammersley–Chapman–Robbins | *Distributional RL under Leptokurtosis* (2020) | Type (ii) | Does not refute. Citing context: "The most efficient estimator is the one that reaches the Cramér-Rao lower bound, or if this bound is invalid, the Chapman-Robbins lower bound". Focus is on outlier rejection, not Goodhart's law. |
| Namkoong & Duchi (2017) | None (e.g., Laidlaw et al., 2024) | Type (iii) | Confirms the gap. Occupancy-regularized policy optimization (ORPO) utilizes $\chi^2$ constraints to mitigate reward hacking but fails to cite Namkoong-Duchi. |

## Evaluation of the Corrective-Goodhart and Sufficient Statistics Branch

The final branch of prior art includes empirical environmental economics literature and public finance theory. In environmental economics, Reynaert and Sallee (2016) published the seminal paper *Corrective Policy and Goodhart's Law: The Case of Carbon Emissions from Automobiles*. This work represents the most mathematically and empirically rigorous treatment of Goodhart's law in economics, demonstrating how corrective policies (such as carbon tax regulations) incentivize firms to allocate real resources toward gamed laboratory ratings ("choice distortion") rather than true environmental quality improvements.

In public finance, Chetty (2009) established the "Sufficient Statistics" framework, proving that the welfare consequences of policy changes can be computed using high-level, estimable reduced-form elasticities without needing to estimate the structural primitives of a fully specified economy.

### An Absolute Cross-Disciplinary Silo

An exhaustive search of the AI safety, formal-Goodhart, and reward-modeling literature reveals that both Reynaert–Sallee (2016) and Chetty (2009) are completely un-cited (Type iii).

This represents a profound blind spot in the machine learning alignment literature. Although AI safety researchers frequently construct models to estimate "choice distortion" under gamed reward proxies, they are entirely unaware of the empirical structural models of market gaming and consumer choice distortion derived by Reynaert and Sallee.

Similarly, while the alignment community struggles to evaluate how localized updates in a reward model affect overall model safety without estimating the infinite primitives of the LLM's parameter space, they have completely failed to draw upon Chetty's rich sufficient statistics framework, which was designed to solve this exact structural evaluation problem.

| Prior-Art Reference | Citing ML Safety Paper | Citation Type | Citing Context and Evaluative Verdict |
| --- | --- | --- | --- |
| Reynaert & Sallee (2016) | None | Type (iii) | Confirms the gap. The premier economic model formalizing Goodhart's law in corrective regulation has zero representation in the AI safety literature. |
| Chetty (2009) | None | Type (iii) | Confirms the gap. The sufficient statistics framework for welfare analysis remains entirely unapplied to the evaluation of proxy-vs-true alignment metrics. |

## Auditable Proof of the Negative

To satisfy the rigorous requirements of a hostile referee and prove that the negative findings are not a result of incomplete search efforts, this section documents the specific, highly aggressive database queries that returned zero Type (i) citing bridges within the AI safety, alignment, and reward overoptimization literature.

| Search String Query | Target Branch | Target Prior Art | Search Outcome and Database Verification |
| --- | --- | --- | --- |
| `"Feltham" AND "Xie" AND "congruity" AND ("reward" OR "proxy" OR "alignment" OR "Goodhart")` | Performance-Measurement | Feltham–Xie (1994) | Zero Type (i) results. All hits were restricted to accounting, management control, and executive bonus design journals. |
| `"Banker" AND "Datar" AND "informativeness" AND ("reward" OR "proxy" OR "alignment" OR "Goodhart")` | Performance-Measurement | Banker–Datar (1989) | Zero Type (i) results. Returned articles were exclusively focused on earnings quality, CEO turnover, and herding markets. |
| `"Namkoong" AND "Duchi" AND ("reward hacking" OR "ORPO" OR "occupancy measure" OR "occupancy regularization")` | Estimation / DRO | Namkoong–Duchi (2017) | Zero Type (i) results. Laidlaw et al. (ORPO) and related policy optimization works contain zero citations of these authors. |
| `"Reynaert" AND "Sallee" AND ("Goodhart" OR "corrective policy") AND ("AI" OR "reward model" OR "alignment")` | Corrective-Goodhart | Reynaert–Sallee (2016) | Zero Type (i) results. Returned documents were restricted to environmental economics, industrial organization, and tax policy. |
| `"Chetty" AND "sufficient statistics" AND ("reward" OR "alignment" OR "overoptimization")` | Sufficient Statistics | Chetty (2009) | Zero Type (i) results. Returned literature was confined to public finance, tax salience, and behavioral welfare economics. |

## Distinguishing the Strategic Classification Distractor

To maintain the structural integrity of this audit, a vital distinction must be drawn between the reward-hacking/formal-Goodhart corpus and the strategic classification and performative prediction lineage (initiated by Hardt et al., 2016, and Perdomo et al., 2020).

The strategic classification and performative prediction literature is heavily populated by citations of economic contract theory and game-theoretic mechanism design. However, this is a fundamentally different community addressing an entirely different mathematical and physical problem:

- **Strategic Classification:** Models external human agents who strategically manipulate their personal features (e.g., opening multiple bank accounts or optimizing their resumes) to pass a static machine learning classifier.
- **Reward Hacking / Overoptimization:** Models a closed-loop optimization algorithm (the reinforcement learning policy) that exploits the local inaccuracies, omissions, and mathematical gaps in an imperfect, static proxy reward model.

Because the strategic classification lineage is focused on human behavioral gaming rather than policy-level optimization drift, any citations of economic prior art within that subfield do not refute the citation gap within the primary AI safety, RLHF, and reward-model overoptimization corpus.

## Synthesis of Gaps, Bridges, and the Evolution of AI Safety

The results of this citation audit reveal a fascinating structural transformation in the field of artificial intelligence safety. Historically, the field operated under a state of extreme intellectual insularity. Early AI safety works relied heavily on qualitative analogies and sociological accounts to describe alignment failures—such as citing Kerr's (1975) classic paper *The Folly of Rewarding A, While Hoping for B*, or Ridgway's (1956) early accounts of metric gaming in Soviet factories. When the mathematics of reward overoptimization were first formalized, the computer science community largely re-derived these concepts in a vacuum, relying on Markov decision process theory and empirical deep reinforcement learning heuristics.

However, the rapid scaling of large language models and the industrialization of reinforcement learning from human feedback (RLHF) have forced a structural shift. As alignment training has evolved from an empirical art into a highly structured, differentiable multi-task optimization problem, the mathematical boundaries of the discipline have expanded.

The structural isomorphism between a developer optimizing a language model against an imperfect reward benchmark and a corporate principal designing a bonus scheme against a noisy accounting metric has become mathematically undeniable. This has led directly to the recent, highly sophisticated Type (i) breakthroughs documented in this report:

- **The Inevitability of Distortion:** Rather than treating sycophancy or length gaming as temporary engineering bugs, modern papers like Wang & Huang (2026) have imported the exact multi-task machinery of Holmstrom & Milgrom (1991) and Baker (1992) to prove that reward hacking is a structural equilibrium of any finite-dimensional evaluation system.
- **Optimal Benchmark Governance:** The uniform aggregation of benchmark scores has been re-conceptualized by Haupt et al. (2026) as an incentive design problem, utilizing Baker's (2002) multi-task distortion metrics to prove that uniform averaging predictably steers developer effort away from high-welfare, hard-to-measure capabilities.
- **The Equivalence of Pessimism and DRO:** The heuristic-driven deployment of reward model ensembles has been unified under a single mathematical principle, demonstrating that uncertainty-weighted pessimism is the exact dual representation of classical distributionally robust optimization (Ben-Tal et al., 2009).

These recent papers successfully refute the blanket claim that the AI safety literature has completely failed to cite the economics, accounting, and statistics prior art. The structural bridges are being constructed in real-time by a new generation of cross-disciplinary researchers.

Yet, as this audit demonstrates, the integration remains highly uneven. The foundational accounting papers of Feltham-Xie (1994) and Banker-Datar (1989), the empirical environmental economics models of Reynaert-Sallee (2016), and the distributionally robust optimization foundations of Namkoong-Duchi (2017) remain completely siloed from the AI safety corpus. Recognizing these persistent blind spots is essential if the AI alignment community is to stop reinventing established economic theorems and begin actively building upon them.
