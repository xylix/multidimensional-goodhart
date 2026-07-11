# Lower-tier parallels (L1-L4) prior-art review — synthesis

Status: closed, 2026-07-11. Bundled per-item novelty verdicts for L1
(selection/intervention non-identifiability), L2 (covariance-as-local-velocity
/ exponential tilt), L3 (T3 quadratic Stackelberg wedge), and L4 (T6
adaptive-hardening boundary), Track A, per `plans/litrev-lower-tier.md`.

Provenance: this review **consumes** the completed shared Phase 0 discovery
(`research/threads/lit_review/cross-field-discovery/prior-art-formal.md`,
Areas F, G, H, I, plus C2/D1 cross-references) and the Task 08 primary-source
verification records (`.../cross-field-discovery/prior-art-verification.md`).
No new deep-research passes were run (the plan's original protocol is
superseded by the consume-Phase-0 header). Verification tags
(`[verified-primary]`, `[verified-secondary]`, `[paywalled-flag-for-user]`)
are **inherited** from Task 08; nothing was re-verified here and no
proposition number is cited beyond what Task 08 read. For L1, L2, and L4 the
discovered homes have **no Task 08 verification at all**, so every external
anchor in those items is capped at discovery-grade `[tentative]` — stated
explicitly per item. Protocol: one pessimistic ("find the precedent") pass per
item, with the plan's optimistic check run on L1 only.

## The claims under review

From `research/core-math.md` (read-only) and the book:

- **L1** (book Part 1 "Five stories, one score path" + Part 2 "Methodological
  boundaries"; `core-math.md` definitions + global non-transfer clause 1):
  pure selection (policy enters only through `W_theta`, `K_theta = K_0`) vs
  intervention (`K_theta != K_0` on a positive-`nu` set) is **not identifiable
  from marginal score movement**, and the split is **relative to the declared
  type representation**: "enrich the types enough and every intervention looks
  like selection over richer types."
- **L2** (book Part 2 refutation + §5.1 mechanism passage;
  `research/threads/selection_response.md`): with `P = Z ~ N(0,1)` and
  `H = Z^2 - 1`, baseline covariance is zero yet threshold/Boltzmann selection
  moves `H` (`E_beta[H] = beta^2` under the tilt `exp(beta Z)`); covariance is
  only the zero-pressure derivative (`d/d beta E_beta[H] = Cov_beta(H, P)`),
  and finite-pressure drift depends on the whole tilted path.
- **L3 = T3** (`core-math.md`): one-dimensional threshold toy, quality `Q < t`,
  action `a >= 0`, cost `a^2/(2 kappa)`, stakes `V > 0`, noiseless pass
  `Q + a >= t`; gaming is privately worthwhile exactly when
  `t - Q <= sqrt(2 kappa V)`.
- **L4 = T6** (`core-math.md`): `S_t(M) = sum_j kappa_{j,t} w_j^2`,
  `T = d^2/(2V)`; gaming feasible at time `t` exactly when `S_t(M) >= T`;
  under monotone hardening, a progress-aware largest-action multiplicative
  rule terminates in finite time if channels are finite, positive-weight, and
  `S_floor(M) < T`.

## Verdict (TL;DR)

1. **L1: the non-identifiability claim is classical — it is observational
   equivalence / the selection-vs-treatment identification problem of causal
   inference,** with mixture non-identifiability as the clean mathematical
   twin. Anchor it (Heckman selection, Manski partial identification, mixture
   non-identifiability), all at discovery-grade `[tentative]` — Task 08 read
   none of these primaries. The optimistic check finds one residual: the
   **representation-relativity clause** (the enrich-the-types absorption move)
   was not found *stated* in any discovered source — an auditable negative,
   surviving as framing, not as an identification theorem. `[tentative]`
2. **L2: wholly classical.** The zero-pressure-derivative identity is the
   textbook exponential-family/cumulant fact (derivative of the tilted mean =
   covariance; `K''` of the log-partition = variance), and the Gibbs tilt /
   LDP-Legendre link ties it to the same conjugacy as T4. The book needs
   exactly the one-line nod the plan anticipated. Math `[confident]`
   (two-line differentiation, toy verified below); attribution anchors
   discovery-grade `[tentative]` (standard texts, no numbered statements
   read). Nothing survives as ours beyond the refutation's *dialectic role*.
3. **L3: the wedge is the quadratic-cost instance of costly
   threshold-crossing** — Spence-style separating logic and, nearest of all,
   the strategic-classification best response (Hardt et al. 2016, already
   flagged as nearest analogue in `formal_analogue_lit_map.md`). The constant
   `sqrt(2 kappa V)` is a one-line quadratic evaluation, not a novelty
   residual. Family anchors: Spence/Hardt `[tentative]` discovery-grade; the
   one `[verified-primary]` in-family result is **Frankel–Kartik 2019
   Prop. 2** (measure degrades when used at high stakes) — citable for the
   signaling family, *not* for the wedge formula. Keep the toy framing.
4. **L4: the static threshold is exactly T4 specialized to separable
   quadratic costs** (`[confident]`, two-line check displayed below; its
   classical home is T4's — Fenchel conjugacy / least-cost equimarginal
   allocation, owned by the T4 review and Task 02 respectively). The dynamic
   defender-commits shape has a **recognition-altitude** home in Stackelberg
   security games / moving-target defense and greedy allocation
   (`[tentative]`, discovery-grade, and *not* theorem-altitude: those results
   concern optimal defender allocation, which T6 explicitly does not claim).
   **What survives as ours is the termination argument** — elementary, and
   scoped exactly as the discovery flag predicted. `[tentative]`
5. **No escalation.** No item surfaced a near-exact precedent needing its own
   follow-up plan; all four homes were confirmed at the altitude the plan
   expected (L1/L2 framing-or-fact altitude, L3 toy altitude, L4 recognition
   altitude + internal specialization).

## L1. Selection/intervention non-identifiability

**Verdict: classical as an identification fact; anchor, don't re-derive.**
The book's "five stories, one score path" exhibit is an observational-
equivalence demonstration: distinct structural configurations (who changed,
through which channel) implying the same observed law. That *is* the
fundamental identification problem — selection vs treatment effects are not
point-identified from observed marginals without maintained assumptions
(Phase 0 F1: Heckman 1979 sample-selection; Manski partial identification /
bounds; Rubin potential outcomes; Pearl do-calculus), and the same-marginal-
many-decompositions form is mixture non-identifiability (Phase 0 F2, Teicher
1963 lineage). The book's "relative to the declared type representation" is,
at its core, Manski's point that the identified set is relative to the
maintained assumptions. `[tentative]` — all F1/F2 anchors are discovery-grade;
**Task 08 verified none of them; no proposition, theorem, or section number
from Heckman/Manski/Teicher/Rubin/Pearl may be cited without a pull.**

**Optimistic check (the one the plan mandates).** Does any genuine
identification subtlety survive beyond the classical anchor? Candidate: the
**representation-relativity clause with its constructive absorption move** —
"enrich the types enough and every intervention looks like selection over
richer types" (book Part 2, Methodological boundaries). This is stronger than
"not identifiable from the data": it says the split is not even an invariant
of the *underlying process*, only of the declared type space `(U, nu, K_0)`.
Nearest discovered statements and what each lacks:

| Nearest discovered statement | Where | What it lacks vs the book's clause |
| --- | --- | --- |
| Identified set depends on maintained assumptions | F1 (Manski, discovery-grade) | Relativity of the *estimand's meaning* to a representation choice, not just of the identified set to assumptions |
| Observational equivalence of structural configurations | F1 | Same-data equivalence; not the type-enrichment absorption construction |
| Mixture non-identifiability (same marginal, distinct mixing measures) | F2 (Teicher lineage, discovery-grade) | The mathematical twin of the *non-identifiability*, but no selection-vs-intervention reading |

**Auditable negative `[tentative]`:** no source discovered by Phase 0 states
the selection/intervention (reweighting-vs-kernel-change) split as
*representation-relative with the explicit type-enrichment absorption move*.
Limits of the negative: (i) Phase 0 Area F was saturated at discovery grade
(WebSearch-level), not an exhaustive sweep; (ii) the move rhymes with
response-type / potential-outcome representations in causal inference (types
as response functions), a memory-level association `[unverified-memory]`
barred from load-bearing use here — a reader fluent in principal-stratification
literature might well produce a close statement; (iii) the clause is a
framing observation, not a theorem — the negative licenses "state it as the
book's framing, anchored to the classical identification problem," not "novel
identification result."

**What survives as ours `[tentative]`:** (a) the response-modeling-contract
role — the split as a *declared, defended field* of a Goodhart claim
(repeated-type, exposure, action-trace, or structural evidence), which is the
contract's contribution, not identification theory's; (b) the
representation-relativity clause as packaged, per the auditable negative.
Both are framing. The capstone should present L1 as "the Goodhart-specific
instance of a known identification problem" — exactly the plan's consequence
line — and may cite Heckman/Manski/mixtures by name only until primaries are
pulled.

## L2. Covariance as local velocity / exponential tilt

**Verdict: wholly classical; add the one-line cumulant nod and stop.**
The identity behind "covariance is the zero-pressure derivative" is the
exponential-family / cumulant-generating-function fact (Phase 0 G1): for the
tilted family `d mu_beta prop exp(beta P) d mu_0` (inside the normalizability
domain), `d/d beta E_beta[H] = Cov_beta(H, P)`; equivalently `grad A = mean`,
`grad^2 A = covariance` for the log-partition `A`. Finite-pressure drift
integrates this covariance field along the path — which is precisely the
book's phrasing ("the whole tilted path, tail shape, and moment-generating
domain matter," book §5.1). The Boltzmann selection the book uses is a Gibbs
tilt, and the tilt's large-deviations rate function is the Legendre transform
of the CGF (Phase 0 G2) — the same convex-conjugate object as T4, a
dictionary link worth one sentence in the capstone. `[tentative]` on all
attribution: **no G1/G2 primary was read by Task 08**; cite standard texts
(e.g. Brown 1986; Barndorff-Nielsen 1978; Efron's exponential-families notes;
Dembo–Zeitouni for LDP) *without numbered statements* until pulled.

**Toy check (the book's own example, verified here):** tilting `N(0,1)` by
`exp(beta Z)` gives `Z_beta ~ N(beta, 1)`, so `E_beta[Z^2 - 1] = beta^2`; and
`Cov_beta(Z^2 - 1, Z) = E_beta[Z^3] - E_beta[Z^2] beta = (beta^3 + 3 beta) -
(beta^2 + 1) beta = 2 beta = d/d beta (beta^2)`, which is `0` at `beta = 0`
— zero baseline covariance, nonzero finite-pressure drift, and the derivative
identity holds along the whole path. `[confident]` as mathematics (elementary
differentiation under the integral inside the mgf domain; adversarial pass
below).

**What survives as ours:** only the *dialectic role* — using the standard
fact to refute "baseline covariance predicts response under pressure" as a
candidate Goodhart primitive (book Part 2). That is the book's argumentative
move, not mathematics, and the book already presents it as a refutation
rather than a result. No residual novelty; no auditable negative needed
(nothing is claimed unstated).

## L3. T3 quadratic Stackelberg wedge = costly threshold-crossing

**Verdict: the wedge is the quadratic-cost instance of a standard
threshold-crossing best response; confirm the antecedent, cite, keep the toy
framing.** The derivation is one line: for `Q < t` the cheapest passing
action is `a = t - Q` (any more is wasted cost), so gaming is worthwhile iff
`V >= (t - Q)^2 / (2 kappa)`, i.e. `t - Q <= sqrt(2 kappa V)`. `[confident]`
as internal math (displayed just now). The *shape* — agent crosses a
decision threshold iff the benefit exceeds the crossing cost under a declared
cost model — is:

- **Spence 1973 costly-signaling threshold logic** (Phase 0 H1): the
  separating equilibrium's threshold signal is worth crossing only for types
  whose crossing cost is low enough (single-crossing). Discovery-grade
  `[tentative]`; no primary read by Task 08.
- **Strategic classification** (Phase 0 H2; Hardt, Megiddo, Papadimitriou,
  Wootters 2016, arXiv:1506.06980): classifier-first/agents-respond
  Stackelberg structure with costly feature change; the best response is
  "manipulate iff the cost of reaching the boundary is at most the gain."
  Already flagged as the closest formal analogue to the book's Stackelberg
  toy in `research/reviews/formal_analogue_lit_map.md` (row `[tentative]`,
  carried from Codex), whose discriminator pass already records the right
  scoping: the `sqrt(2 kappa V)` formula is quadratic-cost-specific and must
  change under other cost classes. Discovery-grade `[tentative]` for any
  specific statement; no theorem number citable.
- **Contest / all-pay auction theory** (Phase 0 H2: Baye–Kovenock–de Vries;
  Konrad) as the econ home of costly effort to cross a threshold —
  recognition anchor only. `[tentative]`, discovery-grade.
- **The one `[verified-primary]` in-family result (inherited from Task 08
  A10): Frankel–Kartik 2019, "Muddled Information," Proposition 2 (parts 2
  and 3)** — at high stakes no fully informative equilibrium exists /
  equilibria become approximately uninformative about the dimension of
  interest. This is the modern signaling-family formalization of
  "measure degrades when used." Cite it for the *family claim* (signaling
  under stakes degrades informativeness); do **not** cite it for the wedge
  formula — it contains no `sqrt(2 kappa V)`-type feasibility constant.

**What survives as ours:** nothing mathematical. T3 is explicitly a toy
"signature" of the intervention channel (its non-license already disclaims
universality); the book's own layer is the *contract placement* — the wedge
as the declared activation condition whose every ingredient (action, cost,
stakes, pass condition) must be declared before transfer. The specific
constant `sqrt(2 kappa V)` was not found displayed in a discovered source,
but it is a one-line evaluation and licenses no novelty claim — recorded for
completeness, not as a residual.

## L4. T6 adaptive-hardening boundary = static T4 + greedy capacity reduction

**Verdict: static part is exactly T4 specialized; dynamic part has a
recognition-altitude home in security games/MTD; the termination argument is
the surviving original-but-small piece.**

**Static = T4, displayed `[confident]`:** at fixed `t`, minimize
`sum_j a_j^2/(2 kappa_{j,t})` subject to `sum_j w_j a_j >= d`. Lagrange
stationarity gives `a_j = lambda kappa_{j,t} w_j` (the equimarginal load,
same as T5's), the constraint gives `lambda = d / S_t(M)`, so
`m_t(d) = d^2 / (2 S_t(M))`; T4's feasibility criterion `m_t(d) <= V` is then
literally `S_t(M) >= d^2/(2V) = T`, boundary case included (`m = V` iff
`S_t = T`). Channels with `kappa_{j,t} = 0` are absorbed by the
infinite-cost convention and drop out of `S_t`. So T6's threshold statement
is a *corollary restatement of T4* under time-indexed quadratic costs — the
book should say so plainly (it already lists "T4 quadratic specialization"
as a dependency). The classical anchors for this static quantity are T4's
own (Fenchel conjugacy, Phase 0 C1/C2 — the T4 review's lane) and least-cost
equimarginal allocation (Phase 0 D1, Montgomery 1972 — **Task 02's claim,
cross-referenced only, per the no-double-claim rule**).

**Dynamic shape `[tentative]`, discovery-grade:** defender commits to a
capacity profile, attacker best-responds, defender reduces capacity over
time — the Stackelberg security-game frame (Phase 0 I1: Tambe 2011;
Kiekintveld et al. 2009; Korzhyk–Conitzer–Parr 2010; Sinha et al. 2018) with
a moving-target-defense flavor (Phase 0 I2), and greedy allocation results
exist in the non-contagious security-game setting. Two altitude caveats,
stated so the capstone does not over-anchor: (i) **no I1/I2 primary was read
by Task 08** — names only, no numbered results; (ii) the discovered
greedy-optimality results concern *optimal defender allocation*, whereas
T6's non-license explicitly disclaims policy optimality — so the match is at
recognition altitude ("this problem family lives in security games"), not
theorem altitude ("this theorem is proved there"). Citing it as more would
violate the "same math is not same framing" norm in reverse.

**What survives as ours `[tentative]`:** the **termination argument** — the
progress-aware largest-action multiplicative rule reaches `S_t(M) < T` in
finite time under the floor condition `S_floor(M) < T` with finitely many
positive-weight channels. This is exactly where the Phase 0 cross-reference
table scoped L4's residual ("novelty scoped to termination"). Two honest
qualifications: it is an elementary finite-termination lemma
(multiplicative decrease against a fixed threshold above the floor), and
Phase 0's Area I was discovery-grade — a matching lemma inside the MTD /
scheduling literature would not be surprising. **Auditable negative:** no
discovered source states a termination guarantee for progress-aware
multiplicative capacity reduction against a best-responding gamer's
feasibility threshold; benchmark that would erase it: a termination or
convergence lemma of this shape in the MTD game-theory literature (e.g. the
Markov-Stackelberg MTD line, arXiv:2002.10390) or a security-games survey
(Sinha et al. 2018) — check before any stronger claim. Credit the argument
as the book's own small construction, presented as elementary.

## Closest prior art (consolidated)

| Book item | Closest prior art | Status of match | Verification status |
| --- | --- | --- | --- |
| L1 non-identifiability | Observational equivalence / selection-vs-treatment identification (Heckman 1979; Manski partial identification; Rubin; Pearl) | same identification problem, Goodhart instance | `[tentative]` discovery-grade (Phase 0 F1; no Task 08 read) |
| L1 same-marginal decompositions | Mixture non-identifiability (Teicher 1963 lineage) | clean mathematical twin | `[tentative]` discovery-grade (Phase 0 F2) |
| L1 representation-relativity clause | — none found stated — | framing residual (rhymes with response-type representations, `[unverified-memory]`) | auditable negative above, `[tentative]` |
| L2 zero-pressure derivative | Exp-family CGF: derivative of tilted mean = covariance (Brown; Barndorff-Nielsen; Efron) | verbatim standard fact | `[tentative]` discovery-grade citation (Phase 0 G1); math `[confident]` (two-line check) |
| L2 Boltzmann tilt / path | Gibbs tilt; LDP rate = Legendre conjugate of CGF (Varadhan; Dembo–Zeitouni); importance sampling (Siegmund) | same object; links L2 to T4's conjugacy | `[tentative]` discovery-grade (Phase 0 G2) |
| L3 wedge shape | Spence 1973 costly threshold-crossing; contest/all-pay (Baye–Kovenock–de Vries; Konrad) | same crossing logic, econ home | `[tentative]` discovery-grade (Phase 0 H1/H2) |
| L3 nearest formal analogue | Hardt et al. 2016 strategic classification (arXiv:1506.06980) | classifier-first Stackelberg, costly feature change; quadratic case = T3 | `[tentative]` (lit-map row carried from Codex; no numbered result) |
| L3 family, verified | **Frankel–Kartik 2019 Prop. 2 (parts 2–3)** — high stakes destroy informativeness | family-level, not the wedge constant | `[verified-primary]` (Task 08 A10) |
| L4 static threshold | T4 specialized (internal); Fenchel conjugacy (C1/C2, T4 review's lane); equimarginal least-cost (D1, Task 02's lane) | exact corollary restatement | `[confident]` internal (displayed); externals other reviews' lanes |
| L4 dynamic shape | Stackelberg security games (Tambe 2011; Sinha et al. 2018); MTD + greedy allocation | recognition altitude only | `[tentative]` discovery-grade (Phase 0 I1/I2; no Task 08 read) |
| L4 termination argument | — none found — | elementary, apparently unstated | auditable negative above, `[tentative]` |

## What survives as the book's contribution

Mirroring the T5 and T1/T2 verdicts' discipline (and the handoff guardrail
against overcorrecting into "it's all trivial"):

- **L1:** the split as a *declared, defended field* of the response-modeling
  contract, plus the representation-relativity packaging (enrich-the-types
  absorption move) — framing over a classical identification problem.
  `[tentative]`
- **L2:** the dialectic use only (refuting baseline-covariance-as-primitive);
  no residual. The book keeps the example; it gains a citation.
- **L3:** the contract placement of the wedge (declared action/cost/stakes/
  pass-condition before transfer); no mathematical residual. `[tentative]`
- **L4:** the termination argument, credited as an elementary construction of
  the book's own; and the plain statement that the threshold is T4
  specialized (an honesty gain, not a loss). `[tentative]`

Not surviving: any implication that the non-identifiability observation, the
cumulant fact, the threshold-crossing wedge shape, or the static hardening
threshold is new. All four should be anchored to their native homes with the
caps recorded above.

## Adversarial pass (required: [confident] claims above)

Targets: (1) "T6 static = T4 quadratic specialization"; (2) the L2/L3
displayed derivations; (3) the overall verdict pattern.

1. **T6-static hypothesis mismatch hunt.** T6 has time-indexed, monotone,
   possibly-zero `kappa_{j,t}`; T4 requires closed proper convex `c` with
   feasibility absorbed and duality regularity. At each fixed `t` the cost
   `sum a_j^2/(2 kappa_{j,t})` (with `+infinity` off `a_j = 0` when
   `kappa_{j,t} = 0`) is closed proper convex; Slater holds whenever
   `S_t(M) > 0` (some usable channel), and the degenerate `S_t(M) = 0` case
   gives `m = +infinity` for `d > 0`, consistent with "not feasible."
   Boundary `S_t = T` checked: `m(d) = V`, feasible under T4's `m(d) <= V`,
   matching T6's `>=`. Monotonicity/time-indexing plays no role in the static
   claim. **Does not break.**
2. **L2 derivative identity.** Differentiation under the integral requires
   the tilt to stay in the interior of the mgf domain — exactly the book's
   own "valid exponential tilt ... stays normalizable" hypothesis (§5.1), so
   the identification imports no hidden assumption the book lacks. The toy
   example was recomputed numerically above (`2 beta` both ways). **Does not
   break.**
3. **L3 wedge derivation.** Checked the degenerate directions: at
   `t - Q = sqrt(2 kappa V)` the agent is indifferent (net gain zero) — T3
   says "worthwhile exactly when `<=`," a tie-breaking convention, consistent
   with core-math's statement; `a >= 0` binds nothing since `Q < t`. **Does
   not break.**
4. **Vacuity / wrong-statement check on the anchors.** Is "L1 = observational
   equivalence" contentless pattern-matching? No: the book's claim and the
   classical problem quantify over the same object — distinct structural
   decompositions of one observed law — and the book's own Part 1 exhibit is
   the standard demonstration form. But the pass **forced one honesty
   repair**, adopted: L4's security-game anchor was being stated too strongly
   in draft; the discovered results are about optimal allocation, which T6
   disclaims, so the anchor was downgraded to recognition altitude in the
   verdict and the table. **Partially fired; repaired.**
5. **Red-flag scan.** "Suspiciously elementary" fires by construction — the
   finding *is* that these are classical/elementary (established posture,
   `paper1-is-elementary-synthesis`). "Conclusion rhetorically convenient":
   the plan predicted all four verdicts; the priced-in risk is
   *overcorrection*, addressed by the three auditable negatives and the
   surviving-contribution section. One genuine tension checked: crediting L4
   termination as "ours" is the rhetorically convenient leftover — mitigated
   by stating it is elementary, naming the benchmark that would erase it, and
   capping at `[tentative]`. No unresolved flag to log.

**Outcome: adversarial pass clear**, with one adopted repair (L4 anchor
altitude downgrade, item 4).

## Caveats and caps

- **L1, L2, L4 external anchors are uniformly discovery-grade
  `[tentative]`:** Task 08 verified no primary in Areas F, G, or I. No
  proposition/theorem/section numbers for Heckman, Manski, Teicher, Rubin,
  Pearl, Brown, Barndorff-Nielsen, Efron, Dembo–Zeitouni, Tambe, Kiekintveld,
  Korzhyk–Conitzer–Parr, Sinha, or the MTD line may be cited until pulled.
  These are cite-by-name anchors only.
- **L3:** the only pinned citation is Frankel–Kartik 2019 Prop. 2 (parts
  2–3), `[verified-primary]` via Task 08 A10 — family-level claim only.
  Spence 1973 and Hardt et al. 2016 are safe to cite as papers (canonical,
  already in the lit map) but with no numbered statements.
- The three auditable negatives (L1 representation-relativity packaging, L3
  wedge constant, L4 termination) are bounded by Phase 0's discovery grade;
  each names its erasing benchmark. All license "state as the book's
  framing/construction," none license "novel result."
- Montgomery/equimarginal (D1) and Fenchel conjugacy (C1/C2) are
  cross-referenced, not claimed — they belong to Task 02 and the T4 review
  respectively.
- Per the plan, this review changes no theorem statements and no book prose;
  integration belongs to `plans/novelty-refactor.md`.

## Consequences (feeds the capstone)

1. **L1:** frame the selection/intervention split as the Goodhart-specific
   instance of the classical identification problem; cite
   Heckman/Manski/mixture non-identifiability by name (pull primaries before
   numbers); keep the representation-relativity clause as the book's framing.
2. **L2:** add the one-line cumulant/exponential-family nod at the
   covariance refutation (book Part 2 + §5.1 mechanism passage), plus
   optionally the Legendre/T4-conjugacy dictionary sentence.
3. **L3:** cite Spence and Hardt et al. at T3 (paper-level), Frankel–Kartik
   Prop. 2 for the signaling-family degradation claim; keep the toy framing
   and the existing lit-map discriminator (wedge is quadratic-cost-specific).
4. **L4:** state T6's threshold explicitly as the T4 quadratic
   specialization; cite security games/MTD as the problem family at
   recognition altitude; scope novelty to the termination argument, stated
   as elementary.

## File index / evidence pointers

- Discovery: `../cross-field-discovery/prior-art-formal.md` (Areas F1–F2,
  G1–G2, H1–H2, I1–I2; C2/D1 cross-references; CROSS-REFERENCE table).
- Primary verification: `../cross-field-discovery/prior-art-verification.md`
  (A10 Frankel–Kartik Prop. 2 `[verified-primary]` — the only in-family
  Task 08 record for L1–L4).
- Claims under review: `research/core-math.md` T3/T6 + definitions and
  global non-transfer clause 1 (untouched); book Part 1 "Five stories" /
  Part 2 boundaries / §5.1 mechanism passage (untouched);
  `research/threads/selection_response.md` (L2 example).
- Nearest-analogue precedent for L3: `research/reviews/formal_analogue_lit_map.md`
  (Hardt row + discriminator pass; unchanged — no false negative found there
  for L1–L4: its Non-map and mapping rows are consistent with these verdicts).
- Plan: `plans/litrev-lower-tier.md`; guardrails: `plans/litrev-handoff.md`.
- Format precedents: `../selection-bound-chapman-robbins/README.md`,
  `../looking-for-exchange-rate-results/README.md`.
