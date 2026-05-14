# Next steps after Iteration 34

This is the active roadmap after the Iteration 34 book integration edit. The
application-template promotion gate is closed: Chapter 6 now includes the
reviewed application discipline, narrowed reusable-template boundary, and
compact hospital/scientific scorecard mappings.

The remaining work should repair reviewed-but-excluded gaps separately. Do not
promote these into theorem, empirical, or policy claims until the relevant
iteration has its own verification pass.

After finishing an iteration, delete the iteration step from this document.

## Iteration 35: adaptive-hardening theorem boundary

Iteration type: `theorem`.

### Purpose

Determine whether the finite-channel adaptive-hardening toy has any convergence
result beyond the reviewed deterministic additive quadratic scorecard.

### Work

1. Start from the Iterations 27-28 reviewed toy and its exact assumptions.
2. State the weakest candidate theorem boundary before proving anything:
   finite channels, separable costs, fixed stakes, deterministic observation,
   fixed measured set, and monotone hardening rule.
3. Test whether convergence survives altered hardening schedules, shared
   bottlenecks, nonseparable costs, or nonconvex response geometry.
4. If the result does not generalize, record the negative result and sharpen
   the non-transfer condition.

### Success condition

A proved theorem, a clearly bounded proposition, or a documented negative
result that prevents future overpromotion of the adaptive-hardening toy.

## Iteration 36: response dynamics beyond the static toy

Iteration type: `modeling`.

### Purpose

Separate the open dynamics claims that Iteration 34 deliberately excluded:
stochastic observation, endogenous stakes, trust decay, and performative
feedback.

### Work

1. Add stochastic observation of response channels and regulator errors.
2. Model endogenous stakes `V` only after specifying the observed harm signal,
   agent forecasts, and regulator update rule.
3. Treat trust decay and performative stakes as response dynamics, not as
   automatic consequences of scorecard gaming.
4. Identify the smallest toy that can fail visibly.

### Success condition

A falsifiable dynamic toy or a negative result showing why the current static
framework cannot license endogenous-stakes claims.

## Iteration 37: empirical auditability of application primitives

Iteration type: `empirical-design`.

### Purpose

Ask whether hospitals or scientific institutions can estimate, bound, defend,
or mark unavailable the audit dimensions before scorecard deployment.

### Work

1. For hospital scorecards, specify feasible predeployment evidence for response
   ease, hidden patient harm/value, signal adequacy, effective weights, and
   stakes.
2. For scientific metrics, specify what evidence could separate selection,
   fixed-researcher response, proxy repair, harmful proxy manufacture, and real
   research-quality improvement.
3. Record which primitives cannot be estimated from available data and what
   design decision follows from that unavailability.

### Success condition

An empirical audit template that changes deployment, monitoring, or evidence
collection without claiming patient-welfare or research-value estimation from
score movement alone.

## Iteration 38: policy only after theorem and empirical repairs

Iteration type: `policy-review`.

### Purpose

Consider policy implications only after the theorem/dynamics/empirical pieces
above exist.

### Work

1. Review which prior iterations produced theorem-level, dynamic, or empirical
   licenses.
2. Exclude policy optimality unless those licenses are strong enough.
3. If policy prose is permitted, keep it tied to concrete design, audit, and
   evidence decisions.

### Success condition

A policy-readiness review that either blocks policy claims or states the narrow
conditions under which they are licensed.
