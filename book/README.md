# Multidimensional Goodhart — book draft

Working draft of the eight-part long-form treatment of multidimensional
Goodhart (spine v3). This is an *expository* rewrite of the consolidated research material
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

- **Part 1** — The measurement-dimension question: the scorecard design
  question, the two folk intuitions, the informal exchange-rate answer, and
  the five-stories underidentification example.
- **Part 2** — No generic law: the killed claims in paired "Not X / what
  survives" form, two tiers; full gallery in the appendix table.
- **Part 3** — The response-modeling contract: notation, declaration,
  declared-vs-observed status, and contract adequacy.
- **Part 4** — The exchange-rate diagnostic: the additive fixed-deficit
  model, T5, the affordability/harm boundary, and the non-transfer boundary.
- **Part 5** — Supporting calculations: selection bounds, intervention
  budgets, adaptive hardening, response-shape taxonomy, and
  aggregation-and-entry.
- **Part 6** — Prior work and stress tests: genealogy, primitive-attribution
  table (with an empirical exchange-rate placeholder row), and the MMLU,
  hospital-readmissions, and scientific-metrics cases.
- **Part 7** — Using the framework: the audit sheet for interpreting score
  movement before crediting it.
- **Part 8** — Refusals, falsifiers, and the open agenda: anti-applications,
  falsifiers, the residual-shape conjecture, identification gaps (including
  per-channel exchange-rate identification), and the toolkit gap.
- **Appendix** — The full killed-claims gallery as a table.
- **Technical abstract** — A standalone 2-page discussion starter mirroring
  the book's order: question, no generic law, contract, exchange-rate
  diagnostic, supporting calculations, literature relation, falsifiers and
  the open problem.
