Survey of Formal Mathematical Statements of Goodhart's Law
1. Summary and Bibliographic Overview
The formalization of Goodhart’s law in the scalar setting has evolved from qualitative macroeconomic adages to exact statistical bounds. A survey of the primary-source literature reveals that Charles Goodhart's 1975 paper presents an informal claim that statistical regularities collapse under control pressure, but I cannot find a primary source for a formal mathematical statement or theorem within that text.1 Similarly, Manheim and Garrabrant's 2018 paper provides a precise but informal typology defining Regressional Goodhart as the inherent selection for noise when optimizing a proxy, Extremal Goodhart as the collapse of correlation when selection pressure pushes the system into out-of-distribution regimes, Causal Goodhart as the severing of structural links due to direct intervention, and Adversarial Goodhart as the deliberate manipulation of a metric by strategic agents.4 I cannot find a primary source for formal mathematical results or analytic theorems within their taxonomy; it utilizes simplified structural models rather than explicit bounds.5 In the AI-safety literature, the regressional-Goodhart inequality is formally anchored in the statistical "Optimizer's Curse," which proves that the conditional expectation of a true goal  given an optimized noisy proxy  strictly underperforms the proxy, expressed as the inequality .6 While machine learning studies like Gao, Schulman, and Hilton (2022) provide empirical scaling laws for target degradation 8, the best candidate for a formal, citable anchor proposition is El-Mhamdi and Hoang (2024), which provides explicit mathematical theorems bounding target degradation as a function of tail behavior and selection pressure.11
The primary-source literature tracked for this evaluation is detailed below to provide full bibliographic information without appending isolated citations at the document's conclusion.

Primary Source
Venue & Year
Contribution Classification
Full Bibliographic Information
Goodhart (1975)
Reserve Bank of Australia (1975)
Informal macroeconomic claim
Goodhart, C.A.E. (1975). "Monetary Relationships: A View from Threadneedle Street." Papers in Monetary Economics, Volume I, Reserve Bank of Australia. 1
Smith & Winkler (2006)
Management Science (2006)
Formal statistical inequality
Smith, J. E., & Winkler, R. L. (2006). "The Optimizer's Curse: Skepticism and Postdecision Surprise in Decision Analysis." Management Science, 52(3), 311–322. 7
Manheim & Garrabrant (2018)
arXiv preprint (2018)
Informal structural taxonomy
Manheim, D., & Garrabrant, S. (2018). "Categorizing Variants of Goodhart's Law." arXiv preprint arXiv:1803.04585 [cs.AI]. 4
Gao et al. (2022)
ICML (2023) / arXiv (2022)
Empirical scaling laws
Gao, L., Schulman, J., & Hilton, J. (2022). "Scaling Laws for Reward Model Overoptimization." Proceedings of the 40th International Conference on Machine Learning. 15
El-Mhamdi & Hoang (2024)
arXiv preprint (2024)
Formal mathematical theorems
El-Mhamdi, E.-M., & Hoang, L.-N. (2024). "On Goodhart's law, with an application to value alignment." arXiv preprint arXiv:2410.09638 [stat.ML]. 12

2. Canonical Statement and Key Assumptions
The canonical scalar bound selected to anchor a multidimensional generalization is derived from Theorems 1 and 4 of El-Mhamdi and Hoang (2024).11 The framework takes as inputs a true target variable , an optimized proxy measure , and a discrepancy variable .2 An explicit input parameter  dictates the selection pressure, representing the proportion of the state space retained when maximizing , where  denotes extreme selection pressure.11 The resulting outputs are the asymptotic correlation  between  and , and the expected conditional value of the target .12
Analytically, this formalization rests on three key assumptions. First, it operates strictly in a scalar, one-proxy, one-target setting.5 Second, it assumes statistical independence between the true goal  and the discrepancy noise .17 Third, the bounds rely on explicit probability density distributions for the discrepancy, distinguishing between exponential and heavy-tailed properties.11
Theorem 1 establishes a "Weak Goodhart" regime where the metric ceases to be useful but does not infinitely degrade the target. If  is uniformly distributed and the discrepancy  has an exponential distribution with a noise-to-signal ratio , extreme selection pressure defined by  forces the correlation  to collapse to exactly .2 Theorem 4 establishes a "Strong Goodhart" regime where optimization actively degrades the target as a function of tail behavior. If the discrepancy exhibits heavier polynomial tails parameterized by , extreme selection pressure forces the correlation into negative bounds. As  and , the correlation is strictly bounded below zero, converging to .11
3. Known Generalizations
The scalar analytical bound generalizes along two primary vectors in recent literature. First, the parameterization of selection pressure extends from discrete sample-selection thresholds to continuous stochastic policy optimization. In this setting, target degradation is formulated as a continuous function of the Kullback-Leibler (KL) divergence from a base policy, integrating structural sample-based limits with dynamic reinforcement learning optimization.9 Second, the mathematical formalization has been generalized to an "independence-free" setting by Majka and El-Mhamdi (2025).1 This relaxes the strict assumption that the target  and the error  are uncorrelated, allowing the analytical bounds to apply to highly coupled environments where the magnitude of the proxy noise scales intrinsically with the target value itself.1
4. Known Failure Modes and Violated Assumptions
The analytical bounds of Goodhart's law are highly sensitive to their foundational assumptions, the violations of which map directly onto the structural failure modes identified by Manheim and Garrabrant.5 The primary analytical failure mode occurs when the independence assumption between the target and the discrepancy is breached.1 In environments with strategic actors, individuals actively correlate their behaviors with the noise term to game the metric, intentionally violating statistical independence and triggering Adversarial Goodhart dynamics.5 Furthermore, the formal theorems demonstrate that the severity of Goodhart's law relies strictly on the tail behavior of the data-generating process.2 If an optimization system assumes normally distributed proxy errors but the environment actually generates fat-tailed discrepancies, the formal bounds will fail, inaccurately predicting a benign performance plateau when the system will actually experience catastrophic target degradation.2 Finally, Causal Goodhart dynamics violate the assumption of a static data-generating process entirely; if the selection pressure takes the form of a physical or economic intervention that severs the underlying causal graph between the proxy and the goal, the prior probability distributions dictating the bounds become mathematically invalid.4
Works cited
The Strong, Weak and Benign Goodhart's law. An independence-free and paradigm-agnostic formalisation - arXiv, accessed on May 14, 2026, https://arxiv.org/pdf/2505.23445
arxiv.org, accessed on May 14, 2026, https://arxiv.org/html/2410.09638v1
Goodhart's Law: Its Origins, Meaning and Implications for Monetary Policy - ResearchGate, accessed on May 14, 2026, https://www.researchgate.net/publication/253797490_Goodhart's_Law_Its_Origins_Meaning_and_Implications_for_Monetary_Policy
[PDF] Categorizing Variants of Goodhart's Law - Semantic Scholar, accessed on May 14, 2026, https://www.semanticscholar.org/paper/Categorizing-Variants-of-Goodhart's-Law-Manheim-Garrabrant/80939dd8a5cad405053c88ed856c28791bdc0582
(PDF) Categorizing Variants of Goodhart's Law - ResearchGate, accessed on May 14, 2026, https://www.researchgate.net/publication/323747167_Categorizing_Variants_of_Goodhart's_Law
Dead rats, dopamine, performance metrics, and peacock tails: Proxy failure is an inherent risk in goal-oriented systems | Behavioral and Brain Sciences - Cambridge University Press & Assessment, accessed on May 14, 2026, https://www.cambridge.org/core/journals/behavioral-and-brain-sciences/article/dead-rats-dopamine-performance-metrics-and-peacock-tails-proxy-failure-is-an-inherent-risk-in-goaloriented-systems/89408A43F6D14BFD368FE5225A573032
Practicable robust stochastic optimization under divergence measures with an application to equitable humanitarian response planning - PMC, accessed on May 14, 2026, https://pmc.ncbi.nlm.nih.gov/articles/PMC10200077/
Rethinking Reinforcement Fine-Tuning in LVLM: Convergence, Reward Decomposition, and Generalization - arXiv, accessed on May 14, 2026, https://arxiv.org/html/2604.19857v1
Scaling Laws for Reward Model Overoptimization - Proceedings of Machine Learning Research, accessed on May 14, 2026, https://proceedings.mlr.press/v202/gao23h/gao23h.pdf
Scaling Laws for Reward Model Overoptimization - AI Alignment Forum, accessed on May 14, 2026, https://www.alignmentforum.org/posts/shcSdHGPhnLQkpSbX/scaling-laws-for-reward-model-overoptimization
(PDF) On Goodhart's law, with an application to value alignment - ResearchGate, accessed on May 14, 2026, https://www.researchgate.net/publication/384930021_On_Goodhart's_law_with_an_application_to_value_alignment
[2410.09638] On Goodhart's law, with an application to value alignment - arXiv, accessed on May 14, 2026, https://arxiv.org/abs/2410.09638
Managing Distributional Ambiguity in Stochastic Optimization through a Statistical Upper Bound Framework, accessed on May 14, 2026, https://optimization-online.org/wp-content/uploads/2024/03/APUB_OptOnline-1.pdf
Categorizing Variants of Goodhart's Law - arXiv, accessed on May 14, 2026, https://arxiv.org/pdf/1803.04585
Scaling Laws for Reward Model Overoptimization in Direct Alignment Algorithms - NIPS papers, accessed on May 14, 2026, https://proceedings.neurips.cc/paper_files/paper/2024/file/e45caa3d5273d105b8d045e748636957-Paper-Conference.pdf
[2210.10760] Scaling Laws for Reward Model Overoptimization - arXiv, accessed on May 14, 2026, https://arxiv.org/abs/2210.10760
On Goodhart's law, with an application to value alignment - arXiv, accessed on May 14, 2026, https://arxiv.org/pdf/2410.09638
Goodhart's Law - AI Alignment Forum, accessed on May 14, 2026, https://www.alignmentforum.org/w/goodhart-s-law

