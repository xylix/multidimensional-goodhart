# Literature-review program for paper 1 — handoff (Track A)

Provenance: self-contained handoff TL;DR written 2026-06-24 by a prior agent
working the novelty-refactor lit-review program. Scoped to **Track A** (see
`next-steps.md`). Saved verbatim-in-substance as the pickup doc for a
fresh-context planner. The parallel **Track B** (the gap paper) has its own
hand-off at `../literature-reference-gap-paper/audit-tasks/README.md`; the two
share discovery evidence but have distinct deliverables — do not conflate them.

## Why this program exists (the core realization)

The T5 exchange-rate prior-art review found that the paper's "survived" theorems
are very likely classical results in other clothes, and — critically — each
parallel lives in the theorem's **native mathematical field, not the Goodhart
literature**. Our own `research/reviews/formal_analogue_lit_map.md` had a false
negative ("the χ² reweighting budget has no external analogue") precisely because
every prior pass searched only Goodhart-adjacent sources. T5 turned out to be
contract-theory congruence (Feltham–Xie 1994 / Baker 1992/2002). Conclusion the
program acts on: the paper's honest contribution is elementary cross-field
synthesis + the response-modeling contract + a couple of "readings nobody wrote
down," not novel math — and that's a stronger, more circulation-ready paper if
stated proudly (see `paper1-is-elementary-synthesis` memory).

## The method that works (reuse it)

1. **Adversarial two-pass harness:** an optimistic prompt ("prove this is novel")
   and a pessimistic prompt ("find the precedent; treat 'novel' as failure"), run
   across ChatGPT + Claude + Gemini deep research, then triangulate. **The spread
   between optimistic/pessimistic and across models is the signal.**
2. **Seed toward the theorem's native field, not Goodhart.** Name the suspected
   classical result explicitly in the prompt so the agents pattern-match.
3. Each review ends with a synthesis `README.md` in its
   `research/threads/lit_review/<topic>/` folder, in the format of the completed
   T5 one (`looking-for-exchange-rate-results/README.md`): verdict, consolidated
   closest-prior-art table, what survives as contribution, divergences, caveats.

## Status & priority of the reviews

| Review | Suspected home | Priority | Notes |
| --- | --- | --- | --- |
| T5 exchange-rate | Feltham–Xie/Baker congruence; Chetty/Feldstein; Reynaert–Sallee 2016 (named non-AI "Goodhart") | ✅ done | Verdict: condition = congruity (not novel); only the all-subsets invariance reading is unstated |
| T1/T2 selection bounds | Hammersley–Chapman–Robbins inequality + χ²-DRO (Ben-Tal 2013, Duchi–Namkoong, Lam) | ⬜ highest | `litrev-selection-bounds.md`. Most urgent: HCR is famous, double exposure (econ and ML referees), and our notes currently assert the opposite |
| T4 convex budget | Fenchel/Rockafellar duality | ⬜ low-effort | `litrev-convex-budget.md`. Already half-acknowledged internally; just confirm + cite |
| Lower-tier bundle | L1 identification = causal inference; L2 tilt = exponential-family cumulants; L3 T3 = signaling/strategic classification; L4 T6 = greedy capacity reduction | ⬜ bundled | `litrev-lower-tier.md`. One pass per item; escalate only if a near-exact precedent appears |
| Capstone refactor | — | ⬜ blocked on all above | `novelty-refactor.md`. Reframes prose+math to cite existing results, reduce novelty claims, restate T5 in projection form. Reopens "editing done" |

## Guardrails (don't skip)

- **Verify primary sources before citing proposition numbers.** The T5 passes
  reconstructed several paywalled originals (Feltham–Xie, Baker 2002, Chetty, DKL)
  from secondary sources (Budde 2007, Schnedler).
- **Don't overcorrect into "it's all trivial."** Keep the genuinely original layer
  credited: the contract (argued original), the subset-invariance reading, the
  synthesis/dictionary.
- The pride is earned by completeness of the translation table — that's why these
  reviews are the substance, not damage control.

## Pointers

- Plans: `litrev-selection-bounds.md`, `litrev-convex-budget.md`,
  `litrev-lower-tier.md`, `novelty-refactor.md`; sequencing in `next-steps.md`
  (Track A).
- T5 synthesis: `research/threads/lit_review/looking-for-exchange-rate-results/README.md`.
- Memories: `t5-prior-art-congruity`, `paper1-is-elementary-synthesis`.
- **Unified discovery (shared Phase 0):** `litrev-discovery.md` — the three
  reviews above now *consume* one shared cross-field discovery (don't run
  independent searches); it serves Track A and the parallel Track B gap paper
  alike. Runbook in `../literature-reference-gap-paper/audit-tasks/` 01–04 (+08);
  outputs in `research/threads/lit_review/cross-field-discovery/`.
