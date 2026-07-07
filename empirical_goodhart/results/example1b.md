# Example 1b results: KL-route certificate, tightness witness

Exponential tilt of N(0,1) by e^{tV}: mu_theta = N(t,1), KL = t^2/2, true drift = t.

| t | KL | KL cert (sigma*sqrt(2KL)) | MC drift | chi^2 (T1) bound |
|--:|--:|--:|--:|--:|
| 0.25 | 0.031 | 0.2500 | 0.2496 | 0.254 |
| 0.5 | 0.125 | 0.5000 | 0.4995 | 0.533 |
| 1.0 | 0.500 | 1.0000 | 1.0013 | 1.311 |
| 1.5 | 1.125 | 1.5000 | 1.5011 | 2.913 |
| 2.0 | 2.000 | 2.0000 | 2.0000 | 7.321 |
| 3.0 | 4.500 | 3.0000 | 2.9984 | 90.012 |

## Sample analyzer output (t=0.25)
```
REFUSAL    chi^2-route drift bound for 'V' -- only a KL budget is declared, and KL does not upper-bound chi^2, so the T1 route is unavailable (missing declaration: chi^2 budget delta (or best_of_n))
CERTIFICATE KL-drift-bound[V] = 0.25 [transportation lemma / Donsker-Varadhan variational formula (standard, see e.g. Boucheron-Lugosi-Massart 2013; adopted machinery)] |E_theta[V] - E_0[V]| <= sigma * sqrt(2 KL) = 1 * sqrt(2 * 0.03125); conditions: 'V' declared 1-subgaussian under mu_0 (strictly stronger than a declared sd); valid for ANY mu_theta with KL(mu_theta||mu_0) within budget, selection or not
REFUSAL    regime of E[goal | selected] as pressure grows (No/Benign/Weak/Strong Goodhart) -- the chi^2 certificate is tail-blind: identical declared moments yield identical bounds for light- and heavy-tailed noise while the true curves diverge (missing declaration: goal_tail and noise_tail declarations)
```

Refusal path (KL budget, finite variance only):
```
REFUSAL    chi^2-route drift bound for 'V' -- only a KL budget is declared, and KL does not upper-bound chi^2, so the T1 route is unavailable (missing declaration: chi^2 budget delta (or best_of_n))
REFUSAL    KL-route drift bound for 'V' -- a KL budget is declared but the coordinate is only declared finite-variance; the KL route prices in subgaussianity (declaration strength trades against conclusion strength) (missing declaration: subgaussian_sigma['V'])
REFUSAL    regime of E[goal | selected] as pressure grows (No/Benign/Weak/Strong Goodhart) -- the chi^2 certificate is tail-blind: identical declared moments yield identical bounds for light- and heavy-tailed noise while the true curves diverge (missing declaration: goal_tail and noise_tail declarations)
```

## Checks

- [x] t=0.25: KL certificate = true drift (equality witness) — cert=0.2500, MC drift=0.2496
- [x] t=0.25: chi^2 route valid but looser (>= KL route) — chi2 bound=0.254
- [x] t=0.5: KL certificate = true drift (equality witness) — cert=0.5000, MC drift=0.4995
- [x] t=0.5: chi^2 route valid but looser (>= KL route) — chi2 bound=0.533
- [x] t=1.0: KL certificate = true drift (equality witness) — cert=1.0000, MC drift=1.0013
- [x] t=1.0: chi^2 route valid but looser (>= KL route) — chi2 bound=1.311
- [x] t=1.5: KL certificate = true drift (equality witness) — cert=1.5000, MC drift=1.5011
- [x] t=1.5: chi^2 route valid but looser (>= KL route) — chi2 bound=2.913
- [x] t=2.0: KL certificate = true drift (equality witness) — cert=2.0000, MC drift=2.0000
- [x] t=2.0: chi^2 route valid but looser (>= KL route) — chi2 bound=7.321
- [x] t=3.0: KL certificate = true drift (equality witness) — cert=3.0000, MC drift=2.9984
- [x] t=3.0: chi^2 route valid but looser (>= KL route) — chi2 bound=90.012
- [x] chi^2 bound exponentially vacuous at t=3.0 (ratio > 20x) while KL stays tight — ratio=30x
- [x] sd-only declaration refuses the KL route — refusal emitted
