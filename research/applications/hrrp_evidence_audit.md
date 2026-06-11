# HRRP evidence audit: what the literature supplies, contract field by field

Iteration type: `application-mapping` (empirics track step 2,
`plans/exchange-rate-empirics.md`). June 10, 2026.

## Purpose

This file audits the published HRRP empirical literature against two
existing artifacts: the contract fields of
`research/applications/hospital_scorecard.md` and the identification cases of
`research/threads/exchange_rate_identification.md`. The question is not "was
HRRP good or bad" — that is policy evaluation and out of scope by the plan's
Boundaries section. The question is evidence-shape: **which contract field
does each study fill, which identification case does it instantiate, and
what is still missing for channel-level exchange rates `h_j`?**

The audit's expected verdict, stated up front so the exercise is falsifiable:
the literature supplies contested realized averages (identification case 1)
and one per-channel action trace whose result was a null (case 2); nothing
supplies regime variation (case 3); therefore partial decomposition is
possible where traces exist, and no full `h_j` vector is recoverable from
public aggregates.

## Verified sources

Citations verified June 10, 2026 against PubMed/publisher pages (the plan's
hard gate). refs.bib additions are deferred to the book-integration step.

1. **Wadhera RK, Joynt Maddox KE, Wasfy JH, et al.** Association of the
   Hospital Readmissions Reduction Program With Mortality Among Medicare
   Beneficiaries Hospitalized for Heart Failure, Acute Myocardial
   Infarction, and Pneumonia. *JAMA*. 2018;320(24):2542–2552.
   (PubMed 30575880.) Claims-based time-series around HRRP announcement and
   implementation: 30-day post-discharge mortality increased for heart
   failure and pneumonia (not AMI), with the increase concentrated among
   patients who had *not* been readmitted.
2. **Gupta A, et al.** Association of the Hospital Readmissions Reduction
   Program Implementation With Readmission and Mortality Outcomes in Heart
   Failure. *JAMA Cardiology*. 2018;3(1):44–53. (PubMed 29128869.)
   Interrupted time series on a prospective clinical registry (heart
   failure, 2006–2014): readmissions fell after implementation; 30-day and
   1-year mortality rose.
3. **Dharmarajan K, Wang Y, Lin Z, et al.** Association of Changing Hospital
   Readmission Rates With Mortality Rates After Hospital Discharge. *JAMA*.
   2017;318(3):270–278. (PubMed 28719692.) Hospital-level change-on-change
   correlation, >5M Medicare hospitalizations 2008–2014: readmission
   reductions weakly but significantly correlated with mortality
   *reductions*; no harm signal.
4. **Zuckerman RB, Sheingold SH, Orav EJ, Ruhter J, Epstein AM.**
   Readmissions, Observation, and the Hospital Readmissions Reduction
   Program. *NEJM*. 2016;374(16):1543–1551. (PubMed 26910198.) Within-
   hospital trace analysis: observation-stay use rose 2007–2015 for targeted
   and nontargeted conditions alike, but hospitals with larger readmission
   reductions were *no more likely* to have increased observation use.

**Correction to the plan's memory-based gloss.** The plan described
Zuckerman as supplying "a coding-channel action trace" suggestive of
reclassification gaming. The verified finding runs the other way: the trace
was measured and the substitution hypothesis *failed* the within-hospital
test. The methodological point survives — traces are what convert averages
into decompositions — but what the trace licensed here was ruling a channel
*out* as the dominant driver, which is equally a decomposition step.

## The scorecard and channel set

Notation from `hospital_scorecard.md`: action channels
`a_c` (coding/observation-status movement), `a_d` (admission-threshold and
treatment-location movement), `a_f` (real follow-up and care-transition
improvement), `a_s` (patient selection/avoidance). Hidden harm
`H = h_c a_c + h_d a_d - h_f a_f + h_s a_s`; the score is counted 30-day
readmissions for the targeted conditions.

## Study-by-study mapping

### Wadhera 2018 — contested realized average, plus a trace-shaped hint

- **Identification case:** case 1 (one regime, aggregate harm movement).
  The study estimates harm movement (post-discharge mortality) over the
  policy window — an H-side observation under one national design. As the
  identification note shows, this is one equation in n unknowns: it cannot
  say *which channel* produced the harm, only that aggregate hidden harm
  moved while the score improved.
- **Contract fields filled:** the hidden-outcome measurement the evidence
  standard demands (mortality alongside the counted readmission), and the
  proxy/target relation field (the score and the hidden outcome moved in
  welfare-opposite directions for HF/pneumonia).
- **The trace-shaped hint:** the mortality increase concentrating among
  *non-readmitted* patients is not a per-channel action trace, but it is
  channel-discriminating evidence: it points toward treatment-location
  movement (`a_d`-type: ER/observation care in place of inpatient care)
  rather than toward harm among the readmitted. The study itself flags this
  as a possibility, not a finding. In contract terms: a candidate channel is
  named; its action trace is not measured.

### Gupta 2018 — the same H/d with a different type representation

- **Identification case:** case 1 again, on registry rather than claims
  data.
- **Contract fields filled:** type representation. The registry's clinical
  risk adjustment is the study's main lever, and its harm estimate differs
  from claims-based nulls — demonstrating that the H/d estimate is sensitive
  to exactly the field the contract makes hospitals' type representation
  carry. A second equation, but from (approximately) the same regime: it
  adds robustness information, not rank.

### Dharmarajan 2017 — the counter-average, and why the disagreement is a feature

- **Identification case:** case 1, with a different estimand: hospital-level
  *change-on-change* correlation rather than population time series. Weak
  positive correlation between readmission reduction and mortality
  reduction.
- **What the disagreement with Wadhera/Gupta maps onto:** not noise, but
  contract fields. The studies differ in type representation (claims vs
  registry risk adjustment), population definition (which admissions enter
  the denominator; survival to discharge), and attribution design
  (policy-window time series vs within-hospital correlation). The
  contested-ness of the HRRP mortality literature is exactly what the
  contract predicts when case-1 evidence is asked to answer a channel-level
  question: under-identification shows up as estimates that move with
  auxiliary modeling choices. [tentative]

### Zuckerman 2016 — the one true action trace, with a null verdict

- **Identification case:** case 2 (action trace observed). Observation-stay
  use per hospital is a direct trace on the `a_c`/`a_d` boundary, and the
  within-hospital regression of score change on trace change is precisely
  the harm-on-actions design the identification note describes.
- **Verdict the trace licensed:** the substitution channel did not covary
  with score improvement across hospitals, so observation-stay
  reclassification is ruled out as the dominant driver of the *measured
  readmission decline* at national scale. Note the limits: it rules a
  channel out for the score movement; it does not measure that channel's
  `h_j`, and it does not address the treatment-location hypothesis for the
  *mortality* movement (Wadhera's non-readmitted concentration), which
  concerns patients who never re-presented as readmission candidates.

### What nothing supplies — case 3

No study supplies regime variation, and under a single national payer
design none can: HRRP applies one weight structure to all hospitals at a
time, so cross-site variation in scorecard weights is absent by
construction. Time variation exists (penalty phase-in, condition-set
changes) but moves the design slowly and roughly proportionally — the
collinear-regimes failure mode, not the full-rank route. The action-profile
matrix across observable "regimes" is rank-deficient in the channels of
interest.

## Verdict

As predicted: **partial decomposition where traces exist; no full `h_j`
vector from public aggregates.**

- The realized average H/d exists but is contested, and the contestation
  itself maps onto contract fields (type representation, population
  definition, attribution design) — the formal signature of asking case-1
  evidence a channel-level question.
- One channel has trace evidence (observation status), and the trace did
  decompositional work: it ruled the channel out as the main score driver.
- The minimal design that would identify channel-level `h_j` here, in the
  identification note's vocabulary: per-channel action traces (coding,
  observation status, admission thresholds, follow-up intensity, selection)
  for a panel of continuing hospitals — the panel freeze supplying the
  selection-contamination exclusion — with unit-level cost heterogeneity or
  genuine weight variation supplying the rank. The trace route is the
  feasible one; the regime-variation route is structurally unavailable under
  a uniform national design.

## Non-license

- This audit takes no position on whether HRRP raised mortality; it
  classifies the *shape* of the evidence, not its policy meaning.
- No `h_j` number is extracted or implied. The identification note's model
  (quadratic costs, linear harm, deterministic best response) is the
  vocabulary, not a claimed description of hospital behavior.
- Ruling out observation-stay substitution nationally does not rule it out
  for any particular hospital, and a null on one trace is not a null on the
  channel set.

## Kill / narrow conditions

- A published study supplying genuine cross-site or sharply non-proportional
  time variation in HRRP-relevant scorecard weights would falsify the
  "case 3 structurally unavailable" claim and should replace it.
- A study measuring multiple per-channel traces against hidden outcomes for
  a hospital panel would upgrade the verdict from "partial decomposition
  possible" to an actual partial `h_j` estimate, and this audit should then
  be rewritten around it.
- If the Wadhera/Gupta/Dharmarajan disagreement is eventually resolved by a
  design that does *not* correspond to fixing a contract field, the
  "contestation maps onto contract fields" claim is wrong and must be
  dropped.

## Feeds

- Step 3 (education mini-pass): replicate the pattern — audit-test
  transfer gaps as the H/d analog, cheating detection as the trace.
- Step 4 (book integration, minimal): Part 6 placeholder row gets
  "realized averages and partial traces exist; channel-level designs
  don't"; Part 8's identification question gets the rank condition. The
  verified citations above become refs.bib candidates at that step, not
  before.
