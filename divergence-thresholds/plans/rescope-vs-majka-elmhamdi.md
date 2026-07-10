# Re-scope gate: C1 vs Majka & El-Mhamdi 2025 (blocking, pre-activation)

Status: active gate, added 2026-07-10. This track may not activate (no thread
work, no spine promotion) until this note's question is answered. It exists
because the track was scooped **while parked** and its README/thread predate
the scooping paper entirely.

## What happened

The track's working hypothesis — *"there is a critical condition separating
bounded degradation from catastrophic divergence, and the discriminating
primitive is the tail index of the hidden value/harm relative to the
optimization channel"* (README, `research/threads/selection_tail_divergence.md`
C1) — is substantially anticipated by **Majka & El-Mhamdi 2025
(arXiv:2505.23445)** `[confident]`:

- They prove a **four-way regime taxonomy** (No/Benign/Weak/Strong Goodhart)
  discriminated by **tail weights and dependence structure**, building on
  El-Mhamdi & Hoang 2024 — i.e. regime-from-tails, which is C1's shape.
- Verified by reading, not memory: the July 2026 `empirical_goodhart` lit sweep
  read the primary PDF (2026-07-07), and `empirical_goodhart/contracts.py` now
  **encodes their Table 2** as adopted prior art, with reduction checks that
  must recover their verdicts in the 1-D additive limit.
- Kwa & Thomas 2024 (arXiv:2407.14503) separately own the narrower
  KL-regularization-specific catastrophic result. The README's anchor list
  mentions neither correctly (it predates the sweep; its "Catastrophic
  Goodhart" entry carries the since-corrected attribution).

## The gate question

**What, if anything, of this track survives as a distinct contribution?**
Candidate residuals to check against the 2505.23445 body (read, don't recall):

1. **Intervention-channel divergence.** Majka–El-Mhamdi and Kwa–Thomas are
   selection/optimization-pressure results; the parent's selection vs
   intervention split (and Zhuang–Hadfield-Menell's below-baseline result,
   parent O8) may leave the intervention-side threshold open. `[tentative]`
2. **Multidimensional tails.** Their taxonomy is (as encoded) 1-D additive;
   the parent's multidimensional channel structure (which channel absorbs the
   gaming, T5 exchange rates) may not be covered. `[tentative]`
3. **Threshold *location* vs regime *classification*** — whether anything
   quantitative beyond the taxonomy (rates, constants, the T2-vacuity
   boundary as a named threshold) is open. `[guess]`

## Disposition options (decide at gate, not before)

- **Merge:** fold the surviving residue into `empirical_goodhart` as the theory
  annex of its regime certificates (that prototype already owns the taxonomy
  encoding and the reduction checks).
- **Standalone, narrowed:** keep the track for whichever of 1–3 survives, with
  Majka–El-Mhamdi as the load-bearing anchor it must cite from the first line.
- **Kill:** if nothing survives, archive with this note as the record.

## Non-triggers

This gate does not reopen era-1 sequencing: the track stays parked behind the
parent book regardless. The gate only ensures no future session trusts the
pre-2505.23445 plans at face value.
