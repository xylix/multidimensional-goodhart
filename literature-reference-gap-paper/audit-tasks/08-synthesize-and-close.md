# Task 08 — Synthesize, freeze, and close the audit

**Objective.** Consolidate tasks 01–07 into a final, frozen audit that the
paper-structuring phase can build on directly, and flip the project status to
"audit closed."

**Depends on:** 01–07. **Blocks:** structuring the gap paper (Track B next phase).

## Inputs
- All `../citation-audit/*.md` artifacts produced by 01–07.

## Protocol
1. **Update the core artifacts** to the final state:
   - `audit.md`: master table at the frozen N (verified, double-coded); updated
     tier totals; incorporate the verification corrections.
   - `findings.md`: final thesis with precise numbers, the bounded exceptions
     (from 05), and the verified should-be-cited set (from 06).
2. **Write `../citation-audit/SUMMARY.md`** — the single source the structuring
   phase reads: the headline numbers (N, tier-zero counts); the localized-gap
   claim with its exact bounds and named exceptions; the verified econ
   should-be-cited set with proposition numbers; the BBS delta; the "why" with
   evidence levels.
3. **Prepare references.** Add the verified-absent precedents actually used + the
   should-be-cited set + BBS 2023 to `../../book/refs.bib` (or a gap-paper-local
   refs file if keeping it separate from the book). Mark any unverified/paywalled
   entry.
4. **Update status.** Tick the README checklist; in `../../plans/next-steps.md`
   mark Track B's audit ✅ closed and set Current focus → "structure the gap
   paper." Update the `citation-gap-finding` memory if the headline numbers
   changed materially from the 25-paper figures.

## Output
`../citation-audit/SUMMARY.md` (the deliverable) + updated `audit.md`,
`findings.md`, `refs.bib`, `next-steps.md`, README checklist.

## Done criteria
- SUMMARY.md is self-contained enough to structure the paper without re-reading
  the sub-artifacts.
- Every headline number traces to an auditable sub-artifact.
- Status flipped to "audit closed"; next focus set to structuring.

## Guardrails
- Do not start writing the paper's prose here — closing the audit is the boundary.
- If any task 01–07 left a flagged/unverified item, surface it in SUMMARY.md as a
  known limitation rather than papering over it.
