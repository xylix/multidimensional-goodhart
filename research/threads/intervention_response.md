# Thread: intervention response vs. selection response

## Iteration 4: when the regulator changes `mu` instead of reweighting it

### 1. Constraints on definitions

The notation from iterations 1-3 models a policy as a reweighting of a fixed baseline `mu`: selected law `nu_theta = (W_theta / E_mu[W_theta]) mu`. This forces `nu_theta << mu` (absolute continuity): any event with baseline probability zero stays probability zero, and the only thing a policy can do is move mass that already exists toward high-`P` regions. Causal and adversarial Goodhart (Manheim & Garrabrant's third and fourth flavors) violate exactly this: announcing a metric changes how agents behave, so probability mass appears in parts of state space the baseline never visited.

The next notation must (a) contain the weighted-response operator as a special case, (b) allow `mu_pi` mutually singular with `mu_0`, and (c) make precise which structure is *added* when we leave the selection regime — because that added structure (an agent model, a cost function, an equilibrium concept) is what the baseline distribution cannot see.

### 2. Motivation

Open question 8: how should the framework represent policies that change the baseline distribution, not merely reweight it? This is the boundary the iteration-3 adversarial pass flagged as the next major layer. Without it, the framework only covers regressional and extremal Goodhart.

### 3. Current pondering

Iterations 1-3 built: covariance (infinitesimal Boltzmann velocity) ⊂ threshold response ⊂ weighted response. All three are functionals of `mu` alone. The conjecture is that "causal/adversarial" is not one more operator in this chain but a different object: a *response channel* `R: Theta -> P(S)` mapping policies to distributions, where the selection chain is exactly the sub-class with `R(theta) << mu_0`.

### 4. Plausible approaches

- Define a response channel and classify selection vs. intervention by absolute continuity. Cheap, mostly bookkeeping, but clarifies what iterations 1-3 actually covered.
- Bound hidden drift along a selection channel by reweighting size × hidden variability (Cauchy-Schwarz). Elementary; main value is the *contrast* — show no such bound exists for intervention channels without an agent cost model.
- Build a Stackelberg gaming toy model (linear-Gaussian) where agents pay a quadratic cost to inflate the proxy, solve the equilibrium, read off hidden harm and proxy bias. Medium cost, high payoff: gives a closed form for the "balloon elasticity."
- Connect to strategic classification (Hardt et al.) and performative prediction (Perdomo et al.) as the ML instances. Quick.

### 5. Approaches not yet considered

- Optimal-transport view: intervention moves `mu_0` to `mu_pi` along a transport plan whose cost is the agents' gaming cost; selection is the degenerate "transport" that only deletes/duplicates mass (a reweighting), never relocates it.
- Treat the regulator-agent pair as a repeated game and ask whether the intervention response has a fixed point (performative-stable metric), and whether that fixed point still suffers hidden harm.

### 6. Counterexample first

What would refute "intervention is strictly more than selection"? A setting where agents change their behavior but the resulting `mu_pi` is nonetheless `<< mu_0` and realizable as a reweighting. Concrete case: agents only choose whether to *participate* (apply / submit / enter the pool) but cannot alter their type or measured features. Then `mu_pi` is `mu_0` restricted to the participating set and renormalized — a selection channel. So the selection/intervention distinction is real exactly when agents can *move in state space* (change `(P, H)` for fixed underlying type), not merely toggle their own inclusion. This is the sharp boundary condition, and it tells us where to look for genuine causal Goodhart: features that are cheap to change without changing the thing they were supposed to proxy.

### 7. Outward pointers

Manheim & Garrabrant causal/adversarial Goodhart; strategic classification (Hardt, Megiddo, Papadimitriou, Wootters 2016); performative prediction (Perdomo, Zrnic, Mendler-Dünner, Hardt 2020); Stackelberg games; Le Cam's lemma / TV-bounded perturbations; optimal transport vs. reweighting; Campbell's law and the "teaching to the test" literature.

## Response channels

Let `(S, F)` be a measurable state space, `mu_0` the baseline law, `H: S -> R^d` hidden goal coordinates, `P: S -> R` a scalar proxy, and `phi` the regulator's intended model `P ≈ phi(G)`. A **response channel** is a map

`R: Theta -> P(S)`, `theta |-> mu_theta`,

with `mu_{theta_0} = mu_0` for some null policy `theta_0`. Hidden drift along the channel:

`B_H(theta) = E_{mu_theta}[H] - E_{mu_0}[H]`.

Definition. `R` is a **selection channel** if `mu_theta << mu_0` for all `theta`, in which case `L_theta := d mu_theta / d mu_0` exists and `mu_theta` is the reweighting of `mu_0` by `L_theta`. Otherwise `R` is an **intervention channel**.

Claim [tentative]: the entire iteration-1-to-3 apparatus — covariance, threshold response `b_H(t)`, weighted response `B_H(theta)` with weight `W_theta` — is the selection-channel case, with `L_theta = W_theta / E_{mu_0}[W_theta]`. Toy example: choosing which of a fixed applicant pool to admit is a selection channel; the admitted class is the pool reweighted by an admission indicator.

Counterexample attempt: this is essentially a definition, so the only failure mode is mislabeling. Edge case: a channel can be `<< mu_0` yet so concentrated (likelihood ratio unbounded) that it behaves like a near-singular intervention — e.g., selecting the single top scorer. That is still a selection channel; the relevant quantitative knob is the size of `L_theta`, handled next.

## A drift bound for selection channels (and why intervention has none)

Selection channel, `L_theta = d mu_theta / d mu_0`. By Cauchy-Schwarz in `L^2(mu_0)`, for each hidden coordinate `H_i`,

`|B_{H_i}(theta)| = |E_{mu_0}[(L_theta - 1)(H_i - E_{mu_0} H_i)]| <= ||L_theta - 1||_{L^2(mu_0)} · ||H_i - E_{mu_0} H_i||_{L^2(mu_0)}`.

So with `delta := ||L_theta - 1||_{L^2(mu_0)}` (a "reweighting budget", related to chi-square divergence `chi^2(mu_theta || mu_0) = delta^2`) and `s_i := sd_{mu_0}(H_i)`,

`|B_{H_i}(theta)| <= delta · s_i`,  `||B_H(theta)||_2 <= delta · ||s||_2`.

Claim [tentative]: under a selection channel, hidden Goodhart drift is controlled by two things that *are* visible in the baseline distribution: how hard you reweight (`delta`) and how variable the hidden coordinates are (`s`). If hidden coordinates have bounded baseline variance and the policy has bounded reweighting budget, hidden drift is bounded — full stop. Toy example: promoting the top 30% by a noisy score moves any baseline-low-variance hidden trait by at most a fixed amount no matter how many hidden dimensions there are; the `sqrt(d)` growth from iteration 1 is exactly the `||s||_2` term, and it is the *only* way dimension enters.

Counterexample attempt: the bound is vacuous when `delta` is large (extreme selection, e.g. top-`1/n`) — there `delta` can grow with sample size and the bound says little. It is also a worst-case bound, not the actual drift, which is the inner product, not the norm product. So it is a sanity envelope, not a prediction. Still, the *structural* point survives: every term on the right is a `mu_0`-functional.

Claim [tentative]: no analogous a-priori bound exists for an intervention channel, because `mu_theta` can be mutually singular with `mu_0` (`L_theta` does not exist), so there is nothing playing the role of `delta`. Any bound on intervention drift must instead be imported from the agent side — a feasibility set or cost function describing what re-arrangements of probability mass agents can afford. The next section computes such a bound in a toy model and shows the controlling quantity (`Delta = sqrt(2 kappa V)` below) is exogenous to `mu_0`. Toy example: how far a school accountability metric is gamed depends on how cheap it is to drill test format and how much funding rides on the score — neither is recoverable from last year's pre-policy score distribution.

Red-flag note: this bound is elementary (one line of Cauchy-Schwarz). Logged in `red_flags.md` as a watch item — the content claim is the *contrast*, not the inequality, and the contrast should not be over-sold as a theorem.

## Toy model: linear-Gaussian Stackelberg gaming (an intervention channel)

A continuum of agents, agent type = true quality `Q ~ N(0, sigma_Q^2)`. True scalar goal `G = Q`. There is a hidden coordinate `H` = "gaming externality" (effort spent corrupting the proxy rather than improving `Q` — teaching-to-the-test, metric-specific optimization, Campbell's-law distortion). The regulator's model is `phi(Q) = Q`, i.e. it believes `P ≈ Q`.

Baseline channel `mu_0` (metric not announced / not gameable): agent does nothing special, `P_0 = Q + eps`, `eps ~ N(0, sigma_eps^2)` independent, and `H_0 ≡ 0`. So `mu_0` is supported on the plane `{H = 0}` in `(Q, P, H)`-space.

Intervention channel (metric announced, agents best-respond — Stackelberg, regulator commits first): regulator picks threshold policy `A_t = {P >= t}`; selection is worth `V > 0` to an agent. Agent of type `Q` chooses gaming effort `a >= 0`, giving `P = Q + a + eps`, at private cost `c(a) = a^2 / (2 kappa)` (`kappa > 0` = ease of gaming), and incurring hidden externality `H = a`. Agent maximizes `V · Pr(Q + a + eps >= t) - a^2/(2 kappa)`.

### Noiseless cut (`sigma_eps = 0`)

Selection is `Q + a >= t`. An agent with `Q >= t` sets `a = 0` (already selected). An agent with `Q < t` either games to exactly `a = t - Q` (cost `(t - Q)^2 / (2 kappa)`, gets `V`) or sets `a = 0` (gets `0`). Gaming is worth it iff `(t - Q)^2 / (2 kappa) <= V`, i.e.

`t - Q <= Delta`, where `Delta := sqrt(2 kappa V)`.

So the best response is `a*(Q) = (t - Q) · 1{t - Delta <= Q < t}`, and the selected set is `{Q >= t - Delta}`.

Consequences, compared to the *selection* counterfactual where agents cannot game and the regulator thresholds `P = Q` at the same nominal `t` (selected set `{Q >= t}`, `H ≡ 0`):

1. **Proxy bias / "the metric lies".** The regulator believes selection ⇒ `P >= t` ⇒ (under `phi`) `Q >= t`. Actually `Q` among the selected ranges down to `t - Delta`. Worst-case bias is exactly `Delta`; the proxy-to-goal gap `epsilon = P - phi(G) = a` is no longer noise — it is a deliberate wedge of size up to `Delta`.

2. **Hidden harm appears at order `Delta`.** `E[H | selected] = E[(t - Q) · 1{t - Delta <= Q < t}] / Pr(Q >= t - Delta)`, strictly positive, monotone increasing in `Delta = sqrt(2 kappa V)`. In the selection regime `H` is *identically zero* in this model — there is no gaming channel, and selection on `P = Q` cannot move a coordinate that is deterministically zero (consistent with the iteration-1 bound: `s_H = 0` ⇒ `B_H = 0`). The harm is created entirely by the intervention.

3. **The controlling quantity is not a `mu_0`-functional.** `Delta` depends on `kappa` (technological ease of gaming) and `V` (stakes), neither visible in the baseline `(Q, P_0, H_0)` law. This instantiates the claim above: intervention drift is bounded by the agent's cost-benefit ratio, not by any reweighting budget.

4. **Why this is not a selection channel.** `mu_0` lives on `{H = 0}`; the post-intervention joint law puts positive mass on `{H > 0}` (the gamers, a set of types of positive measure map to `a > 0`). The two laws are mutually singular in the `(Q, H)`-marginal — there is no `L_theta`. The state was *transported* (each gamer's `(P, H)` moved off the baseline locus), not reweighted.

Claim [tentative]: in a Stackelberg gaming model with quadratic gaming cost `a^2/(2kappa)` and selection value `V`, the metric's worst-case bias and the induced hidden harm both scale with `Delta = sqrt(2 kappa V)` — the square root of (ease of gaming × stakes) — and this regime is invisible to, and unbounded by, the baseline distribution. Toy example: doubling the funding tied to a test score multiplies the gaming wedge by `sqrt(2)`; halving the cost of test-prep drilling does the same.

Counterexample attempt: the quadratic cost is a modeling choice; a cost with a hard cap `a <= a_max` would bound gaming at `a_max` regardless of `V`, and a cost that is *cheaper at the margin for high-`Q` agents* (the able game more easily) would skew who games. So `Delta = sqrt(2kappa V)` is the quadratic-cost signature, not a universal law — but the qualitative point (a positive-measure set of agents leaves the `H = 0` locus, drift is set by agent economics) is robust to the cost shape. Also: if `V` is itself endogenous (selection is only valuable if the metric is trusted, and trust erodes as gaming is observed) there is a feedback loop not modeled here — flagged for the repeated-game extension.

### Noisy refinement (`sigma_eps > 0`), sketch only

With Gaussian proxy noise, `Pr(selected | Q, a) = 1 - Phi((t - Q - a)/sigma_eps)`, smooth in `a`, so the best response is interior everywhere:

`a*(Q) = (kappa V / sigma_eps) · varphi((t - Q - a*(Q)) / sigma_eps)`  (implicit; RHS is the marginal selection probability gain).

Every agent games a little, `a*(Q) > 0` for all `Q`, peaking near `Q ≈ t - a*` and decaying in `|Q - (t - a*)|`. Hidden harm `E[H | selected] = E[a*(Q) | selected] > 0` for every threshold. The hard-threshold version is the `sigma_eps -> 0` limit (gaming concentrates on the band `[t - Delta, t)`). Not derived in full here — the implicit equation is enough to see the qualitative picture and to note that noise *spreads* gaming across the whole population rather than removing it.

## Immediate takeaway

Claim [tentative]: the right top-level object is a *response channel* `R: Theta -> P(S)`. It splits into **selection channels** (`mu_theta << mu_0`; all of iterations 1-3 live here; hidden drift `<= delta · ||s||_2`, every term a baseline functional) and **intervention channels** (`mu_theta` can be singular w.r.t. `mu_0`; no baseline bound; the drift bound, if any, comes from an agent cost model — e.g. `Delta = sqrt(2 kappa V)` in the quadratic-gaming case). The selection/intervention boundary is sharp: it is non-trivial exactly when agents can move in state space rather than only choose their own inclusion. Causal Goodhart = intervention channel that breaks `P ≈ phi(G)` structurally; adversarial Goodhart = intervention channel where `pi` is chosen worst-case for the regulator. Toy example: which students to admit from a pool = selection channel; announcing the admissions formula and watching applicant behavior change = intervention channel, with gaming intensity set by test-prep economics, not by last year's score distribution.

Counterexample attempt: if essentially all real Goodhart is intervention (everything adapts), the selection layer is a toy and the `delta · ||s||_2` bound is rarely the binding constraint. Rebuttal: regressional and extremal Goodhart are genuine selection effects (cross-validation overfitting, order-statistic inflation) and occur even against non-adaptive nature; the selection layer is not empty. But the framework should not present the bounded selection regime as the typical case — the unbounded intervention regime is where the "deep Goodhart" story has teeth, and it requires the extra agent-model structure to say anything quantitative.
