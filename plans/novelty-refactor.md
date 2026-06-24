# Paper 1 novelty refactor: reference existing results, reduce novelty claims

Status: active, capstone. **Blocked on all lit reviews resolving.** Depends on:
the completed exchange-rate / T5 review
(`research/threads/lit_review/looking-for-exchange-rate-results/`), plus
`plans/litrev-selection-bounds.md` (T1/T2), `plans/litrev-convex-budget.md` (T4),
and `plans/litrev-lower-tier.md` (identification, tilt, T3, T6). Do not start
drafting prose until those produce verdicts. Those three reviews now **consume
the unified cross-field discovery** (`plans/litrev-discovery.md`, shared Phase 0)
rather than each running its own searches.

This is the stage that changes the manuscript significantly, which is why the
whole program is inserted ahead of circulation in `plans/next-steps.md`.

## Thesis (the decision this plan executes)

Paper 1's contribution is **elementary cross-field synthesis, not novel math**,
and that is fine — stated proudly it is stronger and more honest than the current
motte-and-bailey (see the `paper1-is-elementary-synthesis` memory). The
measurement failures the book formalizes are classical results in different
clothes; the contribution is the dictionary between them, the response-modeling
contract that says which result applies, and the few readings nobody wrote down.

What the lit reviews are converging on:

- **T5** = contract-theory congruence / zero-distortion (Feltham–Xie 1994; Baker
  1992/2002), with the public-finance sufficient-statistic lineage (Chetty 2009 /
  Feldstein 1999) the closest fit for the combined harm-formula-plus-invariance
  package, and Datar–Kulp–Lambert 2001 the closest explicit set-monotonicity
  statement. The all-subsets-with-arbitrary-weights invariance reading appears
  unstated. Reynaert–Sallee 2016 is a named non-AI "Goodhart's Law for
  externalities" sibling. (See the `t5-prior-art-congruity` memory.)
- **T1/T2** (pending) = Hammersley–Chapman–Robbins / χ²-DRO.
- **T4** (pending) = Fenchel/Rockafellar duality.
- **Lower tier** (pending) = causal-inference identification; exponential-family
  cumulants; signaling/strategic classification; greedy capacity reduction.

The genuinely original layer that survives: the response-modeling contract
(`formal_analogue_lit_map.md` argues it is original), the subset-invariance
reading, and the synthesis/dictionary itself.

## Work items (run only after the three lit-review verdicts land)

### R1. Per-theorem prior-art correction

For each of T1–T6, replace any implicit novelty framing with an explicit "this is
[named classical result]; our contribution is [the application / reading]"
sentence, citing the primary source verified during the corresponding review.
Concrete known fixes:

- T5: cite Feltham–Xie 1994, Baker 1992/2002, Chetty 2009, DKL 2001; **remove the
  current claim that Holmström–Milgrom 1991 is "the closest economics precedent"**
  (book §4.1) — it is wrong. Engage Reynaert–Sallee 2016 as the econ sibling.
- T1/T2: state the envelope as Chapman–Robbins / the χ²-DRO worst case; **correct
  the `formal_analogue_lit_map.md` false negative** ("no χ² analogue").
- T4: cite Rockafellar; mark it standard convex duality.
- T3/T6/identification/tilt: anchor per `plans/litrev-lower-tier.md` outcomes.

### R2. Math simplification

- Restate T5 in cost-normalized projection / regression-slope form (`x_j =
  a_j/sqrt(kappa_j)`; harm = `d * (beta . b)/|b|^2` = the through-origin OLS slope
  of harm on score), folding (C) and (D) into one statement. Strictly shorter and
  it surfaces the congruence link honestly.
- State T5 explicitly as "T4-quadratic optimizer + a linear harm readout."
- Consider de-boxing: present standard-but-imported results as "Fact/Observation"
  rather than boxed "Theorem" where that is more honest; keep boxes for the parts
  that are genuinely the book's own (the contract, the subset-invariance reading).

### R3. Reframe the front matter and related work

- Rewrite the intro as synthesis-first: the dictionary (Chapman–Robbins →
  selection; Fenchel → affordability; congruence / sufficient-statistic →
  exchange rates; contract → which one applies), leading with the elementariness
  as a credibility signal, not hiding it.
- Position the two named siblings: Reynaert–Sallee 2016 (econ) and Skalse et al.
  2022 unhackability (AI) as the closest "safe iff tight proportional alignment"
  results; the book sits at the intersection on a third object.
- Reconcile with the divergence-seam paper-1 improvements
  (`could-do/divergence-seam-paper1-improvements.md`): the "no universal scalar"
  message (I5) and the activation-vs-severity scoping (I1) must stay consistent
  with the new synthesis framing.

### R4. Update the auditable records

- Add license/non-license rows to `research/claim_audits.md` recording each
  result's prior-art status (congruence, HCR/DRO, Fenchel, …) so the boundary is
  auditable.
- Update `research/core-math.md` book pointers and any "closest precedent" prose.
- Update `research/reviews/formal_analogue_lit_map.md` (χ² row; add the contract-
  theory / public-finance / DRO homes).
- Refresh `book/refs.bib`.

### R5. Rebuild and verify

- Deterministic book rebuild; confirm no broken references; cold read of the
  reframed intro and the rewritten T5 section.

## Guardrails

- Do **not** overcorrect into "it is all trivial." Keep the genuinely original
  layer credited: the contract, the subset-invariance reading, the synthesis.
- Pride is earned by completeness of the translation table, so every "this is
  [named result]" claim must rest on a verified primary source, not on the LLM
  deep-research reconstructions alone (several originals were paywalled — see the
  per-review caveats).
- This is additive book-content + structural work: it **reopens the "editing
  done" milestone** (like I3 in the divergence-seam plan). Decide pre- vs
  post-circulation deliberately — a draft that honestly cites its ancestry is
  stronger to circulate, so pre-circulation is defensible and is the reason this
  program is sequenced ahead of circulation in `next-steps.md`.

## What this plan deliberately does not do

- No new theorems, no new empirical claims.
- No prose drafting before the three lit-review verdicts are in hand.
- No change to the divergence/severity split owned by paper 2
  (`divergence-thresholds/`).
