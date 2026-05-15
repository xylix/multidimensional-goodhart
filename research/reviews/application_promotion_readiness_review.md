# Application promotion-readiness review

Status after consolidation: historical promotion gate for Iteration 34. Use it
to understand why application discipline was promotable and why theorem,
empirical, policy, and broad adaptive-hardening claims were excluded. Do not
use it as the latest book/paper integration authority; later gates are
`integration_readiness_review.md`, the Iteration 42 license map, and
`scoped_manuscript_review_iteration43.md`.

Iteration type: `promotion-review`

## Question

Which reviewed findings from Iterations 27-32 may Iteration 34 promote into
book prose, which may appear only as footnoted or clearly labeled toy evidence,
and which must remain out of the book edit?

High-level verdict: promote the response-modeling application discipline and
the narrowed application-template boundary. Footnote the quadratic diagnostic
and the Iteration 27 adaptive-hardening / measurement-frontier toy only as
conditional finite-channel toy evidence. Exclude theorem expansion, policy
optimality, empirical welfare or research-value estimation, endogenous-stakes
claims, route-cycling claims, and generic anti-metric advice.

## Promotion map

| candidate claim/example/calculation | source iteration(s) | decision (`include`, `footnote`, `exclude`) | license boundary | target book treatment | non-license |
| --- | --- | --- | --- | --- | --- |
| A real Goodhart application should be written as a response-modeling contract: type space `U`, `W_theta` versus `K_theta`, action/cost/search geometry, proxy/target relation, aggregation rule, hidden harm/value model, and evidence standard. | Iterations 14, 23, 29-32 | include | review conclusion from repeated Layer-2 application mappings. | Add a compact application-discipline paragraph in Chapter 6 near `Response modeling: what a Goodhart claim must declare`. | Not a theorem that these primitives are identified from outcome data. |
| The reusable application template survives only with narrowing: predeclare `U` and the type/action boundary, identify `W_theta`, `K_theta`, or both, declare proxy, hidden target, aggregation, hidden harm/value, discriminator observations, and failure conditions before interpreting score movement. | Iterations 30, 32 | include | review conclusion. | Present as the book-facing boundary on application reuse, not as a new formal result. | No universal plug-and-play empirical template; no post-hoc primitive assignment. |
| Applications must change an audit, design, or evidence decision rather than merely classify a case as Goodhart. | Iterations 29-32 | include | review conclusion and application mapping. | State as an application-discipline test. | No generic anti-metric slogan and no claim that classification alone is useful. |
| Hospital readmission scorecards illustrate the contract: score improvement is not patient-welfare improvement until composition, repeated fixed-hospital action traces, hidden patient outcomes, and effective aggregation are audited. | Iterations 29-30, 32 | include | application mapping. | Use as a short institutional-scorecard example or worked-contract trace. | No claim that readmission metrics are harmful, welfare-improving, or policy-optimal. |
| Scientific metrics illustrate the contract: separate applicant/field/institution selection, fixed-researcher response, proxy artifact repair, harmful proxy manufacture, and genuine research-quality improvement before increasing leverage on fast scalar metrics. | Iterations 31-32 | include | application mapping with novelty boundary. | Use as a compact second example showing the narrowed template under weaker hidden-value observability. | No novelty for the broad claim that publication counts, citations, grants, impact factors, or rankings distort science; no research-value estimate. |
| The frontier primitives `kappa`, `h`, `gamma`, `w`, and `V` can be meaningful application audit primitives when predeclared, bounded, defended, or marked unavailable. | Iterations 27-32 | include | review conclusion connecting toy and application contracts. | Mention as optional declared audit primitives, with unavailability explicitly allowed. | No empirical estimability guarantee, common welfare/research-value scale, or outcome-only identification. |
| The quadratic score-deficit diagnostic `m(d) = d^2 / (2 sum_j kappa_j w_j^2)` and `a_j^*(d) = d kappa_j w_j / sum_i kappa_i w_i^2` can rank likely response channels for audit. | Iterations 29-32 | footnote | Conditional toy-model implication / audit heuristic under additive score gain, local separable quadratic costs, declared `kappa`, and effective `w`. | At most a footnote or parenthetical toy calculation; say it tells where to inspect traces first. | No empirical behavior prediction, welfare theorem, research-value theorem, or policy-optimality result. |
| Iteration 27 adaptive hardening can converge to no-gaming once `S(M) < d^2/(2V)` in the declared finite-channel additive quadratic scorecard. | Iterations 27-28 | footnote | Reviewed Layer-3 finite-channel toy-model implication. | At most a footnote saying the application template inherited a toy frontier vocabulary from a reviewed finite-channel model. | No theorem-level convergence for arbitrary hardening, no stochastic or endogenous-stakes result. |
| Iteration 27 route switching before convergence shows gaming can move across channels under repair. | Iterations 27-28 | footnote | Reviewed toy-model existence example. | Only if needed as a cautionary footnote; keep it separate from application claims. | No cycling theorem; in the toy, capacity decreases monotonically. |
| Static narrow commitment can beat broad reactive measurement when a narrow hard-to-game metric already meets a predeclared signal adequacy floor. | Iterations 27-28 | footnote | Reviewed toy-model policy warning. | Usually omit; if mentioned, label as toy evidence requiring predeclared signal adequacy. | No general policy rule that static or narrow metrics are better. |
| Adding measured dimensions can expand attack surface, while high-signal, low-harm, low-`kappa` additions can improve the frontier. | Iterations 27-28 | footnote | Reviewed toy-model classification. | Usually omit; if mentioned, use only to explain why the application contract asks for signal, harm, attack-surface, and stakes primitives. | No universal claim that adding metrics helps or hurts. |
| New theorem claims about application templates, adaptive hardening, convergence, or measurement frontiers. | Iterations 27-32 | exclude | None in reviewed artifacts. | Do not add. | The reviewed material is methodological, application-level, or toy-model evidence only. |
| Adaptive-hardening convergence beyond the reviewed toy, including stochastic observation, arbitrary hardening policies, shared bottlenecks, nonconvex search, or endogenous `V`. | Iterations 27-28 | exclude | Not reviewed. | Do not add. | No theorem, empirical, or policy license. |
| Endogenous-stakes claims, including trust decay, performative fixed points, or endogenous `V` welfare dynamics. | Iterations 27-32 | exclude | Open question only. | Do not add. | No model closure or verification pass exists. |
| Empirical patient-welfare or research-value estimation from score movement. | Iterations 29-32 | exclude | Explicitly rejected by application reviews. | Do not add. | Score movement is not hidden welfare or long-run research value. |
| Policy optimality for hospital scorecards, scientific metrics, institutional scorecards, or measurement frontiers. | Iterations 27-32 | exclude | Explicitly outside reviewed licenses. | Do not add. | The applications change audit/design/evidence decisions, not optimal policy. |
| Universal anti-metric advice, such as "more metrics are worse," "all scalar metrics should be avoided," or "responsible metrics are sufficient." | Iterations 27-32 | exclude | Contradicted or novelty-bounded by reviews. | Do not add. | The licensed claim is conditional on response channels, signal adequacy, hidden harm/value, attack surface, and evidence. |
| Full application prose dumps from the research notes. | Iterations 29-32 | exclude | Not a book-ready license. | Do not paste; compress into the application-discipline section and short examples. | No long hospital or scientific-metrics appendix unless separately scoped and reviewed. |

## Iteration 34 instructions

Iteration 34 may edit `book/multidimensional-goodhart.typ` only. The primary
target is Chapter 6, around `Response modeling: what a Goodhart claim must
declare`, especially the `Application discipline` section and the worked-
contract area.

The book edit may add:

1. A short statement that applications must declare a response-modeling
   contract before score movement is interpreted.
2. A narrowed application-template boundary: predeclare `U`, the type/action
   boundary, `W_theta` versus `K_theta`, proxy/hidden target, aggregation,
   hidden harm/value, evidence standard, discriminator observations, and
   contract-failure conditions.
3. A compact institutional-scorecard discussion traceable to the hospital and
   scientific-metrics mappings.
4. A sentence that the application succeeds only when it changes a design,
   audit, or evidence-collection decision.
5. At most a footnote or parenthetical toy note for the quadratic diagnostic
   or finite-channel adaptive-hardening evidence, with the toy-model license
   explicitly attached.

The book edit must not add theorem expansion, endogenous-stakes analysis,
policy-optimality advice, empirical welfare or research-value estimation,
route-cycling claims, generic anti-metric claims, or full application prose
dumps. Leave `book/multidimensional-goodhart-paper.typ` unchanged unless a
tiny consistency fix is unavoidable.

No public APIs, schemas, types, or code interfaces change.

No conjecture is promotion-ready in this gate; conjectural material remains in
research notes until separately reviewed.

## Review conclusion

The promotion-ready result is an application discipline: response-modeling
contracts can make institutional scorecard examples decision-relevant by
forcing the writer to declare the response channel, hidden target, aggregation,
evidence standard, discriminator observations, and failure conditions before
interpreting score movement. The hospital and scientific-metrics examples can
appear as compact application mappings. The quadratic and adaptive-hardening
material can only be footnoted as reviewed toy-model support. Everything else
remains research-note material for later theorem, simulation, or empirical
work.
