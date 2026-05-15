# Review Directory Consolidation

Last consolidated: after pruning stale point-in-time gates and grouping related
application, response-boundary, and adaptive-frontier reviews.

Purpose: this directory contains both durable reviews and point-in-time gates.
Older gates should not be read as current project state unless they are carried
forward by `research/claim_audits.md`, `research/verification_stack.md`, or a
later review listed below.

## Current Reading Order

1. `research/claim_audits.md` for the active license map.
2. `research/verification_stack.md` for the layer-by-layer evidence state.
3. `research/open_questions.md` for live versus closed questions.
4. `research/reviews/scoped_manuscript_review_iteration43.md` for manuscript
   freshness after the Iteration 35-42 repair sequence.
5. This directory only after the above, using the status table below.

## Review Status Table

| Review | Status | Use now | Superseded or bounded by |
| --- | --- | --- | --- |
| `scoped_manuscript_review_iteration43.md` | current manuscript freshness gate | Use for the latest book/paper freshness judgment after Iteration 42. | Future manuscript review. |
| `policy_readiness_review.md` | current policy boundary | Use for the standing block on broad policy prose and the narrow audit/design/evidence actions that remain licensed. | `claim_audits.md` current license map and any later policy gate. |
| `application_response_modeling_reviews.md` | durable methodological synthesis | Use for application response-contract discipline across hospital scorecards, scientific metrics, and promotion boundaries. | `research/applications/application_template.md`, current `claim_audits.md`, and any later application gate. |
| `response_kernel_shape_recursive_reviews.md` | durable technical-boundary synthesis | Use for selection/intervention boundaries, geometry-to-shape licenses, and recursive-claim cautions. | Current Q18 in `open_questions.md`, current application template, and `claim_audits.md`. |
| `direction_and_adaptive_frontier_reviews.md` | historical direction and toy-frontier synthesis | Use for the post-pivot research-direction lesson and the finite-channel adaptive-hardening toy boundary. | `research/threads/adaptive_hardening_theorem_boundary.md`, later dynamics/policy gates, and `claim_audits.md`. |
| `iteration_log_learning_pass.md` | durable meta-diagnostic | Use for mistake taxonomy and stale-phrase scan discipline. It is not a current theorem/application gate. | Current `claim_audits.md` and future consolidation passes. |
| `formal_analogue_lit_map.md` | mostly time-independent literature map | Use for source-to-primitive mapping and external analogue positioning. Treat book line references and promotion-stage notes as historical. | Current manuscript sources and future lit-review pass. |

## Consolidated Decisions

- The live project state is not stored in early reviews. It is stored in the
  current license map, verification stack, and open-question map.
- Older point-in-time reviews remain available in git history. Their durable
  findings have been grouped here only when they still help read current
  licenses.
- Literature and technical boundary reviews are more durable, but any book line
  references, promotion instructions, or "next iteration" wording in them is
  historical.
- Adaptive hardening is the clearest supersession case: Iteration 27 reviewed a
  toy; Iteration 35 closed only a narrow deterministic capacity theorem
  boundary; Iteration 36 showed non-transfer to declared dynamic variants; and
  Iterations 38-42 blocked broad policy or manuscript promotion.
- Application reviews remain relevant only as response-modeling discipline:
  predeclare the type/action boundary, response channel, primitives, evidence
  standard, licensed calculation, discriminator observation, changed decision,
  and contract-failure condition.

## Staleness Rule

When a review says "current", "next", "promote", "book edit", "policy-ready",
or names a specific iteration window, treat it as point-bound. Before using it,
check whether a later review, `claim_audits.md`, or `verification_stack.md`
changed the license.
