# Iteration log

## Iteration 1

Question tackled: dimensional dependence of hidden Goodhart harm under threshold selection.

What changed: created the research file structure and added a first linear-Gaussian toy model. The main calculation shows that, for `X ~ N(0, Sigma)` and selection on `X_1 >= t`, hidden mean drift is `sigma_1 lambda(t / sigma_1) r`, where `r` is the vector of covariance ratios between hidden coordinates and the selected proxy.

What's open now: dimensional scaling requires assumptions about how `||r||_2` grows with the number of hidden dimensions. The correct harm functional remains unsettled.

Red flags fired: one `[confident]` claim triggered adversarial review. It survived only with explicit restriction to the Gaussian toy model.

Commit: `d210cff` (`Add first dimensional Goodhart iteration`).

## Iteration 2

Question tackled: the red-flagged dependence on Gaussian covariance from iteration 1.

What changed: added a nonlinear counterexample showing that `Cov(H, P) = 0` can coexist with nonzero threshold drift. Added threshold response notation `b_H(t) = E[H | P >= t] - E[H]` to the formalization.

What's open now: `b_H(t)` handles hard-threshold selection but not soft optimization, repeated selection, or adversarial adaptation. We still need assumptions under which covariance is an acceptable approximation.

Red flags fired: one `[confident]` negative claim triggered adversarial review and was logged as clear but narrow.

Commit: `5e62ebe` (`Refine dimensional dependence coupling`).

## Iteration 3

Question tackled: what selection-response operator should replace threshold response for soft optimization.

What changed: added weighted selection response notation to `formalization.md` and created `research/threads/selection_response.md`. The main derivation shows that under Boltzmann selection `W_beta = exp(beta P)`, `d E_beta[H] / d beta = Cov_beta(H, P)`, so covariance is a local velocity along a selection path rather than a finite-pressure summary.

What's open now: weighted response still assumes a fixed baseline distribution. Causal and adversarial Goodhart need a model where the distribution `mu` changes with the regulator's policy.

Red flags fired: the scheduled iteration-3 adversarial pass downgraded the scope of threshold response and motivated the weighted-response generalization.

Commit: `f6186d8` (`Add weighted selection response iteration`).

## Iteration 4

Question tackled: open question 8 — how the framework should represent policies that change the baseline distribution `mu`, not merely reweight it (causal/adversarial Goodhart).

What changed: introduced the **response channel** `R: Theta -> P(S)` as the top-level object, split into selection channels (`mu_theta << mu_0`; contains all of iterations 1-3) and intervention channels (`mu_theta` can be singular w.r.t. `mu_0`). Proved an elementary drift bound for selection channels (`||B_H|| <= delta · ||s||`, all baseline functionals) and argued no baseline analogue exists for intervention channels. Built a linear-Gaussian Stackelberg gaming toy model: agents pay quadratic cost `a^2/(2kappa)` to inflate the proxy, selection worth `V`; equilibrium gaming wedge `Delta = sqrt(2 kappa V)` sets both the proxy's worst-case bias and the induced hidden harm, and is exogenous to `mu_0`. Created `research/threads/intervention_response.md`; updated `formalization.md`, `open_questions.md` (added Q10-13), `red_flags.md`.

What's open now: a general intervention-channel bound for convex (non-quadratic) gaming costs (Q10); endogenous-stakes / performative fixed point (Q11); exact agent-model condition for staying inside the selection class (Q12); multidimensional gaming reconnecting to the dimensional thread (Q13).

Red flags fired: none triggered the adversarial sub-protocol (no `[confident]` claims; iteration 4 is not a multiple of 3). Logged one watch item in `red_flags.md`: the selection-channel bound is elementary — don't over-sell the inequality; the contrast is the content. Next scheduled adversarial pass: iteration 6.

Commit: `406c75c` (`Add intervention-vs-selection response iteration`).

## Iteration 5

Question tackled: open question 13 — multidimensional gaming. Does adding a measured proxy dimension redistribute, conserve, shrink, or grow gaming harm in the intervention regime? Rejoins the dimensional thread.

What changed: built a multidimensional Stackelberg gaming toy — `k` channels, channel `j` costs `a_j^2/(2 kappa_j)` and yields harm `H_j = a_j`, regulator measures set `M` and aggregates. **Additive/compensatory metric**: cost-minimal allocation is water-filling `a_j = t kappa_j / K_M` (`K_M = sum_{j in M} kappa_j`); gaming occurs iff `K_M >= t^2/(2V)`; total harm `H = t`, invariant to `M` — closing a gamed channel only re-routes the fixed total; expanding `M` raises `K_M`, lowers the cheapest gaming cost, recruits more gamers (backfire). **Conjunctive metric**: `H = t|M|`, linear in measured dimensions. So dimensional dependence of gaming harm is governed by the aggregation rule, not dimension count. Scope: assumes equally-wasteful gaming; with goal-aligned channels (`gamma_j > 0`) the regulator *can* shrink harm by steering effort onto high-`gamma` channels. Added Iteration-5 sections to `threads/intervention_response.md` and a cross-ref in `threads/dimensional_dependence.md`; updated `formalization.md`, `open_questions.md` (Q14-16), `negative_results.md` (two entries: re-routing doesn't reduce harm; "more dims" has no sign without fixing aggregation), `red_flags.md` (watch item).

What's open now: adaptive-hardening dynamics and convergence (Q14); the regulator's measurement frontier between informativeness and attack-surface size (Q15); sub/supermodularity of `H(M)` for mixed aggregation (Q16); unequal-weight additive metrics interpolating the additive/conjunctive extremes.

Red flags fired: none triggered the adversarial sub-protocol (all claims `[tentative]`; iteration 5 not a multiple of 3). Logged a watch item; iteration 6 is a scheduled adversarial-pass iteration and should attack the conservation-under-re-routing claim.

Commit: `40ed0b9` (`Add multidimensional gaming iteration`).

## Iteration 6

Question tackled: scheduled adversarial pass on iteration 5's conservation-under-re-routing claim.

What changed: attacked the additive conservation result as a skeptical referee. The original Lagrange solution is still correct, but the headline was too broad. Re-solved the additive quadratic model with score weights `w_j` and harm rates `h_j`: for fixed score deficit `d`, harm is `H_M(d) = d (sum h_j kappa_j w_j)/(sum kappa_j w_j^2)`, so conservation under re-routing holds iff channels are equally harmful per score unit (`h_j = c w_j`). Also separated per-agent fixed-deficit harm from aggregate population harm: with heterogeneous quality, adding a gameable channel raises `K_M`, expands the profitable gaming band, and increases aggregate harm whenever there is population mass in that band. Updated `threads/intervention_response.md`, `formalization.md`, `open_questions.md` (Q17), `negative_results.md`, and `red_flags.md`.

What's open now: population-vs-per-agent welfare object for gaming harm (Q17); general convex-cost version of the exchange-rate condition (Q10); adaptive hardening dynamics (Q14); sub/supermodularity with weighted aggregation (Q16).

Red flags fired: scheduled adversarial pass did fire and found a real overstatement. Claim repaired and downgraded in scope; no `[confident]` claims added.

Commit: `0e2b166` (`Run adversarial pass on conservation claim`).

## Iteration 7

Question tackled: Q18 — whether proxy optimization pressure induces a minimum-complexity hidden-drift attractor.

What changed: added `research/threads/minimum_complexity_attractor.md` as a `generate` iteration. The main result is negative/repairing: selection channels follow baseline tail response, not a complexity optimum; intervention channels follow cost/search geometry. In a quadratic intervention model with target `w . a >= d` and cost `(1/2) a^T C^{-1} a`, the KKT solution is `a^* = d C w/(w^T C w)`, which can be dense. Sparse minimum-complexity behavior appears in fixed-charge or linear-cost models, where the cheapest single route can dominate. Updated `formalization.md`, `open_questions.md`, `negative_results.md`, `red_flags.md`, and `verification_stack.md`.

What's open now: choose a pre-specified complexity functional (support, rank/spectral concentration, description length, KL from max-entropy prior) and test which response geometries align with it; separate private cost, search accessibility, and semantic simplicity; decide whether Appendix G should get a later review/edit iteration before any stronger draft claim.

Red flags fired: yes. The broad Q18 claim was rhetorically convenient and equivocated between cheap, simple, sparse, low-rank, and low-description-length. Logged as `needs-adversarial-review`; repaired to a conditional response-geometry attractor claim.

## Iteration 8

Question tackled: review of recursive Goodhart / Q18 claim license after Iteration 7.

What changed: created `research/reviews/recursive_goodhart_q18.md` and `research/claim_audits.md`. The review found that the PDF already handles Appendix G cautiously, but the generic repair "response-geometry attractor" is too low-information unless paired with specific response-shape predictions. The audit now distinguishes dense quadratic-cost drift, sparse fixed-charge/linear-cost drift, low-rank affordance drift, and low-description-length search-prior drift.

What's open now: a future generate/simulation iteration should pick one pre-specified complexity or shape measure and compare response geometries under that measure. A later edit iteration could tighten `draft.md`'s "complexity" language if that draft is still active.

Red flags fired: yes, but as a repair to an existing red flag rather than a new theorem. Logged that "response-geometry attractor" is safe but too broad unless it preserves geometry-to-shape predictions.

## Iteration 9

Question tackled: scheduled adversarial review of the Iteration 8 response-shape predictions for repaired Q18.

What changed: created `research/reviews/response_shape_predictions.md` and updated `claim_audits.md`, `red_flags.md`, and `negative_results.md`. The review preserved the geometry-to-shape table but narrowed each row: quadratic models predict cost-minimal drift along `C w`, dense only when `C w` is dense and constraints do not bind; fixed-charge/linear models predict one-channel drift only in the uncapped, no-tie, linear marginal case; low-rank action maps restrict drift to a low-dimensional image rather than giving a basis-invariant spectral claim; simplicity-biased search requires a pre-specified coding/search prior.

What's open now: a future generate or simulation iteration should choose one row of the narrowed table and test it under explicit coordinates, constraints, and value basis. The most useful next candidates are capped fixed-charge models, active-face quadratic models, or a pre-specified search-prior toy.

Red flags fired: yes. The sharper Iteration 8 table risked becoming a new overclaim. The repair keeps the informative predictions while attaching model clauses and representation caveats.

## Iteration 10

Question tackled: capped fixed-charge response shapes as a concrete Q18 geometry-to-shape prediction.

What changed: created `research/threads/capped_fixed_charge_response.md` and updated `claim_audits.md`, `negative_results.md`, and `open_questions.md`. The new thread separates the uncapped one-channel result from capped linear spillover and the full fixed-charge-plus-caps model. In the no-activation/already-activated capped linear case, channels fill by increasing effective marginal cost `q_j/w_j` until caps bind. With positive fixed costs, sorted filling is no longer universal; active sets can switch as `d` crosses fixed-cost and cap thresholds.

What's open now: compare the capped fixed-charge support path against active-face quadratic response under the same hidden coordinate system; add convex marginal costs, detection penalties, or risk diversification to see when lumpy spillover becomes smoother spreading.

Red flags fired: no new scheduled adversarial pass. A narrower negative result was logged: capped fixed-charge response should not be summarized as universal sorted marginal-cost filling.

## Iteration 11

Question tackled: open questions 8 and 12 — repair the selection/intervention boundary after the absolute-continuity criterion proved too brittle.

What changed: created `research/threads/response_kernel_boundary.md` as a `generate` iteration. The new formal object is a type space `U`, baseline type law `nu`, participation weights `W_theta(u)`, and response kernels `K_theta(ds | u)`, with induced law `mu_theta(A) = int W_theta(u) K_theta(A | u) nu(du) / int W_theta(u) nu(du)`. Pure selection is now defined relative to `(U, K_0)` by `K_theta = K_0` and policy dependence only through `W_theta`; intervention is `K_theta != K_0` on a positive-mass set of types. This preserves weighted selection while handling epsilon-baseline gaming, where `mu_theta << mu_0` can still hold even though the policy changes fixed-type behavior. Updated `formalization.md`, `open_questions.md`, `claim_audits.md`, `negative_results.md`, `red_flags.md`, and `verification_stack.md`.

What's open now: the boundary is representation-relative and not identifiable from marginal `mu_theta` alone. Applications must declare what counts as fixed type, what counts as manipulable action, and what evidence distinguishes reweighting from response. This sets up later work on convex intervention bounds and ML mappings of `kappa`.

Red flags fired: a representation caveat was logged. The response-kernel repair is useful, but not an intrinsic observed-law classification; too rich a type space can absorb interventions into type, while too coarse a type space can make heterogeneity look like kernel change.

## Iteration 12

Question tackled: scheduled adversarial review of Iteration 11's response-kernel boundary.

What changed: created `research/reviews/response_kernel_boundary.md` and updated `claim_audits.md`, `negative_results.md`, and `red_flags.md`. The review stress-tested whether "selection changes only `W_theta`; intervention changes `K_theta` at fixed type" is useful or just hides ambiguity in the type space. It found the boundary useful but strictly representation-relative: participation-only response remains pure selection; epsilon-baseline gaming remains intervention despite absolute continuity; proxy-only manipulation is intervention for proxy validity but not necessarily hidden harm; and representation changes can flip the classification unless `U` is declared as part of the causal model.

What's open now: applications need explicit evidence plans. Marginal `mu_theta` data alone generally cannot identify whether a change came from type reweighting or fixed-type response; credible use needs repeated-type observations, randomized policy exposure, action traces, or structural assumptions. No change was needed to the compact definition in `formalization.md`.

Red flags fired: scheduled adversarial pass. The stronger claim "the boundary is identifiable from distributions alone" was logged as dead; the surviving claim is a causal type/action representation license, not an intrinsic observed-law classifier.

## Iteration 13

Question tackled: Q10 — an intervention-channel analogue of the selection bound for general convex gaming costs.

What changed: created `research/threads/convex_intervention_bound.md` and updated `formalization.md`, `open_questions.md`, `claim_audits.md`, `negative_results.md`, and `red_flags.md`. The new thread defines fixed-type actions `a in A(u)`, costs `c_u(a)`, proxy gain `p_u(a)`, hidden displacement `h_u(a)`, stakes `V`, and the affordable set `B_u(V) = {a: c_u(a) <= V}`. The intervention envelope is `||h_u(a^*)|| <= sup_{a in B_u(V)} ||h_u(a)||`. For linear proxy gain and convex cost, the score-deficit cost is `m(d) = sup_{lambda >= 0} [lambda d - c^*(lambda w)]`, with gaming feasible iff `m(d) <= V`.

What's open now: extend the deterministic convex bound to stochastic response and endogenous `V`; connect it to fixed-charge/nonconvex regime switches without flattening Iteration 10's lumpy response story; and decide what evidence could identify `c_u`, `V`, and `h_u` in applications.

Red flags fired: no scheduled adversarial pass, but a watch item was logged. The convex formula is useful only as a conditional cost-geometry primitive. Convex affordability is not a welfare bound unless hidden harm/value weights are declared.

## Iteration 14

Question tackled: what methodological object should replace broad "Goodhart pressure has a characteristic shape" claims after the response-kernel and response-geometry repairs?

What changed: created `research/threads/response_modeling_contract.md` and updated `formalization.md`, `open_questions.md`, `claim_audits.md`, and `verification_stack.md`. The new object is a response-modeling contract: a Goodhart claim must declare type space `U`, baseline kernel `K_0`, policy exposure `theta`, selection weights `W_theta` and/or response kernels `K_theta`, action/cost/search geometry, proxy/target relation, aggregation rule, hidden welfare/harm model, and evidence standard.

What's open now: write domain-specific application templates and use the contract to guide the next book chapter. The danger is turning "response modeling" into the empty statement that assumptions matter; the repair is to require each contract to name the calculation or falsifier it licenses.

Red flags fired: no scheduled adversarial pass. A scope guard was added in the thread and audit: the contract does not license a new universal theorem, identification from marginal distributions alone, or welfare conclusions from proxy movement without a hidden harm model.

## Iteration 15

Question tackled: math-quality consolidation of the core response-modeling claims, especially the coordinate bookkeeping gap in the selection bound.

What changed: created `research/threads/core_propositions_and_value_norms.md`. The new thread promotes three calculations into proposition sketches: the pure-selection drift bound with `L = d mu_theta / d mu_0`, finite second moments, and `chi^2(mu_theta || mu_0) < infinity`; the convex intervention score-deficit budget `m(d) = sup_{lambda >= 0} [lambda d - c^*(lambda w)]` under finite-dimensional convex regularity; and the additive conservation iff-condition for quadratic separable costs, weighted additive score, linear harm, and fixed deficit. It also replaces the coordinate-only selection bound with a scalar/operator value version: for `V_H = v . (H - E H)`, `|Delta V_H| <= delta sqrt(v^T Sigma_H v)`, with the old Euclidean bound recovered only after declaring identity as the hidden value metric.

What's open now: value weights, type spaces, costs, and response kernels remain modeling commitments or empirical targets; they are not identified from `mu_theta` alone. Simulations are still needed for population harm, stochastic response, adaptive hardening, and repeated proxy-repair dynamics.

Red flags fired: proposition language watch item. The pass raises Layer-1 rigor but should not be read as a new universal theorem or as making the selection bound representation-free without a declared hidden value metric.
