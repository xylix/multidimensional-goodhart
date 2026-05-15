# Visualization ideas

## Purpose

This is a parked plan, not an active workstream. It lists candidate figures
for the core multidimensional Goodhart claims and ranks them by how
load-bearing the underlying proposition is.

A figure earns inclusion in book or paper prose only if it makes a
proposition, contract field, or distinction *more constrained*, not just
prettier. The same discipline that applies to applications (must change an
audit/design/evidence decision) applies here: a figure should change what
a reader expects to see, or expose where the prose currently hides ambiguity.

The default home for any new figure is `research/simulations/` as a Layer-3
toy diagnostic. Promotion to `book/multidimensional-goodhart.typ` or the
paper extract requires a normal promotion-review iteration; no figure goes
straight into prose from this list.

## Out of scope

- Empirical visualizations of real hospital, scientific, or ML data. The
  applications are contracts, not datasets; figures must respect that.
- Pure aesthetic redesigns of existing Iteration 21 plots without a claim to
  sharpen.
- Diagrams whose only content is "Goodhart is bad" or "metrics distort." The
  responsible-metrics literature already supplies the broad warning; this
  project's contribution is the narrower geometry.

## Candidate figures, ranked

Each candidate names the proposition or claim it visualizes, what it would
license, and what it would not license. Ranking is by load-bearing-ness of
the underlying claim, not visual impact.

### 1. Drift envelope ellipsoid plus Boltzmann trajectory

**Visualizes:** Proposition 1' (value-weighted selection drift bound) and the
finite-mgf domain `B = { beta : E_mu[exp(beta P)] < infinity }`.

**Content:** In a 2D hidden space, draw the ellipse
`{ x : x^T Sigma_H^{-1} x = delta^2 }` as the chi-square envelope for a
given budget `delta^2 = chi^2(mu_theta || mu_0)`. Overlay the trajectory
`B_H(beta) = E_beta[H] - E_{mu_0}[H]` as `beta` walks the interior of `B`,
for two or three different `(P, H)` joint distributions with the same
`Sigma_H`. Mark the boundary of `B` where the trajectory must terminate or
require a quantile model.

**Licenses:** A reader-facing picture of "the envelope is a *shape* in
hidden space, not a number," and that two policies with the same chi-square
budget can land in different parts of the envelope.

**Does not license:** Heavy-tail visualizations beyond `B`; coordinate-free
selection bounds without a declared value metric; any empirical claim about
RLHF, MMLU, or institutional scorecards.

**Falsifier or non-transfer condition:** If the trajectory escapes the
ellipse, either `Sigma_H` was misdeclared, the value metric was changed
mid-figure, or the trajectory left `B` and the bound was applied outside
its domain.

### 2. Action-space cost ellipse versus score half-plane

**Visualizes:** Proposition 3 (convex score-deficit budget) and Proposition 4
(additive exchange-rate condition); also the conjunctive contrast.

**Content:** For `k = 2` channels, draw the affordable set
`{ a : a^T C^{-1} a / 2 <= V }` as an ellipse and the score constraint
`w . a >= d` as a half-plane. Mark the cost-minimal action at the tangent.
Show panels for varying `kappa_j`, varying `w_j`, and the active-face
correction when `C w` has a negative component (the `C = diag(1,1)`,
`w = (1, -1)` case from `formalization.md`). A second figure tiles the
conjunctive box `{ a_j >= t }` for comparison, with `H_per^conj = t |M|`
labelled on the corner.

**Licenses:** A reader-facing picture of water-filling versus
conjunctive concentration, and the role of `C w >= 0` as an interior
condition rather than a universal formula.

**Does not license:** Welfare claims; convex affordability is not a hidden
harm bound without declared `h` (the `w = (1,1)`, `h = (M, 0)` counterexample
must be cited if the figure is promoted).

**Falsifier or non-transfer condition:** If the figure is drawn under
nonconvex or fixed-charge costs, the tangent picture is wrong and the
Iteration 10 capped fixed-charge analysis applies instead.

### 3. Population gaming band

**Visualizes:** Iteration 17 and Iteration 21 `H_per` versus `H_pop`
distinction; Iteration 5 / Iteration 6 conservation-versus-backfire repair.

**Content:** Plot a CDF of quality `Q` and shade the band
`{ Q : 0 < t - Q <= sqrt(2 K_M V) }`. A slider over `|M|` widens the band
under additive aggregation and shrinks it under conjunctive aggregation.
Annotate `H_per` (height inside the band) separately from `H_pop` (integral
of the band weighted by `F_Q`).

**Licenses:** A reader-facing picture of why "more measured dimensions" can
be conservation, backfire, or shrinkage depending on aggregation, with no
sign attached to dimension count alone.

**Does not license:** Empirical population harm estimates; the figure is
keyed to a quality CDF chosen for illustration, not measured.

**Falsifier or non-transfer condition:** If `h_j / w_j` is not constant
across measured channels, the band is the right object but the per-agent
height must use the Iteration 6 weighted formula, not `H_per = d`.

### 4. Dimension-gap and observation-gap cartoon

**Visualizes:** The opening formalization split: `ker phi` (invisible goal
directions) and `epsilon` (residual proxy variation).

**Content:** A single composite figure. Goal space `R^m` decomposes into
`ker phi` and a complement; arrows show `phi` mapping the complement into
`im phi` inside proxy space `R^k`, with a noise blob `epsilon` outside
`im phi`. Annotate with toy labels from the formalization (uptime versus
delight; citations versus conceptual fertility).

**Licenses:** The bedrock framing for Chapter 1 or the intro: "multidimensional"
means at least two failure planes, not just bigger numbers.

**Does not license:** Any quantitative claim. This is a cartoon; it should
be labelled as such if promoted.

**Falsifier or non-transfer condition:** If the application's "true" goal is
actually scalar, `ker phi` may be an artifact of redundant coordinates
(formalization counterexample). The figure must state that goal coordinates
are substantive, not arbitrary.

### 5. Frontier-primitive small multiple across applications

**Visualizes:** The response-modeling contract's `(kappa, h, gamma, w)`
per-channel primitives, across the hospital, scientific-metrics, and MMLU
applications.

**Content:** For each application, a small group of bars or a radar per
channel, sorted or colored by `kappa_j w_j` (the audit-priority quantity from
`research/applications/hospital_scorecard.md` §12). Lay the three
applications side by side with consistent axes.

**Licenses:** A visual handle on the Iteration 32 question: do the
applications share contract structure, or only share labels? The figure
supports the side-by-side review; it does not pre-decide its verdict.

**Does not license:** Cross-domain numerical comparisons; the values are
qualitative declarations, not measurements. If the figure is built it must
mark cells as qualitative with explicit `low / med / high` bands.

**Falsifier or non-transfer condition:** If the same channel needs
incompatible qualitative scales across applications (e.g. `kappa` for coding
versus `kappa` for citation manipulation are not on a shared ordinal), the
figure exposes a template-reuse failure rather than supporting reuse.

### 6. Selection versus intervention dot animation

**Visualizes:** The Iteration 11 response-kernel boundary and the Iteration 12
representation-relative caveat: identical marginals can come from `W_theta`
reshuffling or `K_theta` displacement.

**Content:** Two panels start from the same `mu_0` shown as a scatter of
dots. The left panel produces `mu_theta` by changing only `W_theta` (dots
keep position, size changes). The right panel produces the same `mu_theta`
by changing only `K_theta` (dots slide along an action vector). End frames
are visually identical; middle frames are not.

**Licenses:** A reader-facing demonstration that marginal `mu_theta` cannot
identify the selection / intervention boundary without repeated-type or
action-trace evidence.

**Does not license:** A claim that any specific real policy is selection or
intervention; the figure is a possibility proof, not a discriminator.

**Falsifier or non-transfer condition:** If the chosen type space `U` is
allowed to include the full future response plan, the right panel
trivializes into the left panel; the figure must declare the type/action
split it uses.

## Recommended ordering if any are built

1. **Figure 4** (dimension-gap cartoon) first. Lowest implementation cost,
   highest pedagogical leverage, and currently carried entirely in prose.
2. **Figure 1** (drift envelope). Tied to the most load-bearing proposition.
   Can extend `research/simulations/iteration20_selection_intervention.py`
   with a plotting branch.
3. **Figure 2** (action-space cost ellipse). Natural pair with Figure 1 for
   the selection-versus-intervention chapter handoff. Can extend Iteration 21
   or Iteration 27 scripts.
4. **Figure 3** (population gaming band). Sharpens an already-repaired claim
   that prose keeps re-explaining.
5. **Figure 5** (frontier primitives) only if Iteration 32 review decides
   the template is reusable. The figure is a side-by-side comparison object;
   if the review verdict is "needs narrowing into separate templates," a
   single small-multiple is misleading.
6. **Figure 6** (selection / intervention animation) only as supplementary
   web material if the book or paper ever moves beyond static PDF.

## Anti-promotion guardrails

- No figure should appear in `book/multidimensional-goodhart.typ` or
  `book/multidimensional-goodhart-paper.typ` without a promotion-review
  iteration that names the proposition it illustrates and the
  license / non-license boundary it preserves.
- No figure should be drawn over real hospital, scientific, or ML data
  unless a corresponding application has declared the data source, evidence
  standard, and identifiability story. Toy data is fine; misleading
  empirical-looking figures are not.
- Figures that classify after the fact (e.g. labeling an existing case as
  "harmful Goodhart" without the discriminator evidence) are explicitly
  excluded; the response-modeling contract requires the discriminator to be
  declared before the label is assigned.

## What this plan does not do

This plan does not commit any iteration. It does not pre-decide format
(SVG, matplotlib, typst-native, animation). It does not authorize edits to
the book or paper. It is a candidate list ranked by claim-load-bearing-ness,
so a future iteration can pick one figure at a time and run it through the
normal generate / review / promotion-review cycle.
