# Lit-review notes

This folder consolidates the literature-review material for the
multidimensional-Goodhart project. It feeds two book-integration tracks:

- **Chapter 2** (early lit-review chapter): genealogy + Manheim–Garrabrant
  typology + scalar anchor proposition.
- **Late formal-analogue chapter** (per `plans/formal-analogue.md`):
  primitive maps from ML and economics analogues.

Triage discipline: every source is tagged `load-bearing`, `analogue`,
`genealogy`, or `non-transferable`. No source enters the framework unless
it maps to a primitive (selection / response-kernel / action-cost /
proxy-target / aggregation / evidence-standard).

## Index

| File | Source / role | Triage |
| --- | --- | --- |
| `ml_formal_analogue_survey.md` | Codex Iteration 22 ML survey: model selection, adaptive holdout, leaderboard, strategic classification, performative prediction, Skalse 2022 reward hacking, Pan, Gao. Mapping table in §3. | `analogue` (per row) |
| `gemini_formal_mathematical_statements_of_goodharts_law.md` | Gemini deep research Prompt 1: scalar formal Goodhart math. Recommends El-Mhamdi & Hoang 2024 as anchor; surveys Smith–Winkler 2006, Manheim–Garrabrant 2018, Gao et al. 2022, Majka–El-Mhamdi 2025. | Mixed (see disambiguation below) |
| `gemini_multidimensional_generalization_of_goodharts_law_primary_source_survey.md` | Gemini deep research Prompt 2: genealogy + canonical statement. Surfaces Skalse et al. 2023 as canonical; produces structured genealogy table for Goodhart 1975, Campbell 1976/1979, Strathern 1997, Lucas 1976. | Mixed (see disambiguation below) |

## Triage assignments (initial; verified per source as Stage 1c proceeds)

| Source | Triage | Notes |
| --- | --- | --- |
| El-Mhamdi & Hoang 2024 (arXiv:2410.09638) | `load-bearing` (anchor candidate) | Scalar bounds with tail-distribution dependence; Theorems 1 and 4 verified via WebFetch. |
| Skalse et al. 2023 (arXiv:2310.09144, "Goodhart's Law in RL") | `load-bearing` (anchor candidate) or `analogue` | RL-specific angle-bound early stopping; Theorem 1 verified via WebFetch. |
| Manheim & Garrabrant 2018 (arXiv:1803.04585) | `genealogy` source; correspondence promoted | Theorem-free as a source, but its four variants are mapped to the book's two channels (selection/intervention) in `research/reviews/mg_taxonomy_correspondence.md` and the book subsection "The four variants by channel". |
| Goodhart 1975 | `genealogy` | Informal macroeconomic claim. |
| Campbell 1976/1979 | `genealogy` | Social-science empirical generalization. |
| Strathern 1997 | `genealogy` | Anthropological aphorism. |
| Lucas 1976 | `analogue` | Only genealogy item with formal status; rational-expectations assumption. |
| Smith & Winkler 2006 (Optimizer's Curse) | `analogue` (optional Chapter 2 mention) | Precursor inequality on bias of the maximum. |
| Demski & Garrabrant 2019 | Pending verification | Cited by El-Mhamdi as "DG19". |
| Majka & El-Mhamdi 2025 (arXiv:2505.23445) | `analogue` if book Chapter 3 assumes independence | Independence-free extension of El-Mhamdi 2024. |
| Codex's ML survey rows | `analogue` (per row, retained from §3 of `ml_formal_analogue_survey.md`) | Adaptive holdout, leaderboard, strategic classification, performative prediction, Skalse 2022 reward hacking, Pan, Gao. |

## Disambiguation: two Skalse papers

The author **Joar Skalse** has two distinct Goodhart-relevant papers, both
cited in this folder:

- **Skalse et al. 2022** (arXiv:2209.13085, "Defining and Characterizing
  Reward Hacking"). Cited by Codex's ML survey under "Formal reward gaming /
  unhackability." Defines reward hacking and characterizes strong
  unhackability conditions. `analogue`.
- **Skalse et al. 2023** (arXiv:2310.09144, "Goodhart's Law in Reinforcement
  Learning"). Surfaced by Gemini Prompt 2. RL-specific angle-bound early
  stopping criterion in occupancy-measure space. `load-bearing` (anchor
  candidate) or `analogue` depending on the Chapter 2 anchor decision.

Do not conflate.

## Conventions

- Gemini outputs are immutable source material; do not edit. Triage tags
  live in this README, not in the source files.
- Verification notes for sources not already verified live in new files
  named `verify_<source-key>.md` (created in Stage 1c).
- The canonical synthesis artifact will live at
  `research/reviews/formal_analogue_lit_map.md` (created in Stage 3 per
  `plans/lit-review.md`), not inside this folder.
