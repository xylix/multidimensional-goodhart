# Figure Audit

This reset applies a high inclusion bar: a visual survives only if it reveals a
quantitative or structural comparison more clearly than prose, equations, or a
table. The paper uses at most the selection/intervention and welfare-object
figures. The book appendix keeps four support figures.

| Prior figure | Claim served | Source | Verdict | Action |
| --- | --- | --- | --- | --- |
| `appendix-c-selection-thresholds.pdf` | Threshold response can differ from covariance. | Synthetic baseline distributions matching Chapter 3 toy cases. | Keep, redesign. | Rebuilt as `appendix-a-threshold-response.pdf` with direct labels, no boxed annotations, and minimal reference lines. |
| `appendix-c-dimensional-scaling.pdf` | Dimensional drift needs coupling growth. | Analytic curves only. | Drop as image. | The claim remains in prose/equations; the old plot added little beyond the formula. |
| `appendix-d-selection-vs-intervention.pdf` | Selection reweights fixed support; intervention transports state. | Chapter 3/4 mechanism distinction. | Keep, redesign. | Rebuilt as `appendix-b-selection-vs-intervention.pdf` with marker area for weight and arrows for transport. |
| `appendix-e-additive-substitution.pdf` | Additive channels lower cost by substitution. | Quadratic water-filling model. | Merge. | Replaced by the welfare-object comparison, which shows the more important `H_per`/`H_pop` distinction. |
| `appendix-e-additive-vs-conjunctive.pdf` | Aggregation rule controls sign. | Additive and conjunctive toy models. | Drop as image. | The contrast remains in text; the binary region plot was mostly schematic. |
| `appendix-f-exchange-rate-condition.pdf` | Conservation requires matching score/harm exchange rates. | Proposition 4 toy numbers. | Reclassify as table/prose. | The visual was a table and no longer counts as a figure. |
| `appendix-g-recursive-goodhart-cartoon.pdf` | Recursive Goodhart as a speculative hypothesis. | Synthetic radar values. | Drop. | Removed because it is illustrative speculation without empirical or pre-specified data. |
| `appendix-h-response-geometry.pdf` | Response shape depends on cost/constraints. | Chapter 5 quadratic, linear, and capped models. | Keep, redesign/merge. | Rebuilt as `appendix-d-response-geometry.pdf`, including the active-set path. |
| `appendix-h-fixed-charge-caps.pdf` | Fixed charges plus caps produce active-set switches. | Iteration 21 active-set solver. | Merge. | Folded into the response-geometry figure as the quantitative regime-switch panel. |

The two Typst objects formerly labelled `fig:claim-audit` and
`fig:response-shape-taxonomy` are tables, not visual figures. They remain
numbered as tables because they summarize licensing boundaries rather than
encode data.
