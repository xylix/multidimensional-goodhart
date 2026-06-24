# Task 06 — Code the full frozen corpus (first pass)

**Objective.** Code every paper in the frozen AI corpus against the final
prior-art tier scheme — one uniform first pass over the whole denominator.

**Depends on:** 05. **Blocks:** 07.

**Why it matters.** The headline is a denominator claim; every paper in N must be
coded uniformly under the *same* (possibly expanded) tier scheme, including
re-coding the original 25 if the scheme grew in task 05.

## Inputs
- `../citation-audit/corpus.md` (frozen N + final tier scheme).
- `../citation-audit/audit.md` (coding scheme mechanics + name-collision rules).

## Protocol
1. For each paper in N, retrieve the full reference list (S2/OpenAlex; PDF
   fallback for long lists or empty APIs). Record access method + completeness.
2. Code every tier (the final scheme from task 05) with verbatim reference
   strings for any present.
3. Apply name-collision rules strictly (Bowen vs George Baker; Nathan vs
   accounting Lambert; Marshini vs Raj Chetty; ML "Xie" vs Feltham–Xie; etc.).
4. One-line disciplinary-composition note per paper; flag anything unverifiable.

## Output
The master coded table in `../citation-audit/audit.md`, extended to the full N
under the final tier scheme, with verbatim hits and per-paper notes. Updated tier
totals.

## Done criteria
- Every corpus paper coded once, uniformly, under the final scheme.
- Tier totals reflect the frozen denominator.

## Guardrails
- PDF over API for long lists.
- Grey-lit/blog items are noted n/a, not coded.
- This is the *first* pass — independent verification is task 07.
