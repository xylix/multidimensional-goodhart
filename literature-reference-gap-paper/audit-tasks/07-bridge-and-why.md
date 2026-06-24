# Task 07 — Lock the bridge paper + evidence the "why"

**Objective.** Finalize the profile of the one true bridge paper (BBS 2023) and
the gap paper's delta over it, and gather whatever *evidence* is feasible for the
"why the gap exists" mechanisms — so they are claims, not speculation.

**Depends on:** 04, 06. **Blocks:** 08.

**Why it matters.** "Why does the gap exist" is the discussion section's spine; a
referee will reject hand-waving. Some mechanisms are actually testable.

## Inputs
- `../citation-audit/audit.md` (BBS profile + the four "why" mechanisms).
- `../citation-audit/forward-census.md` and `exceptions-hunt/` (from 04, 05).

## Protocol
1. **Lock BBS 2023** (John, Caldwell, McCoy, Braganza, "Proxy failure," BBS):
   exact econ reference strings (Holmström 1979/2017, Baker 2002, Kerr 1975,
   Bénabou–Tirole 2016) and AI strings (Amodei 2016, Manheim–Garrabrant 2018,
   Everitt/Krakovna 2021); confirm the corrected premises (no Lipsey ref;
   "Chetty" = Marshini Chetty, privacy). State the gap paper's precise delta over
   BBS: a *quantified* audit of the formal-Goodhart corpus + the
   projection/congruity-level math dictionary + the "what transfers" list.
2. **Evidence the "why" mechanisms** (keep each claim to what the evidence supports):
   - *Vocabulary divergence:* report the task-05 vocabulary-probe result — do econ
     terms ever appear in the corpus? (a clean negative is strong evidence).
   - *Lineage capture / siloing:* a light citation-graph measure — the AI Goodhart
     cluster's internal-citation share vs. external (does it cite mostly itself?).
   - *Inherited pruned base:* trace whether Amodei 2016 (the field anchor) carried
     any contract-theory references forward (task 02 PDF grep answers this).
   Downgrade any mechanism without support to "conjecture" explicitly.

## Output
`../citation-audit/bridge-and-why.md`: the locked BBS profile + delta; each "why"
mechanism with its evidence or a "conjecture" label.

## Done criteria
- BBS reference strings + delta locked and accurate.
- Each "why" mechanism either evidenced or labeled conjecture.

## Guardrails
- Do not assert a mechanism the data does not support; a labeled conjecture is fine.
- Cite BBS accurately — it is the closest prior work and must be credited precisely.
