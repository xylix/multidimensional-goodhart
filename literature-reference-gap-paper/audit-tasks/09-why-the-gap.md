# Task 09 — Evidence the "why the gap exists"

**Objective.** Gather whatever *evidence* is feasible for the mechanisms behind
the gap, so the discussion section makes claims, not speculation.

**Depends on:** 04 (bridge/vocabulary data), 07 (verified coding). **Blocks:** 10.

**Why it matters.** "Why does the gap exist" is the discussion's spine; a referee
will reject hand-waving. Several mechanisms are actually testable from the data
already gathered.

## Inputs
- `../citation-audit/bridge-mapping.md` (vocabulary probe + bridge counts).
- `../citation-audit/verification.md` and `audit.md` (coding + Amodei PDF grep).

## Protocol
Evidence each mechanism; downgrade any unsupported one to an explicit conjecture:
1. **Vocabulary divergence.** Report the task-04 vocabulary-probe result — do
   econ/stats terms ever appear in the AI corpus? A clean negative is strong
   evidence that keyword-driven search structurally misses the prior art.
2. **Lineage capture / siloing.** A light citation-graph measure: the AI Goodhart
   cluster's internal-citation share vs. external (does it overwhelmingly cite
   itself?). Use the corpus + their reference lists.
3. **Inherited pruned base.** Did the field anchor (Amodei 2016) carry any
   contract-theory/estimation references forward? (answered by the task-07 PDF
   grep). If the anchor pruned them, downstream inheritance explains propagation.
4. (Optional) Any other mechanism the bridge data supports.

## Output
`../citation-audit/why-the-gap.md`: each mechanism with its evidence, or labeled
"conjecture" where the data does not support it.

## Done criteria
- Each mechanism either evidenced from the gathered data or labeled conjecture.

## Guardrails
- Do not assert a mechanism the data does not support — a labeled conjecture is
  acceptable and more honest than overreach.
