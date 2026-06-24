  ROLE
  You are a research librarian and applied micro-theorist. I need a prior-art
  search for a specific mathematical result. I want to know whether this exact
  structure — and especially two specific results about it — already exists in
  the formal literature, and if so, where it was first and most cleanly stated.
  Search ECONOMICS, OPERATIONS RESEARCH, APPLIED MATHEMATICS, PUBLIC FINANCE,
  ENVIRONMENTAL ECONOMICS, CONTRACT/MECHANISM-DESIGN THEORY, and COMPLEX-SYSTEMS /
  INDICATOR theory.

  HARD EXCLUSION: Do NOT return AI / machine-learning / reward-hacking /
  reward-model / RLHF / "Goodhart's law in ML" sources. That literature is already
  covered. I am looking for the OLDER, non-AI ancestry of this result.

  THE STRUCTURE TO MATCH
  An agent must close a fixed shortfall d > 0 in an aggregate score. The score is
  ADDITIVE across n channels:   Score = Σ_j w_j a_j ,  with weights w_j > 0.
  Each action a_j is privately costly with SEPARABLE convex (canonically
  quadratic) cost  Σ_j a_j² / (2 κ_j),  κ_j > 0.
  SEPARATELY, each channel inflicts a hidden cost / externality / harm at a
  constant rate h_j per unit of action:  Harm = Σ_j h_j a_j.  The rate h_j is NOT
  in the agent's objective — it is a third party's loss, a social cost, or a
  "true value" the score fails to capture.
  The agent chooses the cheapest action profile that closes the deficit
  (Σ_j w_j a_j ≥ d).

  THE FOUR RESULTS TO LOOK FOR (in order of how much I care)
  (A) The cost-minimizing profile loads each channel in proportion to κ_j w_j
      (an equimarginal / Lagrange condition: equal marginal private cost per unit
      of score across active channels).
  (B) The resulting hidden harm per unit of deficit is a κ_j w_j²-weighted average
      of the per-channel "exchange rates" h_j / w_j:
          H(d) = d · (Σ_j h_j κ_j w_j) / (Σ_j κ_j w_j²).
  (C) COMPARATIVE STATIC (most important / least likely to be known): which
      channels are included in the measured/available set, and HOW MANY there are,
      does not by itself determine total harm. Only the channels' exchange rates
      h_j/w_j and cost weights matter. Adding a channel to the set can RAISE or
      LOWER total harm depending on its h_j/w_j relative to the incumbents'.
  (D) INVARIANCE / CONSERVATION THEOREM (most important): the hidden harm needed
      to close a given deficit is invariant to WHICH subset of channels is
      measured/available — across ALL subsets of the pool — if and only if
      h_j = c · w_j for a common constant c (harm rate proportional to score
      weight) on the whole pool.

  WHAT I ACTUALLY WANT TO KNOW
     harm is proportional to score weight" — been stated anywhere? This is the
     result I most suspect is either novel or a rediscovery. Find the closest prior
     statement and quote it.
  2. Has the set-monotonicity comparative static (C) — "adding a measured
     dimension can move harm in either direction; dimension count is not the right
     variable, the exchange rate is" — been stated as a theorem or proposition?
  3. Where does the underlying optimization (A)+(B) — least-cost allocation across
     weighted channels with a secondary, unpriced linear externality — already
     live as a named model?
     
  LIKELY HIDING PLACES (search these, but do not stop here)
  - Multitask principal–agent / "distortion" in performance measurement
    (Holmstrom–Milgrom 1991; Baker 1992 & 2002 "distortion"; Feltham–Xie;
    Gibbons). Baker's "distortion" between a measure's weights and the principal's
    value weights looks structurally close — does his framework contain (C) or (D)?
  - Optimal taxation / elasticity of taxable income and the "multiple margins of
    behavioral response" (Slemrod, Saez, Chetty): income shifted across channels
    with different deadweight-loss rates.
  - Least-cost pollution abatement and the equimarginal principle; marginal
    abatement cost curves; co-benefits/co-harms per unit of abatement across
    control channels (environmental economics, OR).
  - Theory of the second best (Lipsey–Lancaster): correcting/adding one margin
    while others remain distorted can worsen welfare — does any version yield (C)?
  - Composite indicators / multidimensional poverty & inequality measurement
    (Atkinson, Sen, OECD handbook): debates over whether adding indicators
    improves or degrades a weighted index; axioms on weighting and aggregation.
  - Index-number / revealed-preference theory: substitution and "exchange rates"
    between weighted dimensions.
  - Performance-target gaming in public management (Bevan & Hood, "What's
    measured is what matters") — formal models, not just case studies.
  - Portfolio / mean-variance optimization as a structural twin: minimize a
    quadratic cost to hit a target return, with exposure to an unpriced hidden
    risk factor playing the role of h_j.
    
  DELIVERABLE
  A ranked shortlist (closest first). For each candidate give:
    • full citation + where it appears (field, year, venue);
    • the exact correspondence: what plays the role of w_j, h_j, κ_j, the deficit
      d, and the "measured set";
    • which of results A/B/C/D it contains, explicitly (quote the result or
      theorem number) versus merely gestures at;
    • where it DIVERGES from the structure above (e.g. it prices the externality,
      uses non-separable cost, has no notion of changing the measured set, only
      treats two channels, etc.).
  End with a one-paragraph verdict: is the invariance iff (D) and the
  set-monotonicity static (C) genuinely present in any prior field, a special case
  of a more general known result, or apparently unstated? Name the single closest
  prior statement you found.
