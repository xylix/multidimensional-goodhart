# Prior-art primary-source verification — Task 08

**Date of all verification work below: 2026-06-24.** Method: WebSearch + WebFetch;
where WebFetch could not decode a PDF (most publisher/NBER/arXiv PDFs are
compressed and not auto-readable), the PDF was downloaded and text-extracted
locally with `pdftotext`, then the exact statement read off the extracted text.

**Tag legend.**
- `[verified-primary]` — I read the actual statement, with its number, in the
  primary source (or an author/working-paper copy that carries the same numbered
  statement). Proposition/theorem/equation numbers below this tag were *seen*.
- `[verified-secondary]` — only a reliable secondary/tertiary source (textbook
  lecture notes that restate it, OpenAlex/abstract, a summary) was readable; the
  *statement* is confirmed but a primary proposition number is NOT asserted.
- `[paywalled-flag-for-user]` — primary original is paywalled or its PDF is a
  scanned image WebFetch/pdftotext cannot read; the user must pull it before any
  proposition number is cited.

**GUARDRAIL applied throughout:** no proposition/theorem number appears below
unless it carries a `[verified-primary]` tag and was read in the source. Every
reconstruction-from-secondary is marked. This file *supersedes* the
discovery-grade proposition guesses in `prior-art-econ.md` / `prior-art-formal.md`
for the items it covers.

---

## A. ECONOMICS / PUBLIC FINANCE

### A1. Reynaert–Sallee 2016 — "Corrective Policy and Goodhart's Law" `[verified-primary]`
- **Source.** NBER w22911 PDF, https://www.nber.org/system/files/working_papers/w22911/w22911.pdf
  (downloaded, pdftotext). Cross-checks the Yale author copy
  https://economics.yale.edu/sites/default/files/reynaertsallee_gaming_201611.pdf.
  Pub. *AEJ: Economic Policy* (2021); NBER DOI 10.3386/w22911.
- **Proposition 4 (verbatim).** "**Proposition 4. (Goodhart's Law for
  externality-correcting policies) As long as h′/D is rising in λ, a tighter
  standard induces greater gaming: dg/dλ > 0.**" (Proof: §appendix; FOC of profit
  in g gives (1−α)β = −h′/D + λ; total differentiation yields the sign.)
- **CORRECTION to T5 README.** The README's "Prop. 4 = either-direction gaming"
  is imprecise. Prop. 4 is a *comparative static* (tighter policy ⇒ more gaming).
  The **either-direction welfare result is Proposition 2**, not 4:
  - **Proposition 1 (verbatim).** "In the absence of policy (σ=∞, τ=0), consumer
    surplus falls with the level of gaming: dCS/dg ≈ −ρ(1−α)βD + (1−α)²β²D′g ≤ 0."
    (price effect + choice distortion; both →0 when consumers fully sophisticated, α=1.)
  - **Proposition 2 (verbatim).** "In the presence of a binding standard but no
    tax (λ>0, τ=0), a change in gaming affects consumer surplus as follows:
    dCS/dg ≈ (−ρ(c′+αβ)−β)D + (1−α)²β²D′g." Text: "The price effect … can be
    positive, and thus **consumers might benefit from gaming**." → this is the
    "gaming can go either way on welfare" result. Corollary 1: price effect
    positive when λ > β/ρ − (1−α)β.
- **Mapping.** corrective-Goodhart (the eponymous econ sibling) + T5-congruity.
- **Citing guidance.** Cite **Prop. 4** for "tightening the proxy stake induces
  more gaming (Goodhart)"; cite **Prop. 2 + Corollary 1** for "gaming/distortion
  can raise or lower welfare." Do not attribute the either-direction welfare claim
  to Prop. 4.

### A2. Chetty 2009 — "Is the Taxable Income Elasticity Sufficient…" `[verified-primary]`
- **Source.** NBER w13844 PDF, https://www.nber.org/system/files/working_papers/w13844/w13844.pdf
  (downloaded, pdftotext). Pub. *AEJ: Economic Policy* 1(2):31–52, DOI 10.1257/pol.1.2.31.
  NOTE: this is the NBER working-paper version; it states results as **numbered
  equations**, not "Propositions." The published AEJ version may renumber; if a
  "Proposition N" is to be cited, pull the AEJ version (`[paywalled-flag-for-user]`
  for AEJ proposition labels specifically).
- **Equation (3) (verbatim region).** The Feldstein (1999) sufficient-statistic
  formula `dW/dt = e·(∂[wl−e]/∂t) + t·∂[wl−e]/∂t = t·∂TLI/∂t` "holds in this model
  … it does not matter if taxable income falls … because of labor supply or a
  reporting effect … the marginal social costs of reducing earnings and reporting
  less income are exactly the same." I.e. **the taxable-income elasticity is
  sufficient when there is no transfer cost / no fiscal externality (κ=1).**
- **Equation (7) (verbatim).** The generalized excess-burden formula
  `dW/dt = t·{κ·ε_{TLI,1−t}(wl−e) + (1−κ)·ε_{LI,1−t}·wl}`, where
  `κ = g′(e)/(z′(e)+g′(e))` is "the fraction of the total cost of sheltering
  accounted for by resource costs." Text: "when there is no transfer cost, κ=1,
  and (7) reduces to the standard taxable income formula in (3) … In the general
  case κ∈(0,1), the excess burden … is determined by a **weighted average of the
  taxable income and total earned income elasticities**." The Feldstein condition
  is broken when κ<1 (some sheltering cost is a transfer to other agents).
- **Mapping.** T5-congruity in public-finance form: the scalar elasticity equals
  true welfare cost **iff** the proportionality/no-externality condition κ=1 holds
  — structurally the h=c·w condition. The (B)+(D) package (weighted-avg + invariance).
- **Citing guidance.** Cite **eq. (3)** as the Feldstein sufficient-statistic
  formula and **eq. (7)** as Chetty's generalization (sufficient only if κ=1).
  Use equation numbers, not "Proposition," unless the AEJ version is pulled.

### A3. Feltham–Xie 1994 congruity — proportionality condition `[paywalled-flag-for-user]` (primary); `[verified-secondary]` (statement via Budde)
- **Primary.** *The Accounting Review* 69(3):429–453, DOI 10.2308/tar (paywalled;
  not openly readable). **No Feltham–Xie proposition number is asserted here —
  flag for user pull** if the paper must cite "Feltham–Xie Prop. N."
- **Statement confirmed via Budde working paper** (open:
  https://www.econstor.eu/bitstream/10419/93913/1/sfb-tr15-dp204.pdf, downloaded,
  pdftotext), which derives the congruity index in the Feltham–Xie setting and
  cites "Feltham and Xie 1994, p. 433":
  - Congruity index **φ(d,y) = (d′y)² / ((y′y)(d′d)) = (cos β)²**, where β is the
    angle between the principal's value/benefit vector d and the measure's
    sensitivity vector y (Budde eq. (5)). Full congruity φ=1 **iff y ∝ d** (the
    sensitivity vector parallel to the value vector). "The cosine of β has already
    been promoted by Baker (2000, 2002) as a measure of congruity."
- **Mapping.** This is exactly the book's h = c·w (here y ∝ d) and distortion =
  1 − cos θ. The proportionality condition is **confirmed not novel** at primary
  level via an open derivation; the *exact Feltham–Xie proposition label* is the
  only missing piece.
- **Citing guidance.** Safe to state the congruity = parallel-vectors / cos²β
  result NOW (Budde gives it primary-grade, attributing to Feltham–Xie p.433 and
  Baker). To cite "Feltham–Xie Proposition N" specifically, pull the original.

### A4. Baker 1992 (JPE) iff-alignment `[paywalled-flag-for-user]`
- **Primary.** *J. Political Economy* 100(3):598–614, DOI 10.1086/261831. Open
  PDFs exist (people.duke.edu/~qc2/BA532/1992 JPE Baker.pdf; edegan.com) but they
  are **scanned images** — WebFetch and pdftotext recover no text (0–18 chars).
  **No Baker 1992 proposition/equation number asserted — flag for user pull**
  (needs OCR or library access).
- **Statement (verified-secondary, OpenAlex/abstract + Budde reference).** A
  performance measure not based on the principal's objective does not in general
  give first-best incentives even with a risk-neutral agent; efficiency depends on
  the alignment (correlation) between the measure's and the principal's marginal
  products; Baker defines a statistical alignment metric (the cos θ later used by
  Budde). The 1−cosθ distortion reading is **confirmed in substance** but the
  primary number is not pinned.

### A5. Baker 2002 (J. Human Resources) distortion = 1−cosθ `[paywalled-flag-for-user]`
- **Primary.** *J. Human Resources* 37(4):728–751, DOI 10.2307/3069615 (paywalled).
  **No proposition number asserted.** Statement (distortion vs risk decomposition;
  distortion = angular/cosine defect) is `[verified-secondary]` via Budde (which
  attributes the cos-β congruity measure to "Baker (2000, 2002)") and OpenAlex.

### A6. Banker–Datar 1989 — optimal weight ∝ sensitivity × precision `[verified-primary]`
- **Source.** *J. Accounting Research* 27(1):21–39, DOI 10.2307/2491205. Open copy
  people.duke.edu/~qc2/BA532/1989 JAR banker and datar.pdf (downloaded, pdftotext —
  text recovered cleanly).
- **Proposition 1 (verbatim).** "When the principal is risk neutral, a sufficient
  condition for the optimal compensation contract to be written as φ = ψ(π),
  π = l(a)y + m(a)z + n(a) … is that the joint density function is of the form
  f(y,z;a) = exp{∫ g[l(a)y+m(a)z, a]da + t(y,z)}." (the linear-aggregation-optimal
  density class).
- **Proposition 2 (verbatim).** "A **necessary (and sufficient)** condition for the
  optimal compensation contract to be written as a function of a linear aggregate
  l(a)y+m(a)z for all actions is that the joint density function is of the form in
  (6)." (Props 3–5 give sub-classes / ROI / overhead applications.)
- **Sensitivity×precision interpretation (§4, verbatim).** "The relative weight on
  each signal in the optimal performance evaluation measure for incentive purposes
  is **directly proportional to the product of the sensitivity and precision** of
  the signal." Sensitivity = extent to which a signal's expected value changes with
  the agent's action (adjusted for correlation with the other signal); precision =
  lack of noise. NOTE: this is stated as the *interpretation* of the Prop-1/2
  weights in §4, not as a separately numbered proposition.
- **Mapping.** aggregation/sufficiency + native home for the weight vector w_j
  (weights ∝ sensitivity×precision). **Linear scalarization-is-optimal is exactly
  Propositions 1–2.**
- **Citing guidance.** Cite **Prop. 1** (sufficient) / **Prop. 2** (necessary &
  sufficient) for "when a weighted-sum proxy is the optimal aggregate"; cite §4 for
  "weight ∝ sensitivity × precision" (interpretation, not a numbered prop).

### A7. Holmström–Milgrom 1991 — multitask / equal-compensation principle `[paywalled-flag-for-user]`
- **Primary.** *J. Law, Economics & Organization* 7(special):24–52,
  DOI 10.1093/jleo/7.special_issue.24 (paywalled; no open numbered copy located —
  scribd/studocu copies are not citable primaries). **No proposition number
  asserted — flag for user pull.**
- **Statement (verified-secondary, multiple reliable summaries incl. Holmström's
  Nobel lecture).** When effort is allocated across measured and unmeasured tasks,
  the optimal incentive on a measured task accounts for its effect on unmeasured
  tasks; it can be optimal to **lower incentive intensity (even to a flat wage)**
  on the measured task to avoid distorting the unmeasured one ("teach-to-the-test →
  fixed salary"). The **equal-compensation principle** (tasks competing for the
  same effort must be equally rewarded or one is starved) is the named result. The
  substance is solid; the proposition label is not pinned.

### A8. Lipsey–Lancaster 1956 — General Theorem of the Second Best `[verified-secondary]`
- **Primary.** *Review of Economic Studies* 24(1):11–32, DOI 10.2307/2296233. Open
  PDF gesd.free.fr/lipsey56.pdf exists but the host **refused connection** (twice);
  publisher page shows only navigation. **The original is NOT labeled with a
  numbered theorem** — it is stated in prose. So there is no "Proposition N" to
  pin; the statement itself is what matters and it is confirmed across multiple
  reliable sources:
- **Statement (confirmed verbatim across tertiary sources).** "The general theorem
  for the second best optimum states that if there is introduced into a general
  equilibrium system a constraint which prevents the attainment of one of the
  Paretian conditions, the other Paretian conditions, although still attainable,
  are, in general, no longer desirable." Corollary: a situation with more (but not
  all) optimum conditions satisfied is not necessarily superior to one with fewer.
- **Mapping.** second-best; underwrites "you cannot fix a multidimensional
  objective by perfecting each measured channel independently."
- **Citing guidance.** Cite as a *named principle* (no theorem number exists in the
  original); quote the prose statement. For a page-pinned verbatim quote, the user
  may pull the original, but no number is being suppressed.

### A9. Datar–Kulp–Lambert 2001 — set-monotonicity `[paywalled-flag-for-user]`
- **Primary.** "Balancing Performance Measures," *J. Accounting Research*
  39(1):75–92, **DOI 10.1111/1475-679X.00004** (DOI now confirmed — resolves the
  Task-02 flag). Paywalled (Wiley); no open numbered copy located. **No
  proposition number asserted — flag for user pull.**
- **Statement (verified-secondary).** Optimal contract trades off the congruity of
  the overall performance measure against the risk imposed on the agent; adding a
  measure can help or hurt depending on incremental congruity and correlation.
  Substance confirmed; proposition number not pinned.

### A10. Frankel–Kartik 2019 — "Muddled Information" `[verified-primary]`
- **Source.** *J. Political Economy* 127(4):1739–1776, DOI 10.1086/701604. Author
  copy https://navinkartik.com/Papers/FK-MudInf.pdf (downloaded, pdftotext — clean).
- **Proposition 2 (verbatim, the measure-degrades-when-used result).** "Assume
  τ = η. (1) If |Θ_η| < ∞, then at low stakes there is a fully informative
  equilibrium about η. (2) If Θ has any cross types, then **at high stakes there is
  no fully informative equilibrium about η**. (3) If the marginal distribution of γ
  is continuous and E[η|γ] is non-increasing in γ, then **at high stakes equilibria
  are approximately uninformative about η̂**." (η = natural action / dimension of
  interest, γ = gaming ability.) Companion **Proposition 4** is the LQE-specification
  version (part 2(b): as stakes grow, equilibrium becomes uninformative about η̂).
- **Mapping.** corrective-Goodhart / signaling-T3: the modern game-theoretic
  formalization of "using a measure to reward degrades its informativeness about
  the thing of interest." Prop. 2 part 2/3 is the citable statement.
- **Citing guidance.** Cite **Proposition 2** (parts 2 and 3) — verified-primary.

### A11. Ridgway 1956 — composite-measure distortion `[verified-secondary]`
- **Primary.** *Administrative Science Quarterly* 1(2):240–247, DOI 10.2307/2390989
  (paywalled; MAAW summary host returned only a tracking pixel on fetch). **No
  page/quote pinned at primary level — flag for user pull** if a verbatim composite-
  measure quote is needed.
- **Statement (verified-secondary, MAAW + Policy&Society 2015 review).** Ridgway
  treats single, multiple, and **composite** measures separately; a composite
  measure (separate criteria "weighted in some way and then added or averaged, with
  an explicit weighting of the various criteria") generates role/value conflict and
  still distorts. This is the genealogical root that already discusses the
  scalarization-of-a-vector (Σ w_j P_j) construction.

---

## B. FORMAL / STATISTICS

### B1. Hammersley–Chapman–Robbins (HCR) inequality — scalar form `[verified-primary]`
- **Source.** Polyanskiy–Wu, *Information Theory: From Coding to Learning*, MIT
  6.441 lecture notes (`LN_stats.pdf`),
  https://people.lids.mit.edu/yp/homepage/data/LN_stats.pdf, §29.1 (downloaded,
  pdftotext — clean). This is an open, citable primary text carrying numbered
  statements.
- **Eq. (29.1) (verbatim).** "χ²(P‖Q) ≥ sup_{a,b∈ℝ} {2(aE_P(X)+b) − E_Q[(aX+b)²] − 1}
  = (E_P[X] − E_Q[X])² / Var_Q(X)."
- **Theorem 29.1 (HCR lower bound), eq. (29.3) (verbatim).** "For the quadratic
  loss, any estimator θ̂ satisfies R_θ(θ̂) ≥ Var_θ(θ̂) ≥ sup_{θ′≠θ}
  (E_θ[θ̂] − E_{θ′}[θ̂])² / χ²(P_{θ′}‖P_θ), ∀θ ∈ Θ."
- **Mapping → T1 (exact).** Rearranging (29.1): |E_P[X] − E_Q[X]| ≤ √(Var_Q(X)) ·
  √(χ²(P‖Q)). With X = H_i, Q = μ_0, P = μ_θ, Var_{μ_0}(H_i)=s_i², δ=√(χ²(μ_θ‖μ_0)):
  |ΔE[H_i]| ≤ δ·s_i = **T1, verbatim**. The book's δ = ‖L−1‖_{L²(μ_0)} = √χ² by
  definition of χ². **Confirmed at primary level with eq. number (29.1) / Thm 29.1.**
- **Citing guidance.** Cite **Polyanskiy–Wu §29.1, eq. (29.1) / Theorem 29.1
  (eq. 29.3)** for the scalar HCR. (Lehmann–Casella *Theory of Point Estimation*
  §2.7 also carries HCR but is a print text — cite by section if a textbook anchor
  is preferred; the Polyanskiy number is the one verified here.)

### B2. HCR — multivariate / matrix (ellipsoid) form `[verified-secondary]`
- **Source.** Wikipedia "Chapman–Robbins bound" (multivariate section), read
  verbatim via WebFetch 2026-06-24. (A tertiary source; the matrix form is
  standard but I did not read it in a primary text — Polyanskiy §29.1 as extracted
  gives the scalar form; the matrix form was not in the extracted excerpt.)
- **Statement (verbatim from Wikipedia).** "χ²(μ_{θ′}; μ_θ) ≥ (E_{θ′}[ĝ] − E_θ[ĝ])ᵀ
  Cov_θ[ĝ]⁻¹ (E_{θ′}[ĝ] − E_θ[ĝ])."
- **Mapping → T2 (exact).** Rearranged: (Δμ)ᵀ Σ⁻¹ (Δμ) ≤ χ² — the mean-shift lies
  in the Σ-ellipsoid of radius √χ². T2's |v·B_H| ≤ δ·√(vᵀΣ_H v) is the
  support-function reading of this exact ellipsoid. **Skeleton confirmed; the
  value-norm support-function wrapper is the residual the T2 verdict (Track A) owns.**
- **Citing guidance.** State the matrix HCR ellipsoid as standard
  (`[verified-secondary]`); to cite a primary numbered matrix form, pull
  Polyanskiy–Wu full notes or Lehmann–Casella §2.7 (`[paywalled-flag-for-user]` for
  a *numbered* matrix statement).

### B3. Ben-Tal et al. 2013 — Pearson-χ²-ball robust counterpart `[verified-primary]` (framework); **CORRECTION on the "mean+√r·sd" attribution**
- **Source.** "Robust Solutions of Optimization Problems Affected by Uncertain
  Probabilities," *Management Science* 59(2):341–357. Open optimization-online PDF
  https://optimization-online.org/wp-content/uploads/2011/06/3076.pdf (downloaded,
  pdftotext — clean).
- **What the paper actually contains.** A general φ-divergence robust-counterpart
  framework: **Table 1** (tractable robust LO for each uncertainty region),
  **Table 2** (φ-divergence examples — incl. χ² / modified-χ² — with their
  **conjugates φ\*** and adjoints and tractability), **Table 3** (Cressie–Read
  class). The robust counterpart is built from the conjugate φ\* (RCP eq. (13)).
- **CORRECTION (important).** This paper does **NOT** state the closed form
  "worst-case = mean + √r·sd." I searched the full extracted text: no
  "mean + √(radius)·standard deviation" expansion appears. The `prior-art-formal.md`
  attribution of "sup_{χ²≤r} E_Q[Z] = E_P[Z] + √r·sd" to Ben-Tal 2013 is a
  **mis-attribution** — that closed form is the leading-order DRO result better
  sourced to **Duchi–Namkoong (B4 below, exact constant)** and to Gotoh–Kim–Lim /
  Lam-style expansions. **Do NOT cite "Ben-Tal 2013 Prop. N: mean+√r·sd"** — no
  such proposition exists in the paper. Cite Ben-Tal 2013 only for the
  φ-divergence robust-counterpart *machinery* (Tables 1–2, conjugate-based RCP).
- **Citing guidance.** Ben-Tal 2013 = the conjugate/φ-divergence DRO framework
  (Table 2 lists the χ² conjugate). For the mean+√·sd envelope, cite Duchi–Namkoong
  (B4). This corrects a Task-03 discovery-grade error.

### B4. Namkoong–Duchi 2017 — variance regularization = χ²-DRO, exact constant `[verified-primary]`
- **Source.** "Variance-based regularization with convex objectives," arXiv:1610.02581
  (= NeurIPS 2017 / JMLR 20(68) 2019). arXiv PDF https://arxiv.org/pdf/1610.02581
  (downloaded, pdftotext — clean).
- **Setup.** φ(t) = ½(t−1)² (the χ²-divergence); ambiguity set
  P_n = {P : D_φ(P‖P̂_n) ≤ ρ/n}; robust risk R_n(θ,P_n) = sup_{P∈P_n} E_P[ℓ(θ,X)] (eq. 4).
- **EXACT CONSTANT RESOLVED → √(2ρ/n).** Eq. (5) (intro) and **Theorem 1, eq. (10)**:
  - Eq. (5): "R_n(θ,P_n) = E_{P̂_n}[ℓ(θ,X)] + √(2ρ·Var_{P̂_n}(ℓ(θ,X)) / n) + ε_n(θ)",
    ε_n ≤ 0, O_P(1/n).
  - **Theorem 1, eq. (10) (verbatim).** "Let Z take values in [M₀,M₁], M=M₁−M₀,
    σ²=Var(Z), s_n²=sample variance. Fix ρ≥0. Then
    √(2ρ/n)·s_n − (2Mρ/n) ≤ sup{E_P[Z] : D_φ(P‖P̂_n) ≤ ρ/n} − E_{P̂_n}[Z] ≤ √(2ρ/n)·s_n."
- **Resolution of the Task-03 open question (√(ρ/n) vs √(2ρ/n)).** The coefficient
  on the standard deviation is **√(2ρ/n)**, NOT √(ρ/n). The factor of 2 comes from
  the φ(t)=½(t−1)² normalization of the χ²-divergence (radius ρ/n in that metric).
  If the book uses a χ² defined without the ½ (i.e. χ²=E[(L−1)²]), the conversion
  matters — flag for the T1/T2 verdict (Track A): match the χ² normalization before
  equating δ with √(radius).
- **Mapping → T1.** Same mean + (const)·sd envelope; this is the ML-facing χ²-DRO
  statement and the closest exact-constant primary for the "mean+√·sd" form.
- **Citing guidance.** Cite **Namkoong–Duchi Theorem 1 (eq. 10)**, constant
  **√(2ρ/n)** — verified-primary. Use this, not Ben-Tal, for the closed-form envelope.

### B5. Rockafellar 1970 — Fenchel/perturbation (value-function) duality (T4) `[paywalled-flag-for-user]`
- **Primary.** R.T. Rockafellar, *Convex Analysis* (Princeton, 1970) — print book;
  no open numbered copy. **No theorem number asserted — flag for user pull.** The
  relevant results are the conjugate-duality / Fenchel duality theorems (commonly
  Thm 31.1 / Cor 31.2.1 for Fenchel duality, and the perturbation/value-function
  conjugacy in §28–30), but I did **not** read the numbering in the source, so I do
  not assert it. Conjugate Duality and Optimization (SIAM, 1974) is the companion.
- **Statement (verified-secondary, standard).** For φ(u) = inf_x{f(x):g(x)≤u}, the
  conjugate-dual is the perturbation conjugate; under Slater regularity strong
  duality holds and the multipliers are value-function subgradients. T4's
  m(d) = inf_a{c(a):w·a≥d} = sup_{λ≥0}[λd − c\*(λw)] is this specialized to a linear
  proxy constraint.
- **Citing guidance.** Cite Rockafellar 1970 **by section** (Fenchel duality, §31;
  perturbation/value-function conjugacy §28–30) — do NOT cite a specific theorem
  number until the book is pulled and the number read. Track A owns the
  Fact-vs-Theorem reframe.

---

## SCOPE DECISION

The gap paper cites **Track A** for the math per family; per family it asserts only
the *citation gap*. Below, families are ranked by how solid the **primary-source
backing for the prior-art result** is NOW (which controls how confidently the gap
can be asserted with a pinned citation).

### Ranking (strongest primary backing first)

**(a) Estimation / χ²-DRO (T1/T2) — STRONGEST primary backing now.**
- T1 = HCR: **verified-primary** (Polyanskiy–Wu §29.1, eq. 29.1 / Thm 29.1) — exact,
  with equation numbers.
- χ²-DRO closed form: **verified-primary** (Namkoong–Duchi Thm 1, eq. 10, constant
  √(2ρ/n)) — exact constant resolved.
- T2 matrix/ellipsoid: skeleton **verified-secondary** (Wikipedia matrix HCR); the
  support-function wrapper is the residual (Track A's call).
- AI near-miss (Laidlaw arXiv:2403.03185 χ²/occupancy): Task 01/04's lane; recorded.
- This family has **two independent exact primaries** and is the tightest place to
  assert the citation gap with pinned numbers. **Recommend: lead with this family**
  alongside T5 — it is the formal-side anchor the gap paper can stand on NOW.

**(b) Performance-measurement / congruity (T5) — strong, but key numbers need pulls.**
- Congruity = parallel-vectors / cos²β: **verified-primary via Budde** (open
  derivation citing Feltham–Xie p.433 + Baker); the *substance* is solidly
  not-novel NOW.
- Banker–Datar linear-aggregation-optimal: **verified-primary (Props 1, 2 + §4)**.
- Reynaert–Sallee Goodhart: **verified-primary (Prop. 4 + Prop. 2)** — with the
  README correction (either-direction = Prop. 2).
- Chetty sufficient-statistic: **verified-primary (eqs. 3, 7)**.
- BUT Feltham–Xie / Baker 1992 / Baker 2002 / DKL **own proposition numbers are
  paywalled/scanned** — cite the congruity *substance* now (Budde-backed), defer
  any "Feltham–Xie Prop. N" / "Baker Prop. N" / "DKL Prop. N" until user pull.
- This is the tightest family on *substance* (T5 README already closed it) but has
  the most *paywalled proposition labels*.

**(c) Second-best / corrective-Goodhart.**
- Lipsey–Lancaster: **verified-secondary** (no numbered theorem exists in original;
  cite as named principle, prose statement confirmed).
- Reynaert–Sallee: **verified-primary** (Prop. 4 / Prop. 2) — strong.
- Frankel–Kartik muddled information: **verified-primary (Prop. 2)** — strong.
- Solid family; the corrective-Goodhart pieces are primary-pinned.

**(d) Convex duality (T4).**
- Rockafellar: **paywalled-flag-for-user** — cite by section only; no theorem number
  until pull. Substance (perturbation/value-function conjugacy) is standard. Lowest
  primary-backing rank purely because the canonical number is unread.

### Verified NOW vs needs-user-pull (the split)

**Citable with a pinned proposition/equation/theorem number NOW (verified-primary):**
1. Reynaert–Sallee 2016 — **Prop. 4** (Goodhart comparative static) and **Prop. 2 +
   Cor. 1** (either-direction welfare). [w22911]
2. Chetty 2009 — **eq. (3)** (Feldstein sufficient stat) and **eq. (7)** (generalized
   weighted-average). [w13844; AEJ "Proposition" labels need a pull — see note]
3. Banker–Datar 1989 — **Prop. 1** (sufficient) / **Prop. 2** (nec. & suff.) for
   linear-aggregation optimality; §4 for weight ∝ sensitivity×precision.
4. Frankel–Kartik 2019 — **Prop. 2** (parts 2, 3) measure-degrades-when-used (+ Prop. 4 LQE).
5. HCR (T1) — Polyanskiy–Wu **§29.1 eq. (29.1) / Theorem 29.1 (eq. 29.3)**.
6. Namkoong–Duchi 2017 — **Theorem 1, eq. (10)**, constant **√(2ρ/n)**.
7. Feltham–Xie congruity *substance* (parallel-vectors / cos²β) — **via Budde
   eq. (5)** (primary-grade open derivation; not the original's own label).

**Statement solid but NO primary proposition number — citable as named result /
substance, number deferred (verified-secondary):**
8. Lipsey–Lancaster — General Theorem of Second Best (prose; no number exists).
9. Baker 1992 iff-alignment; Baker 2002 distortion=1−cosθ (substance via Budge/OpenAlex).
10. Holmström–Milgrom 1991 multitask / equal-compensation principle.
11. Datar–Kulp–Lambert 2001 set-monotonicity (DOI 10.1111/1475-679X.00004 confirmed).
12. Ridgway 1956 composite-measure distortion.
13. HCR matrix/ellipsoid form (T2 skeleton) — Wikipedia verbatim.

**MUST be pulled by the user before ANY proposition/theorem number is cited
(paywalled-flag-for-user):**
- **Feltham–Xie 1994** — original proposition number (only the substance is open).
- **Baker 1992 / Baker 2002** — scanned/paywalled; proposition numbers unread.
- **Holmström–Milgrom 1991** — paywalled; proposition/equation numbers unread.
- **Datar–Kulp–Lambert 2001** — paywalled; proposition number unread.
- **Rockafellar 1970 Convex Analysis** — print; Fenchel/perturbation theorem number unread.
- **Chetty AEJ version** — only if "Proposition N" labels (vs the w13844 equation
  numbers) are wanted.
- **Ridgway 1956** — for a verbatim composite-measure quote/page.
- **Lehmann–Casella TPE §2.7** — only if a *numbered* matrix-HCR primary is wanted.

### Two corrections this task makes to the discovery files
1. **Reynaert–Sallee:** "either-direction gaming" is **Proposition 2**, not Prop. 4
   (Prop. 4 is the tighter-policy→more-gaming comparative static). [T5 README + prior-art-econ.md]
2. **Ben-Tal 2013:** does **not** contain a "mean+√r·sd" proposition; that closed
   form is mis-attributed. Use **Namkoong–Duchi Thm 1 (√(2ρ/n))** for the envelope;
   cite Ben-Tal only for the φ-divergence conjugate-RCP framework. [prior-art-formal.md B1/B2]
   Also: the χ²-DRO constant is **√(2ρ/n)** (resolves the open √(ρ/n) vs √(2ρ/n) question).
