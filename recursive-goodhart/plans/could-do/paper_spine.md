# Paper spine: recursive Goodhart

Status: could-do / pre-activation. Outline plus the rung-nesting formalism and
the open-problem registry for a third paper. Era-1 discipline still applies: the
parent book finishes first; this is not the active workstream until a human
activates it.

This document is written to survive large changes to the parent research. It
references parent results by concept and name, not by file or line; if a result
is renumbered or rehoused, the prose description is enough to relocate it.

## Working title

*Recursive Goodhart: Proxy Regress and What Survives It When the True Goal Is
Not Queryable*

## Core claim (one line)

Every Goodhart audit compares a proxy against a *goal that is itself a proxy*.
The true objective — whatever aligns with our utility — is not a queryable item
in the world's current information state, so the comparison recurs and never
terminates. This paper formalizes the recursion as nested copies of the parent's
single proxy/target rung, and uses the parent's own results to separate the
recursive claims that are licensed from those that are not. The thesis is
*epistemic*, not a new universal effect-size law.

## The central reframe

Recursive Goodhart is not a new failure mode bolted onto the parent framework.
It is the parent framework's *founding premise*, stated openly. The parent's
load-bearing methodological rule — that the hidden value/harm model is declared
or estimated, never read off score movement — is precisely the operational form
of "we cannot query the utility function directly." So the paper has two arms:

- **Constructive arm.** Given that the true goal is permanently unqueryable,
  the parent's declare-don't-observe contract is what still licenses conditional
  conclusions. Recursive Goodhart is the *reason* that contract is mandatory, not
  optional fastidiousness. The regress is the justification for the discipline.
- **Disciplining arm.** The parent has already killed the most tempting strong
  forms of the recursion. Those negative results become guardrails: they say
  which recursive claims are over-claims. (See "Imported findings" below.)

## The rung formalism (the one new formal object)

The parent gives the algebra of a single level: proxy `P`, hidden goal `G`,
intended correspondence `phi: R^m -> R^k`, residual `epsilon = P - phi(G)`, with
two ways the proxy departs from the goal — the **dimension gap** `ker phi` (goal
directions the proxy cannot see) and the **observation gap** `epsilon`
(corruption of the directions it can see).

Recursive Goodhart instantiates the *same diagram one level up*: the goal `G` is
not terminal but plays the proxy role against a still-hidden `G'`, with a fresh
correspondence `phi'`, residual `epsilon' = G - phi'(G')`, and gaps `ker phi'`,
`epsilon'`. Iterate to a tower `P -> G -> G' -> ...` whose limit is the true
utility `U`, which is never attained at any finite information state. Two
quantities accumulate up the tower:

- the **composed dimension gap** — the union/aggregate of `ker phi`, `ker phi'`,
  ... : goal directions invisible at *some* rung are invisible to the bottom
  proxy. Blindness only grows downward.
- the **composed observation gap** — the propagation of `epsilon`, `epsilon'`,
  ... : artifacts at higher rungs corrupt the meaning of lower-rung audits.

The single genuinely new formal question (below, Q-R1) is whether per-rung
control composes: does drift stay bounded up the tower, or can it blow up?

## Imported parent findings (used as load-bearing structure)

Named by result, not by location, so they survive parent reorganization.

1. **Declared-not-observed contract.** The parent's claim-licensing discipline:
   value weights, harm rates, action costs, and response kernels are analyst
   inputs. *Role here:* the constructive arm — the only coherent response to an
   unqueryable top of the tower. Recursive Goodhart explains *why* it cannot be
   relaxed.

2. **Underidentification of mechanism from a score path (the "several stories"
   result).** One observed proxy trajectory is compatible with multiple
   incompatible mechanisms (selection of better units, genuine improvement,
   format drilling, population change, reporting repair), and no calculation
   licenses a welfare conclusion without a declared model. *Role here:* the
   gut-feeling check the thesis names — "this new metric caused bad side
   effects" — is itself a proxy measurement at a higher rung and inherits exactly
   this underidentification. The audit of `P` against `G` is no more identified
   than `P` against raw scores. This is the paper's sharpest single point.

3. **Selection vs intervention split, and its representation-dependence.** The
   response channel (reweighting fixed types vs changing fixed-type behavior) is
   not representation-free; a richer declared type space can absorb intervention
   into selection. *Role here:* the regress appears structurally — *what counts
   as the fixed goal at a rung versus a gamed response to it is itself a modeling
   choice*, re-made at every level. The tower's rungs are not canonical.

4. **Chi-square selection-intensity bound and its sharpness.** For pure
   selection, hidden drift in a coordinate is bounded by selection intensity
   times that coordinate's baseline spread (the parent's coordinate-explicit and
   value-weighted selection bounds); the envelope is tight (Cauchy-Schwarz
   equality attained) and the L^2/finite-second-moment hypothesis is *necessary*
   — finite hidden variance alone does not bound drift at unbounded intensity.
   *Role here:* this is the per-rung bound to be composed in Q-R1, and the
   necessity result is the standing warning that a single rung lacking L^2
   control can let the whole tower diverge.

5. **Exchange-rate iff condition (the additive harm-conservation result).**
   Fixed-deficit hidden harm is conserved across changes to the measured set iff
   harm-per-score is uniform across active channels (the harm-rate equals a
   constant times the score weight) — recognized in the parent's later reading as
   the classical congruity condition (Feltham-Xie / Baker), with the
   subset-invariance framing as the part that may be novel. *Role here:* gives a
   precise rung-local condition under which moving up one level *does not* change
   total harm — a candidate for a "harmless rung" in the tower, and the place to
   check whether congruity can hold *simultaneously* across rungs.

6. **Killed minimum-complexity-attractor claim.** The parent asked whether
   repeated proxy repair converges to a lowest-complexity residual and answered
   *no, not generically*: selection channels do not optimize over hidden drifts,
   and intervention follows cost/search geometry rather than a universal
   complexity metric; convergence is licensed only under an aligned mechanism
   (fixed activation costs, sparse affordances, low-rank maps, simplicity-biased
   search prior). *Role here:* this is the most important guardrail. It blocks
   the seductive strong recursive claim that "iterated proxy repair converges to
   the truth / to the simplest residual / monotonically degrades." The recursion
   is an *epistemic* regress; it is **not** a guaranteed *dynamical* attractor.
   Any convergence claim must declare the response geometry first.

## Why the dimensional reading is not revived here

The parent killed the claim that hidden-coordinate *count* alone determines harm
(independent hidden coordinates do not move under thresholding however many there
are; signed aggregate error is unstable). This track therefore does **not** argue
that "more rungs" or "higher-dimensional `ker phi`" mechanically means more harm.
The recursion's force is the *unqueryability of the top* and the propagation of
artifacts, not a dimension count. Stating this up front keeps the paper from
re-importing a dead slogan.

## Literature anchors

Stale-tolerant; cite by argument, refresh editions on activation. Several already
live in the parent's bibliography.

Economics / measurement:
- **Goodhart 1975**; **Campbell 1979**; **Strathern 1997** — the canonical
  statements the regress generalizes.
- **Lucas 1976** — the regress in dynamic form: estimated relationships collapse
  under policy because agents' true objective was never the estimated one. A
  direct macro instance of "the audit target is a proxy."
- **Holmstrom & Milgrom 1991** — multitask agency; the unrewarded task is the
  dimension gap `ker phi` made concrete.

Revealed preference / unidentifiability (the economics+philosophy core of the
"can't query the utility" claim):
- **Samuelson** revealed preference and **Sen** ("Behaviour and the
  Misidentification of Preference"; internal consistency of choice) — utility is
  not recoverable from finite choice behavior; the parent's "value weights not
  identifiable from score movement" is this impossibility recurring at every
  rung.
- **Armstrong & Mindermann 2018** ("Occam's razor is insufficient to infer the
  preferences of irrational agents") — even with a simplicity prior, the
  utility-function-plus-rationality decomposition is unidentifiable from
  behavior. This is the tightest external statement that the top of the tower is
  unqueryable, and it independently corroborates the killed
  minimum-complexity-attractor result (simplicity does not pin down the goal).

AI alignment / value learning:
- **Manheim & Garrabrant 2018** — Goodhart regime taxonomy; map the four variants
  onto the per-rung selection/intervention split.
- **Hadfield-Menell et al.** inverse reward design / CIRL — explicitly treats the
  specified reward as a proxy observation of the true reward; this is one rung of
  the tower formalized in an RL setting, and a natural point of contact.
- **El-Mhamdi & Hoang 2024** and **Gao, Schulman, Hilton 2023** — tail-dependent
  bounds and overoptimization scaling; shared with the divergence-thresholds
  track and relevant to whether per-rung drift composes (Q-R1).

Philosophy:
- The **problem of the criterion** (Sextus Empiricus; Chisholm's modern framing)
  — to validate a proxy you need the true goal; to know the true goal you need a
  proxy for it. Recursive Goodhart is this ancient regress in measurement dress;
  the parent's declare-by-stipulation contract is a pragmatist cut through it.

## Track-local open questions

Kept here, not in the parent open-questions file, until the track activates.

- **Q-R1 (the formal heart).** Does per-rung selection-drift control compose up
  the tower? Given the sharp per-rung chi-square bound, is there a composition
  bound for `P -> G -> G' -> ...` that stays finite, and under what condition on
  each `phi`/tilt does it instead blow up? The necessity of the L^2 hypothesis at
  a single rung suggests a sufficient condition (uniform second-moment control
  per rung) and a divergence witness (one heavy-tailed rung). This is the new
  theorem the paper would aim for. Failure condition: if "composition" is only
  well-posed after fixing a rung representation, the result reduces to the
  single-rung bound and there is no genuinely recursive content.
- **Q-R2.** Can congruity (the exchange-rate iff condition) hold *simultaneously*
  across rungs, or does a "harmless" rung at one level force a non-harmless one
  above it? I.e., is there a tower for which moving up any single level conserves
  harm, yet the composed map does not?
- **Q-R3.** Is the regress *terminating in practice* via stipulation? The parent
  stops the regress by declaring a value model. Characterize what is lost by
  stopping at rung `n` vs `n+1` — a "stipulation residual" — and whether it is
  boundable, or whether stopping is purely a normative choice with no error
  control. (This is where the paper either has a theorem or honestly concedes a
  limit.)
- **Q-R4.** Does the representation-dependence of the selection/intervention
  split (imported finding 3) make the *rung boundaries themselves*
  non-identifiable, so that "how many rungs" is, like the dead dimension count, a
  modeling artifact rather than a fact about the world?

## Honest novelty positioning

Following the parent's stance (state elementariness proudly; avoid
motte-and-bailey), the contribution is expected to be: (a) a clean formalization
of recursive Goodhart as nested parent rungs; (b) the observation that the
parent's declare-don't-observe contract *is* the constructive answer to the
regress; (c) the import of the parent's negative results as guardrails on
recursive over-claims. The single candidate for novel mathematics is Q-R1's
composition bound. Everything else is synthesis and should be sold as synthesis.
The revealed-preference and problem-of-the-criterion connections are old; their
value is framing, not priority.

## Activation gate

Parent era 1 ships (book + abstract + core theorem set stable), as for the
divergence-thresholds track. Then a human promotes this spine from `could-do/`
to the `plans/` root and opens `recursive-goodhart/research/threads/` with the
Q-R1 conjecture as the first thread.
