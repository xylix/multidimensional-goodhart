# Task 02 — Verify the existing 25-paper coding

**Objective.** Make every coded cell in the current table bulletproof: eliminate
false negatives (a prior-art citation missed because an API list was truncated)
and false positives (a name-collision mistaken for a real cite).

**Depends on:** 01 (so verification runs against the frozen corpus). **Blocks:** 08.

**Why it matters.** This is the accuracy core of the open items. The two largest
reference lists (Amodei 2016 ~150 refs, Leike 2018 ~165 refs) and two surveys
were coded from APIs that can silently drop entries; the negatives there are the
most attackable.

## Inputs
- `../citation-audit/audit.md` (master table, coding scheme, name-collision rules).
- `../citation-audit/corpus.md` (frozen list from 01).

## Protocol
1. **PDF-grep the big lists.** Pull the actual published/arXiv PDFs of Amodei
   2016 (1606.06565) and Leike 2018 (1811.07871), extract the bibliography, and
   grep (case-insensitive) for: holmstrom|holmström, milgrom, baker, feltham,
   xie, datar, kulp, lambert, budde, schnedler, chetty, feldstein, lipsey,
   lancaster, reynaert, sallee, baumol, montgomery, ridgway, kerr, campbell,
   strathern, prendergast, gibbons, lucas, chapman, robbins, cramer|cramér,
   ben-tal, duchi, namkoong, rockafellar. Disambiguate every hit per the
   name-collision rules (Bowen vs George Baker; Nathan vs accounting Lambert; etc.).
2. **Re-pull the surveys.** Kaufmann 2023 (2312.14925) had an empty S2 reference
   list; Wang 2026 (2604.13602) was partially indexed. Get clean reference lists
   (arXiv PDF) and code line-by-line.
3. **Independent re-code (double-coding).** For every paper in the corpus,
   re-verify each tier cell by a *second* method or a fresh sub-agent that has not
   seen the first coding. Record agreement/disagreement per cell. Resolve
   disagreements by going to the primary reference list.
4. **Apply name-collision rules strictly** throughout; add any new collisions found.

## Output
`../citation-audit/verification.md`: every correction to the existing table; a
per-cell confidence (confirmed-by-2-methods / single-source / flagged); the
PDF-grep evidence for Amodei and Leike. Apply corrections back into `audit.md`'s
master table.

## Done criteria
- Amodei 2016 and Leike 2018 negatives line-verified by PDF grep.
- Kaufmann and Wang surveys coded from clean reference lists.
- Every cell either confirmed by two methods or explicitly flagged.

## Guardrails
- Prefer PDF over API wherever a list is long or an API returns few/empty.
- Never code a surname hit without confirming author + venue.
