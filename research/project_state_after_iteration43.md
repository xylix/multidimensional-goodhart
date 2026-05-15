# Project state after Iteration 43

Status: consolidation registry for the first 43 iterations. Read this before
opening the older thread files.

## Scope

The project is a response-modeling framework for Goodhart-like failures. It
studies how proxy pressure changes hidden error through declared response
channels, aggregation rules, action/cost/search geometry, and hidden
value/harm functionals. Its strongest outputs are conditional mathematical
primitives and claim-license discipline, not a universal theorem that more
metrics help or hurt, and not a policy recipe.

The original multidimensional and recursive motivations survive as prompts:
dimension can matter after coupling, aggregation, and value weights are
declared; repeated proxy repair can be studied after response geometry and a
complexity functional are predeclared. Neither remains an active target as an
unconditional law.

Future progress means one of three things: tightening a theorem under declared
hypotheses, mapping a real application with primitives and falsifiers declared
before interpreting score movement, or turning a parked conjecture into a
testable question with a cheapest verification layer and failure condition.

## Survived core primitives

| Primitive | Current owner | License |
| --- | --- | --- |
| Response channel split: `U`, `nu`, `W_theta`, `K_theta` | `research/formalization.md`; `research/threads/response_kernel_boundary.md`; `research/threads/response_modeling_contract.md` | Selection is fixed-type reweighting; intervention is fixed-type kernel change relative to a declared type/action representation. |
| Coordinate-explicit selection bound | `research/threads/core_propositions_and_value_norms.md`; book Chapter 3 | Pure-selection drift is bounded by chi-square reweighting and baseline coordinate variances after hidden coordinates are declared. |
| Value-weighted/operator selection bound | `research/threads/core_propositions_and_value_norms.md`; book Chapter 3 | Pure-selection hidden value drift is bounded after a scalar value functional or value norm is declared. |
| Quadratic Stackelberg wedge | `research/threads/core_propositions_and_value_norms.md`; book Chapter 4 | One-dimensional noiseless quadratic threshold gaming has wedge `Delta = sqrt(2 kappa V)`. |
| Convex score-deficit budget `m(d)` | `research/threads/convex_intervention_bound.md`; book Chapter 4 | With declared finite-dimensional convex action cost and linear proxy gain, intervention feasibility is controlled by a dual score-deficit cost. |
| Additive exchange-rate condition | `research/threads/core_propositions_and_value_norms.md`; book Chapter 4 | Fixed-deficit additive conservation holds iff hidden harm is proportional to score contribution, `h_j = c w_j`, on active channels. |
| Deterministic adaptive-hardening capacity boundary | `research/threads/adaptive_hardening_theorem_boundary.md` | In the fixed finite-channel deterministic contract, gaming is feasible iff `S_t(M) >= d^2/(2V)` and stops exactly when capacity falls below threshold. |
| Response-modeling contract | `research/threads/response_modeling_contract.md`; `research/applications/application_template.md`; book Chapter 6 | A claim must declare type, channel, action geometry, proxy/target, aggregation, hidden value/harm, evidence standard, and falsifier before importing a bound. |

## Closed questions and killed claims

Closed means closed under the current project license, not universally solved.

- Dimension count alone does not determine hidden harm.
- Signed aggregate hidden error is not a stable welfare object.
- Baseline covariance is not a finite-pressure selection primitive; it is only
  a local velocity on a valid tilted path.
- The selection/intervention boundary is not intrinsic to marginal laws and is
  not representation-free.
- Convex affordability and `m(d)` are not welfare bounds without a hidden
  value/harm functional.
- Additive "conservation of weirdness" is not generic; fixed-deficit
  conservation needs the exchange-rate condition `h_j = c w_j`, and population
  entry can still change aggregate harm.
- Minimum-complexity attraction is not generic. Selection follows the baseline
  tail; intervention follows cost/search geometry.
- Adaptive hardening has only the deterministic finite-channel capacity
  theorem boundary. Stochastic, endogenous, changing-set, nonconvex, and policy
  claims remain unlicensed.
- Broad policy prose is blocked except for narrow audit/design/evidence
  actions inside a declared application contract.

## Live questions

| Cluster | Tempting stronger claim | Missing primitive | Cheapest live layer | Failure condition | Disposition |
| --- | --- | --- | --- | --- | --- |
| Primitive estimation | Scorecard primitives can be estimated well enough to use toy diagnostics. | Predeclared evidence for `kappa`, `h`, `gamma`, `w`, `V`, hidden target, and action traces. | Real-world correspondence before simulation. | Primitives are assigned after score movement or unavailable without design consequence. | Keep open. |
| Stochastic filtering and repair budgets | Noisy hardening can be repaired by a general filtering rule. | Observation-error model, update rule, repair budget, stopping criterion. | Simulation. | Simple noise makes the rule miss threshold within budget or chase irrelevant channels. | Keep open. |
| Endogenous-stakes fixed points | Trust/stakes dynamics converge to a stable low-harm equilibrium. | Observed-harm variable, forecasting/response rule, stakes update, stability criterion. | Thought experiment then simulation. | Same static capacity gives different paths under plausible observation rules. | Keep open. |
| Changing measured sets, deficits, or weights | The capacity boundary transfers to adaptive score redesign. | Rule for `M_t`, `d_t`, `V_t`, and weights; invariant replacing `S(M)`. | Thought experiment. | Adding channels or changing thresholds breaks monotone capacity. | Keep open. |
| Shared bottlenecks and nonconvex geometry | The convex budget approximates richer response geometry. | Bottleneck constraints, caps, fixed charges, search discontinuities, local convexity evidence. | Simulation. | Active-set switches or fixed charges reverse the convex prediction. | Keep open. |
| Real-domain measurement frontier | The signal/attack-surface frontier can guide design. | Predeployment bounds for signal value, harm, attack surface, weights, and stakes. | Real-world correspondence. | Signal adequacy or harm primitives cannot be defended before deployment. | Keep open. |
| Response-geometry/complexity attractor | Proxy repair drives failures toward the simplest residual. | Complexity functional fixed before inspection plus response mechanism. | Thought experiment then simulation. | Attractor tracks cost/search geometry rather than the chosen complexity measure. | Park until specified. |
| Lean or formal proof work | The current theorem set is ready for mechanization. | Stable `core-math.md`, proposition numbering, proof source pointers. | Document audit. | Book pointers churn or hypotheses are still ambiguous. | Park until era 1 closes. |

## Canonical files

- `README.md`: short public project orientation.
- `AGENT.md`: standing research protocol and current formalization summary.
- `plans/next-steps.md`: active era-1 execution order.
- `plans/consolidation.md`, `plans/spine-refactor.md`, `plans/prose-pass.md`,
  `plans/polish.md`: active era-1 plans.
- `research/project_state_after_iteration43.md`: this registry.
- `research/core-math.md`: canonical bare theorem document for era 1.
- `research/closed_questions.md`, `research/open_questions.md`,
  `research/parked_questions.md`: consolidated question split.
- `research/formalization.md`: current notation and derivation-oriented notes.
- `research/claim_audits.md`: load-bearing claim license map.
- `research/verification_stack.md`: current verification layers and failure
  conditions.
- `research/negative_results.md` and `research/red_flags.md`: killed claims
  and adversarial-review flags.
- `research/threads/core_propositions_and_value_norms.md`,
  `research/threads/response_kernel_boundary.md`,
  `research/threads/response_modeling_contract.md`,
  `research/threads/convex_intervention_bound.md`,
  `research/threads/adaptive_hardening_theorem_boundary.md`: theorem and
  methodology owners.
- `research/applications/application_template.md`,
  `research/applications/hospital_scorecard.md`,
  `research/applications/scientific_metrics.md`,
  `research/applications/empirical_auditability.md`: application-contract
  source files.
- `research/reviews/formal_analogue_lit_map.md`,
  `research/reviews/policy_readiness_review.md`,
  `research/reviews/scoped_manuscript_review_iteration43.md`: current review
  gates for literature, policy, and manuscript freshness.

## Historical but useful files

- `research/iteration_log_full_1_43.md`: full audit trail through Iteration 43.
- `research/iteration_log.md`: compact era summary replacing the full journal.
- `research/findings_since_iteration_6.md`: older synthesis; useful for
  history, superseded by this registry for current state.
- `research/threads/minimum_complexity_attractor.md`,
  `research/threads/capped_fixed_charge_response.md`,
  `research/threads/response_dynamics_boundary.md`,
  `research/threads/response_kernel_boundary.md`,
  `research/threads/dimensional_dependence.md`,
  `research/threads/intervention_response.md`,
  `research/threads/selection_response.md`: source trail for promoted or
  parked ideas.
- `research/reviews/*`: preserve as audit trail unless a later archive pass
  groups historical reviews.
- `plans/archived/*`: completed historical plans.
- `plans/could-do/example_draft.md`: parked application source material.
- `plans/could-do/lean_validation_roadmap.md`: parked era-2 option.
- `draft.md`, `misc_convo_logs.md`, `TODO_FUTURE_IDEAS.md`,
  `quality-checks/13_05_2026_12_30_gemini_pro_deep_research.md`: historical
  source or conversation material, not active authority.

## Archive candidates

No research note with negative-result content should be deleted before its
surviving content is represented in `negative_results.md` or this registry.

- `book/multidimensional-goodhart-paper.typ` and PDF: deprecated by the era-1
  roadmap, but archival movement is explicitly reserved for Iteration 45.
- `draft.md`: historical draft; archive after the book/abstract spine is stable
  if no unique source material remains.
- Older review files not listed as canonical can be grouped under a future
  `research/archive/` only after the spine refactor no longer cites them.
- `plans/archived/*`: already archived; no action needed in this pass.

## Delete candidates

Deletion is not performed in this consolidation pass. These are candidates for
the later clean-repo pass after confirming they are not intentionally tracked.

- `.DS_Store`, `book/.DS_Store`, `research/simulations/.DS_Store`: generated
  macOS metadata with no audit value.
- `scripts/__pycache__/run_codex_iterations.cpython-314.pyc`: generated Python
  bytecode; source lives at `scripts/run_codex_iterations.py`.
- Generated PDFs in `book/` and simulation PNGs in
  `research/simulations/outputs/`: build artifacts. Keep until the polish pass
  decides whether they remain tracked deliverables.

## Canonical claim inventory

| Claim | Contract fields declared | Missing or unavailable fields | Consequence of missing fields | Owner |
| --- | --- | --- | --- | --- |
| Pure selection drift bound | Baseline law, selected law, Radon-Nikodym derivative, hidden coordinates/value metric. | Value metric is not identified from selected data. | Blocks welfare language and coordinate-free claims unless value weights are declared. | `core_propositions_and_value_norms.md`; `core-math.md`. |
| Response-kernel split | Type space, baseline type law, selection weights, response kernels. | Empirical defense of `U`; observations distinguishing weights from kernel changes. | Blocks theorem transfer from selection bounds and blocks causal classification from marginals alone. | `response_kernel_boundary.md`; `response_modeling_contract.md`. |
| Convex intervention budget | Action space, cost, linear proxy gain, deficit, stakes, convex regularity. | Hidden value/harm functional; evidence for local convex cost. | Blocks welfare bounds, ML/RLHF transfer, and nonconvex training claims. | `convex_intervention_bound.md`; `core-math.md`. |
| Exchange-rate condition | Additive score, weights, separable quadratic costs, fixed deficit, linear harm. | Population distribution, entry model, real-improvement component. | Blocks aggregate welfare and general more-metrics sign claims. | `core_propositions_and_value_norms.md`; `negative_results.md`. |
| Adaptive-hardening capacity boundary | Fixed finite `M`, `d`, `V`, weights, additive score, separable quadratic costs, deterministic observation, monotone hardening. | Stochastic observation, changing sets/deficits/stakes, bottlenecks, nonconvex geometry, regulator objective. | Blocks dynamic, persistent-cycle, policy, and empirical design claims. | `adaptive_hardening_theorem_boundary.md`; `core-math.md`. |
| Application discipline | Type/action boundary, channel, proxy/target, aggregation, hidden value/harm, evidence standard, falsifier. | Domain-specific primitive evidence. | Blocks hidden-target credit and toy diagnostics when primitives are unavailable. | `application_template.md`; application notes; policy review. |

