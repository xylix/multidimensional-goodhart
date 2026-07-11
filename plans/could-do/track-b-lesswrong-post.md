# Track B — write the LessWrong post (HUMAN-AUTHORED)

Status: Track B's final step. Decision (July 11, 2026): **the prose is written
by the human**, on the human's schedule — hence filed in `could-do/` rather
than as an agent-runnable plan. Not blocking Track A; the audit evidence is
frozen and won't drift while this waits.

## The human-prose rule

The post's prose is to be written by Kerkko, not drafted by an agent. This is
a deliberate authorship decision for a public, community-facing artifact:
the voice, emphasis, and judgment calls should be the author's own.

Agent-appropriate support roles (on request, never unprompted drafting):

- Outline sparring / structure critique.
- Fact-checking draft claims against `citation-audit/SUMMARY.md` §10
  (traceability index) — every number in the draft should trace.
- An overclaim-pass review of a finished draft (SUMMARY.md §8 is the rubric).
- Reference formatting from `citation-audit/gap-refs.bib`.

## Scope (per the July 10 rescope, `phase0-handoff.md` §11)

A LessWrong-post-size artifact that **foregrounds the applicable math**
(the cross-field dictionary + what-transfers), with the citation audit as
supporting evidence, not the pitch. The citation-trackery detail stays
repo-internal; the post links/points to the claim, states the headline
numbers, and moves on to the useful content.

## Single source

`literature-reference-gap-paper/citation-audit/SUMMARY.md` — self-contained
by construction (headlines §1, exception pockets §2, should-be-cited set §3,
BBS delta §4, mechanisms §5, scope decision §6, limitations §7, overclaim
pass §8, traceability §10). Supporting color: `citation-audit/why-the-gap.md`
§M4 (the camera-ready pruning story — the strongest narrative hook in the
evidence) and the two settled dictionary rows
(`research/threads/lit_review/looking-for-exchange-rate-results/README.md`,
`research/threads/lit_review/selection-bound-chapman-robbins/README.md`).

## Suggested skeleton (non-binding — author's call)

1. Hook: the pruning story (CIRL wrote the best Goodhart-economics paragraph
   in the safety canon, then deleted it at camera-ready) or the dictionary
   itself.
2. The dictionary's settled rows: T5 = Feltham–Xie/Baker congruity;
   T1/T2 = Hammersley–Chapman–Robbins / χ²-DRO — with what each transfers.
3. What the field is reinventing (Laidlaw's χ², Wang–Huang's distortion
   index) and what it could import instead.
4. The gap evidence, compressed: 0/60 in the core, the three pockets, the
   version-of-record convention stated once.
5. Why the gap exists (M1–M5, at their evidence levels).
6. What to actually do: the should-be-cited set, the selection-channel
   reading, the contract discipline.

## Binding guardrails (from the audit)

- **SUMMARY.md §8 overclaim pass is binding on the prose**: not "AI safety
  ignores economics"; not "nobody bridged" (BBS, Wang–Huang, Haupt); no
  intent attribution for the pruning; no trend claim from n≈3; claims scoped
  to the documented denominator.
- State the version convention once (current arXiv version = version of
  record; headlines invariant to the any-version reading).
- No pinned proposition numbers from `[paywalled — needs pull]` /
  `[verified-secondary]` entries until the pulls happen (list in SUMMARY.md
  §3 and gap-refs.bib annotations).
- Name the exception floor in any abstract/TL;DR.
