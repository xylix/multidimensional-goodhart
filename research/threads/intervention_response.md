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

## Iteration 5: multidimensional gaming — is balloon-squeezing real, and does adding a measured dimension help?

This rejoins the dimensional thread (`threads/dimensional_dependence.md`) inside the intervention regime, which iteration 4 argued is the regime with teeth. Open question 13.

### 1. Constraints on definitions

The notation must let the agent split gaming effort across several proxy channels with channel-specific costs, let the regulator choose *which* channels it measures (the multidimensional analogue of "add a KPI"), and let the metric aggregate measured channels. It must not bake in a particular aggregation rule — the result will turn out to depend critically on additive vs. conjunctive aggregation, so that choice has to be a visible parameter, not a hidden default.

### 2. Motivation

The motivating "deep Goodhart" story: a regulator fights scalar Goodhart by adding proxy dimensions, and error/harm redistributes rather than disappearing. Iterations 1-3 examined this for *selection*; iteration 4 said selection is the bounded, well-behaved regime. The sharp test is in the *intervention* regime: when agents game, does adding a measured dimension redistribute harm, conserve it, shrink it, or grow it? Open questions 2 (conservation Goodhart) and 13.

### 3. Current pondering

Iteration 4's single-channel gaming toy: agent pays `a^2/(2 kappa)` to inflate `P` by `a`, gets `V` if selected, harm `H = a`, equilibrium gaming wedge `Delta = sqrt(2 kappa V)`. The natural multidimensional lift: `k` channels, agent allocates effort, regulator measures a subset `M` and scores by aggregating it.

### 4. Plausible approaches

- Additive metric, quadratic per-channel costs, deterministic. Solve the agent's cost-minimal allocation by Lagrange multipliers; read off total harm and its dependence on `M`. Cheap, likely closed form.
- Same with a `min`/conjunctive metric. Compare.
- Same with channels that partially serve the true goal (gaming efficiency split into wasteful and useful parts).
- Dynamic: regulator closes a gamed channel each period, agent re-routes. Convergence?

### 5. Approaches not yet considered

- Regulator's *own* optimization: it must measure enough real signal to do its job, but every gameable channel it watches enlarges the attack surface. There may be a real frontier between "measures enough to be informative" and "measures so much it invites gaming". Not solved here; flagged.
- Submodular/supermodular structure of harm in the measured set `M`.

### 6. Counterexample first

A counterexample to "balloon-squeezing is real" would be a model where re-routing which channels are measured strictly *reduces* total gaming harm — e.g. if measured channels differ in how wasteful gaming them is, steering effort onto a low-waste channel cuts `H`. So I expect conservation to hold only when all gaming is equally wasteful; the model should make that assumption explicit and then I should immediately relax it and watch conservation break. A counterexample to "adding a dimension can backfire" would be a conjunctive metric, where a new measured dimension is one more thing the agent is forced to satisfy — that should make harm grow, not shrink and not stay constant. So the headline can't be unconditional in either direction; it has to be indexed by aggregation rule and by gaming-wastefulness.

### 7. Outward pointers

Strategic classification with multiple manipulable features (Hardt et al.); "what gets measured gets gamed" / Campbell's law; balloon analogy in conservation Goodhart (AGENT.md open question 2); water-filling / equalizing-marginal-cost allocations (the Lagrange solution below is a water-filling allocation); KPI-stuffing and "surrogation" in management accounting.

### Toy model: additive metric, quadratic channel costs

`k` gaming channels. Agent (take true quality `Q = 0` for everyone in the base case — pure gaming) allocates effort `a = (a_1, ..., a_k) >= 0`. Gaming channel `j` costs `a_j^2 / (2 kappa_j)` and produces hidden harm `H_j = a_j` (all gaming equally wasteful: `H = sum_j a_j`). The regulator measures a set `M subseteq {1,...,k}` and scores additively: `score = sum_{j in M} a_j` (unit weights for cleanliness). Selection (worth `V`) iff `score >= t`. The agent never games an unmeasured channel (it costs and buys no score), so effectively `a_j = 0` for `j notin M`.

Agent's problem: `min_{a_j >= 0, j in M} sum_{j in M} a_j^2 / (2 kappa_j)` s.t. `sum_{j in M} a_j >= t`, then game iff the min cost is `<= V`.

Lagrange: at the optimum the constraint binds and `a_j / kappa_j = lambda` for all `j in M`, so `a_j = lambda kappa_j` and `lambda sum_{j in M} kappa_j = t`, giving

`lambda = t / K_M`, `K_M := sum_{j in M} kappa_j`,  `a_j = t kappa_j / K_M`.

Minimal cost: `sum_{j in M} (lambda kappa_j)^2 / (2 kappa_j) = (lambda^2 / 2) K_M = t^2 / (2 K_M)`.

So **gaming occurs iff `K_M >= t^2 / (2V)`** (call the RHS `K_min`), and **when it occurs, per-agent hidden harm for this fixed pure-gaming target is `H = sum_{j in M} a_j = lambda K_M = t` — independent of `M`.** What `M` controls is (i) *whether* `K_M` clears `K_min`, and (ii) *how* the fixed per-agent harm `t` is split: proportional to `kappa_j` across the measured channels.

Claim [tentative] (conservation under re-routing, repaired in iteration 6): with a unit-weight additive metric and equally-wasteful gaming per score unit, the regulator cannot reduce per-agent harm for a fixed pure-gaming score deficit by changing *which* channels it measures, as long as the measured set retains enough aggregate gaming capacity (`K_M >= K_min`); the harm is pinned at `H = t` and merely re-routes. Closing a gamed channel just spreads `t` over the others. Toy example: a hospital ranked on readmission rates clamps down on coding of "readmission" — the gaming reappears as patient-selection, discharge timing, observation-status reclassification; the per-case distortion needed to clear the rank cutoff is unchanged.

Claim [tentative] (adding a gameable measured dimension backfires): expanding `M` strictly increases `K_M`, which lowers the gaming cost `t^2 / (2 K_M)`, which (weakly) *enlarges* the population that finds gaming worthwhile. With quality heterogeneity `Q ~ N(0, sigma^2)` (agent needs `score >= t - Q`, cost `(t-Q)^2 / (2 K_M)`, games iff `t - Q <= sqrt(2 K_M V)`), the gaming-eligibility cutoff is `Q >= t - sqrt(2 K_M V)`, which moves *down* as `K_M` grows — more agents game, and the fraction of selected agents who are pure gamers rises. Toy example: a university worried that "publication count" is gamed adds "grant income" and "media mentions" to the scorecard; each is independently inflatable, so the cheapest path to any target score is now cheaper, and more faculty shift from research to portfolio-padding.

Claim [tentative] (the only effective levers are aggregate): in this model the regulator reduces gaming harm only by (a) shrinking aggregate gaming capacity `K_M` below `K_min` — i.e. *narrowing* the measured set to channels that are individually hard to game (small `kappa_j`), or hardening channels (lowering `kappa_j`); (b) raising the bar `t` (but this raises `K_min` too — net effect on the `K_M >= t^2/(2V)` test depends on whether real signal scales with `t`); (c) cutting the prize `V`; or (d) abandoning additive aggregation (next subsection). Shuffling attention between channels of equal hardness does nothing. Toy example: anti-cheating in exams works by making the exam itself hard to game (proctoring, item rotation), not by adding more graded components.

Counterexample attempt / scope: every claim above assumes (1) unit-weight additive aggregation, (2) all gaming equally wasteful per unit score (`H_j = a_j`), (3) a fixed pure-gaming target deficit, and (4) the binding-constraint deterministic regime. Relax (2): let channel `j` also contribute `gamma_j in [0,1]` to the true goal, so `H = sum_j (1 - gamma_j) a_j`. Then `H = sum_{j in M} (1 - gamma_j) t kappa_j / K_M`, which the regulator *can* shrink by steering effort onto high-`gamma` channels (measure the ones where "gaming" is half-real). So conservation is exactly the equally-wasteful-per-score idealization; in reality the regulator's job is partly to choose proxies where the cheapest way to inflate them is also partially the real thing. Relax (3) by adding quality heterogeneity and endogenous participation: aggregate population harm rises with `K_M` because more agents find gaming worthwhile. Relax (4) by adding proxy noise: agents overshoot for a safety margin, so per-gamer `H` rises slightly above the deterministic score deficit, but the re-routing logic remains a first-order guide. Relax (1): see below — it flips.

### Conjunctive metric flips the sign

Suppose instead `score`-passing requires `a_j >= t` for every `j in M` (the regulator demands the agent be good on *all* measured dimensions — a `min`-style or all-of-the-above rule). Then the cost-minimal way to pass is `a_j = t` for all `j in M`, cost `sum_{j in M} t^2 / (2 kappa_j)`, and total harm `H = sum_{j in M} t = t |M|`. Now harm grows *linearly in the number of measured dimensions*, and adding a dimension unambiguously increases gaming harm (and gaming cost, so fewer agents clear it — a genuine tradeoff: harm-per-gamer up, gamer-count down).

Claim [tentative, repaired in iteration 6]: gaming harm's dependence on the number of measured proxy dimensions is governed by the aggregation rule and by harm-per-score exchange rates. Unit-weight compensatory/additive metrics conserve fixed-deficit per-agent harm (`H = t`, re-routing only) only when measured channels are equally harmful per score unit; conjunctive/`min` metrics *multiply* per-gamer harm (`H = t|M|`). Real-world scorecards are often compensatory (weighted sums of KPIs), which is the regime where "just add another metric" can backfire by cheapening the cheapest gaming path and expanding the gaming population. Toy example: a compensatory teacher-evaluation rubric (test scores + observations + surveys, weighted-summed) lets a teacher trade a bad classroom observation against great test scores, so effort flows to whichever component is cheapest to inflate; a conjunctive rubric (must clear a bar on *each*) forces gaming of every component, multiplying the distortion but also failing more teachers.

Counterexample attempt: the conjunctive case as stated ignores that a regulator using a hard `min` over many noisy components will fail almost everyone by chance — in practice "conjunctive" metrics have slack, putting them somewhere between the two regimes. And a weighted-sum metric with very unequal weights behaves locally like a single-channel metric on the heavy-weight component (the agent games only that one until its marginal cost rises) — so "additive" isn't monolithic either; the conservation result used equal weights, and unequal weights make `H` depend on the weight vector. So the clean dichotomy is the two extremes; real metrics live on the interpolation, and *where* on it is itself a regulator design choice with predictable consequences.

### Immediate takeaway

Claim [tentative, repaired in iteration 6]: in the intervention regime, "fight Goodhart by measuring more dimensions" has a precise predicted failure mode that depends on aggregation and exchange rates. Under a compensatory/additive rule, fixed-deficit per-agent harm is conserved only when channels are equally harmful per score unit; adding a new gameable measured channel still *lowers* the cheapest gaming cost and so recruits more gamers — a population-level backfire, not a simple redistribution story. The regulator's real levers are aggregate (shrink total gaming capacity, harden channels, raise the bar relative to real signal, cut the prize) or structural (pick low-harm-per-score proxies whose cheapest inflation is partly real; change weights; or go conjunctive and accept that harm now scales with the number of bars). This is the multidimensional, intervention-regime form of conservation Goodhart (AGENT.md open question 2), but now with an explicit exchange-rate condition. Toy example: the durable lesson from metric-gaming case studies (hospital league tables, school accountability, citation metrics, sales quotas) is that closing one gaming route often reroutes effort to the next-cheapest one; whether that keeps harm roughly constant depends on whether the substitute route is equally damaging per score point.

Counterexample attempt: the model has no dynamics and no regulator learning — a regulator who *adaptively* hardens whichever channel is currently most-gamed is driving `kappa_j -> 0` on the active channels, which in the limit does push `K_M` below `K_min` and stops gaming. So the pessimistic reading ("can't win by re-routing") is a static statement; an adaptive hardening loop can win, slowly, by attrition of gaming capacity rather than by clever choice of what to measure. That dynamic version remains open.

## Iteration 6: adversarial pass on conservation under re-routing

Scheduled adversarial pass. Target claim: iteration 5's additive metric result, summarized too strongly as "total gaming harm `H = t`, independent of `M`; closing a gamed channel only re-routes the fixed total."

### 1. Constraints on definitions

The adversarial pass must distinguish at least four objects that iteration 5 partly collapsed: (i) per-agent harm for a fixed pure-gaming deficit, (ii) aggregate population harm after agents decide whether gaming is worthwhile, (iii) physical effort units `a_j`, and (iv) score units `w_j a_j` after the regulator chooses metric weights. A conservation claim is only meaningful after saying which object is conserved and under which units.

### 2. Motivation

The iteration-5 result is now load-bearing for the "conservation Goodhart" thread. If the conservation statement survives only because the metric was written in unit weights, or because population entry was suppressed, then the framework should say that plainly before building on it.

### 3. Current pondering

The Lagrange calculation itself is sound. The weak point is interpretation: "total harm" was used for the one-agent, pure-gaming target `Q = 0`, where the agent must manufacture exactly score `t`. In the quality-heterogeneous extension, adding a channel changes who enters the gaming band; in a weighted metric, changing weights changes the conversion rate between physical effort and score.

### 4. Plausible approaches

- Re-solve the additive quadratic model with weights `w_j > 0` and harm rates `h_j > 0`.
- Compute the population-level harm in the heterogeneous-`Q` band and test monotonicity in `K_M`.
- Try to find the exact condition under which conservation is not an artifact of units.
- Push to general convex costs only far enough to see whether conservation is exceptional or generic.

### 5. Approaches not yet considered

- Treat metric weights as a choice of units or exchange rates. A scorecard with `2a_1 + a_2 >= t` is not the same target as `a_1 + a_2 >= t`; conservation should be invariant to harmless unit changes but sensitive to real exchange rates.
- Separate private cost minimization from social harm minimization. Agents minimize cost, not harm, so conservation fails whenever cost-cheapest and harm-cheapest directions differ.

### 6. Counterexample first

Weighted additive counterexample. Let score be `sum_{j in M} w_j a_j`, cost `sum_j a_j^2/(2 kappa_j)`, and hidden harm `H = sum_j h_j a_j`. The cost-minimal allocation for score deficit `d` is

`a_j = d kappa_j w_j / W_M`, where `W_M = sum_{i in M} kappa_i w_i^2`,

and its harm is

`H_M(d) = d · (sum_{j in M} h_j kappa_j w_j) / (sum_{j in M} kappa_j w_j^2)`.

This is not invariant in `M`. With two equally easy channels (`kappa_1 = kappa_2 = 1`) and equal physical harm (`h_1 = h_2 = 1`), measuring only channel 1 with `w_1 = 2` gives `H = d/2`; measuring only channel 2 with `w_2 = 1` gives `H = d`; measuring both gives `H = 3d/5`. Re-routing can raise or lower harm depending on score weights. The unit-weight result is the special case `h_j/w_j` constant, not a generic property of additivity.

Population counterexample. In the heterogeneous-quality extension from iteration 5, an agent with deficit `d = t - Q > 0` games iff `d <= sqrt(2 K_M V)`, and the per-agent harm for a gaming agent is `d`, not a fixed `t`. Aggregate gaming harm among the population is

`E[(t-Q) 1{0 < t-Q <= sqrt(2K_M V)}]`.

For any continuous density with positive mass in the newly admitted deficit band, this increases with `K_M`. Thus "adding a gameable channel backfires" is stronger than iteration 5 stated at the population level: it does not merely recruit more gamers while conserving per-gamer harm; it increases aggregate gaming harm over the population. Toy example: adding an easily padded "media impact" category to a faculty scorecard does not just spread the same gaming among existing borderline faculty; it makes padding worthwhile for additional below-threshold faculty.

### 7. Outward pointers

This is the same structure as cost-benefit weighted strategic classification and as isoquant choice in production theory: agents choose the cheapest input bundle for a target output, while social damage is a different linear functional. Conservation appears only when the target output and social damage use the same exchange rates.

### Repair

Claim [tentative]: the correct additive conservation theorem is narrow but real. For a fixed score deficit `d`, quadratic separable costs, and additive score `sum w_j a_j`, per-agent harm is conserved under re-routing **iff** social harm is proportional to score contribution on every available channel (`h_j = c w_j` on the active measured set). Then `H_M(d) = c d`, independent of `M`; otherwise `H_M(d)` depends on `M` through the cost-weighted average above. Toy example: if every point of score inflation is equally socially wasteful no matter which KPI supplies it, re-routing conserves harm; if grant-padding produces less waste per score point than citation-padding, moving weight toward grant-padding can reduce harm.

Claim [tentative]: iteration 5's "adding a dimension backfires" survives the adversarial pass, but its object changes. In the unit-weight equal-harm model, adding a channel keeps fixed-deficit per-agent harm at `d` while lowering gaming cost from `d^2/(2K_M)`; with heterogeneous `Q`, this weakly increases aggregate population harm by enlarging the set of agents for whom gaming is privately worthwhile. Toy example: a school accountability score with extra independently drillable subtests makes the same score gain cheaper; more schools enter the gaming margin.

Claim [tentative]: "re-routing does not reduce harm" should no longer be stated without qualifiers. The defensible version is: re-routing among equally harmful-per-score channels does not reduce fixed-deficit per-agent harm; re-routing across channels with different `h_j/w_j`, changing weights, or changing the participating population can reduce, increase, or conserve harm. This is a better framework result than the original slogan because it identifies the exact exchange-rate condition under which conservation Goodhart is substantive rather than an artifact of unit weights.
