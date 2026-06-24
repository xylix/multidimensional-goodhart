# Task 04 — Forward-citation census (quantitative reverse sweep)

**Objective.** For each economics prior-art paper, get its full citing set, count
how many citers are AI/CS, and name every alignment paper among them. This is the
quantitative backbone of the "localized gap" claim.

**Depends on:** none (can run early). Feeds 05 (seeds) and 08. **Best paired with**
the corpus from 01 for the cross-check in step 3.

**Why it matters.** Lets the paper say precise things: "Feltham–Xie has 949
citers; 0 are AI-safety," and "HM1991's only alignment citers are the CHAI
lineage." Turns impressions into counts.

## Inputs
- `../citation-audit/audit.md` (the reverse-sweep seed results + should-be-cited set).

## Protocol
1. **Econ set to census:** Feltham–Xie 1994, Baker 1992, Baker 2002, HM1991,
   Holmström 1979, Holmström 2017, Datar–Kulp–Lambert 2001, Chetty 2009,
   Feldstein 1999, Lipsey–Lancaster 1956, Reynaert–Sallee 2016, Baumol–Oates,
   Ridgway 1956, Kerr 1975, Prendergast 1999, Gibbons 1998, Courty–Marschke 2004,
   Bénabou–Tirole 2016.
2. For each: resolve the OpenAlex (and S2 if available) ID; pull `cited_by_count`;
   group citers by field; **hand-inspect every CS/AI-tagged citer title** (the
   OpenAlex CS tag is broad — it includes information systems / agency modelling,
   so the raw count overstates AI relevance). Record total / CS count / named
   genuine alignment citers, with the query and date.
3. **Cross-check against the corpus.** Are any corpus papers (task 01) in these
   citing sets? This catches cross-citations the forward coding might have missed
   and reconciles the two directions.

## Output
`../citation-audit/forward-census.md`: one row per econ paper (total · CS-tagged ·
genuine-alignment citers, named) + the corpus cross-check + recorded queries.

## Done criteria
- Every econ paper has auditable counts and a named list of any alignment citers.
- Reconciled with the forward corpus coding (no contradictions).

## Guardrails
- Hand-verify CS-tagged citers; do not trust raw field counts.
- Record the API, query, and date for reproducibility (counts drift over time).
