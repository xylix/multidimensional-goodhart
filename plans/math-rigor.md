# Math rigor follow-through plan

## Purpose

This note records the follow-through plan for closing the math-rigor debt after
Iteration 15. The work is organized as ten research iterations. Each iteration
should end by updating the relevant research notes, appending to
`research/iteration_log.md`, and making a commit unless the user says otherwise.

The sequence is intentionally front-loaded with book propagation and math repair.
Iterations 16-18 are the high-mutation zone: if a proposition boundary,
notation choice, or proof condition changes, revise the next one or two
iterations locally rather than forcing the original wording through.

## Iteration 17: Welfare-Object Discipline

Type: `edit`.

Scope:

- Introduce stable notation distinguishing per-agent harm from population harm,
  for example `H_per(d)` and `H_pop(M; F_Q, V)`.
- Apply the notation consistently in book Chapter 3, claim/proposition blocks,
  and `research/threads/intervention_response.md`.
- Update `research/claim_audits.md` rows that currently conflate conservation,
  backfire, per-agent harm, and population harm.

Slack rule:

- If the notation exposes a contradiction in an existing claim, narrow the
  claim in place and log the change rather than forcing terminology over it.

## Iteration 18: Remaining Math Guardrails

Type: `edit` or `review`.

Scope:

- Add active-face validity conditions for the quadratic intervention result,
  including the componentwise `C w >= 0` condition.
- Add the failure example `C = diag(1, 1), w = (1, -1)`.
- Restrict Boltzmann covariance-as-velocity claims to the finite-mgf domain
  `B = { beta : E_mu[exp(beta P)] < infinity }`.
- Document the heavy-tail failure mode.
- State that the convex score-deficit proposition is a convex action-cost
  result. Non-convex ML training is out of scope unless a local response model
  or cost geometry is explicitly declared.
- Add a formal deferral/open-question block for endogenous
  `V(H_obs) = V_0 exp(-gamma H_obs)` rather than attempting the fixed-point
  analysis in this pass.

Non-goal:

- Do not start a "translate Fenchel duality to non-convexity" research program
  in this pass.

## Iteration 19: Welfare-Bound Packaging

Type: `generate`.

Scope:

- State the open problem precisely:
  `sup { ell(a) : c(a) <= V, w . a >= d }` for a declared hidden-harm
  functional `ell`.
- Use the counterexample `w = (1, 1), h = (M, 0)` to show convex affordability
  is not a welfare bound.
- Mention nonlinear or prevalence-sensitive harm only as something a future
  declared `ell` could encode. Do not introduce a third welfare notation before
  the per-agent and population objects from Iteration 17 are wired in.
- Add this as the "next analogue" to the research notes,
  `research/open_questions.md`, `research/claim_audits.md`, and
  `research/verification_stack.md`.

## Iteration 20: Selection And Intervention Simulations

Type: `generate`.

Scope:

- Add an executable simulation layer, likely under a new lightweight simulation
  directory.
- Cover linear-Gaussian threshold drift.
- Cover zero-covariance nonlinear threshold response.
- Cover Boltzmann finite-mgf versus heavy-tail behavior.
- Cover value-weighted selection with two `v` choices.
- Cover a single-channel Stackelberg wedge.
- Cover multichannel water-filling.
- Cover noisy Stackelberg numerical response.
- Cover convex-cost versus welfare-bound examples.

Each simulation must name the proposition or open problem it tests and what
result would narrow or kill it.

Discipline:

- Keep simulations tied to claims already made by the paper.
- Do not add broad simulations for shared bottlenecks, bounded rationality,
  exogenous drift, or non-convexity merely because an external review mentioned
  them.
- Optional, only if lightweight: add one negative-control shared-bottleneck
  example showing that `K_M = sum kappa_j` is a separable-cost theorem, not a
  theorem about every possible action geometry.

## Iteration 21: Population And Active-Set Simulations

Type: `generate`.

Scope:

- Compare capped fixed-charge active-set paths against active-face quadratic
  response using the repaired Iteration 18 validity conditions.
- Plot `H_per(d)` and `H_pop(M; F_Q, V)` separately.
- Include a non-Gaussian `Q` stress test.
- If Iteration 17 changes the welfare notation materially, adapt the simulation
  outputs to that notation rather than preserving old wording.
- Keep the simulation set bounded: active-set and welfare-object checks are the
  point of this iteration, not a general survey of every alternative failure
  mechanism.

## Iteration 22: ML Formal Analogue Survey

Type: `theorem-mapping`.

Recommended domain: ML benchmarks used for checkpoint selection, finetuning,
RLHF, leaderboard comparison, or repeated adaptive evaluation.

Scope:

- Identify formal ML theorems with similar geometry, inputs, and outputs to the
  n-dimensional Goodhart model.
- Prioritize checkpoint selection, adaptive benchmark use, leaderboard
  overfitting, hyperparameter search, reward misspecification, and performative
  prediction.
- For each candidate theorem family, record inputs, outputs,
  optimization/search assumptions, and whether it maps to selection,
  action/cost/search, response-kernel, proxy/target, aggregation, or evidence
  primitives.
- Build a mapping table that separates established theorem content from
  non-binding analogies.
- Do not import claims into Chapter 5 unless the primitive map and falsifiers
  are explicit.
- Mark speculative correspondences, including any interpretation of `kappa` as
  gradient accessibility or benchmark accessibility, as candidate future model
  choices rather than claims of the current theory.

## Iteration 23: Worked Contract Application

Type: `application-mapping`.

Recommended domain: an ML benchmark used for both checkpoint selection and
finetuning.

Scope:

- Add a Chapter 5 worked example.
- Walk through all eight response-modeling contract fields.
- Make the contract the main transferable object in the worked example.
  Checkpoint selection may instantiate the selection channel; finetuning or
  RLHF requires a declared action/cost/search model before Stackelberg or convex
  bounds apply.
- For Propositions 1, 1', 2, 3, and 4, state what each licenses in the
  application and what observation would falsify the mapping.
- Avoid speculative claims such as "`kappa` is gradient accessibility" except
  as explicitly non-binding examples of possible future model choices.
- Update `research/verification_stack.md` Q19 from thought-experiment or
  application mapping to Layer-2 passed only if the primitive map and falsifiers
  are explicit.

## Iteration 24: Research-Note Consolidation

Type: `review`.

Scope:

- Update `research/claim_audits.md`, `research/red_flags.md`,
  `research/verification_stack.md`, `research/open_questions.md`, and
  `research/iteration_log.md`.
- Close the coordinate-explicit selection-bound red flag only after confirming
  the book now states the declared value-metric hypothesis.
- Keep the proposition-language watch item open unless the book clearly
  distinguishes proposition sketches, conjectures, and methodological claims.
- Mark Layer-3 simulations as passed, failed, or narrowed according to
  Iterations 20-21.
- Record whether the Iteration 22 theorem-mapping pass produced explicit
  primitive maps and falsifiers suitable for the worked application.

## Iteration 25: Final Polish And Paper-Extract Scope

Type: `edit`.

Scope:

- Fix structural minor items:
  - Section 1.1 licensed-claims enumeration.
  - Section 2.4 to Section 3.2 forward reference.
  - Section 3.1 mutual singularity versus kernel inequality clarification.
  - Section 1 summary bullets for both selection-bound forms.
- Audit `book/refs.bib` against all Typst citations.
- Decide the paper extract scope after seeing which propositions, simulations,
  and application mapping survived unchanged.
- Add a concise framing paragraph, not a large transfer table: the framework is
  a contract for declaring response models; exact toy bounds transfer only
  after matching assumptions are declared.
- Produce a compact paper-extract outline with these sections:
  - selection results;
  - intervention results;
  - response-modeling contract/example;
  - open problems, including welfare-bound packaging.

## Mutation And Slack Policy

- Treat Iterations 16-18 as the high-mutation zone. Book propagation may reveal
  numbering, notation, or proposition-boundary changes.
- After Iteration 19, only simulation failures or direct contradictions should
  mutate earlier math claims.
- Reserve roughly 20-25% slack inside each iteration for discovered
  cross-references, audit rows, and red-flag repairs.
- If a later iteration finds a stronger issue in an earlier proposition, stop
  forward propagation, log the issue in `research/red_flags.md`, and insert one
  repair iteration before continuing.
- Do not try to close endogenous-`V` math in this pass. Formal deferral is the
  default.
- Treat external-review concerns as prompts for scope precision. They should
  not trigger new theorem families unless a current paper claim would otherwise
  be false or misleading.

## Test Plan

- Build the Typst book after book-edit iterations and after final polish.
- Run all new simulations with deterministic seeds and record expected
  qualitative outcomes.
- Add minimal executable checks for cheap algebraic kernels:
  - quadratic wedge;
  - multichannel allocation;
  - exchange-rate conservation iff;
  - value-weighted selection-bound examples.
- For each proposition promoted into the book, confirm there is a matching
  claim-audit or verification-stack entry stating what it does and does not
  license.
- Confirm the plan and later prose keep the separable additive theorem stated
  cleanly rather than weakening it into a generic "it depends" claim.
- Confirm Gemini-derived additions improve scope, interpretation, or
  presentation rather than adding redundant limitation sections.
- Verify citation consistency mechanically in Iteration 25.

## Assumptions

- No Lean formalization is introduced in this pass.
- The book is the main reader-facing artifact; research notes remain the audit
  trail.
- The paper should not apologize for being theoretical. Narrow theorem scope is
  a design feature when assumptions are explicit.
- Iteration 15's proposition sketches are accepted as the starting point,
  subject to edit/review tightening rather than full re-derivation.
- The preferred total length is ten iterations. If the work must compress,
  merge Iterations 20-21 and defer Iteration 25's paper-extract scope.
