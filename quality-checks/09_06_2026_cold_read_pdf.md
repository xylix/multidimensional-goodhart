# Cold read of the book PDF — June 9, 2026

Raw notes from a front-to-back read of `book/multidimensional-goodhart.pdf`
(28 pp., post-spine-v3, post-seam-pass build), in the style of the June 4
human review. Attention on judgment-level questions — does the thread cohere?
does page one earn the inversion? — not typo-hunting. Distillation at the end.

Reader context: same session that ran the seam pass, but first full read of
the manuscript in any form; the June 4 raw notes were read beforehand as a
style reference, so convergence with them is flagged where noticed.

## Raw notes

3:
- 1.1 opens directly on the design question. The two folk intuitions
  ("nowhere to hide" vs "every metric is a new attack surface") are stated
  fairly and then both refused: "They cannot both be right as stated, and
  neither is." Strong opening move.
- ¶3 delivers the inversion on the first content page: outcome decided by
  exchange rates, not dimension count, scoped honestly to "the one closed
  model where this book can answer the design question completely."
  **Verdict: page one earns the inversion.** The scoping clause does real
  work — it premises the whole book's modesty up front.
- > That statement is made precise as T5 once the model behind it has been declared.
    - "T5" is dropped on a reader who has not yet been told the book numbers
      its theorems T1–T6. One-word gloss needed ("Theorem 5 (T5)").
- 1.2 correctly separates the folk warning from the design question. The
  Goodhart/Strathern citation split is right.
- 1.3 five stories: still the best on-ramp in the book. (June 4 agreed.)

4:
- Selection/intervention bolded at first use, defined by who-changes. Good.
- "Hidden harm is no more readable off the path than mechanism is" — earns
  its place; this is the sentence 1.3 exists to license.
- Closing roadmap ¶ is explicit about Parts 2→3→4. The thread is declared,
  not implied. Good.

5–6:
- The "Not: …" / "What survives is …" drum in Part 2 works. Eight entries
  don't drag because each is three sentences.
- The new gloss on dim(ker φ) ("the count of directions the proxy map cannot
  see, in the notation of the next part") reads fine in print and removes
  the June 4 complaint about unexplained kernel notation at first contact.
- Z now introduced as standard normal at first appearance. Good.
- Closing ¶ of Part 2 ("no unconditional law survives, so the route to the
  exchange-rate answer runs through a declaration discipline") is the
  thesis-thread restated at the right moment.

7:
- 3.1 opening back-reach to the five stories holds (named callback).
- The three plain-language jobs of the contract: clear.
- "declared or estimated, not observed" ¶ — this is the paragraph that
  answers June 4's "can exchange rates even be defined? The harm is hidden.."
  It lands before any theorem needs it. Placement is right.

8:
- Figure 1 (new block diagram) is a real improvement over the old square
  schematic: measured/unmeasured target components as separate boxes, the
  dimension gap as "no path into the proxy," ε entering from outside.
  June 4's figure complaint is resolved.
- Type space U explained through the school example before the kernel
  formula; "read the conditioning in that order: fix the type, expose it to
  the policy, and the kernel returns the distribution" — resolves June 4's
  response-kernel comprehension complaint.
- **Typesetting bug (systematic):** μ_θ(A) renders as μ subscripted by
  "θ(A)" — the argument is absorbed into the subscript. Same for K_θ(ds|u),
  W_θ(u) (here and in the displayed μ formula). A math-literate reader will
  parse μ_{θ(A)} as "μ indexed by θ applied to A," which is wrong. Cause:
  Typst parses `mu_theta(A)` as a call in the subscript. Affects (found by
  source grep after the read): μ_θ(A), K_θ(ds|u), K_θ(A|u), W_θ(u),
  B_H(θ) (T1/T2 and defining line), H_M(d) (T5 box and §4.3),
  S_t(M) (T6 box, prose, falsifier bullets), S_floor(M).

9:
- The contract box renders well across the page break.
- > The first row is load-bearing.
    - The contract box is a bullet list of *fields* (and "field" is the
      book's own word everywhere else). "Row" is a leftover from some table
      version. Should be "field."
- The U-enrichment paragraph (type representation is part of the empirical
  claim) survives from June 4's "relevant if true" — it now has the
  adequacy check right after it, which is the justification June 4 asked
  about. OK as is.

10:
- Contract adequacy checklist + shorthand equation: good. The school-score
  callback ("the licensed output is 'investigate,' not a verdict") is the
  best single demonstration of what the contract buys.

11:
- Part 4 opens by naming exactly what it consumes from Part 3. Transition
  is clean.
- T5 box now carries the κ_j, w_j positivity hypotheses. Formula displays
  well. But H_M(d) suffers the subscript-absorption bug (renders H_{M(d)}).
- The two post-theorem ¶¶ (weighted average reading; "That is the answer to
  the design question") are the strongest prose in the book. The
  Holmstrom–Milgrom sentence now cites [12] and scopes it as "analogue, not
  grounding" — June 4's grounding complaint is resolved.

12:
- 4.2 affordability-vs-diagnostic: the (h, 0) two-channel example is much
  clearer than the old (M, 0) version. "Affordability is not welfare" is a
  good drumbeat.
- Figure 2: left/right panels match the caption; labels readable. Fine.

13:
- Figure 3: left band annotation reads "0 < t - Q <= sqrt(2 K V)" — uses K
  where T3's wedge uses κ; right panel axis "aggregate gaming capacity K"
  collides with the response-kernel symbol K_θ. In-figure only, but fresh
  eyes will trip. Rename in the figure script.
- Page is ⅔ empty (part boundary). Fine.

14:
- Part 5 opening ("none is an independent headline") executes the demotion
  the spine called for, in one sentence. Good.
- **Typesetting bug:** orphaned periods around display math in the theorem
  boxes. T1 box ends with a lone "." on its own line; T2 has a line starting
  ". For a declared norm,"; T4 (p. 16) has ". Gaming under stakes V…".
  Cause: sentence-final period placed after the closing `$` of block math.
  T5's box already does it right (period inside the display).

15:
- The Part 2 back-reference now opens the covariance paragraph ("Part 2's
  covariance refutation gets its mechanism here") — reads as intended, the
  duplication is resolved into a callback.
- Figure 4: "two hidden coordinates drawn for visualization only" answers
  June 4's "why two hidden coordinates specifically?" directly on the
  artwork. Good.
- T3 prose unpacking ("a below-threshold unit must buy the deficit…") is
  the ELI5 June 4 asked for.

16:
- "In T4, c* is the convex conjugate…" — answers June 4's "what is c*?".
- T6 box: S_t(M) and S_floor(M) hit the subscript bug.
- > often proportional to C w in a smooth unconstrained model.
    - C is never defined in the book. (It is the declared quadratic-cost
      matrix, c(a) = a^T C^{-1} a / 2, per research/claim_audits.md.) Needs
      an inline gloss or the symbol dropped.

17:
- 5.5 closes the supporting calculations with an explicit "what feeds it,
  where it ends" sentence. The Part 4 → Part 5 → 5.5 deferral chain
  (population entry, conjunctive rules, harm-to-welfare) all resolves here
  as promised. Checked: nothing deferred is left dangling.

18–19:
- Part 6's double reduction (literature, then cases) is well-framed:
  "what transfers is a primitive, never a theorem."
- The contributes/omits table is dense but each row's "licensed transfer"
  column keeps it honest. The placeholder row for empirical exchange-rate
  estimates is candid and matches 8.4's open problem.

20–21:
- The three cases each end with what the contract *refuses*, which is the
  right shape for stress tests. Hospital readmissions is the strongest; its
  "the design consequence is not 'assume the score is bad'" list is the
  most practical paragraph in the book.

22–23:
- Part 7 audit table: this is the June 4 wish ("a contract you can plug
  inputs into") in checklist form. Good.
- "A score rise is an observation to be explained, not a conclusion to be
  credited" — quotable, earned by this point.
- "The conclusion can be positive, but it has to be narrow" ¶ — the four
  paired claims are the best compression of the book's discipline. Strong.

24–25:
- 8.2 falsifiers: the "theorems cannot be empirically violated; what can
  fail is the claim the contract makes about a domain" framing is honest
  and well-located. The three falsifier bullets are concrete.
- 8.3–8.5: open agenda is candid (placeholder empirical row, identification
  gap, toolkit gap). Final sentence ("what would have to be true before a
  Goodhart calculation travels") is the right last note.

26:
- Appendix gallery: rows match the paired main-text entries; tier column
  consistent with Part 2's two tiers. The P = Z row doesn't re-gloss Z as
  standard normal, but the main text now does; acceptable for a gallery.

27–28:
- References render with retrieval URLs; [12] Holmström–Milgrom present;
  no obviously broken entries on visual scan.

## Judgment-level verdict

- **Does the thread cohere?** Yes. June 4's worst note ("almost feels like
  the paper's talking past itself… hardly a coherent main thread") no
  longer applies. Every part opens by naming its job relative to the
  measurement-dimension question, and every deferral made in Parts 4–5 is
  explicitly discharged (checked: 4.3's deferrals land in 5.5; Part 6's
  placeholder row lands in 8.4; Part 7 is the protocol Part 6 promises).
- **Does page one earn the inversion?** Yes — the folk-intuition pair plus
  the "one closed model" scoping makes the T5-first structure feel honest
  rather than overclaimed. The only blemish is the unglossed "T5" label.
- The residue of this read is typographic, not structural: one systematic
  math-rendering bug (subscript absorption), one display-punctuation bug
  (orphaned periods), two one-word prose fixes, one undefined symbol, one
  in-figure symbol collision.

## Distilled fix batch 2

1. [MED] Subscript absorption: insert space between subscript and argument
   for μ_θ(A), W_θ(u), K_θ(·|u), B_H(θ), H_M(d), S_t(M), S_floor(M)
   (source lines 251, 259–261, 288, 393, 452, 499, 507, 512, 514, 590–595,
   934–935).
2. [MED] Orphaned periods at display-math boundaries in T1, T2 (×2), T4
   boxes: move the period inside the closing `$`, matching T5's style.
3. [LOW] p. 3: "made precise as T5" → "made precise as Theorem 5 (T5)".
4. [LOW] p. 9: "The first row is load-bearing" → "first field".
5. [LOW] p. 16: gloss C in the response-shape bullet.
6. [LOW] Figure 3 script: left annotation sqrt(2 K V) → κ to match T3;
   right axis/annotation "K" → "κ" (or word "capacity") to avoid collision
   with kernel K_θ.

No structural items. With batch 2 applied, this read finds nothing blocking
a publishing move.
