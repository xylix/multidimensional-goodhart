# Application note: empirical auditability of scorecard primitives

Iteration type: `empirical-design`

## Status and non-license

This note asks whether the primitives used in the hospital scorecard and
scientific-metrics scorecard applications can be predeclared, bounded,
defended, or marked unavailable before deployment.

The note licenses only a design, monitoring, and evidence-collection boundary.
It does not estimate patient welfare or research value from score movement,
does not rank policies, and does not give a general rule for or against
metrics. The symbols `kappa`, `h`, `gamma`, `w`, and `V` are conditional
shorthand for declared audit objects. Naming them does not mean they are
directly measured.

## Audit primitives

- Response ease (`kappa`): how cheaply or quickly a unit can move a response
  channel after the scorecard becomes salient. Evidence can bound this by
  implementation cost, baseline variation, elapsed time, staff capacity,
  available tools, and prior behavior under similar incentives. If only the
  eventual score movement is available, response ease is unavailable.
- Hidden harm or value (`h`): whether a score-moving channel hurts, leaves
  unchanged, or improves the hidden target. Evidence can defend only channel
  signs or rough orderings unless a separate hidden-target model exists. If
  hidden outcomes or project-quality traces are absent, `h` is unavailable.
- Signal adequacy (`gamma`): whether a score component carries enough
  predeclared information about the target to justify its attack surface.
  Evidence must be target-specific and available before the component receives
  leverage. If adequacy is inferred after the component moved, `gamma` is
  unavailable.
- Effective weights, thresholds, gates, and overrides (`w`): the actual
  leverage a component has in decisions, including formal weights, nonlinear
  gates, committee overrides, audit triggers, exclusions, and local
  implementation rules. If the effective rule is undocumented or differs from
  the public formula, the declared `w` is unavailable until the rule is
  reconstructed.
- Stakes (`V`): the private value of clearing the scorecard threshold or
  ranking comparison. Evidence can bound this through penalties, funding,
  reputation, salaries, retention, promotion, lab survival, or institutional
  standing. If the relevant payoff is informal and unobserved, `V` is
  unavailable or only qualitatively bounded.

Unavailable does not mean irrelevant. It means the application cannot import a
diagnostic calculation or credit score movement without changing the design:
lower leverage, pilot first, add monitoring, collect missing traces, or fall
back to qualitative review.

## Hospital scorecards

### Response ease

Predeployment evidence could include baseline coding variation, observation
status use, chart-audit findings, discharge-timing distributions, follow-up
capacity, care-coordination staffing, referral control, service-line
flexibility, denial and appeal rates, and prior response to penalties or audits.
Repeated-hospital panels are stronger than aggregate score movement because
they can separate continuing-hospital action changes from composition changes.

Mark response ease unavailable when action traces are not measured at the
hospital or service-line level, when the only evidence is post-score movement,
or when legal and data-access constraints prevent tracing coding, discharge,
selection, and follow-up channels. Consequence: pilot before full deployment,
lower score leverage, and require trace monitoring before interpreting
improvement.

### Hidden harm or value

Predeployment evidence could include patient-level outcomes, emergency burden,
mortality and morbidity follow-up, access measures, delayed-care measures,
case-mix shifts, patient-selection audits, and clinical review of whether each
response channel is care-improving, proxy-only, or access-harming. Chart review
can defend signs for channels such as coding repair, follow-up care, admission
threshold movement, and patient avoidance.

Mark hidden harm/value unavailable when patient outcomes are too delayed,
confounded, inaccessible, or not linked to the fixed-hospital action trace.
Consequence: do not credit score gains as welfare gains; separate reporting
repair from care improvement; add hidden-outcome follow-up or keep the
component low-leverage.

### Signal adequacy

Predeployment evidence could include clinical validation, risk-adjustment
checks, denominator stability, subgroup calibration, readmission preventability
review, and comparison with patient-centered outcomes. A component with strong
clinical signal may be retained despite attack surface; a weak component that
is easy to move should not receive high leverage.

Mark signal adequacy unavailable when validation depends on the same exposed
score movement, when case-mix correction is unstable, or when subgroup
performance is unknown. Consequence: delay deployment, reduce weight, require
subgroup monitoring, or replace the component with a better-supported measure.

### Effective weights, gates, and overrides

Predeployment evidence could include the public formula, penalty thresholds,
risk-adjustment rules, exclusion rules, appeal rules, audit triggers, service
line treatment, and managerial override practices. The effective rule should
include nonlinear gates and local implementation, not only the published
coefficient table.

Mark effective weights unavailable when committees, auditors, or managers use
hidden thresholds or discretionary overrides that are not recorded.
Consequence: document the actual decision rule before using the application
contract; otherwise treat action incentives as unknown and monitor a wider set
of channels.

### Stakes

Predeployment evidence could include penalty size, funding exposure, public
ranking consequences, executive incentives, accreditation risk, referral
effects, reputational exposure, and service-line revenue. Threshold-adjacent
hospitals may face larger stakes than hospitals far from the cutoff.

Mark stakes unavailable when reputational, managerial, or strategic payoffs are
informal and cannot be bounded. Consequence: do not assume a low-pressure
environment; audit threshold-adjacent units and high-reputation-exposure units
first.

## Scientific-metrics scorecards

### Response ease

Predeployment evidence could include same-researcher and same-lab panels,
field-normalized publication baselines, citation-network diagnostics, prior
self-citation and coauthorship patterns, venue rules, grant-cycle timing,
metadata quality, preprint practices, and audit samples of project packaging.
Project traces are stronger than aggregate metric movement because they can
separate applicant or field composition shifts from fixed-researcher response.

Mark response ease unavailable when there are no panel traces, when field
baselines are missing, or when publication, citation, authorship, and topic
changes cannot be linked to the exposed researchers or labs. Consequence:
avoid increasing leverage on fast scalar metrics; add field-specific monitoring
and project audits before deployment.

### Hidden harm or value

Predeployment evidence could include expert portfolio review, replication and
robustness indicators, reusable data and code, delayed uptake, negative-result
tracking, authorship audits, topic-diversity measures, and field-health
indicators. Evidence will usually support contested signs or rough comparisons,
not common-unit values across fields.

Mark hidden harm/value unavailable when long-run value is too delayed,
field-specific, contested, or not comparable in a common unit. Consequence:
fall back to qualitative portfolio review, use lagged evaluation windows,
separate metadata repair from project improvement, and do not treat metric
gains as research-quality gains.

### Signal adequacy

Predeployment evidence could include field normalization, citation-window
validation, authorship convention checks, grant-review calibration, output-type
coverage, replication links, and delayed-use studies. Short-window counts need
especially explicit support before they receive high leverage.

Mark signal adequacy unavailable when the component mainly predicts prestige,
network position, field size, or database coverage rather than the declared
research target. Consequence: lower weight on fast scalar metrics, extend
evaluation windows, add portfolio review, or restrict the component to a
screening aid with documented override.

### Effective weights, gates, and overrides

Predeployment evidence could include formal score formulas, tenure and hiring
rubrics, funding cutoffs, ranking formulas, field quotas, committee minutes,
override logs, and local rules for venue prestige, author order, and grant
credit. Effective leverage includes informal "must have" gates even when the
public rule says the metric is advisory.

Mark effective weights unavailable when committees use undocumented prestige
filters, informal citation thresholds, or inconsistent field adjustments.
Consequence: document the actual rule or treat the metric system as
unmodeled; require override logging before interpreting score changes.

### Stakes

Predeployment evidence could include hiring, tenure, salary, lab survival,
grant renewal, departmental resource allocation, prestige, ranking exposure,
and visa or contract consequences. Stakes can differ sharply by career stage,
field, and institutional dependence on external rankings.

Mark stakes unavailable when the main payoff is informal status or reputation
that cannot be bounded. Consequence: audit high-stakes career stages and
ranking-sensitive units first, and keep scalar thresholds advisory until
response traces are monitored.

## Cross-domain decision table

| Primitive | Hospital evidence | Scientific-metrics evidence | Unavailable when | Design/audit consequence |
| --- | --- | --- | --- | --- |
| Response ease (`kappa`) | Baseline coding/status variation, discharge and follow-up traces, referral control, service-line flexibility, chart audits | Same-researcher panels, publication packaging, citation networks, authorship and venue traces, topic shifts | Only aggregate score movement is observed, or action traces are not linked to repeated units | Pilot first; lower leverage; monitor predicted high-ease channels before crediting gains |
| Hidden harm/value (`h`) | Patient outcomes, access and delayed-care measures, case-mix shifts, clinical review of response channels | Expert portfolio review, replication and robustness traces, delayed uptake, topic diversity, authorship audits | Hidden target is absent, delayed beyond the decision, or not linked to action traces | Do not credit score movement as hidden-target improvement; collect hidden outcomes or use qualitative review |
| Signal adequacy (`gamma`) | Clinical validation, risk adjustment, denominator stability, subgroup calibration | Field normalization, citation-window validation, output-type coverage, delayed-use evidence | Adequacy is inferred after deployment or only from prestige correlation | Reduce weight, delay deployment, add validation, or restrict to advisory use |
| Effective leverage (`w`) | Penalty formula, thresholds, gates, exclusions, audit triggers, override records | Score formulas, funding cutoffs, tenure rubrics, quotas, prestige gates, override logs | The actual decision rule is undocumented or differs from the declared formula | Reconstruct and document the rule; monitor broader channels while leverage is uncertain |
| Stakes (`V`) | Penalties, funding, reputation, referral effects, executive incentives, accreditation risk | Hiring, tenure, salary, lab survival, grants, rankings, career-stage exposure | Informal or strategic payoffs dominate and cannot be bounded | Audit threshold-adjacent or high-exposure units first; avoid assuming weak incentives |

## Failure conditions

The empirical-auditability note fails as an application boundary if:

- primitives are assigned only after observing which score moved;
- repeated-unit, composition, and action-trace evidence are unavailable;
- the hidden target is not declared before deployment;
- harmful gaming, harmless proxy repair, and genuine improvement cannot be
  distinguished by planned observations;
- the effective aggregation rule differs from the declared rule and cannot be
  reconstructed;
- unavailability has no consequence for design, monitoring, deployment, or
  evidence collection.

The strongest surviving conclusion is methodological: a scorecard application
can proceed only when each primitive is predeclared, bounded, defended, or
marked unavailable with an explicit design consequence.
