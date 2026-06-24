# Task 02 — Discover prior art: economics / management side

**Objective.** Comprehensively discover the prior art that contains the same math
in the **social-science** fields — economics, accounting, management/organization
science, welfare, public finance — explicitly **outside ML**. Produce the full
"should-be-cited" set for this side, far beyond the current T5/congruity slice.

**Depends on:** none (parallel with 01, 03). **Blocks:** 04, 08.

**Why it matters.** The paper's premise is "the prior art already exists
elsewhere." Prior hunts targeted one result (exchange-rate congruity). We need
the *whole* landscape, or the synthesis is incomplete and the "what AI can learn"
section is thin. This is a token-heavy, multi-LLM task — spend freely.

## Inputs
- `../citation-audit/audit.md` ("should-be-cited" seed set + reverse sweep).
- `../../research/threads/lit_review/looking-for-exchange-rate-results/README.md`
  (the T5 verdict — build on it; do not re-derive).

## Protocol
Sweep each subfield to saturation, using **both** the proven adversarial harness
(optimistic + pessimistic prompts × ChatGPT/Claude/Gemini — hand to the user,
store raw) **and** autonomous web/API sweeps:
- **Contract theory / personnel economics:** multitask agency (Holmström–Milgrom
  1991), incentive distortion (Baker 1992/2002), congruity (Feltham–Xie 1994),
  Datar–Kulp–Lambert 2001, Budde 2007, Schnedler, Prendergast 1999, Gibbons 1998,
  Bénabou–Tirole 2016, Courty–Marschke 2004, Holmström 1979/2017, Lazear.
- **Accounting (performance measurement):** congruity/incongruity, balanced-
  scorecard critiques, earnings management / target gaming.
- **Public finance:** sufficient statistics (Chetty 2009), excess burden,
  Feldstein 1999, elasticity of taxable income / gaming, notch/bunching.
- **Welfare economics:** theory of the second best (Lipsey–Lancaster 1956),
  theory of reform.
- **Environmental / corrective-tax:** Reynaert–Sallee 2016, Baumol–Oates,
  Montgomery 1972, notched-policy gaming (Sallee, Kleven).
- **Management / org science & social measurement:** Ridgway 1956, Kerr 1975,
  Campbell 1976/1979, Strathern 1997, performance-management dysfunction lit.
- **Signaling / contest theory (lower-tier T3 home):** Spence 1973 job-market
  signaling, contest / all-pay auction theory, costly threshold-crossing.
  (Strategic classification is the *AI-side* parallel — discover it in task 01.)

For each result found: record the **statement it makes** and a **preliminary
mapping** to the book theorem / AI result it parallels (including the lower-tier
theorems — this discovery feeds Track A's `litrev-lower-tier.md`).

## Output
`../citation-audit/discovery-prior-art-econ.md`: per-subfield list (result ·
statement · preliminary mapping · source) + an explicit saturation note. Raw
multi-LLM passes under `../citation-audit/prior-art-hunt/`.

## Done criteria
- Each subfield swept to saturation; set substantially beyond audit.md's list.
- Preliminary mappings recorded (verification is task 08).

## Guardrails
- **Discovery + preliminary mapping only** — primary-source verification is task 08.
- Deliberately push past the T5/congruity slice; the point is breadth.
