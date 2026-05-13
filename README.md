# Multidimensional Goodhart

A research project aiming at formalizing the geometry of error when a proxy measure is used to measure and intervene on a system under optimization.

The organizing split, so far: a proxy can break two ways. You pick differently from the same pool (admissions using a new test score; the applicants don't change, you just rank them differently), or the people being measured change their behavior (students cram for the test). These look similar from the outside but need different math.

Aiming to answer questions such as:
- Are there predictable qualities in how the error spreads when new measures are added (e.g. if you are measuring n scalars in a system, and start measuring n+1 scalars, what changes?)
    - Expectation: The correlations between the "hidden error variables" (real value that is lost due to the system optimizing towards the metric) are relevant for how much new error accrues and what shape the error takes.
- How different are the two break-modes above? When does "just picking differently" stop being enough and behavior change take over?
- If you grade on test + homework, does adding homework stop the cheating or just give cheaters a second lane? The answer flips depending on whether low homework can be made up by a high test (then a new lane opens) or both have to clear a bar (then it gets harder, but more honest students fail too).
- Catch cheating on the test, so you add homework. Catch homework copying, so you add attendance. Does the cheating keep moving to places harder to see? Hard to answer without deciding, before you start, what "harder to see" means — otherwise you're just naming whatever's left over.
- More things measured means more real signal, but also more places to game. Is there a sweet spot? Is it sometimes empty — no good number of things to measure?

## Stretch goals for the research agenda

- What kind of function specifies a future most humans would call utopian?
    - Intuitive hypothesis: it needs enough complexity to keep every bad error dimension small.

- Demonstrate that various economic, ML, and other theories describing Goodhart-like phenomena share the same underlying mathematical mechanism.


# Repo

- `book/` — typst draft + compiled PDF. `make` in there, or `typst compile multidimensional-goodhart.typ`.
- `research/` — formalization notes, iteration log, open questions.
- `research/threads/` — live fragments not yet promoted into the book.

Status: intro + chapters 1–5 drafted, appendices sketched, several threads open.


# Notes

- The research as of 2026-05-13 has been heavily LLM-driven. I'm performing manual sanity checks and slowly upgrading it's rigorousness, but I cannot yet recommend the raw .pdf or the research files for human consumption.
