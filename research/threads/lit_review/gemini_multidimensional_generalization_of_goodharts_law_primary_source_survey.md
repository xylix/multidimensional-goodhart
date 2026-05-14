Multidimensional Generalization of Goodhart's Law: Primary-Source Survey
Summary
This research monograph surveys the primary-source literature that traces the formalization of Goodhart's law and its multidimensional generalizations. The canonical statement of proxy optimization is defined herein through explicit inputs, outputs, and assumptions derived from recent formal theorems in reinforcement learning, identifying the precise mathematical thresholds where proxy metrics diverge from true rewards.1 The historical survey maps the genealogical predecessors of this phenomenon—including Robert Lucas’s critique of econometric policy evaluation, Charles Goodhart’s observations on monetary aggregates, Donald Campbell’s analysis of social indicators, and Marilyn Strathern’s formulation regarding audit cultures—distinguishing formal methodological theorems from informal empirical generalizations and aphorisms.3 Furthermore, this report delineates known multidimensional generalizations and categorizes specific failure modes (regressional, extremal, causal, and adversarial) to establish the boundary conditions where assumptions of proxy-goal correlation are typically violated.2
Canonical Statement and Assumptions
The canonical formalization of proxy optimization describes a system where an unobservable true goal is approximated by a proxy metric. A formal theorem for this dynamic, Theorem 1 from Skalse et al. (2023), establishes the conditions under which proxy optimization degrades true utility.1 The inputs consist of a starting policy , a proxy reward function , and an unobservable true reward function .1 The output is an optimal stopping point policy , which identifies the exact threshold where further optimization of  causes the performance evaluated under  to strictly decrease.1 The explicit assumptions required for this theorem are that the learning algorithm is approximately concave, and there exists a maximum bound on the angle between the projections of the two reward functions onto the occupancy measure space.7 If a broader, domain-agnostic formal theorem exists with explicit assumptions beyond the reinforcement learning context, a primary source could not be found in the surveyed literature.2
Evaluated Bibliographic Records
To fulfill the bibliographic requirements of this survey, the primary sources establishing the formal definitions and historical foundations discussed throughout this report are cataloged below.

Primary Source Bibliographic Information
Skalse, J., Abate, A., et al. (2023). "Goodhart's Law in Reinforcement Learning." arXiv preprint arXiv:2310.09144. 1
Manheim, D., & Garrabrant, S. (2018). "Categorizing Variants of Goodhart's Law." arXiv preprint arXiv:1803.04585 [cs.AI]. 2
Lucas, R. E. (1976). "Econometric policy evaluation: A critique." Carnegie-Rochester Conference Series on Public Policy, 1, 19-46. 4
Campbell, D. T. (1976). Assessing the Impact of Planned Social Change. Paper #8, Occasional Paper Series, The Public Affairs Center, Dartmouth College. 12
Strathern, M. (1997). "'Improving ratings': audit in the British University system." European Review, 5(3): 305–321. 14

Known Generalizations
The primary known generalization extends proxy optimization from single-dimensional scalar metrics to multidimensional topologies. While baseline models simplify the dynamic as a mapping from a system state to a single real number, multidimensional generalizations recognize that optimization occurs across a vector of multiple metrics and restrictions.2 Because no finite-length algorithm perfectly captures an open-ended goal space, intense optimization pressure on a multidimensional proxy vector inevitably exploits the unaligned sub-dimensions of that vector, driving the system into state spaces where the proxy and the true goal predictably diverge.2
Known Failure Modes
Assumptions of proxy-goal alignment are typically violated through four categorized failure modes.2 Regressional failures violate the assumption that variance in the proxy perfectly reflects variance in the goal; because proxies contain noise, optimizing for extreme values inevitably selects for noise variance, a phenomenon where the "tails come apart".2 Extremal failures violate the assumption that historical statistical relationships extrapolate to unobserved extremes; this occurs due to model insufficiency in the learned relationship or a fundamental regime change in the underlying generating process.2 Causal failures violate the assumption of directional causality between metric and goal, occurring when interventions target a shared cause, an intermediary variable, or involve direct metric manipulation without affecting the latent goal.2 Adversarial failures involve multi-agent dynamics that violate the assumption of a passive system substrate; agents may apply contrary selection pressure, such as the Cobra Effect, deliberately altering causal structures to exploit the metric.2
Genealogical Predecessors
The formalization of proxy misalignment draws upon four foundational predecessors, spanning macroeconomics, sociology, and anthropology. The attributes of these foundational claims are compared directly in the structured data table below.

Author & Year
Domain
Original Venue
Exact Memorable Wording
Status of Claim
Robert Lucas (1976)
Macroeconomics
Carnegie-Rochester Conference Series on Public Policy, Vol. 1
"given that structure of an econometric model consists of optimal decision rules of economic agents... it follows that any change in policy will systematically alter the structure of econometric models." 6
Formal methodological theorem (assumes rational expectations) 6
Charles Goodhart (1975)
Monetary Policy
Papers in Monetary Economics, Vol. I (Reserve Bank of Australia)
"Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes." 3
Informal empirical generalization 17
Donald Campbell (1976)
Social Sciences
Assessing the Impact of Planned Social Change, Paper #8 (Dartmouth College)
"The more any quantitative social indicator... is used for social decision-making, the more subject it will be to corruption pressures and the more apt it will be to distort and corrupt the social processes it is intended to monitor." 18
Empirical generalization 19
Marilyn Strathern (1997)
Anthropology
"'Improving ratings': audit in the British University system," European Review, 5(3)
"When a measure becomes a target, it ceases to be a good measure." 3
Informal anthropological aphorism 14

Works cited
GOODHART'S LAW IN REINFORCEMENT LEARNING - ICLR Proceedings, accessed on May 14, 2026, https://proceedings.iclr.cc/paper_files/paper/2024/file/6ad68a54eaa8f9bf6ac698b02ec05048-Paper-Conference.pdf
Categorizing Variants of Goodhart's Law, accessed on May 14, 2026, https://arxiv.org/abs/1803.04585
Goodhart's law - Wikipedia, accessed on May 14, 2026, https://en.wikipedia.org/wiki/Goodhart%27s_law
The Lasting Influence of Robert E. Lucas on Chicago Economics, accessed on May 14, 2026, https://bfi.uchicago.edu/wp-content/uploads/2022/01/BFI_WP_2022-13.pdf
Tests, Cheating and Educational Corruption - Fairtest, accessed on May 14, 2026, https://fairtest.org/sites/default/files/Cheating_Fact_Sheet_8-17-11.pdf
Criticizing the Lucas Critique: Macroeconometricians' Response to Robert Lucas - Aurélien Goutsmedt, accessed on May 14, 2026, https://aurelien-goutsmedt.com/media/pdf/lucas-critique-former.pdf
Goodhart's Law in Reinforcement Learning - OpenReview, accessed on May 14, 2026, https://openreview.net/forum?id=5o9G4XF1LI
Goodhart's Law in Reinforcement Learning - arXiv, accessed on May 14, 2026, https://arxiv.org/html/2310.09144v1
[PDF] Goodhart's Law in Reinforcement Learning - Semantic Scholar, accessed on May 14, 2026, https://www.semanticscholar.org/paper/Goodhart%27s-Law-in-Reinforcement-Learning-Karwowski-Hayman/a4bd4da02241eacee990c89ddd748ce37a248fc0
(PDF) Categorizing Variants of Goodhart's Law - ResearchGate, accessed on May 14, 2026, https://www.researchgate.net/publication/323747167_Categorizing_Variants_of_Goodhart's_Law
DSGE Models and the Lucas Critique. A Historical Appraisal. - Public Web Documents, accessed on May 14, 2026, https://www2.uwe.ac.uk/faculties/BBS/Documents/1806-%20DSGE%20Models%20and%20the%20Lucas%20Critique%20(WP).pdf
Assessing the Impact of Planned Social Change, accessed on May 14, 2026, https://www.globalhivmeinfo.org/CapacityBuilding/Occasional%20Papers/08%20Assessing%20the%20Impact%20of%20Planned%20Social%20Change.pdf
(PDF) Assessing the Impact of Planned Social Change* - ResearchGate, accessed on May 14, 2026, https://www.researchgate.net/publication/385919619_Assessing_the_Impact_of_Planned_Social_Change
'Improving ratings': audit in the British University system - Gwern.net, accessed on May 14, 2026, https://gwern.net/doc/statistics/decision/1997-strathern.pdf
Money and its Institutional Substitutes: The Role of Exchange Institutions in Human Cooperation - Cameron Harwick, accessed on May 14, 2026, https://cameronharwick.com/writing/money-and-its-institutional-substitutes/
Goodhart's Law: Recognizing and Mitigating the Manipulation of Measures in Analysis - CNA.org., accessed on May 14, 2026, https://www.cna.org/reports/2022/09/Goodharts-Law-Recognizing-Mitigating-Manipulation-Measures-in-Analysis.pdf
“When a Measure Becomes a Target, It Ceases to be a Good Measure” - PMC, accessed on May 14, 2026, https://pmc.ncbi.nlm.nih.gov/articles/PMC7901608/
When Performance Measures Backfire: Campbell's Law and the Implications for ESG Metrics - Knowledge and Leadership Alliance Journals, accessed on May 14, 2026, https://journals.klalliance.org/index.php/JKMP/article/download/585/504
(PDF) Campbell's Law and the Ethics of Immensurability - ResearchGate, accessed on May 14, 2026, https://www.researchgate.net/publication/286876261_Campbell's_Law_and_the_Ethics_of_Immensurability
Campbell's law - Wikipedia, accessed on May 14, 2026, https://en.wikipedia.org/wiki/Campbell%27s_law

