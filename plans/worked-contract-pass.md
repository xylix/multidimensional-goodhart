# Worked contract pass on the school example

Status: active plan, created June 9, 2026 from the GPT-5 review (item 4:
"After the contract table … add one worked pass through the school example
using 4-5 rows of the contract. That would turn the checklist from
'plausible methodology' into 'usable method.'"). User approved planning it
the same day. Triage record:
`quality-checks/09_06_2026_gpt5_review_triage.md`.

## Goal

Let a reader check the declaration checklist (book §3.3) against a concrete
case without leaving Part 3: fill 4–5 contract fields for the Part 1
school-score example, ending in the licensing verdict §3.4 already states
("the licensed output is 'investigate,' not a verdict"). The worked pass
demonstrates the contract *withholding* a conclusion — it must not read as
the contract resolving the example.

## Field selection (proposed 5 of the 9)

- **Claimed output** — the book's own prose calls this field load-bearing;
  the school case's honest output is the weak one ("monitoring trigger").
- **Type representation** — §3.2 already has school-specific prose (one
  school with baseline traits; is u a school, student, classroom, district?)
  to draw on verbatim.
- **Response channel** — the selection/intervention split is exactly what
  the five stories instantiate; this row maps stories to channels.
- **Hidden value or harm** — the verdict turns on this field being
  undeclared in the bare score-rise case; filling it as "not declared"
  is the demonstration.
- **Evidence standard and falsifier** — names the observations that would
  separate the five stories (participation records, audit-test transfer,
  reporting traces), connecting forward to Part 7's discriminator-traces
  row.

Skipped: baseline behavior, policy exposure, action/search geometry,
proxy/target relation, aggregation — the most mechanical fills for this
example; keeping to five preserves the "small worked pass" character and
the half-page budget.

## Placement and form (decide at execution; recommendation below)

- **Option A (recommended):** a second framed block immediately after the
  Contract box in §3.3, in the same visual style, titled e.g. "The contract,
  filled in: the district's score rise." GPT-5's suggestion was "after the
  contract table," and §3.4's job is adequacy, not declaration — the
  existing §3.4 school-score callback then reads as a payoff rather than
  a duplicate.
- **Option B:** weave into §3.4 before the adequacy checklist, feeding the
  existing "exactly such a case" sentence directly. Cheaper transition risk,
  but overloads §3.4 with two jobs.

## Constraints

- Reuse the Part 1 five-stories vocabulary verbatim where possible; no new
  primitives, symbols, or notation.
- Each field entry is 1–3 sentences, declarative register, no "we".
- The pass must end with what is *not* licensed: all five stories standing,
  output "investigate." No claim-strength change anywhere.
- Length budget: about half a page (~15–20 lines of Typst source).
- Check the §3.4 sentence "The school-score path is exactly such a case…"
  for duplication after the block lands; trim one side if both now carry
  the same content.
- Math-mode hygiene: subscripted symbols with arguments need the space form
  (`W_theta (u)`, not `W_theta(u)`) per the batch-2 fix.

## Steps

1. Draft the filled-in block in Typst, Option A placement, matching the
   Contract box styling (same `#block` inset/stroke conventions).
2. Reconcile with §3.4: adjust the adequacy-section callback if duplicated.
3. Rebuild (`make all` in `book/`), visually inspect pp. 7–11 for page-break
   damage (the Contract box currently crosses the pp. 8–9 boundary; adding
   half a page will reflow Part 3 and may push Part 4's opening).
4. Mini-review: a fresh-context read of Part 3 only (the established
   two-stage review workflow, scaled down), checking the block reads as
   method demonstration rather than example resolution.
5. Fix batch if needed; commit.

## Acceptance

- A reader can trace each of the five filled fields back to its checklist
  bullet in the Contract box by name.
- The verdict sentence matches §3.4's existing language ("investigate,"
  not a verdict) — no new conclusion is licensed.
- Build green, deterministic rebuild leaves a clean tree, total page-count
  drift at most one page, no figure displaced from its section.
