# Formal analogue lit map

Status after consolidation: mostly time-independent as a literature-to-primitive
map. Treat book line references, stage numbers, and promotion-to-book notes as
historical unless rechecked against the current manuscript sources and current
license map.

Iteration type: `application-mapping`.

## Purpose

Stage 3 of `plans/lit-review.md`. Map verified literature sources to the
framework's response-modeling primitives. This is a one-time consolidation
artifact, not a paper review or new theorem. The output feeds Stage 5a
(Chapter 2 anchor §2.3) and Stage 5b (late formal-analogue chapter or
appendix).

Discipline (Codex): "no source enters the framework unless it maps to a
primitive." Primitives: selection (`W_theta`, `L_theta`), response kernel
(`K_theta`), action / cost / search geometry, proxy / target separation,
aggregation rule, evidence standard.

## Assumption-clash audit (highlighted finding)

Claim [tentative]: the book's T1 (coordinate-explicit selection
drift, Part II, Section 5) and T2 (value-weighted form, Part II, Section 5)
do **not** assume El-Mhamdi-style
independence between target and discrepancy.

Reasoning. El-Mhamdi & Hoang 2024 work with a goal $G$, a proxy
$\nu = G + \xi$, and assume $G \perp \xi$. Selection is on $\nu$, and the
theorems give closed-form asymptotic statements about $\rho_\alpha$ and
$\mathbb{E}_\alpha[G]$ as $\alpha \to 0$.

The book works with a baseline law $\mu$ on $(S, \mathcal{F})$, hidden
coordinates $H : S \to \mathbb{R}^d$, a proxy $P : S \to \mathbb{R}$, and a
selection policy via nonnegative weights $W_\theta$, with no decomposition
$P = G + \xi$ and no independence assumption between $P$ and $H$ under
$\mu$. The drift bound is Cauchy-Schwarz in $L^2(\mu)$, giving an envelope
$|B_{H_i}(\theta)| \le \delta \cdot s_i$ where $\delta = \sqrt{\chi^2(\mu_\theta \| \mu)}$.

Mapping. El-Mhamdi's setup is a special case of the book's setup: take
$S = \mathbb{R}^2$ with coordinates $(G, \xi)$, $\mu = \pi_G \otimes \pi_\xi$
(product measure under independence), $P(s) = G + \xi$, $H(s) = G$, and
selection $W_\alpha = \mathbf{1}\{P \ge t_\alpha\}$ for the top-$\alpha$
threshold. Under this embedding, the book's Cauchy-Schwarz envelope
applies: $|\mathbb{E}_\alpha[G] - \mathbb{E}_\mu[G]| \le \delta \cdot s_G$.
El-Mhamdi gives the sharper asymptotic statement under specific tail
distributions and independence.

So the right framing for Chapter 2 §2.3 is: **El-Mhamdi's Theorems 1 and 4
are sharper asymptotic statements under independence and specific tail
families; the book's T1/T2 is a more general envelope that
covers the dependent and arbitrary-distribution case but does not recover
El-Mhamdi's exact rate**. They are parallel formalisms with overlapping
scope, not nested generalizations.

Adversarial check on this claim:

- Counterexample attempt: maybe the book secretly assumes independence
  somewhere. Checked the T1/T2 selection section of the book and the
  weighted-response derivation in `research/threads/selection_response.md`.
  The proof is Cauchy-Schwarz on $L_\theta - 1$ in $L^2(\mu)$. No
  independence appears. Cleared.
- Definitional move: maybe T1 is vacuous in the El-Mhamdi
  regime because $\chi^2(\mu_\theta \| \mu)$ blows up. Yes, this is exactly
  the regime where the bound becomes uninformative — but it does not
  *fail*, it becomes a true but uninformative inequality. The book's
  selection-channel caveat already flags this. So the comparison "envelope vs
  sharp" is honest, not vacuous. Cleared.
- Rhetorically convenient: the framing makes the book look general and
  El-Mhamdi look specific, which is rhetorically convenient. Counter: the
  reverse framing ("El-Mhamdi is sharp where the book is loose") is
  equally true and should appear in §2.3. Recorded.

Conclusion: claim survives. Confidence remains [tentative] pending
review by user; not yet [confident]. The Chapter 2 §2.3 prose should
state both halves of the comparison.

Open follow-up: Majka & El-Mhamdi 2025 explicitly relaxes El-Mhamdi's
independence assumption. This is an independence-free *sharp* asymptotic
statement, not an envelope. Where does it sit relative to the book? It is
still distribution-specific (tail families) and selection-specific, so it
remains a special case of the book's reweighting setup but a stronger
result than T1 inside that special case. Worth citing in §2.3
as the closest external work to T2s level of generality.

## Mapping table

One row per source that survived Stage 1 triage at `analogue` or
`load-bearing`. Rows from Codex's ML survey
(`research/threads/lit_review/ml_formal_analogue_survey.md` §3) carried
forward without re-derivation. Confidence tag per row.

| Source / theorem | Citation | Framework primitive | What it licenses | Does not license | Falsifier / non-transfer | Confidence |
| --- | --- | --- | --- | --- | --- | --- |
| El-Mhamdi & Hoang Thm 1, 4 (scalar tail-conditioned Goodhart) | arXiv:2410.09638 | selection + proxy/target (with declared discrepancy) | The scalar limiting asymptote that T1/T2 bounds as an envelope: under independence and exponential/power-law tails, $\rho_\alpha$ and $\mathbb{E}_\alpha[G]$ are determined by tail parameters. | The multidim or coordinate-free case; the dependent case; non-tail-named distributions; intervention channels. | The target / discrepancy decomposition fails (no $G \perp \xi$); or the operative selection is not threshold/top-$\alpha$; or the tails are heavier than power-law $\beta > 3$. | [tentative] |
| Majka & El-Mhamdi 2025 (independence-free) | arXiv:2505.23445 | selection + proxy/target (without independence) | Extends El-Mhamdi to dependent $G, \xi$: light-tailed regime is unchanged; light-tailed goal + heavy-tailed discrepancy gives rate inversely proportional to discrepancy heavy-tailedness. | Vector targets; non-scalar settings; cases where there is no clean discrepancy decomposition at all. | Same as El-Mhamdi minus the independence falsifier; add: the proxy is not of the form $\nu = G + \xi$ in any natural way. | [tentative] |
| Skalse et al. 2023 (Goodhart in RL, optimal-stopping Thm 1) | arXiv:2310.09144 | response kernel + action/cost (RL-specific occupancy form) | An RL-side early-stopping rule: under angle bound $\theta$ between proxy reward $R_1$ and true reward $R_0$ in projected occupancy space, halt when marginal proxy gain per occupancy step drops below $\sin(\theta) \|M_\tau R_1\|$. | Non-MDP settings; non-linear-in-occupancy rewards; non-concave optimization; the general framework's coordinate-free formulation. | The problem is not an MDP, or rewards are not linear in occupancy measure, or optimization is non-concave. | [tentative] |
| Skalse et al. 2022 (reward hacking / unhackability) | arXiv:2209.13085 | proxy/target separation | Definitional clarity for proxy/target distinction. Main result: for all stochastic policies, two rewards can only be unhackable if one is constant. Non-trivial unhackable pairs exist for deterministic / finite policy sets. | A welfare model; a response geometry; multidim aggregation. | A "true reward" is not separately specified; or the policy class is unrestricted stochastic (then the main result is vacuous for any non-trivial pair). | [tentative] |
| Hardt et al. 2016 (strategic classification) | arXiv:1506.06980 | response kernel + action/cost (intervention, costly feature change) | The closest formal analogue to the book's Stackelberg toy in Chapter 4: classifier first, then agents alter features at a declared cost. Robust classifiers learnable for natural cost classes. | Hidden welfare functional; quadratic/additive cost geometry by default. | Agents choose participation only (not feature change); or observed changes are real improvements rather than proxy-only. | [tentative] (carried from Codex) |
| Perdomo et al. 2020 (performative prediction) | arXiv:2002.06673 | response kernel ($K_\theta$ change under policy) | Endogenous-stakes / distribution-shift formalism for response-kernel changes induced by deployment. Defines performative stability. | A welfare theorem; a selection-vs-intervention classification at type/action level. | Deployment does not measurably shift the data-generating distribution; shift is exogenous. | [tentative] (carried from Codex) |
| Dwork et al. (reusable holdout, adaptive data analysis) | arXiv:1506.02629 | evidence standard for repeated selection | Statistical validity under adaptive queries; controls overfitting in repeated benchmark use. | Identification of hidden welfare or agent costs; whether a model changes at fixed type. | Benchmark submissions use leaked private examples / direct feedback (intervention), not adaptive-holdout reuse. | [tentative] (carried from Codex) |
| Cawley & Talbot 2010 (model selection / hyperparameter overfitting) | JMLR v11 | selection (over fixed candidate set) | Pure selection geometry for checkpoint / model / hyperparameter choices: validation score is proxy, held-out target metric is hidden, threshold/top-k/argmax is the selection rule. | Finetuning, prompt adaptation, post-evaluation contamination. | Same checkpoint changes between evaluations; or candidate set is generated adaptively from leaderboard feedback. | [tentative] (carried from Codex) |
| Blum & Hardt (The Ladder); Roelofs et al.; Recht et al. | arXiv:1502.04585; NeurIPS 2019; ICML 2019 | evidence standard for benchmark claims | Public/private split discipline; regenerated test sets distinguish selection overfitting from distribution shift from benchmark-difficulty change. | "Leaderboards are safe" in general; absence of Goodhart drift. | Public progress fails to transfer correlated with adaptive submissions; or transfer fails for difficulty-shift reasons. | [tentative] (carried from Codex) |
| Pan et al. 2022; Gao et al. 2023 (reward misspecification / overoptimization) | arXiv:2201.03544; ICML 2023 | search / optimization-pressure geometry (empirical) | Empirical thresholds for capability / action resolution / noise / training time / KL penalty / model size / best-of-n. | $\kappa$ = gradient accessibility, $\kappa$ = model size, $V$ = benchmark prize, etc. — these remain candidate model choices. | Gold reward does not decline under stronger proxy optimization; or decline is from distribution shift unrelated to reward-model exploitation. | [tentative] (carried from Codex) |
| Lucas 1976 (econometric policy evaluation critique) | Carnegie-Rochester vol. 1 | response kernel (kernel changes under policy regime) | The formal-status genealogy item: reduced-form correlations change when the policy regime changes because agents' optimal decision rules depend on the regime. | A quantitative bound; a welfare model; non-rational-expectations agents. | Agents do not update decision rules under the policy change (e.g., rule-of-thumb behavior); or the structural model has stable parameters across the regime. | [tentative] |
| Holmström & Milgrom 1991 (multitask principal-agent) | JLEO v7 special issue | aggregation + action/cost (multidim effort with measured signals) | The economics-side analogue of multidim Goodhart's aggregation question: when only a subset of effort dimensions is measurable and rewarded, optimal incentive intensity may be lowered to avoid distorting effort allocation. Closest external precedent for the book's exchange-rate / additive-aggregation results. | Coordinate-free welfare; non-LEN settings without linear contracts. | Effort is not multidimensional; or all relevant signals are observable; or the LEN assumptions (linearity, exponential utility, normal noise) fail badly. | [tentative] |
| Smith & Winkler 2006 (Optimizer's Curse) | Management Science 52(3) | selection (finite-sample bias of the maximum) | A precursor inequality: the expected value of an optimized noisy estimate exceeds the true value of the chosen option. Not a Goodhart bound per se. | A multidim or response-channel claim; a quantitative scaling law. | The selection is not over a finite set of noisy point estimates; or there is no noisy estimation error to bias the maximum. | [tentative] |

## Application-mapping passes (per AGENT.md)

### Primitive-map summary

- **Selection**: El-Mhamdi (anchor, special case of book T1/T2);
  Majka-El-Mhamdi (independence-free); Cawley-Talbot (ML model
  selection); Smith-Winkler (finite-sample precursor).
- **Response kernel ($K_\theta$ change)**: Skalse 2023 (RL-specific);
  Lucas critique (general, formal-status); Perdomo et al.; Hardt et al.
  (intervention via costly action).
- **Action / cost geometry**: Hardt et al.; Holmström-Milgrom; Gao /
  Pan empirical scaling.
- **Proxy / target separation**: Skalse 2022 (unhackability); El-Mhamdi
  (discrepancy decomposition).
- **Aggregation**: Holmström-Milgrom (multitask), inherits from book
  Chapter 4 §4 (additive / conjunctive).
- **Evidence standard**: Dwork (reusable holdout); Blum-Hardt / Roelofs
  / Recht (leaderboard hygiene).

### Non-map pass

What primitives have no clean external analogue in this set?

- **The response-modeling contract as a meta-object** (book Chapter 6).
  None of the surveyed sources offer a contract structure for *declaring*
  which Goodhart variant a claim is about before importing toy bounds.
  The contract is original to this book.
- ~~**The chi-square reweighting budget** ($\delta = \sqrt{\chi^2}$) as the
  selection-channel summary statistic. Several sources have related
  divergence-based tools (Dwork's adaptive-holdout machinery uses
  differential privacy / max information; Lucas uses structural-vs-reduced
  form), but none use $\chi^2$ in this exact role.~~
  **CORRECTION (2026-07-11): this was a false negative.** The conclusion
  above was reached by searching only Goodhart-adjacent sources (El-Mhamdi,
  Dwork, Lucas); it never looked in the bound's native fields (estimation
  theory, distributionally robust optimization). The T1/T2 selection-bounds
  review found the analogue in three independent homes: T1's inequality is
  the Hammersley–Chapman–Robbins $\chi^2$ inequality rearranged
  (Polyanskiy–Wu, *Information Theory*, §29.1 eq. (29.1),
  `[verified-primary]`); the identical envelope is the Pearson-$\chi^2$-DRO
  worst-case mean (Namkoong–Duchi 2017, Thm 1 eq. (10), exact constant after
  normalization conversion, `[verified-primary]`); and Bayesian-robustness
  posterior sensitivity (Gustafson 1996, discovery-grade) is a third home.
  What remains without a found external statement is only the
  *selection-channel reading* and the declared-value-norm operator packaging
  of T2 — see the verdict and auditable negative in
  `research/threads/lit_review/selection-bound-chapman-robbins/README.md`.
  The erroneous sentence is preserved struck-through as a record of the
  methodology failure (native-field search was skipped), per
  RESEARCH-ITERATIONS.md planning norm "don't build a plan on an unverified
  negative."
- **The dimensional decomposition ker$\,\phi$ vs (ker$\,\phi$)$^\perp$**
  (book Chapter 2). Holmström-Milgrom's measured-vs-unmeasured effort
  split is the closest analogue but is not stated in projection-operator
  form.

### Discriminator pass

For each primitive map, what observation would distinguish the mapping
from a nearby alternative?

- *El-Mhamdi vs book T1/T2*: in the El-Mhamdi regime
  (independence, named tail family), the asymptotic value of $\rho_\alpha$
  matches El-Mhamdi's prediction within constants; the book's
  $\delta \cdot s_i$ envelope is loose by a known factor. In the
  non-independent or non-named-tail regime, only the book's bound
  applies. So a worked example with $G$ and $\xi$ dependent and a
  finite, non-power-law $\xi$ distribution discriminates: the book
  bound applies, El-Mhamdi's theorems do not.
- *Skalse 2023 vs book Chapter 4 (intervention)*: Skalse's bound depends
  on occupancy-measure geometry that is RL-specific. A non-RL
  application of the framework — e.g., an organizational scorecard with
  costly metric gaming — should produce a coherent intervention-channel
  analysis without an occupancy polytope. If it does not, the book has
  smuggled in an RL assumption.
- *Hardt vs book Chapter 4 Stackelberg toy*: Hardt's robust-classifier
  guarantee depends on the cost-class. The book's $\Delta = \sqrt{2 \kappa V}$
  result depends on quadratic cost. Different cost classes give
  different wedges. Observation: under non-quadratic cost, the wedge
  formula must change; if it does not, the book is over-claiming.

### Failure-mode pass

When should the surveyed result *not* transfer to a framework application?

- **Tail mismatch** (El-Mhamdi, Majka): if the proxy / target / discrepancy
  setup uses tails outside the named regime, the asymptotic statement
  fails. The book's envelope still applies.
- **Non-MDP** (Skalse 2023): the early-stopping rule has no analogue
  off-MDP. Do not cite Skalse 2023 in support of stopping criteria for
  generic optimization.
- **Mis-stated action class** (Hardt, Holmström-Milgrom): if the
  application names a cost class not covered by the source, the source's
  theorems do not transfer.
- **Adaptive intervention misclassified as selection** (Dwork,
  Cawley-Talbot, leaderboard work): these supply selection-channel
  evidence standards. They do not bound Goodhart harm when the response
  channel includes finetuning, contamination, or reward optimization.
- **Endogenous-policy gaming** (Lucas, Perdomo): if agents do not update
  decision rules under the policy regime, the response-kernel formalism
  collapses to selection. The book's selection bound applies in that
  case but the response-kernel toy bounds do not.

### Genealogy boundary (per Stage 3 plan)

The following are genealogy-only and **do not get a row above**. They
appear only in Chapter 2 §2.1 as pre-formal context.

- Goodhart 1975 (informal macroeconomic claim).
- Campbell 1976/1979 (social-science empirical generalization).
- Strathern 1997 (anthropological aphorism).
- Manheim & Garrabrant 2018 (taxonomy, no theorems) — theorem-free as a
  *source*, so it gets no import row above. Its four variants are nonetheless
  promoted into the formal-analogue treatment as a *correspondence* (variant →
  channel → what the book's formalization adds or does not), recorded in
  `research/reviews/mg_taxonomy_correspondence.md` and distilled into the book
  subsection "The four variants by channel". The correspondence rows live
  there, not in the source-to-primitive import table.

## Promotion-to-book status

Row count with full promotion criteria (primary citation + primitive map
+ falsifier + "does not license" sentence): **13 rows** in the table
above. This comfortably exceeds the chapter threshold (≥3–5 from
`plans/formal-analogue.md`'s downgrade clause). **Recommendation: late
formal-analogue chapter stays as a real chapter, not an appendix.**

Stage 4 of `plans/lit-review.md` should record this row count and the
chapter decision in `plans/formal-analogue.md`.

## Open follow-ups

1. Demski & Garrabrant 2019 ("DG19" cited by El-Mhamdi) — still
   unidentified. Pull El-Mhamdi's bibliography in Stage 5a drafting.
   Most likely "Embedded Agency" (arXiv:1902.09469); if so, downgrade to
   `genealogy` because Embedded Agency is not a Goodhart theorem.
2. Whether Majka & El-Mhamdi 2025's independence-free results admit a
   coordinate-free or multidim generalization that the book could
   *actually generalize*, rather than merely envelop. Worth a thought
   experiment in Stage 5a §2.3 drafting; not a current claim.
3. Whether Holmström & Milgrom's LEN-benchmark linear-contracts result
   is best presented in the book as an econ analogue or as a cited
   antecedent for the additive-exchange-rate result (Part II, Section 7).
   Likely the latter; decide in Stage 5b prose drafting.
4. Smith & Winkler 2006 placement (Chapter 2 §2.3 mention vs late chapter
   row vs cut). Lean: one-line mention in §2.3 as historical precursor;
   do not promote to late-chapter row unless it earns a primitive map
   on review.

## Adversarial pass (per AGENT.md three-iteration scheduling)

The previous adversarial pass closed Iteration 24's consistency
consolidation. Iterations 25 (paper extract) and this Stage 3 lit-review
supplement come after, so an adversarial pass is due.

Target claim for attack: the assumption-clash audit conclusion — "the
book's T1/T2 is a strictly more general envelope and
El-Mhamdi's theorems are special cases under independence + named
tails."

Skeptical reading:

1. Counterexample attempt. Is there a regime where El-Mhamdi's
   conclusion strictly contradicts T2s bound, not just
   refines it? El-Mhamdi's Theorem 4 gives $\rho_\alpha \to$ a negative
   limit — this is an asymptotic *value*, not a *bound*. T1
   gives a bound on $|B_{H}|$. They are not the same quantity. Comparison
   requires translation: in the El-Mhamdi embedding, $|B_G(\alpha)| =
   |\mathbb{E}_\alpha[G] - \mathbb{E}_\mu[G]|$, and T1 bounds
   this by $\delta \cdot s_G$. El-Mhamdi gives the actual asymptotic
   value. If the actual value exceeds the bound, the audit is wrong.
   Check: in the El-Mhamdi $\alpha \to 0$ limit, $\delta \to \infty$
   because $\chi^2 \to \infty$ for extreme selection. So T2s
   bound is vacuously satisfied. Cleared, but worth noting: the audit's
   "envelope vs sharp" framing is fair but in the extreme-selection
   limit the envelope is uninformative, so the "sharper" framing for
   El-Mhamdi is doing real epistemic work.
2. Definitional move. Maybe the book's $\mu$ and El-Mhamdi's joint
   $(G, \xi)$ are not actually substitutable. The book's $S$ is a
   measurable space; El-Mhamdi's setup is $\mathbb{R}^2$ with a product
   measure. The embedding requires $S = \mathbb{R}^2$, $\mu$ to be a
   product, and $P$ to be the sum coordinate. This is a *valid*
   embedding, not a derivation. So the claim "El-Mhamdi is a special
   case of the book" is more precisely: "El-Mhamdi's setup can be
   instantiated within the book's framework." Cleared, with refinement.
3. Rhetorical convenience. The audit makes the book look more general
   than El-Mhamdi. Is this what we want for Chapter 2? Yes — Chapter 2
   is supposed to position the book's results, including their
   generality. But §2.3 should still credit El-Mhamdi with the sharper
   asymptotic statement under stronger assumptions. Both halves go in
   the prose. Cleared.
4. Red-flag patterns. Argument is short — Cauchy-Schwarz is one line.
   The result proves significantly more — yes, the envelope holds in
   greater generality. The argument does not use specific tail
   assumptions — correct, that is the point. Two red-flag patterns fire
   weakly but are accounted for in the framing.

Verdict: claim survives at [tentative]. Logged as
`adversarial pass: clear` with the refinement that "special case" is
better stated as "valid embedding within the book's framework."

## Verification stack (layer 1–2)

Layer 1 — thought experiments:
- Adversarial book reader, independence skeptic: "Does the book quietly
  use $G \perp \xi$ via the choice of $H$?" — checked, no. Passed.
- Adversarial book reader, scope skeptic: "Does the envelope framing
  oversell — is the book actually narrower than El-Mhamdi in some other
  way?" — yes, the book does not give *attainment*, only a bound. The
  framing in §2.3 must note both: more general scope, less sharp result.
  Passed with explicit caveat.
- Cross-domain reader: "Can a non-ML application reasonably cite
  Skalse 2023?" — no, the RL setup does not transfer. Passed (this is
  the failure-mode pass conclusion).

Layer 2 — real-world correspondence:
- Does the El-Mhamdi-as-special-case framing match how El-Mhamdi
  themselves position the result? El-Mhamdi's related-works mentions
  Manheim-Garrabrant 2018 and DG19 but does not engage book-style
  $\chi^2$ reweighting. So the embedding is original to this artifact,
  not a re-statement. Defensible but should not be presented as
  established in the literature. Passed.
- Does the Skalse 2023 / Skalse 2022 disambiguation match the
  literature? Verified: two distinct papers, same author, different
  formal settings. Passed.

Verdict: layer 1–2 pass; no further verification descent needed for the
audit conclusion alone. Layer 3 (simulation) would be needed only if a
specific multidim instantiation gets promoted into the book; defer to
Stage 5a drafting if so.
