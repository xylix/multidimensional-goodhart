# Application: hospital readmission scorecard

Iteration type: `application-mapping`

## Purpose

This application fills the response-modeling contract for a hospital
readmission or institutional scorecard. The target claim is not "readmission
metrics are bad." The target claim is narrower: before treating score
improvement as patient-welfare improvement, the regulator should audit which
response channel produced the score movement and whether the action traces
route through high-harm channels. [tentative]

Toy scenario: after a readmission penalty is announced, a hospital's measured
readmission score improves. The same observation is compatible with hospitals
leaving the comparison pool, coding changes, delayed readmissions, better
follow-up care, patient avoidance, or a mixture.

## 1. Type space

Let hospital type be

`u = (q, m, r, b)`,

where `q` is baseline care quality, `m` is patient mix or case difficulty, `r`
is baseline reporting/coding style, and `b` is baseline organizational capacity
such as staffing, discharge-planning infrastructure, and care-coordination
capacity. Let `nu(du)` be the pre-policy type distribution.

The modeling choice is that `r` and `b` are fixed only at baseline. If the
scorecard induces changed coding, discharge planning, follow-up staffing, or
patient avoidance in the same hospital, those changes belong in
`K_theta(ds | u)` rather than being absorbed into type. [tentative]

Counterexample attempt: one could define `u` to include each hospital's full
future response plan to every possible readmission formula. That representation
would turn all fixed-hospital adaptation into selection over richer types, but
it would not answer the audit question because it removes observable behavior
change from the response channel. This application therefore treats stable
pre-policy capacity as type and post-exposure changes as response.

## 2. State and baseline behavior

Let observed state be

`s = (P, H, A, C)`,

where `P` is the readmission score or score vector, `H` is hidden patient
welfare loss, `A` is an action trace, and `C` is hospital composition in the
ranked population. Baseline behavior is `K_0(ds | u)`, allowing stochastic
patient arrivals, clinical uncertainty, measurement noise, and routine practice
variation.

`A` should include, when observable: coding changes, observation-status use,
discharge timing, post-discharge follow-up intensity, care transitions, service
line changes, referral patterns, patient selection, and appeals or exclusions.

## 3. Policy exposure

The policy `theta` is a public scorecard, penalty, funding rule, or ranking
based on measured readmissions. A simple form is `w . P >= t`, where `w` gives
component weights and `t` is a threshold. Let `V` be the private value to the
hospital of clearing the relevant penalty, reputation, managerial, or funding
threshold.

The exposure is only a Goodhart model once the observer states whether `theta`
changes `W_theta`, `K_theta`, or both.

## 4. Selection versus fixed-type response channel

The induced law is

`mu_theta(B) = int W_theta(u) K_theta(B | u) nu(du) / int W_theta(u) nu(du)`.

### Pure selection over hospitals through `W_theta`

Pure selection says `K_theta = K_0` while `W_theta(u)` changes. Examples include
low-scoring hospitals leaving the ranked pool, service lines closing, mergers,
exemptions, case exclusions, or comparison groups changing. Score improvement
then reflects changed composition, not changed fixed-hospital behavior.

Discriminator: the ranked population's type mix or service mix changes, while
repeated observations of continuing hospitals show no policy-timed shift in
coding, discharge timing, follow-up, or patient-selection traces.

### Harmful fixed-type intervention through `K_theta`

Harmful fixed-type intervention says the same hospitals change behavior after
exposure and the score-improving action has positive hidden harm. Examples:
coding or observation-status changes that reduce counted readmissions without
improving health; discharge or admission-threshold changes that move burden to
patients; or patient avoidance that improves scores by excluding hard cases.

Discriminator: continuing hospitals show policy-timed action shifts, and the
largest shifts occur in high score-per-cost, positive-`h` channels.

### Harmless proxy-only intervention

Harmless proxy-only intervention also changes `K_theta`, but not hidden patient
welfare. Examples include cleaning duplicate records, correcting denominator
errors, or standardizing reporting so the score is less noisy. This can be
Goodhart for proxy validity without being welfare harm.

Discriminator: score movement is explained by reporting or measurement repairs,
while patient-level hidden outcomes are stable or separately improve.

### Real quality improvement

Real quality improvement changes `K_theta` at fixed hospital type through
goal-improving actions such as better discharge planning, medication
reconciliation, home follow-up, or care coordination. It is intervention, but
not harmful Goodhart.

Discriminator: action traces concentrate in negative-`h` or patient-benefiting
channels, and hidden outcomes improve in the relevant patient groups rather
than only in the reported score.

### Mixtures

Most real scorecard cases can be mixtures: some hospitals leave the comparison
pool, some change coding, some improve follow-up, and some avoid difficult
patients. A single clean classification is not licensed unless the application
can bound the mixture shares or show that one channel dominates the decision at
hand. [tentative]

## 5. Action/search geometry

For fixed-type response, use action vector

`a = (a_c, a_d, a_f, a_s)`,

where:

- `a_c`: coding, documentation, denominator, or observation-status movement;
- `a_d`: discharge timing, admission threshold, or readmission-timing movement;
- `a_f`: real follow-up, care-transition, or patient-support improvement;
- `a_s`: patient selection, avoidance, service-line restriction, or referral
  steering.

A local additive proxy-gain approximation is

`p(a) = w_c a_c + w_d a_d + w_f a_f + w_s a_s`.

A qualitative hidden-harm model is

`ell(a) = h_c a_c + h_d a_d - h_f a_f + h_s a_s`.

The signs are not assumed by notation: they must be defended from clinical,
audit, and patient-outcome evidence. The negative sign on `a_f` marks a
candidate welfare-improving channel, not a theorem.

## 6. Proxy/target relation

`P` is the measured readmission outcome or composite institutional score.
`H` is hidden patient-welfare loss: mortality, morbidity, untreated illness,
avoidable emergency burden, patient stress, access loss, delayed care, and
distributional harm to hard-to-serve patients. The intended relation is
`P approx phi(H)` only after risk adjustment, coding conventions, and
population definitions are declared.

The dimension gap is patient welfare not seen by readmissions. The observation
gap is readmission measurement error inside the measured domain.

## 7. Aggregation rule

The default scorecard rule is additive: `score = w . P`, with a penalty or
ranking threshold. If the real institution uses a conjunctive gate, tiered
penalty, Pareto comparison, or lexicographic rule, the application must replace
the additive calculation.

Weight units matter. Increasing `w_c` for an easily moved coding-sensitive
component changes incentives even if the public narrative says the scorecard
only "adds information."

## 8. Hidden harm/value model

The hospital application uses a declared exchange-rate model `ell(a)`, not
score movement as a welfare proxy. `h_j > 0` means the channel raises hidden
patient-welfare loss per unit action; `h_j < 0` means it improves hidden
welfare. [tentative]

Toy example: improving post-discharge follow-up can lower readmissions and
patient harm at the same time. Changing observation status can lower counted
readmissions while leaving the patient's illness burden unchanged. Patient
avoidance can lower the score while increasing access harm.

## 9. Qualitative frontier primitives

These primitives must be declared before the recommendation:

- `kappa`: ease of moving each channel. In this case, coding/status changes may
  have high `kappa`; discharge timing and admission thresholds may have medium
  `kappa`; real follow-up may have lower short-run `kappa` because it needs
  staffing and coordination; patient selection can have high or medium `kappa`
  depending on referral control and case-mix rules.
- `h`: hidden patient-welfare exchange rates. Coding-only fixes may have near
  zero direct `h`; discharge or admission-threshold manipulation can have
  positive `h`; follow-up improvement has negative `h` if it truly improves
  welfare; patient selection has positive `h` through access and distributional
  harm.
- `gamma`: signal adequacy or information value of each scorecard component.
  A component with high clinical signal may be worth keeping even if it opens
  some attack surface; a low-signal component with high `kappa h w` is a bad
  candidate for weight or visibility.
- `w`: score weights, threshold contributions, exclusion rules, and risk
  adjustment leverage for each component.
- `V`: private value of clearing the penalty, reputation, funding, ranking, or
  managerial threshold.

Claim [tentative]: the template changes the audit from "did readmissions fall?"
to "which channels have high `kappa_j w_j`, what are their `h_j`, and does
`gamma_j` justify the attack surface they add?" The toy scenario is a scorecard
component that has weak clinical signal but is easy to change through coding:
the contract recommends lowering weight or auditing coding traces before
crediting welfare improvement.

## 10. Evidence standard

Evidence for pure selection:

- composition of ranked hospitals, service lines, or patient case mix changes;
- continuing hospitals do not show policy-timed action shifts;
- baseline response curves predict the apparent score improvement.

Evidence for fixed-type intervention:

- same-hospital before/after data show changes in coding, discharge timing,
  follow-up, patient selection, or exclusion behavior;
- staggered exposure or threshold discontinuities shift action traces;
- exogenous variation in `V`, `w`, caps, audits, or reporting costs changes
  response as the action model predicts.

Evidence for harmful Goodhart:

- score gains concentrate in positive-`h` channels;
- hidden patient outcomes do not improve commensurately or worsen;
- harms are concentrated among patients whose access or care burden is outside
  the scorecard.

Evidence for real improvement:

- action traces concentrate in negative-`h` channels such as follow-up and care
  coordination;
- patient-level hidden outcomes improve, not merely the counted readmission
  statistic;
- coding, exclusion, and patient-selection shifts cannot explain the score
  movement.

## 11. Licensed calculation

The licensed calculation is conditional and diagnostic. For a hospital with
score deficit `d > 0`, separable quadratic local costs

`c(a) = sum_j a_j^2 / (2 kappa_j)`

and additive proxy gain `w . a`, the minimum private cost of buying enough
score is

`m(d) = d^2 / (2 sum_j kappa_j w_j^2)`,

and the cost-minimizing action allocation is

`a_j^*(d) = d kappa_j w_j / sum_i kappa_i w_i^2`.

This is not an empirical estimate of hospital behavior. It is a diagnostic:
given declared qualitative primitives, high `kappa_j w_j` channels are where
the audit should first look, and `ell(a^*(d))` is not a welfare conclusion
unless `h` was declared separately. [tentative]

If costs are lumpy, capped, detection-penalized, or shared across departments,
the quadratic calculation should be replaced by an active-set or structural
audit model.

## 12. Changed design or audit decision

Changed decision: audit action traces by predicted score gain per private cost
and hidden harm before treating score improvement as welfare improvement.

Operationally:

- rank candidate response channels by `kappa_j w_j` or local score-per-cost;
- separately assign qualitative `h_j` from patient-outcome and access evidence;
- audit high `kappa_j w_j` and positive-`h_j` channels first;
- add or harden a scorecard component only when `gamma_j` justifies the added
  attack-surface risk through `kappa_j`, `h_j`, `w_j`, and `V`;
- change weights or aggregation if the predicted substitution route is from a
  low-harm channel into a high-harm channel.

This differs from a generic Goodhart warning because it specifies what data to
collect before score improvement is credited: repeated fixed-hospital action
traces, hidden patient outcomes, and evidence for the frontier primitives.

## 13. Discriminator observation

Primary discriminator: under staggered exposure or threshold pressure,
continuing hospitals just below the penalty threshold show disproportionate
movement in high `kappa_j w_j` action traces. If that movement is mostly coding
or patient selection while hidden outcomes are flat or worse, the harmful
fixed-type intervention contract is favored. If the movement is mostly
follow-up care with improved hidden outcomes, the real-improvement contract is
favored. If continuing hospitals do not move but the ranked population changes,
the pure-selection contract is favored.

Secondary discriminator: a change in audit intensity, score weights, or
threshold value `V` should move the response channels predicted by the declared
geometry. Failure of these comparative statics weakens the fixed-type action
model.

## 14. contract-failure condition

The hospital contract fails as a framework application if:

- the qualitative `kappa`, `h`, `gamma`, `w`, or `V` primitives are assigned
  only after observing which readmission score moved;
- repeated fixed-hospital data are unavailable and composition changes can
  fully explain the score improvement;
- hidden patient welfare cannot be measured, bounded, or ethically defended
  well enough to distinguish harmless proxy movement from harm;
- hospital behavior is governed by a non-additive aggregation rule while the
  additive calculation is still used;
- the declared type/action boundary treats post-policy coding or patient
  selection changes as fixed type merely to avoid calling them response.

## Local verification-stack pass

Idea: the hospital scorecard contract licenses an audit decision: inspect
high score-per-cost and high hidden-harm action traces before treating
readmission score gains as welfare gains.

Layer 1: thought experiments

- Selection mistaken for intervention: a policy removes low-scoring service
  lines from the ranked pool. Aggregate readmissions improve, but continuing
  hospitals do not change behavior. This kills a fixed-type intervention claim
  unless repeated-hospital action traces move.
- Harmful gaming mistaken for real improvement: counted readmissions fall
  because observation-status use rises, while patient symptoms, emergency
  burden, or mortality do not improve. This kills welfare credit from `P`
  alone.
- Harmless proxy repair mistaken for harm: duplicate-record correction lowers
  counted readmissions with no patient-welfare change. This kills the claim
  that every fixed-type proxy intervention is harmful.
- Real improvement mistaken for gaming: follow-up staffing rises, readmissions
  fall, and patient outcomes improve. This kills a harmful-Goodhart label for
  that response channel.

Layer 2: real-world correspondence

Required observable data before the recommendation is licensed:

- repeated hospital identifiers and service-line participation before and
  after policy exposure;
- patient case-mix and exclusion or denominator changes;
- coding, observation-status, discharge-timing, follow-up, referral, and
  patient-selection action traces;
- patient-level hidden outcomes and access outcomes;
- policy details for `w`, thresholds, penalties, audit intensity, and timing;
- some source of variation in exposure, `V`, weights, costs, or audit pressure.

Passed: the recommendation is observable in principle because it asks for
standard audit objects: repeated units, action traces, score rules, and hidden
outcomes.

Survived only barely: the `h` signs and magnitudes may be ethically and
clinically contested; the application can rank audit priorities qualitatively
before estimating welfare in common units, but it cannot claim net welfare
without a defended hidden-value model.

Killed: if these data cannot separate composition from fixed-hospital action
change, the application cannot license intervention claims. It may still say
the score changed, but it cannot say the scorecard induced harmful fixed-type
Goodhart.

Verdict: the narrow surviving claim is a design/audit claim, not a welfare
theorem. A hospital readmission scorecard should not credit score improvement
as patient-welfare improvement until the response channel and hidden-harm
traces have been audited under declared `kappa`, `h`, `gamma`, `w`, and `V`
primitives.
