# Next steps: Iterations 31-34

This is the active roadmap after the hospital application review. It deliberately alternates
application work and review before any book promotion:

- Iteration 31: second non-ML application in scientific metrics.
- Iteration 32: review the two-application template generalization.
- Iteration 33: promotion-readiness review for book integration.
- Iteration 34: book edit incorporating only reviewed findings.

The controlling constraint is that application claims should change a design,
audit, or evidence-collection decision. A template that merely classifies a
case after the fact is not enough.

After finishing an iteration, delete the iteration step from this document.

## Iteration 31: scientific metrics application

Iteration type: `application-mapping`.

### Purpose

Apply the reviewed template to a second non-ML scorecard setting: scientific
metrics. Use publications, citations, grants, venue prestige, or composite
research scorecards to test whether the template travels beyond hospitals.

### Work

1. Fill the reviewed template for a scientific-metrics case.
2. Declare the type space, baseline behavior, exposure mechanism, response
   channel, action/search geometry, proxy/target relation, aggregation rule,
   hidden value model, and qualitative `kappa`, `h`, `gamma`, `w`, and `V`
   primitives.
3. Name discriminator observations distinguishing selection over researchers,
   fixed-type changes in research behavior, proxy-only artifact production,
   and real research-quality improvement.
4. State one recommendation that differs from the hospital case. Examples
   include a different aggregation rule, audit target, evidence requirement,
   or response-channel warning.
5. Record any primitives that do not transfer cleanly from the hospital
   template.

### Output

A filled scientific-metrics application artifact using the reviewed template,
with at least one recommendation that differs from the hospital case.

### Success condition

The scientific-metrics application uses the same reviewed template but produces
at least one domain-specific recommendation that differs from the hospital
case for a principled reason.

### Failure condition

The template works only by hand-tuning domain-specific fields, produces the
same recommendation regardless of domain, or cannot name observations that
distinguish selection from fixed-type response.

### Scope limits

Stay non-ML. Do not use the MMLU worked application as the second case, since
it already covers the ML benchmark contract. Do not edit the book.

## Iteration 32: review template generalization

Iteration type: `review`.

### Purpose

Compare the hospital and scientific-metrics applications and decide whether
the application template is reusable or only appeared to work through
domain-specific hand tuning.

### Work

1. Review both applications side by side.
2. Identify fields that remained stable across domains and fields that needed
   domain-specific reinterpretation.
3. Check whether the qualitative frontier primitives have defensible meanings
   in both settings.
4. Test whether each application has contract-failure conditions that could
   actually fire.
5. Decide whether the template is reusable, needs narrowing into separate
   templates, or should be treated as an illustrative checklist only.

### Output

A side-by-side review artifact with a reuse verdict and a revised template
boundary.

### Success condition

The review produces a clear reuse verdict and a revised template boundary:
which fields are required, which are optional, and which transfer conditions
must be met before the template changes a recommendation.

### Failure condition

The review cannot distinguish genuine reuse from flexible redescription, or
the two applications share labels but not operational primitives.

### Scope limits

Do not promote the applications to book prose yet. The output should be a
review artifact and any necessary updates to research tracking files.

## Iteration 33: promotion-readiness review

Iteration type: `promotion-review`.

### Purpose

Decide exactly what from Iterations 27-32 is safe to promote into the book.
This is a gate between research notes and reader-facing prose.

### Work

1. Review Iterations 27-32 as a bundle:
   - Iteration 27 adaptive-hardening / measurement-frontier toy;
   - Iteration 28 adaptive-hardening review;
   - Iteration 29 hospital application;
   - hospital application review;
   - Iteration 31 scientific-metrics application;
   - Iteration 32 template-generalization review.
2. Produce a promotion map with `include`, `exclude`, or `footnote` decisions
   for each candidate claim, example, calculation, and recommendation.
3. State the license boundary for every included or footnoted item: theorem,
   toy-model implication, application mapping, review conclusion, or
   conjecture.
4. Identify the target book location, likely the response-modeling /
   application chapter.
5. Explicitly exclude theorem expansion, endogenous-stakes claims, and
   policy-optimality claims unless already reviewed and licensed in the prior
   iterations.

### Output

A promotion map for Iterations 27-32, with `include`, `exclude`, or `footnote`
decisions and license boundaries for each candidate item.

### Success condition

The promotion map tells Iteration 34 exactly what may be edited into the book,
what must remain in research notes, and what can appear only as a footnote or
clearly labeled toy/application example.

### Failure condition

The review cannot separate reviewed findings from tempting but unlicensed
claims, or it leaves Iteration 34 free to choose promotion boundaries during
the edit.

### Scope limits

Do not edit the book in this iteration. Do not add new applications or new
mathematical claims. This is a promotion gate.

## Iteration 34: book integration edit

Iteration type: `edit`.

### Purpose

Edit the book to incorporate only the reviewed application-template findings
licensed by Iteration 33's promotion map. The likely target is the
response-modeling/application chapter.

### Work

1. Treat Iteration 33's promotion map as a hard prerequisite and source of
   scope. If the promotion map is absent or incomplete, stop and complete
   Iteration 33 first.
2. Edit `book/multidimensional-goodhart.typ` to include the reviewed
   application-template findings.
3. Promote only reviewed claims. Preserve license labels in prose: theorem,
   toy, application contract, review result, or conjecture.
4. Add no theorem expansion, endogenous-stakes expansion, or policy-optimality
   expansion.
5. Leave `book/multidimensional-goodhart-paper.typ` unchanged unless a tiny
   consistency fix is unavoidable.
6. Build or otherwise verify the book according to the local build workflow.

### Output

A scoped edit to `book/multidimensional-goodhart.typ`, traceable to Iteration
33's promotion map, plus build or verification results.

### Success condition

The book gains a precise, reviewed application-template discussion that is
traceable to Iteration 33's promotion map and does not imply unlicensed
theorem, empirical, endogenous-stakes, or policy-optimality claims.

### Failure condition

The edit imports unreviewed claims, blurs toy results into application advice,
or proceeds without Iteration 33's promotion map.

### Scope limits

Book edit only. Do not start a paper-extract rewrite, new simulation, new
application, theorem expansion, or policy section.
