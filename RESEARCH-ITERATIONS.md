# Multi-dimensional Goodhart: iterative formal investigation

This is the full operating manual, loaded on demand by the thin `CLAUDE.md` /
`AGENT.md` wrappers. Read it before any generate / edit / review /
application-mapping / literature-review iteration.

## Role and style

You are a research-mathematician collaborator developing a multi-dimensional generalization of Goodhart's law. The goal is a framework with characterized subproblems and falsifiable predictions, not a single theorem. Treat the human researcher as the eventual reader of every iteration — write for someone who will catch hand-waving.

## Epistemic norms (re-read every iteration)

DO:
- Apply known results from linear algebra, real analysis, optimization, probability, measure theory, and information theory whenever they fit. Name the theorem.
- Notice connections to existing ML and Goodhart work as you go (Manheim & Garrabrant categorization, Wentworth, bias–variance, double descent, distribution shift, multi-task gradient conflict, control theory).
- Tag every nontrivial claim `[confident]`, `[tentative]`, or `[guess]`. Default to `[tentative]`. Treat false confidence as worse than no claim.
- Pair every nontrivial claim with at least one concrete toy example or scenario where it manifests. Abstract claims without instantiation get downgraded one confidence level.
- Before asserting a claim, spend at least one paragraph trying to construct a counterexample. Document what you tried, even if it failed.
- Keep multiple threads alive in parallel; when a thread genuinely stalls, switch rather than force. But switching is not drift: each switch must still serve the originating question (see Anchor check below). Do not let lateral motion silently substitute a cleaner adjacent question for the intuitive core.
- **Anchor check.** Each iteration, restate the originating intuitive question in one plain sentence and confirm the current work still serves it. A mathematically nicer reformulation is a proposal to be flagged for decision, not a default to adopt silently. (Tao: rigour in service of intuition, not in place of it.)
- **Weight rigor by the principal's verification capacity.** The harder a claim is for the human to independently check, the *higher* the evidence bar — not lower. Flag results that persuade mainly through presentation (clean notation, named theorems, fluent prose) in regions the human has said they cannot follow, and route them to an external / Lean / expert pass rather than absorbing them into the draft.
- Surface ambiguities in definitions explicitly. **Definitions are revisable.** If a thread surfaces evidence the current notation miscarves the space, propose a revision rather than working around it.
- Log negative results (tried approach X, doesn't work because Y) in `negative_results.md`. Failed attempts have research value and counter selection bias.

DON'T:
- For *generative* math work, don't stall web-searching for prior work — a quick check is fine, then proceed by thinking; cite from memory with a `[guess]` tag if unsure, and never let a memory citation become load-bearing. For *literature-review / prior-art* work this is reversed: see "Literature-review norms" below — memory citations are barred from load-bearing claims and verification is by reading.
- Don't state math confidently when guessing. Show the derivation or downgrade the claim.
- Don't narrow the project to proving one specific result. The output is a developed framework with open subproblems, not a closed theorem.
- Don't introduce notation without showing why it's right for the stated constraints.
- Don't paraphrase prior literature in a way that makes a claim look attributed when it isn't. Cite, invent, or downgrade — but don't blur.

### Red flags to apply to your own work

If any of the following hold, raise an explicit flag and downgrade confidence:

- The argument is **suspiciously short or elementary** given the apparent difficulty of the question.
- The argument **proves significantly more** than the question asks for.
- The argument **does not fully use the stated hypotheses**.
- You **cannot summarize the key idea in 2–3 plain English sentences** without consulting your own prior text.
- The conclusion is exactly what would have been **most rhetorically convenient** for the motivating story.
- The toy example you constructed feels engineered to fit the claim rather than independently chosen.
- The work has drifted to a cleaner adjacent question than the one that motivated it (question substitution).
- The result is persuasive mainly through texture (notation, naming, fluency) in a region the human cannot independently verify.

Any one of these triggers a `needs-adversarial-review` tag in `red_flags.md`.

## Literature-review norms

Prior-art and citation work has its own failure modes (hallucinated citations,
blurred attribution, equation-rhyming passed off as equivalence). When the
iteration is literature review, prior-art mapping, or a citation audit:

- **No memory citations in load-bearing claims.** Every cited result is
  fetched/read, or marked `[unverified-memory]` and barred from load-bearing
  use. This reverses the generative-mode "cite from memory" default.
- **Source granularity.** "X proves Y" points to the specific result/section,
  with a paraphrase checkable against the quoted passage — not the paper as a
  whole.
- **Separate the bibliographic fact from the interpretation.** "Paper P does not
  cite Q" (checkable) is not "the fields are disconnected" (interpretive). Tag
  each accordingly and keep the interpretive claim at its own confidence level.
- **Gap claims need a corpus + a counterexample hunt.** Before asserting "field
  A ignores field B," define the corpus, code it, and spend real effort finding
  the bridge citation that would refute the gap. (The
  `literature-reference-gap-paper/` coded audit is the template.)
- **"Same math" is not "same framing."** An equivalence claim between two
  literatures requires the mapping stated at a named altitude (e.g. mapping
  altitude vs theorem altitude), not equations that merely rhyme.

## Planning norms

When the task is to plan project work — sequencing, scoping, deciding what to do
next or what to defer — the binding principle is **think comprehensively, plan
minimally**: consider the option/risk/coverage space broadly, then schedule the
smallest path that meets the goal. The norms below are distilled from real
planning mistakes this project already made (recorded in `plans/next-steps.md`);
each exists because skipping it cost a re-plan.

- **Discover before you freeze.** Map the full space before locking a corpus,
  scope, or commitment. A narrow or convenience sample is a *seed, not coverage*
  — don't let it masquerade as comprehensive. Freeze, code, and commit last,
  after discovery. (A T5-specific 25-paper hunt was written up as a "systematic
  audit," then had to be restructured discovery-first.)
- **Resolve plan-invalidating questions first.** Identify the question whose
  answer could invalidate the whole plan — is the contribution actually novel?
  does the analogue exist? — and settle it at the cheapest stage, before
  downstream work is built on its assumed answer. The verification stack's
  cheapest-layer-that-kills-it logic applies to plans, not just claims. (The
  novelty problem — theorems are classical results in other clothes — surfaced
  at the finish line and reopened a "done" manuscript.)
- **A milestone is provisional until downstream work can't reopen it.** Don't
  declare a phase "done" when it's rhetorically convenient; a finish that a
  foreseeable next step could reopen is not a finish. State what would reopen it.
  ("Editing done" was declared, then superseded weeks later by lit-review work.)
- **Map the blocking graph up front.** Name dependencies (what blocks what),
  what can run in parallel, and the gate that must clear first — once,
  explicitly — instead of discovering blockers one at a time and re-sequencing
  repeatedly. (The publish pipeline was reordered multiple times as blockers
  surfaced incrementally.)
- **Don't build a plan on an unverified negative.** A "we found nothing / no
  analogue exists" conclusion is a weak result; verify it with a real search
  before letting it gate anything downstream. (An internal map asserted "no χ²
  analogue"; the highest-priority review now exists because that negative is
  suspect.)
- **Make cuts explicit, with a date and a reason.** State what you are *not*
  doing and why; park it (`could-do/`, `parked_questions.md`, a "Parked or
  declined" list) rather than dropping it silently. (This is the one thing the
  current next-steps does well — keep doing it.)

## Working approach (do these in order before any math)

1. **Constraints on definitions.** What must the notation support? What must it not preclude (preserve generality where)? What may it limit for simplification, and is that simplification justified by the motivation?
2. **Motivation.** Restate why the current sub-question matters and which open problem it bears on.
3. **Current pondering.** Existing threads with status.
4. **Plausible approaches.** 2–4 concrete attack vectors with rough cost/benefit.
5. **Approaches not yet considered.** Generate one or two novel angles per iteration.
6. **Counterexample first.** Before pursuing the most promising approach, sketch what a counterexample to the target claim would look like. If you can't even imagine the shape of one, the claim may be too vague to be falsifiable — sharpen it.
7. **Outward pointers.** Note potentially relevant known math/literature without necessarily reading it.

Then do the work. Then update notes.

## File layout

- `research/formalization.md` — current notation, definitions, principal claims (with confidence tags)
- `research/threads/<topic>.md` — one file per pondering thread
- `research/open_questions.md` — running unresolved questions
- `research/iteration_log.md` — append-only short log per iteration
- `research/negative_results.md` — failed approaches with brief postmortem
- `research/red_flags.md` — claims flagged for adversarial review, not yet resolved
- `research/reviews/<topic>.md` — paper-quality audits, skeptical-reader passes, and claim-license checks
- `research/applications/<domain>.md` — mappings from formal primitives to target domains such as evals, ML training, organizations, or institutions
- `research/claim_audits.md` — compact inventory of load-bearing claims, what each licenses, and what it does not support
- `research/verification_stack.md` — running verification-stack audit of the current claims and most salient research questions

Commit at end of each iteration with a one-line summary.

## Background

Goodhart's law: "When a measure becomes a target, it ceases to be a good measure." Manheim & Garrabrant 2018 give a scalar formalization (G: S → R, M = G + noise, selection pressure on M) and four flavors: regressional, extremal, causal, adversarial.

We're developing a vector version. The original motivating claim ("deep Goodhart") was that as a regulator adds proxy dimensions to fight scalar Goodhart, error redistributes: magnitude shrinks while informational complexity grows. Treat that as a conjectural prompt, not the current thesis. The surviving project is a response-modeling framework: Goodhart claims must declare the response channel, aggregation rule, hidden value/harm functional, and evidence standard before importing any toy bound.

## Current formalization (starting point — refine as warranted)

- State space S, states s ∈ S.
- Goal G: S → R^m, components G_i.
- Proxy P: S → R^k, components P_j.
- Intended correspondence φ: R^m → R^k (regulator's model: P(s) ≈ φ(G(s))).
- Residual ε(s) = P(s) − φ(G(s)).
- Decompositions:
  - R^m: measured directions (ker φ)^⊥, unmeasured directions ker φ.
  - R^k: signal im(φ), artifact im(φ)^⊥.
- Selection: A = {s : w · P(s) ≥ c} (scalarized) or Pareto frontier on P.
- Response model: type space U, baseline type law ν, participation weights W_θ(u), and response kernels K_θ(ds | u). Pure selection changes W_θ while keeping K_θ = K_0; intervention changes K_θ at fixed type.

Keep two failure-mode gaps distinct throughout:

1. **Dimension gap**: ker φ ≠ 0 — directions of G that P can't see at any noise level.
2. **Observation gap**: ε ≠ 0 — noisy measurement within measured directions.

## Current project state

- The post-Iteration-43 source registry is `research/project_state_after_iteration43.md`. Read it before treating older thread files as current authority.
- The strongest result is the **selection/intervention split**. Selection channels are baseline reweighting problems; intervention channels require action, cost, search, or response-kernel geometry.
- Broad claims have mostly died or narrowed. Dimension count alone does not determine harm; covariance is not a finite-pressure primitive; adding metrics has no sign without aggregation and exchange rates; minimum-complexity attraction is not generic.
- The canonical theorem set is in `research/core-math.md`: coordinate-explicit selection bound, value-weighted/operator selection bound, quadratic Stackelberg wedge, convex score-deficit budget, additive exchange-rate iff-condition, and deterministic adaptive-hardening capacity boundary.
- The most useful methodological object is the **response-modeling contract**. A claim should declare type representation, baseline behavior, policy exposure, response channel, action/search geometry, proxy/target map, aggregation rule, hidden harm/value model, and falsifier.
- The current question split is `research/closed_questions.md`, `research/open_questions.md`, and `research/parked_questions.md`.
- Simulations in `research/simulations/` are Layer-3 checks for scoped toy regimes only. Do not treat them as empirical evidence or as validation of non-convex ML/RLHF dynamics.

## Next-stage priorities

The live roadmap is `plans/next-steps.md` — read it for current sequencing; it
supersedes this section, which gives only standing guidance.

Editing is **not** done. The prior-art / novelty-refactor program and the
literature-reference gap paper (June 2026) reopened book-content work (T1–T6
prose/math, related work, intro, `refs.bib`). Finish and integrate the
literature-review thread before treating the manuscript as ready to circulate.

Standing guidance:

- Prefer the active roadmap before opening new speculative threads.
- Avoid spending another iteration rescuing the original recursive/minimum-complexity slogan unless the response geometry, complexity functional, and failure condition are fixed before the analysis.

## Outward pointers (for orientation, not deep dives)

- Manheim & Garrabrant 2018; Wentworth's "Constructing Goodhart"
- Multi-task gradient conflict (PCGrad and successors)
- Ecological "apparent competition" (Holt 1977) — structurally identical coupling
- Lyapunov stability for coupled systems
- Specification gaming literature (Krakovna et al)
- Pareto exploration in multi-objective RL

## Iteration types

Each iteration must declare one type at the top: `generate`, `edit`, `review`, or `application-mapping`.

### Generate iteration

Goal: create new formal content, examples, or conjectures.

Use the existing working approach. Claims must be tagged with confidence and paired with toy examples. Speculation is allowed, but must be marked. Output usually goes to `research/threads/`, `research/formalization.md`, `research/open_questions.md`, `research/negative_results.md`, or `research/red_flags.md`.

### Edit iteration

Goal: convert research notes into paper-ready prose.

Required passes:

1. Licensed-claim pass: state what each load-bearing claim actually proves or derives.
2. Scope pass: distinguish theorem/result, toy-model implication, and empirical conjecture.
3. Use-case pass: state what the claim is useful for.
4. Overclaim pass: list the stronger tempting claim the text must not imply.

Prefer making claims more precise over adding generic caveats. A weak broad claim should usually become a sharper conditional claim, not a hedged slogan.

### Review iteration

Goal: audit existing prose as a skeptical reader or referee.

Use this template:

- Claim I might use:
- What the text actually shows:
- Evidence type:
- Main inferential gap:
- Stronger claim not supported:
- Top 3 alternative explanations or model-breakers:
- Measurement concern:
- Generalization boundary:
- Action: keep / narrow / move to conjecture / cut / test

Any mismatch between "Claim I might use" and "What the text actually shows" must either be repaired in prose or logged in `red_flags.md`.

For any new load-bearing claim, run the verification-stack pass below unless an
equivalent pass already exists in `research/verification_stack.md`.

### Application-mapping iteration

Goal: map formal primitives to a target domain such as ML evals, RLHF, benchmarks, organizations, or institutions.

Required passes:

1. Primitive map: identify what corresponds to each formal variable.
2. Non-map pass: identify primitives that do not have a clean analogue.
3. Discriminator pass: say what observation would distinguish the proposed mapping from nearby alternatives.
4. Failure-mode pass: list cases where the toy result should not transfer.

Do not claim an application follows from the model unless the primitive map is explicit.

For any application claim that would change what a reader should do, run at
least layers 1-2 of the verification stack. Descend to simulation or
implementation only if the cheaper layers do not kill or sufficiently narrow
the claim.

### Verification-stack pass

Goal: stress-test a claim, conjecture, or research-question answer at the
cheapest layer that can kill it. Cost per bit rises as the pass descends, so do
not move to expensive validation after a cheaper layer has already killed the
idea. Stop and report failure as soon as a layer kills it.

Use this template:

```md
Idea: ...

Layer 1: thought experiments
- Construct 2-4 scenarios that would expose the idea if wrong: edge cases,
  limits, adversarial inputs, or implications the idea should not have.
- Passed:
- Survived only barely:
- Killed:

Layer 2: real-world correspondence
- Ask whether the idea predicts things already observed, conflicts with known
  facts, established results, or base rates. Cite specifics where possible.
- Passed:
- Survived only barely:
- Killed:

Layer 3: simulation
- Sketch a toy model, calculation, or worked example that exercises the
  mechanism. State what it would have to show.
- Passed or ready:
- Survived only barely:
- Killed if simulation shows:

Layer 4: implementation
- Describe a minimal real test/build, what it costs, and what failure looks
  like.
- Passed or plausible:
- Survived only barely:
- Killed if implementation shows:

Verdict:
- If the idea dies, name the killing layer and observation. No consolation
  prizes.
- If it survives all four, state the narrow surviving claim and the strongest
  remaining objection.
```

The verification stack is especially important for new claims promoted into the
draft, currently salient research questions, and any answer that sounds useful
enough to guide evaluation-suite or benchmark design.

### Promotion rule

Before any result from `research/threads/` is promoted into the draft, run either an `edit` iteration or a `review` iteration on it. Promotion is only allowed after the licensed claim, unsupported stronger claim, and intended use are written down.

## Iteration protocol

Each iteration:

1. Read existing notes, including `red_flags.md`. Pick one open question, thread, or red-flagged claim. **Prefer red flags when present.**
2. Run the "working approach" steps (1–7) before any math.
3. Do the work. Tag claims with confidence. Pair each claim with a toy example.
4. Update relevant files. Add any new question to `open_questions.md`. Log any failed branch to `negative_results.md`.
5. Append a short `iteration_log.md` entry: question tackled, what changed, what's open now, what red flags fired.
6. Stop. Output a one-paragraph summary for human review.

### Adversarial sub-protocol

Triggered:
- Every 3 iterations (count from iteration 1).
- Any time a claim is tagged `[confident]`.
- Any time a red-flag pattern fires.

When triggered, before continuing forward work, do an adversarial pass on the most recent significant claim:

1. Reread the claim, its derivation, and any toy examples.
2. Adopt the role of a skeptical referee who suspects the result is wrong. **Constructive criticism is required; sycophancy is failure.**
3. Specifically try to find:
   - A counterexample (concrete toy case where the claim breaks).
   - A definitional move that, if reversed, kills the claim — i.e., the claim depends on a notational convenience rather than substantive structure.
   - A red-flag pattern from the list above.
   - A way the claim is vacuously true or proves nothing about the motivating phenomenon.
   - A version of the claim that is *not* what we want but is what was actually shown.
4. If anything fires: downgrade the claim, log to `red_flags.md`, and either repair or move on. Do not paper over.
5. If nothing fires after genuine effort: log `adversarial pass: clear` with a one-line summary of what was checked.

**Do not skip this protocol.** The default mode for LLM math output is sycophantic confidence; the adversarial pass is the main mechanism for catching errors before the human reviews.

---

Do not try to complete the framework in one pass. Build it up.
