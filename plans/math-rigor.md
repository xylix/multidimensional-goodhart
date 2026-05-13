# Math rigor follow-through plan

## Purpose

This note records the follow-through plan for closing the math-rigor debt after
Iteration 15. The work is organized as nine research iterations. Each iteration
should end by updating the relevant research notes, appending to
`research/iteration_log.md`, and making a commit unless the user says otherwise.

The sequence is intentionally front-loaded with book propagation and math repair.
Iterations 16-18 are the high-mutation zone: if a proposition boundary,
notation choice, or proof condition changes, revise the next one or two
iterations locally rather than forcing the original wording through.

## Iteration 16: Book Propagation For Core Propositions

Type: `edit`.

Scope:

- Add the Stackelberg wedge proposition sketch to
  `research/threads/core_propositions_and_value_norms.md`.
- Promote the selection, Stackelberg, convex-budget, and additive exchange-rate
  results into numbered proposition-style environments in the book.
- Replace Section 2.5's coordinate-only selection bound with both
  coordinate-explicit and value-weighted forms.
- Replace Section 3.5's convex-cost conjecture with the convex score-deficit
  proposition.
- Rename `<sec:convex-cost-conjecture>` to `<sec:convex-cost-bound>`.

Canonical numbering:

- Proposition 1: selection drift.
- Proposition 1': value-weighted/operator selection drift.
- Proposition 2: Stackelberg wedge.
- Proposition 3: convex score-deficit budget.
- Proposition 4: additive exchange-rate iff.

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
- Add a formal deferral/open-question block for endogenous
  `V(H_obs) = V_0 exp(-gamma H_obs)` rather than attempting the fixed-point
  analysis in this pass.

## Iteration 19: Welfare-Bound Packaging

Type: `generate`.

Scope:

- State the open problem precisely:
  `sup { ell(a) : c(a) <= V, w . a >= d }` for a declared hidden-harm
  functional `ell`.
- Use the counterexample `w = (1, 1), h = (M, 0)` to show convex affordability
  is not a welfare bound.
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

## Iteration 21: Population And Active-Set Simulations

Type: `generate`.

Scope:

- Compare capped fixed-charge active-set paths against active-face quadratic
  response using the repaired Iteration 18 validity conditions.
- Plot `H_per(d)` and `H_pop(M; F_Q, V)` separately.
- Include a non-Gaussian `Q` stress test.
- If Iteration 17 changes the welfare notation materially, adapt the simulation
  outputs to that notation rather than preserving old wording.

## Iteration 22: Worked Contract Application

Type: `application-mapping`.

Recommended domain: an ML benchmark used for both checkpoint selection and
finetuning.

Scope:

- Add a Chapter 5 worked example.
- Walk through all eight response-modeling contract fields.
- For Propositions 1, 1', 2, 3, and 4, state what each licenses in the
  application and what observation would falsify the mapping.
- Update `research/verification_stack.md` Q19 from thought-experiment or
  application mapping to Layer-2 passed only if the primitive map and falsifiers
  are explicit.

## Iteration 23: Research-Note Consolidation

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

## Iteration 24: Final Polish And Paper-Extract Scope

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
- Verify citation consistency mechanically in Iteration 24.

## Assumptions

- No Lean formalization is introduced in this pass.
- The book is the main reader-facing artifact; research notes remain the audit
  trail.
- Iteration 15's proposition sketches are accepted as the starting point,
  subject to edit/review tightening rather than full re-derivation.
- The preferred total length is nine iterations. If the work must compress,
  merge Iterations 20-21 and defer Iteration 24's paper-extract scope.
