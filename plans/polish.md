# Polish TODOs

Note: Ask user before implementing these — they are most efficient to do
before actually publishing or sending a draft over, rather than during
research iteration loops.

## Proposition and reference hygiene — completed in Iteration 47

- Checked theorem numbering against the T1–T6 spine after the refactor landed.
- Audited `book/refs.bib`: every Typst citation in the book and abstract must
  resolve; no orphan bib entries. (The deprecated paper artifact is excluded
  from this audit.)
- Cross-checked `research/claim_audits.md` against the renumbered theorems
  so every claim audit row points at the current proposition number.
- Cross-checked `research/core-math.md` book pointers: every theorem statement
  there must reference the book section that proves it; no proof prose
  duplicated across the two files.

## Figures and appendices — completed in Iteration 47

- Rebuilt the generated figure set around four promoted manuscript figures:
  dimension/observation gap, T1/T2 drift envelope, T4/T5 cost ellipse, and
  population gaming band.
- Decided not to include raw simulation PNGs in the book; they remain
  verification artifacts.
- Superseded the old generated appendix PDFs and updated `book/FIGURE_AUDIT.md`
  plus `book/figures/RATIONALES.md`.

## Reproducible-build green-light — completed in Iteration 47

Before declaring era 1 closed:

- `cd book && make` builds the book and abstract from a clean checkout
  without errors, producing both PDFs.
- All `make iteration*` simulation targets run with deterministic seeds and
  match their recorded expected outputs.
- No stale generated PDFs are tracked in git; `git status --short` is clean
  after a build.
- The deprecated `book/multidimensional-goodhart-paper.typ` is archived per
  `spine-refactor.md` and not part of any default Makefile target.

## Consistency pass — completed in Iteration 47

- Checked that the book matches the latest research theorem files.
- Checked that the abstract is a denser version of the book.
