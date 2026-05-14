# Application template: response-modeling contract

Iteration type: `application-mapping`

## Purpose

Use this template when mapping the response-modeling framework to a concrete
scorecard, benchmark, institutional incentive, or audit setting. The artifact
should change a design, audit, or evidence-collection decision. If it only
classifies a Goodhart story after the fact, the mapping has failed.

## Contract fields

### 1. Type space

Declare `U`, the baseline type law `nu`, and why these features are treated as
fixed for the comparison. State what would be action or response rather than
type. [tentative]

Counterexample check: if a richer `U` could encode the future policy response
as "type," explain why that representation would make the application
unfalsifiable or answer a different question.

### 2. State and baseline behavior

Declare the observed state `s in S` and baseline kernel `K_0(ds | u)`. Include
ordinary stochastic variation, measurement noise, and baseline action traces
when they matter.

### 3. Policy exposure

Name the score, ranking, threshold, prize, penalty, feedback, or public
comparison indexed by `theta`. Say who observes it and what private value or
pressure it creates.

### 4. Selection versus fixed-type response channel

Use the response law

`mu_theta(B) = int W_theta(u) K_theta(B | u) nu(du) / int W_theta(u) nu(du)`.

State whether the candidate mechanism is:

- pure selection: `W_theta` changes and `K_theta = K_0`;
- fixed-type response: `K_theta != K_0` on a positive-mass set of types;
- a mixture where neither channel can be collapsed without losing the target
  question.

### 5. Action/search geometry

For fixed-type response, declare the action space, feasible movement,
constraints, search prior, fixed charges, caps, smooth costs, or detection
risks. If no action geometry is available, do not import intervention
calculations.

### 6. Proxy/target relation

Declare the proxy `P`, target or protected quantity `G`/`H`, and the intended
relation `P approx phi(G)`. Separate the dimension gap from measurement error
where relevant.

### 7. Aggregation rule

State how multiple proxy components are combined: additive weighted score,
threshold, conjunctive gate, Pareto frontier, lexicographic rule, or other
aggregation. Include the weights, threshold contributions, and unit conventions
that matter for incentives.

### 8. Hidden harm/value model

Declare the hidden harm or value functional before evaluating welfare. This may
be a linear exchange-rate model, a patient/person-level welfare model, a regret
metric, or a qualitative sign table. Proxy movement alone is not welfare
movement. [tentative]

Toy example: an institution can improve a reporting proxy by correcting stale
records; this changes `K_theta` and `P` but may leave hidden harm unchanged.

### 9. Qualitative frontier primitives

Before recommending design or audit changes, declare:

- `kappa`: relative ease, elasticity, or accessibility of moving each response
  channel;
- `h`: hidden harm/value exchange rate for each response channel;
- `gamma`: signal adequacy or information value of adding, keeping, or
  hardening a proxy component;
- `w`: score weights, threshold contributions, or aggregation leverage;
- `V`: private value of clearing the ranking, penalty, prize, reputation, or
  funding threshold.

If these cannot be estimated, bounded, or defended before deployment, the
frontier calculation is not licensed.

### 10. Evidence standard

Name observations that distinguish selection from fixed-type response and
harmful response from harmless proxy movement or real improvement. Prefer
repeated-type observations, staggered exposure, action traces, exogenous
variation in `V`, costs, weights, caps, or direct hidden-outcome evidence.

### 11. Licensed calculation

Name the calculation the contract licenses, if any. Examples include a
selection response curve, a chi-square/value-weighted selection bound, a
convex score-deficit budget, an active-set comparison, or an exchange-rate
condition. State the hypotheses that make the calculation legal.

Default diagnostic for additive quadratic fixed-type response:

`m(d) = d^2 / (2 sum_j kappa_j w_j^2)`,

`a_j^*(d) = d kappa_j w_j / sum_i kappa_i w_i^2`.

Use this as a diagnostic for declared primitives, not as an empirical estimate.

### 12. Changed design or audit decision

State the changed decision in operational terms. Examples:

- audit action traces ranked by score gain per private cost and hidden harm;
- add or harden a scorecard component only if `gamma` justifies the added
  attack-surface risk through `kappa`, `h`, `w`, and `V`;
- change aggregation when predicted substitution moves effort into high-harm
  channels;
- collect repeated fixed-type data before attributing score movement to welfare
  improvement.

### 13. Discriminator observation

Name at least one observation that would favor this contract over a nearby
alternative. This must be more specific than "the score changed."

### 14. contract-failure condition

State what would make this the wrong decomposition, not merely a wrong
parameter estimate. Examples:

- the declared fixed type is unstable in exactly the dimensions used by the
  analysis;
- the apparent action traces are fully explained by population reweighting;
- the hidden target cannot be measured or defended well enough to classify
  harm;
- the qualitative primitives are chosen only after seeing the score movement;
- the aggregation rule used by agents differs from the declared rule.

## Local verification pass

For any application claim that changes a decision, run at least:

Layer 1: thought experiments
- List counter-scenarios that would expose misclassification of selection as
  intervention, harmful gaming as real improvement, or harmless proxy movement
  as welfare harm.

Layer 2: real-world correspondence
- List the observable data required before the recommendation is licensed.
- Say which missing observation would stop the application from changing
  design, audit, or evidence collection.

Verdict:
- Name the narrow surviving claim, or state that the application remains only a
  classification exercise.
