# Application template generalization review

Status after consolidation: still relevant as a methodological review, but the
live operational template is `research/applications/application_template.md`.
Use later promotion, empirical-auditability, and policy-readiness gates before
turning this review into book, paper, empirical, or policy claims.

Iteration type: `review`

## Question

Does `research/applications/application_template.md` genuinely generalize from
the hospital readmission scorecard application to the scientific-metrics
application, or did the second application work only by flexible redescription?

High-level verdict: **reusable with narrowing**. The template transfers as a
response-modeling contract, not as a plug-and-play empirical model. The stable
part is the required decomposition: declared type/action boundary, `W_theta`
versus `K_theta`, proxy/target split, aggregation rule, hidden harm/value
model, evidence standard, discriminator observations, and contract-failure
conditions. The narrow part is that the frontier primitives `kappa`, `h`,
`gamma`, `w`, and `V` must be predeclared, defended, or marked unavailable
before score movement is interpreted.

The scientific-metrics application is the harder transfer. Hospitals have
closer patient-level welfare traces and more conventional audit records for
coding, discharge, follow-up, and selection. Scientific evaluation has longer
lags, field-dependent value, and weaker observability of hidden research value.
That difference does not kill the template, but it narrows the licensed output:
the scientific case can change metric-design and evidence-collection decisions;
it cannot estimate research value or import the quadratic diagnostic without a
field-specific evidence contract.

## Side-by-side result

| Contract field | Hospital scorecard | Scientific metrics | Generalization judgment |
| --- | --- | --- | --- |
| Type/action boundary | Baseline hospital quality, patient mix, reporting style, and capacity are type; induced coding, follow-up, discharge, and patient-selection changes are action. | Baseline ability, resources, field, career stage, topic, method style, and collaboration practice are type; induced publication, citation, grant, topic, method, venue, and open-science changes are action. | Stable but representation-relative. Reuse is licensed only if `U` is predeclared and future response plans are not hidden inside type. |
| `W_theta` vs. `K_theta` | Selection through hospital pool, service lines, exclusions, mergers, or case mix; fixed-hospital response through coding, admission thresholds, follow-up, or patient avoidance. | Selection through applicants, hiring, retention, fields, labs, and funded populations; fixed-researcher/lab response through packaging, citations, topics, methods, grants, and open artifacts. | Stable. This is the strongest transfer because both applications need repeated-unit or exposure-variation evidence to separate composition from fixed-type response. |
| Proxy/target split | Readmission score `P` versus hidden patient welfare `H`: mortality, morbidity, access, delayed care, patient burden, and distributional harm. | Publication/citation/grant/venue proxies `P` versus hidden research value `H`: originality, robustness, replication value, long-run usefulness, field health, training value, and externalities. | Stable in form, weaker in scientific measurement. The template should permit qualitative hidden-value evidence but must not let proxy movement stand in for `H`. |
| Aggregation rule | Usually additive score or threshold, with a warning to replace the calculation under gates, tiers, or lexicographic rules. | Additive composite score in the target case, with a warning to replace it under committee overrides, quotas, thresholds, or dossier review. | Stable. Reuse fails if the declared aggregation rule differs from the rule agents actually respond to. |
| Hidden harm/value model | Exchange-rate model `ell(a)` over patient-welfare channels; signs can often be checked against clinical, access, and patient-outcome evidence. | Hidden research-value model `v(a)` over research practices; signs and magnitudes are field-specific, delayed, and often contested. | Stable requirement, unequal evidential strength. Scientific applications should more often mark `h` or `gamma` unavailable. |
| Evidence standard | Repeated hospital identifiers, action traces, patient-level outcomes, case mix, policy timing, weights, thresholds, audit pressure. | Same-researcher/lab panels, project traces, composition data, score rules, citation windows, field normalization, qualitative review, delayed uptake. | Stable as a standard, not as identical data. Both require observations stronger than aggregate score movement. |
| Discriminator observations | Threshold or staggered exposure moves high `kappa_j w_j` hospital action traces; hidden patient outcomes separate harm, repair, and improvement. | Scorecard changes move predicted publication/citation/topic/method/open-science traces; project quality and delayed uptake separate harm, repair, and improvement. | Stable. Transfer succeeds only because both applications name discriminators that could favor one mechanism over another. |
| Contract-failure conditions | Post-hoc primitives, no repeated hospital data, hidden welfare unavailable, wrong aggregation, post-policy actions encoded as type. | Post-hoc primitives, no panel/project traces, missing exposure timing, hidden-quality evidence unavailable, wrong committee/ranking rule. | Stable and important. The failure conditions could actually fire in both domains. |

## Domain-specific reinterpretations

The template does not preserve domain content. It preserves slots that force
domain-specific content.

Hospital applications need patient-welfare traces: clinical outcomes, access,
emergency burden, delayed care, case-mix changes, denominator/exclusion rules,
coding shifts, observation-status use, discharge timing, follow-up intensity,
service-line participation, referral steering, and patient selection.

Scientific-metrics applications need long-run research-value traces:
project-level methods, replication, reuse of data and code, durable downstream
uptake, field health, authorship and collaboration patterns, topic movement,
grant tailoring, publication packaging, citation practices, venue targeting,
metadata repair, preprints, indexing, and qualitative portfolio review.

This is genuine reuse only if these traces change an audit or design decision.
For hospitals, the changed decision is to audit repeated fixed-hospital action
traces and hidden patient outcomes before crediting score improvement as
patient-welfare improvement. For scientific metrics, the changed decision is
to avoid increasing leverage on fast scalar metrics unless signal adequacy and
response-channel audits have been predeclared.

## Frontier primitive audit

`kappa`: meaningful in both domains as relative ease or accessibility of moving
a response channel. It is more readily operationalized in hospitals for coding,
status, follow-up, and patient selection than in scientific metrics, where
field, career stage, project cycle, and network position strongly mediate
short-run ease. In either domain, if `kappa` is assigned only after observing
which score moved, the application fails.

`h`: meaningful in both domains as hidden harm/value exchange rate, but with
different signs and evidence. Hospital `h` can often be tied to patient
outcomes, access, and clinical burden. Scientific `h` is harder because
research value is delayed and plural. The scientific application should often
use sign tables or mark `h` unavailable rather than pretending to estimate a
common value scale.

`gamma`: meaningful as signal adequacy. Hospital readmission components may
have clinically reviewable signal after risk adjustment and population
definition. Scientific metrics need field normalization, lag handling,
authorship conventions, and output-type corrections before `gamma` is
defensible. Weak `gamma` is exactly where the template changes a design
decision: do not add leverage just because a metric is easy to observe.

`w`: meaningful in both applications, but only if the declared weights,
thresholds, gates, exclusions, and override rules are the ones agents actually
face. If committees say the score is advisory but agents rationally respond to
an informal cutoff, `w` must represent the effective rule or be marked
unknown.

`V`: meaningful as private value of clearing a threshold: penalties,
reputation, funding, managerial pressure, tenure, hiring, salary, lab survival,
or ranking position. `V` is not automatically observable. Exogenous variation
in stakes is useful evidence; otherwise the primitive should be qualitative or
unavailable.

Review conclusion: the primitives are meaningful enough to transfer, but only
as declared audit primitives. They are not licensed empirical estimates merely
because both applications can name them.

## Quadratic diagnostic

Both applications include the additive quadratic diagnostic

`m(d) = d^2 / (2 sum_j kappa_j w_j^2)`,

`a_j^*(d) = d kappa_j w_j / sum_i kappa_i w_i^2`.

This transfer is licensed only as a conditional audit heuristic. It says where
to look first if the application has additive proxy gain, local separable
quadratic costs, declared `kappa`, and effective weights `w`. It does not
estimate hospital behavior, researcher behavior, welfare, research value, or
policy optimality.

The diagnostic is more plausible as a local hospital audit heuristic because
some channels have shorter feedback loops and clearer institutional records.
In scientific metrics, response costs are often lumpy, field-constrained,
career-stage-dependent, reputation-mediated, and delayed. In that setting the
diagnostic should usually be replaced by an active-set comparison, a
qualitative trace audit, or the statement that no calculation is licensed.

## Flexible redescription audit

Template reuse fails when any of the following hold:

- primitives are assigned only after metric movement is observed;
- there are no repeated-unit, panel, composition, or exposure-variation
  observations separating `W_theta` selection from `K_theta` response;
- harmful gaming, harmless proxy repair, and real improvement cannot be
  distinguished by action traces or hidden target evidence;
- the declared aggregation rule differs from the rule agents actually respond
  to;
- the application only says "metrics can be gamed" without changing a design,
  audit, or evidence decision;
- post-policy behavior is absorbed into `U` merely to avoid calling it fixed-
  type response;
- `kappa`, `h`, `gamma`, `w`, or `V` are filled in as narrative labels rather
  than predeclared, estimated, bounded, or explicitly marked unavailable;
- the hidden target is too undefended to classify proxy repair, harm, and real
  improvement.

The hospital application passes this audit conditionally because it names
standard audit objects that could distinguish the mechanisms. The scientific
application passes more narrowly because it names panel/project traces and
hidden-quality evidence, but it must accept that many institutions will lack
enough evidence to use the frontier primitives or the quadratic diagnostic.

## Required transfer conditions

The template is reusable only under these transfer conditions:

1. Predeclare `U` and the type/action boundary.
2. Identify whether the claimed mechanism changes `W_theta`, `K_theta`, or
   both.
3. Declare proxy, hidden target, aggregation, and hidden value/harm model
   before interpreting score movement.
4. Mark `kappa`, `h`, `gamma`, `w`, and `V` unavailable when evidence is weak.
5. Name discriminator observations stronger than aggregate score movement.
6. Include a contract-failure condition that could actually fire.
7. State the changed design, audit, or evidence-collection decision.
8. Treat the quadratic formula as unavailable unless its hypotheses are
   declared in the application.

## Final verdict

The application template is **reusable with narrowing**.

It does not need separate hospital and scientific subtemplates yet, because
the same core contract fields carried across domains and forced useful
discriminators. But it does need a stricter reuse boundary: every application
must declare or withhold the frontier primitives, must distinguish selection
from fixed-type response using observations stronger than aggregate score
movement, and must produce a changed audit/design/evidence decision. Without
those constraints, the template collapses into flexible redescription.

The surviving general claim is methodological: the response-modeling
application template can discipline institutional scorecard applications by
requiring a predeclared response contract and falsifiers. It does not license
domain welfare estimates, research-value estimates, policy optimality,
universal anti-metric advice, or empirical use of the quadratic diagnostic
without domain evidence.
