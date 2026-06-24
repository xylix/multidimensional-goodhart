# Task 02 econ/management breadth — PESSIMISTIC prompt (economists already have it)

> **For the user to run on ChatGPT, Claude, and Gemini deep research.** Save raw
> results as `{chatgpt,claude,gemini}_pessimistic.md` here. The *spread* is the
> signal. BREADTH pass — broader than the T5 exchange-rate hunt already done
> (`../../looking-for-exchange-rate-results/`); do not re-derive that single
> result, hunt the rest of the landscape and the mappings.

---

ROLE

You are a skeptical economist-referee who suspects a colleague's "new"
multidimensional model of measurement gaming is a **repackaging of standard
results in personnel economics, accounting, public finance, and welfare
economics**. Your default assumption: every piece already exists under an
established name, and quite possibly several pieces are already unified in a survey
or textbook. Find the precedents. "This part appears novel" is the failure mode of
this task — only fall back to it after exhausting the searches and showing your work.

THE PIECES (find the precedent for each, named)

1. **Least-cost / equimarginal gaming load** (a ∝ κ_j w_j).
2. **Distortion / congruity:** hidden harm = weighted average of exchange rates
   h_j/w_j; zero distortion iff h_j = c·w_j.
3. **Set-monotonicity:** adding a measured channel can raise or lower harm; count
   is not the governing variable.
4. **Sufficiency:** scalar Σ w_j P_j is a sufficient statistic for P only under a
   condition.
5. **Second best / corrective-policy Goodhart.**
6. **Selection pressure strength → harm magnitude.**

VERIFY THE PROPOSED MAPPINGS (attack these specifically — say where each is exact,
a special case, or wrong):
- Piece 2 ⇄ **Feltham–Xie 1994 congruity** (sensitivity vector ∝ value vector) and
  **Baker 1992/2002 distortion = 1 − cosθ**. Is the proportionality condition
  verbatim theirs?
- Piece 4 ⇄ **Chetty 2009** ("is the taxable-income elasticity sufficient?" —
  sufficient iff no fiscal externality) and **Banker–Datar 1989** (optimal linear
  aggregation weights ∝ sensitivity × precision) and **Şabac–Yoo** (sufficient
  aggregation). Do these state the lossless-scalarization condition?
- Piece 3 ⇄ **Datar–Kulp–Lambert 2001** (adding a measure helps or hurts) and
  **Lipsey–Lancaster 1956** (second best). Is set-monotonicity actually stated, or
  only implied?
- Piece 5 ⇄ **Reynaert–Sallee 2016** ("Corrective Policy and Goodhart's Law") and
  **Frankel–Kartik 2019** ("Muddled Information": a measure used to reward becomes
  less informative). Are these the right homes?
- Piece 6 ⇄ **Bénabou–Tirole 2016** ("Bonus Culture") and **Campbell 1979** /
  **Braganza 2022** (selection strength → corruption). Right home?

THE DECISIVE QUESTION

Is there a **single source that already unifies two or more pieces**? Check
directly: Prendergast 1999 (JEL); Gibbons 1998 (JEP); Holmström 2017 Nobel
lecture; Bénabou–Tirole 2016; Ridgway 1956 (which already discusses *composite*
weighted-sum measures); any graduate textbook chapter on multitask agency /
performance measurement. If a survey already ties congruity + multitasking +
sufficiency + second-best together, the colleague's "synthesis" contribution
shrinks — find it.

ALSO: is there an OLDER root than the ones listed? Ridgway 1956 predates Goodhart
by 19 years; is there anything earlier (Simon, March, Blau organizational
behavior; Ramsey/Pigou corrective taxation; team theory Marschak–Radner) that
states a piece first?

RULES OF ENGAGEMENT
- Name your single best precedent for EACH piece even if imperfect, with the exact
  divergence (where their setup stops matching: they price the externality, fix the
  channel set, assume two channels, prove proportionality of *optimal* weights but
  never state subset-invariance, etc.).
- Distinguish sharply: (i) they state the piece outright; (ii) it is a one-line
  corollary they did not write down; (iii) only the optimization is there, not the
  measurement-gaming reading.

DELIVERABLE

Ranked closest-first per piece. The headline: which pieces are clearly
not-novel (exact precedent), which are repackagings (unstated corollary), and
whether any single source already unifies several. Name any precedent or unifying
source we have not listed. For any piece where you genuinely cannot find a
precedent, list the searches that came up empty so the negative is auditable.
