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
channel-level h_j. The literature estimates T5's *output*, not its inputs,
and the realized average does not transfer across designs: change the
scorecard and the loading weights κ_jw_j change with it, so last regime's
average is the wrong number for the next regime. This is the Lucas critique
applied to the book's own diagnostic (the book already cites Lucas as the
companion precedent): H/d is design-relative; the h_j are design-invariant
within the model's assumptions.

Under T5's model harm is linear in actions, H = Σ h_j·a_j, so identification
is linear algebra:

- **One regime, no traces:** one equation (H/d), n unknowns. Hopeless — the
  formal version of the Part 6 placeholder row.
- **Action traces observed:** harm-on-actions is a regression; channel rates
  are identified directly where traces exist (coding reclassification,
  observation stays, discharge timing).
- **No traces, policy variation:** each regime r with weights w^(r) induces
  a predicted action profile a*_j(r) ∝ κ_jw_j^(r), giving one equation per
  regime. The h_j are identified iff the matrix of action profiles across
  regimes has full rank in the channels of interest. Different sites/years
  with different scorecard weights — the "trial and error" route above — is
  exactly this.

Two named failure modes fall out: **collinear regimes** (rank deficiency —
all sites weight channels the same way, so the variation is fake) and
**selection contamination** (the harm outcome moves through pool changes
without any action, biasing every harm equation — the contract's
response-channel field doubles as an econometric exclusion restriction).
Structural invariance of h_j, κ_j across regimes is the maintained
assumption — the same defense the contract already demands for the type
representation.

This identification toy is small, fully in-model, and is the spine of the
rest of the track: it defines what "an h_j estimate" even means before any
literature gets audited. It is in the spirit of the existing "identification
toys and evidence thresholds" item in the book's open agenda (§7.2) and far
more tractable than Q18. It starts as a worked note plus simulation, not a
formal era-2 result; promote to research/ era-2 status only if it
crystallizes into something theorem-shaped.

## Agreed sequencing (June 10, 2026)

Math first, because the audit is much sharper when "what would identify
h_j" is already a stated condition rather than a gesture:

1. **Identification toy + simulation.** ✅ Executed June 10, 2026: worked
   note at `research/threads/exchange_rate_identification.md`, simulation at
   `research/simulations/identification_toy.py` (`make identification`;
   five seeded checks, all passing). The simulation also satisfies the
   minimal-Python-toy item in `could-do/supporting-artifacts.md` in
   passing. Original scope: the note above, plus a simulation in
   `research/simulations/` following the existing conventions (property-style
   checks, README table row, marked as boundary test / exploratory toy per
   `could-do/lean_validation_roadmap.md` Step 2): generate data from the T5
   model under multiple regimes, recover h_j, show recovery fail under
   collinear regimes and under selection contamination.
2. **HRRP worked audit** (the GPT-5 deliverable, consuming the toy's
   vocabulary). Frame: show which contract field each study fills —
   Wadhera/Gupta-type studies supply a contested H/d; Zuckerman supplies a
   coding-channel action trace; nothing supplies the regime variation. The
   contested-ness of the HRRP mortality findings is a feature: the
   disagreement maps onto missing contract fields (risk-adjustment = type
   representation; observation-status = action trace). Expected verdict:
   partial decomposition possible where traces exist; no full h_j vector
   from public aggregates — the honest, book-consistent landing.
3. **Education mini-pass.** Replication of the pattern (audit-test transfer
   = the H/d analog; Jacob–Levitt cheating detection = the trace). Short
   parallel pass, not a full audit.
4. **Book integration**, limited to: fill the Part 6 placeholder row with
   "realized averages + partial traces exist; channel-level designs don't,"
   and give Part 8's identification question the rank-condition answer.

RLHF (Gao et al.) is where the identification *design* is actually feasible
— regime variation is free, so the rank condition can be satisfied on
purpose by varying reward-model weights across runs and measuring
gold-reward loss by behavior category. That is a could-do experiment
sketch, not book material.

## Boundaries

- The candidate citations above are from model memory; web verification is
  a **hard gate** before anything enters refs.bib (blocks step 2's
  reference list, not its drafting).
- The track must not drift into policy evaluation of HRRP itself — the
  book's anti-application warnings apply to this work too.
- The book pipeline is closed; book integration stays limited to the
  Part 6 placeholder row and the Part 8 agenda sentence unless the user
  reopens it.
- The failure case is publishable: "channel-level h_j is not identifiable
  from any existing public dataset; here is the minimal design that would
  identify it" is a perfectly good landing — arguably the most on-brand one.

## Could-do connections

- `could-do/supporting-artifacts.md` asks for a minimal Python toy
  instantiating contract fields; the step-1 identification simulation can
  satisfy that item in passing.
- `could-do/example_draft.md` is a worked hospital-scorecard contract draft
  (type space, channels, response-channel ambiguity); it is the natural
  skeleton for step 2's contract-field mapping rather than starting fresh.
- `could-do/lean_validation_roadmap.md` Step 2 (executable response lab)
  sets the conventions the new simulation should follow; the identification
  toy is not a Lean target.

## Folded in from the June 9, 2026 GPT-5 review

A named deliverable: one minimal hypothetical audit showing what evidence
would actually estimate a harm rate h_j (the review's point was that the
book's Part 6 placeholder row says the primitives are hard to estimate
without showing what estimating one would look like). The natural vehicle is
the HRRP worked pass below: state the scorecard, the channel set, the
h_j-like quantity the readmissions-vs-mortality studies estimated, and the
response-channel assumptions under which that estimate identifies a
channel-level h_j rather than the realized weighted average H/d (the
identification gap above). Keep it evidence-contract-shaped — what would
license the estimate — not policy advice. Book-side landing if it
crystallizes: the Part 6 readmissions stress test or the placeholder table
row.

## Where it lands

Superseded by the agreed sequencing above: research side first
(identification toy, then the HRRP audit as a thread or applications file),
book side last and minimal (the Part 6 placeholder row and the Part 8
identification question). Possible refs.bib additions only after citation
verification.
