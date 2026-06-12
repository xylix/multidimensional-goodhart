# Pre-circulation LLM reviews: disposition record (June 11, 2026)

Two clean-context LLM reviews of the book + technical abstract ran June 11,
2026 against commit 4e34b9f-era builds (pre table-conversion, 30-page PDF;
the prior-work table was converted to per-family blocks in 3345a59 while
the reviews were running, and the current build is 29→30 pages after the
worked-positive addition). Both verdicts: **ready to circulate after
fixes.** Both reviewers stated the book's central claim accurately in their
own words; both confirmed the math sound on re-derivation; the Claude
review additionally ran the full simulation suite and verified all 29
refs.bib entries.

The full review texts are preserved verbatim in the conversation log and
summarized here by finding. Fix batches: 3a51552 (refs.bib), b74e353 (book
text), d10583f (worked-positive example), f48094a (abstract).

## Disposition table

| Finding | Severity | Outcome | Commit |
| --- | --- | --- | --- |
| GPT P2.1: T5 theorem box not self-contained | SHOULD-FIX | accepted (hypotheses moved into box, incl. d > 0) | b74e353 |
| GPT P3.1: roelofs2019testset URL points to wrong paper (arXiv 1906.02168) | SHOULD-FIX | confirmed by web check; URL now NeurIPS 2019 proceedings page | 3a51552 |
| GPT P3.2: skalse2022rewardgaming wrong title/DOI | SHOULD-FIX | **declined after verification**: NeurIPS 2022 proceedings title is "Defining and Characterizing Reward Gaming" (arXiv/slideslive say "Hacking"); bib correct | — |
| GPT P3.3: primaryClass cs.AI → stat.ML (el-mhamdi, majka) | NIT | accepted, verified on arXiv | 3a51552 |
| GPT P3.4: perdomo2020performative missing PMLR volume/series | NIT | accepted, verified v119 pp.7599–7609 | 3a51552 |
| GPT P4.1: prior-work table cramped | NIT | resolved-by-design (per-family blocks) | 3345a59 |
| GPT A1: abstract omits rank-condition answer | SHOULD-FIX | accepted (= Claude 12) | f48094a |
| Claude 1: every worked example ends in refusal | SHOULD-FIX | accepted; user chose full synthetic worked-positive example over acknowledgment sentence | d10583f |
| Claude 2: "proves the answer" → "derives" | NIT | accepted | b74e353 |
| Claude 3: Zuckerman trace reads as positive evidence | SHOULD-FIX | accepted ("(a within-hospital null)") | b74e353 |
| Claude 4: T5 box omits d > 0 | NIT | accepted (folded into P2.1 fix) | b74e353 |
| Claude 5: T6 floor clamping/positivity unstated | NIT | accepted (one clause) | b74e353 |
| Claude 6: §6.2 misattributes Karwowski et al. to "Skalse et al." | SHOULD-FIX | accepted (attribution split) | b74e353 |
| Claude 7: skalse2023goodhart published at ICLR 2024 | NIT | accepted, verified on OpenReview | 3a51552 |
| Claude 8: "and others" renders literally; Goodhart 1975 publisher dropped | NIT | accepted (full verified author lists; publisher folded into booktitle) | 3a51552 |
| Claude 9: no author/date on title page | SHOULD-FIX | accepted; user decision: "Xylix Pelttari" everywhere + June 2026 | b74e353, f48094a |
| Claude 10: notation overloads (c, V, m, H) | NIT | **deferred by user decision** → `plans/could-do/notation-overload-pass.md` | — |
| Claude 11: abstract Literature Relation omits empirical literatures | SHOULD-FIX | accepted by user decision (GPT adjudicated opposite; overridden) | f48094a |
| Claude 12: abstract open-problem omits rank-condition answer | SHOULD-FIX | accepted | f48094a |
| Claude 13: abstract box missing per-agent/fixed-deficit qualifiers | NIT | accepted | f48094a |
| Claude 14: "two questions" wording; missing signed-aggregate bullet | NIT | accepted (both) | f48094a |

## Bound deviations recorded

- Book: 29 → 30 pages from the worked-positive subsection (within the
  pre-stated ≤ 30 bound; section spans pp. 23–24, clean break).
- Abstract: 2 → 3 pages, entirely from the five added reference entries;
  bibliography font reduction (0.86em, 0.8em) tested and reverted — still
  3 pages, so the shrink bought nothing. Accepted.

## What both reviews confirmed sound (for the record)

Central claim stated early, consistently, and falsifiably; all six
theorems re-derived correct (T5 iff in both directions, T1/T2
Cauchy–Schwarz, T3 wedge, T4 Fenchel dual, T6 threshold + termination);
the covariance counterexample; the §8.4 rank-condition argument matching
the identification toy; HRRP and education characterizations faithful with
nulls reported as nulls; no policy/welfare drift; no broken
cross-references; references otherwise accurate (29/29 entries checked by
the Claude review).

## Remaining before circulation

The manual human read (see `plans/next-steps.md`), with the notation
TODO (`plans/could-do/notation-overload-pass.md`) as one of its check
items.
