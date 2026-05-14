# Worked Goodhart model example draft

## Purpose

This is a planning draft for a concrete example of the response-modeling
contract. It is not yet book text or a research iteration. The likely future
use is either:

- a Chapter 5 subsection, e.g. "Worked contract: a hospital scorecard"; or
- a short appendix showing how an informal Goodhart claim becomes a specific
  formal model.

The goal is to show the discipline of the framework: the same informal story can
be selection, harmful intervention, harmless proxy-only manipulation, or real
improvement depending on the declared type space, response channel, action
geometry, hidden welfare model, and evidence.

## Informal claim

Suppose a regulator ranks hospitals by a readmission metric. After the metric is
introduced, measured readmissions improve, but patient welfare does not improve
commensurately.

The underspecified Goodhart claim is:

> The readmission metric caused hospitals to improve their scores without
> improving patient welfare.

As stated, this is not yet a model. It does not say whether the policy selected
different hospitals, changed the same hospitals' behavior, changed reporting,
or induced real care improvements that the hidden welfare measure failed to
capture.

## Type space

Let a hospital's fixed type be

`u = (q, m, r)`,

where:

- `q` is baseline care quality;
- `m` is patient mix or case difficulty;
- `r` is baseline reporting/coding style.

Let `nu(du)` be the baseline distribution over hospital types.

This is a modeling choice. Treating `r` as fixed says that baseline coding style
is part of hospital type for the comparison. If the policy changes coding style,
that change should appear in the response kernel rather than being absorbed
into type. A different application could choose a richer or poorer `U`, but it
must defend that choice.

## State and baseline behavior

Let the observed state be

`s = (P, H, A)`,

where:

- `P` is the measured readmission score or score vector;
- `H` is hidden patient-welfare loss;
- `A` is an action trace, such as coding changes, discharge timing, follow-up
  intensity, or patient selection.

Baseline behavior is a kernel

`K_0(ds | u)`.

This says that even fixed hospital types may have stochastic outcomes: patient
arrival randomness, clinical noise, measurement noise, and ordinary variation
in practice.

## Policy exposure

The regulator announces a ranking or penalty rule indexed by `theta`. A simple
threshold version is:

`selected / rewarded iff P >= t`.

A multidimensional scorecard version is:

`score = w . P`,

with reward or penalty determined by whether `score >= t`.

Let `V` be the private value of clearing the threshold: avoided penalties,
reputation, funding, or managerial attention.

## Response channel

The induced law is

`mu_theta(B) =
  int W_theta(u) K_theta(B | u) nu(du) /
  int W_theta(u) nu(du)`.

There are at least three distinct models.

### Pure selection

The policy changes only participation or weighting:

`K_theta(ds | u) = K_0(ds | u)`,

while `W_theta(u)` changes.

Example: hospitals with bad baseline readmission scores exit the ranked
program, merge, close a service line, or are excluded from the comparison. The
observed distribution improves because the population changed.

### Intervention

The policy changes fixed-type behavior:

`K_theta(ds | u) != K_0(ds | u)`

for a positive-mass set of hospital types.

Example: the same hospital changes coding, discharge timing, follow-up
procedures, or patient selection after the ranking rule is announced.

### Real improvement

The policy also changes fixed-type behavior, but the changed behavior improves
the target rather than merely gaming the metric.

Example: the hospital invests in follow-up care that both lowers readmissions
and improves hidden patient welfare. This is intervention, but not harmful
Goodhart.

## Action geometry

Let a hospital choose action vector

`a = (a_c, a_d, a_f, a_s)`,

where:

- `a_c` is coding or reporting manipulation;
- `a_d` is discharge timing or admission-threshold adjustment;
- `a_f` is real follow-up care;
- `a_s` is patient selection or avoidance.

Let proxy gain be

`p(a) = w_c a_c + w_d a_d + w_f a_f + w_s a_s`.

Let hidden welfare harm be

`h(a) = h_c a_c + h_d a_d - h_f a_f + h_s a_s`.

Here `a_f` can reduce hidden harm, while coding manipulation or patient
avoidance may increase it. This separation is important: proxy movement is not
automatically welfare harm.

A smooth cost model is:

`c(a) = sum_j a_j^2 / (2 kappa_j)`.

A lumpy model is:

`c(a) = sum_j F_j 1{a_j > 0} + sum_j q_j a_j`,

with caps

`0 <= a_j <= u_j`.

The smooth model predicts water-filling or cost-minimal spreading. The lumpy
model predicts thresholds, active-set switches, and spillover after caps bind.

## Gaming condition

For a hospital with score deficit `d > 0`, define the minimum private cost of
buying enough proxy gain:

`m(d) = inf { c(a): p(a) >= d }`.

Gaming is privately feasible when

`m(d) <= V`.

In the quadratic additive case with `p(a) = w . a`,

`m(d) = d^2 / (2 sum_j kappa_j w_j^2)`,

and the cost-minimal action is

`a_j^*(d) = d kappa_j w_j / sum_i kappa_i w_i^2`.

This says that adding a new gameable channel with positive `kappa_j w_j^2`
lowers the cost of clearing the score gap. Whether that is bad depends on the
hidden welfare exchange rate `h_j`, not on score movement alone.

## Formal Goodhart claim

A precise harmful-intervention claim could be:

> The readmission scorecard induces intervention Goodhart if policy exposure
> changes `K_theta(ds | u)` at fixed hospital type, and the induced
> score-improving action has positive hidden harm: `h(a^*(d)) > 0` for a
> relevant set of types or deficits.

This is different from a selection claim:

> The scorecard changes the observed hospital population through `W_theta(u)`,
> while fixed-type behavior remains approximately governed by `K_0`.

It is also different from a real-improvement claim:

> The scorecard changes `K_theta(ds | u)` at fixed type, but the induced action
> mostly routes through `a_f`, so hidden welfare improves rather than worsens.

## Evidence standard

Evidence for pure selection:

- composition of ranked hospitals changes;
- fixed hospitals do not change coding, discharge, follow-up, or patient
  selection behavior after exposure;
- baseline tail response predicts the score change.

Evidence for intervention:

- the same hospitals change behavior after exposure;
- staggered or randomized policy exposure changes behavior;
- action traces move in the directions predicted by low cost or high
  score-per-cost ratios;
- exogenous variation in `V`, costs, caps, or weights shifts behavior as the
  action model predicts.

Evidence for harmful Goodhart:

- score gains are concentrated in actions with `h_j > 0`;
- hidden patient welfare fails to improve or worsens;
- measured readmission gains are explained by coding, discharge timing, or
  patient selection rather than underlying care.

Evidence for real improvement:

- score gains are concentrated in `a_f` or other goal-improving actions;
- hidden patient outcomes improve;
- coding and selection changes do not explain the score movement.

## What this example teaches

The same observed fact, "readmission scores improved after the metric," is
compatible with several mechanisms:

- selection over hospitals;
- harmful intervention;
- harmless proxy-only manipulation;
- real quality improvement;
- mixtures of all of the above.

The response-modeling contract forces the claim to state which mechanism is
being asserted and what evidence would distinguish it from the alternatives.

## Open format questions

This example may be too detailed for the main Chapter 5 flow. Possible final
formats:

1. A short Chapter 5 boxed example with only the contract fields and evidence
   split.
2. A longer appendix with the full action/cost model and gaming condition.
3. Two examples instead of one: a hospital scorecard for institutions and a
   benchmark/reward-model example for ML.

The current draft favors option 2 if the goal is to demonstrate what a fully
declared formal Goodhart model looks like.
