# Prose pass — On Writing Well review of `book/multidimensional-goodhart.typ`

**EXECUTED June 9, 2026** against the spine-v3 eight-part draft (Phase 3).
The Phase 2 structural rewrite had already dissolved most findings; the
residue was a five-edit pass (meta-prose trim in the contract part, an
agreement fix and a pointer fix in Parts 4–5, a figure cross-reference,
one "intentionally" cut) plus the polish.md "licenses" sweep. Verified by
grep: zero hits remain for "deliberately", the §2.2 throat-clearing intros,
the §2.3 negation pattern, and the §2.4 nominalization shapes; §3 preserved
lines all present. The file is retained as the reference for what was
checked.

Findings from a Zinsser-style review of the (pre-spine-v3) draft.

Absorption status (final, June 9, 2026):
- §1.1 (open on its own claim, not negation): superseded — the approved
  spine-v3 Part 1 opener is the design question plus the informal T5 answer
  (first-page rule); the residual-shape question lives in the open agenda by
  design. The negation-opener and "help science model" parse no longer
  exist.
- §1.2 (demote §§1.5 and §1.6 meta-commentary): absorbed by the spine.
- §1.3 (retitle Ch.7 opener): absorbed by the spine.
- §1.4 (bulletize Licensed-claims remark): moot — the remark does not exist
  in the spine-v3 draft.
- §2.1 ("deliberately"), §2.2 (throat-clearing), §2.3 ("I do not think"),
  §2.6 (apologetic preambles): verified gone by grep after the rewrite.
- §2.4 (nominalizations), §2.5 (overloaded sentences): listed instances
  gone; fresh read-through of the new prose found five local fixes, applied.
- §3 (lines to preserve): protected and re-verified after the pass.

## 1. Structural items the spine pass does not cover

### 1.1 Open the book on its own claim, not on a negation

Current opening (intro §1.1):

> "The empirical phenomenon I want this paper to help science model is not
> just 'the proxy stops working'. Scalar Goodhart already says that. The
> phenomenon is: optimization pressure reshapes the residual error landscape."

The real opening is sentence three. Sentence one also has an ambiguous parse
("help science model" reads as either "help [science] [to] model" or "help
[science-model]"), and frames the book by what it isn't.

Action (still applies after spine §1):
- Open Part I §1 with "Optimization pressure reshapes the residual error
  landscape."
- Fold the "not just 'the proxy stops working'" point in only if it earns its
  keep after the rewrite. Most likely cut it.
- The strong line that should be reached on page 1 (currently at line 518):
  *"how does pressure on a proxy reshape the distribution of its residual
  error?"* Pull this forward.

### 1.4 Reformat the "Licensed claims" remark

A 200-word single-block remark enumerating five propositions. Useful
inventory, painful prose.

Action: Convert to five bullets, one sentence each. The information is
already enumerated; let the typography show it. Locate after spine moves it
out of Ch.2 into the corresponding Part II section.

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

## 4. Execution order within this pass

1. §1.1 opener rewrite (after spine has set the new Part I §1 frame).
2. §1.4 Licensed-claims bulletization.
3. Full grep pass for the four tics in §2.1–§2.4.
4. The overloaded-sentence pass (§2.5).
5. Apologetic-preamble pass (§2.6).
6. Read the result aloud from the top; flag any new performed-tone lines that
   appeared during the rewrite.

## 5. Out of scope

- Figures and `refs.bib` audit (tracked in `polish.md`).
- The deprecated `multidimensional-goodhart-paper.typ` — archived by the
  spine-refactor pass; no prose work on it.
- Abstract prose — handled inside the archived spine-refactor pass as part of
  the 2–4 page rescope, not here.
- Any substantive math, scope, or claim changes (handled by the archived
  consolidation and spine-refactor plans).
