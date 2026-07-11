# Exchange-rate (T5) prior-art review — synthesis

Status: closed, 2026-06-23. Consolidated verdict across six deep-research passes
(ChatGPT, Claude, Gemini × optimistic/pessimistic). This file is the canonical
conclusion; the per-model files are the raw evidence. Feeds
`plans/novelty-refactor.md` and the `t5-prior-art-congruity` memory.

Two framings were run as an adversarial pair: **optimistic** = "prove this is
novel" (`optimistic_prompt.md`), **pessimistic** = "find the precedent, treat
'novel' as failure" (`pessimistic_prompt.md`).

## The claim under review

An agent closes a fixed score deficit `d` across channels, additive score
`Σ w_j a_j`, separable quadratic cost `Σ a_j²/(2κ_j)`, hidden linear harm
`Σ h_j a_j` (rate `h_j` not in the agent's objective). Four results:

- **(A)** cost-min load `a_j ∝ κ_j w_j` (equimarginal).
- **(B)** harm `H(d) = d·(Σ h_j κ_j w_j)/(Σ κ_j w_j²)` = a `κ_j w_j²`-weighted
  average of the exchange rates `h_j/w_j`.
- **(C)** set-monotonicity: adding a channel moves harm up or down by its
  `h_j/w_j` vs the incumbent average; channel *count* is not the governing
  variable.
- **(D)** invariance iff: harm to close `d` is invariant across **all** measured
  subsets ⟺ `h_j = c·w_j` on the whole pool.

## Verdict (TL;DR)

All six passes converge:

1. **(A) and (B) are standard, not novel.** Equality-constrained QP /
   equimarginal least-cost allocation; two named homes — least-cost pollution
   abatement (Baumol–Oates, Montgomery 1972) and quadratic-cost multitask agency
   (Holmström–Milgrom 1991). Markowitz mean-variance is the structural twin.
2. **The condition `h_j = c·w_j` is NOT novel.** It is verbatim **perfect
   congruity** (Feltham–Xie 1994) / **zero distortion** (Baker 1992, 2002:
   distortion `= 1 − cosθ` between the measure-sensitivity vector and the
   value vector). Any draft claiming this condition is new will be rejected by a
   contract-theory or accounting referee.
3. **(C) is present in spirit; closest explicit statement is Datar–Kulp–Lambert
   2001**, with Lipsey–Lancaster 1956 (second best) the qualitative ancestor and
   Budde 2007 ("congruity depends on *which* measures, not how many") nearby.
4. **(D)'s exact packaging — across ALL subsets, arbitrary weights, with hidden
   harm as the object — appears UNSTATED** in the non-AI literature. But it is a
   one-line corollary of congruity once `H(d)/d` is written as a weighted mean of
   `h_j/w_j` and singleton subsets force `h_j/w_j = c`. So it is a
   repackaging/rediscovery: the novelty is **framing and domain, not deep math**.

Consequence: **the paper's honest contribution is cross-field synthesis + the
response-modeling contract + the subset-invariance reading, not novel
mathematics** (see `paper1-is-elementary-synthesis` memory).

## Closest prior art (consolidated across passes)

| Result | Closest prior art | Field | Status |
| --- | --- | --- | --- |
| (A)/(B) optimization | Equimarginal / least-cost abatement (Montgomery 1972, Baumol–Oates); equality-constrained QP; Markowitz | Env. econ / OR / finance | standard, cite as backbone |
| Condition `h=cw` | **Feltham–Xie 1994 congruity; Baker 1992/2002 distortion = 1−cosθ** | Contract theory / accounting | exact, not novel |
| (B)+(D) *package* | **Chetty 2009** (weighted-avg excess burden) + **Feldstein 1999** (sufficient-statistic = composition invariance) | Public finance | closest combined fit |
| (C) set-monotonicity | **Datar–Kulp–Lambert 2001** (explicit either-direction); Lipsey–Lancaster 1956 (qualitative) | Accounting / welfare | present |
| (D) "invariant across all subsets" *shape* | Diewert 1978 / Vartia / Eichhorn–Voeller 1976 / Blackorby–Primont 1980 (consistency-in-aggregation) | Index-number theory | same shape, different object |
| (D) exact packaging | — none found — | — | apparently unstated (one-line corollary) |
| Named non-AI "Goodhart" sibling | **Reynaert–Sallee 2016** ("Corrective Policy and Goodhart's Law," carbon/autos), Prop. 4 either-direction gaming | Env. econ | engage directly |

## What survives as the book's contribution

- **The subset-invariance reading (D)** with arbitrary weights and harm as the
  object — a corollary nobody wrote down, but state it as such.
- **The synthesis / dictionary** itself: congruity (contract theory) =
  equimarginal allocation (abatement) = sufficient-statistic condition (public
  finance) = the same elementary projection, unified and ported to Goodhart
  measurement design.
- **The response-modeling contract** (argued original in
  `research/reviews/formal_analogue_lit_map.md`).
- **The value→harm interpretive inversion** (below).

## The interpretive inversion (the real seam)

In contract theory `h∝w` is the **good** case — zero distortion / first-best:
the agent gaming the measure *is* the agent maximizing value. In T5 the hidden
vector is **harm**, so `h∝w` is the **invariance** case — harm-per-score is the
constant `c` regardless of the measured subset, and that `c` can be uniformly
**high**. Same algebra, opposite economic meaning. Flagged most sharply by the
Claude pessimistic pass; do not let the shared algebra be mistaken for shared
meaning.

## Cleanest derivation (from ChatGPT pessimistic)

Cost-normalize `x_j = a_j/√κ_j`, `b_j = w_j√κ_j`, `β_j = h_j√κ_j`. The problem
becomes `min ½|x|²` s.t. `b·x = d`, solved by the projection `x* = d·b/|b|²`, so
`H(d) = d·(β·b)/|b|²` — the through-origin OLS slope of harm on score. (C) =
adding a regression point; (D) = perfect fit (`β∝b`, `cosθ=1`) = congruity. This
is the form the refactor should adopt: shortest, and it surfaces the congruence
link honestly.

## Where the passes diverged (recorded for honesty)

- **Most willing to deny novelty:** both Gemini passes — pessimistic called it a
  rediscovery "beyond reasonable doubt"; optimistic claimed (C) and (D) are
  "explicitly treated" in contract theory.
- **More careful:** the ChatGPT and Claude passes agreed the *condition* is
  known but the *exact subset-invariance packaging* (D) is unstated, and gave
  auditable negatives for what they could not find.
- **Net:** the spread is over *how much* of (C)/(D) counts as already-present,
  not over the headline. All agree the condition is congruity and the math is
  elementary.

## Caveats

- Originals of Feltham–Xie 1994, Baker 2002, Datar–Kulp–Lambert 2001, and Chetty
  2009 were partly paywalled; the agents reconstructed exact statements from
  secondary sources (Budde 2007; Schnedler 2006/2008). Baker 1992's iff is from
  the original. **Verify primary sources before citing proposition numbers.**
  → **RESOLVED 2026-07-11, see the dated addendum below.**
- Schnedler 2008 caveat: congruence-optimality is special to `C = cI` (equal
  separable costs); for general `aᵀCa` the congruent measure is no longer
  optimal — bears on how much the `κ_j` generality buys.
- Benchmark that would erase the remaining (D) novelty: an explicit
  "invariant-to-the-included-set iff proportional, arbitrary weights" proposition
  in Feltham–Xie, DKL, Budde 2007 ("balance"), or Şabac–Yoo 2018. Check those
  full texts before any novelty claim. → **Half resolved 2026-07-11:** the
  Feltham–Xie and DKL full texts are now read — **no subset-invariance
  statement in either** (grep + proposition-level read; DKL's only "subset"
  is about action subsets). Budde 2007 and Şabac–Yoo 2018 remain unread; the
  (D) claim stays capped at "apparently unstated" pending those two.

## ADDENDUM 2026-07-11 — primary sources pulled; proposition numbers pinned

Dated post-freeze correction (this README's verdict is unchanged; numbers
only). The user pulled all paywalled primaries into `sources/`; every number
below was read in the source. Full verbatim record:
`../cross-field-discovery/prior-art-verification.md`, 2026-07-11 addendum.

- **Feltham–Xie 1994 — `[verified-primary]`.** The congruity condition is the
  **Definition (noncongruity) + Proposition 1, p. 435**: L(η)=0 iff rσ₁²=0
  and ∃λ: μ₁ⱼ=λbⱼ (sensitivity ∝ benefit). Multi-measure spanning version =
  **Prop. 3, p. 439**. (Budde's "p. 433" attribution is off by two pages —
  cite p. 435.)
- **Baker 1992 — `[verified-primary]`; no numbered propositions exist.** Cite
  **p. 605**: eq. (8) (b\* driven by corr(Vₑ,Pₑ)) and the verbatim "Pₑ = Vₑ in
  all states of the world … necessary and sufficient condition for a
  first-best contract" (necessity proof in fn. 11). Do not invent a
  "Baker 1992 Prop. N."
- **Baker 2002 — `[verified-primary]`; no numbered propositions exist.** Cite
  **eq. (3), p. 733** (b\*_P = FG·cosθ/(G²+2hσ²)) and pp. 733–734 ("CosΘ is a
  measure of how distorted the performance measure is…"; Figure 1). Wording
  caution: Baker's object is **cosθ** (congruence); "distortion = 1−cosθ" is
  our paraphrase — phrase it as such.
- **Datar–Kulp–Lambert 2001 — `[verified-primary]`.** **Prop. 1, p. 79**
  (relative-weights formula); **Prop. 2, p. 80** (risk-neutral/noiseless ⇒
  weights minimize incongruity Σⱼ[fⱼ−Σᵢβᵢgᵢⱼ]²; perfect congruity iff
  spanning); **Prop. 4, p. 83** (the non-monotone "increasing then
  decreasing" weights result — the (C)-adjacent statement; confirms DKL prove
  non-monotone *weights*, not a harm-vs-channel-count theorem).
- **Chetty 2009 — published AEJ version checked: no Proposition labels; the
  WP equation numbers do not carry over.** Cite the AEJ version (1(2):31–52):
  Feldstein formula = **eq. (6)**, generalized weighted-average = **eq. (18)**
  (weight **μ**, the WP's κ renamed), pp. 35–38.
- **Holmström–Milgrom 1991 — `[verified-primary]`** (for the related-work
  correction, not as closest precedent): **Prop. 1, p. 34** (fixed wage
  optimal even risk-neutral), **Prop. 2, p. 36**, equal-compensation
  substance = **eq. (24) + Prop. 7, pp. 47–48**. Naming caution: the phrase
  "equal compensation principle" is Milgrom–Roberts 1992, not HM1991.

## Consequences for the paper

Tracked in `plans/novelty-refactor.md` (capstone). Key edits: correct the book's
claim that Holmström–Milgrom 1991 is "the closest economics precedent" (§4.1 —
Feltham–Xie/Baker is closer); cite the congruity / sufficient-statistic /
Reynaert–Sallee homes; restate T5 in projection form; scope novelty to the
subset-invariance reading + synthesis.

## File index

- `optimistic_prompt.md`, `pessimistic_prompt.md` — the two seed prompts.
- `{chatgpt,claude,gemini}_optimistic_prompt.md` — prove-novelty results.
- `{chatgpt,claude,gemini}_pessimistic_prompt.md` — find-precedent results.
  (Filenames retain the `_prompt` suffix from capture; the per-model files hold
  results, not prompts.)
