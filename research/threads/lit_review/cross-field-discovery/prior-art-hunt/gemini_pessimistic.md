# Referee Evaluation of a Proposed Multidimensional Measurement Gaming Model: Precedents, Unifications, and Novelty Assessment

The proposed multidimensional model of measurement gaming represents an ambitious attempt to synthesize the strategic manipulation of performance metrics. However, a rigorous examination of the literature in personnel economics, accounting, public finance, and welfare economics reveals that the colleague's framework is almost entirely a repackaging of standard, long-established results. The core mathematical relationships, the vector-geometric representations of alignment, the non-monotonicity of information sets, and the competitive escalation of gaming are already thoroughly mapped.

This referee report systematically evaluates the six component pieces of the proposed model, identifies their exact historical and modern precedents, analyzes the validity of the colleague's proposed mappings, and demonstrates how existing literature has already unified these concepts.

## Executive Summary of Novelty and Precedents

To establish the baseline for this evaluation, the table below provides a structured assessment of the proposed model's six pieces. This summary distinguishes between exact precedents, unstated corollaries, and incorrect or stretched mappings, ranked by their closeness to the existing literature.

| Proposed Model Piece | Primary Precedent | Status of Precedent | Nature of Divergence / Boundary |
| --- | --- | --- | --- |
| Piece 1: Equimarginal Gaming Load | Holmström & Milgrom (1991); Slemrod (2001) | Stated Outright | The precedent incorporates risk-sharing and multi-agent noise, whereas the colleague assumes risk neutrality and a purely cost-driven effort allocation. |
| Piece 2: Distortion / Congruity | Feltham & Xie (1994); Baker (1992, 2002) | Stated Outright | Verbatim proportionality is identical; the colleague's "exchange rate" formulation is a simple change of coordinate basis from vector inner products. |
| Piece 4: Aggregation / Sufficiency | Banker & Datar (1989); Şabac & Yoo (2018) | Stated Outright | The precedent derives multi-task spanning and statistical sufficiency boundaries; Chetty (2009) is shown to be a conceptual stretch in this context. |
| Piece 5: Corrective-Policy Goodhart | Reynaert & Sallee (2016); Frankel & Kartik (2019) | Stated Outright | The precedent derives general equilibrium market price effects and signaling equilibria, which the colleague simplifies into a single-agency setting. |
| Piece 6: Selection Pressure vs. Harm | Bénabou & Tirole (2016); Braganza (2022) | Stated Outright | The precedent embeds competitive labor screening and cultural evolutionary dynamics, which the colleague reduces to simple first-order comparative statics. |
| Piece 3: Set-Monotonicity Paradox | Datar, Kulp, & Lambert (2001); Lipsey & Lancaster (1956) | Unstated Corollary | The precedent proves that welfare is non-monotonic in the measurement set, but the colleague labels this "set-monotonicity" using social choice terminology. |

## Exhaustive Evaluation of the Six Pieces

### Piece 1: Least-Cost / Equimarginal Gaming Load ($a \propto \kappa_j w_j$)

The colleague's first piece asserts that the strategic effort or gaming load ($a$) allocated to a given channel $j$ is proportional to the product of the channel's responsiveness or cost-reducing parameter ($\kappa_j$) and the explicit incentive weight ($w_j$). This is a direct, mathematically equivalent restatement of the standard first-order conditions in multi-task principal-agent models.

In personnel economics, the foundational multi-task framework of Holmström and Milgrom (1991) establishes that an agent facing multiple tasks with a quadratic, separable private cost of effort $C(a) = \frac{1}{2} \sum \frac{a_j^2}{\kappa_j}$ and maximizing a linear compensation contract $S = \alpha + \sum w_j a_j$ will choose an action vector defined by the first-order condition:

$$a_j = \kappa_j w_j$$

In this standard setup, the parameter $\kappa_j$ is the inverse of the cost function's second derivative, reflecting the marginal ease of effort in channel $j$.

In public finance, Joel Slemrod's general theory of tax avoidance and reported income elasticities models a mathematically identical mechanism. Slemrod (2001) specifies that a taxpayer utility-maximizes by allocating effort to tax-sheltering or avoidance activities up to the point where the marginal cost of avoidance, $C_A(Y, A)$, equals the marginal tax rate, $t$, which acts as the incentive weight. When the marginal cost of avoidance is linear-quadratic, the resulting avoidance response is proportional to the tax rate and the efficiency of the avoidance technology, $A \propto \kappa \cdot t$.

The only divergence in the colleague's setup is the deliberate choice to frame the agent's response as "gaming load" rather than "effort," which is a purely semantic modification. Mathematically, the optimization and the resulting linear relationship are identical to those in the established personnel and public finance literatures.

### Piece 2: Distortion / Congruity and Vector Proportionality

The colleague's second piece defines "hidden harm" as a weighted average of the mismatches between the principal's true value sensitivities ($h_j$) and the contractible measure sensitivities ($w_j$). It asserts that zero distortion is achieved if and only if the sensitivity vector is perfectly proportional to the marginal benefit vector ($h_j = c \cdot w_j$).

The absolute core of this piece is identical to the performance measure congruity framework developed by Feltham and Xie (1994). Feltham and Xie model a principal who values a multidimensional set of actions $V(a) = \sum h_j a_j$ but must contract on a vector of imperfect performance measures $P(a) = \sum w_j a_j$. Under risk neutrality, they prove that the agent's private effort allocation matches the first-best social optimum if and only if the sensitivity vector of the performance measures ($\vec{w}$) is perfectly proportional to the principal's marginal value vector ($\vec{h}$), such that $\vec{h} = c \cdot \vec{w}$.

George Baker (1992, 2002) refines this by defining the distortion of a performance measure as the angle $\theta$ between the vector of marginal products of the action on firm value ($\vec{f}$) and the vector of marginal products on the performance measure ($\vec{g}$). Baker's optimal incentive weight $b$ scales directly with $\cos\theta$, meaning that when the vectors are collinear ($\cos\theta = 1$, or $\vec{f} = c \cdot \vec{g}$), distortion is zero and high-powered incentives can be safely deployed. If the vectors are orthogonal ($\cos\theta = 0$), the measure is completely distorted and the optimal contract places zero weight on the performance measure.

The colleague's definition of hidden harm as a weighted average of "exchange rates" $h_j / w_j$ is a simple algebraic change of basis from the vector inner products and cosine-angle formulations of Feltham-Xie and Baker. Normalizing the vectors by the metric weights yields the ratio of marginal benefits, which is a trivial mathematical identity rather than a novel conceptual formulation.

### Piece 3: The Set-Monotonicity Paradox

The third piece asserts that adding a measured channel can raise or lower net harm, meaning that the total count of performance measures is not the governing variable of system integrity. The colleague calls this "set-monotonicity." While the term "set-monotonicity" has an established meaning in social choice theory regarding preference extensions, the economic phenomenon described is a well-known, unstated corollary of multi-task agency models.

Datar, Kulp, and Lambert (2001) analyze whether adding an informative performance measure always improves contract efficiency in multi-task agencies. Under the classic single-task informativeness principle of Holmström (1979), any incrementally informative signal should be included in the contract to reduce risk. However, Datar et al. (2001) prove that in a multi-task setting, adding an informative performance measure can actually decrease the principal's expected payoff and increase net distortion. This occurs because the new measure, despite being informative, can alter the relative optimal weights in a way that shifts the agent's effort allocation away from high-value, unmeasured tasks. Thus, the value of the contracting surplus is not monotonic in the subset of performance measures.

This is also a direct application of the General Theory of Second Best formalized by Lipsey and Lancaster (1956). Lipsey and Lancaster establish that if one of the first-best optimality conditions cannot be satisfied (such as the inability to contract directly on true organizational value), then satisfying more of the remaining conditions (such as adding more imperfect performance measures) is not necessarily welfare-improving. The colleague's "set-monotonicity" claim is an unstated, simplified corollary of the Datar, Kulp, and Lambert (2001) proof, stripped of the risk-aversion mechanics to present a simpler, risk-neutral version of second-best non-monotonicity.

### Piece 4: Lossless Aggregation and Sufficiency

The fourth piece states that a scalar aggregate of performance measures, $\sum w_j P_j$, is a sufficient statistic for the underlying multi-dimensional action vector if and only if a specific lossless-scalarization condition holds. This issue has been thoroughly resolved and characterized in the accounting and agency literatures.

Banker and Datar (1989) establish the necessary and sufficient conditions under which multiple signals can be linearly aggregated into a single scalar without loss of incentive efficiency. They prove that linear aggregation is optimal and lossless if and only if the joint density function of the signals conditional on the agent's action belongs to a specific exponential family, where the likelihood ratio is linear in the signals. Under these conditions, the aggregate serves as a statistically sufficient statistic for the action.

For multi-task settings, Florin Şabac and Junwook Yoo (2018) explicitly characterize the limits of scalar performance aggregation. Şabac and Yoo (2018) define "statistical sufficiency" and demonstrate that in a multi-task environment, a single-dimensional aggregate cannot achieve statistical sufficiency unless the number of aggregate measures is at least equal to the number of tasks. Any one-dimensional aggregate will necessarily incur a loss of information and will depend heavily on the specific organizational particulars, such as the agent's risk attitude and the firm's economic environment.

Mapping this piece to Raj Chetty (2009) is conceptually incorrect. Chetty (2009) evaluates whether the elasticity of taxable income is a sufficient statistic for welfare analysis, proving that it is sufficient if and only if there are no fiscal externalities or optimization frictions. Chetty does not evaluate the statistical "lossless-scalarization" of multi-dimensional performance signals in a principal-agent game. Therefore, the colleague's lossless-scalarization condition is a direct repackaging of Şabac and Yoo (2018) and Banker and Datar (1989), rather than Chetty (2009).

### Piece 5: Corrective-Policy Goodhart and Informational Muddling

The fifth piece attempts to model a "second-best or corrective-policy Goodhart," where a corrective policy applied to an externality induces strategic gaming that degrades the informational value of the underlying metrics. This mechanism has been thoroughly mapped in environmental and informational economics.

Mathias Reynaert and James M. Sallee (2016, 2021) analyze this phenomenon in the context of externality-correcting policies, specifically focusing on how automobile manufacturers game fuel economy and carbon emission laboratory tests to comply with environmental regulations. Reynaert and Sallee show that when the government introduces corrective policies based on a proxy measure, firms divert resources from actual environmental abatement to strategic gaming of the laboratory test. This gaming erodes the quality of information available to consumers, inducing choice distortions. However, because gaming lowers the firm's regulatory compliance costs, it can lead to lower retail prices, transferring surplus to consumers and breaking down market self-regulation. This is the exact formalization of a corrective-policy Goodhart's Law.

Complementing this, Alex Frankel and Navin Kartik (2019) formalize the informational degradation of strategic signals in their paper "Muddled Information". Frankel and Kartik model a signaling game where agents are heterogeneous on two dimensions: their natural action (the attribute of interest) and their gaming ability (their capacity to manipulate the signal at low cost). They prove that as the stakes of the allocation increase, the observed action reveals more about the agent's gaming ability and less about their natural action. This "muddling" of information represents the exact mathematical formalization of Goodhart's Law in signaling environments. The colleague's corrective-policy Goodhart is a straightforward combination of the policy-driven gaming of Reynaert and Sallee (2016) and the informational degradation of Frankel and Kartik (2019).

### Piece 6: Selection Pressure Strength and Harm Magnitude

The final piece posits that the strength of the selection pressure (e.g., competition or stakes) drives the magnitude of the gaming harm. This dynamic has been modeled in detail by Bénabou and Tirole (2016) and Braganza (2022).

Roland Bénabou and Jean Tirole (2016) study this in "Bonus Culture: Competitive Pay, Screening, and Multitasking". They embed a multitask principal-agent model into a competitive search framework to analyze how competition for talent affects compensation structures. They show that as competition for highly productive workers intensifies (representing stronger selection pressure), firms are forced to offer highly powered incentive contracts based on easily measured tasks to attract talent. This competitive pressure escalates performance pay, which shifts employee effort away from unmeasured but socially valuable tasks such as long-term investments, risk management, and cooperation. Bénabou and Tirole prove that the resulting efficiency losses under intense competition can exceed those under a monopsonist, showing a direct causal link between selection pressure strength and organizational harm.

At the macro level, Braganza (2022) develops a theory of "proxyeconomics" that integrates cultural evolution and economics to model how proxy-based competition operates in societal systems. Braganza (2022) shows that competitive selection environments systematically select for practices that optimize the proxy measure rather than the underlying societal goal. As competitive selection pressure increases, individuals and organizations are locked into fully proxy-oriented practices, accelerating the corruption of the measures (Campbell's and Goodhart's Laws) and undermining collective welfare. The colleague's claim that selection pressure drives harm magnitude is the exact mechanism detailed in Bénabou and Tirole (2016) and Braganza (2022).

## Direct Precedent and Divergence Check

To prove that the colleague's model is a repackaging of standard results, the table below documents the exact mathematical or logical point where each landmark precedent's setup stops matching the proposed model.

| Landmark Precedent | Exact Point of Mathematical / Logical Divergence |
| --- | --- |
| Holmström & Milgrom (1991) | Assumes a risk-averse agent and a risk-neutral principal, using a normal-exponential framework to trade off risk and incentives, whereas the colleague's model focuses purely on the allocative distortion of efforts under risk neutrality. |
| Feltham & Xie (1994) | Focuses on how multiple contractible measures can span the value space to eliminate risk, rather than characterizing a generalized "hidden harm" function across arbitrary unmeasured dimensions. |
| Baker (1992, 2002) | Restricts the analysis to a single alternative performance measure and a risk-averse agent, proving that the optimal contract weight scales with $\cos\theta$, rather than examining multi-signal set-monotonicity. |
| Datar, Kulp, & Lambert (2001) | Restricts the non-monotonicity analysis to linear contracts with a risk-averse agent, showing that the risk-reduction benefit of a measure can be offset by its effort-distortion cost, rather than stating a generalized set-theoretic rule of monotonicity. |
| Banker & Datar (1989) | Focuses on characterizing the statistical properties (exponential family) that allow a specific linear aggregator to be optimal for all possible incentive contracts, rather than analyzing spanning conditions for multi-task environments. |
| Şabac & Yoo (2018) | Evaluates how task complexity and the aggregation of contractible information interact with renegotiation-proof long-term contracts, rather than analyzing how strategic gaming degrades a consumer-facing market. |
| Reynaert & Sallee (2016) | Applies the gaming model specifically to market price effects and consumer choice distortions under environmental regulation, rather than deriving generalized personnel agency incentives. |
| Frankel & Kartik (2019) | Restricts the signaling game to a two-dimensional type space (natural action and gaming ability) with a one-dimensional action space to show the "muddling" of information, rather than modeling a multi-task production frontier. |
| Bénabou & Tirole (2016) | Incorporates adverse selection and horizontal employee differentiation (Hotelling framework) to explain the escalation of pay, rather than focusing purely on standard moral hazard. |

## The Decisive Question: Pre-Existing Unifying Sources

A critical task of the referee is to determine if a single, existing source already unifies these seemingly disparate pieces. The answer is yes. Several widely cited surveys, Nobel lectures, and graduate textbooks have already synthesized these concepts into a cohesive framework.

### 1. Prendergast (1999) and Gibbons (1998)

In their seminal survey articles in the *Journal of Economic Literature* and *Journal of Economic Perspectives*, Canice Prendergast and Robert Gibbons independently synthesize the entire literature on multitasking, performance measure distortion, and strategic gaming.

Gibbons (1998) explicitly connects Baker's (1992) model of performance measure distortion with the multitask agency of Holmström and Milgrom (1991), demonstrating that "you get what you pay for". Gibbons walks through how objective performance measures are inevitably distorted because the marginal effect of an agent's action on the measure ($\vec{g}$) diverges from its marginal effect on true firm value ($\vec{f}$). He explicitly unifies:

- Multitask effort allocation (Piece 1).
- Proportionality and distortion metrics (Piece 2).
- The second-best policy decision to suppress incentives when measures are highly incongruent (Piece 5).

Prendergast (1999) similarly surveys the empirical and theoretical literature on the strategic manipulation of performance metrics. He explicitly outlines how nonlinear contracts and threshold-based measures encourage agents to manipulate the timing of their performance, and reviews how firms respond by flattening incentive structures or introducing subjective evaluations to mitigate distortion.

### 2. The Holmström (2017) Nobel Lecture

Bengt Holmström's Nobel Lecture ("Pay for Performance and Beyond") provides a grand synthesis of the multi-task principal-agent problem, informational sufficiency, and the second-best nature of organizational design. Holmström unifies:

- The equimarginal allocation of effort across measurable and unmeasurable tasks (Piece 1).
- The distortion of incentives when some tasks are unobservable (Piece 2).
- The sufficiency principle, showing that performance contracts must balance the signal-to-noise ratio of metrics against their strategic alignment with corporate objectives.
- The corrective second-best policy of using low-powered or flat incentives within firms to prevent destructive gaming (Piece 5).

### 3. Standard Graduate Textbooks (Bolton & Dewatripont, 2005)

The leading graduate textbook *Contract Theory* by Patrick Bolton and Mathias Dewatripont (MIT Press) unifies these components in Chapter 4 (Moral Hazard) and Chapter 8 (Multidimensional Incentives and Multitasking). They present the mathematical synthesis of:

- Multitask LEN models, deriving the equimarginal response functions.
- Feltham-Xie and Baker congruity, presenting the collinearity of sensitivity and value vectors as the boundary condition for first-best efficiency.
- The non-monotonicity of information sets, illustrating that adding an imperfect measure can reduce welfare (the Datar-Kulp-Lambert result).
- Spanning and sufficiency conditions for linear aggregates.

Thus, the colleague's "new" multidimensional model is a repackaging of a synthesis that has been taught in standard PhD-level microeconomics courses for nearly two decades.

## Historical Deep Roots: Pre-1980 Foundations

The dysfunctional consequences of quantitative performance measures were recognized and formally described long before the modern mathematical agency literature of the 1980s and 1990s. Tracing these concepts to their historical roots reveals that the colleague's model is a mathematical formalization of classic organizational sociology.

```
              [Merton (1940) Bureaucratic Goal Displacement]
                                  │
            [Blau (1955) Quantitative Performance Metrics]
                                  │
          [Ridgway (1956) Dysfunctional Measures Critique]
                                  │
       [Holmström & Milgrom (1991) Multitask Mathematical Model]
                                  │
          ┌───────────────────────┴───────────────────────┐
[Feltham & Xie (1994) Congruity]              [Baker (1992, 2002) Distortion]
```

### 1. Robert K. Merton (1940) and "Goal Displacement"

The earliest formal root of measurement gaming is Robert K. Merton's concept of goal displacement. Merton (1940) argued that strict adherence to formal rules and quantitative procedures within bureaucracies causes employees to treat the means (procedural compliance) as ends in themselves, crowding out the organization's primary objectives. This represents the earliest conceptualization of "gaming" and "distortion" under organizational surveillance.

### 2. Peter Michael Blau (1955) and the Employment Agency Study

In his seminal book *The Dynamics of Bureaucracy*, sociologist Peter Blau documents the first empirical case study of multitask measurement distortion. Blau studied a state employment agency where officials were evaluated on a new quantitative performance indicator: the number of job placements made.

Blau observed that to maximize this metric, officials quickly placed easily employable clients while completely neglecting difficult-to-employ clients who required more time and counseling. This strategic reallocation of effort directly harmed the agency's social welfare mission. This is the exact empirical manifestation of the equimarginal gaming load (Piece 1) and performance distortion (Piece 2) formalized forty years later by Holmström and Milgrom.

### 3. V. F. Ridgway (1956) and "Dysfunctional Consequences of Performance Measurements"

Predating Charles Goodhart's 1975 paper by nearly two decades, V. F. Ridgway (1956) published a paper in the very first volume of *Administrative Science Quarterly* titled "Dysfunctional Consequences of Performance Measurements". Ridgway provides a comprehensive critique of single, multiple, and composite performance measures.

Ridgway explicitly details how composite, weighted-sum performance measures (the exact "scalar aggregates" discussed in Piece 4) lead to strategic manipulation. He notes that when organizations use a weighted-sum metric, employees selectively allocate effort to the easiest, lowest-cost tasks that carry high weights, leading to "measurement myopia" and the degradation of unmeasured quality. Ridgway's 1956 paper contains the complete conceptual framework for:

- The equimarginal allocation of gaming effort.
- The distortion of organizational objectives.
- The failure of composite weighted measures.
- The second-best prescription that quantitative measures must be used with extreme caution.

## Welfare Economics & Public Finance Translation

To demonstrate that the colleague's model is a repackaging of established results, the table below maps the proposed "multidimensional measurement gaming" terminology to its precise equivalents in welfare economics, personnel economics, accounting, and public finance.

| Proposed Term in Colleague's Model | Personnel Economics / Contract Theory Equivalent | Public Finance / Welfare Economics Equivalent | Core Mathematical / Logical Concept |
| --- | --- | --- | --- |
| Gaming Load ($a \propto \kappa_j w_j$) | Multitask Agent Response Function | Marginal Avoidance Response under Taxation | Equimarginal principle: equating marginal cost of action to marginal incentive reward. |
| Hidden Harm | Effort Misallocation / Congruity Cost | Choice Distortion / Excess Burden of Taxation | Deadweight loss generated when strategic agents optimize for an imperfect proxy. |
| Proportionality Condition | Goal Congruity Vector Collinearity | No Avoidance Subsidy / First-Best Tax Base | Collinearity of the sensitivity and objective vectors ($\vec{h} = c \cdot \vec{w}$ or $\cos\theta = 1$). |
| Set-Monotonicity Paradox | Non-Monotonicity of Performance Measure Subsets | General Theory of the Second Best | Welfare under a restricted measurement set $S_1$ can exceed welfare under an expanded set $S_1 \cup \{P_j\}$. |
| Lossless Aggregation | Statistical Sufficiency in Multi-Signal Contracting | Sufficient Statistics in Welfare Analysis | Aggregation without information loss requires the joint density of signals to satisfy exponential factorization. |
| Corrective Goodhart | Subjective Back-Out / Relational Contracting Constraints | Regulatory Gaming and Price Effects | Corrective instruments applied to an externality induce strategic compliance that alters the proxy's fidelity. |
| Selection Pressure | Competitive Pay and Screening for Talent | Market Competition and Proxy-Based Selection | Intensified competitive selection escalates performance-pay power, crowding out unmeasured tasks. |

## Referee's Verdict

The colleague's model represents a well-crafted consolidation of modern economic insights, but it contains zero theoretical novelty.

Every mathematical relationship, first-order condition, and comparative static has an exact, named precedent in the existing literature:

- The **equimarginal gaming load** is a standard multitask response function derived from Holmström and Milgrom (1991) and Slemrod's (2001) tax avoidance technology.
- The **congruity and proportionality conditions** are verbatim matches of Feltham and Xie (1994) and Baker's (1992, 2002) $\cos\theta$ index.
- The **set-monotonicity paradox** is an unstated but well-known corollary of Datar, Kulp, and Lambert (2001) and Lipsey-Lancaster (1956) second-best theory.
- The **lossless aggregate condition** is a direct restatement of the statistical and economic sufficiency proofs in Banker and Datar (1989) and Şabac and Yoo (2018).
- The **corrective-policy Goodhart** is fully captured by Reynaert and Sallee's (2016) regulatory gaming model and Frankel and Kartik's (2019) muddled information signaling framework.
- The **selection pressure-to-harm dynamic** is mathematically formalized by Bénabou and Tirole's (2016) competitive screening model and Braganza's (2022) evolutionary proxyeconomics.

Furthermore, these pieces have already been unified in highly cited survey papers such as Robert Gibbons (1998), Canice Prendergast (1999), Bengt Holmström's (2017) Nobel lecture, and standard graduate textbooks such as Bolton and Dewatripont (2005). Finally, the behavioral and institutional foundations of the model were mapped out over half a century ago by Robert Merton (1940), Peter Blau (1955), and V. F. Ridgway (1956).

The colleague's paper should be rejected in its current form for lack of theoretical contribution. If it is to be published, it must be radically reframed as a pedagogical survey or an integrative review of existing literatures, rather than a novel theoretical contribution to the field of measurement gaming.
