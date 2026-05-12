# Claim audits

## Recursive Goodhart / Q18 audit (Iteration 8)

| Claim one might use | What is licensed | What is not licensed | Intended use |
| --- | --- | --- | --- |
| Repeated proxy repair can move residual error into less legible dimensions. | Mechanism-level plausibility: selection follows baseline response; intervention follows cost/search geometry; cheap or underrepresented channels can remain after visible fixes. | A theorem that residuals generically become less legible under proxy repair. | Frame Appendix G and motivate dynamic models or empirical tests. |
| Residual error becomes more complex over time. | Only as a question after choosing a complexity measure. Iteration 7 separates support, rank, description length, KL, entropy, and cost. | A monotone law of increasing residual complexity. | Replace with sharper claims about pre-specified residual shape. |
| Minimum-complexity attractors explain Goodhart drift. | Conditional versions: fixed activation/linear costs can produce sparse attractors; low-rank affordances can produce concentrated drift; search priors can favor low-description-length failures. | A generic minimum-complexity theorem. Quadratic cost can produce dense cost-minimal drift. | Generate testable response-shape predictions. |
| Response-geometry attractor is the repaired Q18 concept. | Top-level safety correction: the response process selects according to cost/search/baseline geometry. | By itself, it is too broad to be informative. It must be paired with a predicted shape: dense, sparse, low-rank, low-description-length, etc. | Organize Q18 subcases without overclaiming. |
| Appendix G is speculative. | The PDF explicitly says it is not a theorem and gives support/failure conditions. | That the recursive hypothesis has been operationalized enough for a domain test. | Keep as orientation; do not promote without review/edit iteration. |

## Response-shape prediction audit (Iteration 9)

| Shape prediction | What is licensed | What is not licensed | Intended use |
| --- | --- | --- | --- |
| Quadratic costs predict dense drift. | In the unconstrained positive-definite model, the cost-minimal action is `a^* = d C w/(w^T C w)`. It is dense when `C w` is dense in the pre-specified action basis and no extra feasibility constraints bind. | Density from quadratic cost alone. Diagonal `C` with sparse `w`, rank-deficient `C`, nonnegativity, caps, or active faces can make the realized drift sparse or constrained. | Say "cost-minimal drift along `C w`; often dense under dense coupling," not simply "dense." |
| Fixed activation / linear costs predict one-channel drift. | In the uncapped, no-tie, linear marginal model, the optimum uses the cheapest effective channel. More generally, fixed charges license lumpy or low-support responses. | One-channel sparsity under caps, ties, convex post-activation costs, detection penalties, or risk diversification. | Use as a toy sparse-attractor theorem only with the model clauses attached. |
| Low-rank action maps predict spectrally concentrated drift. | A low-rank map `L` restricts hidden drift to `im(L)`. Spectral concentration is licensed after specifying the hidden representation and value basis. | A basis-invariant claim that low-rank affordances make every realized hidden drift low-rank or visibly concentrated. | State as an affordance-subspace prediction; add representation caveat when discussing rank/spectrum. |
| Simplicity-biased search predicts low-description-length drift. | Predictive only when the search prior, description language, or parameter-function map is specified before observing the failure. | Post-hoc labeling of an observed failure as "simple." Simplicity independent of the actual generator/search process. | Require pre-specified coding/search prior before using low-description-length as evidence. |
