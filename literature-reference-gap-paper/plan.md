# Gap paper: the AI-safety Goodhart literature does not cite its own prior art

Status: proposed, 2026-06-24. A short **standalone** paper whose contribution is
bibliographic + synthesis, not new theorems. Spun out of the part-2 finding in
the June 24 lit-review session: the canonical AI-safety formalizations of
Goodhart's law cite essentially none of the economics / management-science /
accounting literature that contains the same formal mathematics.

## Decision record

- **Positioning: standalone, seeds Paper 1.** Publishes first and independently;
  its synthesis later becomes Paper 1's reframed related-work
  (`plans/novelty-refactor.md`). Clean division of labor:
  - **Gap paper** = the bibliometric claim + the cross-field dictionary at
    *mapping* altitude + "what AI safety can learn." Depends only on
    bibliographic facts and high-level math correspondences — **not** on the
    still-pending T1/T2, T4, lower-tier theorem verdicts.
  - **Paper 1** = the formal theorems (T1–T6) restated in their native forms,
    the response-modeling contract, the subset-invariance reading.
- **Gap evidence: systematic coded audit.** A defined corpus, each bibliography
  coded for cross-field citations, reproducible table. Turns "they don't cite it"
  from anecdote into a citable bibliometric result. (The 7-paper exemplar audit
  from the June 24 session — El-Mhamdi 2024, Majka 2025, Skalse 2022, Skalse/
  Karwowski 2023, Manheim–Garrabrant 2018, Gao 2023, Pan 2022 — is the seed
  corpus and pilot for the coding scheme, not the final N.)

## Thesis

Goodhart's law has been **independently formalized twice** — once in AI safety /
ML (El-Mhamdi, Skalse, Manheim–Garrabrant, Gao, Pan, Majka) and decades earlier
in economics / accounting / public finance (multitask principal-agent congruity,
incentive distortion, second best, sufficient statistics, corrective-policy
"Goodhart"). The two literatures describe the *same underlying mathematics* and
**do not cite each other**. The AI side reaches the older tradition only through
a 1–3 item folklore stub (Goodhart 1975, sometimes Campbell / Strathern / Lucas)
and never through the formal microeconomics that contains the matching results.
The single document that bridges both — John et al. 2023, "Proxy failure …,"
*Behavioral and Brain Sciences* — sits in a neuroscience venue outside ML's
reading path and was written partly to *flag* this rediscovery, corroborating the
gap rather than closing it inside AI safety.

The paper's job: (1) **document** the gap rigorously, (2) **ground and combine**
the math so the correspondence is undeniable, (3) state **what AI-safety Goodhart
science gains** by importing the economics — concrete transferable results, not
just etiquette.

## What is already established (do not re-litigate)

- The condition `h = c·w` (T5 invariance) is verbatim **perfect congruity**
  (Feltham–Xie 1994) / **zero distortion** (Baker 1992/2002, distortion
  `= 1 − cosθ`); the harm formula + invariance package is closest to the
  public-finance sufficient-statistic lineage (Chetty 2009 / Feldstein 1999);
  set-monotonicity is Datar–Kulp–Lambert 2001; Reynaert–Sallee 2016 is the named
  non-AI "Goodhart's law for externalities" sibling. (See
  `research/threads/lit_review/looking-for-exchange-rate-results/README.md` and
  the `t5-prior-art-congruity` memory.)
- Verified citation audit (June 24 session): across the 7 anchor papers, the
  contract-theory / public-finance / second-best / corrective-tax / estimation-
  theory tiers are cited **zero** times. Sharpest case: Majka 2025 names
  "incomplete contracting" in prose and cites only the downstream ML paper.
- Name-collision traps to encode in the audit coding rules: Pan 2022's "Baker
  et al. 2020" is **Bowen Baker / OpenAI**, not George Baker the economist; the
  BBS 2023 article's "Chetty" and "Lipsey" are **different authors**, not Raj
  Chetty / R.G. Lipsey.

## Work items

### G1. Systematic citation audit (the empirical spine)

**Operationalized** as a **discovery-first** ten-task sequence in `audit-tasks/`
(see `audit-tasks/README.md`). The first 25-paper pass (`citation-audit/audit.md`,
`findings.md`) is a **seed, not a corpus** — it came from narrow, T5-specific
hunts. So the sequence first does comprehensive, multi-LLM, look-outside-ML
discovery of both sides (AI corpus + cross-field prior art) and maps the bridges,
and only *then* freezes the corpus, codes, double-verifies, verifies econ/formal
primary sources, evidences the "why," and synthesizes. The bullets below are the
design rationale; freezing is deliberately deferred until discovery saturates.

- **Define the corpus.** Target ~25–40 papers: the formal AI-safety Goodhart /
  reward-hacking / reward-overoptimization / specification-gaming literature
  2016–2025. Inclusion rule (write it down for reproducibility): peer-reviewed or
  arXiv papers that (a) state or formalize a proxy-vs-true-objective divergence
  result, or (b) survey same. Seed set = the 7 already audited; expand via forward
  citations of Amodei et al. 2016, Manheim–Garrabrant 2018, Skalse 2022, and the
  "reward hacking / overoptimization" survey cluster.
- **Coding scheme.** For each paper, code its bibliography for presence/absence of
  each prior-art tier: {multitask P-A / congruity}, {public finance / sufficient
  statistic}, {welfare / second best}, {corrective-tax Goodhart}, {management
  measurement: Ridgway/Kerr/Campbell/Strathern}, {estimation theory / DRO},
  {economics genealogy: Lucas}, {Goodhart 1975 eponym only}. Record verbatim the
  reference string for any hit. Apply the name-collision rules above.
- **Reproducible artifact.** A coded table (CSV + rendered) under
  `literature-reference-gap-paper/citation-audit/`, plus a short methods note
  (corpus definition, coding rules, who-coded, inter-rater check if feasible).
- **Reverse / bridge sweep.** Forward-citation check (Semantic Scholar / OpenAlex
  API) on Reynaert–Sallee 2016, Feltham–Xie 1994, Baker 2002 — does *any*
  AI-alignment paper cite them? The June-24 spot check found none but explicitly
  did not run a citation-index census; this closes that gap. Profile John et al.
  2023 BBS as the one true bridge and characterize what it cites from each side.

### G2. Ground and combine the math (mapping altitude, not theorem altitude)

- One compact correspondence table: each AI-safety Goodhart object ↔ its
  economics/stats home ↔ the shared elementary core. Rows already supportable:
  T5/exchange-rate ↔ congruity / distortion / sufficient statistic; selection
  bound ↔ Chapman–Robbins / χ²-DRO (state as *correspondence claimed in the
  companion paper*, not proved here); Skalse unhackability ↔ congruity's
  "safe iff proportional" condition; Reynaert–Sallee either-direction gaming ↔
  set-monotonicity.
- **Anchor the unifying picture in the cost-normalized projection form** (`x_j =
  a_j/√κ_j`, harm `= d·(β·b)/|b|²` = through-origin OLS slope), which is the
  shortest object that exposes the congruity link — but keep proofs in Paper 1
  and cite forward. The gap paper *shows the bridge*; Paper 1 *carries the load*.
- **The interpretive inversion is a first-class point here, not a footnote:** in
  contract theory `h∝w` is first-best (good); with hidden *harm* it is the
  invariance case where harm-per-score is a constant that can be uniformly high.
  Same algebra, opposite meaning. This is part of "what AI safety can learn":
  importing the math without the sign flip would mislead.

### G3. "What AI-safety Goodhart science can learn" (the payoff section, a few pages)

Concrete imports, each tied to a named economics result — not vibes:
- **Congruity / distortion** gives an exact "safe iff proportional alignment"
  condition and a continuous `1 − cosθ` distortion measure for multidimensional
  proxies — a sharper object than the AI side's qualitative "tails come apart."
- **Multitask agency (Holmström–Milgrom 1991)** predicts that high-powered
  incentives on measured dimensions *distort* effort away from unmeasured ones —
  the direct economic statement of reward-hacking-by-neglect; low-powered
  incentives can be optimal. Reframe per the novelty-refactor: it is *an*
  antecedent, not "the closest precedent."
- **Second best (Lipsey–Lancaster 1956)** warns that fixing one proxy dimension
  while others stay distorted need not improve welfare — bears on "patch the
  benchmark" reasoning.
- **Sufficient statistics (Chetty 2009)** = the methodology for when a
  composition-invariant summary suffices, the economics analog of "is this proxy
  enough."
- **Corrective-policy Goodhart (Reynaert–Sallee 2016)** is a worked,
  empirically-grounded either-direction gaming result the AI field could cite
  directly instead of re-deriving.
- Net message: the economics tradition already has *sharp, signed, citable*
  versions of results the AI literature states qualitatively; cross-citation is
  not just hygiene, it transfers usable theorems.

### G4. Write, build, place

- Draft as a short paper (target ~8–12 pp): intro (two independent
  formalizations) → the coded gap (G1) → the dictionary (G2) → what transfers
  (G3) → why the gap exists → conclusion.
- **Why-the-gap section** (keep it evidenced, not editorial): lineage capture /
  siloing (AI canon self-cites through Goodhart 1975 → Manheim–Garrabrant →
  Krakovna/Skalse/Gao); vocabulary divergence ("distortion," "congruity,"
  "second best" never appear in reward-hacking work, so keyword search misses
  them); genuinely-folklore math; inherited pruned base (Amodei 2016 didn't carry
  contract-theory refs forward).
- Add `refs.bib` entries for the verified-absent precedents + the BBS 2023 bridge
  (these are needed by Paper 1 anyway; do it here first).
- Venue framing: AI-safety-facing (the "what AI can learn" pitch). Candidate
  homes: an alignment workshop / TMLR / arXiv + LessWrong crosspost. Decide at
  draft completion, not now.

## Sequencing

- **Can start now.** G1 (audit) and G3 (payoff, at mapping altitude) need only
  bibliographic facts + already-verified correspondences, so this is **not**
  blocked on the T1/T2, T4, lower-tier reviews — unlike the novelty-refactor
  capstone. G2's deeper theorem grounding cites Paper 1 forward rather than
  reproducing it.
- Slots into `next-steps.md` as a parallel track to the prior-art program. It
  could reasonably circulate *before* Paper 1, as a lighter-weight first release
  that stakes the synthesis claim.

## Guardrails

- **The gap claim must be defensible against a "you just missed the citation"
  referee.** Hence the systematic coded audit with explicit inclusion rules and
  the name-collision traps documented. Every "field X cites this Y times" rests
  on the coded table, not on the LLM deep-research reconstructions.
- **Do not overclaim novelty for the synthesis itself.** John et al. 2023 already
  bridges economics + AI + biology; the gap paper's contribution over it is
  (a) the *quantified* citation audit specific to the AI-safety formal Goodhart
  corpus, (b) the math-level dictionary at the projection/congruity altitude, and
  (c) the actionable "what transfers" list. Credit BBS 2023 prominently and
  position against it honestly.
- **Verify primary sources before citing proposition numbers** (Feltham–Xie 1994,
  Baker 2002, DKL 2001, Chetty 2009 were partly paywalled in the T5 review).
- Keep consistent with `paper1-is-elementary-synthesis`: state elementariness
  proudly; the value is the translation table and the transfer, not new math.
- **Do not over-correct into "it's all trivial" either.** Keep the genuinely
  original layer credited: the response-modeling contract, the subset-invariance
  reading, and the completeness of the synthesis/dictionary itself. The pride is
  earned by the completeness of the translation table — that is the substance,
  not damage control. (Track A guardrail, applies here too.)

## What this plan deliberately does not do

- No new theorems; no restatement of T1–T6 proofs (those stay in Paper 1).
- No change to Paper 1's content or to the novelty-refactor scope — this seeds
  that work, it does not replace it.
- No venue commitment until a draft exists.
