# Primary-source verification notes (Stage 1c)

Per `plans/lit-review.md` Stage 1c: confirm each `load-bearing` and
`analogue` source has a citation-ready theorem statement. Sources verified
via WebFetch are summarized here; sources deferred are flagged.

## Already verified (via earlier WebFetch passes)

### El-Mhamdi & Hoang 2024 (arXiv:2410.09638)

Status: verified at theorem level.

Theorem 1 (Bounded Goal, Exponential Discrepancy):
- Hypotheses: G uniform on [0,1]; ξ exponential with parameter λ;
  independence G ⊥ ξ; noise-to-signal ratio ε = Var(ξ)/Var(G); selection
  pressure α with 0 < α ≤ ε√12(1 - e^{-1/(ε√12)}).
- Conclusion: ρ_α = 0, and E_α[G] = (1/λ)·(λe^λ - e^λ + 1)/(e^λ - 1), with
  E_α[G] = 1 - ε√12 + O(ε²) as ε → 0.

Theorem 4 (Power-Law Goal and Discrepancy):
- Hypotheses: G has power-law decay g^{-γ} with γ > 3; ξ has power-law
  decay x^{-β} with β > 3, β ≠ 4; independence; scalar.
- Conclusion: α ~ √((β-1)/(β-3))·ε, and
  ρ_α → max{-√((β-3)/(2(β-2))), -1/(β-2)} as ε → 0.

Scope: scalar. Quantitative closed-form bounds.

Anchor-fit notes: matches Chapter 3's threshold-selection geometry
directly. Independence assumption is load-bearing — see assumption-clash
audit (Stage 3).

### Skalse et al. 2023 (arXiv:2310.09144, "Goodhart's Law in RL")

Status: verified at theorem level.

Theorem 1 (Optimal Stopping):
- Hypotheses: MDP with finite states/actions and convex occupancy
  polytope Ω; linear reward functions in occupancy space; concave
  optimization (reward improvement rate decreases along trajectory);
  angle bound θ ∈ [0,π] between proxy R_1 and true R_0 in projected
  occupancy-measure space.
- Conclusion: stopping criterion — halt when
  (J_{R_1}(π_{i+1}) - J_{R_1}(π_i)) / ||η^{π_{i+1}} - η^{π_i}|| <
  sin(θ)·||M_τ R_1||. Then no Goodharting occurs for any R_0 with
  arg(R_0, R_1) ≤ θ.

Scope: RL-specific (occupancy polytope, linear rewards). Existence + an
algorithmic guarantee under angle bound.

Anchor-fit notes: occupancy-measure geometry does not transfer to the
book's general framework. If used as anchor, Chapter 2 must explicitly
say the multidim propositions are analogues of, not generalizations of,
this bound.

## Verified in this pass

### Skalse et al. 2022 (arXiv:2209.13085, "Defining and Characterizing Reward Hacking")

Status: verified at abstract + main-result level.

Core definitions:
- Reward hacking: optimizing an imperfect proxy reward function leads to
  poor performance according to the true reward function.
- Unhackability: a proxy is unhackable when increasing the expected proxy
  return can never decrease the expected true return.

Main result: for the set of all stochastic policies, two reward functions
can only be unhackable if one of them is constant. Domain-agnostic at
this level; tightened for deterministic policies and finite stochastic
policy sets where non-trivial unhackable pairs exist. Necessary and
sufficient conditions for "simplifications" (special case of
unhackability) are given.

Triage: `analogue`. Provides the proxy/target primitive cleanly; see
Codex's ML survey row 6. Distinct from Skalse 2023.

### Majka & El-Mhamdi 2025 (arXiv:2505.23445)

Status: verified at abstract + result-shape level (full PDF not pulled;
32-page paper has formal theorems).

Hypotheses: removes independence assumption between target and
discrepancy; paradigm-agnostic.

Results:
- Light-tailed goal + light-tailed discrepancy: dependence does not
  change the nature of Goodhart's effect.
- Light-tailed goal + heavy-tailed discrepancy: over-optimisation occurs
  at a rate inversely proportional to the heavy-tailedness of the
  discrepancy.

Scope: scalar.

Triage: `analogue` if the book's Chapter 3 selection-channel proposition
assumes independence (this is the assumption-clash audit decision point
in Stage 3). If independent of the book's actual assumptions, possibly
upgrade to `load-bearing` for the late chapter as an "extends-the-anchor"
result.

## Deferred — sufficient existing citation; full verification at Stage 3

### Hardt et al. 2016 strategic classification (arXiv:1506.06980)

Codex's ML survey §3 row 4 cites this with theorem-level detail
(Stackelberg game; classifier chosen first; agents alter features at a
cost; robust classifiers learnable for natural cost classes). Re-verify
when drafting the Stage 3 primitive map only if Codex's summary turns
out to need tightening.

### Perdomo et al. 2020 performative prediction (arXiv:2002.06673)

Codex's ML survey §3 row 5 cites this with theorem-level detail
(predictors whose deployment changes future data distribution;
performative stability). Re-verify at Stage 3 if needed.

### Gao et al. 2023 reward overoptimization (proceedings.mlr.press/v202/gao23h)

Codex's ML survey §3 row 7 cites this; primarily empirical scaling laws.
Re-verify at Stage 3 if needed.

### Pan et al. 2022 reward misspecification (arXiv:2201.03544)

Codex's ML survey §3 row 7 cites this; primarily empirical study of
capacity / resolution / noise / training time thresholds. Re-verify at
Stage 3 if needed.

## Deferred — econ-side, not yet WebFetch-verified

### Holmström & Milgrom 1991 ("Multitask Principal-Agent Analyses")

Status: canonical citation; not WebFetch-verified.

Standard form: principal observes a vector of signals tied to the
agent's multidimensional effort; under the LEN (Linear-Exponential-Normal)
benchmark restriction, the optimal contract is linear in signals.
Central result: when some effort dimensions are unmeasured, increasing
incentive intensity on measured dimensions distorts effort allocation
away from unmeasured dimensions, sometimes making low-powered incentives
optimal.

Triage: `analogue` for the action-cost / aggregation primitive (Stage 3
row, econ side). Full theorem citation against published paper deferred
until Stage 3 drafting. Source: Journal of Law, Economics & Organization,
vol. 7, special issue, 1991.

### Lucas 1976 ("Econometric Policy Evaluation: A Critique")

Status: canonical citation; not WebFetch-verified.

Standard form: reduced-form correlations between policy variables and
outcomes are not invariant under policy changes because agents'
optimal decision rules depend on the policy regime. Implication: any
policy-effect estimate that holds the joint distribution of observables
fixed is wrong.

Triage: `analogue` for the response-kernel primitive (the only
genealogy-era item with formal status). Chapter 2 §2.1 promotes Lucas
specifically as the formal-status item. Full citation against
Carnegie-Rochester Conference Series vol. 1 (1976) deferred until
Chapter 2 drafting.

### Demski & Garrabrant 2019 ("DG19" cited by El-Mhamdi 2024)

Status: cited but not identified. The El-Mhamdi 2024 related-works
section references "[DG19]" alongside Manheim-Garrabrant 2018 as work
that "seeked to distinguish different possible root causes of Goodhart's
law." Most likely candidates:

- Demski & Garrabrant, "Embedded Agency" (arXiv:1902.09469) — agent
  foundations broadly, Goodhart-adjacent.
- A separate Garrabrant blog post / LessWrong piece on Goodhart variants.

Action: pull El-Mhamdi 2024's bibliography at Stage 3 drafting to
resolve. If "DG19" turns out to be a blog post rather than a paper, drop
to `genealogy` or omit from primitive-map table.

## Summary of triage status after Stage 1c

| Source | Triage | Verification status |
| --- | --- | --- |
| El-Mhamdi & Hoang 2024 | `load-bearing` (anchor candidate) | verified |
| Skalse et al. 2023 | `load-bearing` or `analogue` | verified |
| Skalse et al. 2022 | `analogue` | verified |
| Majka & El-Mhamdi 2025 | `analogue` | verified |
| Manheim & Garrabrant 2018 | `genealogy` source; correspondence promoted | typology, no theorems; variant→channel correspondence in `research/reviews/mg_taxonomy_correspondence.md` |
| Goodhart 1975, Campbell 1976, Strathern 1997 | `genealogy` | canonical citations |
| Lucas 1976 | `analogue` | canonical citation, deferred full verify |
| Smith & Winkler 2006 | `analogue` (optional) | canonical citation |
| Holmström & Milgrom 1991 | `analogue` | canonical citation, deferred full verify |
| Demski & Garrabrant 2019 | pending identification | unresolved |
| Hardt et al. 2016 | `analogue` | sufficient via Codex ML survey |
| Perdomo et al. 2020 | `analogue` | sufficient via Codex ML survey |
| Gao et al. 2023 | `analogue` | sufficient via Codex ML survey |
| Pan et al. 2022 | `analogue` | sufficient via Codex ML survey |
| Skalse et al. 2022 (reward hacking) | `analogue` | sufficient via Codex ML survey + verified here |
| Codex ML survey rows generally | `analogue` per row | retained from §3 of ml_formal_analogue_survey.md |

No source dropped to `non-transferable` in this pass. The
non-transferable category is held open for items that surface during
Stage 3 assumption-clash audit and fail the primitive-map filter.
