# Example 1 results: best-of-n selection, tail-thickness knob

## Static analysis (certificates and refusals per declaration)

### declaration: moments_only
```
REFUSAL    any drift bound on hidden coordinates -- no optimization-pressure declaration (best_of_n, chi^2 budget delta, or KL budget) (missing declaration: policy exposure: best_of_n, delta, or kl_budget)
```

### declaration: pressure_and_moments
```
CERTIFICATE delta(best-of-4096) = 45.2465 [chi^2 of best-of-n reweighting (closed form)] selection intensity delta = sqrt(n^2/(2n-1) - 1) and KL = log n - (n-1)/n; distribution-free for continuous scores; conditions: pure selection: K_theta = K_0; i.i.d. candidates, continuous score (no ties)
CERTIFICATE T1-drift-bound[V] = 45.2465 [T1 (research/core-math.md)] |E_theta[V] - E_0[V]| <= delta * sd = 45.25 * 1; conditions: worst case over all couplings of the hidden coordinate with the selected score; valid at every n, but blind to coupling shape
CERTIFICATE KL-drift-bound[V] = 3.82571 [transportation lemma / Donsker-Varadhan variational formula (standard, see e.g. Boucheron-Lugosi-Massart 2013; adopted machinery)] |E_theta[V] - E_0[V]| <= sigma * sqrt(2 KL) = 1 * sqrt(2 * 7.318); conditions: 'V' declared 1-subgaussian under mu_0 (strictly stronger than a declared sd); valid for ANY mu_theta with KL(mu_theta||mu_0) within budget, selection or not
REFUSAL    regime of E[goal | selected] as pressure grows (No/Benign/Weak/Strong Goodhart) -- the chi^2 certificate is tail-blind: identical declared moments yield identical bounds for light- and heavy-tailed noise while the true curves diverge (missing declaration: goal_tail and noise_tail declarations)
```

### declaration: full_A
```
CERTIFICATE delta(best-of-4096) = 45.2465 [chi^2 of best-of-n reweighting (closed form)] selection intensity delta = sqrt(n^2/(2n-1) - 1) and KL = log n - (n-1)/n; distribution-free for continuous scores; conditions: pure selection: K_theta = K_0; i.i.d. candidates, continuous score (no ties)
CERTIFICATE T1-drift-bound[V] = 45.2465 [T1 (research/core-math.md)] |E_theta[V] - E_0[V]| <= delta * sd = 45.25 * 1; conditions: worst case over all couplings of the hidden coordinate with the selected score; valid at every n, but blind to coupling shape
CERTIFICATE KL-drift-bound[V] = 3.82571 [transportation lemma / Donsker-Varadhan variational formula (standard, see e.g. Boucheron-Lugosi-Massart 2013; adopted machinery)] |E_theta[V] - E_0[V]| <= sigma * sqrt(2 KL) = 1 * sqrt(2 * 7.318); conditions: 'V' declared 1-subgaussian under mu_0 (strictly stronger than a declared sd); valid for ANY mu_theta with KL(mu_theta||mu_0) within budget, selection or not
CERTIFICATE regime[benign] [Majka & El-Mhamdi 2025 (arXiv 2505.23445), Lemma 4.1; El-Mhamdi & Hoang 2024 (arXiv 2410.09638)] Benign Goodhart: correlation between goal and proxy dies under optimization but E[G|M>m] still -> sup, with Gaussian slope (a+c)/(a+b+2c); conditions: proven for jointly Gaussian (G, eps) with Var(G) > Var(eps); boundary/equal-variance cases via the same slope formula, checked empirically here; taxonomy defined for threshold conditioning M > m, m -> sup; a best-of-n winner concentrates in the same upper tail as n grows (correspondence, not identity)
```

### declaration: full_BC
```
CERTIFICATE delta(best-of-4096) = 45.2465 [chi^2 of best-of-n reweighting (closed form)] selection intensity delta = sqrt(n^2/(2n-1) - 1) and KL = log n - (n-1)/n; distribution-free for continuous scores; conditions: pure selection: K_theta = K_0; i.i.d. candidates, continuous score (no ties)
CERTIFICATE T1-drift-bound[V] = 45.2465 [T1 (research/core-math.md)] |E_theta[V] - E_0[V]| <= delta * sd = 45.25 * 1; conditions: worst case over all couplings of the hidden coordinate with the selected score; valid at every n, but blind to coupling shape
CERTIFICATE KL-drift-bound[V] = 3.82571 [transportation lemma / Donsker-Varadhan variational formula (standard, see e.g. Boucheron-Lugosi-Massart 2013; adopted machinery)] |E_theta[V] - E_0[V]| <= sigma * sqrt(2 KL) = 1 * sqrt(2 * 7.318); conditions: 'V' declared 1-subgaussian under mu_0 (strictly stronger than a declared sd); valid for ANY mu_theta with KL(mu_theta||mu_0) within budget, selection or not
CERTIFICATE regime[weak] [El-Mhamdi & Hoang 2024 (arXiv 2410.09638), subsumed in Majka & El-Mhamdi 2025 (arXiv 2505.23445) Table 2] Weak Goodhart: E[G|M>m] is eventually bounded below sup and reverts toward the baseline mean — over-optimizing the proxy becomes useless (not harmful) for the goal; worsens with discrepancy tail thickness; conditions: independence of goal and discrepancy declared; taxonomy defined for threshold conditioning M > m, m -> sup; a best-of-n winner concentrates in the same upper tail as n grows (correspondence, not identity)
```

### declaration: BC_dependence_undeclared
```
CERTIFICATE delta(best-of-4096) = 45.2465 [chi^2 of best-of-n reweighting (closed form)] selection intensity delta = sqrt(n^2/(2n-1) - 1) and KL = log n - (n-1)/n; distribution-free for continuous scores; conditions: pure selection: K_theta = K_0; i.i.d. candidates, continuous score (no ties)
CERTIFICATE T1-drift-bound[V] = 45.2465 [T1 (research/core-math.md)] |E_theta[V] - E_0[V]| <= delta * sd = 45.25 * 1; conditions: worst case over all couplings of the hidden coordinate with the selected score; valid at every n, but blind to coupling shape
REFUSAL    KL-route drift bound for 'V' -- a KL budget is declared but the coordinate is only declared finite-variance; the KL route prices in subgaussianity (declaration strength trades against conclusion strength) (missing declaration: subgaussian_sigma['V'])
CERTIFICATE regime[strong-not-excluded] [Majka & El-Mhamdi 2025 (arXiv 2505.23445), section 4.4] Strong Goodhart cannot be excluded: with an adverse dependence structure between goal and heavy-tailed discrepancy, E[G|M>m] -> inf (exhibited for an exponential goal; worsens with discrepancy tail LIGHTNESS in that construction). Under declared independence this downgrades to Weak.; conditions: worst-case possibility claim, not a prediction; dependence undeclared or unrestricted; taxonomy defined for threshold conditioning M > m, m -> sup; a best-of-n winner concentrates in the same upper tail as n grows (correspondence, not identity)
```

## Empirical curves: E[V of winner] vs n

| n | chi2 (T1) bound | KL bound | analytic A | A gaussian | B t4 (sd=1) | C t2 (inf var) |
|--:|--:|--:|--:|--:|--:|--:|
| 1 | 0.000 | 0.000 | -0.000 | 0.004 | 0.003 | 0.009 |
| 2 | 0.577 | 0.622 | 0.399 | 0.406 | 0.415 | 0.314 |
| 4 | 1.134 | 1.128 | 0.728 | 0.730 | 0.766 | 0.553 |
| 8 | 1.807 | 1.552 | 1.007 | 1.011 | 1.023 | 0.687 |
| 16 | 2.694 | 1.916 | 1.249 | 1.249 | 1.212 | 0.688 |
| 32 | 3.906 | 2.235 | 1.463 | 1.471 | 1.328 | 0.609 |
| 64 | 5.590 | 2.520 | 1.657 | 1.653 | 1.360 | 0.464 |
| 128 | 7.953 | 2.778 | 1.835 | 1.833 | 1.330 | 0.336 |
| 256 | 11.281 | 3.016 | 1.999 | 2.003 | 1.234 | 0.245 |
| 512 | 15.977 | 3.237 | 2.152 | 2.152 | 1.087 | 0.165 |
| 1024 | 22.611 | 3.445 | 2.297 | 2.291 | 0.930 | 0.121 |
| 2048 | 31.988 | 3.640 | 2.434 | 2.432 | 0.773 | 0.087 |
| 4096 | 45.247 | 3.826 | 2.564 | 2.562 | 0.631 | 0.057 |

(Monte Carlo, 40000 reps per cell; SEs ~0.005 or below.)

## Checks

- [x] T1 bound holds for A_gaussian — []
- [x] KL bound holds for A_gaussian — []
- [x] T1 bound holds for B_t4_unitvar — []
- [x] KL bound holds for B_t4_unitvar — []
- [x] T1 bound holds for C_t2_infvar — []
- [x] KL bound holds for C_t2_infvar — []
- [x] KL bound tighter than chi^2 bound for all n >= 4 — at n=4096: 3.83 vs 45.25
- [x] KL bound within 2x of the true curve at n=4096 (A) — 1.49
- [x] analytic Gaussian curve matches MC (max |dev| in SEs) — 2.02
- [x] declared variant A maps to regime[benign] — regime[benign]
- [x] declared variants B/C (independent) map to regime[weak] — regime[weak]
- [x] dependence-undeclared B/C maps to strong-not-excluded — regime[strong-not-excluded]
- [x] variant A still gaining from n=256 to n=4096 — 0.5591
- [x] variant B flat-or-falling on the same range — -0.6026
- [x] variant C falling on the same range — -0.187
- [x] variant C reverts toward baseline mean 0 (weak, not strong: no descent toward inf) — 0.057
- [x] moment-route certificates identical for A and B (tail-blind) — same declared moments => same delta(n)*sd
