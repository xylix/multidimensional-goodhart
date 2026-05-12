# Open questions

1. What substantive assumptions justify `||r||_2` growing with `dim(ker phi)` rather than remaining bounded by a fixed correlation budget?
2. Which harm functional is best for dimensional Goodhart: signed drift, normed drift, squared loss, tail probability, or regret relative to a Pareto set?
3. How does adding proxy dimensions change `ker phi` and the residual `epsilon` simultaneously in a linear-Gaussian model?
4. Can the "conservation of weirdness" claim be made precise as a tradeoff between residual norm and entropy under fixed regulator effort?
5. In Pareto selection rather than scalarized selection, when does the selected distribution compress enough to break identifiability of unmeasured dimensions?
6. What selection-response operator should replace `b_H(t)` for soft optimization, repeated selection, or adversarial adaptation?
7. Which weak dependence assumptions, if any, make covariance ratios adequate approximations to threshold response curves?
8. How should the framework represent policies that change the baseline distribution `mu`, rather than merely reweighting it?
9. For repeated Boltzmann selection, when does integrating `Cov_beta(H, P)` along the path yield closed-form or bounded hidden drift?
10. For an intervention channel, what is the analogue of the selection-channel bound `||B_H|| <= delta · ||s||`? Conjecture: it factors through the agents' cost geometry (a "gaming budget"), not through any divergence from `mu_0`. Can this be stated for general convex gaming costs, not just quadratic?
11. Stackelberg gaming toy with endogenous `V` (selection is valuable only if the metric is trusted; trust decays as gaming is observed): does the regulator-agent game have a performative-stable fixed point, and does it still carry hidden harm at the fixed point?
12. Which agent models keep an intervention channel inside the selection class (only-toggle-inclusion is one)? Is "agents cannot change `(P, H)` at fixed type" the exact condition, or are there subtler intermediate cases (e.g. agents can change `P` but `H` is pinned)?
13. Multidimensional gaming: with proxy vector `P in R^k` and per-component gaming costs, does balloon-squeezing reappear — gaming one component cheaply displaces effort/harm into the component the regulator next starts measuring? This is where the intervention thread should rejoin the dimensional thread.
