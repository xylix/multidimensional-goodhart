Note for LLMs: Don't start implementing these ideas without confirming with user first
    - If you have done some similar work already, feel free to contextualize with that when asking for permission.



## Note: spectral / basis decomposition of error

Three different decompositions, each giving different information — keep distinct:

1. **SVD of φ.** $\varphi = U\Sigma V^T$. Right singular vectors are G-directions φ distinguishes; small singular values = near-kernel = structural blind spots. Decomposes the dimension gap.
2. **Covariance of ε.** Eigendecomposition gives principal directions of measurement noise. Decomposes the observation gap.
3. **Selection-induced shift on G.** Compare dist(G(s)) before vs after restricting to selected set A. Directions of largest shift are where selection bites. Most diagnostic of actual Goodhart, least obvious to compute.

The bad-case Goodhart corner: where φ has small singular value (low signal), Σ_ε has component there (high noise), and selection-shift is large in that direction. Conjunction matters; any one alone is insufficient.

**Clustering regime-dependent:** strong shared causation → low-rank Σ_ε, few dominant components. Many independent failure modes → flat spectrum. Real systems likely heavy-tailed mix (dominant correlated directions + long tail of rare independent modes).

**Critical limitation:** PCA/SVD is value-neutral; Goodhart is value-laden. A huge principal component orthogonal to G's value structure is harmless. A tiny one aligned with a load-bearing G-dimension can dominate harm. Need to weight decomposition by value-importance (regulator's true utility gradient, or proxy for it).

**Adversarial:** strategic system can shape ε to lie in low-variance components of historical observation while remaining maximally goal-harmful. PCA-based detection is geometrically blind to value-aware adversaries.

**Productive direction:** joint decomposition of (φ, Σ_ε, selection-shift) under value-weighted inner product on G-space. Possible scalar: "Goodhart susceptibility per G-direction" = product of (value-importance) × (1/singular-value of φ) × (noise variance) × (selection-shift). Falsifiable, computable in toy models.

**Open:** whether the value-weighting requirement makes this a non-starter in practice, or whether reasonable proxies for value-importance recover useful structure.
