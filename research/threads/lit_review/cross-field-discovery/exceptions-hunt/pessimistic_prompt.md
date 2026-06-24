# Task 04 exceptions hunt — PESSIMISTIC prompt (the gap is near-total)

> **For the user to run on ChatGPT, Claude, and Gemini deep research.** Save each
> raw result as `{chatgpt,claude,gemini}_pessimistic.md` in this folder. The
> *spread* across models and across the optimistic/pessimistic pair is the signal.
> Paste verbatim; do not edit the model output.

---

ROLE

You are a skeptical citation auditor. I claim that the AI-safety / machine-learning
literature on **Goodhart's law, reward hacking, and reward-model overoptimization**
has *failed to cite* the economics / accounting / statistics prior art that already
contains the same mathematics — that the field reinvented results proved decades
earlier in other vocabularies. I want you to be the hostile referee who tries to
**break this claim by finding the citations that would refute it.** Your default is
to assume a bridge exists and to go find it. Concluding "the gap is real" is only
acceptable AFTER you have exhausted the searches below and can show your work — and
even then you must state precisely which exceptions DO exist (because a few do).

THE CLAIM UNDER ATTACK

"The performance-measurement / congruity prior art (Feltham–Xie 1994 congruity,
Banker–Datar 1989, Baker 1992/2002 distortion = 1 − cosθ, Datar–Kulp–Lambert 2001,
Bénabou–Tirole 2016) and the estimation / χ²-DRO prior art (Hammersley–Chapman–
Robbins, Ben-Tal et al. 2013, Namkoong–Duchi 2017) — which contain the actual
mathematics of multidimensional Goodhart — are **not cited** by the formal-Goodhart
/ reward-overoptimization literature in a way that connects them to Goodhart."

YOUR TASK: TRY TO REFUTE IT

Hunt for any AI/ML/alignment/RLHF paper that cites any of those specific items and
connects it to a proxy-vs-true-objective (Goodhart / reward-hacking /
overoptimization) result. Search aggressively under each branch's own vocabulary:
- "congruity" + (reward OR proxy OR alignment); "distortion" + "incentive" +
  (RLHF OR reward model); "multitask principal-agent" + alignment;
  "informativeness principle" + reward; "sufficient statistic" + (proxy OR reward).
- "Chapman–Robbins" OR "Hammersley" + (reward OR proxy OR Goodhart);
  "χ²-divergence" / "chi-square divergence" + "reward hacking" / "occupancy
  measure" (note: Laidlaw et al. 2024 USES χ²/occupancy regularization framed as
  Goodhart — check its reference list: does it cite Chapman–Robbins, Ben-Tal, or
  Namkoong–Duchi, or none?).
- "second best" + alignment; "Reynaert–Sallee" / "corrective policy Goodhart" +
  (reward OR AI); Chetty "sufficient statistics" + (reward OR alignment).

For every citation you find, classify it sharply — this distinction is the whole
game:
- (i) cites the result **and connects it to Goodhart / reward overoptimization**
  (this REFUTES the claim for that item) — quote the citing sentence;
- (ii) cites the result but for a **different purpose** (control, off-switch,
  agency, distributionally-robust *training*, fairness, genealogy/folklore) — does
  NOT refute;
- (iii) does not cite it at all.

EXCEPTIONS ALREADY KNOWN (do not let these be your whole answer — find MORE or
concede there are no more):
- CHAI (CIRL 2016, Off-Switch 2017): cite HM1991 / Baker 2002 for control, **type
  (ii)**, not Goodhart.
- BBS "Proxy failure" 2023: cites Holmström/Baker 2002/Kerr qualitatively, no
  formal theorem — borderline (ii).
- Hendrycks 2021 "Unsolved Problems in ML Safety": cites Ridgway 1956 at genealogy
  tier — **type (ii)**.
- Wang & Huang 2026 (arXiv:2603.28063): instantiates HM1991 + Baker 1992 into a
  formal distortion index tied to Goodhart — **type (i)**, but reaches only those
  two items and re-derives the rest.

RULES OF ENGAGEMENT
- You must produce your **single strongest refuting citation** (the most
  type-(i)-like bridge you can find) even if imperfect, and state exactly why it
  does or does not close the gap for a given prior-art branch.
- The χ²-DRO / Chapman–Robbins branch is the one I most want pressure-tested:
  these results are heavily cited inside distributionally-robust ML, so it would be
  surprising if NO reward-hacking paper reached them. Look hardest there.
- Distinguish the reward-hacking / formal-Goodhart corpus from the strategic-
  classification / performative-prediction lineage (Hardt 2016, Perdomo 2020) —
  the latter is a different community and citations there do not refute the claim
  about the AI-safety corpus.

DELIVERABLE

Ranked by refuting power: the citations that come closest to breaking the claim,
each classified (i)/(ii)/(iii) with the citing context. Then a verdict: after a
genuine hunt, is the gap real for each branch (congruity / sufficiency / χ²-DRO /
corrective-Goodhart)? For any branch where you found **zero** type-(i) bridges,
list the specific searches that came up empty so the negative is auditable. Name
every exception beyond the four known ones, or state explicitly that you found none.
