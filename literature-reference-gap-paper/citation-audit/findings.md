# Citation audit — findings & refined thesis

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
Athey-Chetty / Bolton–Dewatripont / χPO=HCR-identity / BBS-formal-claim.
