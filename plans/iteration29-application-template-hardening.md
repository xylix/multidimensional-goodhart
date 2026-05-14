# Iteration 29 plan: application-template hardening

Iteration type: `application-mapping`

## Purpose

Iteration 28 reviewed the adaptive-hardening toy and found that it is useful
only if future applications can declare or estimate the primitives that drive
the frontier: `kappa`, `h`, `gamma`, `w`, and `V`. The next iteration should
therefore test whether the response-modeling contract changes an application
decision rather than merely classifying a case after the fact.

## Core question

Can the framework produce an application template that names a licensed
calculation, a changed design decision, and a contract-level failure condition
before observing the outcome?

## Candidate domain

Use one non-ML domain where metric design is natural and where the primitives
can at least be bounded qualitatively:

- institutional scorecards;
- scientific metrics;
- organizational KPIs.

Prefer institutional scorecards or scientific metrics unless a stronger local
case is already available. Avoid another ML benchmark unless the iteration is
specifically about evaluation design; MMLU already covers the basic ML
contract shape.

## Work

1. Create a reusable application template in `research/threads/` or
   `research/reviews/` with fields for:
   - type space;
   - baseline behavior;
   - policy exposure;
   - selection versus fixed-type response channel;
   - action/search geometry;
   - proxy/target relation;
   - aggregation rule;
   - hidden harm/value model;
   - frontier primitives (`kappa`, `h`, `gamma`, `w`, `V`);
   - evidence standard;
   - licensed calculation;
   - design decision changed by the contract;
   - contract failure condition.
2. Fill the template for one domain.
3. Name one discriminator observation that would distinguish the chosen
   response contract from a plausible alternative.
4. State what would make the template wrong as a framework application, not
   merely what would change one parameter estimate.
5. Update `verification_stack.md`, `claim_audits.md`, `open_questions.md`, and
   `iteration_log.md` only if the application sharpens the framework boundary.

## Success condition

The template recommends a different metric design, audit, or evidence
collection plan than a generic Goodhart warning would, and it states what
observation would make the chosen contract the wrong decomposition.

## Failure condition

The template can classify the case but cannot change any decision, cannot name
a discriminator observation, or relies on post-hoc choices of value weights,
signal adequacy, or gaming costs.

## Scope rules

Do not start theorem work or endogenous-stakes modeling inside this iteration.
Do not promote Iteration 27 to book or paper prose unless the application
reveals a contradiction that must be repaired immediately. Keep the output as a
research-note/application artifact with a clear license boundary.
