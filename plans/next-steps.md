# Next steps: Iteration 34

This is the active roadmap after the application-template generalization
review and Iteration 33 promotion-readiness review. The promotion gate is now
complete:

- Iteration 34: book edit incorporating only reviewed findings.

The controlling constraint is that application claims should change a design,
audit, or evidence-collection decision. A template that merely classifies a
case after the fact is not enough.

After finishing an iteration, delete the iteration step from this document.

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
