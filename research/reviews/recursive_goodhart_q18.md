# Review iteration: recursive Goodhart and Q18 claim license

Status after consolidation: durable but speculative boundary review. Use it to
block generic recursive/minimum-complexity claims and to require predeclared
response geometry, shape or complexity measure, and failure condition. Current
live questions remain in `research/open_questions.md`.

Iteration type: `review`

## Review target

Target texts:

- `book/multidimensional-goodhart.typ`, especially the introduction, claim-audit table, Chapter 3 close, and Appendix G.
- `draft.md`, especially "Recursive Goodhart" and "Current summary".
- `research/threads/minimum_complexity_attractor.md`.
- `research/verification_stack.md` and `research/red_flags.md`.

Core concern: after Iteration 7, the project should not silently replace the sharper Q18 idea with a safer but less informative slogan. "Response-geometry attractor" is useful as a top-level correction, but it should preserve more specific subclaims: quadratic geometries predict dense cost-minimal drift, fixed-charge/linear geometries predict sparse drift, low-rank action maps predict spectrally concentrated drift, and search priors may predict low-description-length failures. The review should license those sharper conditional claims while blocking the generic "minimum complexity" theorem.

## Claim 1: recursive proxy repair pushes residual error into less legible dimensions

- Claim I might use: Repeated proxy refinement often leaves the remaining residual in dimensions that are less legible, less represented in training/evaluation, or cheaper to exploit.
- What the text actually shows: The formal chapters show response-channel mechanisms that could make this happen: selection follows baseline hidden-response curves; intervention follows cost geometry, stakes, aggregation, and exchange rates. Appendix G states the recursive claim as an empirical hypothesis and gives falsifiers.
- Evidence type: Mechanism map plus toy models; not a theorem or empirical result.
- Main inferential gap: No dynamic regulator-learning model yet shows that successive patches systematically move residuals toward lower-legibility or cheaper-exploit dimensions.
- Stronger claim not supported: Proxy repair generically makes hidden residuals less legible.
- Top 3 alternative explanations or model-breakers:
  1. Proxy repair may choose higher-quality metrics whose cheapest inflation is also goal-improving.
  2. Hidden dimensions may improve with monitored axes because they are positively coupled.
  3. Different layers may have independent blind spots, allowing institutional correction rather than recursive concealment.
- Measurement concern: Legibility and hidden residual dimensions must be pre-specified; otherwise the researcher can discover "less legible" failures after the fact.
- Generalization boundary: The claim is safest for adaptive/intervention settings with measured agent response and known cheap manipulation routes; it is weaker in pure selection settings.
- Action: keep as conjecture. The PDF wording is mostly licensed because it repeatedly says "hypothesis", "conjecture", and "not a theorem." The draft should avoid presenting "complexity increase" as the current summary without adding "pre-specified hidden dimensions / cost or legibility mechanism."

## Claim 2: residual error becomes more complex over time

- Claim I might use: Patching a proxy reduces visible error while increasing informational complexity of the remaining error.
- What the text actually shows: Iteration 7 shows that "complexity" is not one object. Selection can produce diffuse hidden drift; quadratic intervention can produce dense cost-minimal drift; fixed-charge or linear costs can produce sparse drift; a symmetric dense vector can be high support but low description length.
- Evidence type: Negative conceptual result plus toy optimization examples.
- Main inferential gap: No invariant complexity functional has been chosen, and no result links the framework's response mechanisms to increasing entropy, description length, rank, or support size in general.
- Stronger claim not supported: Goodhart pressure monotonically increases residual complexity.
- Top 3 alternative explanations or model-breakers:
  1. A sparse exploit can reduce support-size complexity while worsening hidden harm.
  2. A smooth convex cost can spread error diffusely without making it high-description-length.
  3. Better measurement can genuinely reduce both visible and hidden residuals.
- Measurement concern: Complexity must be fixed before observing the residual. Candidate measures answer different questions: support size, spectral rank, KL from max entropy, and description length do not agree.
- Generalization boundary: "Complexity increase" is currently a research question (Q4/Q18), not a result.
- Action: narrow. Prefer "patching can move residuals into harder-to-elicit or cheaper-to-exploit directions" over "patching increases complexity." If the word "complexity" remains, pair it with an explicit measure.

## Claim 3: minimum-complexity attractors explain Goodhart drift

- Claim I might use: Under proxy pressure, drift converges to the lowest-complexity feasible hidden configuration.
- What the text actually shows: Iteration 7 kills the unconditional version. In selection channels, there is no choice over hidden drift; drift follows `B_H(theta)`. In quadratic intervention, the KKT solution is `a^* = d C w/(w^T C w)`, which is cost-minimal and may be dense. Sparse attractors appear in fixed-charge/linear-cost models.
- Evidence type: Counterexample plus conditional toy theorem.
- Main inferential gap: Complexity is not selected unless the response process is biased toward the chosen complexity functional.
- Stronger claim not supported: Minimum-complexity attraction is a general Goodhart mechanism.
- Top 3 alternative explanations or model-breakers:
  1. The optimizer minimizes private cost, not description length.
  2. Search may be biased by parameterization rather than by social or semantic simplicity.
  3. Representation changes can alter support-size or description-length judgments.
- Measurement concern: Need a pre-specified complexity functional and a response mechanism that plausibly optimizes or samples according to it.
- Generalization boundary: Safe only for named geometries: sparse/fixed activation, low-rank action maps, search-prior bias, or candidate distributions with simplicity-biased tails.
- Action: narrow, but preserve information. Do not replace the claim only with "response-geometry attractor"; state which geometry predicts which shape:
  - quadratic cost -> dense cost-minimal drift along `C w`;
  - fixed-charge/linear cost -> sparse one-channel drift absent caps;
  - low-rank action map -> spectrally concentrated drift;
  - simplicity-biased search prior -> low-description-length drift.

## Claim 4: Appendix G is only a speculative cartoon

- Claim I might use: Appendix G is explicitly non-foundational and should not be read as an additional theorem.
- What the text actually shows: Appendix G says it is not a theorem, uses synthetic movements, says the framework alone does not determine hidden correlations, and lists observations that would support or weaken the hypothesis.
- Evidence type: Scope/prose audit.
- Main inferential gap: None for the modest claim that the appendix is framed as speculative.
- Stronger claim not supported: Appendix G has already operationalized the recursive hypothesis enough for empirical testing in a domain.
- Top 3 alternative explanations or model-breakers:
  1. Readers may still over-weight the cartoon visually.
  2. "Less legible" is not operationally defined in the figure.
  3. The figure can imply monotone worsening even though the caption says hidden quality can improve.
- Measurement concern: Any future empirical version needs pre-specified hidden axes and legibility/cost measures.
- Generalization boundary: Works as orientation, not evidence.
- Action: keep. If editing the PDF later, consider a short sentence linking Appendix G to Iteration 7's sharper conditional forms: sparse, low-rank, or search-prior attractors depending on response geometry.

## Claim 5: the current formal chapters support the recursive story

- Claim I might use: Chapters 1-3 make recursive Goodhart plausible.
- What the text actually shows: They support pieces: selection response, intervention-vs-selection boundary, no baseline bound for intervention, gaming capacity, aggregation rules, exchange-rate conditions. They do not model repeated proxy repair.
- Evidence type: Mechanistic partial support.
- Main inferential gap: No recursive dynamics, no regulator learning, no time-indexed proxy update rule, no theorem that residuals migrate in a consistent direction.
- Stronger claim not supported: Chapters 1-3 prove or derive recursive Goodhart.
- Top 3 alternative explanations or model-breakers:
  1. Regulator learning could identify and harden cheap channels faster than agents reroute.
  2. Adding dimensions can steer effort into high-`gamma` channels where "gaming" partly improves the true goal.
  3. A non-compensatory aggregation rule may reduce attacker substitution, though at other costs.
- Measurement concern: Need repeated interventions and hidden outcomes measured before/after each patch.
- Generalization boundary: The chapters are strongest for static response channels and one-shot gaming models.
- Action: keep "suggested by the framework"; do not say "shown by the framework."

## Licensed edits for future paper pass

- Keep: "The recursive hypothesis is that patched proxies often leave residual error in dimensions that are less legible, less represented, or cheaper to exploit."
- Prefer: "Q18 becomes a family of response-shape predictions once a response geometry and complexity measure are fixed."
- Avoid: "Goodhart drift is biased toward minimum complexity" without naming the bias mechanism.
- Add when useful: "The informative object is not merely that there is a response-geometry attractor, but what shape the geometry predicts: dense under quadratic costs, sparse under fixed activation costs, low-rank under low-rank affordances, low-description-length under a simplicity-biased search prior."

## Verdict

The PDF is already broadly licensed: it marks recursive Goodhart as speculative and Appendix G as a cartoon. The weaker draft slogan "as you try to control for Goodhart, it becomes more complex" should be treated as historical/unsafe shorthand unless it is paired with a complexity measure. Iteration 7 should not erase Q18's information value by replacing it with the generic phrase "response-geometry attractor"; instead, future work should ask which response geometry predicts which residual shape, and then test that shape against pre-specified hidden axes.
