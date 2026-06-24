# Task 03 — Code the newly added corpus papers

**Objective.** Apply the coding scheme to the papers that task 01 added beyond the
original 25, to the same double-checked standard as task 02.

**Depends on:** 01 (provides the additions list). Run after or alongside 02.
**Blocks:** 08.

**Why it matters.** The denominator is only credible if the *whole* frozen corpus
is coded uniformly — additions cannot be left as titles-only.

## Inputs
- `../citation-audit/corpus.md` (the additions, with stable IDs).
- `../citation-audit/audit.md` (coding scheme + name-collision rules).

## Protocol
1. For each added paper, retrieve the full reference list (S2/OpenAlex API;
   PDF fallback for long lists or empty APIs). Record access method + completeness.
2. Code every prior-art tier (CONTRACT, PUBFIN, 2BEST, CORRECT, MGMT, ESTIM,
   Lucas, Goodhart-eponym) with verbatim reference strings for any present.
3. **Double-code** each cell (second method or fresh sub-agent), as in task 02.
4. Apply name-collision rules strictly.
5. One-line disciplinary-composition note per paper; flag anything unverifiable.

## Output
Extend the master table in `../citation-audit/audit.md` with the new rows
(clearly grouped), plus verbatim hits and per-paper notes.

## Done criteria
- All additions coded and double-checked; table now covers the full frozen N.
- Tier totals in `audit.md` updated to the new denominator.

## Guardrails
- Same scheme as the original 25 — do not introduce new tiers or relabel.
- Grey-lit/blog items (flagged in 01) are noted n/a, not coded.
