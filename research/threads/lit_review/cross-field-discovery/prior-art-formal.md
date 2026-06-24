# Prior-art discovery — formal-math / statistics side (Task 03)

Discovery + preliminary mapping only. **Verification of every exact statement,
proposition number, and constant is Task 08.** Statements below are recorded as
found via WebSearch/WebFetch + OpenAlex; treat them as discovery-grade until
primary-source verified. Paywalled items flagged `[PAYWALL]`.

Boundary with Track A (stated once, applied throughout): this file is the
**shared discovery** that Track A's per-theorem reviews consume. Track A owns the
**verdict / reframe** per theorem —
`plans/litrev-selection-bounds.md` (T1/T2), `plans/litrev-convex-budget.md` (T4),
`plans/litrev-lower-tier.md` (L1–L4). This file lists candidate native homes and
maps them; it does **not** issue the per-theorem novelty verdict. Where Track A
already established a hypothesis, it is marked **[Track A hypothesis — harvested]**
and not re-derived. The gap paper (Track B) cites Track A for the math and claims
only the *citation gap* per family.

Book theorems referenced (from `plans/litrev-*` and `research/core-math.md`):
- **T1** (selection bound, scalar): for pure selection μ_θ ≪ μ_0, L = dμ_θ/dμ_0,
  δ = ‖L−1‖_{L²(μ_0)} = √(χ²(μ_θ‖μ_0)), hidden H_i with baseline sd s_i:
  |E_{μ_θ}[H_i] − E_{μ_0}[H_i]| ≤ δ·s_i.
- **T2** (operator/value-weighted form): |v·B_H| ≤ δ·√(vᵀΣ_H v), support-function
  sup over a declared value unit ball.
- **T4** (convex score-deficit budget): m(d) = inf_a{ c(a) : w·a ≥ d } =
  sup_{λ≥0}[ λd − c*(λw) ]; gaming feasible iff m(d) ≤ V.
- Lower tier: **L1** selection/intervention non-identifiability; **L2**
  covariance-as-local-velocity / exponential tilt; **L3** (T3) below-threshold
  gaming wedge t−Q ≤ √(2κV); **L4** (T6) adaptive-hardening boundary.

---

## HEADLINE FINDING (the suspect negative is overturned)

The internal map's "no χ² analogue exists" for T1/T2 is a **false negative**. T1
**is** the Hammersley–Chapman–Robbins (HCR) inequality rearranged, and T2 **is**
its standard **multivariate (matrix) form**. Independently, the same envelope is
the textbook **Pearson-χ²-DRO worst-case mean = baseline mean + √(radius)·sd**.
Two independent classical homes (estimation theory and DRO) converge on the
identical inequality — the "double exposure" the selection-bounds plan
anticipated. **Chapman–Robbins / χ²-DRO home for T1/T2: CONFIRMED.** Details and
the exact matrix coincidence with T2 are in Area A.

---

## AREA A — Estimation theory (T1/T2 primary home)

### A1. Hammersley–Chapman–Robbins (HCR) inequality — scalar form
- **Citation.** D.G. Chapman & H. Robbins, "Minimum variance estimation without
  regularity assumptions," *Ann. Math. Statist.* 22(4):581–586 (1951); J.M.
  Hammersley, "On estimating restricted parameters," *J. Roy. Statist. Soc. B*
  12(2):192–240 (1950). Independent discoveries.
- **Statement.** For any statistic/estimator ĝ and parameters θ, θ′:
  Var_θ[ĝ] ≥ sup_{θ′≠θ} (E_{θ′}[ĝ] − E_θ[ĝ])² / χ²(μ_{θ′}‖μ_θ).
  Equivalently, rearranged for a single pair:
  **|E_{μ_θ′}[ĝ] − E_{μ_θ}[ĝ]| ≤ √(Var_{μ_θ}[ĝ]) · √(χ²(μ_θ′‖μ_θ))**.
- **Mapping → T1 (exact).** Take ĝ = H_i, baseline μ_θ = μ_0, shifted μ_θ′ = μ_θ,
  Var_{μ_0}[H_i] = s_i², δ = √(χ²(μ_θ‖μ_0)). The rearranged HCR is verbatim
  |ΔE[H_i]| ≤ δ·s_i = **T1**. The book's δ = ‖L−1‖_{L²(μ_0)} is literally
  √χ²: ‖L−1‖²_{L²(μ_0)} = E_{μ_0}[(L−1)²] = χ²(μ_θ‖μ_0) by definition.
- **Mapping → relation to Cramér–Rao.** As θ′→θ the HCR sup → Cramér–Rao (χ²
  → Fisher information × dθ²). HCR is the *finite-perturbation* CR; the book's
  "finite-pressure drift" framing (see L2) is the same finite-vs-infinitesimal
  distinction. HCR holds under far weaker (no differentiability) regularity.
- **Source / how found.** WebSearch "Hammersley-Chapman-Robbins chi-square";
  WebFetch en.wikipedia.org/wiki/Chapman–Robbins_bound; MIT 6.441/Polyanskiy
  *Information Theory* lecture notes §29.1 (people.lids.mit.edu/yp,
  `LN_stats.pdf`) — [text extraction failed, flagged for Task 08 re-pull].
- **Track A overlap.** **[Track A hypothesis — harvested]**: selection-bounds plan
  already named HCR as the suspected home and the δ=√χ² identity. **Confirmed
  here, not re-claimed.** Track A owns the T1=HCR verdict.

### A2. Hammersley–Chapman–Robbins — multivariate / matrix form
- **Citation.** Same HCR lineage; multivariate statement standard in modern
  treatments (e.g. Polyanskiy–Wu *Information Theory* notes; Wikipedia
  multivariate section).
- **Statement.** For vector estimator ĝ: Ω→ℝᵐ,
  χ²(μ_{θ′}‖μ_θ) ≥ (E_{θ′}[ĝ] − E_θ[ĝ])ᵀ Cov_θ[ĝ]⁻¹ (E_{θ′}[ĝ] − E_θ[ĝ]).
  Rearranged: (Δμ)ᵀ Σ⁻¹ (Δμ) ≤ χ², i.e. the mean-shift vector lies in the
  Σ-ellipsoid of radius √χ².
- **Mapping → T2 (exact).** The book's operator form |v·B_H| ≤ δ·√(vᵀΣ_H v) is the
  **support-function reading of this exact ellipsoid**: sup over v in the
  declared value unit-ball of v·B_H, where B_H is constrained to the Σ_H-ellipsoid
  of radius δ, gives precisely δ·√(vᵀΣ_H v). The matrix HCR *is* T2's feasible set;
  T2's contribution is the value-norm support-function packaging, not the bound.
- **Source / how found.** WebFetch Wikipedia (multivariate form quoted verbatim);
  cross-checked phrasing in arXiv:1907.00288.
- **Track A overlap.** Extends Track A's hypothesis: Track A flagged the multidim
  operator form as possibly the only *unstated* piece. This locates its classical
  skeleton (matrix HCR ellipsoid). **Flag for Track A:** the support-function /
  declared-value-norm wrapper may be the residual novelty after the ellipsoid is
  credited; that determination is Track A's, not made here.

### A3. Cramér–Rao bound (infinitesimal limit)
- **Citation.** Rao (1945); Cramér (1946). Standard.
- **Statement.** Var_θ(ĝ) ≥ (∂_θ E_θ[ĝ])² / I(θ), I = Fisher information.
- **Mapping.** The θ′→θ limit of A1; the *local* version of T1's envelope.
  Relevant as ancestry, not as the closest analogue (HCR is closer because T1 is
  a finite-perturbation bound).
- **How found.** Standard; surfaced alongside A1.

### A4. χ²-divergence ↔ Hellinger / KL lower bounds via mean+variance
- **Citation.** Nishiyama & Sason, "On Relations Between the Relative Entropy and
  χ²-Divergence…" (arXiv:2004.11197); arXiv:1907.00288 (KL lower bound via HCR);
  arXiv:2010.13548 (tight Hellinger bound given means/variances).
- **Statement.** A family of inequalities lower-bounding KL / Hellinger by
  (mean-difference)²/variance, all descending from the HCR/χ² mechanism.
- **Mapping.** Confirms the *generality and centrality* of the
  "mean-shift bounded by sd × √divergence" template the book uses; corroborates
  that T1 sits inside a well-developed inequality family, strengthening the
  "same math, uncited" claim.
- **How found.** WebSearch HCR + KL/Hellinger.

**SATURATION NOTE (Area A).** Saturated for the headline. HCR scalar + matrix
forms are the exact T1/T2 skeletons; multiple independent secondary sources state
them identically. Remaining Task-08 work: pull the exact proposition number from
one primary source (Polyanskiy–Wu notes or Lehmann–Casella *Theory of Point
Estimation* §2.7, which carries HCR) and confirm the multivariate matrix form's
canonical citation. No further *discovery* expected here.

---

## AREA B — Distributionally robust optimization (T1/T2 second independent home)

### B1. Pearson-χ²-ball worst-case mean = mean + √(radius)·sd
- **Citation.** A. Ben-Tal, D. den Hertog, A. De Waegenaere, B. Melenberg, G.
  Rennen, "Robust solutions of optimization problems affected by uncertain
  probabilities," *Management Science* 59(2):341–357 (2013).
- **Statement.** Robustifying an expectation over a Pearson-χ²-divergence
  ambiguity set of radius r around a reference P yields, to leading order,
  **sup_{χ²(Q‖P)≤r} E_Q[Z] = E_P[Z] + √(r)·sd_P(Z) (+ higher order)**; the
  worst-case = mean + √r × standard deviation; the worst-case Q is the standard
  two-point/linear tilt witness.
- **Mapping → T1/T2 (exact).** Identical envelope to T1 with δ=√r. The "two-point
  tightness witness" the selection-bounds plan describes is the χ²-DRO attainer.
  The vector case (worst-case of a linear readout) reproduces T2's ellipsoid.
- **Source / how found.** WebSearch + EconPapers/IDEAS (Mgmt Sci 59(2)); the
  mean+√r·sd reading surfaced verbatim in DRO-review search snippets.
- **Track A overlap.** **[Track A hypothesis — harvested]** (selection-bounds plan
  names Ben-Tal 2013 explicitly). Confirmed; verdict is Track A's.

### B2. Variance-based regularization = χ²-DRO (the exact expansion)
- **Citation.** H. Namkoong & J. Duchi, "Variance-based regularization with convex
  objectives," NeurIPS 2017 / *JMLR* 20(68):1–55 (2019) (arXiv:1610.02581).
  Companion: Duchi, Glynn, Namkoong, "Statistics of robust optimization: a
  generalized empirical-likelihood approach," *Math. of OR* (arXiv:1610.03425).
- **Statement.** For the empirical reference P_n, sample size n, χ²-ball radius ρ:
  **sup_{χ²(P‖P_n)≤ρ/n} E_P[Z] = E_{P_n}[Z] + √(ρ·Var_{P_n}(Z)/n) + o_P(1/√n)**
  — robust risk = empirical mean + a variance (≈ std-dev) regularizer with
  coefficient √(ρ/n). (Exact constant under bounded-loss; verify in Task 08 —
  WebFetch of the PDF body failed.) [PAYWALL/extraction: arXiv open, but the
  precise constant could not be auto-extracted; flag for 08.]
- **Mapping → T1.** Same mean+√·sd structure; this is the *ML-facing* statement of
  the same inequality (the "an ML referee knows χ²-DRO" half of the double
  exposure). Directly relevant to the Laidlaw near-miss (see B5).
- **How found.** WebSearch Duchi–Namkoong variance regularization; JMLR v20/17-750;
  NeurIPS proceedings.
- **Track A overlap.** **[Track A hypothesis — harvested]** (Duchi–Namkoong named).

### B3. Lam — robust sensitivity analysis (divergence ball ↔ variance gradient)
- **Citation.** H. Lam, "Robust sensitivity analysis for stochastic systems,"
  *Math. of OR* 41(4):1248–1275 (2016); + "Recovering best statistical guarantees
  via empirical divergence-based DRO," *Operations Research* 67(4):1090–1105 (2019).
- **Statement.** First-order worst-case sensitivity of E[Z] to a divergence-ball
  perturbation of the input model is governed by the variance/influence of Z; the
  χ²-ball gives the std-dev rate. "Worst-case sensitivity = variance" is the
  thesis.
- **Mapping → T1/T2.** This is the *sensitivity-analysis* phrasing of T1: the book
  reads the same object as a selection-channel bound; Lam reads it as model
  misspecification sensitivity. Strong third framing of the identical math.
- **How found.** WebSearch Lam robust sensitivity; PubsOnLine/INFORMS.
- **Track A overlap.** **[Track A hypothesis — harvested]** (Lam named).

### B4. Tight variance bounds over f-divergence neighborhoods
- **Citation.** "Distributionally Robust Variance Minimization: Tight Variance
  Bounds over f-Divergence Neighborhoods" (arXiv:2009.09264).
- **Statement.** Exact worst-case variance/mean over f-divergence (incl. χ²) balls.
- **Mapping.** Generalizes B1/B2 beyond χ² (φ-divergence family); shows T1 is the
  χ²-instance of a φ-divergence envelope — useful breadth for the gap paper's
  "native home is a whole sub-literature" point.
- **How found.** WebSearch Lam/variance DRO.

### B5. Bayesian-robustness twin (third independent home)
- **Citation.** P. Gustafson, "Local sensitivity of posterior expectations,"
  *Ann. Statist.* 24:174–195 (1996); D. Basu & related; survey: Berger et al.,
  "Bayesian robustness."
- **Statement.** The local sensitivity of a posterior expectation E[H|data] to an
  infinitesimal/χ²-type prior perturbation is bounded by the posterior sd of H
  times the perturbation magnitude — same mean-shift ≤ sd × divergence template,
  derived independently in Bayesian robustness.
- **Mapping → T1.** A *third* independent native home (alongside HCR and χ²-DRO).
  The book's L = dμ_θ/dμ_0 "tilt" is the perturbation; Gustafson's influence
  function is its derivative. Confirms the inequality is field-independent classic.
- **How found.** WebSearch Gustafson Bayesian robustness; Springer/ProjectEuclid.
- **Track A overlap.** **[Track A hypothesis — harvested]** (named as "possible
  third home"); confirmed it is a real, citable third home.

### B6. Esfahani–Kuhn Wasserstein DRO (adjacent, NOT the home)
- **Citation.** P. Mohajerin Esfahani & D. Kuhn, "Data-driven DRO using the
  Wasserstein metric…," *Math. Programming* 171:115–166 (2018).
- **Statement.** Worst-case expectation over a Wasserstein ball = empirical mean +
  Lipschitz-norm regularizer (gradient-norm, not variance).
- **Mapping.** **Contrast case, flag explicitly:** Wasserstein-DRO regularizes by a
  *Lipschitz/gradient* term, NOT by sd; it is the *wrong* ball for T1. Recording
  it prevents a Task-08 mis-attribution ("the book's bound is Wasserstein DRO" —
  it is not; it is the χ²/Pearson ball). The book's δ=√χ² pins it to χ², not W.
- **How found.** WebSearch Esfahani–Kuhn Wasserstein DRO.

**SATURATION NOTE (Area B).** Saturated. Three independent classical homes for the
T1/T2 envelope (HCR estimation theory, Pearson-χ²-DRO, Bayesian-robustness
sensitivity) all give mean ± √(radius)·sd. The Wasserstein contrast is recorded to
prevent mis-homing. Task-08 residual: extract the exact Namkoong–Duchi constant
(√(ρ/n) vs √(2ρ/n)) and the Ben-Tal Prop. number. No further discovery expected.

---

## AREA C — Convex analysis / duality (T4 home)

### C1. Fenchel–Rockafellar conjugate / perturbation (value-function) duality
- **Citation.** R.T. Rockafellar, *Convex Analysis*, Princeton (1970) — esp. §12
  (conjugates), §28–30 (Fenchel duality, perturbation). Also Rockafellar,
  *Conjugate Duality and Optimization* (SIAM, 1974).
- **Statement.** For the value function of a perturbed convex program
  φ(u) = inf_x { f(x) : g(x) ≤ u }, the conjugate-duality theorem gives
  φ(u) = sup_λ≥0 [ ... − (Lagrangian conjugate) ], with the dual = perturbation
  conjugate; under a Slater/regularity condition strong duality holds and the
  dual multipliers are the value-function subgradients (shadow prices).
- **Mapping → T4 (exact).** T4's m(d) = inf_a{ c(a) : w·a ≥ d } is exactly a
  linearly-perturbed convex program; its dual m(d) = sup_{λ≥0}[ λd − c*(λw) ] is
  the **Lagrangian/perturbation dual with c* the Fenchel conjugate of the cost**.
  The "support function" reading the threads already name is the support function
  of the feasible/sublevel geometry. T4 *is* textbook value-function conjugacy
  specialized to a linear proxy constraint.
- **Source / how found.** WebSearch Fenchel–Rockafellar perturbation/value function;
  standard. Primary text (Rockafellar 1970) [PAYWALL — print; cite by section].
- **Track A overlap.** **[Track A hypothesis — harvested]** — convex-budget plan
  already names Rockafellar/Fenchel and calls T4 "half-acknowledged." This file
  confirms the precise theorem class (perturbation/value-function conjugate duality
  under Slater regularity); Track A owns the Fact-vs-Theorem reframe and the exact
  proposition citation.

### C2. Conjugate of a quadratic & the support-function quadratic special case
- **Citation.** Rockafellar *Convex Analysis* §12 (quadratic conjugate); Boyd &
  Vandenberghe, *Convex Optimization* (2004) §3.3, §5 (conjugate, dual norms,
  support functions).
- **Statement.** For f(x)=½xᵀQx (Q≻0), f*(y)=½yᵀQ⁻¹y; the support function of an
  ellipsoid {x: xᵀΣ⁻¹x ≤ 1} is √(yᵀΣy).
- **Mapping → T4 quadratic case + T2.** Gives T4's quadratic specialization
  m(d)=d²/(2S), S=wᵀdiag(κ)w, as elementary least-cost allocation; *and* it is the
  same √(yᵀΣy) support function that produces T2's operator form (Area A2). The
  recurring |b|² quantity (T5/T6) is this conjugate.
- **How found.** WebSearch support function ellipsoid conjugate quadratic.
- **Track A overlap.** Convex-budget plan names the quadratic case; harvested.

**SATURATION NOTE (Area C).** Saturated; T4 is standard perturbation/value-function
conjugate duality, already half-acknowledged internally. Task-08 residual: cite the
exact Rockafellar theorem (Thm 28.x / Cor of Fenchel duality) and the
Slater-regularity statement. Low effort, as the convex-budget plan anticipated.

---

## AREA D — Operations research / least-cost allocation (T4 / T5 / T6 quadratic)

### D1. Montgomery 1972 — least-cost allocation / equimarginal principle
- **Citation.** W.D. Montgomery, "Markets in licenses and efficient pollution
  control programs," *J. Economic Theory* 5(3):395–418 (1972).
- **Statement.** The competitive/market equilibrium attains a standard at least
  cost; the cost-minimization Lagrangian's multiplier is a uniform shadow price
  (equimarginal: marginal abatement costs equalized across sources).
- **Mapping → T4 quadratic / T6 static.** The least-cost-to-hit-a-constraint
  program is structurally T4; the equimarginal optimality is the KKT condition of
  m(d). T6's static threshold S(M)=|b|² is the same least-cost quantity.
- **OVERLAP FLAG with Track A's econ task (Task 02).** Montgomery / Baumol–Oates /
  equimarginal abatement sit in **Task 02's lane** (econ/public-finance prior art).
  Recorded here only for the *convex-program structure* link to T4; **do not
  double-claim** — Task 02 owns the abatement-market reading. Cross-reference only.
- **How found.** WebSearch Montgomery 1972; IDEAS/JET 5(3).

### D2. Markowitz mean–variance (the optimization twin)
- **Citation.** H. Markowitz, "Portfolio selection," *J. Finance* 7(1):77–91 (1952).
- **Statement.** min variance s.t. mean-return ≥ target; efficient frontier; the
  √(wᵀΣw) risk and the mean–sd tradeoff.
- **Mapping → T1/T2 + T4.** The mean–sd envelope and the √(vᵀΣv) object are the
  same quadratic-form geometry; Markowitz is the canonical OR "twin" of the
  ellipsoid support function. Useful as a *recognition anchor* for an OR referee.
- **How found.** Standard; surfaced via DRO/mean-variance searches (Calafiore 2007).

**SATURATION NOTE (Area D).** Saturated at the structural level. Main caution:
Montgomery/Baumol–Oates is **Task 02 territory** — flagged, not claimed. The OR
contribution here is recognizing T4/T2's quadratic geometry as the standard
least-cost / mean-variance shape.

---

## AREA E — Index-number theory / aggregation (lower-tier, breadth for gap paper)

### E1. Axiomatic index-number theory
- **Citation.** W. Eichhorn & J. Voeller, *Theory of the Price Index: Fisher's
  Test Approach and Generalizations*, Springer LNEMS 140 (1976); W.E. Diewert,
  "Superlative index numbers and consistency in aggregation," *Econometrica*
  46(4):883–900 (1978); Diewert, "Exact and superlative index numbers," *J.
  Econometrics* 4 (1976); collected in Diewert & Nakamura, *Essays in Index Number
  Theory* (1993).
- **Statement.** Axiomatic (test) and economic approaches characterizing how to
  aggregate heterogeneous quantities into a single scalar index; consistency-in-
  aggregation = two-stage aggregation equals one-stage.
- **Mapping.** Lower-tier breadth: the book's collapse of a multidimensional target
  to a scalar proxy is an *aggregation* operation; index-number axiomatics is the
  native theory of "what is lost / what is invariant when you aggregate." Maps to
  the book's value-metric / declared-representation theme (loosely; framing not
  theorem).
- **How found.** WebSearch Diewert / Eichhorn–Voeller; Springer/Econometrica.

### E2. Consistency in aggregation
- **Citation.** C. Blackorby & D. Primont, "Index numbers and consistency in
  aggregation," *J. Economic Theory* 22(1):87–98 (1980); Blackorby, Primont,
  Russell, *Duality, Separability, and Functional Structure* (North-Holland, 1978);
  Y. Vartia work on consistency-in-aggregation.
- **Statement.** Conditions (separability) under which sub-aggregates can be
  consistently combined.
- **Mapping.** Same lower-tier aggregation theme; the separability conditions are
  the index-theory analogue of "when does a proxy faithfully summarize a subset of
  coordinates." Framing anchor, not a theorem the book proves.
- **How found.** WebSearch Blackorby Primont consistency aggregation.

**SATURATION NOTE (Area E).** Reasonably saturated as *breadth context for the gap
paper*, not as a per-theorem home. The mapping is at framing altitude
(aggregation/representation), weaker than A–C. Recorded so the gap paper's
"cross-field dictionary" can note the aggregation literature exists; not a Track A
per-theorem target. Lower priority for Task 08.

---

## AREA F — Causal inference / identification (L1 home)

### F1. Partial identification / observational equivalence
- **Citation.** C. Manski, "Nonparametric bounds on treatment effects," *AER* 80
  (1990) and *Identification for Prediction and Decision* (Harvard, 2007); J.
  Heckman, "Sample selection bias as a specification error," *Econometrica* 47
  (1979); Heckman & Vytlacil latent-index bounds (1999/2000); D. Rubin potential
  outcomes (1974); J. Pearl do-calculus (*Causality*, 2000).
- **Statement.** Selection vs treatment effects are not point-identified from the
  observed marginal distribution without assumptions; Manski gives the sharp
  *bounds* (partial identification); two distinct parameter configurations are
  *observationally equivalent* when they imply the same observed law.
- **Mapping → L1 (strong).** The book's W_θ (selection) vs K_θ (intervention) split
  "not identifiable from marginal score movement" **is** observational
  equivalence / the selection-vs-effect identification problem. Manski partial
  identification is the closest precise home; Heckman selection is the canonical
  named model. The book's "relative to the declared type representation" is the
  "identified-set depends on maintained assumptions" point.
- **How found.** WebSearch Manski partial identification / Heckman / observational
  equivalence; NBER/arXiv.
- **Track A overlap.** **[Track A hypothesis — harvested]** (lower-tier plan L1
  names exactly these). Confirmed as the home; Track A owns the anchor verdict.
- **Flag for Track A:** L1 is the one lower-tier item the plan keeps an "optimistic"
  check on (a genuine identification subtlety might survive). The mixture-model
  non-identifiability angle (F2) is the candidate residual.

### F2. Mixture-model non-identifiability
- **Citation.** Standard (Teicher 1963 identifiability of mixtures; and general
  latent-class non-identifiability results).
- **Statement.** A given marginal can arise from distinct mixing measures; the
  mixing distribution is not identified without structure.
- **Mapping → L1.** The selection/intervention decomposition is a mixture-style
  non-identifiability: the same score-movement marginal decomposes multiple ways.
  Possibly the *cleanest mathematical* statement of L1 (vs the econometric framing
  of F1).
- **How found.** WebSearch mixture non-identifiability (alongside F1).

**SATURATION NOTE (Area F).** Saturated. L1 has a strong, well-known home (partial
identification / observational equivalence), plus a clean math twin (mixture
non-identifiability). Task-08 residual: none for discovery; Track A decides whether
any subtlety survives the anchor.

---

## AREA G — Exponential families / large deviations (L2 home)

### G1. Cumulant generating function: derivative of tilted mean = covariance
- **Citation.** Standard; Efron, "Exponential families in theory and practice"
  (2018 lecture notes); Brown, *Fundamentals of Statistical Exponential Families*
  (1986); Barndorff-Nielsen, *Information and Exponential Families* (1978).
- **Statement.** For exponential family with log-partition A(η), ∇A(η)=E_η[T],
  ∇²A(η)=Cov_η[T]; the CGF K(t)=log E[e^{tX}] has K′(0)=mean, K″(0)=variance; the
  derivative of the tilted mean w.r.t. the natural parameter is the covariance.
- **Mapping → L2 (exact).** The book's "covariance is only the *zero-pressure
  derivative*; finite-pressure drift depends on the whole tilted path" is exactly
  the exponential-family fact: dE_η[H]/dη|_{η=0} = Cov_0(H, T), but the
  finite-tilt mean E_η[H] integrates ∇²A along the path. The H=Z²−1 example
  (baseline covariance zero, threshold/Boltzmann selection still moves H) is the
  standard "first cumulant is necessary but not sufficient" point.
- **How found.** WebSearch exponential family CGF derivative covariance tilt.
- **Track A overlap.** **[Track A hypothesis — harvested]** (lower-tier L2). One-line
  cumulant nod is all Track A needs; confirmed available.

### G2. Gibbs–Boltzmann / large-deviations / importance sampling
- **Citation.** Boltzmann–Gibbs measures (statistical mechanics); large-deviations
  (Varadhan, *Large Deviations and Applications*, 1984; Dembo–Zeitouni text);
  exponential tilting as importance-sampling change of measure (Siegmund 1976).
- **Statement.** Exponential/Boltzmann tilt e^{θ·T}/Z(θ) is the maximum-entropy /
  importance-sampling reweighting; LDP rate function = Legendre transform of the
  CGF (the convex-conjugate link again).
- **Mapping → L2.** The "Boltzmann selection" the book uses is literally a Gibbs
  tilt; the rate-function = Legendre-conjugate of CGF ties L2 back to the
  conjugate-duality machinery of Area C — the same convex-conjugate object appears
  in T4 and in the tilt's large-deviation rate.
- **How found.** WebSearch exponential tilt importance sampling Gibbs large deviations.

**SATURATION NOTE (Area G).** Saturated. L2 is the textbook cumulant/exponential-
family fact; the Gibbs/LDP framing additionally links L2's tilt to Area C's
conjugacy (nice for the dictionary). Low Task-08 effort (no exact constants needed).

---

## AREA H — Signaling / contest theory (L3 / T3 home)

### H1. Spence costly signaling + single-crossing
- **Citation.** A.M. Spence, "Job market signaling," *Quarterly J. Economics*
  87(3):355–374 (1973); Spence–Mirrlees single-crossing condition.
- **Statement.** A costly signal separates types when the single-crossing
  (Spence–Mirrlees) condition holds: marginal signal cost decreases in ability;
  the separating equilibrium has a threshold signal level only high types find
  worth crossing.
- **Mapping → L3 / T3.** The book's "below-threshold gaming worthwhile iff
  t−Q ≤ √(2κV)" is a costly-threshold-crossing condition: the agent crosses iff
  benefit V exceeds the quadratic crossing cost. This is the Spence threshold in a
  quadratic-cost / Stackelberg dress.
- **How found.** WebSearch Spence 1973 signaling single-crossing.
- **Track A overlap.** **[Track A hypothesis — harvested]** (lower-tier L3 names
  Spence + strategic classification). Confirmed.

### H2. Contest theory / all-pay auctions + strategic classification
- **Citation.** Contest theory / all-pay auction (Baye–Kovenock–de Vries 1996;
  Konrad, *Strategy and Dynamics in Contests*, 2009); M. Hardt, N. Megiddo, C.
  Papadimitriou, M. Wootters, "Strategic classification," ITCS 2016.
- **Statement.** Agents expend costly effort to cross a decision threshold; the
  best-response under a cost model gives the threshold-crossing condition (Hardt et
  al. give the linear/quadratic cost classifier-gaming version).
- **Mapping → L3 / T3.** Strategic classification (Hardt 2016) is the *nearest AI/CS
  analogue* already cited internally (`formal_analogue_lit_map.md`); contest/all-pay
  is the econ home. T3 is the quadratic-cost instance.
- **How found.** WebSearch Spence + strategic classification / contest.
- **Track A overlap.** Lower-tier plan flags Hardt as nearest analogue; harvested.

**SATURATION NOTE (Area H).** Saturated. L3/T3 has a clear home (Spence threshold /
strategic classification quadratic cost). Toy-claim framing per the plan; confirm
antecedent and cite. No exact-constant Task-08 work.

---

## AREA I — Security games / resource scheduling (L4 / T6 dynamic home)

### I1. Stackelberg security games
- **Citation.** M. Tambe, *Security and Game Theory* (Cambridge, 2011); Kiekintveld
  et al. (2009); Korzhyk, Conitzer, Parr (2010); Sinha et al. survey (2018).
- **Statement.** Defender commits to a (randomized) allocation of limited
  resources over targets; attacker best-responds; the defender's optimization is a
  least-loss resource-allocation under a budget.
- **Mapping → L4 / T6 dynamic.** The book's adaptive hardening (gaming feasible iff
  S_t(M) ≥ d²/(2V); multiplicative progress-aware rule) is a defender
  resource-reduction problem with Stackelberg structure. The *static* threshold
  S(M)=|b|² is T4-specialized; the *dynamic* is the security-game flavored part.
- **How found.** WebSearch Stackelberg security games Tambe.
- **Track A overlap.** **[Track A hypothesis — harvested]** (lower-tier L4 names
  Stackelberg security games + moving-target defense). Confirmed.

### I2. Moving-target defense + greedy monotone resource reduction
- **Citation.** Moving-target defense game-theory (e.g. Markov-Stackelberg MTD,
  arXiv:2002.10390; Wiley ITOR "moving targets security games" 2024); greedy
  allocation results in security games (non-contagious case: greedy to highest-
  value targets is optimal).
- **Statement.** Under non-contagious attacks the optimal defender allocation is
  *greedy* (allocate to highest-value/lowest-cost targets); MTD adds a temporal
  dimension where targets move.
- **Mapping → L4.** The book's "monotone greedy resource reduction" terminating
  under floor conditions matches the greedy-allocation optimality result; the
  termination argument is the plan's flagged "most genuinely original-but-small"
  piece — **flag for Track A:** the greedy-optimality precedent exists, so any L4
  novelty must scope to the *termination* proof, not the greedy rule.
- **How found.** WebSearch moving-target defense greedy security games.

**SATURATION NOTE (Area I).** Saturated. L4 static = T4; dynamic has a
security-game / greedy-allocation home, with the termination argument as the only
candidate residual novelty. No exact-constant Task-08 work.

---

## AREA J — The AI-side near-miss (the denominator, recorded for Task 04/08)
NOTE: AI corpus is Task 01's lane; recorded here only because it is the formal
near-miss to the χ²-DRO home and directly tests the gap claim.

### J1. Laidlaw et al. — occupancy-measure χ² regularization (CONFIRMED near-miss)
- **Citation.** C. Laidlaw, S. Singhal, A. Dragan, "Preventing Reward Hacking with
  Occupancy Measure Regularization," 2024 (arXiv:2403.03185). [Also note: the
  search surfaced a later-titled "Correlated Proxies…" variant under the same id —
  resolve exact title/venue in Task 08.]
- **Statement.** Argues regularizing the **χ²-divergence between policies'
  occupancy measures** (rather than KL between action distributions) more
  effectively prevents reward hacking; explicitly frames reward hacking as a case
  of Goodhart's Law.
- **Mapping / gap-claim relevance.** Uses **χ²-divergence in a proxy-gaming bound**
  — the *exact* object of T1/B1/B2 — yet (per the audit's ESTIM-tier finding)
  cites **no estimation / HCR / χ²-DRO prior art**. This is the strongest single
  data point that the formal citation gap is real, not just the econ (T5) gap.
  **Task 08 must verify its reference list** to confirm the no-estimation-citation
  claim before the gap paper asserts it `[confident]`.
- **How found.** WebSearch Laidlaw occupancy measure χ² Goodhart.
- **Boundary.** Task 01 owns the AI-corpus coding; Task 04 owns the
  bridge/exception verdict. Recorded here as the formal-side hook only.

### J2. Related AI χ²/divergence-Goodhart work (for the denominator)
- **Citation.** "Catastrophic Goodhart: regularizing RLHF with KL divergence does
  not mitigate heavy-tailed reward misspecification" (NeurIPS 2024,
  arXiv:2407.14503).
- **Statement.** KL regularization fails under heavy-tailed proxy error — a
  divergence-regularization Goodhart result.
- **Mapping.** Same neighborhood (divergence balls + Goodhart) as the χ²-DRO home;
  another denominator entry for Task 01/04 to check for estimation citations.
- **How found.** WebSearch (alongside J1).

**SATURATION NOTE (Area J).** Sufficient for a formal-side hook. Full AI-corpus
saturation is Task 01. The key deliverable here — a confirmed formal near-miss
(Laidlaw χ²/occupancy) whose reference list Task 08 must audit — is recorded.

---

## CROSS-REFERENCE TO TRACK A (consolidated, no double-claim)

| Book item | Native home found (this file) | Track A plan owning the verdict | Status |
|---|---|---|---|
| T1 scalar selection bound | HCR rearranged (A1); Pearson-χ²-DRO mean+√r·sd (B1); Bayesian-robustness sensitivity (B5) | litrev-selection-bounds | home CONFIRMED; verdict = Track A |
| T2 operator/value form | Matrix HCR ellipsoid (A2) + support-function/√(vᵀΣv) (C2) | litrev-selection-bounds | skeleton CONFIRMED; residual (value-norm wrapper) flagged for Track A |
| T4 convex budget | Fenchel–Rockafellar perturbation/value-function conjugacy (C1); quadratic conjugate (C2) | litrev-convex-budget | home CONFIRMED; Fact-vs-Theorem reframe = Track A |
| T4 quadratic / T6 static | Least-cost allocation / equimarginal (D1, **Task 02 overlap**) | litrev-convex-budget / litrev-lower-tier | structural; Montgomery is Task 02's claim |
| L1 identification | Partial identification / observational equivalence (F1); mixture non-id (F2) | litrev-lower-tier (L1) | home CONFIRMED; subtlety check = Track A |
| L2 tilt | Exp-family CGF derivative = covariance (G1); Gibbs/LDP (G2) | litrev-lower-tier (L2) | home CONFIRMED; one-line nod |
| L3 / T3 | Spence costly threshold + single-crossing (H1); strategic classification (H2) | litrev-lower-tier (L3) | home CONFIRMED; cite antecedent |
| L4 / T6 dynamic | Stackelberg security games (I1); greedy/MTD (I2) | litrev-lower-tier (L4) | home CONFIRMED; novelty scoped to termination |

**No double-claim rule applied:** this file claims *discovery + mapping*; every
*per-theorem novelty verdict* belongs to the Track A plan named above. Montgomery/
Baumol–Oates (D1) belongs to **Task 02** (econ), cross-referenced only.

---

## OVERALL SATURATION VERDICT

- **Areas swept to saturation:** A (estimation/HCR), B (χ²-DRO), C (convex/Fenchel),
  F (causal identification/L1), G (exponential tilt/L2), H (signaling/L3),
  I (security games/L4) — all have firm, citable native homes with exact or
  near-exact statement matches.
- **Saturated as breadth, lower priority:** D (OR least-cost, partly Task 02's),
  E (index numbers — framing-altitude only), J (AI near-miss — Task 01's lane).
- **Distinct items recorded:** 24 (A1–A4, B1–B6, C1–C2, D1–D2, E1–E2, F1–F2,
  G1–G2, H1–H2, I1–I2, J1–J2).
- **Chapman–Robbins / χ²-DRO home for T1/T2: CONFIRMED** (the prior "no analogue"
  internal note is a false negative). Three independent homes (HCR, χ²-DRO,
  Bayesian-robustness); the multivariate HCR matrix form is the exact T2 ellipsoid.
- **Confidence:** discovery-grade. Exact proposition numbers / constants
  (Namkoong–Duchi √(ρ/n), Ben-Tal Prop. #, Rockafellar Thm #, Polyanskiy §29.1
  HCR) deferred to **Task 08**; two PDF auto-extractions failed and are flagged.
- **Verdict: SATURATED for discovery.** No additional *areas* expected to yield new
  native homes; remaining work is primary-source verification (Task 08) and the
  per-theorem novelty verdicts (Track A).
