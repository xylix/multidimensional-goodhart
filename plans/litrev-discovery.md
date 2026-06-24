# Unified cross-field literature discovery (shared Phase 0)

Status: active. The **single** discovery effort that serves *both* paper-1
literature tracks. Created 2026-06-24 when the tracks were unified: previously the
gap paper (Track B) and the per-theorem novelty-refactor reviews (Track A) would
each have run their own cross-field searches — the *same* searches. Run discovery
once here; both tracks consume the output. Conforms to
`RESEARCH-ITERATIONS.md` §Planning norms and §Literature-review norms.

## Anchor (the originating question this serves)

"Does the AI-safety Goodhart literature cite the economics / statistics /
management prior art that contains the same math — and what is that prior art?"
Track A asks it **per theorem** (to cite-and-reframe each); the gap paper asks it
**in aggregate** (the citation-gap claim + the cross-field dictionary). One
discovery, two readings — confirmed still serving the originating question, not a
nicer adjacent one.

## Plan-invalidating question (resolve first — Planning norm)

*"Is the gap real, and is our delta over BBS 2023 (the existing econ↔AI bridge)
real?"* If the AI literature already cites this prior art, or BBS already does the
synthesis, both papers are dead. Settle at the cheapest stage: the seed 25-paper
audit already answers preliminarily (**gap real but localized; BBS bridges, but
in a neuroscience venue**). The confirming gate is discovery task 04 (bridge
mapping + exceptions hunt + BBS lock). **All heavy downstream investment —
freezing, full coding, the dictionary, any prose — is contingent on the
contribution surviving task 04.** If 04 shows the gap is not real or BBS covers
the delta, stop before the consume phase.

## Scope — discover the native home of EVERY theorem family + the broad landscape

- **T1/T2** selection bounds → Hammersley–Chapman–Robbins / χ²-DRO (estimation, DRO).
- **T4** convex budget → Fenchel/Rockafellar duality.
- **T5** exchange rate → contract-theory congruity. *Done* (the T5 review); fold in.
- **Lower tier:** L1 identification → causal inference; L2 tilt → exponential-family
  cumulants; L3 (T3) → signaling/Spence/contest; L4 (T6) → greedy/security games.
- **Broad prior-art landscape** across econ / accounting / public finance / welfare
  / management / OR / statistics (the gap paper needs breadth beyond the per-theorem homes).
- **AI-side corpus** (the "they don't cite it" denominator) and all AI↔prior-art
  bridges/exceptions.

## Runbook (single source of truth — do not duplicate task specs)

Discovery is executed by gap-paper audit tasks **01–04** (plus **08**
primary-source verification) in
`../literature-reference-gap-paper/audit-tasks/`: 01 AI corpus · 02 prior art
(econ/management) · 03 prior art (formal/stats) · 04 bridge mapping + exceptions
hunt + BBS lock · 08 primary-source verification. Method = the adversarial
two-pass harness (optimistic/pessimistic × ChatGPT/Claude/Gemini; **name the
suspected classical result in the prompt**; **the spread across passes/models is
the signal**; synthesis in the T5 README format).

## Shared output location (neutral home both tracks read)

`research/threads/lit_review/cross-field-discovery/`: `ai-corpus.md`,
`prior-art-econ.md`, `prior-art-formal.md`, `bridges.md`,
`prior-art-verification.md`, plus raw multi-LLM passes. (The gap paper's *coded
table* + gap synthesis stay in `literature-reference-gap-paper/`; Track A's
*per-theorem verdicts* go to its review folders / `research/core-math.md`.)

## Blocking graph (stated once — Planning norm)

```
Gate already cleared: T5 review ✅
        │
[Phase 0] UNIFIED DISCOVERY  (audit-tasks 01–04 + 08)
   discover-before-freeze: nothing frozen until both sides saturate
        │  ── confirming gate: task 04 (gap real? BBS delta?) ──
        ├─────────────────────────────┬──────────────────────────────
        ▼ (consumes)                   ▼ (consumes)
 TRACK A  per-theorem verdicts    TRACK B  gap paper
   litrev-selection-bounds (T1/T2)   05 freeze → 06 code → 07 verify
   litrev-convex-budget   (T4)       → 09 why → 10 synthesize
   litrev-lower-tier      (L1–L4)
        ▼                                 ▼
   novelty-refactor capstone         structure + draft the gap paper
```

Track A reviews and Track B coding both consume the shared discovery and may run
**in parallel** after it. Neither runs independent cross-field searches.

## Norm compliance check (RESEARCH-ITERATIONS.md)

- Discover before freeze ✓ · plan-invalidating question first ✓ (above) · blocking
  graph mapped once ✓ · no plan on an unverified negative ✓ (re-checks "no χ²
  analogue") · gap claim = corpus + counterexample hunt ✓ (01–05).
- **Separate fact from interpretation:** the gap-paper synthesis (task 10) must
  tag "paper P does not cite Q" (checkable, `[confident]` once coded) separately
  from "the fields are disconnected" (interpretive, its own lower tag).
- **"Same math" ≠ "same framing":** the dictionary states each equivalence at a
  named altitude (mapping vs theorem), not rhyming equations.
- **Cut made explicit:** the separate-tracks discovery structure is retired here
  (2026-06-24); reason = it would double-run identical searches.

## What this plan deliberately does not do

- No new theorems; no change to any theorem statement.
- Does not replace the consumers — Track A's reviews and the gap paper's
  consume-phase tasks remain; this only unifies the discovery they share.
