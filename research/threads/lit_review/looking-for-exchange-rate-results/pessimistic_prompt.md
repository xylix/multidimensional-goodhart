  ROLE
  You are a skeptical priority-of-discovery investigator. A colleague believes
  they have a new theorem. I think they have rediscovered something economists,
  operations researchers, or applied mathematicians proved decades ago, and I want
  you to FIND THE PRECEDENT. Your default assumption is that this result already
  exists under different vocabulary. Returning "this appears novel" is the FAILURE
  mode of this task, not a success — only fall back to it after you have
  exhausted the searches below and can show your work.

  Search ECONOMICS, OPERATIONS RESEARCH, APPLIED MATH, PUBLIC FINANCE,
  ENVIRONMENTAL ECONOMICS, CONTRACT/MECHANISM-DESIGN, ACCOUNTING THEORY, INDEX-
  NUMBER THEORY, and AGGREGATION THEORY. Do NOT use AI/ML/reward-hacking sources —
  that ancestry is irrelevant here; the precedent I want is older and non-AI.

  THE STRUCTURE (the thing I claim is a rediscovery)
  An agent closes a fixed shortfall d > 0 in an additive score
  Score = Σ_j w_j a_j (weights w_j > 0), paying separable quadratic private cost
  Σ_j a_j²/(2 κ_j). Each channel also does hidden harm at rate h_j per unit action
  (Harm = Σ_j h_j a_j), where h_j is NOT in the agent's objective. The agent picks
  the cheapest profile that closes the deficit.

  The two results I most want a precedent for:
  (C) Total hidden harm does not depend on HOW MANY channels are measured/available
      or which, by count — only on the channels' exchange rates h_j/w_j and cost
      weights. Adding a channel can move harm up or down.
  (D) Hidden harm to close a given deficit is invariant to the measured subset of
      channels — across ALL subsets — IF AND ONLY IF h_j = c·w_j for a common c
      (harm rate proportional to score weight) on the whole pool.

  YOUR TASK: PROVE THIS IS NOT NEW
  Assume (C) and (D) are corollaries of an existing, more general theorem. Find it.
  Work these angles aggressively:

  1. SAME RESULT, DIFFERENT WORDS. The same math is named differently per field.
     Run searches under EACH vocabulary and report hits:
     - "distortion" / "congruity" / "alignment" of performance-measure weights
     - "effort substitution" / "multitasking" / "gaming" / "manipulation"
     - "least-cost allocation" / "equimarginal principle" / "equi-proportional"
     - "consistency in aggregation" / "subaggregation invariance" (index theory)
     - "separability" / "proportional weights" / "neutrality" / "irrelevance"
       theorems (aggregation & welfare theory)
     - "sufficient statistic" / "informativeness" / "linear aggregation of signals"

  2. IS (D) A SPECIAL CASE OF A KNOWN INVARIANCE THEOREM? The form "outcome is
     invariant to the grouping/subset chosen iff a proportionality condition
     holds" is a classic aggregation shape. Check directly:
     - Banker & Datar (1989), "Sensitivity, precision, and linear aggregation of
       performance measures" — optimal weights proportional to sensitivity/noise.
     - Holmström (1979) informativeness / sufficient-statistic result.
     - Gorman / Leontief separable-aggregation and consistent-aggregation theorems.
     - Diewert / Vartia "consistency in aggregation" for index numbers.
     - Theory of the second best (Lipsey–Lancaster) for the sign-ambiguity in (C).
     For each: does its proportionality/invariance condition REDUCE to h_j = c·w_j
     under a change of variables? Show the substitution explicitly. If it does,
     that IS the precedent — report it as such.
  
  3. OLDER THAN YOU EXPECT. Check pre-2000 and mid-20th-century sources:
     optimal taxation and excess burden (Ramsey, Diamond–Mirrlees, Sandmo),
     cost-minimization duality (Shephard), team theory (Marschak–Radner),
     tax-avoidance "multiple margins" (Slemrod), least-cost abatement (Baumol–
     Oates, Montgomery). Textbook treatments count as precedent.
     
  RULES OF ENGAGEMENT
  - You must name your SINGLE BEST CANDIDATE even if it is imperfect. "Nothing
    found" is not an acceptable final answer until you have produced a best
    candidate and stated precisely the gap between it and (C)/(D).
  - For your best candidate, give the explicit change of variables that maps their
    setup onto ours, and identify the EXACT step where the correspondence breaks
    (if it breaks): e.g. they price the externality, their cost is non-separable,
    they fix the channel set, they prove proportionality of optimal weights but
    never state subset-invariance, they have only two channels, etc.
  - Distinguish sharply between: (i) they state (D) outright; (ii) (D) is a
    one-line corollary of their theorem that they did not write down; (iii) they
    have the optimization but nothing resembling (C)/(D).
    
  DELIVERABLE
  Ranked by closeness, closest first. For the top candidate, a verdict in this
  exact form:
    "The closest prior art is [cite]. It establishes [what]. Result (D) [is stated
     / is an unstated one-line corollary / is absent] there because [precise
     reason]. To map it onto the claimed result, set [w_j ↦ ..., h_j ↦ ..., etc.].
     The correspondence holds up to [exact divergence]."
  If after all of the above you cannot map any prior result onto (D), say so
  explicitly and list the specific searches that came up empty, so the negative is
  auditable.
