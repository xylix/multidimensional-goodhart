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
