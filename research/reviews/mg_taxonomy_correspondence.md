# Manheim--Garrabrant taxonomy correspondence

Status: durable correspondence audit. Maps the four Manheim--Garrabrant
variants (@manheim2018categorizing, arXiv:1803.04585) onto the book's
selection/intervention channels and theorem set, and -- this is the load-bearing
part -- audits whether the book's formalization *adds information* to each
category or merely *adds noise*.

Iteration type: `application-mapping` plus `claim-license`.

Supersession note: this artifact promotes Manheim--Garrabrant out of the
`genealogy`-only classification used in `formal_analogue_lit_map.md`
("Genealogy boundary" list) and the `research/threads/lit_review/` status
tables. M&G remains theorem-free as a source; what is promoted is the
*correspondence* between its variants and the book's theorems. See "Required
consistency edits" at the end.

## Why this is not four symmetric boxes

The headline finding governs the prose downstream: the four variants do **not**
earn equal treatment. The book's formalization sharpens two of them, modestly
generalizes one, and only draws a boundary clause around the fourth. Writing
them up as four parallel "here is our formalization of X" boxes would itself be
the noise this audit is meant to catch.

The organizing reduction is the book's own seam. M&G classify by *cause*; the
book classifies by *channel*, because the channel is what licenses the math:

- Selection channel (`K_theta = K_0`, policy dependence only through `W_theta`):
  **Regressional** and **Extremal**.
- Intervention channel (`K_theta != K_0` on a positive-`nu` type set):
  **Causal** and **Adversarial**.

So the four-way cause taxonomy reduces to the book's two channels, with the
within-pair distinction a *regime/agency refinement*, not a co-equal top-level
cut. Claim [confident]: the channel assignment above follows directly from the
M&G mechanism definitions (select-on-proxy vs act-on-proxy) and the book's
channel definitions in `core-math.md`. Toy: Regressional needs only
`M = G + noise` with threshold selection (no behavior change at fixed type ->
selection); Causal needs `do(raise proxy)` to fail to move the goal (behavior
change at fixed type -> intervention).

## The audit, per category

### Regressional -> selection channel, finite-`delta` regime (T1/T2)

M&G content: `M = G + error`; selecting high `M` selects high error
("tails come apart"); optimizer's curse; Gaussian shrinkage
`E[G | M=m] = mu_G + rho (sigma_G/sigma_M)(m - mu_M)` with `rho < 1`.
Always present whenever `M != G`.

What the book adds: the distribution-free envelope `|B_{H_i}| <= delta s_i`
(T1) and its value-weighted form (T2), with `delta = sqrt(chi^2(mu_theta||mu_0))`
as a single measured "how hard you selected" scalar, plus the multidimensional
coordinate decomposition that M&G's scalar story does not carry.

Verdict [tentative]: **adds modest real information.** The genuine add is
generality (the envelope holds for dependent, non-Gaussian `(M, G)`, where the
shrinkage formula does not) and the coordinate/value-weighted multidim form.
Toy: take `(G, X)` dependent and `X` finite-but-non-normal; the bivariate-normal
shrinkage formula does not apply, but `|B_G| <= delta s_G` still does.

- Licenses: a coordinate-wise drift envelope under any reweighting with finite
  `chi^2`.
- Does not license: a *sharp* rate. El-Mhamdi & Hoang (arXiv:2410.09638) give
  the tail-conditioned asymptote the envelope only bounds; the book is looser
  there by a known factor.
- Falsifier / noise risk: presenting `delta s` as "the" Goodhart bound without
  the El-Mhamdi sharpness credit would over-claim tightness. The text must pair
  the two.

### Extremal -> selection channel at the boundary where the envelope expires

M&G content: optimization relocates the system to extreme `M` where the
historical `M`--`G` relationship no longer holds. Two sub-mechanisms: *regime
change* (the relationship genuinely changes in the tail) and *model
insufficiency* (the fitted `phi` is a local approximation whose dropped
curvature dominates at the extreme).

What the book has: `delta -> infinity` (mechanically, under extreme selection)
and the residual `epsilon(s) = P(s) - phi(G(s))` growing in the tail. Toy:
top-`alpha` selection gives `delta = sqrt(1/alpha - 1) -> infinity` as
`alpha -> 0`, so the T1/T2 envelope `|B_H| <= delta s` goes vacuous.

Verdict [tentative]: **boundary clause only -- no theorem here.** The book has
no result that bounds extremal harm; `delta -> infinity` marks where the
selection envelope *retires*, which is honest scoping, not a formalization of
the mechanism. Crucially, `delta -> infinity` on a *fixed, well-behaved* joint
does not even produce the dangerous case: under fixed bivariate normal,
`E[G | M=m] = rho m` keeps rising forever -- inefficient, never reversing. The
reversal that makes extremal interesting lives in the *relationship change*
(heavy-tailed `epsilon`, regime break), which the book *imports* from El-Mhamdi
/ Majka tail families rather than proves.

- Licenses: the boundary statement "the selection envelope does not constrain
  this regime; bring tail-structure tools."
- Does not license: any quantitative extremal claim from `delta` alone.
- Falsifier / noise risk: dressing `delta -> infinity` up as an "extremal
  theorem" would be pure noise. The honest contribution is negative. Keep this
  subsection short; do not manufacture symmetry with the other three.

### Causal -> intervention channel, proxy-raising action disconnected from value (T3/T4/T5)

M&G content: a non-causal `M`--`G` correlation, so intervening to raise `M`
fails to raise `G`. M&G formalize with a symmetric Gaussian specification
(each of metric/goal regressed on the other plus a common cause `X`).

What the book adds: an explicit interventional `action -> (proxy weight w,
harm rate h)` map; **causal Goodhart `<=>` `h` not proportional to `w`**; and
the exact cost-minimizing fixed-deficit harm
`H_M(d) = d (sum h_j kappa_j w_j) / (sum kappa_j w_j^2)` (T5).

Verdict [confident]: **strongest add.** The book replaces a non-identifiable
gesture with an identifiable structural condition (`h not parallel w`) and a
closed form. Claim [tentative]: the M&G symmetric Gaussian spec is, as written
with unit cross-slopes, degenerate -- two linear-Gaussian conditionals
`M | G, X` and `G | M, X` cohere into a joint only if the product of cross
regression slopes equals the squared partial correlation `rho^2`; unit slopes
on both sides force `rho^2 = 1` (perfect correlation). Toy: the degeneracy is
the symptom -- causal direction cannot be carried by a symmetric observational
covariance, which is exactly why the book moves the causal content into the
intervention map. T5's `h_j = c w_j` is the benign case; causal Goodhart is its
negation.

- Licenses: an identifiable, interventional characterization of when buying
  score deficit `d` costs hidden harm, plus the exact harm.
- Does not license: causal identification *for free* -- it costs the declared
  contract (`w`, `h`, `kappa`), which M&G's assumption-light story does not
  demand.
- Falsifier / noise risk: implying we identify causal structure without
  declaring the action/cost/harm map. The add is precision *bought with inputs*.

### Adversarial -> intervention channel with declared agent stakes and time (T3/T4/T6)

M&G content: a second agent with divergent goals games the proxy. Stylized
one-shot linear model `M_R = G_R + X`, `M_A = G_A * X` (the additive term is the
regulator's contamination lever; the multiplicative term is the agent's payoff
gated by that lever). Cobra-effect archetype. M&G also discuss *mitigations*
(secrecy, randomizing the metric).

What the book adds: the activation threshold `Delta = sqrt(2 kappa V)` (T3),
convex feasibility `m(d) <= V` for general cost geometry (T4), and -- beyond
M&G -- the *time* dimension: the adaptive-hardening boundary, gaming feasible
at `t` iff `S_t(M) >= T` with `T = d^2/2V`, and finite-time hardening (T6).

Verdict [tentative]: **real add.** The book supplies cost geometry and hardening
dynamics, which is where the operational "can I harden my way out" question
lives, and which the static `G_A * X` model cannot express. Toy: M&G's
`M_A = G_A * X` is the linear, single-channel, no-cost, one-shot corner of T4
(`G_A` is the stakes `V`; the additive `M_R = G_R + X` is `w = 1`).

- Licenses: threshold, feasibility, and deterministic hardening results for the
  declared toy.
- Does not license: a *general* adversarial theory. The non-license clauses of
  T3/T4/T6 bind (no arbitrary cost, no stochastic observation, no shared
  bottlenecks).
- Falsifier / noise risk: two specific over-claims to avoid. (1) Presenting the
  toys as a general adversarial result. (2) Ignoring that M&G's
  randomization/secrecy mitigations are something the book does *not* model
  (T6 assumes deterministic observation) -- a place M&G says more than us.

## Promotion: formal-analogue rows

Per the decision to promote into the formal-analogue treatment, the four
variants get correspondence rows. These are *not* import rows (M&G has no
theorem to import a primitive from); they record what the book's formalization
licenses *for each category* and where it adds nothing.

| M&G variant | Channel | Book results | What the formalization licenses | Adds info vs noise | Falsifier / non-transfer | Confidence |
| --- | --- | --- | --- | --- | --- | --- |
| Regressional | selection, finite `delta` | T1, T2 | distribution-free coordinate drift envelope; `delta` as selection-intensity scalar; multidim form | modest info (generality + multidim); share sharpness credit with El-Mhamdi | dependent/non-Gaussian case where shrinkage formula fails but envelope holds | [tentative] |
| Extremal | selection, `delta -> infinity` | T1/T2 non-license; `epsilon` residual | boundary clause: selection envelope expires; import tail tools | boundary only; manufacturing a "delta theorem" here is noise | fixed-Gaussian joint shows no reversal from `delta` alone | [tentative] |
| Causal | intervention | T3, T4, T5 | identifiable `h not parallel w`; exact fixed-deficit harm | real info (replaces degenerate symmetric SEM) | requires declared `w, h, kappa`; not free identification | [confident] |
| Adversarial | intervention + time | T3, T4, T6 | activation threshold, convex feasibility, deterministic hardening boundary | real info (cost geometry + time) | scoped toy; randomization/secrecy mitigations unmodeled | [tentative] |

## What the downstream book text must not claim (guardrails)

1. Do not present the four as symmetric formalizations. Lead with the 2+2
   channel reduction, then state the asymmetry openly -- the asymmetry *is* the
   contribution claim (the framework discriminating, not decorating).
2. Do not present `delta -> infinity` as an extremal theorem.
3. Do not imply causal identification is free; name the declared-contract cost.
4. Do not imply a general adversarial theory; keep the scoped-toy non-license
   and the unmodeled-mitigation gap visible.
5. Always pair the Regressional envelope with the El-Mhamdi sharpness credit.
6. Keep the existing genealogy humility ("does not replace that genealogy with a
   grander taxonomy", current book Genealogy subsection): the move is reduction
   plus selective sharpening, not a rival four-fold taxonomy.

## Adversarial pass

Target claim: "the four variants reduce 2+2 onto the book's channels, and the
book sharpens only Causal and Adversarial (plus a modest Regressional add)."

1. Counterexample attempt. Does any variant resist the channel assignment?
   Adversarial *misalignment* (an agent manufacturing `P`--`H` correlation) can
   turn a nominal selection setup into an intervention one. This does not break
   the assignment; it is the reason the contract must rule out fixed-type
   response before claiming the selection bound. Recorded, not a refutation.
2. Definitional move. Is "boundary clause only" for Extremal too harsh -- does
   the `epsilon` residual count as a formalization add? `epsilon` is a
   *reframing* with no theorem attached in this project. Calling it an
   information add would inflate. Cleared: verdict stands.
3. Rhetorical convenience. The audit makes the book look strong on Causal and
   honestly weak on Extremal. The Extremal honesty cuts *against* the book, so
   the audit is not uniformly self-serving. Cleared.
4. Red-flag check. The degeneracy claim about M&G's causal SEM depends on
   reading the cross-slopes as exactly unit and on the user's transcription of
   the model; tagged [tentative] for that reason, not [confident].

Verdict: claim survives at the stated mixed confidence. Logged as
`adversarial pass: clear` with the Extremal-honesty and SEM-transcription
caveats recorded.

## Verification stack (layers 1--2)

Layer 1 -- thought experiments:
- Channel skeptic: "Can Regressional be intervention?" Only if behavior changes
  at fixed type; pure threshold selection does not. Passed.
- Extremal optimist: "Does `delta` quantify the dangerous extremal case?" No --
  fixed-Gaussian shows no reversal; the danger is relationship change. Passed,
  and it is why the verdict is boundary-only.

Layer 2 -- real-world correspondence:
- Cobra effect instantiates the Adversarial row: bounty made turned-in cobras
  the proxy; breeding (`X`) raised the proxy while worsening the goal; payoff
  `G_A * X`. Intervention channel, `h` opposite in sign to `w`. Passed.
- Does the El-Mhamdi sharpness credit match how El-Mhamdi positions itself?
  Yes; the book bounds as an envelope what El-Mhamdi computes sharply under
  named tails. Passed (carried from `formal_analogue_lit_map.md`).

Verdict: layers 1--2 pass. Layer 3 (simulation) not required for a
correspondence audit; descend only if a specific multidim instantiation is
promoted into the book.

## Required consistency edits (follow-ups, not yet applied)

Promotion makes these files inconsistent until updated:

1. `research/reviews/formal_analogue_lit_map.md` -- "Genealogy boundary" list
   currently states M&G "does not get a row". Replace with a pointer to this
   artifact's correspondence rows (M&G stays theorem-free as a *source*; the
   *correspondence* is promoted).
2. `research/threads/lit_review/README.md` and
   `research/threads/lit_review/verification_notes.md` -- rows tagging M&G as
   `genealogy` only should cross-reference this artifact.
3. Book: distill a subsection from this note into the Prior Work part, adjacent
   to `== Genealogy`, following the guardrails above (next agreed step).
