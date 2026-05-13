# Claim audits

## Recursive Goodhart / Q18 audit (Iteration 8)

| Claim one might use | What is licensed | What is not licensed | Intended use |
| --- | --- | --- | --- |
| Repeated proxy repair can move residual error into less legible dimensions. | Mechanism-level plausibility: selection follows baseline response; intervention follows cost/search geometry; cheap or underrepresented channels can remain after visible fixes. | A theorem that residuals generically become less legible under proxy repair. | Frame Appendix G and motivate dynamic models or empirical tests. |
| Residual error becomes more complex over time. | Only as a question after choosing a complexity measure. Iteration 7 separates support, rank, description length, KL, entropy, and cost. | A monotone law of increasing residual complexity. | Replace with sharper claims about pre-specified residual shape. |
| Minimum-complexity attractors explain Goodhart drift. | Conditional versions: fixed activation/linear costs can produce sparse attractors; low-rank affordances can produce concentrated drift; search priors can favor low-description-length failures. | A generic minimum-complexity theorem. Quadratic cost can produce dense cost-minimal drift. | Generate testable response-shape predictions. |
| Response-geometry attractor is the repaired Q18 concept. | Top-level safety correction: the response process selects according to cost/search/baseline geometry. | By itself, it is too broad to be informative. It must be paired with a predicted shape: dense, sparse, low-rank, low-description-length, etc. | Organize Q18 subcases without overclaiming. |
| Appendix G is speculative. | The PDF explicitly says it is not a theorem and gives support/failure conditions. | That the recursive hypothesis has been operationalized enough for a domain test. | Keep as orientation; do not promote without review/edit iteration. |

## External skeptical-analysis audit

| Claim one might use | What is licensed | What is not licensed | Intended use |
| --- | --- | --- | --- |
| Selection vs. intervention is exactly absolute continuity vs. singularity. | Absolute continuity is the right formalism for pure reweighting, and singularity is decisive evidence that baseline-only selection bounds fail. | A causal boundary. If baseline has `epsilon` mass on gaming-like behavior, an induced intervention can remain absolutely continuous while still changing the response kernel at fixed type. | Define intervention by fixed-type response/action kernels; use singularity only as a clean special case. |
| The selection bound is coordinate-free. | `||B_H||_2 <= delta ||s||_2` is valid after declaring hidden coordinates and the Euclidean norm. | Invariance to splitting, rotating, or duplicating hidden coordinates. | Relabel as coordinate-explicit unless rewritten with a value-weighted covariance/operator norm. |
| `Delta = sqrt(2 kappa V)` explains neural training. | It is the signature of the one-dimensional quadratic Stackelberg toy. | Any direct RLHF, finetuning, or reward-model claim without identifying what `kappa` and `V` correspond to. | Use as a contrast class: ML mappings must specify gradient accessibility, pretraining density, contamination, feature simplicity, or search efficiency. |
| More metrics are worse. | In separable additive scorecards, an independently gameable measured dimension lowers the minimum gaming cost and can recruit more gamers. | A general sign claim under correlated costs, caps, bottlenecks, dynamic reweighting, conjunctive gates, or high-real-signal tasks. | Benchmark-design checklist, not slogan. |

## Response-kernel boundary audit (Iteration 11)

| Claim one might use | What is licensed | What is not licensed | Intended use |
| --- | --- | --- | --- |
| Pure selection means reweighting fixed type-conditional behavior. | With type law `nu`, response kernel `K_0(ds | u)`, and participation weight `W_theta`, pure selection has `K_theta = K_0` and changes only type weights. The joint law on `(u, s)` is a reweighting of baseline. | A representation-free claim. If `U` is enriched to include future response plans, apparent intervention can be absorbed into type. | State exactly when selection-response bounds apply, after declaring what counts as fixed type. |
| Intervention means fixed-type response changes. | If `K_theta != K_0` on a positive-mass set of types, the policy changes behavior at fixed type even if the induced `mu_theta` remains absolutely continuous. | A welfare claim that every intervention is harmful. Proxy-only manipulation can change `P` while leaving `H` fixed. | Route intervention analysis toward cost/action geometry while keeping harm as a separate claim. |
| The distinction is causal and representation-relative. | The boundary is meaningful after declaring the type/action representation and why it is substantively fixed rather than an ex post response encoding. | Identifiability from marginal `mu_theta` alone, invariance under arbitrary redefinition of `U`, or a unique decomposition into `W_theta` and `K_theta`. | Force application mappings to state what is fixed type, what is action, and what observations distinguish reweighting from response. |
| Marginal distribution shifts can classify the channel. | Marginals can sometimes falsify a declared pure-selection model, for example if they put mass outside the baseline joint support. | General identification. The same `mu_theta` can arise from changed weights or changed kernels. | Treat observed distributions as evidence to combine with repeated-type data, experiments, action traces, or structural assumptions. |

## Convex intervention bound audit (Iteration 13)

| Claim one might use | What is licensed | What is not licensed | Intended use |
| --- | --- | --- | --- |
| Intervention drift has a bound analogous to the selection bound. | Conditional on a declared action space, cost `c_u`, stakes `V`, and hidden displacement `h_u`, fixed-type hidden movement is bounded by the affordable action set `B_u(V) = {a: c_u(a) <= V}`. | A baseline-only bound, or a bound identifiable from `mu_theta` without an action/cost model. | Explain what extra structure replaces baseline reweighting in intervention channels. |
| Convex duality gives a general gaming budget. | For linear proxy gain and closed proper convex cost, the cost of buying score deficit `d` is `m(d) = sup_{lambda >= 0} [lambda d - c^*(lambda w)]` under standard regularity. | Applicability to nonconvex fixed charges, unknown costs, stochastic equilibrium, or arbitrary policy feedback. | Recover quadratic wedges and compare smooth vs. nonsmooth response geometries. |
| Convex costs make intervention harm small. | Convex costs can bound feasible action magnitude under finite stakes. | A welfare bound without declared hidden harm/value weights. Affordable proxy movement can still be high-harm if `h_u` is large or misaligned with `w`. | Keep proxy feasibility, private cost, and hidden welfare separate. |

## Response-modeling contract audit (Iteration 14)

| Claim one might use | What is licensed | What is not licensed | Intended use |
| --- | --- | --- | --- |
| A Goodhart claim must declare a response model. | Claims about shape, harm, and evidence should state type space, policy exposure, response channel, action/cost geometry, proxy/target relation, aggregation, and evidence standard. | A new universal theorem about all Goodhart pressure. | Prevent underspecified claims and route applications to the right mathematical object. |
| Selection/intervention is representation-relative. | The distinction is meaningful after declaring which attributes are fixed type and which are action/response. | Identification from marginal `mu_theta` alone or invariance to arbitrary enrichment/coarsening of `U`. | Force applications to defend `U` and name observations that distinguish reweighting from fixed-type behavior change. |
| Response modeling replaces Goodhart slogans. | Different contracts license different calculations: selection curves, reweighting bounds, intervention budgets, aggregation exchange rates, or shape predictions. | The empty statement that "everything depends on assumptions." A useful contract must name a downstream calculation or falsifier. | Make the framework methodological rather than slogan-driven. |
| Proxy-only manipulation is intervention. | It can be intervention for proxy validity when `K_theta` changes at fixed type. | A hidden-welfare harm claim. Harm requires a separately declared `H`, value weight, or welfare model. | Keep proxy validity, action response, and welfare harm distinct. |

## Response-shape prediction audit (Iteration 9)

| Shape prediction | What is licensed | What is not licensed | Intended use |
| --- | --- | --- | --- |
| Quadratic costs predict dense drift. | In the unconstrained positive-definite model, the cost-minimal action is `a^* = d C w/(w^T C w)`. It is dense when `C w` is dense in the pre-specified action basis and no extra feasibility constraints bind. | Density from quadratic cost alone. Diagonal `C` with sparse `w`, rank-deficient `C`, nonnegativity, caps, or active faces can make the realized drift sparse or constrained. | Say "cost-minimal drift along `C w`; often dense under dense coupling," not simply "dense." |
| Fixed activation / linear costs predict one-channel drift. | In the uncapped, no-tie, linear marginal model, the optimum uses the cheapest effective channel. More generally, fixed charges license lumpy or low-support responses. | One-channel sparsity under caps, ties, convex post-activation costs, detection penalties, or risk diversification. | Use as a toy sparse-attractor theorem only with the model clauses attached. |
| Low-rank action maps predict spectrally concentrated drift. | A low-rank map `L` restricts hidden drift to `im(L)`. Spectral concentration is licensed after specifying the hidden representation and value basis. | A basis-invariant claim that low-rank affordances make every realized hidden drift low-rank or visibly concentrated. | State as an affordance-subspace prediction; add representation caveat when discussing rank/spectrum. |
| Simplicity-biased search predicts low-description-length drift. | Predictive only when the search prior, description language, or parameter-function map is specified before observing the failure. | Post-hoc labeling of an observed failure as "simple." Simplicity independent of the actual generator/search process. | Require pre-specified coding/search prior before using low-description-length as evidence. |

## Capped fixed-charge response audit (Iteration 10)

| Shape prediction | What is licensed | What is not licensed | Intended use |
| --- | --- | --- | --- |
| Fixed activation / linear costs predict one-channel drift. | One-channel drift in the uncapped model with a unique minimizer of `F_j + d q_j/w_j`. The active channel may change as `d` changes. | A fixed cheapest channel across all pressure levels, or one-channel drift after caps bind. | Use as the base sparse-attractor case. |
| Caps produce spillover. | With zero/already-paid activation costs, finite caps, and distinct `q_j/w_j`, the optimizer fills channels by increasing effective marginal cost until the target is met or infeasible. | Universal sorted filling in the full fixed-charge model. Positive `F_j` can make the optimizer skip or switch channels. | Use as the concrete lumpy support-growth prediction. |
| Fixed charges plus caps produce thresholded regimes. | Active sets change at cost/cap thresholds; support can jump or switch as `d` rises. | A single monotone support path without additional assumptions. | Treat as a finite active-set comparison, not a smooth convex response. |
