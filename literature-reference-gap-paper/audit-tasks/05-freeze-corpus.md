# Task 05 — Freeze the corpus + prior-art tier scheme

**Objective.** Now that discovery (01–04) has saturated both sides and mapped the
bridges, freeze a *reproducible* corpus: explicit inclusion/exclusion criteria, a
frozen AI corpus (N), and a frozen prior-art tier scheme (the definitive set of
fields/papers coded as "should-be-cited").

**Depends on:** 01–04. **Blocks:** 06.

**Why now (not first).** This task was originally placed first; it was moved here
because the earlier 25-paper set was a narrow, T5-seeded convenience sample.
Freezing only after saturation is what makes the denominator defensible — the
freeze must reflect the real landscape, not the seed.

## Inputs
- `../../research/threads/lit_review/cross-field-discovery/ai-corpus.md` (candidate pool).
- `../../research/threads/lit_review/cross-field-discovery/prior-art-econ.md`,
  `prior-art-formal.md`.
- `../../research/threads/lit_review/cross-field-discovery/bridges.md`.

## Protocol
1. **Confirm saturation.** If 01–03 are still surfacing new fields/papers, kick
   back — do not freeze a moving target.
2. **AI-corpus criteria.** Write inclusion/exclusion (peer-reviewed or arXiv,
   2016–2026, formalizes/surveys proxy-vs-true divergence; grey-lit a flagged
   category). Apply to the discovery pool → frozen N with per-item include/exclude
   reasons and stable IDs.
3. **Freeze the prior-art tier scheme.** From the discovery artifacts, fix the
   definitive tier list and the specific anchor papers per tier (this *extends*
   audit.md's scheme — it may now include formal-math tiers and new econ tiers).
4. **Record saturation evidence** justifying the freeze (what stopped yielding new
   results, for each side).

## Output
`../citation-audit/corpus.md`: frozen AI corpus (id · decision · reason) + frozen
prior-art tier scheme + criteria + saturation note + flagged grey-lit set.

## Done criteria
- Both corpora frozen with written reasons and stable IDs.
- Tier scheme final; saturation documented.

## Guardrails
- Do **not** freeze if discovery has not saturated — return to 01–03.
- Do not code tiers here — coding is task 06.
