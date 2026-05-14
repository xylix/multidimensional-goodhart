# Adaptive hardening / measurement-frontier plan

## Purpose

This note preserves the adaptive-hardening research idea without reserving an
iteration number for it. It should be executed only after the lit-review
integration work is closed.

The motivation is to extend the project's strongest static scorecard results
into a dynamic proxy-repair setting. The book already separates additive versus
conjunctive aggregation, exchange-rate conditions, and population versus
per-agent harm. The next natural research question is what happens when a
regulator observes gaming and patches the measured system over time.

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

Compare at least these regulator policies:

- harden the most-gamed measured channel;
- add another measured channel;
- remove the currently gameable channel;
- commit from the start to a narrow hard-to-game measured set;
- switch to or compare against a conjunctive gate.

## Expected output when executed

Implementation should follow the style of the Iteration 20/21 simulation
files: deterministic seed, explicit model clauses, concise printed checks, and
scripted figures if useful.

Likely implementation file:

- `research/simulations/iterationXX_adaptive_hardening.py`

Use the actual iteration number at execution time; do not assume `27`.

The run should answer which regimes exhibit:

- convergence to no-gaming;
- cycling or route-switching;
- attack-surface expansion;
- static-commitment dominance;
- cases where adding a high-`gamma`, low-`h_j / w_j` metric helps.

## Research-note updates when executed

If the simulation is implemented, update:

- `research/iteration_log.md`;
- `research/verification_stack.md`;
- `research/open_questions.md`;
- possibly `research/threads/intervention_response.md` or a new thread if the
  result is conceptually large enough.

Book integration is deferred. Change the book only if the simulation supports
an existing proposition, exposes a contradiction, or creates a compact result
worth promoting.

## Failure conditions

The measurement-frontier question is not yet well-posed if conclusions change
arbitrarily under harmless renormalizations of score weights, harm units, or
hardening-cost units.

The reactive-hardening story weakens if static narrow commitment dominates in
most natural regimes, or if hardening reliably expands the attack surface by
opening cheaper substitute channels.
