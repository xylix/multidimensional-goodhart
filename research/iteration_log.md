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

## External review integration pass

Question tackled: how should the Gemini external review and Claude pushback
change the rigor-improvement pass before Iteration 16?

What changed: updated the book's licensed-claims framing so the response-modeling
contract is the transfer rule for applications: exact toy bounds apply only
after the application declares matching type, response-channel, action/search,
aggregation, hidden-harm, and falsifier objects. Sharpened the ML paragraph to
say that missing `kappa`, `V`, or cost/search analogues make an ML application
underspecified, not evidence for or against the framework. Updated
`claim_audits.md` to distinguish framework/taxonomy use from direct RLHF
prediction and to keep the separable additive theorem clean rather than
weakening it into a generic "it depends" claim.

What's open now: Iteration 16 should still promote the propositions cleanly and
add compact "licenses / does not license" interpretation sentences. Do not add
new theorem families, broad simulation suites, or prevalence-harm notation just
to answer external-review caveats.

Red flags fired: no new mathematical red flag. The main presentation risk is
caveat inflation: making a scoped theoretical paper read apologetic rather than
precise.

## Iteration 16

Question tackled: book propagation for the core proposition sketches without
weakening their assumptions.

What changed: added the Stackelberg wedge proposition sketch to
`research/threads/core_propositions_and_value_norms.md`, then promoted five
reader-facing propositions in `book/multidimensional-goodhart.typ`:
coordinate-explicit selection drift, value-weighted/operator selection drift,
the one-dimensional quadratic Stackelberg wedge, the convex score-deficit
budget, and the additive exchange-rate iff-condition. The convex-cost section
is now `<sec:convex-cost-bound>` rather than a conjecture, with the Fenchel dual
formula stated under finite-dimensional closed proper convex cost and standard
regularity. Each promoted block includes compact license and non-license
boundaries. Updated `claim_audits.md`, `verification_stack.md`, and
`red_flags.md` so the audit trail matches the book.

What's open now: welfare-object notation, active-face repairs, stochastic
Stackelberg response, population harm, adaptive hardening, and simulations
remain later work. The convex proposition is a private-cost score-deficit
budget, not a welfare theorem. The Stackelberg wedge remains a quadratic
threshold toy, not a direct neural-training model.

Red flags fired: the coordinate-free selection-bound issue is narrowed because
the book now separates coordinate-explicit and value-weighted/operator forms.
The proposition-language watch remains open: later prose must keep hypotheses,
license boundaries, and methodological claims distinct.

## Iteration 17

Question tackled: welfare-object discipline for intervention gaming claims,
especially conservation, backfire, and dimensional gaming.

What changed: introduced the notation `H_per(M, d)` for fixed-deficit
per-agent harm and `H_pop(M; F_Q, V)` for population harm after heterogeneous
agents decide whether gaming is worthwhile. Updated the book's Chapter 3
multidimensional-gaming section so Proposition 4 is explicitly a conservation
result for `H_per`, while "adding a gameable measured dimension backfires" is
an `H_pop` claim driven by expansion of the gaming band. The unit-weight
equal-harm case now states `H_per(M, d) = d`, with the old `H = t` slogan
limited to the fixed-deficit pure-gaming case. The conjunctive section now
separates per-gamer harm `t|M|` from population harm, whose sign depends on
entry. Propagated the same distinction through
`research/threads/intervention_response.md`, `research/claim_audits.md`,
`research/formalization.md`, and `research/open_questions.md`.

What's open now: the right population welfare object under noise, nonlinear
costs, endogenous stakes, and stochastic response remains unresolved. Broader
welfare-bound packaging, prevalence-sensitive notation, and nonlinear welfare
objects remain later work rather than part of this pass.

Red flags fired: no contradiction exposed. The pass narrowed ambiguous prose:
conservation remains strong under Proposition 4's hypotheses, but only for
`H_per`; population-level backfire is a separate entry effect.

## Iteration 18

Question tackled: remaining math guardrails after the proposition and welfare
passes.

What changed: tightened Boltzmann selection claims to the finite-mgf domain
`B = { beta : E_mu[exp(beta P)] < infinity }` and made heavy-tail failure an
explicit modeling boundary. Updated the quadratic response-shape result so
`a^* = d C w/(w^T C w)` is the unconstrained/interior solution; for
nonnegative actions, `C w >= 0` is the sufficient interior condition, while
violations such as `C = diag(1, 1), w = (1, -1)` require active-face KKT.
Restated Proposition 3 as a convex action-cost score-deficit result, not a
non-convex ML/RLHF training theorem. Added formal deferral language for
endogenous stakes such as `V(H_obs) = V_0 exp(-gamma H_obs)`. Updated
`book/multidimensional-goodhart.typ`, `research/formalization.md`,
`research/open_questions.md`, `research/claim_audits.md`,
`research/verification_stack.md`, `research/red_flags.md`,
`research/threads/selection_response.md`,
`research/threads/minimum_complexity_attractor.md`,
`research/threads/convex_intervention_bound.md`,
`research/threads/core_propositions_and_value_norms.md`,
`research/reviews/response_shape_predictions.md`,
`research/findings_since_iteration_6.md`, and `plans/math-rigor.md`.

What's open now: welfare-bound packaging for declared hidden-harm functionals,
simulation coverage for finite-mgf versus heavy-tail selection and active-face
quadratic response, stochastic response, and the separate performative model
needed for endogenous stakes.

Red flags fired: no contradiction exposed. The pass found missing domain
clauses, not false formulas: each formula survives with its intended scope
visible.

## Iteration 19

Question tackled: welfare-bound packaging after the convex score-deficit
budget.

What changed: extended `research/threads/convex_intervention_bound.md` with the
declared-functional problem
`W_ell(d,V) = sup { ell(a): c(a) <= V, w . a >= d }`. The new section separates
this worst-case welfare-bound object from the realized harm of a
cost-minimizing response `ell(a^*(d))`. It uses the required counterexample
`w = (1, 1)`, `h = (M, 0)`, and equal quadratic costs: the cost-minimal action
for deficit `d` is `(d/2, d/2)`, so hidden harm is `Md/2`, unbounded as the
declared value weight `M` grows. Propagated the distinction through
`research/formalization.md`, `research/open_questions.md`,
`research/claim_audits.md`, `research/verification_stack.md`, and
`research/red_flags.md`.

What's open now: nonlinear, prevalence-sensitive, stochastic, and endogenous
welfare models remain later work. The current pass only packages the fixed
action-geometry problem for a declared hidden-harm functional `ell`, with later
aggregation into `H_per` or `H_pop` still to be specified.

Red flags fired: overclaim risk. Convex affordability, `m(d)`, and finite
private cost budgets do not bound welfare in value units without declared
hidden value weights.

## Iteration 20

Question tackled: executable simulation checks for the core selection and
intervention claims.

What changed: added `research/simulations/` with a Makefile and
`iteration20_selection_intervention.py`, run via
`uv run --with numpy --with scipy`. The script contains eight named checks:
linear-Gaussian threshold drift, zero-covariance nonlinear threshold response,
Boltzmann finite-mgf versus heavy-tail behavior, value-weighted selection with
two declared `v` choices, the single-channel Stackelberg wedge, multichannel
quadratic water-filling, noisy Stackelberg numerical response, and
convex-cost versus welfare-bound separation. Each check prints the proposition
or open problem it tests and the condition that would narrow or kill the claim.
Updated `research/verification_stack.md` so Layer 3 records these checks as
passed for the intended toy regimes.

What the run showed: the deterministic run passed all eight checks. The
selection examples supported the current distinction between covariance,
threshold response, weighted response, and declared value weights. The
intervention examples supported the quadratic wedge, the separable quadratic
allocation formula, and the claim that `ell(a^*(d))` and `W_ell(d,V)` are
different objects.

What's open now: linear and elastic-net-like convex costs remain useful
additional variants, as do Iteration 21's population and active-set simulations.
The noisy Stackelberg check is only a numerical toy; it does not close the
stochastic-response theory.

Red flags fired: no contradiction exposed. Simulation passed for the scoped toy
models, not for broad empirical or non-convex claims.

## Iteration 21

Question tackled: population/per-agent welfare separation and active-set
response-shape simulations.

What changed: added `research/simulations/iteration21_population_active_sets.py`
and updated the simulation Makefile so `make run` executes both Iteration 20
and Iteration 21. The new script compares capped fixed-charge active-set paths
against active-face quadratic response, plots `H_per(d)` separately from
`H_pop(M; F_Q,V)`, and includes a skewed non-Gaussian `Q` stress test. The
script writes `research/simulations/outputs/iteration21_active_sets.png` and
`research/simulations/outputs/iteration21_welfare_objects.png`.

What the run showed: capped fixed-charge response produced lumpy support
switches and skipped channel 1 before its cap because channel 2's lower
marginal cost justified its fixed charge. The quadratic full-space `C w`
solution failed under `a >= 0` when `C w` had a negative component and was
repaired by the active-face solution. In the equal-harm additive model,
`H_per(d)` coincided across measured-set capacities where gaming was feasible,
while population harm increased with the profitable deficit band for both
normal and skewed `Q`.

What's open now: noisy-threshold population welfare, endogenous `V`,
conjunctive metrics, and broader active-set families remain later variants. The
Iteration 21 checks support the notation discipline around `H_per` and
`H_pop`; they are still toy simulations, not empirical evidence.

Red flags fired: no contradiction exposed. The main correction during the pass
was semantic: `H_pop` must be computed as the population expectation
`E[d 1{0 < d <= Delta_K}]`, not as the conditional mean among gamers.

## Iteration 21.1

Question tackled: simulation-code hardening after review of the Iteration
20-21 checks.

What changed: repaired the two simulation scripts without changing any math
claims. Both scripts now check that every returned `Check` is well formed
instead of using a tautological string-length finiteness assertion. Iteration
20 now uses non-axis-aligned value vectors for the scalar/operator selection
bound; strengthens the Pareto Boltzmann diagnostic with tilted-mean growth;
runs a sigma sweep for noisy Stackelberg response without asserting a general
monotonicity theorem; and solves the `W_ell(d,V)` problem numerically with
SLSQP before comparing to the closed form. Iteration 21 now writes outputs
relative to the script directory, solves the active-face quadratic examples
with SLSQP under nonnegativity constraints, and adds a conjunctive aggregation
population check.

What the run showed: `make run` passed deterministically. The solver-backed
checks matched the closed-form welfare-bound and active-face quadratic
solutions. The sigma sweep showed a finite noisy-response diagnostic rather
than a monotone law. The conjunctive check showed fixed-deficit per-gamer harm
scaling as `m d` while the equal-cost entry band shrinks with the number of
required measured dimensions.

What's open now: this pass closes the obvious simulation-code review issues
and one cheap conjunctive coverage gap. Noisy-threshold population welfare,
endogenous `V`, adaptive hardening, and broader active-set families remain
future model work.

Red flags fired: no contradiction exposed. The only conceptual guardrail is
that the noisy sigma sweep and heavy-tail truncation diagnostics remain finite
toy checks, not general theorems.

## Iteration 22

Question tackled: ML formal analogue survey for the response-modeling
framework.

What changed: added `research/threads/lit_review/ml_formal_analogue_survey.md` (relocated post-Iteration 25 from `research/threads/`). The new
thread maps existing ML theorem families to framework primitives: model
selection and hyperparameter search as selection over fixed candidates;
adaptive holdout and leaderboard work as repeated-selection/evidence-standard
primitives; strategic classification as the closest action-cost intervention
analogue; performative prediction as response-kernel/distribution-shift
formalism; reward gaming as proxy/target separation; and reward misspecification
or reward-model overoptimization as empirical/search-geometry anchors. Each row
separates established theorem content from non-binding analogy and names a
falsifier for a future worked application.

What's open now: Iteration 23 should use the survey to build one worked ML
benchmark contract. The best candidate is a benchmark used both for checkpoint
selection and for finetuning/RLHF-style optimization, because it contains a
clean selection channel and a separate intervention/search channel. Bibliography
expansion and book integration remain later polish/application work.

Red flags fired: no contradiction exposed. The main guardrail is unchanged:
do not identify `kappa` with gradient accessibility, benchmark contamination,
model size, or reward-model feature simplicity unless a worked application
declares that response geometry and its falsifiers.

## Iteration 23

Question tackled: worked ML benchmark application for the response-modeling
contract.

What changed: added a Chapter 5 worked contract for MMLU benchmark pressure.
The example treats MMLU as a named benchmark anchor, not as proof of the
theory. It walks through the eight contract fields: type, baseline behavior,
exposure, channel, action geometry, proxy/target, aggregation, and evidence.
The key split is fixed-checkpoint selection via `W_theta` versus finetuning,
prompt search, contamination, synthetic-data filtering, or reward/proxy
optimization via `K_theta`. The book now states that action geometry is absent
unless the application declares finetuning data, benchmark access, search
budget, reward loop, compute, KL penalty, or comparable costs.

What the propositions license: Propositions 1 and 1' license only
fixed-candidate checkpoint-selection claims with declared hidden value weights.
Proposition 2 licenses an MMLU-related Stackelberg wedge only after declaring a
one-dimensional threshold, stakes `V`, and cost parameter `kappa`; MMLU alone
does not supply them. Proposition 3 requires a declared local convex
action/search geometry. Proposition 4 requires additive benchmark components
with declared costs and hidden-harm exchange rates.

What's open now: empirical claims about a particular lab, release, or training
run still need source-specific evidence: same-checkpoint before/after behavior,
private or regenerated tests, contamination probes, action traces, and transfer
to non-MMLU tasks.

Red flags fired: no contradiction exposed. The guardrail is now book-facing:
do not treat MMLU itself as licensing Stackelberg, convex-cost, RLHF,
`kappa`, or welfare bounds without declared response geometry and falsifiers.

## Iteration 24

Question tackled: consistency consolidation across the research notes and book
after Iterations 20-23.

What changed: updated the audit trail so `claim_audits.md`, `red_flags.md`,
`verification_stack.md`, and `open_questions.md` agree on the proposition
boundaries, Layer-3 simulation status, and Q19/MMLU application status. The
book already had the needed reader-facing guardrails, so no book or PDF rebuild
was needed.

What the pass showed: Proposition 1 is the coordinate-explicit Euclidean
selection bound, while Proposition 1' is the declared value/operator selection
bound. Proposition 2's `sqrt(2 kappa V)` remains only the quadratic
Stackelberg toy signature. Proposition 3 requires declared action/search
geometry and is not a welfare bound. Proposition 4 is an iff-condition for
fixed-deficit `H_per`, not a population or arbitrary-cost conservation claim.
Q19/MMLU is recorded as a successful Layer-2 application because the contract
distinguishes fixed-checkpoint `W_theta` selection from `K_theta`
finetuning/search/contamination/reward-proxy mechanisms.

What's open now: adaptive hardening, noisy population welfare, endogenous `V`,
broader attractor claims, empirical implementation, and non-convex ML/RLHF
training dynamics remain open or narrowed. Iterations 20, 21, and 21.1 count as
Layer-3 passes only for their intended toy regimes.

Red flags fired: no contradiction exposed. The coordinate-free selection-bound
worry is closed as a live book-presentation problem because the book declares
coordinates/value metrics. The broader proposition-language watch remains open
only as a maintenance guardrail for future prose.

## Iteration 25

Question tackled: final book-polish pass and a compact paper extract of the
survived Chapters 1-5 argument.

What changed: replaced the book intro's carrying-example placeholder with a
licensed-claims enumeration: selection bounds, intervention toy bounds,
aggregation/exchange-rate results, response-shape guardrails, and the
response-modeling contract. The intro summary now names both selection-bound
forms: Proposition 1 as coordinate-explicit Euclidean drift and Proposition 1'
as declared value/operator drift. Tightened the Chapter 2 to Chapter 3 handoff
so selection analysis stops at reweighting and intervention analysis begins
with declared response kernels, actions, costs, stakes, and aggregation
geometry. Added `book/multidimensional-goodhart-paper.typ`, a compileable
paper-style mini-draft sharing `refs.bib`, and added `make paper` plus README
build instructions.

What the pass showed: no serious contradiction was found. The existing
response-kernel language already stated the key Iteration 11 repair: mutual
singularity is decisive evidence against baseline-only selection, but the
causal definition is `K_theta != K_0` at fixed type, and absolute continuity
does not rule out intervention. The existing application-transfer paragraph
already used the response-modeling contract as the transfer rule; the paper
extract makes the same rule explicit for MMLU and states that Iterations
20-21.1 are Layer-3 toy checks, not empirical proof.

What's open now: the mini-draft is a first extract, not a publication-final
paper. Welfare-bound packaging, endogenous `V`, adaptive hardening, empirical
implementation, and non-convex ML/RLHF mappings remain open or narrowed.

Red flags fired: none. No new theorem family, simulation, or ML mapping was
added; the pass clarified claim boundaries and build artifacts.

## Iteration 26

Question tackled: direction-level review under a Lakatos / Tao / Hossenfelder /
Feynman lens.

What changed: added
`research/reviews/lakatos_tao_hossenfelder_feynman_direction_review.md`. The
review finds that the project has mostly handled the Lakatos and Feynman tests:
major claims have been sharpened through counterexamples rather than protected
by definition, and the audit trail volunteers many failure modes. The Tao test
is passed for the static toy models but remains open for adaptive hardening,
measurement-frontier, endogenous-stakes, and recursive-attractor work. The main
Hossenfelder-style risk is no longer elegant overclaiming; it is
taxonomy-led survivability, where the response-modeling contract can classify
too much unless it forces calculations, falsifiers, or application decisions.

What's open now: future application templates should include a "contract
failure" field, and the next generate iteration should preferably build a small
adaptive-hardening or measurement-frontier toy with explicit regimes where
reactive hardening converges, cycles, or loses to static commitment. Framework
level failure conditions should be promoted into `verification_stack.md` before
the contract is used as the main publication-facing thesis.

Red flags fired: no new formula-level contradiction. Directional watch item:
the response-modeling contract must not become a way to postpone falsification.

## Iteration 26.1 (lit-review Stage 3 supplement)

Iteration type: `application-mapping`.

Question tackled: build the canonical primitive-map artifact consolidating
the Codex ML survey and the Gemini scalar-anchor + genealogy material, per
Stage 3 of `plans/lit-review.md`. Pre-stage decision: Chapter 2 scalar
anchor is El-Mhamdi & Hoang 2024.

What changed: added
`research/reviews/formal_analogue_lit_map.md` with 13 primitive-map rows
(El-Mhamdi 2024 anchor; Majka-El-Mhamdi 2025 independence-free extension;
Skalse 2023 RL Goodhart; Skalse 2022 unhackability; Hardt et al.;
Perdomo et al.; Dwork et al.; Cawley-Talbot; Blum-Hardt / Roelofs /
Recht leaderboard; Pan / Gao reward overoptimization; Lucas 1976;
Holmström-Milgrom 1991; Smith-Winkler 2006). Each row carries primary
citation, framework primitive, what it licenses, what it does not
license, falsifier / non-transfer condition, and confidence tag. Added a
new "Formal-analogue lit-map audit" row block in `claim_audits.md`
covering the five most load-bearing claims from the lit map (envelope
vs sharp framing for El-Mhamdi; Skalse 2023 RL restriction;
Holmström-Milgrom precedent boundary; Skalse 2022 proxy/target;
Majka-El-Mhamdi independence gap).

What the assumption-clash audit showed [tentative]: the book's
Proposition 1/1' does not assume El-Mhamdi-style independence. El-Mhamdi's
scalar setup embeds into the book's framework (S = R², product μ,
P = G + ξ, H = G, threshold selection), and Proposition 1's chi-square
envelope applies; El-Mhamdi gives the sharper asymptotic value of ρ_α
under independence + named tails. So Chapter 2 §2.3 should frame the
two as parallel formalisms with overlapping scope, not as nested
generalization. Both halves go in the prose.

What's open now: Stage 4 of `plans/lit-review.md` (chapter-vs-appendix
decision) should record 13 promotion-ready rows and confirm the late
formal-analogue chapter stays a real chapter. Stage 5a (Chapter 2 book
integration) is now unblocked. Open identification: "DG19" cited by
El-Mhamdi 2024 — pull bibliography at Stage 5a drafting. Open follow-up
on whether Majka-El-Mhamdi 2025's independence-free results admit a
multidim generalization the book could prove.

Red flags fired: scheduled adversarial pass (post-Iteration 26) attacked
the "envelope vs sharp" framing for El-Mhamdi as a special case of the
book. Survived with refinement: "special case" is better phrased as
"valid embedding within the book's framework." Two red-flag patterns
(short argument; argument proves significantly more) fire weakly but
are accounted for in the framing — the Cauchy-Schwarz proof is genuinely
short, and the envelope is genuinely more general but at the cost of
sharpness. No claim downgrade required.

## Iteration 26.2 (lit-review Stage 4 decision)

Question tackled: decide whether the Stage 3 formal-analogue material is
large enough to remain a chapter or should be downgraded to an appendix.

What changed: independently audited the 13 rows in
`research/reviews/formal_analogue_lit_map.md` against the promotion
criteria: primary citation, named framework primitive, concrete "does not
license" boundary, and concrete falsifier / non-transfer condition. All 13
rows pass. Updated `plans/could-do/formal-analogue.md` to record the
decision that the late formal-analogue material remains a real chapter, not
an appendix. Updated `plans/lit-review.md` to point at the moved
`plans/could-do/formal-analogue.md` path.

What's open now: Stage 5a (Chapter 2 book integration) and Stage 5b (late
formal-analogue chapter execution) are unblocked. Stage 6 remains the
lit-review closure / handoff stage; adaptive hardening remains recorded in
`plans/adaptive-hardening.md` without an assigned iteration number.

Red flags fired: none. No new claims, theorem families, source mappings, or
book prose were introduced; this was a review and recording pass only.

## Iteration 26.3 (lit-review Stage 5 book integration)

Question tackled: integrate the verified literature review into the reader-
facing book without reopening the math-rigor work.

What changed: added the Chapter 2 literature-scope chapter to
`book/multidimensional-goodhart.typ`, covering genealogy, the
Manheim--Garrabrant taxonomy boundary, El-Mhamdi--Hoang as the scalar anchor,
Majka--El-Mhamdi as the independence-free scalar neighbor, and Smith--Winkler
as a selection precursor. Added the late "Formal analogues across fields"
chapter after the response-modeling contract, including the 13-row primitive
map and prose sections for ML and economics analogues. Updated the paper
extract with a one-line El-Mhamdi--Hoang anchor citation. Added bibliography
entries for the new Chapter 2 and late-chapter citations. Renumbered later
chapter references so the new literature chapter is Chapter 2, selection is
Chapter 3, intervention is Chapter 4, response shape is Chapter 5, and the
contract is Chapter 6.

What the pass showed: the literature integration did not require changing the
formal propositions. The new prose keeps the Stage 3 boundary discipline:
external sources map to primitives and stop at named falsifiers / non-transfer
conditions. The formal-analogue material remains a real chapter, not an
appendix.

What's open now: Stage 6 closure / handoff remains. Adaptive hardening remains
future work in `plans/adaptive-hardening.md` and was not started here.

Red flags fired: no new theorem-family claim was introduced. The risk is
bibliographic and expository rather than mathematical: the new chapters must
continue to distinguish sharp scalar external results from the book's looser
multidimensional response-modeling envelope.

## Iteration 26.4 (lit-review Stage 6 closure)

Question tackled: close the lit-review integration plan as an active workstream
after the Stage 5 book integration.

What changed: replaced `plans/lit-review.md` with a compact closure note that
points to the surviving artifacts: the formal-analogue lit map,
`plans/could-do/formal-analogue.md`, the integrated book chapters, the paper
extract, bibliography, verification-stack row, and iteration-log entries.
Updated the verification-stack "Literature primitive transfer" status from book
integration passed to book integration closed.

What the pass showed: Chapter 2 and the late formal-analogue chapter remain
book-integrated and build-verified, and the paper extract still carries the
scalar-anchor citation. The lit-review integration is closed; future source
or citation refinements are non-blocking follow-ups rather than active gates.

What's open now: adaptive hardening remains future work in
`plans/adaptive-hardening.md` with no assigned iteration number. No adaptive
hardening simulation was started as part of this closure.

Red flags fired: none. This was documentation and verification only; no book
prose, theorem family, simulation, or adaptive-hardening work was introduced.

## Iteration 26.5 (lit-review archive cleanup)

Question tackled: make the closed lit-review plan's archive status explicit
before starting any adaptive-hardening work.

What changed: moved the closed lit-review plan from `plans/lit-review.md` to
`plans/archived/lit-review.md`, documented the plans-directory lifecycle in
`plans/README.md`, and retargeted active plan-directory navigation references
that would otherwise point readers to the removed root plan.

What's open now: adaptive hardening remains future work in
`plans/adaptive-hardening.md` with no assigned iteration number. No
adaptive-hardening simulation or theorem work was started in this cleanup.

Red flags fired: none. This was archive and documentation cleanup only; no
book prose, theorem family, simulation, or adaptive-hardening work was
introduced.

## Iteration 27 (adaptive hardening / measurement frontier simulation)

Question tackled: Q14/Q15 in the intervention regime: what happens when a
regulator repeatedly hardens, removes, or adds measured channels in a finite
scorecard where each measured channel also expands an attack surface?

What changed: added
`research/simulations/iteration27_adaptive_hardening.py`, a deterministic
NumPy-only Layer-3 toy pass. The simulation uses finite channels with
`kappa_j`, `h_j`, `gamma_j`, and `w_j`; additive score gain
`sum_{j in M} w_j a_j`; quadratic private cost
`sum a_j^2/(2 kappa_j)`; capacity `S(M)=sum kappa_j w_j^2`; feasibility
`d^2/(2S(M)) <= V`; and best response
`a_j = d kappa_j w_j / S(M)`. It reports harm, real benefit, and net harm
separately and uses a deterministic deficit grid for population harm. Updated
the simulations Makefile so `make run` executes Iterations 20, 21, and 27, and
updated the simulation README.

What the simulation showed: the toy regimes classify rather than prove. Reactive
hardening can converge to no-gaming by driving `S(M)` below `d^2/(2V)`, and a
near-symmetric scorecard switches routes across four channels before stopping.
Adding declared-signal dimensions can expand attack surface and raise
deterministic `H_pop`. A predeclared narrow, hard-to-game metric can have lower
cumulative net harm than reactive broad measurement when signal adequacy is
already met. The frontier is not one-sided: adding a high-signal, low-harm,
low-kappa metric can improve benefit while keeping fixed-deficit gaming
infeasible. The conjunctive comparison preserves the earlier contrast:
per-gamer burden rises while the feasible entry band shrinks.

What's open now: the adaptive-hardening and measurement-frontier questions are
narrowed to classified finite-channel toy regimes, not closed. Empirical
estimation of `kappa`, `h`, `gamma`, and `V`; stochastic/noisy scorecards;
endogenous stakes; richer regulator objectives; and theorem-level convergence
conditions remain open.

Red flags fired: no book or paper prose was edited, and no empirical or theorem
claim was promoted. The main risk is overreading the policy examples: the pass
licenses "these deterministic regimes exist under the declared contract," not a
general claim that hardening, adding metrics, or static commitment is uniformly
best.

## Iteration 28 (review adaptive hardening before promotion)

Question tackled: What exactly does Iteration 27 license before theorem work,
book/paper promotion, or another research branch?

What changed: added
`research/reviews/adaptive_hardening_iteration27_review.md`, a
Lakatos/Tao/Hossenfelder/Feynman review of the six Iteration 27 checks. Updated
`claim_audits.md`, `red_flags.md`, `verification_stack.md`, and
`open_questions.md` to record the narrowed license boundary. Added
`plans/iteration29-application-template-hardening.md` as the next-iteration
plan.

What the review showed: Iteration 27 survives as reviewed Layer-3 toy evidence
only. Reactive hardening convergence is a capacity-threshold result inside the
finite-channel separable quadratic model with fixed `V`; route switching is
not a cycling theorem; static commitment dominance requires predeclared signal
adequacy; and measurement-frontier claims require declared or estimable
`kappa`, `h`, `gamma`, `w`, and `V`. Harmless renormalizations preserve the
qualitative story only when score, harm, signal, threshold, and hardening units
are transformed consistently.

What's open now: theorem-level adaptive dynamics, stochastic observation,
endogenous stakes, and empirical frontier estimation remain open. The next
iteration should test whether the response-modeling contract changes a real
application decision by requiring an application template with contract failure
conditions and evidence for the frontier primitives.

Red flags fired: promotion risk. The repair is to keep Iteration 27 out of
book/paper prose except as a clearly labeled toy example until theorem
hypotheses or an application contract with estimable primitives are available.

## Iteration 29 (hospital scorecard application template)

Question tackled: Q19 for a non-ML institutional scorecard. Can the
response-modeling contract change a concrete hospital readmission scorecard
audit or design decision rather than merely classify the story after the fact?

What changed: added `research/applications/application_template.md` as a
reusable response-modeling application template and
`research/applications/hospital_scorecard.md` as the filled readmission /
institutional scorecard application. The hospital application declares type,
baseline behavior, policy exposure, `W_theta` versus `K_theta`, action/search
geometry, proxy/target relation, aggregation, hidden harm, qualitative
`kappa`, `h`, `gamma`, `w`, and `V`, a conditional licensed calculation,
discriminator observations, contract-failure conditions, and a local
Layer-1/Layer-2 verification pass. Updated Q19, the verification stack, and
claim audits to record the new application boundary.

What the application showed: the same readmission score improvement can be
pure selection over hospitals, harmful fixed-type intervention, harmless
proxy-only repair, real follow-up improvement, or a mixture. The contract
changes the decision by recommending audits of repeated fixed-hospital action
traces ranked by score-per-cost and hidden harm before crediting score gains
as patient-welfare gains. The quadratic calculation
`m(d) = d^2 / (2 sum_j kappa_j w_j^2)` and
`a_j^*(d) = d kappa_j w_j / sum_i kappa_i w_i^2` is licensed only as a
diagnostic under declared primitives, not as an empirical estimate.

What's open now: Iteration 30 should review whether the hospital application
actually constrains the template, whether the qualitative frontier primitives
can be assigned before deployment, and whether the evidence standard is
observable enough to support reuse for scientific metrics.

Red flags fired: no theorem, empirical welfare claim, or policy-optimality
claim was introduced. The live risk is post-hoc flexibility in `U`, `h`,
`gamma`, `kappa`, and `V`; the repair is to make the next iteration a skeptical
review before reusing or promoting the template.
