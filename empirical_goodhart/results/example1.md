# Example 1 results: best-of-n selection, tail-thickness knob

## Static analysis (certificates and refusals per declaration)

### declaration: moments_only
```
REFUSAL    any drift bound on hidden coordinates -- no optimization-pressure declaration (neither best_of_n nor a divergence budget delta) (missing declaration: policy exposure: best_of_n or chi^2 budget delta)
```

### declaration: pressure_and_moments
```
CERTIFICATE delta(best-of-4096) = 45.2465 [chi^2 of best-of-n reweighting (closed form)] selection intensity delta = sqrt(n^2/(2n-1) - 1); distribution-free for continuous scores; conditions: pure selection: K_theta = K_0; i.i.d. candidates, continuous score (no ties)
CERTIFICATE T1-drift-bound[V] = 45.2465 [T1 (research/core-math.md)] |E_theta[V] - E_0[V]| <= delta * sd = 45.25 * 1; conditions: worst case over all couplings of the hidden coordinate with the selected score; valid at every n, but blind to coupling shape
REFUSAL    shape of the realized-value curve E[hidden | selected] as pressure grows (monotone growth vs plateau/decline) -- the chi^2 certificate is tail-blind: identical declared moments yield identical bounds for light- and heavy-tailed noise while the true curves diverge (missing declaration: coupling_tail (relation of noise tail to hidden tail))
```

### declaration: full_A
```
CERTIFICATE delta(best-of-4096) = 45.2465 [chi^2 of best-of-n reweighting (closed form)] selection intensity delta = sqrt(n^2/(2n-1) - 1); distribution-free for continuous scores; conditions: pure selection: K_theta = K_0; i.i.d. candidates, continuous score (no ties)
CERTIFICATE T1-drift-bound[V] = 45.2465 [T1 (research/core-math.md)] |E_theta[V] - E_0[V]| <= delta * sd = 45.25 * 1; conditions: worst case over all couplings of the hidden coordinate with the selected score; valid at every n, but blind to coupling shape
CERTIFICATE tail-regime[favorable] [regressional-Goodhart tail analysis (Thomas-Kwa regime classification; qualitative)] E[hidden | argmax proxy] is expected to keep growing with pressure: extreme proxy values are explained by the hidden coordinate, not the noise; conditions: additive noise model U = V + eps; declared: eps tail lighter than V tail; qualitative regime claim, not a rate
```

### declaration: full_BC
```
CERTIFICATE delta(best-of-4096) = 45.2465 [chi^2 of best-of-n reweighting (closed form)] selection intensity delta = sqrt(n^2/(2n-1) - 1); distribution-free for continuous scores; conditions: pure selection: K_theta = K_0; i.i.d. candidates, continuous score (no ties)
CERTIFICATE T1-drift-bound[V] = 45.2465 [T1 (research/core-math.md)] |E_theta[V] - E_0[V]| <= delta * sd = 45.25 * 1; conditions: worst case over all couplings of the hidden coordinate with the selected score; valid at every n, but blind to coupling shape
CERTIFICATE tail-regime[catastrophic] [regressional-Goodhart tail analysis (Thomas-Kwa regime classification; qualitative)] E[hidden | argmax proxy] is expected to plateau and fall back toward the baseline mean as pressure grows: the argmax is eventually a pure noise outlier; conditions: additive noise model U = V + eps; declared: eps tail heavier than V tail; qualitative regime claim, not a rate
```

## Empirical curves: E[V of winner] vs n

| n | T1 bound | analytic A | A gaussian | B t4 (sd=1) | C t2 (inf var) |
|--:|--:|--:|--:|--:|--:|
| 1 | 0.000 | -0.000 | 0.004 | 0.003 | 0.009 |
| 2 | 0.577 | 0.399 | 0.406 | 0.415 | 0.314 |
| 4 | 1.134 | 0.728 | 0.730 | 0.766 | 0.553 |
| 8 | 1.807 | 1.007 | 1.011 | 1.023 | 0.687 |
| 16 | 2.694 | 1.249 | 1.249 | 1.212 | 0.688 |
| 32 | 3.906 | 1.463 | 1.471 | 1.328 | 0.609 |
| 64 | 5.590 | 1.657 | 1.653 | 1.360 | 0.464 |
| 128 | 7.953 | 1.835 | 1.833 | 1.330 | 0.336 |
| 256 | 11.281 | 1.999 | 2.003 | 1.234 | 0.245 |
| 512 | 15.977 | 2.152 | 2.152 | 1.087 | 0.165 |
| 1024 | 22.611 | 2.297 | 2.291 | 0.930 | 0.121 |
| 2048 | 31.988 | 2.434 | 2.432 | 0.773 | 0.087 |
| 4096 | 45.247 | 2.564 | 2.562 | 0.631 | 0.057 |

(Monte Carlo, 40000 reps per cell; SEs ~0.005 or below.)

## Checks

- [x] T1 bound holds for A_gaussian — []
- [x] T1 bound holds for B_t4_unitvar — []
- [x] T1 bound holds for C_t2_infvar — []
- [x] analytic Gaussian curve matches MC (max |dev| in SEs) — 2.02
- [x] variant A still gaining from n=256 to n=4096 — 0.5591
- [x] variant B flat-or-falling on the same range — -0.6026
- [x] variant C falling on the same range — -0.187
- [x] certificate identical for A and B (tail-blind) — same declared moments => same delta(n)*sd
