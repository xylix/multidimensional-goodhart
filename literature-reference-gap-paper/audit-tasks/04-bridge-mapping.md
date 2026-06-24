# Task 04 — Map every AI↔prior-art bridge (census + adversarial hunt)

**Objective.** Map *all* citation bridges between the AI corpus (task 01) and the
prior art (tasks 02, 03) — quantitatively (who-cites-whom counts) and
adversarially (multi-LLM hunt for any cross-citation) — and lock the one true
bridge paper (BBS 2023). This both discovers more literature and bounds the gap
claim before freezing.

**Depends on:** 01, 02, 03. **Blocks:** 05, 09. **Token-heavy — spend freely.**

**Why it matters.** The thesis is "they don't cite it," so credibility rests on
having found *every* exception. The known ones (CHAI: CIRL & Off-Switch cite
Holmström–Milgrom 1991 / Baker 2002; BBS bridge; Zhuang–Hadfield-Menell's
transaction-cost cluster) must be the floor, not the ceiling.

## Inputs
- `../../research/threads/lit_review/cross-field-discovery/ai-corpus.md`,
  `prior-art-econ.md`, `prior-art-formal.md` (shared discovery outputs).
- `../citation-audit/audit.md` (known exceptions + reverse-sweep seeds).

## Protocol
1. **Forward-citation census.** For every prior-art paper from 02/03: full citing
   set (OpenAlex/S2), count CS/AI, **hand-verify** each CS-tagged citer (the tag
   is broad), name genuine alignment citers. Record query + date.
2. **Reverse check.** Do any AI-corpus papers cite any prior-art item? Reconcile
   with the eventual coding (catches misses early).
3. **Multi-LLM adversarial exceptions hunt.** Write an optimistic ("the fields are
   well-connected — surface all cross-pollination") / pessimistic ("the gap is
   near-total — find every exception or concede") prompt pair; hand to the user
   for ChatGPT/Claude/Gemini deep research; store raw in
   `../citation-audit/exceptions-hunt/`. Seed with the known exceptions so models
   go beyond them.
4. **Vocabulary probe.** Do econ/stats terms ("congruity", "distortion",
   "multitask", "second best", "sufficient statistic", "Chapman–Robbins") ever
   appear in the AI corpus? (keyword search across corpus + arXiv).
5. **Lock BBS 2023** (John et al., "Proxy failure," Behavioral and Brain
   Sciences): exact econ + AI reference strings; corrected premises (no Lipsey
   ref; "Chetty" = Marshini Chetty, privacy).
6. **Catalogue every bridge:** prior-art branch · what is cited · and — crucially —
   whether it connects that result to *Goodhart / reward overoptimization* or only
   to control/agency.

## Output
**Shared discovery output** (neutral home, also consumed by Track A):
`../../research/threads/lit_review/cross-field-discovery/bridges.md` — census
table + complete bridge/exception catalogue + the BBS lock + the bounded
localized-gap statement. Raw passes in
`../../research/threads/lit_review/cross-field-discovery/exceptions-hunt/`.

**This task is the confirming gate for the plan-invalidating question** (is the
gap real? is the BBS delta real? — see `../../plans/litrev-discovery.md`). If the
gap is not real or BBS already covers the delta, **stop** before the consume
phase (tasks 05–10 / Track A reviews).

## Done criteria
- Census counts for all prior-art papers; near-complete exception catalogue.
- BBS locked; vocabulary-probe result recorded (a clean negative is strong).
- The localized-gap claim stated with explicit bounds + auditable negatives.

## Guardrails
- Distinguish "cites the econ result" from "connects it to Goodhart" — the second
  is the gap actually claimed.
- Attack totality; don't defend it. The CHAI/BBS exceptions are already known.
