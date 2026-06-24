# Task 05 — Adversarial exceptions hunt (multi-LLM, token-heavy)

**Objective.** Find *every* AI-safety/alignment work that engages the economics
incentive / congruity / second-best / sufficient-statistic / estimation prior art,
and bound the "localized gap" claim precisely. The thesis is "they don't cite it,"
so the paper's credibility lives or dies on having found all the exceptions.

**Depends on:** 04 (its named citers are seeds). **Blocks:** 07, 08.

**This is the task to spend tokens and deep-research queries on.** Use the proven
adversarial harness from
`../../research/threads/lit_review/looking-for-exchange-rate-results/`.

## Inputs
- `../citation-audit/forward-census.md` (task 04 named citers).
- `../citation-audit/audit.md` (known exceptions: CHAI lineage — CIRL, Off-Switch;
  the BBS bridge; Zhuang–Hadfield-Menell's transaction-cost cluster).

## Protocol
1. **Write an adversarial prompt pair**, modeled on the exchange-rate `*_prompt.md`
   files: an *optimistic* framing ("the two fields are well-connected — surface
   all cross-pollination between AI Goodhart/reward-hacking and economics
   incentive/congruity/second-best theory") and a *pessimistic* framing ("the gap
   is near-total; find every exception that disproves it or concede the gap").
   Seed both with the known exceptions so the models must go *beyond* them.
2. **Hand the prompts to the user** to run on ChatGPT, Claude, and Gemini deep
   research (6 passes). Store raw outputs in `../citation-audit/exceptions-hunt/`
   (one file per model×framing), mirroring the exchange-rate folder layout.
3. **Run an autonomous sweep in parallel** (agent's own web sub-agents + APIs):
   - Every alignment paper citing Holmström / Baker / Feltham–Xie / DKL / Chetty /
     Lipsey–Lancaster / Reynaert–Sallee (extend task 04's hand-inspection).
   - The full extent of the **CHAI lineage** that imports contract theory.
   - **Vocabulary probe:** do the terms "congruity", "distortion", "multitask",
     "second best", "sufficient statistic", "incentive contract" ever appear in
     AI Goodhart / reward-hacking papers? (keyword search across the corpus + arXiv).
4. **Synthesize** into a catalogue: each exception characterized by (which econ
   branch it touches, what it cites, and — crucially — whether it connects that
   econ result to *Goodhart / reward overoptimization* or just to control/agency).

## Output
`../citation-audit/exceptions-hunt/README.md` (synthesis) + raw per-pass files.
The synthesis states the bounded claim: e.g. "contract theory enters alignment
only via the CHAI control branch and BBS; the performance-measurement /
congruity / second-best results that contain the multidim-Goodhart math have
zero alignment citers except [list]."

## Done criteria
- 6 external deep-research passes stored + the autonomous sweep done.
- A defensible, near-complete list of bridges/exceptions, each characterized.
- The localized-gap claim stated with explicit bounds and auditable negatives.

## Guardrails
- Treat "the gap is total" as a claim to *attack*, not defend — surface every
  exception. Do not overclaim totality; the CHAI/BBS exceptions are already known.
- Distinguish "cites the econ result" from "connects it to Goodhart" — the second
  is the gap the paper actually claims.
