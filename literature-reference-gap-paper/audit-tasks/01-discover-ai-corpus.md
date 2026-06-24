# Task 01 — Discover the AI-side corpus (comprehensive)

**Objective.** Comprehensively discover the AI/ML side — *all* work that
formalizes or seriously analyzes proxy-vs-true-objective divergence. This is the
population the audit's denominator will be drawn from. Output a **saturated
candidate pool**, not a frozen set.

**Depends on:** none (run in parallel with 02, 03). **Blocks:** 04, 05.

**Why it matters.** The existing 25 came from narrow, anchor-seeded expansion. If
the pool is a convenience sample, "across N papers, 0 cite the prior art" is
attackable. Breadth now → a defensible denominator later.

## Inputs
- `../citation-audit/audit.md` (the 25 — treat as **seeds, not the set**).

## Protocol
1. **Multi-modal search** (agent's own web sub-agents + S2/OpenAlex), expanding
   until new queries mostly return duplicates (record the saturation point):
   - Forward **and** backward citations of anchors: Amodei 2016, Manheim–Garrabrant
     2018, Skalse 2022/2023, Gao 2023, El-Mhamdi 2024, Krakovna specification-gaming.
   - Keyword families: reward hacking; reward / reward-model overoptimization;
     specification gaming; proxy gaming / proxy failure; Goodhart + {RL, LLM,
     alignment, RLHF}; reward tampering; reward misspecification; strategic
     classification; performative prediction; metric/benchmark gaming; adaptive
     holdout / leaderboard overfitting; mesa-optimization / inner alignment (proxy).
   - Venues beyond core ML: AIES, FAccT (strategic ML), EC / econ-CS, causal-ML.
2. **Record each candidate**: id, year, venue, one line on its proxy-divergence
   content, and how it was found (provenance).
3. **Flag borderline items** (grey-lit/blogs like Krakovna; adjacent-but-maybe-out
   like pure benchmark-overfitting) for the freeze decision in task 05 — don't
   resolve inclusion here.

## Output
`../citation-audit/discovery-ai.md`: the candidate pool (a clear superset of the
25) with provenance per item, and an explicit saturation note.

## Done criteria
- Saturation reached and documented (what searches stopped yielding new papers).
- Pool is a superset of the 25; borderline items flagged, not decided.

## Guardrails
- **Discovery only** — no coding, no freezing, no inclusion/exclusion calls.
- Err toward over-inclusion here; task 05 prunes with written criteria.
