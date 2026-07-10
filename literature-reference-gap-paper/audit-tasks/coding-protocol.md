# Task-06 coding protocol (shared by all coding agents)

You are coding AI/ML papers' reference lists against a fixed prior-art tier
scheme. RULE ZERO: never code from memory or training data — every cell must
come from a reference list you actually retrieved this session. A wrong ✓ is
worse than a flagged gap.

## Retrieval (per paper, in this order)
1. PRIMARY: Semantic Scholar API —
   `https://api.semanticscholar.org/graph/v1/paper/arXiv:<ID>/references?fields=title,year,authors&limit=1000`
   (WebFetch it; it returns JSON). Complete structured list. If HTTP 429, wait by
   doing another paper first, retry once; if still 429 use fallback 2.
2. FALLBACK: OpenAlex — resolve `https://api.openalex.org/works/https://doi.org/10.48550/arXiv.<ID>`
   then fetch the `referenced_works` (or use the `select=referenced_works` field);
   OR arXiv HTML `https://arxiv.org/html/<ID>` / `https://ar5iv.labs.arxiv.org/html/<ID>`
   and read the bibliography (WARNING: WebFetch may truncate long HTML — if you
   see truncation before/inside the bibliography, record completeness=PARTIAL).
3. Record per paper: access method + completeness (COMPLETE / PARTIAL / EMPTY).
   If everything fails: code the paper `n/a — no minable list` and say why.

## Tier scheme (code presence/absence in the REFERENCE LIST)
- **CONTRACT** — multitask principal-agent / accounting congruity: Holmström
  (1979; 1991 with Milgrom "Multitask principal-agent analyses"; 2016/2017 "Pay
  for Performance"), George Baker (1992 JPE "Incentive Contracts and Performance
  Measurement"; 2002 JHR "Distortion and Risk"), Feltham & Xie 1994,
  Datar–Kulp–Lambert 2001, Budde 2007, Schnedler, Hart & Moore, Grossman & Hart,
  Prendergast 1999, Gibbons 1998.
- **PUBFIN** — Raj Chetty 2009 "Sufficient Statistics for Welfare Analysis", Feldstein 1999.
- **2BEST** — Lipsey & Lancaster 1956 (second best).
- **CORRECT** — Reynaert & Sallee 2016, Baumol & Oates, Montgomery 1972.
- **MGMT** — Ridgway 1956, Kerr 1975 ("On the folly of rewarding A…"), Donald
  Campbell (1969 "Reforms as experiments" / 1979 "Assessing the impact…"),
  Strathern 1997.
- **ESTIM** — Hammersley 1950, Chapman & Robbins 1951, Cramér–Rao (cited as a
  bound), Ben-Tal et al. 2013 ("Robust solutions of optimization problems…"),
  Duchi & Namkoong / Namkoong & Duchi (any year), Rockafellar in the
  convex-duality/DRO sense (Rockafellar–Uryasev CVaR = borderline `~`),
  Tsybakov (asymptotic statistics). ANNOTATE every ESTIM hit: `tooling` (used as
  robust-training machinery) vs `prior-theory` (cited as the prior mathematics
  of a Goodhart/overoptimization bound) — decide from how the citing sentence
  uses it if visible; else write `role-unknown`.
- **Lucas** — Lucas 1976 (the Lucas critique).
- **Goodhart** — Goodhart 1975 or 1984 (the eponym itself).
- ANNOTATE any CONTRACT hit: branch = `perf-measurement` (multitask
  distortion/congruity use) vs `control` (off-switch / incomplete-contracting use).

## Name-collision rules (STRICT — these have produced false positives before)
- "B. Baker / Baker et al. 2019/2020/2025 (OpenAI, emergent tool use, monitoring)"
  = Bowen Baker ≠ George Baker → NOT CONTRACT.
- Nathan Lambert (RewardBench/RLHF) ≠ accounting Lambert (DKL 2001).
- Any ML "Xie" ≠ Feltham–Xie's Jim Xie (must be Feltham & Xie 1994, Accounting Review).
- "Campbell-Gillingham" (DeepMind) / Murray Campbell (Deep Blue) ≠ Donald Campbell.
- Marshini Chetty (privacy/HCI) ≠ Raj Chetty.
- "Goodhart" as mere word in a TITLE of a cited AI paper (e.g. citing
  Manheim–Garrabrant) does NOT count as the Goodhart-1975/1984 eponym tier.

## Output format (your ENTIRE final message = this, nothing else)
For each paper, exactly one table row:
`| <id> | <FirstAuthor Year> (<arXiv-id>) | <CONTRACT> | <PUBFIN> | <2BEST> | <CORRECT> | <MGMT> | <ESTIM> | <Lucas> | <Goodhart> |`
Cell values: `—` absent; `✓ <1-3 word detail>` present; `~ <detail>` borderline.
Then a `NOTES:` block: per paper one line `<id>: <method>, <completeness>, refs=<count>` plus, for EVERY ✓ or ~, the verbatim reference string (title+authors+year as retrieved). End with `ANOMALIES:` listing anything odd (wrong title at that ID, suspicious refs, etc.), or `ANOMALIES: none`.
