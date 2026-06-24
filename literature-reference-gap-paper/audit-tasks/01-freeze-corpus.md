# Task 01 — Freeze the corpus

**Objective.** Replace the ad-hoc 25-paper set with a *reproducible* corpus: an
explicit inclusion/exclusion protocol, a candidate pool with include/exclude
reasons, and a frozen included set (target ≈30–40) with stable IDs.

**Depends on:** none. **Blocks:** 02 (coding), 03 (codes the additions).

**Why it matters.** The headline is a denominator claim ("across N papers, the
prior art is cited 0 times"). A referee will attack corpus cherry-picking first.
A written protocol turns "25 papers" into "N selected from M candidates by
criteria X," which is defensible.

## Inputs
- `../citation-audit/audit.md` (current 25 + clusters).
- `../plan.md` (corpus inclusion rule sketch under G1).

## Protocol
1. **Write inclusion/exclusion criteria explicitly.** Suggested: peer-reviewed or
   arXiv works, 2016–2026, that (a) state or formalize a proxy-vs-true-objective
   divergence result, or (b) survey reward hacking / specification gaming /
   reward(-model) overoptimization / Goodhart in ML. Exclude pure blog posts and
   grey literature **as a separate flagged category** (e.g. Krakovna 2020
   specification-gaming) rather than silently dropping them — note they have no
   minable reference list.
2. **Build the candidate pool (M).** Combine:
   - Forward-citation expansion (Semantic Scholar / OpenAlex) of anchors: Amodei
     2016, Manheim–Garrabrant 2018, Skalse 2022, Gao 2023, El-Mhamdi 2024.
   - Keyword search: "reward hacking", "reward overoptimization", "reward model
     overoptimization", "specification gaming", "proxy gaming", "Goodhart" +
     {RL, LLM, alignment, RLHF}.
   - Reference lists of the recent surveys (Zhong 2025, Kaufmann 2023, Wang 2026).
3. **Dedup and apply criteria.** For every candidate, record include/exclude + a
   one-line reason. Keep the existing 25 unless a criterion excludes one (justify).
4. **Freeze N.** Recommend 30–40. List the additions beyond the current 25 with
   stable arXiv/DOI IDs (these go to task 03 for coding).

## Output
`../citation-audit/corpus.md`: the criteria; the candidate table (id · decision ·
reason); the frozen included list with stable IDs; the flagged grey-lit set.

## Done criteria
- Criteria written and applied uniformly.
- Frozen list with stable IDs; additions beyond the 25 clearly marked.
- Protocol reproducible (queries/databases/date recorded).

## Guardrails
- Do **not** code tiers in this task — corpus only.
- Do not drop any of the existing 25 without a stated criterion.
- Preserve blog/grey-lit as a flagged category, not a deletion.
