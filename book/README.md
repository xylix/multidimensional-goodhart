# Multidimensional Goodhart — book draft

Working draft of the six-part long-form treatment of multidimensional
Goodhart. This is an *expository* rewrite of the consolidated research material
in `../research/`; the iteration history lives there, not here.

## Files

- `multidimensional-goodhart.typ` — the source.
- `multidimensional-goodhart-abstract.typ` — two-page technical extended
  abstract for readers who need the current framework and boundaries quickly.
- `archive/multidimensional-goodhart-paper.typ` — deprecated medium-length
  paper extract, preserved for history and excluded from the default build.
- `refs.bib` — bibliography (hand-written; double-check page numbers/venues
  before anything goes out).
- `multidimensional-goodhart.pdf` — compiled output (regenerated, not
  hand-edited).
- `multidimensional-goodhart-abstract.pdf` — compiled extended abstract output.
- `FIGURE_AUDIT.md` — current figure inclusion audit and removal rationale.
- `scripts/make_appendix_figures.py` — deterministic matplotlib generator for
  the retained manuscript figures.
- `figures/` — generated figure PDFs plus `RATIONALES.md`.

## Build

With `make`:

```sh
make all
```

To build only the book or short abstract:

```sh
make pdf
make abstract
```

Or directly:

```sh
typst compile multidimensional-goodhart.typ
typst compile multidimensional-goodhart-abstract.typ
```

Use the Makefile for tracked PDFs because it pins Typst's creation timestamp.
Needs [Typst](https://typst.app) ≥ 0.14. `refs.bib` is picked up
automatically. To regenerate figures first:

```sh
uv run --with matplotlib --with numpy scripts/make_appendix_figures.py
```

## Contents

- **Part I** — The licensing problem: slogan failure, multidimensional setup,
  killed-claims gallery, and the response-modeling contract.
- **Part II** — Licensed calculations: selection bounds, intervention budget,
  scorecard exchange-rate result, adaptive-hardening boundary, and conditional
  response-shape taxonomy.
- **Part III** — Primitive attribution across fields: genealogy, formal
  analogues, contributes-vs-omits table, and reduction-not-unification framing.
- **Part IV** — Cases as stress tests: MMLU, hospital readmissions, and
  scientific metrics.
- **Part V** — Refusals: anti-applications and concrete falsifiers.
- **Part VI** — Open agenda: Q18 residual-shape conjecture, composition and
  identification gaps, and the practitioner toolkit gap.
- **Technical abstract** — A standalone 2–4 page discussion starter with
  motivation, contract, closed theorem set, killed claims, falsifier, minimal
  literature relation, and Q18.
