# Task 08 — Primary-source verification + theorem-family scope

**Objective.** Verify that each prior-art result the paper will lean on actually
says what we claim, at the primary-source level — and decide which theorem
families' citation gaps the paper asserts.

**Depends on:** 02, 03 (the discovered prior-art set). Can run early; **blocks** 09, 10.

**Why it matters.** The "this AI result = this econ/stats result" dictionary is
only as good as the statements behind it. The T5 review flagged paywalled
originals reconstructed from secondary sources — those must be verified before any
proposition number is cited.

## Inputs
- `../citation-audit/discovery-prior-art-econ.md`, `discovery-prior-art-formal.md`.
- `../../research/threads/lit_review/looking-for-exchange-rate-results/README.md`
  (T5 verdict + paywall caveats — build on it).

## Protocol
1. **Verify each result against its primary source** (PDF/published), recording
   the exact statement + proposition/theorem number. Priority set: Feltham–Xie
   1994 congruity; Baker 1992/2002 distortion = 1−cosθ; Holmström–Milgrom 1991
   multitask distortion; Chetty 2009 sufficient statistic; Lipsey–Lancaster 1956
   second best; Reynaert–Sallee 2016 either-direction gaming; Datar–Kulp–Lambert
   2001 set-monotonicity; Ridgway 1956; Prendergast 1999 / Gibbons 1998; plus the
   formal homes (Chapman–Robbins, χ²-DRO, Fenchel/Rockafellar). Flag paywalled
   ones for a user pull or a multi-LLM reconstruction (mark reconstructions).
2. **Scope decision — which families' gaps the paper claims.** Recommend among:
   (a) performance-measurement/congruity only (T5, tightest); (b) also
   estimation/DRO (T1/T2, with the Laidlaw χ² near-miss), convex duality (T4),
   second best. Reconcile with Track A (`../../plans/litrev-*.md`): cite Track A
   for the math, claim only the *citation gap* per family; avoid double-claiming.

## Output
`../citation-audit/prior-art-verification.md`: per-result verified statement +
source + proposition number (or paywall flag); the scope decision + rationale.

## Done criteria
- Every leaned-on prior-art result verified at source or explicitly flagged.
- Scope decision recorded and reconciled with Track A.

## Guardrails
- No proposition/theorem numbers without a primary source; mark reconstructions.
- Multi-LLM deep research is fine for paywalled reconstructions — store the passes.
