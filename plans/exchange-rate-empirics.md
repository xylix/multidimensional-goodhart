# Exchange-rate empirics: existing hidden-harm evaluations as h_j evidence

Status: active plan, captured June 9, 2026 from user direction during the
spine discussion and promoted to plans/ root the same day. Research-side
track that runs in parallel with the manuscript pipeline in `next-steps.md`
(research/ files are not gated by spine approval); the book-side integration
lands in Phase 2+, slotting into spine.md section roles 9 (prior-work
relation) and 12 (open agenda) without changing the spine's central question
or core answer.

## The idea (user intuition, agreed)

For specific policies, existing empirical literatures have already produced
what are effectively hidden-harm exchange-rate estimates — they just do not
call them that. For the general policy-design problem, exchange rates cannot
be derived mathematically; finding them requires empirical effort and often
trial and error (policy variation), with the framework saying what to
estimate and what evidence suffices.

## Key sharpening

"Hidden" in T5 means hidden from the scorecard, not hidden from science.
h_j is unpriced by the incentive system, not unmeasurable by a researcher
with a different dataset (e.g. mortality vs. a readmissions scorecard).
This distinction answers the human-review objection "Can these even be
defined? The harm is hidden.." and upgrades the book's conditional-
diagnostic framing: the formula plus an existing evidence base, not the
formula plus a hypothetical.

Limit to state alongside: some harms are researcher-hidden too (long-horizon
outcomes, research quality). There the contract's "no licensed claim"
verdict remains correct, and trial-and-error has lags measured in years.

## Candidate literatures (verify citations before use — from model memory)

- Healthcare: HRRP readmissions-vs-mortality studies (Wadhera et al. ~2018
  JAMA; Gupta et al. heart-failure mortality; Zuckerman et al. 2016 NEJM on
  observation-status reclassification). Harm per unit score improvement.
- Education: test-based accountability — score gains that fail to transfer
  to low-stakes audit tests (Jacob 2005 on NCLB/Chicago; Jacob & Levitt
  cheating detection). Non-transferring gain = proxy inflation estimate.
- UK public services: Bevan & Hood, NHS waiting-time target gaming.
- ML: Gao et al. 2023 overoptimization curves (already in refs.bib) —
  proxy-vs-gold reward as an empirical exchange curve.

## The math to work out (the era-2 question)

Identification gap: aggregate data (total score movement, total harm
movement) estimates the realized weighted-average exchange rate H/d — which
is exactly T5's summary statistic — but the iff-condition is about
channel-level h_j. Decomposition needs action traces or policy variation
that shifts the channel mix (different weights/measured sets across sites
or time = the "trial and error" route). Tractable question: under what
policy-variation designs are channel-level h_j identifiable? This is a
small identification toy in the spirit of the existing
"identification toys and evidence thresholds" item in the book's open
agenda (§7.2), and far more tractable than Q18.

## Where it lands

- Research side first: a thread or applications file working one literature
  (HRRP is the cleanest) into contract fields, showing which h_j-like
  quantity the study estimated and under what response-channel assumptions.
- Book side (Phase 2+, per spine roles 9/12): the prior-work table gains a
  row family for "empirical exchange-rate estimates" — literatures that
  supply the h_j primitive that the formal analogues omit; the open agenda
  gains the identification question.
- Possible refs.bib additions after verification.
