# Recursive Goodhart

Status: separate research track for a *third* paper, split out from the parent
multidimensional-Goodhart project so it does not dilute that manuscript's
thesis. Pre-activation: the parent book (era 1) finishes first. Sibling to the
`divergence-thresholds/` track; both are parked behind the same era-1 gate.

## Scope

The parent project studies one rung of the proxy/target relation: a measured
proxy `P`, a hidden goal `G`, an intended correspondence `phi`, and a residual
`epsilon = P - phi(G)`. It is scrupulous that the hidden value/harm model is
*declared, not observed* — value weights and harm rates are analyst inputs, not
quantities recoverable from score movement.

This track takes that discipline one level up and asks what happens when the
audit *target* is itself a proxy. The goal `G` we score the proxy against — by
mathematics, by audit, or by the gut-feeling judgement "this new metric caused
bad side effects" — is never the true objective. The true objective is whatever
aligns with our utility, and the utility function is not a queryable item in the
current information state of the world. So `G` occupies the `P` slot at the next
level up, against a still-hidden `G'`, with its own correspondence `phi'`, its
own dimension gap, and its own residual. The tower of proxies-for-proxies has no
attained top.

Working one-line thesis: *the parent characterizes one proxy/target rung under a
declared value model; this track studies the regress that opens once the value
model is itself acknowledged as a proxy for an unqueryable utility — and asks
which Goodhart claims survive that regress and which do not.*

## Why this is a separate paper, not a chapter

The parent manuscript's value is an honest, largely elementary synthesis plus a
claim-licensing contract; its central caution is that no calculation licenses a
welfare conclusion without a declared response model. A regress narrative folded
into that book risks reading either as metaphysics or as the universal pessimism
the book refuses. Held separately and stated conditionally, it instead supplies
the *epistemic-foundations* half: it shows the parent's "declare, don't observe"
rule is exactly the constructive response to the regress, and it imports the
parent's negative results as guardrails against the regress's natural
over-claims.

## Relationship to the parent

- The parent lives at the repository root. Shared, paper-agnostic material
  (the core theorem set, negative results, the contract, build files) stays at
  the root; this directory carries only what is specific to the recursion track.
- This track reuses parent primitives and results *by name and concept*, never
  by file location or line: the proxy/target/correspondence/residual primitives
  (`P`, `G`, `phi`, `epsilon`), the dimension gap (`ker phi`) and observation gap
  (`epsilon`), the declared-not-observed contract, the selection vs intervention
  response split, the chi-square selection-intensity bound and its sharpness, the
  exchange-rate iff condition, and the killed minimum-complexity-attractor claim.
  Parent numbering (T1, T5, etc.) may drift; each reference below also names the
  result so it survives renumbering.

## Layout (mirrors the parent's and the divergence track's conventions)

- `plans/` — plans by lifecycle, per the parent `plans/README.md`: root =
  active, `could-do/` = future/parked, `archived/` = completed.
- `research/threads/` — to be created on activation, in the parent's
  thread-header style (`Iteration:`, `Status:`).

## Current work

- `plans/could-do/paper_spine.md` — paper outline, the rung-nesting formalism,
  imported parent findings, literature anchors, and track-local open questions.
