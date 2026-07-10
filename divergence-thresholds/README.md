# Divergence Thresholds

Status: separate research track for a *second* paper, split out from the parent
multidimensional-Goodhart project so it does not dilute that manuscript's
thesis. Pre-activation: the parent book (era 1) finishes first.

## Scope

The parent project characterizes *whether* proxy gaming activates — the
selection/intervention activation thresholds (T3 Stackelberg wedge, T4 convex
budget, T6 adaptive-hardening boundary). None of those characterizes *severity
past activation*: whether activated gaming degrades true value gracefully
(bounded) or collapses it below baseline (catastrophic).

This track takes up that gap. Working hypothesis: there is a critical condition
separating bounded degradation from catastrophic divergence, and the
discriminating primitive is the **tail index of the hidden value/harm relative
to the optimization channel**, not the magnitude of optimization pressure.

Working one-line thesis: *the parent characterizes whether proxy gaming
activates; this track characterizes whether activated gaming diverges, and the
boundary is a tail comparison.*

## Relationship to the parent

- The parent lives at the repository root (to become `multidimensional-goodhart/`
  after a later cleanup).
- Shared, paper-agnostic material stays at the root: the core theorem set
  (`../research/core-math.md`), negative results, and the build/Makefiles.
- This directory carries only what is specific to the divergence/catastrophe
  track.
- This track reuses parent primitives (`S`, `G`, `P`, `phi`, `epsilon`, `U`,
  `nu`, `K_theta`, `W_theta`, `mu_theta`, selection intensity `delta`) from
  `../research/core-math.md`. It does not re-derive them.

## Layout (mirrors the parent's conventions)

- `research/threads/` — individual research notes in the parent's thread-header
  style (`Iteration:`, `Status:`).
- `plans/` — plans by lifecycle, per `../plans/README.md`: root = active,
  `could-do/` = future/parked, `archived/` = completed.

## Anchors

- **El-Mhamdi & Hoang 2024** (arXiv:2410.09638) — tail-distribution-dependent
  scalar bounds; already the parent's `load-bearing` anchor in
  `../research/threads/lit_review/README.md`.
- **Catastrophic Goodhart** (Kwa, D. Thomas, et al. 2023) — direct tail-index
  comparison (error tails >= value tails => proxy maximization ignores value).
- **Gao, Schulman, Hilton 2023** — reward-model overoptimization scaling laws;
  "optimization pressure = KL" is the RL analogue of the tilt strength here.
- **Zhuang & Hadfield-Menell 2020** — intervention-channel below-baseline
  overoptimization (parent open question O8).
- **Manheim & Garrabrant 2018** — regime taxonomy; parent maps the four
  variants onto selection/intervention.

## Current work

- **`plans/rescope-vs-majka-elmhamdi.md` — BLOCKING GATE (2026-07-10): the
  track's tail-comparison hypothesis is substantially anticipated by Majka &
  El-Mhamdi 2025 (arXiv:2505.23445); re-scope against it before trusting any
  plan below or activating the track.**
- `research/threads/selection_tail_divergence.md` — opening conjecture (C1),
  cheapest test, failure condition. Predates the gate note above.
- `plans/could-do/paper_spine.md` — paper outline + thread registry. Predates
  the gate note above.
