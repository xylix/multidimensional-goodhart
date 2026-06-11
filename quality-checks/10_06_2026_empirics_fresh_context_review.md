# Fresh-context review: empirics track artifacts (June 10, 2026)

Scaled fresh-context review (single agent, no shared context) of the three
step-1–3 empirics artifacts, run as the agreed gate before step-4 book
integration. Acceptance questions: (A) does the rank-condition
identification logic survive a cold read; (B) do the audit verdicts follow
from the verified findings rather than from prior expectations.

Reviewer verified before judging: re-derived the T5 best response and
H_M(d); read and ran the simulation (5/5 pass); independently re-verified
all six citations and their findings against PubMed/publisher abstracts.

## Verdicts

- **A: pass-with-fixes.** Core math, both failure modes, and the
  simulation sound; channel-subset iff imprecise (finding 2); exclusion-
  restriction framing overclaims (finding 3).
- **B: pass-with-fixes.** All six source characterizations faithful; nulls
  and contested findings reported as such; no policy-evaluation drift.
  One BLOCKING mislabel (finding 1).

## Findings

1. **BLOCKING — Zuckerman misclassified as case 2.** The note's case 2 is
   harm-on-actions; Zuckerman 2016 regressed *score* change on the trace.
   A score-side regression attributes score movement to channels and
   identifies nothing about h_j even in principle. The "partial
   decomposition where traces exist" verdict (slated for the Part 6 row)
   inherits the ambiguity: what was decomposed is the score movement, not
   the harm.
2. **SHOULD-FIX — Case 3 iff imprecise for channel subsets.** Correct
   condition for individual h_j: e_j in the row space of the profile
   matrix. Full rank of a restricted submatrix is neither necessary nor
   sufficient (one regime with profile (1,1) identifies only h_1 + h_2).
3. **SHOULD-FIX — "Response-channel field is exactly the needed exclusion
   restriction" overclaims.** The assumption is exclusion-restriction-
   shaped; the field is where it gets declared, not the assumption
   holding. Simulation only tests the trivial direction (known-clean
   equations solve). Soften, tag [tentative].
4. **SHOULD-FIX — "Claims-based nulls" contradicts the audit's own
   sources.** Claims literature is split (Wadhera harm, Dharmarajan
   no-harm), not null.
5. **SHOULD-FIX — "Case 3 structurally unavailable" asserted from a
   four-study, pre-2019 survey.** FY2019 HRRP peer-group stratification
   (21st Century Cures Act, dual-eligible-share quintiles) is a documented
   non-proportional design change — a live candidate for the audit's own
   kill condition. Needs [tentative] and a mention.
6. **SHOULD-FIX — "This is why Jacob 2005 could decompose" is a just-so
   story.** Jacob's decomposition came from item-level skill analysis and
   directly observed responses, not from unit-level gap equations. Also
   "did not appear on a low-stakes test" overstates "did not lead to
   comparable gains." "One rung higher" survives only in-principle.
7. **SHOULD-FIX — Taxonomy slip on a_pool.** Pool-shaping is fixed-type
   intervention producing composition contamination via an action, not
   "the selection channel itself" (selection is W_theta over units).
8. **NIT — Sim check 5 language overdescribes the code** ("pool-
   composition drift"/"panel-frozen" = a hand-added additive term; no
   pool or panel modeled).
9. **NIT — Sim check 4 doesn't isolate the rank source** (deficits also
   vary; claim itself correct).
10. **NIT — "Attribution design" is not a contract field** (two of the
    three disagreement dimensions map to fields; the third is study
    design). Also Wadhera's hint labeled "a_d-type" vs the contract's
    a_c placement of observation status.
11. **NIT — Cross-domain regularity is an untagged n=2 induction.**

## Disposition

Fix batch applied same day (all 11 findings addressed); see the commit
referencing this file. Step 4 unblocked after the fix batch.
