# Education accountability mini-pass: the HRRP pattern, one rung higher

Iteration type: `application-mapping` (empirics track step 3,
`plans/exchange-rate-empirics.md`). June 10, 2026. Deliberately short: this
replicates the pattern of `hrrp_evidence_audit.md` on a second literature,
it does not redo the full audit.

## Purpose

Check whether the HRRP evidence-shape verdict (contested case-1 averages,
one trace, no regime variation) is HRRP-specific or the general shape of
hidden-harm evidence. Education accountability is the natural second case
because it has the one instrument healthcare lacks: a **low-stakes audit
test** running parallel to the high-stakes score.

## Verified sources

Citations verified June 10, 2026 against publisher/repository pages.
refs.bib additions deferred to step 4.

1. **Jacob BA.** Accountability, incentives and behavior: the impact of
   high-stakes testing in the Chicago Public Schools. *Journal of Public
   Economics*. 2005;89(5–6):761–796. High-stakes test scores rose sharply
   after Chicago's accountability introduction; the gains did not lead to
   comparable gains on a low-stakes test; and the response included
   observable test-pool
   shaping — increased special-education placement and preemptive
   retention — alongside substitution toward tested skills.
2. **Jacob BA, Levitt SD.** Rotten Apples: An Investigation of the
   Prevalence and Predictors of Teacher Cheating. *Quarterly Journal of
   Economics*. 2003;118(3):843–877. Classroom-level cheating detection from
   unexpected score fluctuations plus suspicious answer patterns: serious
   cheating in at least 4–5% of elementary classrooms annually, with
   observed cheating frequency responding strongly to relatively minor
   incentive changes.

## Channel set

`a_teach` (real instruction improvement), `a_narrow` (test-specific
drilling and curriculum substitution away from untested subjects),
`a_cheat` (answer manipulation), `a_pool` (test-pool shaping: exemptions,
placement, retention). The hidden quantity tracked by this literature is
proxy inflation — measured gain that fails to transfer to the audit test —
not welfare in any deeper sense.

## Mapping, in the identification note's vocabulary

- **The audit test upgrades case 1 — in principle.** The high-stakes/
  low-stakes gap is the H/d analog, but unlike HRRP's contested aggregate
  it is observable per school-grade-year: non-transferring gain is
  measurable at the unit level, turning one aggregate equation into many.
  That is an observability claim, not a description of what Jacob 2005
  did: its decomposition — attributing gains to test-specific skills and
  effort rather than general achievement — came from item-level skill
  analysis and directly observed responses. The audit instrument is what
  made that analysis possible at all, which is the upgrade this pass
  relies on. [tentative]
- **Two channels have traces (case 2-shaped, score-side).**
  Jacob–Levitt's detection algorithm is a per-classroom trace on `a_cheat`;
  Jacob 2005's exemption and retention rates are traces on `a_pool`. In
  contract terms `a_pool` is fixed-type intervention that produces
  composition contamination via an action — not selection over units
  (`W_theta`) — and what matters structurally is that the contaminating
  action is itself traced here: the contamination HRRP must assume away
  (panel freeze) is observable in education.
- **Incentive responsiveness is comparative-statics evidence.** Cheating
  frequency moving with minor incentive changes is exactly the response-
  model comparative static the hospital contract lists as its secondary
  discriminator — weak design variation, used qualitatively.
- **Still no case-3 design.** Accountability designs do vary across states
  and districts, so regime variation exists in principle — unlike HRRP,
  where it is structurally absent — but these studies (reasonably) use a
  single district's policy introduction, not cross-design variation, and
  no channel-level rate vector is estimated from it. [tentative]

## Verdict

The pattern replicates, one rung higher on the identification ladder in
the in-principle sense: education has a unit-level H-analog (the
audit-test gap), multiple per-channel traces, and mild comparative-statics
evidence — and the literature achieved partial decomposition of the score
movement (the cheating channel's extent bounded, transfer failure
measured) where HRRP could only contest an average. What is still missing
is the same in both
domains: no design delivers a channel-level rate vector, and the "harm"
education measures is proxy inflation, not welfare — long-horizon welfare
rates remain researcher-hidden, exactly the limit the plan states for
trial-and-error identification.

The cross-domain regularity worth keeping: **where audit instruments and
traces exist, decomposition happened; where only aggregates exist, the
literature fights about the average.** Evidence shape, not domain, predicts
how far the decomposition got. [tentative — an n=2 induction; a third
domain (NHS targets or RLHF overoptimization) would test it]

## Non-license

- No claim that Chicago's results generalize to other accountability
  systems, periods, or test designs; no policy evaluation of high-stakes
  testing.
- The audit-test gap measures non-transfer, not net welfare; `a_narrow`'s
  welfare sign (crowd-out vs harmless focusing) is not settled by anything
  cited here.
- Magnitudes (0.3 SD-type effect sizes, 4–5% cheating floors) are not
  load-bearing anywhere in this pass and should be re-verified against the
  primary texts before any quotation in book prose.

## Kill / narrow conditions

- If a close read of Jacob 2005 shows the low-stakes comparison cannot bear
  the unit-level H-analog interpretation (e.g., different populations or
  scaling make the gap non-comparable per unit), the "one rung higher"
  claim weakens to "traces only."
- A study exploiting cross-state design variation to estimate channel-level
  rates would falsify the "no case-3 use" claim — and would be the first
  real instance of the full identification route, worth a dedicated audit.

## Feeds

Step 4 (book integration, minimal): the Part 6 placeholder row can now cite
two domains with the same shape — realized averages and partial traces
exist; channel-level designs don't — and the Part 8 identification question
gets both the rank condition and the cross-domain regularity above.
