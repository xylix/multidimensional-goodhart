---

  # TASK: Validate agenda↔math correspondence claims (audit, no source edits)

  You are auditing a research repo on "multidimensional Goodhart." A prior analysis
  produced 12 claims mapping a research agenda onto the repo's actual math. Your job
  is to independently verify each claim at three layers (document / re-derivation /
  simulation) plus one external paper fetch, and write the results to a NEW file.

  **Deliverable:** create `plans/agenda-math-correspondence.md`. One section per claim
  (1–12 below), each with: (a) the claim as stated; (b) the repo math object;
  (c) document-layer result; (d) re-derivation result; (e) simulation result (or n/a);
  (f) final verdict — `confirmed` / `revised` / `refuted` — with correction if changed.

  **Hard constraint:** do NOT edit `research/core-math.md`, the book `.typ`, or the
  simulations. This is an audit that *reports* discrepancies. The only files you may
  write are `plans/agenda-math-correspondence.md` and (only for claims 11/12 outcome)
  a one-line cross-reference appended to the existing `O8` entry in
  `research/open_questions.md`.

  ---

  ## BACKGROUND: the agenda being checked

  "Track 1 — Goodhart geometry." Thesis: *optimizing a proxy displaces the proxy–target
  gap into unmeasured dimensions; iteration rotates error toward illegibility.*
  - **P1** "Where does the Goodhart error go?" — displacement claim, projection-onto-
    level-set + rotation intuition; commit one toy system.
  - **P2** formalize on Zhuang & Hadfield-Menell's L/J setup (state has L utility
    attributes, proxy supports J<L); selection vs intervention = two residual
    geometries; goal geometry (metric + cross-attribute correlations) sets
    displacement direction.
  - **P3** conservation condition + scorecard exchange rates (candidate theorem).
  - **P4** iteration = repeated project+patch → error accumulates in illegible
    subspace; Chesterton's fence falls out.
  - Excluded by the agenda: value K-complexity ("geometry yes, complexity no").
  - Refs: Zhuang & Hadfield-Menell 2020 (keystone); Manheim & Garrabrant; Skalse 2022;
    Gao/Schulman/Hilton; El-Mhamdi/Hoang ("Leo's papers").

  ## THE 12 CLAIMS TO VERIFY (prior analysis verdicts in brackets — confirm or correct)

  1. Thesis "displacement+rotation" = KILLED as a generic law. Src: `research/negative_results.md` Iter 1/5/6; `plans/spine.md` core answer.
  2. P1 displacement law = KILLED. Src: `negative_results.md` Iter 1 (no `dim ker φ` scaling), Iter 5 (re-routing doesn't cut harm; adding channels backfires).
  3. P1 toy already committed + the agenda's "stays metaphor" risk is RETIRED. Src: `research/core-math.md` T3–T6; existence + passing of `research/simulations/`.
  4. P2 selection vs intervention = `W_θ` (reweighting) vs `K_θ` (fixed-type response). Src: `core-math.md` stable defs; T1/T2 vs T3/T4.
  5. P2 "correlations set displacement direction" = KILLED as a general primitive. Src: `negative_results.md` Iter 2 (`H=Z²−1`, `Cov(H,P)=0` but `E[H|P≥t]>0`), Iter 3
  (Boltzmann tilt gives `E_β[H]−E[H]=β²` from zero baseline cov).
  6. P3 conservation = T5 `h_j = c w_j`, PROVEN, is the project's keeper. Src: `core-math.md` T5; book `book/multidimensional-goodhart.typ` Theorem 5 (~line 380); 
  `negative_results.md` Iter 6.
  7. P4 illegible-subspace iteration = KILLED unconditional / PARKED conditional (Q18). Src: `negative_results.md` Iter 7;
  `research/threads/minimum_complexity_attractor.md`; `research/claim_audits.md` Q18 row.
  8. P4 quadratic intervention gives DENSE drift `a* = dCw/(wᵀCw)` (concrete refutation of "rotation toward illegibility"). Src: `minimum_complexity_attractor.md` Toy calc
  1; `negative_results.md` Iter 7.
  9. Selection produces DIFFUSE drift ∝(1,…,1) in the `H_i = Z + ξ_i` example. Src: `minimum_complexity_attractor.md` §6.
  10. The agenda's "illegible" is a complexity claim in disguise (contradicts its own "Excluded: complexity" note). Src: `minimum_complexity_attractor.md` §1/§6
  (representation-dependence of complexity).
  11. Refs Manheim-Garrabrant / Skalse 2022 / Gao / "Leo"=El-Mhamdi-Hoang are present in the lit map; Z&HM is ABSENT from the whole repo. Src:
  `research/reviews/formal_analogue_lit_map.md`; `claim_audits.md`; grep the tree.
  12. The Z&HM characterization itself ("static below-baseline result over a J<L attribute subset") is accurate. Validate against the fetched paper.

  ---

  ## METHOD — run all three layers per applicable claim

  ### Layer A — document correspondence
  For each claim, open the cited file and confirm the statement/hypotheses/non-license
  clauses say what the claim asserts. For each KILLED verdict, confirm the cited
  counterexample contradicts the *generic* agenda form, not just a narrower variant.
  Confirm the book theorem blocks agree with `core-math.md` (theorem blocks are at
  roughly lines 299, 307, 339, 351, 380, 417 of `book/multidimensional-goodhart.typ`;
  search for `#theorem[` if shifted).

  ### Layer B — independent re-derivation (do NOT trust the stated results)
  Re-derive these from scratch; flag any discrepancy as a finding. A small
  Python+sympy/numpy script run via `uv run --with sympy --with numpy --with scipy`
  is the expected vehicle — write it under `/tmp`, do not commit it.
  - **T5 (claim 6):** minimize `Σ_j a_j²/(2κ_j)` s.t. `Σ_j w_j a_j ≥ d`. Confirm
    optimal harm `H_M(d) = d·(Σ_j h_j κ_j w_j)/(Σ_j κ_j w_j²)`, and that harm is
    conserved across active measured sets **iff** `h_j = c w_j` on active channels.
  - **T1 (claim 4):** `|B_{H_i}| ≤ δ·s_i` with `δ=‖L−1‖_{L²(μ_0)}`, `s_i=sd_{μ_0}(H_i)`,
    via Cauchy–Schwarz on `L−1 ∈ L²(μ_0)`. Confirm it is coordinate-*explicit*, not
    coordinate-free.
  - **Quadratic KKT (claim 8):** confirm `a* = dCw/(wᵀCw)` for PD `C`, that it is dense
    for generic PD `C` (refuting sparse/illegible attraction), and the sign-constraint
    failure at `C=I, w=(1,−1)` (unconstrained dir `(1,−1)` invalid under `a≥0`).
  - **Selection counterexamples (claim 5):** numerically confirm `H=Z²−1` gives
    `Cov(H,Z)=0` but `E[H|Z≥t]=t·λ(t)>0` (λ=Mills-ratio hazard), and that Boltzmann
  - **Diffuse selection drift (claim 9):** with `P=Z`, `H_i=Z+ξ_i` (`ξ_i` indep mean-0),
    confirm `E[H|P≥t]−E[H] ∝ (1,…,1)` (full support).

  ### Layer C — executable confirmation (existing sims)
  ``` 
  cd research/simulations && make run
  ```
  Needs `uv`. If `uv` is missing, record "not run — `uv` missing", do not skip silently.
  Map outputs: `iteration20_selection_intervention.py` → claims 4,5,8;
  `iteration21_population_active_sets.py` → claims 6,8;
  `iteration27_adaptive_hardening.py` → claim 3 (toy-computed half, T6 context);
  `iteration36_response_dynamics.py` → claim 7 (dynamic-toy boundary → PARKED not KILLED).
  Each sim self-labels which proposition/open-problem it exercises; capture the relevant
  printed lines as evidence.
  
  ### Layer D — Z&HM external fetch (claims 11, 12)
  Fetch Zhuang & Hadfield-Menell 2020, "Consequences of Misaligned AI" (NeurIPS 2020;
  arXiv 2102.03896 / search if needed). Validate: (a) it is the L-attribute,
  J<L-proxy-subset overoptimization setup; (b) whether the below-baseline result rests
  on an assumption this repo explicitly REFUSED — unconditional dimensional scaling,
  monotone/positive attribute coupling, or unbounded attributes. If yes, Z&HM is a
  **contrast class, not an anchor** (this is the fork recorded in `research/open_questions.md`
  entry `O8`). Append a one-line outcome cross-reference to the existing O8 entry.

  ---
  
  ## KEY REPO ANCHORS (so you know what "correct" looks like)

  `research/core-math.md` is the canonical theorem doc. Stable defs include:
  `P` proxy map, `G` goal map, `φ` intended proxy/goal correspondence,
  `ε=P−φ(G)` residual; `U` type space, `ν` baseline type law,
  `K_θ(ds|u)` response kernel, `W_θ(u)` selection weight;
  pure selection = `K_θ=K_0`, change only via `W_θ`; intervention = `K_θ≠K_0` on
  positive mass. `S(M)=Σ_{j∈M} κ_j w_j²` is scorecard capacity.
  Theorems: T1 coordinate-explicit selection bound; T2 value-weighted/operator bound;
  T3 Stackelberg wedge `Δ=√(2κV)`; T4 convex score-deficit budget
  `m(d)=sup_{λ≥0}[λd − c*(λw)]`; T5 additive exchange-rate iff; T6 deterministic
  adaptive-hardening capacity boundary (gaming stops iff `S_t(M)<d²/(2V)`).

  ## DONE WHEN
  - All 12 claims have a filled verdict with the document line, re-derivation result,
    and sim line (or explicit n/a / not-run).
  - Every verdict that differs from the bracketed prior verdict is flagged as a
    correction with its reason.
  - `make run` output captured (or its absence justified); no re-derivation silently
    contradicts a stated theorem without being logged.
  - Z&HM section states plainly whether the characterization was accurate and whether
    Z&HM is an anchor or contrast class; O8 updated with a one-line outcome.
  - No edits to `core-math.md`, the book, or the simulations.

  ---
  Two notes for when you run it in Codex:
  
  - The line numbers (299/307/339/351/380/417) are from a snapshot and may have drifted — I told Codex to fall back to searching #theorem[.
  - I scoped Codex's write permissions to just the new file plus a one-line O8 cross-reference, matching the audit-not-fix discipline in the plan. If you'd rather it not
  touch open_questions.md at all, delete that clause before pasting.
