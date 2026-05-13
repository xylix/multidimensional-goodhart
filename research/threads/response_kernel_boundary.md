# Thread: response-kernel boundary between selection and intervention

Iteration type: `generate`

## 1. Constraints on definitions

The old response-channel split used an induced law `mu_theta` on state space
`S`: selection meant `mu_theta << mu_0`, while intervention meant possible
singularity. That is useful for the drift bound, but it is not the causal
boundary. The definition must:

- preserve the weighted-selection apparatus as the pure reweighting case;
- distinguish participation/filtering from action at fixed type;
- handle the epsilon-baseline case, where gaming-like behavior already has
  small baseline mass, so `mu_theta << mu_0` may still hold after behavior
  changes;
- make clear that the distinction is relative to a declared type/action
  representation, not a representation-free fact about the induced law alone.

## 2. Motivation

Open questions 8 and 12 both ask for the same missing object. The framework
needs to know when a metric merely selects from a fixed population and when it
changes what a member of that population does. The selection-channel drift bound
uses only baseline functionals. The intervention examples use agent cost
geometry. The boundary between those regimes should therefore be stated at the
level where "agent can respond" is visible.

## 3. Current pondering

The useful repair is to introduce latent type `U` and a policy-indexed response
kernel

`K_theta(ds | u)`

from type space `U` to observed state space `S`. With baseline type law `nu`,
the induced state law is

`mu_theta(A) = integral K_theta(A | u) nu(du)`.

If the policy also changes which types participate, write a participation or
selection weight `W_theta(u) >= 0` and

`mu_theta(A) =
  integral W_theta(u) K_theta(A | u) nu(du) /
  integral W_theta(u) nu(du)`.

This separates two operations that the induced law alone can conflate:

- reweighting types, through `W_theta`;
- changing fixed-type behavior, through `K_theta`.

## 4. Plausible approaches

1. Define pure selection as `K_theta = K_0` `nu`-almost surely, with policy
   dependence only through `W_theta`. This recovers weighted selection on the
   richer type space.
2. Define intervention as `K_theta != K_0` on a positive-`nu` set of types.
   Then behavior changes at fixed type are intervention even if the resulting
   `mu_theta` is absolutely continuous with respect to `mu_0`.
3. Treat singularity of induced laws as a diagnostic, not a definition:
   `mu_theta` singular to `mu_0` proves pure selection on `S` cannot explain the
   response, but absolute continuity does not prove pure selection.
4. Record representation relativity: the type space `U` must be substantively
   declared. If `U` is allowed to include each agent's entire future response,
   every intervention can be redescribed as selection over richer types.

## 5. Approaches not yet considered

- Causal graphical version: `theta -> A -> (P, H)` at fixed `U` is intervention;
  `theta -> selected? <- U` with no arrow into `(P, H)` is selection.
- Optimal transport version: a kernel change is a transport plan conditional on
  type; pure selection is only deletion/duplication of existing type-conditional
  outcomes.
- Identifiability version: observational `mu_theta` data alone cannot generally
  identify whether a change came from `W_theta` or `K_theta`; experiments or
  type-level observations are needed.

## 6. Counterexample first

Counterexample to "absolute continuity is the boundary":

Let type `u` be true quality, and let baseline behavior have

`K_0(H = 0 | u) = 1 - epsilon`,
`K_0(H = 1 | u) = epsilon`.

After the metric is announced, agents of many types switch to gaming:

`K_theta(H = 1 | u) = p_theta(u)`,

where `epsilon < p_theta(u) < 1`. The induced law remains absolutely continuous
with respect to the baseline on the finite state space `{H = 0, H = 1}`. But the
policy changed behavior at fixed type. Calling this selection would erase the
causal fact that gaming became more attractive.

Counterexample to "any agent choice is intervention":

Agents may choose whether to participate, but if they participate their
observable state is drawn from the same `K_0(ds | u)` as before. Then
`W_theta(u)` changes, but `K_theta = K_0`. This is selection over types, not an
intervention into their measured or hidden features.

Counterexample to "kernel equality is representation-free":

If type `U` is redefined to include the whole policy-contingent response plan,
then `K_theta` can be made constant and all policy effects become selection over
types. Conversely, if `U` is too coarse, ordinary heterogeneity can look like a
kernel change. The framework must declare the type representation as part of
the model. The best interpretation is causal: `U` contains the agent attributes
the principal is treating as fixed for the comparison, not future choices made
because of the metric.

## 7. Outward pointers

Strategic classification models distinguish features agents can manipulate from
underlying labels. Performative prediction distinguishes a deployed predictor
from the distribution it induces. Principal-agent models distinguish type,
action, output, and selection. The response-kernel notation is the minimal
version of that distinction needed here.

## Response-kernel classification

Let `(U, G)` be a type space, `(S, F)` an observed state space, and `nu` a
baseline law over types. For each policy `theta`, let `W_theta: U -> R_+` be a
participation/selection weight and let `K_theta(ds | u)` be a Markov kernel from
types to observed states. The induced law is

`mu_theta(A) =
  integral W_theta(u) K_theta(A | u) nu(du) /
  integral W_theta(u) nu(du)`.

The null policy has `W_0 = 1` and `K_0`.

Definition [tentative]: a response channel is **pure selection relative to
`(U, K_0)`** if `K_theta = K_0` for `nu`-almost every type and all policy effects
enter through `W_theta`. It is an **intervention relative to `(U, K_0)`** if
`K_theta != K_0` on a positive-`nu` set of types.

Claim [tentative]: pure selection implies the selected law is a reweighting of
the baseline joint law on `(u, s)`. If

`m_0(du, ds) = nu(du) K_0(ds | u)`,

then

`m_theta(du, ds) =
  W_theta(u) m_0(du, ds) / E_nu[W_theta]`,

so `m_theta << m_0` and the Cauchy-Schwarz selection bound applies to hidden
functions of `(u, s)`.

Toy example: a grant agency changes the score cutoff for a fixed applicant
pool. Applicants do not revise proposals; the agency only reweights which types
are funded. This is pure selection.

Claim [tentative]: if `K_theta` changes at fixed type, the induced law may or
may not be singular with respect to `mu_0`; either way, the causal response is
intervention. Bounds on hidden drift must use information about the action
kernel, costs, feasible movements, or incentives, not only baseline variance and
selection depth.

Toy example: a school accountability metric increases the probability that a
school of fixed underlying quality drills test format rather than teaches the
underlying skill. Whether such drilling had tiny baseline probability is
irrelevant to the causal classification.

## Four toy cases

### 1. Participation-only response

Types are applicants. `K_0(ds | u)` gives an application file. A policy changes
who applies: `W_theta(u)` increases for high-score types and decreases for
low-score types, but submitted files are unchanged conditional on type.

Classification: pure selection. The hidden drift is about which types enter the
pool. Baseline response curves and reweighting bounds are relevant.

### 2. Epsilon-baseline gaming

Type `u` is underlying quality. State `s = (P, H)` records proxy score and
gaming harm. Baseline has `P = u + H` with `H in {0, 1}` and
`Pr(H = 1 | u) = epsilon`. After the metric, `Pr_theta(H = 1 | u) = p_theta(u)`.

Classification: intervention. On the finite state space, the induced law is
absolutely continuous whenever `epsilon > 0`, but the policy changed the
fixed-type behavior kernel.

### 3. Proxy-only manipulation

Type `u` includes true quality and hidden welfare. Agents can change `P` at
fixed `H`, e.g. formatting a resume to match a parser without changing skill or
hidden harm.

Classification: intervention for proxy validity, but not necessarily harmful in
`H`. This separates "metric no longer tracks `G`" from "hidden harm increases".
The framework should not assume every kernel change is bad.

### 4. Submanifold-limited action

Type `u` is fixed quality. Agents choose actions `a` from a feasible set
`A(u, theta)`, and state is `s = T(u, a)`. The kernel `K_theta` is supported on
the image of `T(u, A(u, theta))`.

Classification: intervention. The relevant bound depends on feasible directions
and costs. This is the bridge to the convex-cost and fixed-charge models: they
are not just different induced laws, but different conditional movement
geometries.

## What this licenses

Claim [tentative]: the selection/intervention split is best stated relative to a
declared causal type representation. Pure selection reweights fixed
type-conditional behavior; intervention changes fixed-type behavior. Absolute
continuity is a property of induced laws and remains useful for the selection
bound, but it is not the causal boundary.

What this does *not* license:

- It does not make the boundary identifiable from `mu_theta` alone.
- It does not remove the need to choose a defensible type space `U`.
- It does not imply every intervention is harmful.
- It does not yet give the convex-cost intervention bound; it only says what
  object such a bound should condition on.

## Verification-stack pass

Idea: classify response channels by fixed-type response kernels rather than by
absolute continuity of induced laws.

Layer 1: thought experiments
- Passed: participation-only response is selection because `K_theta = K_0` and
  only `W_theta` changes.
- Passed: epsilon-baseline gaming is intervention even though `mu_theta << mu_0`
  on the observed finite state space.
- Passed: proxy-only manipulation is intervention but not necessarily hidden
  harm, preventing the definition from smuggling in a welfare conclusion.
- Survived only barely: representation changes can trivialize the distinction.
  The repair is to state all claims relative to a declared type/action model.

Layer 2: real-world correspondence
- Passed: strategic classification and principal-agent models already separate
  underlying type from manipulable features/actions.
- Passed: performative prediction treats the deployed policy as changing the
  data-generating distribution, matching kernel change.
- Survived only barely: in many empirical settings, type is latent and hard to
  observe, so the distinction is conceptually right but empirically demanding.

Layer 3: simulation
- Ready: simulate a finite type/action model where `epsilon > 0`, show
  `mu_theta << mu_0`, and compare a baseline-only reweighting explanation to a
  cost-based action-kernel explanation.
- Ready: simulate participation-only response with identical induced score
  shifts but no fixed-type action change.

Layer 4: implementation
- Premature: real tests need repeated observations of the same type, randomized
  policy exposure, or direct action traces. Induced score distributions alone
  cannot distinguish `W_theta` from `K_theta`.

Verdict: the response-kernel definition survives as a cleaner organizing
primitive, with the important caveat that it is representation-relative and not
generally identifiable from marginal distributions alone.
