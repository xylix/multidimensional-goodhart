Iteration 3 is complete and committed.

  Main commit:
  f6186d8 Add weighted selection response iteration

  Hash bookkeeping commit:
  0a33b80 Record iteration 3 commit hash

  What changed: added research/threads/selection_response.md and extended research/formalization.md with weighted selection response. The key result is that
  for Boltzmann selection W_beta = exp(beta P), hidden drift satisfies:

  d E_beta[H] / d beta = Cov_beta(H, P)

  So covariance is not a finite-pressure summary; it is a local velocity along the selection path. The workspace is clean.

─ Worked for 6m 54s ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


› Can you explain the current approach for me?


• The current approach is to build the framework by isolating small mathematical mechanisms, then attacking each one before treating it as part of the
  broader “deep Goodhart” story.

  Right now the framework has three layers.

  1. Goal/proxy geometry

  We model the real goal as a vector:

  G: S -> R^m

  and the proxy as:

  P: S -> R^k

  The regulator’s intended relationship is:

  phi: R^m -> R^k

  with residual:

  epsilon(s) = P(s) - phi(G(s))

  This separates two gaps:

  dimension gap:    ker phi != 0
  observation gap:  epsilon != 0

  The dimension gap means some real goal directions are invisible to the proxy. The observation gap means the proxy is noisy or distorted even on directions
  it is trying to measure.

  2. Selection response

  Instead of saying “correlation causes Goodhart,” the notes now treat Goodhart pressure as a change in the distribution of states.

  For hard threshold selection:

  b_H(t) = E[H | P >= t] - E[H]

  This asks: after selecting only states with proxy score above t, how did the hidden goal dimensions H move?

  Then iteration 3 generalized this to weighted selection:

  E_t[F] = E_mu[F W_t] / E_mu[W_t]

  B_H(t) = E_t[H] - E_mu[H]

  Here W_t is a selection policy. Examples:

  hard threshold:  W_t = 1{P >= t}
  soft pressure:   W_beta = exp(beta P)

  So the framework is currently treating regressional/extremal Goodhart as distribution reweighting: optimization changes which states are selected or
  emphasized.

  3. Covariance is local, not global

  The first toy model used a Gaussian setup and showed that hidden drift depends on covariance between measured and hidden dimensions.

  But then the notes attacked that. In non-Gaussian cases, zero covariance can still hide tail effects. Example:

  P = Z
  H = Z^2 - 1
  Z ~ N(0, 1)

  Then:

  Cov(H, P) = 0

  but selecting high P gives:

  E[H | P >= t] > 0

  So covariance is not enough.

  Iteration 3 rescued covariance in a narrower role. Under soft optimization:

  W_beta = exp(beta P)

  we get:

  d E_beta[H] / d beta = Cov_beta(H, P)

  Meaning: covariance is the instantaneous velocity of hidden drift under soft pressure, evaluated at the current reweighted distribution. It is not a
  reliable summary of what happens under finite optimization pressure.

  So the current picture is:

  baseline covariance      = local, infinitesimal diagnostic
  threshold response       = hard-selection diagnostic
  weighted response        = general fixed-distribution selection diagnostic
  future causal model      = needed for adaptation/intervention

  The big limitation we have explicitly logged is that this still assumes a fixed baseline distribution mu. It handles “selection from existing states,” but
  not yet cases where the metric changes behavior, incentives, reporting, or the process generating future states. That is the next layer needed for causal/
  adversarial Goodhart.


› I like this >   The dimension gap means some real goal directions are invisible to the proxy. The observation gap means the proxy is noisy or distorted
  even on directions
    it is trying to measure.  \n I'm having a hard time understanding the Selection response and everything after that.


• Good. The selection-response part is trying to answer: once the proxy is used to choose, reward, promote, filter, or optimize states, how does the
  distribution of real outcomes change?

  A simpler version:

  Suppose each option has:

  P = proxy score we can see
  H = hidden goal quality we care about but do not directly measure

  Before optimization, we have some population of options:

  all employees
  all schools
  all model outputs
  all companies
  all products

  Then we apply pressure on the proxy:

  promote people with high P
  fund projects with high P
  rank products by high P
  train models toward high P

  The selection response asks:

  After selecting for high P, what happened to H?

  So this formula:

  b_H(t) = E[H | P >= t] - E[H]

  just means:

  average hidden quality after selecting proxy score >= t
  minus
  average hidden quality before selection

  If this is negative, optimizing the proxy made the hidden goal worse. If positive, it improved the hidden goal. If zero, selection on the proxy did not
  move that hidden dimension on average.

  Example:

  P = number of shipped features
  H = codebase health

  Then:

  b_H(large t)

  asks:

  Among teams that ship lots of features, how different is codebase health from the average team?

  That is the selection response.

  The “weighted response” is just a more flexible version. Not all selection is a hard cutoff like:

  only promote people with P >= 90

  Sometimes pressure is softer:

  higher P gives a higher chance of promotion
  higher P gives more budget
  higher P gives more visibility
  higher P is rewarded gradually

  So instead of saying “selected or not selected,” we assign each state a weight:

  W = how much this state is favored by the selection process

  Then ask the same question:

  After favoring high-P states, what happened to hidden H?

  The covariance part is saying something narrower:

  At very small levels of soft pressure, ordinary correlation/covariance tells you the initial direction hidden variables move.

  But it does not tell you what happens after strong optimization.

  Analogy:

  Covariance is like current speed.
  Selection response is like total displacement.

  Knowing your current speed does not tell you where you end up after a long trip unless you know how speed changes along the way.

  So the whole structure is:

  Dimension gap:
  some real goal dimensions are invisible to the proxy.

  Observation gap:
  the proxy is noisy/distorted even where it tries to measure.

  Selection response:
  when we optimize/select using the proxy, how do invisible or hidden dimensions move?

  Weighted response:
  same question, but for soft pressure instead of hard cutoffs.

  Covariance:
  only the first-order, local version of selection response.

  In plain English, we are trying to formalize:

  > A proxy does not just measure badly. Once used for selection, it reshapes which parts of the real goal distribution we see. Hidden dimensions may drift,
  > even when the proxy looked statistically reasonable before optimization.


› Okay. Makes sense. Let's explain part 3.


• Part 3 is about why correlation/covariance is useful, but not enough.

  Suppose we have:

  P = proxy score
  H = hidden goal dimension

  A tempting thought is:

  > If P and H are uncorrelated, then optimizing P should not affect H.

  That is false.

  Correlation mostly tells us whether H tends to move linearly with P across the whole distribution. But Goodhart pressure often selects from the tails:
  unusually high proxy scores. Tail behavior can be different from average linear behavior.

  Example:

  P = Z
  H = Z^2 - 1
  Z ~ normal distribution

  Here H is high when P is very positive or very negative, and low near average P.

  So across the full population, positive and negative sides cancel out:

  Cov(H, P) = 0

  But if we select only high proxy values:

  P >= t

  then we only keep the positive tail. In that selected group:

  H is high

  So even though P and H had zero covariance overall, selection on high P changes H.

  That is the key lesson:

  > Zero correlation does not mean zero Goodhart risk.

  Then iteration 3 adds a more precise role for covariance.

  If selection pressure is soft, like:

  states with higher P are gradually favored more

  we can model that as:

  W_beta = exp(beta P)

  where beta is pressure strength.

  When beta = 0, there is no selection pressure.

  As beta increases, high-P states get favored more.

  The math says:

  d E_beta[H] / d beta = Cov_beta(H, P)

  Plain English:

  > At any current level of soft optimization pressure, covariance tells you the immediate direction and speed of hidden-goal drift.

  But the important phrase is at the current level.

  The covariance can change as pressure changes, because the selected population changes.

  So:

  baseline covariance

  only tells you the initial movement.

  It does not necessarily tell you the final result after strong optimization.

  That gives the current picture:

  Correlation/covariance:
  useful for small, local pressure.

  Selection response:
  needed for finite, actual selection pressure.

  Tail behavior:
  can matter even when covariance is zero.

  A concrete human example:

  P = interview polish
  H = long-term research originality

  Maybe across all candidates, polish and originality are uncorrelated. Some polished people are original, some are not; some unpolished people are original,
  some are not.

  But if you select only the top 1% of polish, you may get a very specific kind of person: practiced, socially fluent, credential-optimized. That group may
  differ strongly in originality, even though the broad-population correlation was near zero.

  So part 3 says:

  > Do not trust average correlation as a Goodhart safety certificate. Optimization cares about what happens under pressure, especially in selected tails.
