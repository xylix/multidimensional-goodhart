# Multidimensional Goodhart

This is a research project about response modeling for Goodhart-like failures.
It studies how proxy pressure changes hidden error through declared response
channels, aggregation rules, action/cost/search geometry, and hidden
value/harm functionals.

The current thesis is conditional rather than universal. A proxy can fail by
selecting differently from a fixed pool, or by changing behavior at fixed type.
Those two channels look similar in aggregate data but require different math:
selection uses baseline response curves and reweighting bounds; intervention
uses action geometry, costs, aggregation, and hidden harm/value models.

The first 43 iterations killed the broad slogans. Dimension count alone does
not determine harm; covariance is not a finite-pressure primitive; adding more
metrics has no sign without aggregation and exchange rates; and generic
minimum-complexity attraction is not a theorem. What survived is a theorem set
of scoped primitives plus a response-modeling contract for applications.

Start here:

- `research/project_state_after_iteration43.md` — consolidated source registry.
- `research/core-math.md` — bare theorem statements, hypotheses, non-transfer
  clauses, and book pointers.
- `research/closed_questions.md`, `research/open_questions.md`,
  `research/parked_questions.md` — current question split.
- `plans/next-steps.md` — active era-1 finishing order.


# Repo

- `book/` — typst draft + compiled PDF. `make` in there, or `typst compile multidimensional-goodhart.typ`.
- `research/` — consolidated theorem, question, audit, and iteration records.
- `research/threads/` — source fragments and historical derivations; check the
  registry before treating a thread as current authority.

Status: era-1 consolidation is underway. The remaining active work is
manuscript organization, prose, and polish rather than new open-ended research.


# Notes

- The research as of 2026-05-15 has been heavily LLM-driven. The consolidated
  registry and core math file are the current attempt to make the claim
  licenses auditable.
