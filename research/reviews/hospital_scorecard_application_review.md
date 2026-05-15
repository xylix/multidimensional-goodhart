# Review iteration: hospital scorecard application

Status after consolidation: historical application review. Use it for the
hospital scorecard audit logic, not as a current promotion or policy gate. Read
it through the later application-generalization, application-promotion,
empirical-auditability, and policy-readiness boundaries before reusing claims.

Iteration type: review

Review targets:

- `research/applications/application_template.md`
- `research/applications/hospital_scorecard.md`
- Q19 in `research/open_questions.md`
- the hospital scorecard rows in `research/claim_audits.md`
- the response-modeling contract row in `research/verification_stack.md`

High-level verdict: yes with narrowing. The hospital application does change a
concrete audit/design decision: it says not to credit readmission score gains as
patient-welfare gains until repeated fixed-hospital action traces, composition
changes, hidden outcomes, and the qualitative frontier primitives have been
declared or audited. The application is not ready as a general reusable
template if `U`, `h`, `kappa`, `gamma`, `w`, and `V` can be assigned after the
score movement is known. The license for Iteration 31 is therefore conditional:
the scientific-metrics application must preserve predeclared type/action
boundaries, discriminator observations, and primitive-level failure conditions.

## Claim 1: the hospital application changes a concrete audit/design decision

- Claim I might use: The hospital application does more than classify a
  Goodhart story after the fact; it changes what an evaluator should collect or
  audit.
- What the text actually shows: Section 12 says to audit action traces by
  predicted score gain per private cost and hidden harm before treating score
  improvement as welfare improvement. It names repeated fixed-hospital action
  traces, hidden outcomes, composition changes, and evidence for `kappa`, `h`,
  `gamma`, `w`, and `V`.
- Evidence type: Layer-2 application mapping and audit-design argument, not
  empirical hospital evidence.
- Main inferential gap: The text does not show that the recommended audit is
  feasible in any particular hospital system or that it improves policy
  outcomes.
- Stronger claim not supported: Readmission scorecards are harmful, or the
  contract identifies the welfare effect of an observed score change.
- Top 3 alternative explanations or model-breakers:
  1. The score changed because hospital composition changed, with no fixed-unit
     response.
  2. The score changed because reporting was repaired, with no patient-welfare
     harm.
  3. The score changed because follow-up care improved, making the response
     welfare-improving rather than harmful gaming.
- Measurement concern: The audit requires stable hospital identifiers, service
  line participation, action traces, hidden patient outcomes, and policy timing.
  Without these, the decision rule collapses into retrospective labeling.
- Generalization boundary: The changed decision transfers only to scorecards
  where action traces, composition, exposure intensity, aggregation, and hidden
  outcome proxies can be observed or defended.
- Action: keep, narrowed to an audit/evidence-collection recommendation.

## Claim 2: the application distinguishes `W_theta` selection from `K_theta` response

- Claim I might use: The hospital application makes the selection/intervention
  distinction operational.
- What the text actually shows: Section 4 separates pure selection over
  hospitals through changing `W_theta` with `K_theta = K_0` from fixed-hospital
  changes in coding, discharge timing, follow-up, or patient selection through
  `K_theta != K_0`.
- Evidence type: Conceptual decomposition plus proposed discriminator
  observations.
- Main inferential gap: Marginal score movement alone does not identify the
  channel. The distinction requires repeated-unit observations or variation in
  exposure, weights, costs, audit pressure, or stakes.
- Stronger claim not supported: The decomposition is representation-free or
  identifiable from aggregate hospital score distributions alone.
- Top 3 alternative explanations or model-breakers:
  1. A richer type space encodes future response plans and absorbs behavior
     change into selection.
  2. Continuing hospitals and entrant/exit hospitals both change, producing a
     mixture that cannot be cleanly decomposed.
  3. Hospital identifiers are stable but service-line and case-mix boundaries
     move enough that "same hospital" is not a fixed type for the relevant
     question.
- Measurement concern: The application needs repeated hospital/service-line
  panels and case-mix denominators, not just aggregate before/after scores.
- Generalization boundary: The split transfers when a domain can defend a
  fixed type/action boundary before analysis and name observations that could
  falsify it.
- Action: keep, with representation-relativity foregrounded.

## Claim 3: `kappa`, `h`, `gamma`, `w`, and `V` can be declared before deployment

- Claim I might use: The qualitative frontier primitives are available early
  enough to guide scorecard design.
- What the text actually shows: The application lists plausible qualitative
  assignments: coding/status changes may be easier than follow-up, patient
  selection may have access harms, `gamma` reflects clinical signal, `w` is the
  score rule, and `V` is the private value of clearing a threshold.
- Evidence type: Qualitative application mapping; no empirical estimation.
- Main inferential gap: The text gives defensible categories but not a method
  that guarantees pre-policy estimates or bounds for the primitives.
- Stronger claim not supported: The frontier primitives can always be estimated
  well enough to rank channels, or the framework identifies them from score
  movement.
- Top 3 alternative explanations or model-breakers:
  1. `h` is ethically or clinically contested, especially for access,
     morbidity, and distributional harms.
  2. `kappa` changes after the scorecard because vendors, administrators, or
     audit rules alter the action cost.
  3. `gamma` is chosen after observing which score component moved, making the
     signal/attack-surface tradeoff post hoc.
- Measurement concern: `w` may be public, but `V`, `kappa`, and `h` require
  external evidence: policy stakes, audits, costs, patient outcomes, access
  measures, and sometimes clinical judgment.
- Generalization boundary: Reuse is licensed only when the primitives are
  predeclared, bounded, or explicitly marked unavailable before the application
  makes a recommendation.
- Action: narrow. Treat missing primitive evidence as a contract-failure
  condition, not as a blank field to fill after outcomes are known.

## Claim 4: the quadratic calculation is only a conditional diagnostic

- Claim I might use: The quadratic formula identifies where hospitals will
  game.
- What the text actually shows: Section 11 states that
  `m(d) = d^2 / (2 sum_j kappa_j w_j^2)` and
  `a_j^*(d) = d kappa_j w_j / sum_i kappa_i w_i^2` apply under separable
  quadratic local costs and additive proxy gain. It explicitly says this is not
  an empirical estimate or welfare conclusion.
- Evidence type: Conditional toy calculation imported from the intervention
  budget thread.
- Main inferential gap: Actual hospital response may involve lumpy costs,
  caps, detection penalties, shared organizational bottlenecks, non-additive
  thresholds, or heterogeneous departments.
- Stronger claim not supported: The formula predicts hospital behavior,
  measures welfare, or supports policy optimality.
- Top 3 alternative explanations or model-breakers:
  1. Fixed charges make the cheapest route lumpy rather than proportional to
     `kappa_j w_j`.
  2. Audit risk or legal constraints change the private cost after deployment.
  3. Hospitals optimize a tiered or conjunctive rule rather than the declared
     additive `w . P` score.
- Measurement concern: The calculation should be used to order audit
  hypotheses, then checked against action traces; it should not substitute for
  those traces.
- Generalization boundary: Transfers only to local additive score settings with
  declared action channels and cost-shape assumptions.
- Action: keep, as a conditional diagnostic only.

## Claim 5: the template is ready to guide Iteration 31 scientific metrics

- Claim I might use: The application template is reusable for scientific
  metrics.
- What the text actually shows: The template and hospital application provide
  fields that discipline the case: type space, baseline behavior, exposure,
  channel, action geometry, proxy/target relation, aggregation, hidden value,
  primitives, evidence standard, licensed calculation, changed decision,
  discriminator observation, and contract-failure condition.
- Evidence type: One reviewed non-ML application plus prior MMLU application
  context; not a cross-domain validation.
- Main inferential gap: One institutional scorecard does not show that the same
  primitives remain operational in scientific metrics. Scientific metrics may
  have slower feedback, weaker hidden-outcome observability, more endogenous
  type formation, and less clean `V`.
- Stronger claim not supported: The template is a universal application method
  or will always change a domain-specific recommendation.
- Top 3 alternative explanations or model-breakers:
  1. The hospital case works because it has unusually concrete action traces
     and patient-outcome proxies.
  2. The same fields may become labels in scientific metrics without
     observable discriminators.
  3. The recommendation may reduce to "audit likely gaming" regardless of
     domain, which would mean the template is underconstraining.
- Measurement concern: Iteration 31 must name observations available before or
  during exposure: researcher panels, field composition, publication/citation
  strategies, hidden research-quality proxies, grant/venue incentives, and
  aggregation rules.
- Generalization boundary: Reuse is licensed for Iteration 31 only as a
  skeptical template test. It must produce at least one recommendation that
  differs from the hospital case for a principled domain reason.
- Action: keep with narrowing; license for Iteration 31 is "yes with
  narrowing."

## Post-hoc flexibility audit

### Type space `U`

Hospital `U = (q, m, r, b)` is useful because it separates baseline care
quality, patient mix, reporting style, and capacity from post-exposure changes.
The flexibility risk is that future response plans could be folded into `U`,
turning every intervention into selection. The application handles this by
calling that representation a different question, but reuse should require the
type/action boundary before observing the score movement.

### Hidden value weights `h`

The hospital text treats coding-only repair, discharge/admission manipulation,
follow-up, and patient selection as channels with different hidden-welfare
signs. This is plausible but not automatic. `h` must come from patient outcome,
access, distributional, and clinical evidence, not from whether a channel looks
like "gaming" after the fact.

### Action-cost and `kappa` assumptions

The qualitative claim that coding is easier than real follow-up is plausible
enough to generate audit hypotheses. It is not enough to estimate behavior.
`kappa` should be treated as a predeployment cost/accessibility ranking or as
an auditable object during exposure. If costs are lumpy, capped, or detection
dependent, the quadratic diagnostic must be replaced.

### Signal adequacy `gamma`

`gamma` is the most post-hoc-prone primitive. A score component cannot be
declared adequate because it survived or inadequate because it was gamed. The
hospital application survives only if clinical signal, reliability, and
incremental information are defended before the attack-surface comparison.

### Private stakes `V`

`V` is at least partly observable from penalties, funding, rankings,
reputation, managerial targets, and audit pressure. The risk is that private
stakes differ across hospitals and change once scorecards are public. Reuse
should require either a declared range for `V` or a comparative-static design
that varies exposure intensity.

### Aggregation weights `w`

`w` is usually observable in the score rule, but the application correctly
notes that real institutions may use threshold, tiered, conjunctive, or
lexicographic rules. If the rule agents respond to differs from the declared
rule, the contract fails.

### Observability before or during policy exposure

The strongest part of the hospital application is that most required evidence
is observable in principle during exposure: repeated hospital identifiers,
service-line participation, case mix, coding/status traces, discharge timing,
follow-up, referral changes, hidden patient outcomes, policy timing, and
threshold variation. The weak part is net welfare: common-unit welfare cannot
be inferred unless the hidden-value model is defended separately.

## Discriminator audit

What observation distinguishes pure selection from fixed-hospital behavior
change? Repeated continuing hospitals under the same identifiers and service
lines. If the ranked population or case mix changes while continuing hospitals
show no policy-timed shifts in coding, discharge, follow-up, or selection
traces, pure selection is favored. If continuing hospitals change action traces
after exposure, `K_theta` response is favored.

What observation distinguishes harmful gaming from harmless proxy repair?
Patient-level hidden outcomes and access burdens. If counted readmissions fall
because duplicate records, denominator errors, or coding conventions are fixed
while patient outcomes are stable or improve, harmless proxy repair is favored.
If score gains route through positive-`h` channels such as access restriction
or burden-shifting with flat or worse hidden outcomes, harmful gaming is
favored.

What observation distinguishes harmful gaming from real quality improvement?
The action trace and hidden outcome must move together. Follow-up staffing,
medication reconciliation, care-transition improvement, and patient-level
outcome improvement favor real quality improvement. Observation-status shifts,
patient avoidance, exclusion changes, or delayed care with flat/worse hidden
outcomes favor harmful gaming.

What missing observation would make the application only a classification
exercise? If repeated fixed-hospital action traces and composition data are
missing, aggregate score movement cannot distinguish selection from response.
If hidden patient outcomes and access measures are missing, response cannot be
classified as harmful gaming, harmless repair, or real improvement. If
`kappa`, `h`, `gamma`, `w`, and `V` are assigned only after the fact, the
application no longer changes design; it only narrates the outcome.

## Final reuse verdict

license for Iteration 31: yes with narrowing.

The scientific-metrics application must preserve exactly these constraints:

- declare the type/action boundary before interpreting metric movement;
- separate `W_theta` selection from `K_theta` fixed-type response using
  observations stronger than aggregate score changes;
- predeclare or explicitly mark unavailable the analogues of `kappa`, `h`,
  `gamma`, `w`, and `V`;
- name hidden-value evidence before labeling a response harmful or beneficial;
- use any calculation only as a conditional diagnostic under its stated
  action/cost/aggregation assumptions;
- produce a domain-specific changed audit/design/evidence decision, not just a
  generic warning that metrics can be gamed.
