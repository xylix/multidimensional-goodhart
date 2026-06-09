# Fresh-context seam pass — 2026-06-09

Scope: mechanical-regression review of `book/multidimensional-goodhart.typ`
(full linear read), `book/multidimensional-goodhart-abstract.typ`, and
correspondence against `research/core-math.md` (T1–T6). Reviewer only; no edits
made. Four classes: (1) transition quality at seams, (2) accidental
duplication, (3) dropped/dangling referents, (4) book-vs-core-math
correspondence. File:line pointers are into the book unless noted.

## 1. Transition quality at seams

[LOW] book:188 — "The school-score example left five stories on the table for
one score path." Part 3 opens by reaching back across the whole of Part 2 ("No
Generic Law") to the five-stories block introduced in Part 1 (lines 87–107);
the callback is named rather than vague, so it holds, but it is the longest
back-reach in the manuscript and worth confirming the reader still has the
example in hand.

[LOW] book:522 — "Covariance enters as a local velocity and nothing more." The
Part 5 selection section re-opens the covariance/local-velocity point as if
fresh, immediately after T1/T2, with no acknowledgment that Part 2 (line 152)
already framed "covariance as a local velocity"; mild tonal restart at the seam.
(See also finding 2.1.)

Otherwise the explicit "previous part"/"next part" connectives all point at the
correct adjacent part: 113→Part 2, 122→Part 3, 216→Part 2, 374→Part 3,
466–467→Part 5 ("end of the next part" = §5.5 Aggregation and entry),
806→Part 7. No false or dangling adjacency connectives found.

## 2. Accidental duplication

[MED] book:148–153 vs book:522–527 — "covariance as a local velocity: the
derivative at zero pressure" (148/152) and "Covariance enters as a local
velocity ... the derivative at zero pressure ... $H = Z^2 - 1$ ... baseline
covariance zero, finite-pressure drift nonzero" (522–527). The same
zero-covariance counterexample and the same "local velocity / zero-pressure
derivative" framing are stated near-verbatim in two parts; each reads as the
primary statement of the point rather than one being a back-reference to the
other.

[LOW] book:148–153 vs book:1016–1019 — the $P = Z$, $H = Z^2 - 1$ counterexample
appears a third time in the appendix table. This third copy is licensed by the
stated design (line 126 / 995–996: appendix is the full gallery, main text
carries load-bearing rows in paired form), so flag only for awareness, not as a
defect.

## 3. Dropped or dangling referents

[MED] book:131 — "Hidden harm does not scale with $dim(ker phi)$ by itself."
Part 2 uses $phi$, $ker phi$ (and $P$, $H$, $Z$ at 148–149) before any of them
is introduced; $phi$, $epsilon$, $P$, and the "$ker phi$" gloss are first
defined in Part 3 §3.2 "The notation" (lines 225–231), which now comes a full
part later in the reading order. Symbol-before-definition in the new order.

[LOW] book:434 — figure caption "Left (T4): private-cost contours ... Right
(T5)". This Part 4 figure caption names T4, whose theorem box is not stated
until Part 5 (line 560); forward reference to a theorem number that appears only
later. (The prose at 423 also forward-refers T4 to "the supporting
calculations," but does so explicitly, so it reads as intentional.)

[LOW] book:463 — caption introduces symbols $H_"per"$ and $H_"pop"$ that never
appear in the prose (prose uses the words "per-gamer harm" / "population harm");
core-math defines `H_per`/`H_pop` as named symbols. The symbols are orphaned to
a single caption, though self-explained there.

All four `<fig:...>` labels (237, 435, 464, 532) exist; the only `@fig:` ref
(627→fig:population-gaming-band) resolves to an existing earlier figure. All
four `image(...)` paths exist under `figures/`. All bibliography `@`-keys are
plausible refs.bib entries (not separately verified against refs.bib). No
broken cross-reference, no missing figure.

## 4. Book-vs-core-math correspondence

T1 (book 499–505 vs core 43–63): match — $|B_{H_i}| <= delta s_i$,
$||B_H||_2 <= delta ||s||_2$, $s_i$ as baseline sd.
T2 (book 507–513 vs core 65–82): match — value-direction and norm forms agree.
T3 (book 546–551 vs core 84–100): match — worthwhile iff $t - Q <= sqrt(2 kappa V)$.
T4 (book 560–567 vs core 102–120): match — $m(d)=sup_{lambda>=0}[lambda d - c^*(lambda w)]$, feasible iff $m(d) <= V$.
T5 (book 387–396 vs core 122–143): match — formula and iff-condition identical; book correctly scopes conservation to fixed-deficit/per-agent and does not claim population conservation (core's explicit non-license is respected at 452–455, 623–627).
T6 (book 584–592 vs core 145–170): match — $S_t(M) >= T$, $T = d^2/(2V)$, progress-aware multiplicative-rule termination with floor condition.
Abstract theorem statements (94–96, 110–111, 117, 126) also match core-math.

[LOW] book:387–396 — T5's theorem box omits the positivity hypotheses
$kappa_j > 0$, $w_j > 0$ that core-math T5 lists explicitly (core 126–127).
The conclusion is unaffected (denominator positivity is needed for the formula
to be well posed); flag as a missing-hypothesis omission only.

No instance found of the book claiming more than core-math licenses, of a
core-math main result being silently dropped (all of T1–T6 appear; the
no-population-conservation and non-transfer clauses are reproduced), or of the
book asserting as proven anything absent from core-math.

## Counts

- HIGH: 0
- MED: 2
- LOW: 6
