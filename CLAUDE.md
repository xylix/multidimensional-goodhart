# Multi-dimensional Goodhart

A formal research project on multi-dimensional Goodhart. The full operating
manual for **generate / edit / review / application-mapping / literature-review
iterations** is **RESEARCH-ITERATIONS.md** — read it before that kind of work.
(`CLAUDE.md` and `AGENT.md` are identical thin wrappers; the manual is loaded on
demand to keep it out of every session's context.)

## Always-on norms (apply to all claims/prose work, not just iterations)

- **Scale to the task.** These are gates for substantive claims and iterations.
  For trivial mechanical work — typos, renames, formatting, file lookups, single
  citations — take the simple correct path and skip the ritual. Rigor tracks the
  weight of the claim, not every edit.
- Tag every nontrivial claim `[confident]` / `[tentative]` / `[guess]`
  (default `[tentative]`). The tag is a tripwire, not a score: `[confident]`
  obliges an adversarial pass; no toy example → downgrade one level.
- The load-bearing instrument is the licensed-claim / overclaim pass: state
  what a claim actually proves and the stronger claim the text must not imply.
  Prefer sharpening to a precise conditional over adding generic caveats.
- No finishedness overclaim. Don't call work "done" when it's rhetorically
  convenient — check it against `plans/next-steps.md`.
- Attribution discipline: cite, invent, or downgrade — never blur prior
  literature into looking attributed when it isn't. For prior-art / lit-review
  work, verify by reading, not from memory
  (RESEARCH-ITERATIONS.md §Literature-review norms).
- **Anchor check.** Restate the originating question in one plain sentence and
  confirm the current work still serves it; a nicer reformulation is a flagged
  proposal, not a silent substitution.
- **Weight rigor by verification capacity.** The harder a claim is for the human
  to check, the *higher* the evidence bar — not lower. Flag results that
  persuade mainly through texture (clean notation, named theorems, fluent prose)
  in regions the human can't follow, and route them to external / Lean / expert
  review.

## Red flags — self-check; downgrade and flag if any fire

- Suspiciously short/elementary for the apparent difficulty.
- Proves significantly more than was asked.
- Doesn't fully use the stated hypotheses.
- Can't summarize the key idea in 2–3 plain sentences without rereading your own text.
- Conclusion is exactly what was most rhetorically convenient for the motivating story.
- Toy example feels engineered to fit the claim rather than independently chosen.
- Work has drifted to a cleaner adjacent question than the one that motivated it.
- Persuasive mainly through texture in a region the human can't independently verify.

Commit directly to main with a one-line summary.
