# Review iteration: response-shape predictions

Status after consolidation: durable technical boundary review. Use it for
geometry-to-shape license boundaries, not as evidence for a generic
minimum-complexity or recursive-attractor theorem.

Iteration type: `review`

## Review target

Target texts:

- `research/reviews/recursive_goodhart_q18.md`, especially the geometry-to-shape repair.
- `research/claim_audits.md`.
- `research/threads/minimum_complexity_attractor.md`.
- `research/red_flags.md` and `research/negative_results.md`.

Core concern: Iteration 8 usefully preserved information by replacing the generic "response-geometry attractor" slogan with sharper geometry-to-shape predictions. This review checks whether those sharper predictions are themselves overbroad. The aim is not to retreat to the empty claim that "geometry matters", but to state exactly when each shape prediction is licensed.

## Claim 1: quadratic costs predict dense cost-minimal drift along `C w`

- Claim I might use: With quadratic cost `c(a) = (1/2) a^T C^{-1} a` and target `w . a >= d`, the response is dense and points along `C w`.
- What the text actually shows: In the unconstrained positive-definite model, the KKT solution is `a^* = d C w/(w^T C w)`. This is dense exactly when `C w` is dense. It is cost-minimal, not support-minimal.
- Evidence type: Direct convex optimization calculation.
- Main inferential gap: "Dense" is not implied by quadratic cost alone. It depends on the representation, the support of `w`, and the covariance/cost matrix `C`.
- Counterexamples and model-breakers:
  1. If `C` is diagonal and `w` is sparse, then `C w` is sparse.
  2. If `C` is rank-deficient or nearly rank-deficient, drift may be confined to a low-dimensional or unstable subspace.
  3. If feasibility constraints such as `a >= 0`, caps, or sign restrictions bind, the active-face solution is not simply the full unconstrained `C w` direction. For nonnegative actions, `C w >= 0` is a sufficient interior condition; `C = diag(1, 1), w = (1, -1)` fails it.
- Representation concern: Density is coordinate-dependent. The same vector may be dense in observable channel coordinates and sparse in a rotated eigenbasis.
- Generalization boundary: The licensed prediction is: unconstrained/interior quadratic costs produce the minimum-cost direction proportional to `C w`; this direction is dense only when `C w` is dense in the pre-specified action basis and no additional constraints bind. Otherwise solve the active feasible face.
- Action: narrow the table entry from "quadratic costs predict dense drift" to "quadratic costs predict cost-minimal drift along `C w` in the unconstrained/interior case; otherwise active-face response."

## Claim 2: fixed activation or linear costs predict sparse one-channel drift

- Claim I might use: Fixed-charge or linear-cost response geometries produce a sparse attractor: all drift goes through the cheapest channel.
- What the text actually shows: With nonnegative actions, score weights `w_j > 0`, fixed activation costs `F_j`, linear marginal costs `q_j a_j`, a one-shot target, no caps, and a unique cheapest effective route, the optimum uses one channel minimizing `F_j + q_j d/w_j`.
- Evidence type: Elementary linear optimization / fixed-charge toy calculation.
- Main inferential gap: One-channel sparsity is not robust to ordinary constraints or risk terms.
- Counterexamples and model-breakers:
  1. Caps force the response to use multiple channels once the cheapest route saturates.
  2. Ties or near-ties in effective cost support multiple optima or mixed practical responses.
  3. Convex marginal costs after activation restore spreading across active channels.
  4. Detection penalties, variance penalties, or risk diversification can make splitting cheaper in expected utility.
- Representation concern: "One channel" means one pre-specified action channel, not necessarily one semantic failure mode; a channel may bundle many hidden effects.
- Generalization boundary: The licensed prediction is one-channel sparsity only in the uncapped, no-tie, linear marginal model with no diversification/detection term. Fixed charges still predict lumpy or low-support response more generally, but not necessarily support size one.
- Action: narrow from "sparse one-channel drift absent caps" to "one-channel only in the uncapped, no-tie, linear marginal model; otherwise predict low-support/lumpy drift relative to the active constraints."

## Claim 3: low-rank action maps predict spectrally concentrated drift

- Claim I might use: Low-rank affordances make hidden drift low-rank or spectrally concentrated.
- What the text actually shows: If actions `a` affect hidden outcomes through a map `L`, then realized hidden drift lies in `im(L)`. If `L` has low rank in the chosen hidden-outcome representation, the set of possible drifts is low-dimensional.
- Evidence type: Linear algebra, not a new Goodhart theorem.
- Main inferential gap: Low-rank action maps restrict the image of possible drift; they do not by themselves imply spectral concentration under every hidden value basis, nor do they rank individual realized vectors in a basis-invariant way.
- Counterexamples and model-breakers:
  1. A low-dimensional subspace can be dense across many measured hidden coordinates.
  2. A change of hidden basis can concentrate or diffuse the coordinate representation of the same subspace.
  3. If the value metric weights directions anisotropically, low-dimensional drift may still be high-harm or look broad in value coordinates.
- Representation concern: Spectral concentration requires a specified hidden-outcome matrix/tensor or covariance/value basis. For a single drift vector, "rank" is not the right object unless the vector is reshaped by a pre-specified representation.
- Generalization boundary: The licensed prediction is image restriction: drift lies in a low-dimensional affordance subspace. Calling it spectrally concentrated is licensed only after specifying the representation and value basis in which the low-rank structure is meaningful.
- Action: narrow from "low-rank action maps predict spectrally concentrated drift" to "low-rank action maps restrict drift to a low-dimensional image; spectral concentration is representation- and value-basis-dependent."

## Claim 4: simplicity-biased search priors predict low-description-length drift

- Claim I might use: Search processes with simplicity bias favor low-description-length hidden failures.
- What the text actually shows: Iteration 7 allowed search priors as an upstream mechanism: if a search process samples or reaches low-description-length functions more easily, then proxy optimization may find such failures first.
- Evidence type: Mechanism schema, not a theorem in the current notes.
- Main inferential gap: "Low description length" is easy to define after observing the failure. The claim is only predictive if the description language, prior, or parameter-function map is fixed before the outcome.
- Counterexamples and model-breakers:
  1. A failure can be simple in the researcher's narrative but high-complexity under the model's actual search prior.
  2. A parameterization can make semantically complex behavior easy to find.
  3. Different description languages reverse which of two failures is simpler.
- Representation concern: Description length is not representation-free. The relevant code length must be tied to the search process, generator, or agent model, not to an ex post human gloss.
- Generalization boundary: The licensed prediction is: if a pre-specified search prior or parameter-function map assigns higher probability/accessibility to low-description-length failures, then found failures should be biased toward low description length under that same coding scheme.
- Action: require pre-registration of the coding/search prior before using "simplicity-biased" as a prediction rather than a post-hoc label.

## Reader-facing Goodhart claim versus mathematical shape claim

The mathematical shape claims are conditional:

- quadratic costs give a cost-minimal `C w` direction under the unconstrained/interior convex model, with active-face repair under sign or cap constraints;
- linear/fixed-charge costs give low-support or one-channel responses only under the stated lumpy/uncapped model;
- low-rank affordances restrict drift to `im(L)`;
- simplicity-biased search predicts low code length only relative to a pre-specified prior or parameterization.

The reader-facing Goodhart claim is weaker and should stay separate: proxy pressure does not determine hidden drift by itself; the response process and its constraints determine which hidden residuals are reached. The informative version names the response geometry and the predicted shape, with the above caveats. The overclaim would be to let the reader infer a generic law: dense under any quadratic-looking cost, sparse under any fixed cost, low-rank under any affordance bottleneck, or simple under any search process.

## Verdict

Iteration 8's repair survives, but every table row needs a guardrail. The project should preserve the geometry-to-shape table because it is much more useful than the umbrella slogan "response geometry matters." The table should be read as a menu of conditional predictions with explicit model clauses, not as a representation-invariant theorem about Goodhart drift.
