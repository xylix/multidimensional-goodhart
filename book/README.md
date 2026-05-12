# Multidimensional Goodhart — book draft

Working draft of Chapters 1–3 (plus two catalogue appendices) of a longer
treatment of multidimensional Goodhart. This is an *expository* rewrite of the
research-journal material in `../research/`; the iteration history lives there,
not here.

## Files

- `multidimensional-goodhart.typ` — the source.
- `refs.bib` — bibliography (hand-written; double-check page numbers/venues
  before anything goes out).
- `multidimensional-goodhart.pdf` — compiled output (regenerated, not
  hand-edited).

## Build

```sh
typst compile multidimensional-goodhart.typ
```

Needs [Typst](https://typst.app) ≥ 0.14. `refs.bib` is picked up automatically.

## Contents

- **Ch. 1** — Goodhart's law, multidimensionally: the "error changes shape"
  thesis, the hierarchy-of-proxies intuition, the `G / P / φ / ε` setup,
  dimension gap vs. observation gap.
- **Ch. 2** — Selection channels: Gaussian threshold model, dimensional
  scaling vs. bounded correlation budget, the `Z²−1` zero-covariance
  counterexample, threshold response `b_H(t)`, weighted response `B_H(θ)`,
  covariance as local Boltzmann velocity, the `‖B_H‖ ≤ δ·‖s‖` drift bound.
- **Ch. 3** — Intervention channels: response channels, the
  selection/intervention dichotomy, the linear–Gaussian Stackelberg gaming toy
  (`Δ = √(2κV)`), multidimensional gaming (additive water-filling vs.
  conjunctive `H = t|M|`, the `h_j = c w_j` exchange-rate condition).
- **Appendix A** — Currently in progress: live research questions feeding the
  chapters.
- **Appendix B** — Future open questions, parked for now.
