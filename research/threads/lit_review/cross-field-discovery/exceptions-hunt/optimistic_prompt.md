# Task 04 exceptions hunt — OPTIMISTIC prompt (the fields ARE connected)

> **For the user to run on ChatGPT, Claude, and Gemini deep research.** Save each
> raw result as `{chatgpt,claude,gemini}_optimistic.md` in this folder. The
> *spread* across models and across the optimistic/pessimistic pair is the signal,
> not the consensus. Paste verbatim; do not edit the model output.

---

ROLE

You are a connection-mapping research librarian. My prior assumption is that the
AI-safety / machine-learning literature on **Goodhart's law, reward hacking, and
reward-model overoptimization** is *already well connected* to the older
economics, accounting, and statistics literature that contains the same
mathematics. Your job is to **surface every instance of that cross-pollination** —
every AI/ML/alignment paper that cites the prior art below, and especially any
that connects it to a *formal* proxy-vs-true-objective (Goodhart) result. Returning
"I found very few connections" is the disappointing outcome here; work hard to find
the bridges before concluding they are sparse.

THE TWO SIDES

**AI side (the citing literature I care about):** formal Goodhart's-law papers
(Manheim–Garrabrant 2018; El-Mhamdi & Hoang 2024; Skalse et al. 2022 reward
hacking; Karwowski/Skalse 2023; Kwa et al. "Catastrophic Goodhart" 2024), reward
hacking / specification gaming, reward-model overoptimization / RLHF (Gao–Schulman–
Hilton 2023; Coste 2023; Moskovitz 2023; Rafailov 2024; Laidlaw 2024), inverse
reward design / reward learning, and surveys of the above.

**Prior art (the cited-or-not classical math), by branch — name these explicitly
in your searches:**
- *Contract theory / accounting (congruity / distortion):* Holmström–Milgrom 1991
  (multitask); Baker 1992, Baker 2002 (distortion = 1 − cosθ); Feltham–Xie 1994
  (performance-measure **congruity**, the proportionality condition); Banker–Datar
  1989 (optimal linear aggregation weights); Datar–Kulp–Lambert 2001; Bénabou–
  Tirole 2016 ("Bonus Culture"); Holmström 1979 (informativeness principle);
  Şabac–Yoo (sufficient aggregation).
- *Public finance:* Chetty 2009 (sufficient statistics for welfare; "is the taxable
  income elasticity sufficient"); Feldstein 1999.
- *Welfare / corrective policy:* Lipsey–Lancaster 1956 (second best); Reynaert–
  Sallee 2016 ("Corrective Policy and **Goodhart's Law**").
- *Estimation / DRO:* Hammersley–Chapman–Robbins inequality; Cramér–Rao; Ben-Tal
  et al. 2013 (χ²-divergence DRO); Namkoong–Duchi 2017 (variance regularization =
  χ²-DRO); Lam robust sensitivity.
- *Management / social measurement (the genealogy):* Ridgway 1956; Kerr 1975;
  Campbell 1979; Strathern 1997.

YOUR TASK

Find and list **every** AI/ML/alignment paper you can that cites any item above.
For each connection report:
1. Citing paper (title, authors, year, venue/arXiv id).
2. Which prior-art item(s) it cites.
3. **Crucially: does it connect that result to a *formal* Goodhart / reward-
   overoptimization / proxy-vs-true-objective result, or does it cite it only in
   passing / for a different purpose (control, off-switch, agency, genealogy/
   folklore)?** Quote the citing sentence if you can.
4. How deep the engagement is: re-derives the math? restates the theorem? names it
   only? eponym only?

KNOWN BRIDGES (the floor — go BEYOND these; do not just return these)
- CHAI / Berkeley (Hadfield-Menell, Russell): CIRL 2016, Off-Switch Game 2017 cite
  Holmström–Milgrom 1991 / Baker 2002 — but for control / incomplete-contracting,
  not Goodhart.
- John, Caldwell, McCoy, Braganza 2023, "Proxy failure" (Behavioral and Brain
  Sciences): cites Holmström 1979/2017, Baker 2002, Kerr 1975, Bénabou–Tirole 2016
  — but qualitatively, no formal theorem.
- Hendrycks et al. 2021 "Unsolved Problems in ML Safety": cites Ridgway 1956 at the
  genealogy tier.
- Wang & Huang 2026, arXiv:2603.28063, "Reward Hacking as Equilibrium under Finite
  Evaluation": instantiates Holmström–Milgrom 1991 + Baker 1992 and derives a
  distortion index — a formal contract-theory→Goodhart bridge.

Find any bridge NOT on this list. In particular hunt for any alignment/RLHF paper
that cites **Feltham–Xie congruity, Banker–Datar, Baker 2002 *for the distortion
geometry*, Chetty sufficiency, Chapman–Robbins, Ben-Tal/Namkoong–Duchi χ²-DRO, or
Reynaert–Sallee** and ties it to Goodhart / reward overoptimization. Strategic-
classification / performative-prediction papers (Hardt 2016, Perdomo 2020 lineage)
are a *distinct* community — note them separately; they are not the AI-safety
reward-hacking corpus.

DELIVERABLE

A table of all connections found, ranked by depth of engagement (formal bridge
first, eponym-only last). Then a short paragraph: given everything you found, how
connected ARE these two literatures at the level of the *math* (not the eponym)?
Name any bridge beyond the four known ones, with the exact citing context. If you
cannot find a given prior-art item cited by any AI-safety paper, **say so
explicitly and list the searches you ran**, so the negative is auditable.
