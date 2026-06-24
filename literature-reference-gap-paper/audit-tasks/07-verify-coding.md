# Task 07 — Independent verification / double-code

**Objective.** Re-verify every coded cell by a second, independent method so the
table is bulletproof: eliminate false negatives (a citation missed because an API
list was truncated) and false positives (a name-collision mistaken for a cite).

**Depends on:** 06. **Blocks:** 10.

**Why it matters.** Single-pass coding is the most attackable part of a
bibliometric claim. Inter-rater agreement (or a second method) is what makes
"0 citations" credible — especially the negatives on the largest lists.

## Inputs
- `../citation-audit/audit.md` (first-pass table from 06).
- `../citation-audit/corpus.md` (frozen N).

## Protocol
1. **PDF-grep the big lists.** For the longest bibliographies (e.g. Amodei 2016
   ~150 refs, Leike 2018 ~165 refs), extract the actual PDF bibliography and grep
   (case-insensitive) for: holmstrom|holmström, milgrom, baker, feltham, xie,
   datar, kulp, lambert, budde, schnedler, chetty, feldstein, lipsey, lancaster,
   reynaert, sallee, baumol, montgomery, ridgway, kerr, campbell, strathern,
   prendergast, gibbons, lucas, chapman, robbins, cramer|cramér, ben-tal, duchi,
   namkoong, rockafellar. Disambiguate every hit.
2. **Line-verify thin/empty-API cases** (e.g. the surveys) against clean
   reference lists.
3. **Independent re-code.** A fresh sub-agent (blind to the first coding) re-codes
   each cell; record agreement/disagreement; resolve disagreements at the primary
   reference list. Assign a per-cell confidence (2-method-confirmed / single /
   flagged).

## Output
`../citation-audit/verification.md`: every correction; per-cell confidence; the
PDF-grep evidence for the big lists. Apply corrections back into `audit.md`.

## Done criteria
- Big-list negatives line-verified by PDF grep.
- Every cell either confirmed by two methods or explicitly flagged.

## Guardrails
- Prefer PDF over API wherever a list is long or an API returns few/empty.
- Never confirm a surname hit without author + venue.
