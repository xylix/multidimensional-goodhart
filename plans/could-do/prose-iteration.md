# Prose iteration — On Writing Well pass on `book/multidimensional-goodhart.typ`

Findings from a Zinsser-style review of the current draft. Ordered by impact:
structural moves first, then concrete line work. Each item is independently
applicable; ordering inside a section is by how much it changes the piece.

## 1. Structural

### 1.1 Open the book on its own claim, not on a negation

Current opening (intro §1.1):

> "The empirical phenomenon I want this paper to help science model is not
> just 'the proxy stops working'. Scalar Goodhart already says that. The
> phenomenon is: optimization pressure reshapes the residual error landscape."

The real opening is sentence three. Sentence one also has an ambiguous parse
("help science model" reads as either "help [science] [to] model" or "help
[science-model]"), and frames the book by what it isn't.

Action:
- Rewrite the first paragraph to begin "Optimization pressure reshapes the
  residual error landscape."
- Fold the "not just 'the proxy stops working'" point in only if it earns its
  keep after the rewrite. Most likely cut it.
- The strong line that should be reached on page 1 (currently at line 518):
  *"how does pressure on a proxy reshape the distribution of its residual
  error?"* Pull this forward.

### 1.2 Demote §§1.5 ("Work in progress") and §1.6 ("Open questions")

Roughly two-thirds of Chapter 1 is meta-commentary inherited from the research
journal: what would be promising, what is parked, what is open. This is
load-bearing for the author's credibility but it postpones the book for the
reader. The actual best move of the book — the selection/intervention
dichotomy with their controlling quantities — currently sits at lines
1486–1507 of Chapter 4.

Action:
- Move §§1.5 and §1.6 into a back appendix titled "Threads not pursued" or
  similar, or collapse them into a single short paragraph in the intro.
- Restructure the intro so that by the end of §1.3 the reader has: the
  phenomenon, the selection/intervention split, the response-modeling
  contract.

### 1.3 Retitle and rewrite Chapter 7's opener

`== Why this chapter exists` is throat-clearing as a section title, and the
section then opens with what the chapter is *not* ("not a survey of
Goodhart-like effects").

Action:
- Retitle to a content-bearing heading: e.g. "Primitive map" or "Which
  results instantiate which primitive".
- Drop the meta opener; lead with the rule: "A source enters this chapter
  only if it names a primitive and carries a falsifier."

### 1.4 Reformat the "Licensed claims" remark in Chapter 2

A 200-word single-block remark enumerating five propositions. Useful
inventory, painful prose.

Action: Convert to five bullets, one sentence each. The information is
already enumerated; let the typography show it.

## 2. Line-level — recurring tics to fix in a pass

### 2.1 "deliberately" tic

Appears in §1.1, §1.5, §1.6, §2.4, App. A and elsewhere ("deliberately
narrower", "deliberately *not* on the critical path", "deliberately
different", "deliberately conditional"). Almost never adds information;
mostly announces virtue.

Action: Grep all uses; cut unless the word is doing real semantic work.

### 2.2 Throat-clearing list intros

Examples:
- "Several tempting framings should be rejected by name."
- "A reader who wants the punchline before the construction: there is a
  clean dichotomy …"
- "The contribution here is to make the vector structure explicit."
- "The contract turns the framework into a menu of conditional claims rather
  than a universal theorem."
- "This is also the transfer rule for applications."

Action: Cut lines that label the move instead of making it. Trust the next
paragraph to do the work.

### 2.3 "I do not think the right claim is X" pattern

Both negations in §1.2 stage the author's stance instead of stating the
result. The book elsewhere has the better mode ("Unconditional dimensional
scaling does not work").

Action: Replace both "I do not think the right claim is X. Y." constructions
with the direct negative.

### 2.4 Buried verbs / nominalizations

Examples and proposed revisions:

> "Conservation of $H_per$ appears only under an exchange-rate condition"

→ "$H_per$ is conserved only when harm-per-score exchange rates match."

> "the dimension count enters through a coupling or variance budget, not by
> itself"

→ "Dimension count alone does nothing; it enters through coupling and
variance."

> "hidden drift is a baseline-response object and admits two Cauchy–Schwarz
> bounds"

→ "In a pure selection channel, two Cauchy–Schwarz bounds constrain hidden
drift."

Action: Do one pass specifically for "is/are an X object", "admits", "enters
through", "appears only under" — these are the book's main nominalization
shapes.

### 2.5 Overloaded sentences

End of §1.4:

> "So the rest of the paper answers a narrower and better question: does
> multidimensional Goodhart make proxy-induced distortion modelable, by
> predicting the shape of distortion from the declared response channel,
> aggregation rule, and action geometry, in regimes where scalar Goodhart can
> only say that optimization pressure broke the proxy?"

Action: Split into three sentences. Suggested rewrite:

> "So the book answers a narrower question. Given a response channel,
> aggregation rule, and action geometry, what shape of distortion follows?
> Scalar Goodhart can only say the proxy broke."

### 2.6 Apologetic preambles to strong claims

> "A reader who wants the punchline before the construction: there is a clean
> dichotomy between *selection channels* … and *intervention channels* …."

Action: Drop the preamble. "The dichotomy is clean. *Selection channels*
reweight a fixed baseline; *intervention channels* …."

## 3. Lines to preserve

These are working and should not be edited away in the pass:

- "The metric lies, by up to $\Delta$." — Chapter 4. The book's voice when
  it lets itself be direct. Write more sentences like this.
- "$V$ and $\kappa$ are placeholders for primitives that a domain model must
  earn." — Chapter 7.
- "That mapping does not need to be perfect before the framework can be
  useful. It does need to be explicit enough that the claim can fail." —
  §6.5.
- "In a pure selection model, if hidden coordinates are independent of the
  selected proxy, thresholding does not move them." — §1.2.
- The "Does not license" boilerplate following each Proposition. Repetitive
  by design; it is the epistemic discipline the book is selling.
- The hospital-readmissions worked contract (§6.5). Only place where the
  methodology touches a concrete case at length.
- ML caveats throughout — the refusal to map $\kappa$ onto RLHF mechanisms
  is the book's most distinctive move.

## 4. Suggested execution order

1. Structural moves (§1.1–1.3 of this plan). These reshape the reader's
   first 10 pages and make the line-level edits worth doing.
2. The "Licensed claims" bulletization (§1.4) — cheap, high readability win.
3. Full grep pass for the four tics in §2.1–2.4.
4. The overloaded-sentence pass (§2.5).
5. Read the result aloud from the top; flag any new performed-tone lines that
   appeared during the rewrite.

## 5. Out of scope for this iteration

- Figures (tracked in `polish.md`).
- Backporting to `multidimensional-goodhart-paper.typ` (tracked in
  `polish.md`).
- Any substantive math, scope, or claim changes.
