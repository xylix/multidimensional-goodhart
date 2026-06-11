# Could-do: RLHF identification experiment

Extracted June 11, 2026 from the executed empirics plan
(`archived/exchange-rate-empirics.md`) when that track closed.

RLHF (Gao et al. 2023 overoptimization, already in refs.bib) is the one
domain where the channel-level identification *design* is actually
feasible, because regime variation is free: vary reward-model weights
across runs and measure gold-reward loss by behavior category. The rank
condition from `research/threads/exchange_rate_identification.md` can be
satisfied on purpose — non-proportional weight vectors across runs give
full-column-rank action profiles, and the harm side (gold-reward loss) is
measurable per run, making this a genuine harm-side design rather than the
score-side regressions the HRRP/education literatures supply.

Experiment sketch, not book material. If executed, it would also be the
third domain testing the (n=2, tentative) cross-domain regularity from
`research/applications/education_evidence_mini_pass.md`: evidence shape,
not domain, predicts how far decomposition gets.
