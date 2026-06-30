# General research review — 2026-06-30

Status: whole-repo review, requested as an honest/direct pass over the research
work. Verdict and section findings below. This is a snapshot, not a task list;
where it implies work, that work belongs in `plans/next-steps.md`.

Method: direct read of `README.md`, `research/core-math.md`, and
`literature-reference-gap-paper/citation-audit/findings.md`; three fresh-context
survey agents over (a) the book manuscript, (b) the research process/simulations,
(c) the gap-paper + lit-review. The process-survey agent read charitably (claimed
"zero process theater," which the file tree contradicts) and is discounted where
it conflicts with the file tree.

## One-line verdict

A real project with genuine discipline that reached a deflationary conclusion
about itself — the surviving math is elementary and mostly classical prior art
from other fields — and whose most valuable output is a byproduct (the
citation-gap finding), not the theory it set out to prove. The self-awareness is
the main strength.

## Strengths / citation-worthy

- **Citation-gap paper is the real asset.** Coded and reproducible (25 papers,
  explicit tier scheme, name-collision rules, OpenAlex reverse sweeps), not
  asserted. Already self-corrected one overclaim (CHAI/Hadfield-Menell
  counterexample → narrowed to "contract theory entered alignment only via the
  control/incomplete-contracting branch, not on the Goodhart object"). Gap itself
  **CONFIRMED 2026-06-28** (saturated discovery + adversarial passes). Ridgway
  1956 ("oldest ancestor, uncited") is a strong beat. More defensible *now* than
  the theory paper.
- **Negative-results discipline is substantive, not performative.** Killed claims
  ship with concrete counterexamples (`Cov(H,P)=0` Gaussian kills
  covariance-as-primitive; `n^{-4}/n^{-2}` witness shows finite variance drifts
  to infinity without finite χ²). The project killed claims its own narrative
  wanted (minimum-complexity attractor).
- **Response-modeling contract (Part 3)** is the durable original on the theory
  side — a discipline (declare type space, kernel, costs, aggregation,
  value/harm before any claim is licensed), plus the selection-vs-intervention
  non-identifiability ("can't tell which from score movement alone — a result,
  not a gap").
- **Simulations run and match the theorems** (water-filling output matches T4's
  closed form). Verification layer, not decoration.

## Weaknesses

- **Theory paper's contribution is synthesis, not new math** — and it half-knows
  it. T5 = Feltham–Xie/Baker congruity; selection bounds = Chapman–Robbins/χ²-DRO;
  convex budget = Fenchel. Residual = synthesis + the contract + the
  subset-invariance reading. Legitimate, but it's a survey-with-a-framework; the
  manuscript should state elementariness proudly and drop the motte-and-bailey.
- **Manuscript sprawls (~11.6k words)** trying to be theorem paper + survey +
  practical guide at once. Contract checklist restated 4×; Part 2 spends ~1,100
  words killing strawman claims; T6 (adaptive hardening) is a completeness toy
  orthogonal to the main question; only worked example in the main text is a
  *refusal*, no satisfiable signed numerical audit.
- **Bookkeeping has crossed into overhead.** Overlapping logs/registries/state
  files (`iteration_log` + `iteration_log_full_1_43` + `project_state_after_*` +
  `next_mode_decision_after_*` + `claim_audits` + closed/open/parked questions +
  negative_results + red_flags), ~30 files under `plans/`, dated quality-checks,
  reviews. Individually justifiable; collectively low signal-to-bookkeeping. The
  `*_after_iteration43` naming rots the moment iteration 44 lands.
- **Motivating question quietly abandoned.** Started on recursive Goodhart
  ("Goodhart all the way up"), retreated to "more/fewer metrics: help or hurt,"
  answered "conditional on five declared primitives." Honest retreat, but the
  original question is essentially unanswered and `recursive-goodhart/` is parked.
- **Identification is the unsolved load-bearing gap.** The framework runs on
  declared primitives (κ, h, weights, stakes) and can't estimate any before
  reading the score movement. Without it, the theory is a vocabulary for stating
  assumptions, not a tool for reaching conclusions — which caps the theory
  paper's impact.

## Useless / cuttable

- `.codex-runs/` raw LLM run logs checked into git — noise; gitignore.
- Manuscript Part 2 strawman-killing prose and the "Genealogy" section
  (citation-padding; a footnote suffices).
- Most of `plans/archived/` and `plans/could-do/` — fine as history, but it is
  the bulk of the file count and none of it is load-bearing.

## Suggested priority

1. Ship the citation-gap paper (gap confirmed; finish corpus freeze, line-verify
   the largest reference lists). Note the "first to bridge contract
   theory→formal Goodhart" framing is dead (Wang–Huang/Haupt 2026) — lead with
   the *quantified audit* + dictionary instead.
2. Recast the theory manuscript as synthesis + contract; cut ~2k words; add one
   satisfiable worked example; demote T6 to an appendix.
3. Garbage-collect bookkeeping into one current-state file; gitignore
   `.codex-runs/`.
4. Decide honestly whether recursive Goodhart returns or the answerable project
   is the gap paper + the contract.

## Open verification debt from this review

- The gap paper's "zero contract-theory cites" headline is API-checkable and is
  where the project's value concentrates; treat it as the thing to keep
  line-verified as the corpus grows (status: confirmed 2026-06-28; keep it so).

## Codex addendum — 2026-06-30

Independent whole-repo read after the above pass. I agree with the central
verdict: the project is strongest as synthesis, translation, and claim-licensing,
not as novel theorem work. Distinct findings not already covered above:

- **Public-facing state is stale in small but credibility-relevant ways.**
  `README.md` still says the gap was checked across "7 anchor papers"; the
  current audit files say 25 minable papers plus reverse sweep. Fix this before
  anyone external reads the repo. The same README should say plainly that Paper 1
  is not content-stable until the prior-art / novelty-refactor program lands.
- **The falsifiability section needs careful handling.** The book correctly says
  the proved theorems cannot be empirically violated while their hypotheses hold;
  failures would mean the audited contract did not track the real mechanism. A
  skeptical reader can read that as "the framework cannot lose." The best repair
  is not more caveat prose; it is one positive worked audit where predeclared
  primitives make a signed prediction, plus a failure condition that would
  actually reject the contract.
- **The response-modeling contract is genuinely citation-worthy.** The strongest
  reusable claim is: score movement underidentifies both channel and harm, so a
  Goodhart claim must declare type representation, response kernel or selection
  weights, action/search geometry, aggregation, hidden value/harm, evidence
  standard, and falsifier before importing any bound. That is more original and
  useful than the theorem labels.
- **The open questions are unusually well-shaped.** `research/open_questions.md`
  now tracks missing primitive + cheapest verification layer + failure condition.
  Keep that pattern. It is one of the repo's real process strengths and prevents
  parked conjectures from masquerading as active results.
- **The gap-paper audit should preserve raw auditability, not only summaries.**
  The coded table is strong, but "zero citations across N papers" needs
  reproducible artifacts: exact corpus freeze, reference-list source per paper,
  grep strings / API queries where possible, and explicit handling of partial
  reference lists. The current caveats are honest; close them before drafting.
- **Divergence thresholds are the best future theory direction, but not yet
  publishable.** The tail-comparison idea is a promising successor because it
  targets severity after activation rather than yet another activation condition.
  It is still conjecture-stage and should stay separate from Paper 1 until it has
  a clean toy boundary or a literature embedding.
- **Generated and historical clutter should be separated from research authority.**
  `.DS_Store`, `scripts/__pycache__/`, and generated artifacts are pure cleanup.
  `draft.md`, `misc_convo_logs.md`, and old plans are useful history but should
  not compete with `project_state_after_iteration43.md`, `core-math.md`, and the
  current plans as sources of truth.

Most build-worthy artifacts, in order: citation-gap paper; Paper 1 as
synthesis + contract + exchange-rate diagnostic; primitive-identification
examples; divergence-threshold follow-up. Least build-worthy right now:
recursive-Goodhart revival, generic minimum-complexity attractor, and broad
policy guidance.
