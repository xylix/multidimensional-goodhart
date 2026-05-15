# Integration-readiness review

Iteration type: `integration-review`

## Question

Which results from Iterations 35-39 may enter book or paper prose, which may
appear only as footnoted or appendix-level boundary notes, and which must remain
out of the book and paper edit?

High-level verdict: no new main-text argument is licensed. [tentative] The
only integration-ready items are narrow boundary corrections: a footnote or
appendix paragraph on the deterministic finite-channel adaptive-hardening
capacity result, and one short note that stochastic observation and endogenous
stakes remain model-dependent dynamic questions. Everything policy-facing,
empirical-estimation-facing, or broader than those boundaries remains excluded.

## Review setup

Constraints on definitions. Any candidate integration must preserve the
response-modeling contract: fixed type/action boundary, response channel,
action/cost/search geometry, aggregation rule, hidden target or harm model, and
evidence standard. [tentative] A result that uses `kappa`, `h`, `gamma`, `w`,
or `V` may enter prose only if those symbols remain declared primitives rather
than estimated facts. Toy example: a hospital scorecard with undocumented
committee overrides has no usable effective `w`, so a quadratic diagnostic must
be marked unavailable rather than imported with a caveat.

Motivation. The book and paper currently present adaptive hardening,
measurement frontiers, endogenous stakes, and empirical implementation as live
directions. Iterations 35-39 narrowed some of those directions. The integration
question is whether the narrowing changes what a reader should see in the
drafts, not whether the research notes are internally useful.

Counterexample first. Suppose the draft added: "adaptive hardening converges
once regulators lower the most-gamed channel." That would be false even inside
the finite-channel toy when the literal largest-action rule repeatedly selects
an already-floored channel, or when floor capacity remains above
`d^2/(2V)`. Suppose the draft added: "noisy observation implies reactive
hardening fails." That would also overreach: the Iteration 36 toy fixes one
seeded observation rule and repair budget. These counterexamples force the
review to default to footnote or exclude, not main-text inclusion.

Outward pointers. This gate does not add literature, simulations, or book/paper
prose. It only records the license for Iteration 41.

## Integration map

| candidate claim/example/calculation | source iteration(s) | decision (`include`, `footnote`, `exclude`) | license boundary | target book/paper treatment | non-license |
| --- | --- | --- | --- | --- | --- |
| Deterministic finite-channel adaptive hardening has an exact capacity boundary: fixed-deficit gaming is feasible iff `S_t(M) >= d^2/(2V)`, and hardening reaches no-gaming exactly when capacity falls below that threshold. | Iteration 35 | footnote | The finite-channel additive-score, separable-quadratic, deterministic-observation contract with fixed `M`, fixed `d`, fixed `V`, fixed weights, and monotone lowering of `kappa_j`. | A short book footnote or appendix paragraph may correct the open-direction wording: in this one deterministic contract, the threshold is closed. The paper may receive at most a parenthetical boundary note if the existing open-directions list is edited. | No arbitrary-hardening convergence, stochastic-observation transfer, changing measured-set result, changing-deficit or endogenous-stakes result, welfare comparison, empirical estimate, or policy recommendation. |
| The progress-aware largest-action multiplicative rule terminates in finite time when finite positive-weight channels have floor capacity below the threshold; the literal largest-action rule can stall on an already-floored channel. | Iteration 35 | footnote | Same deterministic finite-channel contract, plus a progress condition that chooses a channel whose update strictly lowers `kappa_j`. | May be bundled into the adaptive-hardening boundary note to prevent the draft from implying the literal rule always converges. | No rate theorem beyond the stated finite termination argument; no persistent-cycle theorem; no guarantee when `S_floor(M) >= d^2/(2V)`. |
| Route switching under adaptive hardening is finite pre-limit behavior under deterministic progress, not persistent cycling. | Iteration 35 | footnote | Same deterministic contract and progress-aware rule. | May be mentioned only if needed to repair prose that says or implies "cycle" for the deterministic finite-channel toy. | No general cycle classification, no stochastic cycling result, and no dynamic-regime taxonomy. |
| Stochastic observation can make a largest-observed-action repair miss the static capacity threshold within a fixed repair budget. | Iteration 36 | footnote | One declared seeded dynamic toy with noisy observation of current best-response actions and a fixed repair budget. | A short book or paper note may say the deterministic threshold does not transfer without an observation model and repair-budget condition. | No theorem that noisy repair usually fails, no optimal-filtering result, no field-policy advice, and no claim about real regulators without an observation-error model. |
| Endogenous-stakes paths depend on what harm is observable under the declared recurrence `V_{t+1}=(1-lambda)V_t+lambda V0 exp(-rho H_obs_t)`. | Iteration 36 | footnote | One declared recurrence with myopic agents, fixed hidden-harm weights, and visible-versus-invisible observed harm paths. | May appear as one short note that endogenous stakes are model-dependent and remain outside the exogenous-`V` Stackelberg and convex-cost calculations. | No performative-stability theorem, fixed-point claim, trust-governance advice, or policy-optimality result. |
| Scorecard primitives can sometimes be predeclared, bounded, defended, or marked unavailable with deployment, monitoring, or evidence-collection consequences. | Iteration 37 | exclude | Empirical-design boundary for hospital and scientific scorecards. | Do not add new prose in Iteration 41. Chapter 6 already contains the application discipline and compact scorecard mappings; the Iteration 37 note remains supporting research documentation. | No hidden-target estimates, patient-welfare or research-value inference, cross-domain value units, or toy diagnostics when primitives are missing. |
| Missing primitives should change design: lower leverage, pilot first, collect traces, monitor hidden targets where available, or fall back to qualitative review. | Iterations 37-38 | exclude | Narrow audit/design/evidence consequences inside declared application contracts. | Do not add broad policy prose. This can remain in research notes until a separate scoped policy or application edit is licensed. | No optimal-policy advice, no generic pro- or anti-metric slogan, and no claim that missing primitives are harmless caveats. |
| Document effective rules, audit repeated-unit action traces, monitor hidden-target traces where available, and withhold toy diagnostics when primitives are missing. | Iteration 38 | exclude | Policy-readiness review licenses only procedural discipline inside a declared contract. | No book or paper integration in Iteration 41 except insofar as already represented by the Chapter 6 application contract. | No regulator objective, no policy ranking, no empirical welfare/research-value claim, and no stochastic or endogenous-stakes governance advice. |
| Measurement-frontier claims about adding dimensions improving or worsening scorecards. | Iterations 35-38, inherited from 27-28 | exclude | Existing toy classification only: signal, harm, attack surface, weights, and stakes must be declared. | Do not add new book or paper prose from Iterations 35-39. | No sign theorem for adding metrics, no frontier characterization in real domains, and no policy-optimization result. |
| Iteration 39 consolidation of the live license map. | Iteration 39 | exclude | Internal roadmap, claim-audit, and verification-stack consistency update. | Do not integrate into book or paper prose. | No new theorem, application, empirical, or policy result. |
| Broad policy-facing synthesis from Iterations 35-39. | Iterations 35-39 | exclude | None. The repair sequence blocks broad policy prose. | Do not add. | No adaptive-hardening recommendation, no stochastic-repair advice, no endogenous-stakes governance advice, no hidden-target credit from score movement, and no generic metric slogan. |

## Iteration 41 instructions

Iteration 41 may edit book or paper prose only within the following narrow
license:

1. It may add at most a footnote, parenthetical, or appendix paragraph stating
   the Iteration 35 deterministic finite-channel capacity boundary and its
   non-transfer conditions.
2. It may add one short note that Iteration 36 leaves stochastic observation
   and endogenous stakes model-dependent; no fixed-point, filtering, or policy
   claim is licensed.
3. It must not add new hospital, scientific-metrics, empirical-estimation, or
   policy prose unless the edit is only a consistency repair to avoid implying
   a broader claim.
4. It must not promote any Iterations 35-39 result into a main theorem,
   empirical finding, or regulator recommendation.

If the existing book and paper prose already avoid the stale open-question
wording, Iteration 41 should record that no prose edit is needed and proceed to
the final consistency pass.

## Review conclusion

The integration-ready result is not a new chapter argument. [tentative] It is a
boundary correction: the deterministic finite-channel adaptive-hardening toy has
an exact capacity threshold, while the stochastic-observation and
endogenous-stakes variants show why that threshold does not transfer without a
declared dynamic model. The scorecard auditability and policy-readiness results
remain research-note support for the existing application discipline; they do
not justify new book or paper policy prose in this repair sequence.
