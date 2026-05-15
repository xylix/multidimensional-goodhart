# Polish TODOs

Note: Ask user before implementing these — they are most efficient to do
before actually publishing or sending a draft over, rather than during
research iteration loops.

## Proposition and reference hygiene

- Check proposition numbering order after the spine refactor lands.
- Audit `book/refs.bib`: every Typst citation in the book and abstract must
  resolve; no orphan bib entries. (The deprecated paper artifact is excluded
  from this audit.)
- Cross-check `research/claim_audits.md` against the renumbered propositions
  so every claim audit row points at the current proposition number.
- Cross-check `research/core-math.md` book pointers: every theorem statement
  there must reference the book section that proves it; no proof prose
  duplicated across the two files.

## Figures and appendices

- Re-do (remove, refactor, re-implement, or re-generate) figures. The
  figures as of 2026-05-13T13:44 are not doing what they are supposed to
  achieve.
- Eventually include selected simulation output PNGs, especially the
  Iteration 21 active-set and welfare-object plots, as appendix figures in
  the book after the figure pass decides which generated artifacts are worth
  preserving.
- Eventually decide which generated appendix PDFs should be regenerated,
  referenced, or replaced during the final figure/appendix pass; keep draft
  appendix PDFs out of git until that decision is made.

## Reproducible-build green-light

Before declaring era 1 closed:

- `cd book && make` builds the book and abstract from a clean checkout
  without errors, producing both PDFs.
- All `make iteration*` simulation targets run with deterministic seeds and
  match their recorded expected outputs.
- No stale generated PDFs are tracked in git; `git status --short` is clean
  after a build.
- The deprecated `book/multidimensional-goodhart-paper.typ` is archived per
  `spine-refactor.md` and not part of any default Makefile target.

## Consistency pass
- Check that the book matches the latest research files
- Check that the abstract succesfully is a denser version of the 'book'.
