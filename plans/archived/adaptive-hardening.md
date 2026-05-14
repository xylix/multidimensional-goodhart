# Adaptive hardening / measurement-frontier plan

Execution label: **Iteration 27: adaptive hardening / measurement frontier
simulation**.

## Purpose

This note is the active handoff plan for Iteration 27. The lit-review
integration work is closed, and the latest logged work is Iteration 26.5; treat
Iterations 26.1 through 26.5 as lit-review sub-iterations under Iteration 26.
The next full research iteration is therefore Iteration 27.

The motivation is to extend the project's strongest static scorecard results
into a dynamic proxy-repair setting. The book already separates additive versus
conjunctive aggregation, exchange-rate conditions, and population versus
per-agent harm. The next natural research question is what happens when a
regulator observes gaming and patches the measured system over time.

## Alignment with current project state

This iteration follows directly from the current handoff state:

- `AGENT.md` names adaptive hardening / measurement frontier as the top
  next-stage priority.
- `plans/archived/lit-review.md` marks literature integration closed and says
  future research should resume from this plan.
- `research/verification_stack.md` keeps adaptive hardening at the simulation
  layer and says it needs simulation before theorem work.
- The book already frames adaptive hardening and measurement-frontier questions
  as open dynamic questions. Iteration 27 should extend that argument rather
  than reopen literature integration.

Keep the iteration simulation-first. Do not promote a theorem or book claim
before the toy dynamics are known.

## Core question

When a regulator hardens or changes the currently most-gamed dimension, does
the process converge, cycle, or perform worse than choosing a narrow
hard-to-game metric from the start?

## Minimal model

Use a finite set of channels `j = 1..k`.

Each channel should have:

- gaming ease `kappa_j`;
- hidden harm rate `h_j`;
- signal or real-improvement benefit `gamma_j`;
- optional score weight `w_j`;
- optional hardening cost for lowering `kappa_j`.

The regulator chooses a measured set `M_t` and/or hardens channels over rounds.
Agents then choose a cost-minimal gaming response under a declared aggregation
rule.

Use additive scorecard aggregation as the primary model:

- score contribution is additive across measured channels;
- score weights are `w_j`;
- channel gaming ease is `kappa_j`;
- hidden harm rate is `h_j`;
- signal or real-improvement benefit is `gamma_j`.

Include a conjunctive comparison only if it is compact enough to keep the
iteration focused. The conjunctive branch is a contrast case, not the main
model.

Compare at least these regulator policies:

- reactive hardening: harden the most-gamed measured channel;
- add-dimension: add another measured channel;
- remove-channel: remove the currently gameable channel;
- static narrow commitment: commit from the start to a narrow hard-to-game
  measured set;
- conjunctive gate: switch to or compare against a conjunctive requirement.

## Expected output when executed

Implementation should follow the style of the Iteration 20/21 simulation
files: deterministic seed, explicit model clauses, concise printed checks, and
scripted figures if useful.

Implementation file:

- `research/simulations/iteration27_adaptive_hardening.py`

Update the simulation Makefile so the Iteration 27 script runs after the
Iteration 20/21 simulations.

The run should answer which regimes exhibit:

- convergence to no-gaming;
- cycling or route-switching;
- attack-surface expansion;
- static-commitment dominance;
- cases where adding a high-`gamma`, low-`h_j / w_j` metric helps.

Printed checks should name the claim each regime tests and state what result
would narrow or kill the claim. Record the simulation as Layer-3 toy evidence
only, not empirical validation.

## Research-note updates when executed

When the simulation is implemented, update:

- `research/iteration_log.md`;
- `research/verification_stack.md`;
- `research/open_questions.md`;

Add `research/threads/intervention_response.md` or a new research thread only
if the simulation produces a conceptually new result beyond "toy check
passed/narrowed."

Book and paper integration is explicitly deferred. Do not make book edits as
part of the simulation iteration unless the result exposes a contradiction in
current prose or creates a compact result worth promoting.

## Failure conditions

The measurement-frontier question is not yet well-posed if conclusions change
arbitrarily under harmless renormalizations of score weights, harm units, or
hardening-cost units.

The reactive-hardening story weakens if static narrow commitment dominates in
most natural regimes, or if hardening reliably expands the attack surface by
opening cheaper substitute channels.
