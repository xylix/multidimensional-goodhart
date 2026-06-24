# Precedent for the fixed-deficit quadratic-substitution result

## Bottom line

“The closest prior art is Feltham and Xie (1994), *Performance Measure Congruity and Diversity in Multi-Task Principal/Agent Relations*. It establishes the linear-quadratic multitask agency model in which second-best effort is pinned down by the performance-measure coefficient vector, and alignment with the principal’s true objective is a same-direction proportionality condition. Result (D) is an unstated one-line corollary there because, after the change of variables \(x_j=a_j/\sqrt{\kappa_j}\), your problem becomes the equal-cost version of that model: the measured-score vector is \(b_j=w_j\sqrt{\kappa_j}\), the hidden-harm vector is \(\beta_j=h_j\sqrt{\kappa_j}\), and cost is \(\frac12\sum_j x_j^2\). In that representation, all-subset invariance of hidden harm is equivalent to perfect congruity, i.e. \(\beta=c\,b\), which is exactly \(h_j=c\,w_j\) for all \(j\). To map it onto the claimed result, set \(b_j \leftrightarrow w_j\sqrt{\kappa_j}\), \(\beta_j \leftrightarrow h_j\sqrt{\kappa_j}\), and use the standard quadratic-cost multitask agency objective. The correspondence holds up to the exact divergence that Feltham and Xie analyze incentive design and goal congruence, not the explicit ‘vary the measured subset and compute hidden harm for every subset’ exercise.” citeturn19view0turn6view0turn4search0

That is the best candidate because it is not merely an analogy. It is the same linear-quadratic multitask structure, under the same vocabulary family that later authors explicitly call **congruity**, **distortion**, **goal congruence**, and **alignment**. Budde’s reconstruction of the Feltham–Xie setup makes the connection especially transparent: he states that his contracting problem is a special case of Feltham and Xie’s, writes the agent’s second-best action as proportional to the performance-measure vector, and gives a closed-form congruity index equal to the squared cosine between the true-objective vector and the measured-performance vector. Schnedler then states the same condition in the cleanest possible form: a performance measure is congruent with the benefit iff the two coefficient vectors have the same direction. citeturn19view0turn20view0turn6view0

## Algebraic core of the claim

For a nonempty measured subset \(S\), your agent solves

\[
\min_{a_j,\,j\in S}\sum_{j\in S}\frac{a_j^2}{2\kappa_j}
\quad\text{s.t.}\quad
\sum_{j\in S} w_j a_j=d.
\]

The KKT conditions give

\[
a_j^*(S)=\lambda_S \kappa_j w_j,
\qquad
\lambda_S=\frac{d}{\sum_{i\in S}\kappa_i w_i^2}.
\]

Hence hidden harm is

\[
H(S)=\sum_{j\in S} h_j a_j^*(S)
= d\,
\frac{\sum_{j\in S}\kappa_j w_j h_j}
{\sum_{j\in S}\kappa_j w_j^2}
= d\,
\frac{\sum_{j\in S}\kappa_j w_j^2\,(h_j/w_j)}
{\sum_{j\in S}\kappa_j w_j^2}.
\]

So \(H(S)\) is a **weighted average of the exchange rates** \(h_j/w_j\), with weights \(\kappa_j w_j^2\). That immediately yields your result (C): the harm depends on the available set only through those exchange rates and cost weights, not through the sheer count of channels. Adding a channel raises harm iff its exchange rate \(h_k/w_k\) exceeds the current weighted average, and lowers harm iff it is below that average. This is exactly the standard equimarginal / least-cost allocation logic. citeturn28search1turn28search15turn32search10

Result (D) is even simpler. If harm is invariant across **all** nonempty subsets, then in particular it is invariant across singleton subsets. But for a singleton \(\{j\}\),

\[
H(\{j\}) = d\,\frac{h_j}{w_j}.
\]

Therefore invariance over all singletons forces \(h_j/w_j\) to be constant across \(j\), i.e. \(h_j=c\,w_j\). Sufficiency is immediate from the same formula. This is why the deepest mathematical content of (D) is not a novel optimization trick; it is the classic **perfect-congruity / proportional-vectors** condition in disguised notation. In the rescaled equal-cost coordinates \(x_j=a_j/\sqrt{\kappa_j}\), the measured vector is \(b_j=w_j\sqrt{\kappa_j}\) and the hidden-harm vector is \(\beta_j=h_j\sqrt{\kappa_j}\), so \(h_j=cw_j\) is exactly the statement \(\beta=c\,b\). citeturn6view0turn20view0turn19view0

## Closest prior art ranked by closeness

The ranking below is by mathematical closeness to your pair (C)/(D), not by age.

| Candidate | What it establishes | How close to (C)/(D) | Verdict |
|---|---|---|---|
| **Feltham & Xie (1994)**, via Budde (2006) and Schnedler (2006) | Linear-quadratic multitask agency with quadratic effort costs; second-best effort proportional to the performance-measure vector; congruity means true-objective and measured vectors have the same direction. citeturn19view0turn6view0 | **Closest**. After rescaling by \(\sqrt{\kappa_j}\), your model is exactly in this family. Your (D) is an unstated one-line corollary. | **Best candidate** |
| **Banker & Datar (1989)** | Optimal linear aggregation weights on signals are proportional to sensitivity × precision; a pure aggregate is optimal only when component intensities match; similarly, equally weighted pooling of cost components is optimal iff all intensities are the same. citeturn2view0turn12view2turn12view3 | Very close to the “aggregate-only iff proportionality/equal-intensity” structure. Strong precedent for the aggregation-language version of (D), but in noisy-signal terms rather than hidden-harm subset invariance. | **Second-best candidate** |
| **Holmström (1979)**, restated by Holden | A signal matters iff it is informative; equivalently, the optimal action depends on an extra signal iff the already-used statistic is not sufficient. citeturn34view0turn2view0 | Structural ancestor for “adding a channel may or may not matter,” but it does **not** reduce to \(h_j=cw_j\) without additional linear-quadratic specialization. | Useful ancestor, not exact theorem |
| **Shephard / equimarginal least-cost allocation; Montgomery; Baumol–Oates** | Cost-minimizing allocation under a fixed target equalizes marginal costs; environmental least-cost control does the same across abatement sources. citeturn32search10turn28search1turn28search8 | Gives the optimization backbone behind (C) almost verbatim. Does not by itself formulate the hidden-harm invariance condition (D). | Backbone for (C), not full precedent for (D) |
| **Gorman exact aggregation; Diewert–Vartia consistency in aggregation** | Exact linear aggregation requires restrictive structure; exact consistency in aggregation is only available for narrow functional forms such as Gorman-polar or Cobb–Douglas/CES cases. citeturn24search0turn24search1turn23search4 | Has the right *shape*—“invariance/exactness iff restrictive proportional structure”—but the object being aggregated is demand or index numbers, not hidden harm under cost-minimizing effort substitution. | Analogy, not same theorem |
| **Lipsey–Lancaster second best** | With one distortion already present, reducing another distortion need not improve welfare; interventions on additional margins can go either way. citeturn16search1turn16search11turn16search4 | Best language ancestor for the sign ambiguity in (C): adding a new measured channel can raise or lower hidden harm. But it is not the theorem generating the weighted-average formula. | Good explanation for the sign ambiguity only |

## Why Feltham and Xie is the best candidate

Budde’s exposition is the cleanest accessible reduction. In the separable quadratic multitask agency model, he writes the principal’s objective as a linear form in effort and the performance measure as another linear form in effort, with linear compensation and quadratic effort costs. He then states that the principal’s contracting problem is a special case of Feltham and Xie (1994), and shows that under risk neutrality the second-best surplus depends on \((d^\top y)^2 / (y^\top y)\), where \(d\) is the true-objective coefficient vector and \(y\) is the performance-measure coefficient vector. The resulting congruity index is \((d^\top y)^2 /[(d^\top d)(y^\top y)] = \cos^2\beta\), so maximal congruity occurs exactly when the vectors point in the same direction. citeturn19view0turn20view0

Schnedler then states the same condition in the exact vocabulary you were already circling around: a performance measure and the principal’s benefit are **congruent if their coefficient vectors have the same direction**, \(b=\gamma\beta\). He also makes explicit that this direction-equality notion is the common core behind the Feltham–Xie discongruity measure, Baker’s distortion language, and Datar–Kulp–Lambert’s incongruity language. citeturn6view0

Under the rescaling \(x_j=a_j/\sqrt{\kappa_j}\), your model is the equal-cost version of that same setup. Write

\[
b_j = w_j\sqrt{\kappa_j},
\qquad
\beta_j = h_j\sqrt{\kappa_j}.
\]

The agent’s cheapest way to hit measured deficit \(d\) on subset \(S\) is

\[
x^*(S)= d\,\frac{b_S}{\|b_S\|^2}.
\]

The hidden harm is then

\[
\beta_S \cdot x^*(S)=d\,\frac{\beta_S\cdot b_S}{\|b_S\|^2}.
\]

If \(\beta=c\,b\), this equals \(cd\) for every nonempty \(S\). Conversely, singleton subsets force \(\beta_j/b_j\) to be the same for all \(j\). That is exactly your (D). So the theorem being rediscovered is not a new invariance theorem; it is the old congruity theorem after a banal cost-normalizing change of variables. citeturn6view0turn19view0turn20view0

The gap is precise. Feltham and Xie do **not** literally state “hidden harm is invariant across all measured subsets iff \(h_j=cw_j\).” They state the older and broader object: effort distortion disappears when the performance-measure vector is proportional to the true-value vector. Your (D) is a corollary reached by specializing to a fixed-deficit conditional-effort problem and then asking a subset-invariance question they did not ask. citeturn19view0turn6view0

## Banker and Datar as the strongest aggregation-language precedent

If you prefer the precedent to come from **aggregation of measured channels** rather than the multitask-agency literature, Banker and Datar are the strongest alternative. They study optimal **linear aggregation of signals** and show that relative weights in the optimal aggregate are proportional to a signal’s **sensitivity × precision**. They also state a result with the exact form “a pure aggregate is optimal iff a componentwise proportionality condition holds”: the performance measure can be written using the pure profit number alone only when the revenue and cost signals have equal intensity, and simple aggregation of cost components into one cost pool is optimal iff the individual components have the same intensity. citeturn2view0turn12view2turn12view3

That is very close to your (D). In their language, “subset/grouping choice does not matter only under equal intensity” is the same shape as your “measured subset does not matter only under \(h_j=cw_j\).” The reason I still rank them second is the precise mismatch in primitives. Banker and Datar’s coefficients are **signal sensitivities and precisions in a noisy measurement system**. Your coefficients are **marginal score weights and hidden-harm rates under deterministic least-cost effort substitution**. With a change of variables and a reinterpretation of intensities, one can make the correspondence feel natural, but it is less exact than the Feltham–Xie/Budde/Schnedler mapping. citeturn2view0turn12view2

So: Banker and Datar supply a very strong precedent for the *verbal form* of (D), but Feltham and Xie supply the stronger precedent for the *actual optimization problem*. citeturn19view0turn12view2

## Older economic and OR ancestors for the optimization backbone

The least-cost part of your structure is not new at all. It is standard conditional cost minimization. In production and consumer duality, cost minimization under a target gives conditional demands, and Shephard’s lemma recovers them from the cost function. Modern lecture notes still teach the result in exactly that form: solve the cost-minimization problem \(x^*=z(w,y)\), define the cost function \(c(w,y)=w\cdot z(w,y)\), and conditional factor demands follow from the derivative of the cost function. citeturn32search10turn32search8

Environmental economics is full of the same logic in policy language. Baumol and Oates’ classic least-cost-control argument is that a uniform emissions price induces each firm to abate until marginal abatement cost equals the common price, thereby equalizing marginal costs across sources and minimizing total cost for a fixed environmental target. Montgomery’s permit-market theorem formalized the same point for tradable licenses. That is your Lagrange-multiplier solution with different nouns. citeturn28search1turn28search8turn28search15

This older literature also explains the sign ambiguity in (C). Once you add an extra behavioral margin or intervention margin, the overall effect on a hidden externality is not monotone in the count of margins. In the language of second-best theory, extra adjustment margins can improve or worsen the overall distorted allocation; there is no monotone “more measured channels always lower harm” theorem. Lipsey and Lancaster’s theorem is the canonical statement of that cautionary logic. citeturn16search1turn16search11turn16search4

But this older literature does **not** give (D) by itself, because it usually optimizes the socially relevant objective or prices the externality. Your distinctive twist is misalignment: the agent closes a measured deficit while ignoring a hidden linear form. That is why the true direct precedent for (D) is the congruity/distortion literature, not pure cost-minimization alone. citeturn28search1turn19view0

## Aggregation and index-number analogies that do not quite close the gap

I checked the aggregation-theory and index-number route directly because your statement has the flavor of a classic **invariance / consistency in aggregation iff restrictive proportionality** theorem. There is real overlap in form. Gorman’s aggregation tradition characterizes when exact linear aggregation is possible; later summaries state that exact linear aggregation holds iff preferences are of the Gorman polar form with parallel coefficients. In the separability literature, strong or additive aggregation likewise requires restrictive structures. citeturn24search0turn24search1turn24search4

Diewert’s consistency-in-aggregation results have the same “exactness only under narrow forms” feel. Later summaries of his 1978 paper note that Vartia I indices are exact only for Cobb–Douglas aggregators, and related exact-in-aggregation results likewise hinge on narrow functional forms such as Cobb–Douglas or CES. citeturn23search4turn23search1turn23search17

But I do **not** think this is the real source of your result. The correspondence breaks at the mathematical object. Gorman/Diewert are proving exactness of demand or price-index aggregation under weak separability / exact aggregator assumptions. They are not solving a mismeasured linear-quadratic hidden-action problem and asking when a hidden linear form is invariant across all measurement subsets. So these searches produced strong analogies, not the theorem you want to cite as the actual ancestor. citeturn24search1turn23search4

Holmström’s sufficient-statistic theorem is similar: it gives a general irrelevance criterion—an extra signal changes the optimal action iff it is informative beyond the existing statistic—but it stops short of your proportionality theorem. Holden’s restatement of Holmström makes this very explicit: the optimal action depends on an additional signal iff the already-used statistic is not sufficient. That is the right ancestry for “extra channels can be irrelevant,” but not yet the right reduction for “invariance across every subset iff \(h_j=cw_j\).” citeturn34view0turn2view0

## Auditable search record and what came up empty

I pushed the search under the vocabularies you specified and got the following pattern.

The **direct hits** came from the multitask-agency / accounting lineage: Feltham–Xie on congruity, Baker on distortion, Banker–Datar on linear aggregation of signals, and later expositions by Budde and Schnedler that make the coefficient-vector geometry explicit. Those are the sources that actually reduce to your theorem after the \(\sqrt{\kappa_j}\) rescaling. citeturn19view0turn6view0turn21search4turn2view0

The **cost-minimization and environmental-economics searches** found the correct backbone for (C): conditional cost minimization, equimarginal allocation, least-cost abatement, and efficient pollution control under common prices or permit markets. They explain the weighted-average structure and the non-monotone effect of adding a channel. But they do not formulate the all-subsets invariance theorem (D). citeturn32search10turn28search1turn28search8

The **aggregation/index-number searches** produced only analogies: exact linear aggregation and consistency in aggregation exist only under restrictive forms, but I did not find a pre-2000 theorem in that literature that literally reduces to your hidden-harm subset-invariance statement under a straightforward change of variables. The same is true of the **team-theory** search: Marschak–Radner and later linear-quadratic team theory are in the same broad neighborhood, but I did not find a theorem there stating or nearly stating (D). citeturn24search0turn23search4turn36search11

So the auditable negative is this: I did **not** find a cleaner pre-2000 theorem in Gorman/Diewert/Vartia or Marschak–Radner that states your subset-invariance result more directly than the Feltham–Xie congruity theorem does. Those searches came up analogical, not exact. The best exact ancestor remains the Feltham–Xie multitask congruity result, with Banker–Datar as the best aggregation-language fallback. citeturn24search0turn23search4turn36search11turn19view0turn12view2