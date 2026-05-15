# Review Directory Consolidation

Last consolidated: after the Iteration 42 license map and the scoped
Iteration 43 manuscript review.

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
| `integration_readiness_review.md` | historical integration gate | Use as the Iteration 41 edit license and rationale. Do not use as the latest manuscript state. | Iteration 41 scoped integration, Iteration 42 consistency pass, and `scoped_manuscript_review_iteration43.md`. |
| `application_promotion_readiness_review.md` | historical book-promotion gate | Use for why application discipline was promotable and why theorem/policy claims were excluded. Do not use as current book-edit authority. | Iterations 34, 38, 40-42 and current `claim_audits.md`. |
| `adaptive_hardening_iteration27_review.md` | historically relevant, partially superseded | Use for the original Layer-3 toy classification and frontier vocabulary. Do not use its convergence wording without the Iteration 35 theorem-boundary update. | `research/threads/adaptive_hardening_theorem_boundary.md`, Iteration 36 dynamics, `claim_audits.md`. |
| `lakatos_tao_hossenfelder_feynman_direction_review.md` | historical direction memo | Use as an audit of the post-Iteration-25 pivot. Its next-step recommendations were partly completed later. | Iterations 27-42, especially the application template, adaptive-hardening boundary, and policy/integration gates. |
| `hospital_scorecard_application_review.md` | historical application review | Use for the hospital scorecard audit logic. Read through the later application-generalization, promotion, empirical-auditability, and policy gates before promoting claims. | `application_template_generalization_review.md`, `application_promotion_readiness_review.md`, Iterations 37-38. |
| `application_template_generalization_review.md` | still relevant methodological review | Use for the reusable application-template boundary. Current template text is the live operational form. | `research/applications/application_template.md`, `application_promotion_readiness_review.md`, Iterations 37-38. |
| `iteration_log_learning_pass.md` | durable meta-diagnostic | Use for mistake taxonomy and stale-phrase scan discipline. It is not a current theorem/application gate. | Current `claim_audits.md` and future consolidation passes. |
| `recursive_goodhart_q18.md` | durable but speculative boundary review | Use for the current caution that recursive/minimum-complexity claims need predeclared geometry, shape measure, and failure condition. | `response_shape_predictions.md`, current Q18 in `open_questions.md`. |
| `response_shape_predictions.md` | durable technical boundary review | Use for geometry-to-shape license boundaries. | Current Q18 and `claim_audits.md`. |
| `response_kernel_boundary.md` | durable technical boundary review | Use for selection versus fixed-type response definitions and non-identifiability cautions. | Current application template and `claim_audits.md`. |
| `formal_analogue_lit_map.md` | mostly time-independent literature map | Use for source-to-primitive mapping and external analogue positioning. Treat book line references and promotion-stage notes as historical. | Current manuscript sources and future lit-review pass. |

## Consolidated Decisions

- The live project state is not stored in early reviews. It is stored in the
  current license map, verification stack, and open-question map.
- Older point-in-time reviews remain useful as audit trail, but their action
  instructions expire when later iterations complete the action or narrow it.
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
