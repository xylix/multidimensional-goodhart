# Prior-art (social-science) discovery — Task 02

**Scope.** Comprehensive sweep of the *non-ML* social-science prior art (contract
theory / personnel economics, accounting performance measurement, public finance,
welfare economics, environmental / corrective-tax, management & social
measurement, signaling / contest theory) that contains the same mathematics as
the multidimensional-Goodhart framework (goal vector G, proxy vector P, selection
pressure on scalarized Σ w_j P_j, hidden harm in unmeasured directions).

**What this is / isn't.** Discovery + *preliminary* mapping only. Primary-source
proposition-number verification is Task 08; below I flag paywalled originals and
tag statements reconstructed from secondary sources rather than asserting exact
theorem numbers.

> **CORRECTION (Task 08, 2026-06-24):** `prior-art-verification.md` supersedes the
> proposition labels here. Notably, Reynaert–Sallee's *either-direction welfare*
> result is **Proposition 2** (not Prop. 4; Prop. 4 is the tighter-policy⇒more-
> gaming comparative static). Use the verified file for any pinned number. Tags: `[fetched]` = abstract/result confirmed from a fetched
page or OpenAlex record; `[secondary]` = statement reconstructed from a review /
summary, original not yet read; `[paywalled]` = original behind paywall, flag for
Task 08.

**Theorem families used in the MAPPING column** (shared vocabulary with the book / AI results):
- **T5-congruity** — proportionality condition h = c·w; distortion = 1 − cosθ; "exchange rate" h_j/w_j; hidden harm = weighted average of exchange rates.
- **equimarginal** — least-cost allocation across measured channels; load ∝ κ_j w_j; separable quadratic cost.
- **set-monotonicity** — adding/removing a measured channel moves harm up or down, not governed by channel count.
- **second-best** — distorting one margin to correct another; reform calculus.
- **corrective-Goodhart** — the named non-AI "Goodhart's law" sibling for corrective policy / gaming.
- **aggregation/sufficiency** — when can a scalar Σ w_j P_j be a sufficient statistic for the vector P; linear-aggregation conditions.
- **signaling/T3** — costly threshold-crossing, separating equilibria, effort displacement under a single observable.
- **dysfunction-genealogy** — the pre-formal "measurement corrupts" lineage (Ridgway → Campbell → Goodhart → Strathern).

**T5 set already established (do not re-derive; listed here only as anchors):**
Feltham–Xie 1994, Baker 1992 / 2002, Holmström–Milgrom 1991, Datar–Kulp–Lambert
2001, Baumol–Oates, Montgomery 1972, Reynaert–Sallee 2016, Chetty 2009,
Feldstein 1999. These appear below with full pinned DOIs so the bibliography is
self-contained, but the *new* breadth is flagged in the summary.

---

## 1. Contract theory / personnel economics

**Holmström, B. (1979). "Moral Hazard and Observability." *Bell Journal of
Economics* 10(1): 74–91.** DOI 10.2307/3003320. (OpenAlex, 8514 cites.) `[fetched]`
- STATEMENT: Optimal incentive contract weights each signal by its
  informativeness about the agent's action (the "informativeness principle"); any
  signal that is informative conditional on the outcome should enter the contract.
- MAPPING: **aggregation/sufficiency** foundation. Establishes the projection
  lens — what the principal can condition on is a statistic of underlying signals;
  the scalarization Σ w_j P_j is the degenerate case where only one statistic is
  used. Sets up the gap that congruity later fills.

**Holmström, B. & Milgrom, P. (1987). "Aggregation and Linearity in the Provision
of Intertemporal Incentives." *Econometrica* 55(2): 303–328.** DOI 10.2307/1913238.
(OpenAlex, 2957 cites.) `[fetched]`
- STATEMENT: Under exponential utility and Brownian information, the optimal
  contract is *linear* in an aggregate of the performance signals; a single linear
  index Σ w_j P_j is sufficient.
- MAPPING: **aggregation/sufficiency** — the canonical result licensing a *linear
  scalarized measure*. This is the formal warrant for why the proxy is a weighted
  sum at all; the book's Σ w_j P_j inherits its structure here.

**Holmström, B. & Milgrom, P. (1991). "Multitask Principal–Agent Analyses:
Incentive Contracts, Asset Ownership, and Job Design." *J. Law, Economics &
Organization* 7 (special issue): 24–52.** DOI 10.1093/jleo/7.special_issue.24.
(OpenAlex, 6114 cites.) `[fetched]` (T5 anchor — included for completeness)
- STATEMENT: When effort is allocated across multiple tasks and some tasks are
  poorly measured, strengthening the incentive on a measured task *draws effort
  away* from unmeasured tasks; the equal-compensation principle says tasks
  competing for the same effort must be rewarded equally or one is starved. Optimal
  to *lower* incentive intensity (or omit the measure) when an important dimension
  is unmeasurable.
- MAPPING: **set-monotonicity** + **equimarginal**. The effort-substitution
  mechanism is exactly "load shifts toward measured channels, harm accrues in
  unmeasured directions." The "teach-to-the-test → fixed salary" example is the
  prototype of the AI multidimensional-Goodhart story.

**Banker, R. & Datar, S. (1989). "Sensitivity, Precision, and Linear Aggregation
of Signals for Performance Evaluation." *J. Accounting Research* 27(1): 21–39.**
DOI 10.2307/2491205. (OpenAlex, 930 cites.) `[fetched]`
- STATEMENT: Derives the optimal *linear aggregation weights* of multiple signals:
  each signal's weight is proportional to its sensitivity-to-precision ratio
  (signal/noise). Characterizes exactly when a weighted sum of signals is a
  sufficient statistic for incentive purposes.
- MAPPING: **aggregation/sufficiency** + **T5-congruity**. This is the *native home
  for the weight vector w_j itself* — it tells you what the w_j "should" be
  (sensitivity ∝). The mismatch between welfare-optimal weights and
  measurement-optimal weights is precisely the source of the hidden-harm exchange
  rate h_j/w_j. Strong NEW item: gives the weights a first-principles derivation.

**Baker, G. (1992). "Incentive Contracts and Performance Measurement." *J.
Political Economy* 100(3): 598–614.** DOI 10.1086/261831. (OpenAlex, 1098 cites.)
`[fetched]` (T5 anchor)
- STATEMENT: A performance measure imperfectly aligned with the true objective
  induces distortion; the value of an incentive contract depends on the
  *alignment* (correlation) between the measure's marginal products and the
  principal's, not on the measure's noise alone. A measure can be precise yet
  worthless if misaligned.
- MAPPING: **T5-congruity**. The alignment/distortion term is the 1 − cosθ
  geometry already identified in T5.

**Baker, G. (2002). "Distortion and Risk in Optimal Incentive Contracts." *J.
Human Resources* 37(4): 728–751.** DOI 10.2307/3069615. (OpenAlex, 486 cites.)
`[fetched]` (T5 anchor)
- STATEMENT: Decomposes the loss from a performance measure into a *distortion*
  component (systematic misdirection of effort, = angle between measure and
  objective gradient) and a *risk* component (noise). Distortion is the
  cosine-similarity defect.
- MAPPING: **T5-congruity** — the explicit distortion = 1 − cosθ statement.

**Feltham, G. & Xie, J. (1994). "Performance Measure Congruity and Diversity in
Multi-Task Principal/Agent Relations." *The Accounting Review* 69(3): 429–453.**
DOI 10.2308/tar-9412141436. (OpenAlex, 949 cites.) `[fetched]` (T5 anchor — the
verbatim h = c·w match)
- STATEMENT: A performance measure is *congruent* iff its vector of marginal
  sensitivities to the agent's actions is proportional to the principal's value
  vector; non-congruity (any angular deviation) produces effort misallocation.
- MAPPING: **T5-congruity** — this is the proportionality condition h = c·w itself.

**Datar, S., Kulp, S. & Lambert, R. (2001). "Balancing Performance Measures." *J.
Accounting Research* 39(1): 75–92.** DOI ~10.1111/1475-679X.00004 (confirm in 08).
`[paywalled]` (T5 anchor for set-monotonicity)
- STATEMENT: With multiple congruent-but-imperfect measures, the optimal weighting
  trades off congruity against noise; *adding* a measure can help or hurt depending
  on its incremental congruity and correlation, not on the count of measures.
- MAPPING: **set-monotonicity** — direct native home for "adding/removing a channel
  moves harm either way."

**Schnedler, W. (2006/2008). "Performance Measure Congruity in Linear Agency
Models with Interactive Tasks."** OpenAlex epub 10.5282/ubm/epub.13348 (working
paper); published version *Journal of Accounting Research*-adjacent (confirm venue
in 08). `[fetched]` (record), `[secondary]` (result)
- STATEMENT: Generalizes the congruity condition to *interactive* tasks (where the
  marginal value of effort on one task depends on effort on another), giving a
  congruity criterion when the value/sensitivity structure is non-separable.
- MAPPING: **T5-congruity** generalization — relaxes the separability the book's
  quadratic-cost result assumes. NEW: tells us how robust the proportionality
  condition is to task interaction. Flag for 08 (separable-cost vs interactive).

**Budde, J. (2007/2009). "Performance Measure Congruity and the Balanced
Scorecard." / "Variance Analysis and Linear Contracts in Agencies with Distorted
Performance Measures."** (OpenAlex returned BSC-incentives literature, not the
exact Budde paper — flag.) `[secondary]`
- STATEMENT (secondary): Studies how variance/aggregation interacts with congruity
  when distorted measures are combined; conditions under which adding a corrective
  measure restores congruity.
- MAPPING: **T5-congruity** + **set-monotonicity**. Flag for 08: locate exact
  Budde citation (likely *Management Science* 2007 / *RAST*).

**Baker, G., Gibbons, R. & Murphy, K. (1994). "Subjective Performance Measures in
Optimal Incentive Contracts." *QJE* 109(4): 1125–1156.** (Not surfaced cleanly by
OpenAlex search; DOI ~10.2307/2118358, confirm in 08.) `[secondary]`
- STATEMENT: Combining an objective (distorted) measure with a subjective measure
  can reduce distortion; the subjective signal substitutes for the missing
  dimensions of the objective proxy.
- MAPPING: **set-monotonicity** + **T5-congruity** — adding a channel (subjective)
  to repair the angle. Flag for 08.

**Prendergast, C. (1999). "The Provision of Incentives in Firms." *J. Economic
Literature* 37(1): 7–63.** (Canonical survey; DOI 10.1257/jel.37.1.7, confirm.)
`[secondary]`
- STATEMENT: Survey; section on multitasking and distortion catalogs the
  measured/unmeasured effort-substitution problem and the empirical record of
  gaming.
- MAPPING: **set-monotonicity** survey anchor; useful as the field's own summary of
  the mechanism.

**Gibbons, R. (1998). "Incentives in Organizations." *J. Economic Perspectives*
12(4): 115–132.** DOI 10.1257/jep.12.4.115 (confirm). `[secondary]`
- STATEMENT: Accessible synthesis of the multitask/distortion result; coins the
  "you get what you pay for" framing of effort misallocation under imperfect
  measures.
- MAPPING: **set-monotonicity** / **equimarginal** survey anchor.

**Bénabou, R. & Tirole, J. (2016). "Bonus Culture: Competitive Pay, Screening, and
Multitasking." *J. Political Economy* 124(2): 305–370.** (DOI 10.1086/684853,
confirm.) `[secondary]`
- STATEMENT: High-powered competitive pay amplifies multitask distortion — agents
  divert effort to the measured/rewarded dimension and away from intrinsic-value
  (unmeasured) dimensions; market competition makes the distortion worse.
- MAPPING: **set-monotonicity** at scale — selection pressure (competition) on the
  scalarized measure intensifies hidden harm. NEW: connects *selection pressure
  strength* to harm magnitude, parallel to the book's "pressure on Σ w_j P_j."

**Courty, P. & Marschke, G. (2004). "An Empirical Investigation of Gaming
Responses to Explicit Performance Incentives." *J. Labor Economics* 22(1):
23–56.** (DOI 10.1086/380402, confirm.) `[secondary]`
- STATEMENT: Empirical demonstration that agents (job-training bureaucrats under
  JTPA) game an explicit output measure — timing certifications to hit a quantified
  target — producing measured gains with no real value gain.
- MAPPING: **corrective-Goodhart** empirical instance; **equimarginal** (agents
  reallocate to the cheapest score-raising actions).

**Holmström, B. (2017). "Pay for Performance and Beyond." (Nobel Prize Lecture.)
*American Economic Review* 107(7): 1753–1777.** DOI 10.1257/aer.107.7.1753.
(OpenAlex, 165 cites.) `[fetched]`
- STATEMENT: Retrospective synthesis: imperfect measurement is the central friction;
  low-powered incentives, job design, and bundling are responses to the multitask /
  measurement-gaming problem.
- MAPPING: field's own canonical framing of the whole problem — useful citation
  anchor; **set-monotonicity** / **aggregation**.

**SATURATION NOTE (contract theory).** Searches converged: Holmström 1979/1987/1991,
Banker–Datar 1989, Baker 1992/2002, Feltham–Xie 1994, Schnedler 2006 are the load
cluster and recur across every query path. Budde and Baker–Gibbons–Murphy did not
surface cleanly via OpenAlex title search (flagged for 08 manual pinning). No new
*distinct* congruity-family results appeared after the third query batch — the
subfield is saturated at the level of the proportionality / linear-aggregation core.

---

## 2. Accounting (performance measurement)

**Şabac, F. & Yoo, J. (2018/2019). "Statistically Sufficient Aggregation of
Performance Measures under a Normal Distribution." *Theoretical Economics Letters*
9(7).** DOI 10.4236/tel.2019.97141 (OpenAlex). `[fetched]` (record)
- STATEMENT: Characterizes when a linear aggregate of multiple performance measures
  is a *statistically sufficient statistic* — i.e., when collapsing the vector P to
  Σ w_j P_j loses no decision-relevant information.
- MAPPING: **aggregation/sufficiency** — the cleanest native statement of *when the
  scalarization is lossless* (and, by contraposition, when hidden dimensions are
  necessarily dropped). Strong NEW item: directly the "is the scalar a sufficient
  statistic for the vector" question. Flag venue/version in 08 (TEL is a low-tier
  outlet; check for a stronger working-paper or *Contemporary Accounting Research*
  version).

**Roychowdhury, S. (2006). "Earnings Management through Real Activities
Manipulation." *J. Accounting & Economics* 42(3): 335–370.** (OpenAlex returned
the real-earnings-management cluster; DOI 10.1016/j.jacceco.2006.01.002, confirm.)
`[secondary]`
- STATEMENT: Managers manipulate *real* operations (cutting R&D, overproducing,
  discounting) to hit earnings targets, sacrificing long-run value for a measured
  short-run number.
- MAPPING: **corrective-Goodhart** / **set-monotonicity** — real-activities gaming
  is exactly "load shifts to the measured channel, hidden harm in the unmeasured
  long-run-value direction." Empirical bedrock.

**Kaplan, R. & Norton, D. (1992). "The Balanced Scorecard — Measures That Drive
Performance." *Harvard Business Review* 70(1): 71–79.** + its critique literature.
`[secondary]`
- STATEMENT: Advocates a *vector* of measures across four perspectives instead of a
  single financial scalar; critique literature (Nørreklit 2000; practitioner
  critiques) shows naive aggregation/weighting of the four reintroduces distortion
  and gaming when scorecards drive compensation.
- MAPPING: **set-monotonicity** practitioner instance — the explicit "add more
  measured channels to reduce harm" intervention, plus the warning that *count*
  isn't what governs it (matching the book's set-monotonicity-not-count claim).
- Nørreklit, H. (2000). "The balance on the balanced scorecard — a critical
  analysis of some of its assumptions." *Management Accounting Research* 11(1):
  65–88 (confirm DOI in 08). `[secondary]`

**SATURATION NOTE (accounting).** Accounting overlaps heavily with §1 (Feltham–Xie,
Banker–Datar, Datar–Kulp–Lambert are accounting-journal papers already there).
The *distinct* accounting contributions are (a) the sufficient-aggregation thread
(Şabac–Yoo) and (b) the earnings-management/balanced-scorecard *empirical* gaming
literature. After locating those two threads, further searches returned only the
already-cataloged agency core or generic performance-measurement reviews — saturated.

---

## 3. Public finance

**Chetty, R. (2009). "Sufficient Statistics for Welfare Analysis: A Bridge Between
Structural and Reduced-Form Methods." *Annual Review of Economics* 1: 451–488.**
DOI 10.1146/annurev.economics.050708.142910. (NBER w14399, 2008.) `[fetched]`
(T5 anchor)
- STATEMENT: A high-dimensional welfare problem can often be evaluated through a
  small number of *sufficient statistics* (e.g., an elasticity), without recovering
  the full structural model.
- MAPPING: **aggregation/sufficiency** — the public-finance name for the projection:
  when does a low-dimensional summary capture welfare? The packaging the book uses.

**Chetty, R. (2009). "Is the Taxable Income Elasticity Sufficient to Calculate
Deadweight Loss? The Implications of Evasion and Avoidance." *AEJ: Economic
Policy* 1(2): 31–52.** DOI 10.1257/pol.1.2.31. (OpenAlex, 353 cites.) `[fetched]`
- STATEMENT: The taxable-income elasticity is a sufficient statistic for deadweight
  loss *only* when the response has no fiscal externality (e.g., pure evasion
  transfers); otherwise the scalar elasticity *over- or under-states* the true
  welfare cost — the measured response and the welfare-relevant response diverge.
- MAPPING: **T5-congruity** in public-finance clothes — the elasticity is a proxy
  whose "exchange rate" to true welfare is wrong unless a proportionality
  (no-externality) condition holds. Strong NEW item: an explicit
  *condition for the scalar summary to equal true welfare*, structurally identical
  to h = c·w. This is arguably the sharpest non-AI, non-accounting statement of the
  proportionality result.

**Feldstein, M. (1999). "Tax Avoidance and the Deadweight Loss of the Income
Tax." *Review of Economics and Statistics* 81(4): 674–680.** DOI
10.1162/003465399558391 (confirm). `[secondary]` (T5 anchor)
- STATEMENT: The deadweight loss of taxation is governed by the *total* behavioral
  response (the elasticity of taxable income), not just hours worked; all margins of
  gaming/avoidance feed the welfare cost.
- MAPPING: **aggregation/sufficiency** — collapses many response margins into one
  measured elasticity; sets up Chetty's correction.

**Saez, E. (2010). "Do Taxpayers Bunch at Kink Points?" *AEJ: Economic Policy*
2(3): 180–212.** (NBER w7366, 1999.) DOI 10.1257/pol.2.3.180 (confirm). `[fetched]`
(record)
- STATEMENT: Taxpayers *bunch* at kinks in the tax schedule, revealing that
  behavior tracks the *measured/incentivized* threshold rather than smooth
  optimization — a sharp empirical signature of responding to the measure.
- MAPPING: **signaling/T3** + **corrective-Goodhart** — threshold-crossing response;
  agents pile up exactly where the measure pays off.

**Kleven, H. & Waseem (2013) / Kleven (2016 survey). Notches.** Kleven, H. (2016).
"Bunching." *Annual Review of Economics* 8: 435–464 (confirm DOI). `[secondary]`
- STATEMENT: At a *notch* (discontinuity in the level, not slope, of the
  tax/benefit), behavioral responses are large and produce a "hole" in the
  distribution just above the threshold — extreme gaming of a discontinuous measure.
- MAPPING: **signaling/T3** / **corrective-Goodhart** — discontinuous measures
  produce discontinuous gaming; native home for "sharp targets are gamed hardest."

**SATURATION NOTE (public finance).** Two distinct threads: (a) sufficient-statistic
welfare (Chetty 2009 ×2, Feldstein 1999) — the *aggregation/proportionality* home;
(b) bunching/notch (Saez, Kleven) — the *threshold-gaming* home. Both threads
saturated quickly: queries kept returning the same Danish-tax-records empirical
cluster (Chetty et al. 2011, Kleven et al. 2014) which is downstream application,
not new theory. The Chetty "is the elasticity sufficient" result is the single
strongest new public-finance item for the proportionality claim.

---

## 4. Welfare economics

**Lipsey, R. & Lancaster, K. (1956). "The General Theory of Second Best." *Review
of Economic Studies* 24(1): 11–32.** DOI 10.2307/2296233. (OpenAlex, 2008 cites.)
`[fetched]`
- STATEMENT: If one optimality condition cannot be satisfied, satisfying the
  *remaining* conditions is generally *not* second-best optimal; the constrained
  optimum may require deliberately violating other conditions.
- MAPPING: **second-best**. Native home for "you cannot fix a multidimensional
  objective by perfecting each measured channel independently" — improving one
  measured dimension while another stays unmeasured can *reduce* welfare. Directly
  underwrites the book's set-monotonicity (adding a channel can hurt) at the level
  of welfare theory.

**Theory of reform (Feldstein 1976; Guesnerie 1977; Diamond–Mirrlees 1971
optimal-taxation lineage).** `[secondary]` (OpenAlex title search for "theory of
reform and indirect taxation" returned empty — flag for 08 to pin exact
Ahmad–Stern 1984 / Guesnerie reform-direction citation.)
- STATEMENT: Characterizes welfare-improving *directions* of marginal reform when a
  full optimum is unreachable — the gradient of welfare w.r.t. each instrument,
  accounting for distortions on other margins.
- MAPPING: **second-best** / **equimarginal** — the reform gradient is the
  multidimensional analogue of "which channel to load next." Flag for 08.

**SATURATION NOTE (welfare).** Lipsey–Lancaster is the dominant, unambiguous result;
it recurs as the single citation everywhere "second best" appears. The
theory-of-reform extension is real but its exact canonical citation needs manual
pinning (OpenAlex title search missed it). Otherwise saturated — welfare economics
contributes the *second-best principle* and little additional distinct machinery
beyond it for this project.

---

## 5. Environmental / corrective-tax economics

**Reynaert, M. & Sallee, J. (2016/2021). "Corrective Policy and Goodhart's Law:
The Case of Carbon Emissions from Automobiles." NBER w22911 (2016); pub. *AEJ:
Economic Policy* (2021).** DOI 10.3386/w22911. (OpenAlex, 14 cites.) `[fetched]`
(T5 anchor — the *named* non-AI Goodhart sibling)
- STATEMENT: When a corrective tax is levied on a *measured proxy* (lab fuel-economy
  ratings) rather than the true externality (real-world emissions), firms game the
  proxy; welfare gains are eroded in proportion to the proxy–target gap. Explicitly
  invokes "Goodhart's law."
- MAPPING: **corrective-Goodhart** (the eponymous one) + **T5-congruity** (gap
  between measured proxy gradient and true-harm gradient).

**Reynaert, M. & Sallee, J. (2021). "Who Benefits When Firms Game Corrective
Policies?" *AEJ: Economic Policy* 13(1): 372–412.** DOI 10.1257/pol.20190019.
(OpenAlex, 11 cites.) `[fetched]`
- STATEMENT: Analyzes the *distributional* incidence of proxy-gaming under corrective
  policy — gaming isn't pure deadweight; it redistributes among firms/consumers.
- MAPPING: **corrective-Goodhart** refinement — the hidden harm has a sign structure
  across agents, a useful nuance for the book's "harm = weighted avg of exchange
  rates" (the average hides distribution).

**Weitzman, M. (1974). "Prices vs. Quantities." *Review of Economic Studies* 41(4):
477–491.** DOI 10.2307/2296698. (OpenAlex, 2764 cites.) `[fetched]`
- STATEMENT: Under uncertainty, a price instrument and a quantity instrument that
  coincide at the expected optimum diverge in welfare cost depending on the relative
  slopes of marginal benefit and marginal cost curves; the *choice of which margin
  to fix* determines the loss.
- MAPPING: **second-best** / **equimarginal** — which control variable you measure
  and pin determines distortion. Adjacent home for "the choice of measured channel
  matters, not just its presence."

**Baumol, W. & Oates, W. (1971). "The Use of Standards and Prices for Protection of
the Environment." *Swedish J. of Economics* 73(1): 42–54.** DOI 10.2307/3439132.
(OpenAlex, 558 cites.) `[fetched]` (T5 anchor)
- STATEMENT: A uniform price (tax) on a pollutant achieves a given aggregate
  abatement target at *least total cost* because each source abates until its
  marginal abatement cost equals the common price — equimarginal principle.
- MAPPING: **equimarginal** — the native home for "agent closes a deficit at least
  cost → marginal costs equalized across channels; load ∝ κ_j w_j."

**Montgomery, W. D. (1972). "Markets in Licenses and Efficient Pollution Control
Programs." *J. Economic Theory* 5(3): 395–418.** DOI 10.1016/0022-0531(72)90049-X
(confirm). `[secondary]` (T5 anchor; OpenAlex surfaced the 1976 instrument-choice
companion, flag exact 1972 DOI for 08)
- STATEMENT: A tradable-permit market decentralizes least-cost abatement: trading
  equalizes marginal abatement costs across sources, reproducing the equimarginal
  optimum.
- MAPPING: **equimarginal** — second canonical home for least-cost allocation across
  channels.

**SATURATION NOTE (environmental).** Tight, well-defined cluster: Baumol–Oates 1971 +
Montgomery 1972 (equimarginal), Weitzman 1974 (instrument-choice/second-best),
Reynaert–Sallee 2016/2021 (corrective-Goodhart). These four exhaust the directly
relevant theory; downstream queries returned applied EU-ETS / cap-and-trade
empirics with no new structural result. Saturated. Reynaert–Sallee remains the
single most important bridge item (it literally names Goodhart's law in econ).

---

## 6. Management / organization science & social measurement (the genealogy)

**Ridgway, V. F. (1956). "Dysfunctional Consequences of Performance Measurements."
*Administrative Science Quarterly* 1(2): 240–247.** DOI 10.2307/2390989 (confirm).
`[fetched]` (via MAAW summary)
- STATEMENT: Single measures induce wasteful, goal-distorting behavior; *composite*
  measures (explicit weighting then summing of sub-measures) generate role/value
  conflict and still distort; indiscriminate confidence in quantitative measures
  causes organizational harm. Predates Goodhart (1975) by 19 years.
- MAPPING: **dysfunction-genealogy** *origin point* + explicit treatment of the
  *composite/weighted-sum* measure Σ w_j P_j and its distortion. Strong NEW item:
  the genealogical root, and it already discusses the scalarization-of-a-vector
  construction directly. This is the historical anchor for "the math predates the
  AI framing."

**Kerr, S. (1975). "On the Folly of Rewarding A, While Hoping for B." *Academy of
Management Journal* 18(4): 769–783.** DOI 10.2307/255378. `[fetched]`
- STATEMENT: Reward systems routinely incentivize a measurable proxy (A) while the
  principal wants the unmeasured goal (B); agents rationally optimize A. Catalogs
  domains (medicine, war, sports, business).
- MAPPING: **dysfunction-genealogy** + **set-monotonicity** — the canonical
  managerial statement of proxy/goal divergence.

**Campbell, D. T. (1979). "Assessing the Impact of Planned Social Change."
*Evaluation and Program Planning* 2(1): 67–90.** DOI 10.1016/0149-7189(79)90048-X
(confirm). (Also 1976 Dartmouth occasional-paper version.) `[fetched]`
- STATEMENT: "Campbell's Law" — *the more any quantitative social indicator is used
  for social decision-making, the more subject it will be to corruption pressures
  and the more apt it will be to distort and corrupt the social processes it is
  intended to monitor.* (Nixon crime-rate example.)
- MAPPING: **dysfunction-genealogy** — the sociology-of-measurement twin of
  Goodhart; couples *selection pressure* (use for decisions) to distortion, exactly
  the book's "pressure on Σ w_j P_j → harm" linkage.

**Strathern, M. (1997). "'Improving Ratings': Audit in the British University
System." *European Review* 5(3): 305–321.** DOI 10.1002/(SICI)1234-981X
(via repec cup:eurrev). `[fetched]`
- STATEMENT: Source of the now-canonical *phrasing* "when a measure becomes a
  target, it ceases to be a good measure" — an anthropological account of audit
  distorting the activity it measures.
- MAPPING: **dysfunction-genealogy** — the proximate origin of the popular Goodhart
  formulation actually cited by AI-safety work; important for the citation-gap
  argument (the AI canon cites the *phrasing* via Strathern but not the *math* via
  Feltham–Xie etc.).

**Smith, P. (1995). "On the Unintended Consequences of Publishing Performance Data
in the Public Sector." *International J. of Public Administration* 18(2–3):
277–310.** DOI 10.1080/01900699508525011. `[fetched]`
- STATEMENT: Enumerates *eight* dysfunctional consequences of performance publication
  (tunnel vision, suboptimization, myopia, measure fixation, misrepresentation,
  gaming, ossification, complacency).
- MAPPING: **dysfunction-genealogy** taxonomy — "suboptimization" and "tunnel vision"
  are the set-monotonicity/hidden-harm phenomena named; useful structured vocabulary.

**Bevan, G. & Hood, C. (2006). "What's Measured Is What Matters: Targets and Gaming
in the English Public Health Care System." *Public Administration* 84(3):
517–538.** DOI 10.1111/j.1467-9299.2006.00600.x. `[fetched]`
- STATEMENT: "Synecdoche" — a measured part stands for an unmeasured whole; documents
  systematic gaming of NHS targets (e.g., ER wait-time gaming — patients held in
  ambulances). Empirical demonstration of target-gaming at system scale.
- MAPPING: **set-monotonicity** + **corrective-Goodhart** empirical — synecdoche IS
  the projection-loses-dimensions idea. (NB: the ER wait-time dysfunction paper that
  surfaced under the Courty–Marschke query — Bevan/Hood-adjacent NPM literature.)

**Muller, J. Z. (2018). *The Tyranny of Metrics.* Princeton University Press.**
ISBN 9780691174952. `[fetched]`
- STATEMENT: Synthesizes "metric fixation" dysfunctions: measuring the easy not the
  important; measuring inputs not outcomes; gaming; goal displacement. Explicitly
  cites Goodhart's and Campbell's laws.
- MAPPING: **dysfunction-genealogy** modern synthesis — the trade-book that ties the
  whole lineage together; convenient single citation for the qualitative side.

**Braganza, O. (2022). "Proxyeconomics, a theory and model of proxy-based
competition and cultural evolution." *Royal Society Open Science* 9(2): 211030.**
DOI 10.1098/rsos.211030. (Earlier: 2018 arXiv 1803.00345.) `[fetched]`
- STATEMENT: Formal agent-based model showing that under competition on a *proxy*
  (rather than the true goal), selection inevitably corrupts the proxy — a
  Campbell's-law dynamic; quantifies proxy–goal divergence as a function of
  selection strength.
- MAPPING: **corrective-Goodhart** / **dysfunction-genealogy** — a *formal* bridge
  between the management lineage and selection-pressure math; closest existing
  non-AI formalization of "pressure on the proxy degrades the goal." Strong NEW item:
  an explicit dynamic model coupling selection strength to distortion, recent and
  cross-disciplinary.

**SATURATION NOTE (management / social measurement).** This subfield is where the
*genealogy* lives and it saturated cleanly into a canonical chain: Ridgway 1956 →
Kerr 1975 → Goodhart 1975 → Campbell 1979 → Smith 1995 → Strathern 1997 →
Bevan–Hood 2006 → Muller 2018 → Braganza 2022. Every query re-surfaced this chain
plus NPM empirical applications (NHS targets, NCLB) that are instances, not new
mechanisms. Ridgway (composite measures) and Braganza (formal proxy dynamics) are
the two highest-value items here. Saturated.

---

## 7. Signaling / contest theory (lower-tier T3 home)

**Spence, M. (1973). "Job Market Signaling." *Quarterly J. of Economics* 87(3):
355–374.** DOI 10.2307/1882010 (confirm). `[secondary]` (OpenAlex surfaced
derivative works; pin original in 08)
- STATEMENT: Agents incur a costly, otherwise-useless signal (education) whose cost
  is negatively correlated with the hidden type; a separating equilibrium forms in
  which the *measured* signal substitutes for the *unobservable* productivity.
- MAPPING: **signaling/T3** — costly threshold-crossing on a single observable;
  effort flows to the measured signal regardless of true-value content. The
  cleanest "agent invests in the proxy because the proxy is what's selected on."

**Education-accountability gaming (empirical T3 instances):**
- **Jacob, B. & Levitt, S. (2003). "Rotten Apples: An Investigation of the
  Prevalence and Predictors of Teacher Cheating." NBER w9413 / *QJE* 2003.** DOI
  10.3386/w9413. `[fetched]` — teachers/schools game high-stakes test scores
  (outright cheating). MAPPING: **corrective-Goodhart** empirical.
- **Neal, D. & Schanzenbach, D. (2010). "Left Behind by Design: Proficiency Counts
  and Test-Based Accountability." *Review of Economics and Statistics* 92(2):
  263–283.** (NBER 2007.) `[fetched]` — proficiency-threshold targets cause schools
  to reallocate effort to "bubble" students near the cutoff, neglecting others.
  MAPPING: **set-monotonicity** + **signaling/T3** (threshold gaming + effort
  reallocation across the unmeasured student distribution).
- **Lazear, E. (2006). "Speeding, Terrorism, and Teaching to the Test." *QJE*
  121(3): 1029–1061.** DOI 10.1162/qjec.121.3.1029. `[fetched]` — formal model of
  when revealing *which* dimension is tested causes effort concentration on it.
  MAPPING: **set-monotonicity** — measured-channel concentration.

**Contest / all-pay auction theory:**
- **Baye, M., Kovenock, D. & de Vries, C. (1996). "The All-Pay Auction with
  Complete Information." *Economic Theory* 8(2): 291–305.** DOI 10.1007/BF01211819.
  `[fetched]` — agents expend costly effort (sunk regardless of winning) to win a
  prize awarded on a measured rank. MAPPING: **signaling/T3** / **equimarginal** —
  rank-based selection on a measure induces costly effort allocation; the contest
  is selection pressure on Σ w_j P_j.
- **Frankel, A. & Kartik, N. (2019). "Muddled Information." *J. Political Economy*
  127(4): 1739–1776.** DOI 10.1086/701604. `[fetched]`
  - STATEMENT: When agents have both "natural" type and a gaming ability, a measure
    becomes *less informative* the more it is used to reward — a formal Goodhart's
    law for signaling: the equilibrium measure "muddles" type and gaming.
  - MAPPING: **corrective-Goodhart** / **signaling/T3** — *the* modern game-theoretic
    formalization of "using a measure to select degrades the measure." Strong NEW
    item bridging signaling and Goodhart.
- **Frankel, A. & Kartik, N. (2021). "Improving Information from Manipulable Data."
  *J. European Economic Association* 19(1): 79–123.** DOI 10.1093/jeea/jvab017.
  `[fetched]` — how a principal should *down-weight / de-bias* a manipulable measure;
  the optimal response to gaming. MAPPING: **corrective-Goodhart** (mitigation side).

**SATURATION NOTE (signaling / contest).** Two clusters: (a) the Spence-lineage +
education-accountability empirics (threshold-crossing on a single observable), and
(b) the Frankel–Kartik "muddled / manipulable information" theory, which is the
strongest formal Goodhart-for-signaling result and bridges back to corrective
policy. All-pay/contest theory is a real but *looser* home (selection-on-rank). No
new distinct mechanism after surfacing Frankel–Kartik; saturated. This is correctly
a lower-tier (T3) home — the math is a special case (single observable) of the
multidimensional contract-theory core in §1.

---

## Cross-subfield synthesis: "same math, different field"

The shared mathematical object — *project a value vector onto a measured proxy
vector, then put selection pressure on a scalarized index* — has these native
names, which is the paper's core claim made concrete:

| Math object | Contract theory | Public finance | Env econ | Welfare | Management |
|---|---|---|---|---|---|
| proportionality h = c·w / zero-distortion | Feltham–Xie congruity; Baker 1−cosθ | Chetty: elasticity = welfare iff no externality | Reynaert–Sallee proxy=target | — | Ridgway composite-measure conflict |
| least-cost allocation (equimarginal) | Holmström–Milgrom equal-comp | — | Baumol–Oates / Montgomery | — | — |
| linear scalarization is sufficient | Banker–Datar; HM 1987; Şabac–Yoo | Chetty/Feldstein sufficient statistic | — | — | — |
| adding a channel ≠ monotone in count | Datar–Kulp–Lambert; Baker–Gibbons–Murphy | — | — | Lipsey–Lancaster 2nd-best | Kaplan–Norton/Nørreklit BSC |
| selection pressure degrades proxy | Bénabou–Tirole; Frankel–Kartik | bunching/notch (Saez, Kleven) | Reynaert–Sallee | — | Campbell's law; Braganza |

---

## Items flagged for Task 08 (primary-source verification / exact-pin)

1. Budde — exact citation/venue not pinned (likely *Management Science* 2007).
2. Baker–Gibbons–Murphy 1994 QJE — DOI not surfaced by OpenAlex title search.
3. Schnedler 2006 — confirm published venue (only working-paper epub surfaced).
4. Şabac–Yoo — confirm whether TEL 2019 is the canonical version or a stronger one exists.
5. Datar–Kulp–Lambert 2001 DOI; Montgomery 1972 exact DOI.
6. Theory-of-reform exact citation (Guesnerie / Ahmad–Stern) — OpenAlex missed it.
7. All `[secondary]` STATEMENT lines need proposition-number verification against
   the primary source (Prendergast, Gibbons, Bénabou–Tirole, Courty–Marschke,
   Roychowdhury, Nørreklit, Feldstein 1999, Kleven, Spence, Campbell 1979 page).

---

## ADVERSARIAL BREADTH PASS — SYNTHESIS (2026-06-28)

Six deep-research passes (ChatGPT/Claude/Gemini × optimistic/pessimistic), raw in
`prior-art-hunt/`. Purpose: did we miss prior art, are the mappings right, does any
single source already unify the framework. **The spread is the signal.**

### New prior-art items to fold into the dictionary (verify in Task 08)
- **Amershi, Banker & Datar 1990** "Economic Sufficiency and Statistical
  Sufficiency in Accounting Aggregation," *Accounting Review* 65(1):113–130 — both
  Claude passes call it a **closer home for piece 4 (sufficiency) than Chetty
  2009**: it directly separates economic vs statistical sufficiency of an aggregate.
- **Ito & Sallee 2018** "The Economics of Attribute-Based Regulation," *REStat*
  100(2):319–336 — the **multidimensional (attribute-by-weight) regulator-gaming**
  home; "closest existing analogue of the weighted-proxy setup" (3 passes). Strong
  new piece-5 item beyond Reynaert–Sallee.
- **Choi, Hecht & Tayler 2012** "Strategy Selection, Surrogation, and SPMS,"
  *JAR* 51(1):105–133 — accounting "surrogation" (proxy becomes the target);
  pieces 2/3.
- **Slemrod 2001 / Saez–Slemrod–Giertz 2012** (elasticity of taxable income) —
  least-cost-margin gaming outside agency theory; piece 1.
- **Budde 2007** (*JAR*) — used as the **open primary-grade derivation** of the
  Feltham–Xie congruity index (cos²β / parallel-vectors) since the originals are
  paywalled (already leaned on in `prior-art-verification.md`).
- Pre-Ridgway genealogy roots: **Merton 1940** (goal displacement), **Blau 1955**
  (*Dynamics of Bureaucracy*, quota gaming) — older than Ridgway 1956 for the
  qualitative metric-corruption proposition (Gemini; Claude calls Ridgway still the
  first *clean* statement — a recorded disagreement).
- **Likely hallucinated / unverifiable — DO NOT cite without a source:**
  "Hennessy–Goodhart formalizations" (Gemini, no venue), bare "Kim 1995",
  "Yoo 2019" (no titles); the exact Marschak–Radner sufficiency statement (Claude,
  self-flagged unverified).

### Mapping corrections (load-bearing)
- **Piece 4 (sufficiency): Chetty 2009 is the WEAKER/wrong home for the
  *statistical* sufficiency object** (≥3 passes agree). The lossless-scalarization
  condition's native home is **Banker–Datar 1989 / Amershi–Banker–Datar 1990 /
  Şabac–Yoo**; Chetty is the *welfare* analogue (still useful, but by analogy).
- **Piece 3 (set-monotonicity) is the thinnest overlap / most plausibly novel.**
  DKL 2001 proves non-monotone *weights / value of a measure*, **not** a theorem
  about *harm as a function of channel count*. The contribution is **naming** the
  property. (Biggest model disagreement: Gemini-opt "exact match in Feltham–Xie";
  ChatGPT-pess "wrong unless constrained — extra signals are useful-or-ignored";
  Claude both runs + Gemini-pess "unstated corollary / naming contribution.")
- **Piece 2 off-axis:** the "weighted-average-of-exchange-rates h_j/w_j" object
  **diverges from Baker's `1−cosθ` off the knife-edge** (angle metric is
  rescaling-invariant; the ratio-average is not) — Claude-pess names this "the only
  defensible new object in piece 2." Gemini-pess calls the same thing "a trivial
  change of basis." (Recorded disagreement.)
- **Reynaert–Sallee welfare sign:** their headline is that gaming can **benefit
  buyers** (pass-through outweighs distortion). If the framework treats gaming as
  unambiguously harmful, this is a *substantive divergence*, not a relabeling
  (flagged by 3 passes — echoes the T5 value→harm interpretive inversion).

### Unifying-source finding (most important for the synthesis-novelty claim)
**No pass found a single source unifying all six pieces.** BUT subset-unifiers are
real and damaging to any "we first unified this" claim: the **multitask-LEN
lineage** (HM1991 + Feltham–Xie + Baker + DKL + Banker–Datar) already co-locates
pieces **1, 2, 3, 4** (Claude, both runs). Gemini-pessimistic goes furthest —
claims **Bolton & Dewatripont 2005 *Contract Theory* Ch. 4 & 8** already unify
pieces 1–4 ("taught in PhD courses for two decades"); **only Gemini checked this**
(its aggressive-deflation signature) — **flag Bolton–Dewatripont for a body-verify.**
This *reinforces* `paper1-is-elementary-synthesis`: the math is largely co-located
within contract theory; the gap paper's contribution is the **citation gap + the
econ⇄stats⇄AI breadth**, not novel unification *within* economics.

### Net
Breadth saturated; the autonomous econ sweep missed no major home (the new items
are refinements). The mapping corrections (Chetty→Banker–Datar for sufficiency;
set-monotonicity = naming; Reynaert–Sallee welfare sign) feed Track A's per-theorem
reviews. None of this is gate-invalidating — it sharpens the dictionary and the
honest novelty scope.
