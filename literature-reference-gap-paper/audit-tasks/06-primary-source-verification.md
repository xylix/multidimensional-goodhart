# Task 06 — Primary-source verification + theorem-family scope

**Objective.** Verify that each economics "should-be-cited" result actually says
what the paper will claim it says, at the primary-source level — and decide which
theorem families' citation gaps the paper asserts.

**Depends on:** none (can run early). **Blocks:** 07, 08.

**Why it matters.** The paper's "this AI result = this econ result" dictionary is
only as good as the econ statements behind it. The T5 review flagged that several
originals were paywalled and reconstructed from secondary sources — those must be
verified before any proposition number is cited.

## Inputs
- `../citation-audit/audit.md` ("should-be-cited" set + caveats).
- `../../research/threads/lit_review/looking-for-exchange-rate-results/README.md`
  (the T5 verdict + its paywall caveats — do not re-derive, build on it).

## Protocol
1. **Verify each econ result against its primary source** (PDF / published text),
   recording the exact statement and proposition/theorem number:
   - Feltham–Xie 1994 congruity; Baker 1992/2002 distortion = 1−cosθ; HM1991
     multitask distortion; Chetty 2009 sufficient statistic; Lipsey–Lancaster
     1956 second best; Reynaert–Sallee 2016 either-direction gaming Prop;
     Datar–Kulp–Lambert 2001 set-monotonicity; Ridgway 1956; Prendergast 1999 /
     Gibbons 1998 (survey statements). Flag any that remain paywalled and need a
     user pull or a multi-LLM reconstruction (mark reconstructions as such).
2. **Scope decision — which families' gaps the paper claims.** Options, with a
   recommendation and rationale:
   - (a) performance-measurement / congruity only (T5), the tightest claim; or
   - (b) also estimation/DRO (T1/T2 — Chapman–Robbins / χ²-DRO; note the Laidlaw
     2024 χ²/occupancy near-miss that cites no estimation prior art); convex
     duality (T4); second best.
   Coordinate with Track A (`../../plans/litrev-*.md`): the gap paper can cite
   Track A for the *math*, but the *citation-gap per family* is the gap paper's to
   state. Avoid double-claiming novelty.

## Output
`../citation-audit/prior-art-verification.md`: per-result verified statement +
source + proposition number (or paywall flag); the scope decision with rationale.

## Done criteria
- Every should-be-cited econ result verified at source or explicitly flagged.
- Scope decision recorded and reconciled with Track A.

## Guardrails
- No proposition/theorem numbers without a primary source; mark reconstructions.
- Multi-LLM deep research is fine for paywalled reconstructions — store the passes.
