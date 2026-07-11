# Citation audit — findings & refined thesis

Status: **FINAL — audit CLOSED 2026-07-11** (tasks 05–10 complete). The
consolidated, self-contained synthesis the post-structuring phase should read is
**`SUMMARY.md`** (this directory); this file records the thesis and its history.
Everything below the "HISTORICAL" divider is the 2026-06-24 seed pass (25
papers), retained as a record — its numbers are **superseded** by the frozen
full-corpus figures here and in `SUMMARY.md` / `audit.md`.

## Final thesis (full frozen corpus, verified)

Across the frozen corpus — **N=117, minable N=115** (A12/I3 n/a); clusters C/F/G
anchor+representative samples per `corpus.md`; cells = current arXiv version =
version of record, all headlines invariant to the any-version reading
(`why-the-gap.md` §M4) — the AI-side Goodhart / reward-hacking /
overoptimization literature does not cite the economics / statistics prior art
that contains its mathematics, **except in three named pockets**:

- **CONTRACT: 8 ✓ + 1 △ of 115, with 0/60 in the reward-hacking + RLHF core
  (B: 0/25, C: 0/35).** The 8 hits: the 2026 benchmark-contract bridges (I1
  Wang–Huang, I2 Haupt — substantive imports; A9 Marklund et al. — genealogy
  nod), the CHAI control lineage (D2/D3 — versions of record keep only
  Gibbons 1998 + Kerr; the HM1991/HM1987/Baker-2002 contacts were
  v1-preprint-only, and D3-cites-HM1991 is refuted in every version), and the
  strategic-ML/platform periphery (F3 body-use, F13, F15 econ-authored).
- **The specific math tier is essentially untouched:** Feltham–Xie congruity
  **1/115** (F15, econ-authored, "Goodhart" absent from its text); Baker 1992
  **1** (I1); Baker 2002 **1** (I2); HM1991 **5** current-version; DKL /
  Prendergast / Holmström-2017 **0**.
- **PUBFIN 0/115** (F5's Chetty cite was v1-preprint-only, Apr–Dec 2022);
  **2BEST 0/115; CORRECT 0/115** — including Reynaert–Sallee, which has
  "Goodhart's Law" in its title.
- **ESTIM 6 ✓ + 7 ~, never as prior theory of a Goodhart bound (0/115):**
  every ✓ is DRO tooling except χPO's genealogy footnote; the two papers using
  χ² *for* Goodhart (Laidlaw B3, χPO C31) cite none of the estimation lineage.
- The corpus's actual econ contact is the **Goodhart eponym (24/115: 16×1984,
  8×1975)** and the **folklore tier (MGMT 20/115:** Strathern 13, Campbell 6,
  Kerr 3, Rodamar 2, Ridgway 1), plus Lucas 1976 (3).

**Refined claim (final wording discipline — see `SUMMARY.md` §8 for the full
licensed-claim/overclaim pass):** the performance-measurement branch of contract
theory and the estimation/χ²-DRO tier — the actual mathematics of
multidimensional Goodhart — remain uncited *as prior theory* by the
reward-hacking / RLHF-overoptimization core; contact exists only via the named
exception floor. NOT licensed: "AI safety ignores economics" (folklore + eponym
are heavily cited), "nobody bridged" (BBS 2023 conceptually; Wang–Huang / Haupt
2026 formally at the HM1991/Baker anchor), or any first-to-bridge claim.

**Why (task 09, `why-the-gap.md`):** vocabulary divergence [confident],
ML-internal reference space / community boundary [confident-facts],
inherited pruned base (Amodei + surveys carried nothing) [confident-facts,
tentative-mechanism], camera-ready pruning of exactly the technical-tier
contacts [confident per-case, guess on intent], 2026 anchor-nod closing
[tentative, not a trend].

**Deltas vs the seed pass below:** the CHAI exception was *narrowed* by
verification (its celebrated HM1991/Baker citations were preprint artifacts);
PUBFIN moved 1→0 (version convention); the exception floor gained the 2026
bridges (I1/I2/A9) and F-cluster contacts (F3/F13/F15); "first to bridge
contract theory to formal Goodhart" is dead (Wang–Huang/Haupt). The seed
headline ("gap real but localized") survived intact.

---

## HISTORICAL — seed-pass findings (2026-06-24, 25 papers; numbers superseded)

Status: 2026-06-24, after the first systematic pass (`audit.md`). This is the
interpretive layer that will seed the paper's argument. The headline survives,
but the deep pass **sharpened it** and **corrected an overclaim** from the
7-paper exemplar audit. Read this before drafting structure.

## Headline (survives, now quantified)

Across 25 minable papers in the formal-Goodhart, reward-hacking, and RLHF-
overoptimization literatures (600+ references), the contract-theory/congruity,
public-finance, second-best, corrective-tax, and DRO-estimation prior art is
cited **zero** times. The only economics contact is the Goodhart eponym (13/25)
and the social-measurement folklore tier — Campbell / Strathern / Kerr (6/25).
Even the two economics-*authored* papers in the set (Hennessy–Goodhart in IER;
El-Mhamdi) cite zero contract theory. Several recent surveys (Zhong 2025,
Kaufmann 2023) don't use the word "Goodhart" at all.

## The correction: the gap is real but LOCALIZED, not total

The exemplar pass implied AI safety never reaches contract theory. The reverse
sweep refutes the absolute version and gives the paper a sharper, more defensible
claim:

- **One lineage already crossed the bridge — but on a different object.** The
  Berkeley CHAI cluster (Hadfield-Menell / Russell) cites **Holmström–Milgrom
  1991** (CIRL 2016; Off-Switch Game 2017; Visibility into AI Agents 2024) and
  **Baker 2002** (Off-Switch Game), and Zhuang–Hadfield-Menell 2020 cites Kerr
  1975 plus a transaction-cost-economics cluster (Williamson, Klein–Crawford–
  Alchian, Shavell, Hadfield-Menell–Hadfield "Incomplete Contracting and AI
  Alignment"). So contract theory *has* entered alignment — via the
  **incomplete-contracting / control / off-switch** framing.
- **But not on the Goodhart object.** None of these connect HM1991's *multitask
  distortion* result, or congruity, to **multidimensional Goodhart / reward
  overoptimization**. The formal-Goodhart and reward-hacking papers themselves
  (Skalse, Gao, El-Mhamdi, Manheim–Garrabrant, …) cite none of it.
- **The book's specific prior art is genuinely untouched.** Feltham–Xie congruity
  (949 cites, 0 alignment), Baker 1992 (1098, 0), and Reynaert–Sallee 2016 (14,
  0) have **zero** AI-safety citers. The congruity ⇄ exchange-rate (T5) link and
  the corrective-policy-Goodhart sibling are exactly the rediscoveries the gap
  paper documents.

**Refined claim to make in the paper:** *contract theory has entered AI alignment
only through the control/incomplete-contracting branch (CHAI), while the
performance-measurement branch — multitask distortion, congruity, sufficient
statistics, second best, corrective-policy Goodhart — that contains the actual
mathematics of multidimensional Goodhart remains uncited by the formal Goodhart /
reward-overoptimization literature.* This is both true and harder to dismiss than
"they cite nothing."

## New material the deep pass surfaced

1. **Ridgway 1956** ("Dysfunctional Consequences of Performance Measurements,"
   ASQ) is the genealogical origin point — performance-measure distortion stated
   **19 years before Goodhart 1975** — and is absent everywhere. Strong candidate
   for the paper's "the field doesn't even know its own oldest ancestor" beat.
2. **A "should-be-cited" econ set** beyond the T5 congruity core: Prendergast
   1999, Gibbons 1998, Holmström 2017 (Nobel lecture), Courty–Marschke 2004
   (empirical gaming), Bénabou–Tirole 2016. These broaden the dictionary's
   economics column and give the "what AI can learn" section more to import.
3. **Near-misses worth naming** (the field gets mathematically adjacent then
   stops short of the prior art): Laidlaw 2024 uses χ²-divergence/occupancy
   regularization (the Chapman–Robbins/DRO neighborhood) but cites no estimation
   prior art; IRD 2017 cites Rockafellar–Uryasev CVaR but not DRO; Moskovitz 2023
   does constrained/Lagrangian RLHF (second-best territory) citing no welfare
   economics. These are vivid illustrations of independent reinvention.
4. **BBS bridge corrections** (use the right strings): it cites Holmström
   1979/2017 (not HM1991), Baker 2002 (not 1992), Kerr 1975, Bénabou–Tirole 2016;
   it has **no** Lipsey ref; its "Chetty" is Marshini Chetty (privacy). The paper
   must cite BBS accurately and position its delta over it: a *quantified* audit
   of the formal-Goodhart corpus + the projection/congruity-level math dictionary.

## What this means for the paper's contribution claim

- The empirical claim is now a coded, reproducible result (`audit.md`), defensible
  against "you missed a citation," with the CHAI exception stated up front rather
  than hidden — which strengthens credibility.
- The synthesis claim narrows usefully: the paper bridges the **performance-
  measurement / congruity** economics to **multidimensional Goodhart**, a link
  neither the CHAI control-branch work nor BBS makes at the math level.

## Open items before structuring the paper (do not start structure yet, per plan)

- **Belt-and-suspenders negatives** on the two largest lists (Amodei 2016, Leike
  2018) via PDF grep, and re-audit Kaufmann/Wang surveys when clean reference
  lists exist — to make every "absent" line-verified.
- **Decide the corpus freeze:** 25 papers is a solid N; consider adding 5–10 more
  RLHF-overoptimization 2024–2026 entries to reach the plan's 30–40 and make the
  denominator round. List the additions and re-run the same coding.
- **Lock the "should-be-cited" econ set** (T5 core + Ridgway/Prendergast/Gibbons/
  Holmström2017/Courty–Marschke) as the dictionary's economics column.
- **Add to `refs.bib`** the verified-absent precedents actually used + BBS 2023.

---

## Phase 0 unified discovery — result notes (2026-06-24)

Discovery tasks 01–04 (+08) executed; outputs in
`../../research/threads/lit_review/cross-field-discovery/`. **Gate (task 04)
preliminary verdict: PASS — gap real, BBS delta real. STOP before freeze/code.**

- **01 AI corpus** (`ai-corpus.md`): saturated, ~95 candidates (superset of the
  25). Clusters A–H + strategic-ML (F) and ADA/benchmark (G) flagged borderline.
  Caveat: several 2026 arXiv IDs unverified — freeze phase must check.
- **02 econ prior art** (`prior-art-econ.md`): saturated, ~38 items across 7
  subfields. Strongest *new* beyond the T5 set: Banker–Datar 1989 (weight ∝
  sensitivity×precision), Chetty 2009 (elasticity sufficient iff no externality),
  Ridgway 1956 (composite weighted-sum measures, 19y pre-Goodhart), Frankel–Kartik
  2019 (measure-degrades-when-used), Şabac–Yoo (sufficient aggregation),
  Braganza 2022 (formal proxy-competition dynamics).
- **03 formal prior art** (`prior-art-formal.md`): saturated. **The "no χ²
  analogue" internal negative is overturned** — T1 = Hammersley–Chapman–Robbins
  rearranged; T2 = matrix HCR ellipsoid; three independent homes (HCR, χ²-DRO,
  Bayesian-robustness). T4 = Fenchel/Rockafellar. All lower-tier homes (L1–L4) found.
- **04 bridges** (`bridges.md`): forward-citation census of 11 priority prior-art
  items → **0 genuine alignment citers connect the congruity/sufficiency/χ²-DRO
  tier to Goodhart** (incl. heavily-cited Ben-Tal 766, Chapman–Robbins 259 with
  large CS citer sets that contain no reward-hacking paper). Vocabulary probe =
  clean negative (7/9 terms absent). Exception floor: CHAI (control framing),
  Hendrycks-Ridgway (genealogy tier), **+ NEW: Wang & Huang arXiv:2603.28063 (Mar
  2026)** — formally bridges HM1991+Baker1992 to Goodhart but re-derives the
  distortion index and omits the congruity/estimation tier (narrows, doesn't close
  the gap; existence arXiv-verified). BBS = qualitative, not formal → delta real.
- **08 verification** (`prior-art-verification.md`): 7 verified-primary, 6
  secondary, 8 flagged for user pull. **Two corrections:** Reynaert–Sallee
  either-direction welfare is **Prop. 2** (not Prop. 4); **Ben-Tal 2013 has no
  "mean+√r·sd" prop** — that is Namkoong–Duchi Thm 1, constant **√(2ρ/n)**.
  Recommended scope: lead with estimation/χ²-DRO (T1/T2) + corrective-Goodhart
  (both primary-pinned now); T5 congruity tight on substance but key prop labels
  paywalled.

**Forced scope adjustments (from the gate):** (1) cite 2603.28063 and rescope —
the gap paper is no longer "first to bridge contract theory to formal Goodhart";
surviving contribution = breadth dictionary + quantified audit + subset-invariance.
(2) State the gap as LOCALIZED with the exception floor named up front.

### Adversarial multi-LLM passes — DONE (2026-06-28), gate CONFIRMED

All 12 passes run (4 prompts × ChatGPT/Claude/Gemini); syntheses in
`bridges.md` (exceptions hunt) and `prior-art-econ.md` (breadth). **Gate verdict
holds and is sharpened, not broken.**
- **Exceptions hunt:** new bridges found, but all in two pockets that confirm the
  refined claim. (i) Benchmark/contract pocket reaching only HM1991/Baker:
  **Haupt et al. 2026 (arXiv:2605.30916, confirmed real)** joins Wang–Huang 2026 as
  a formal type-(i) bridge — neither reaches the cosine-congruity geometry. (ii)
  χ²-DRO robust-RLHF pocket (DRO-REBEL, Robust-DPO, etc.) cites Ben-Tal/Namkoong–
  Duchi as **tooling (type-ii)**, not as Goodhart's prior theory; the two χ²-for-
  Goodhart papers (Laidlaw 2024, χPO 2025) cite **none** of the estimation tier.
  **Reynaert–Sallee, Chetty, Şabac–Yoo, Lipsey–Lancaster = unanimous type-(iii).**
  Two corrections to the census: cosine-congruity (Baker 2002/Feltham–Xie) is still
  un-bridged (Wang–Huang uses Baker 1992 + a *weight-ratio* index, not 1−cosθ); and
  "0 alignment citers" sharpens to "0 type-(i); type-(ii) tooling citations exist."
- **Breadth pass:** no missed major home; new items = Amershi–Banker–Datar 1990
  (closer sufficiency home than Chetty), Ito–Sallee 2018 (multidim regulator
  gaming), Merton 1940/Blau 1955 (pre-Ridgway roots). Mapping fixes: Chetty is the
  *weaker* home for statistical sufficiency (→ Banker–Datar); set-monotonicity is a
  *naming* contribution; Reynaert–Sallee's gaming can *benefit* buyers. No single
  source unifies all six pieces, but the multitask-LEN lineage co-locates 1–4
  (reinforces `paper1-is-elementary-synthesis`); flag Bolton–Dewatripont 2005
  (Gemini-only claim) for a body-verify.

**Surviving contribution (tightened):** quantified citation-gap audit + the
econ⇄stats⇄AI breadth dictionary (no bridge paper assembles it) + the specific
uncited identities (χ²-occupancy = HCR/χ²-DRO; cosine-congruity unreached) + the
subset-invariance reading. **Drop** "first to bridge contract theory to formal
Goodhart" (Wang–Huang/Haupt 2026 hold it); name the expanded exception floor in the
abstract. **HARD STOP still in force** — no freeze/code/Track-A until the human
reviews; residual body-verifies: Haupt-2 / Content-Moderator-Feltham–Xie /
Athey-Chetty / Bolton–Dewatripont.

**Tier-1 bridge ref-lists PRIMARY-VERIFIED (2026-06-30):** Wang–Huang 2603.28063 →
only HM1991 + **Baker 1992** (distortion index = weight ratio, not 1−cosθ); Haupt
2605.30916 → HM1991/1987 + **Baker 2002** + Strathern, Goodhart-framed. **Neither
cites Feltham–Xie / Banker–Datar / DKL / Bénabou–Tirole / any estimation item** —
cosine-congruity + estimation tier confirmed unreached. **χPO correction:** χPO
(2407.13399) is **type-(ii) not type-(iii)** — it cites Duchi–Namkoong 2019 as a
genealogy footnote, and its bound (Lemma 5.1, χ²-change-of-measure) is **not** the
literal HCR identity (the Gemini/Claude "χPO IS HCR" near-miss was overstated). The
clean reinvented-uncited example is **Laidlaw 2024** (type-iii). Details in `bridges.md`.

**BBS body-verify DONE (2026-06-30) — delta CONFIRMED `[confident]` and
strengthened.** Full target article read (`sources/Dead-rats-…_BBS_2023.pdf`
pp. 1–16): BBS is qualitative — prose propositions (Table 2), an "illustrative"
causal diagram (Fig. 1), the scalar-proxy necessity argued via revealed preference
(not ΣwⱼPⱼ), and a prose *review* of Baker-2002 distortion that never restates the
1−cosθ / congruity math. §6 has the authors stating outright that "a formal model
of the unified mechanism" does not exist / it is "unclear … how [one] might look."
Refs confirm the corrected premises (no Feltham–Xie/HM1991/Banker–Datar/DKL/Lipsey/
Raj-Chetty; has Baker 2002, Holmström 1979/2017, Kerr, Bénabou–Tirole, Aghion–
Tirole, **Hennessy–Goodhart 2021 SSRN** — flag the latter for Track B coding). See
`bridges.md §4` for the full body-verified lock. This clears the gate's weakest pillar.
