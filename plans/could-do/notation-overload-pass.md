# Could-do: notation-overload pass

Captured June 11, 2026 from the pre-circulation LLM review (Claude finding
10), deferred by user decision: resolve through human/manual judgment calls
or a dedicated LLM pass, not as a quick fix.

Four symbol overloads in the book, all readable in context per the
reviewer, but worth one deliberate pass before (or after) circulation:

- **$c$** — the proportionality constant in T5's iff condition
  ($h_j = c w_j$) vs the cost function $c(a)$ in T4's convex deficit
  budget. The two live in adjacent parts.
- **$V$** — stakes in T3/T4/T6 vs the value-norm subscript in T2
  ($|dot|_V$, $|dot|_(V,*)$).
- **$m$** — the target dimension ($G: S -> RR^m$) vs the private cost
  function $m(d)$.
- **$H$** — the hidden coordinate vector, the harm functional $H_M(d)$,
  $H_"per"/H_"pop"$, and the example variable $Z^2 - 1$.

Resolution options, in increasing invasiveness:

1. A one-line "notation reuse" footnote or remark at the first collision
   (the minimal fix the reviewer suggested).
2. Rename the cheapest offender — $m(d)$ is the easiest single rename
   (e.g. to $C(d)$... which collides with $c$; pick with care).
3. A full notation table in the front matter, which the book currently
   does not have.

Constraint: the book is in pre-circulation freeze; whichever option is
chosen should ride with a reading-round fix batch, with the usual
deterministic-rebuild verification. The manual human read should weigh in
on whether any of the four actually trips a reader.
