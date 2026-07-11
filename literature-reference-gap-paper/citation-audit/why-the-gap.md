# Task 09 — Why the gap exists: mechanisms, evidenced or downgraded

Status: **COMPLETE 2026-07-11.** One section per candidate mechanism. Within each:
the **checkable facts** (with pointers to `verification.md` / `bridges.md` /
`audit.md` or to new greps whose artifacts live in the session scratchpad), then
the **licensed interpretation** with its confidence tag, then the **overclaim the
post must not make**. New bibliographic facts state their method; every new
artifact is in the task-07/09 scratchpad
(`…/scratchpad/`: `norm/*.txt` extracted texts, `refshare.py` +
`refshare_results.txt`, `task09_greps.txt`).

Convention: "current version" = the frozen arXiv ID's latest version, which for
every disputed paper coincides with the published version of record
(`verification.md` §6). Mechanism 4 is where the preprint-history story lives;
both readings' numbers are stated there once.

---

## Mechanism 1 — Vocabulary divergence

### Facts

**What was probed (task 04, `bridges.md` §3, 2026-06-24):** nine econ/stats
technical terms, searched over the AI Goodhart/reward-hacking corpus via arXiv
full-text WebSearch scoped to reward-hacking/overoptimization/Goodhart papers,
plus direct PDF reads on any hit. Result:

- **Absent from the entire AI corpus (7 of 9):** *congruity* (Feltham–Xie's
  term), *second best* (Lipsey–Lancaster sense), *sufficient statistic* (in the
  Chetty/Holmström incentive sense), *Chapman–Robbins*, *informativeness
  principle* (Holmström 1979), *equimarginal*, *exchange rate* (measurement
  h_j/w_j sense).
- **Present in exactly ONE paper (2 of 9):** *distortion* (Baker sense) and
  *multitask* (agency sense) — both only in Wang–Huang 2603.28063 (I1), which
  explicitly imports them from HM1991/Baker. Elsewhere "multitask" in the corpus
  means multi-task *learning*.

**Task-09 corroboration (new; independent method):** case-insensitive grep over
the 68 task-07 extracted texts (`task09_greps.txt`; texts normalized per
`verification.md` §1):
- "congruity": appears **only** inside F15's own reference list (the Feltham–Xie
  title string) — zero occurrences in any AI-authored corpus text.
- "second(-)best", "informativeness principle", "equimarginal",
  "Chapman–Robbins", "Hammersley": **zero occurrences in all 68 texts.**
- "multi(-)task principal": only in the known bridge pocket — CIRL **v1** (gone
  from the record, see Mechanism 4), F3 body, F15 refs, I1, I2, A9.
- "sufficient statistic": in CIRL (all versions) — but in the **POMDP-belief
  sense** ("the robot's posterior over θ is a sufficient statistic",
  `cirl_neurips.txt` l.84), not the incentive sense; and in F5 **v1 only**, and
  there only as the Chetty reference title, which left with the reference in v2.

The corroboration grep covers 68 of 115 minable corpus papers (the task-07
verification set: all hit rows, all big-bibliography absences, a cross-cluster
sample) — a biased-toward-hits sample, which makes the clean negative *stronger*.

### Licensed interpretation

`[confident]` The two literatures are **terminologically disjoint** at the level
of the technical vocabulary: an AI-safety researcher searching from the corpus's
native vocabulary ("reward hacking", "overoptimization", "regressional/extremal
Goodhart", "information bottleneck") **cannot reach** the congruity /
sufficiency / HCR prior art by keyword search, and conversely the econ terms
retrieve nothing in the corpus. Keyword-driven literature search **structurally
misses** this prior art. Two independent methods (WebSearch probe June 2026;
local full-text grep over the verified extraction set July 2026) agree.

### What this does NOT license

- Nothing about **authors' awareness or intent** — vocabulary absence is
  consistent with never having encountered the econ literature *and* with
  knowing it but writing in field-native terms.
- Not "no conceptual overlap" — the overlap is the whole point; the words
  differ, the objects rhyme.
- Not a claim about ML at large: the strategic-classification/econ-CS lineage
  *does* use the agency vocabulary (F3, F15, cluster F). The disjointness is
  specific to the safety/RLHF corpus.

---

## Mechanism 2 — Lineage capture / siloing

### Facts

**New measure (task 09): reference-space composition of 12 core B/C papers.**
Method (`refshare.py`, output `refshare_results.txt`, run 2026-07-11): Semantic
Scholar `references` endpoint for B1, B2, B3, B4, B14, B19, C1, C6, C11, C24,
C26, C27 (chosen: the core papers with previously-recorded clean S2 lists,
spanning 2016–2026). Each resolved reference classified by heuristic: **arXiv/ML**
if it has an ArXiv externalId or an ML/AI venue-string match; **econ/stat/mgmt**
if its venue string matches a list of economics / statistics / management /
accounting journals; **other** = everything else (books, blogs, psych,
unresolved venues). Guard against the task-06 S2 wrong-list bug: list sizes
compared to recorded sizes and flagged lists identity-checked by marker
references (C6 contains its known Strathern ref, C24 its Hoskin ref, C27 its
Goodhart 1984 ref; B2's list consistent with its PDF).

Result over **1,424 resolved references**:

| bucket | count | share |
|---|---|---|
| arXiv-carried or ML-venue | 963 | **67.6%** (a *lower* bound — much of "other" is unresolved ML: books, workshops, blogs) |
| econ/stat/mgmt venue | **4** | **0.3%** |
| other | 457 | 32.1% |
| (of all refs) corpus-internal, i.e. citing another frozen-corpus paper | 87 | 6.1% |

The four econ-venue references, listed exhaustively: Hansen's Nobel lecture
(JPE; = B1's coded `~ GMM/IV` cell), a Southern Economic Journal COVID
political-economy paper (B2, topical), "The Welfare Effects of Social Media"
(AER) and "Implementing the Wisdom of the Crowd" (JPE) (both B14, topical).
**Zero of the four are incentive/contract theory.** Per-paper corpus-internal
shares run up to ~15% (B3: 14/92; C1: 8/59) — dense internal citation for a
115-paper denominator.

**Known limits of the measure:** S2 reference resolution varies between pulls
(B1 172 vs ~150 in the PDF; C6 152 vs 271 recorded in task 06 — identity
confirmed, coverage differs), so these are proxy numbers, not audit-grade cells;
the venue classifier is a string heuristic; "arXiv-carried" over-counts nothing
but under-counts ML books/venues without arXiv IDs.

**Already-verified complements (no new work):**
- Reverse census (`bridges.md` §1): the econ/stats prior art is heavily cited by
  *adjacent* ML communities — Ben-Tal 2013 has 129 CS-tagged citers (all
  DRO-ML), Chapman–Robbins 88 (all signal processing/estimation), HM1987 27 —
  and **not one** of those CS citers is a reward-hacking/Goodhart paper. The
  prior art is indexed, discoverable, and used next door.
- Cluster-F contrast (`coding-batches.md`, F-batch note): the strategic-ML
  lineage in the same freeze reaches HM1991, Raj Chetty, Lucas, Grossman–Hart —
  "the citation gap is specific to the AI-safety reward-hacking lineage, visible
  from both sides."

### Licensed interpretation

`[confident]` The core clusters' reference space is **almost entirely
ML-internal**: econ/stat/management venues account for ~0.3% of resolved
references in the sampled core papers, and none of that 0.3% is incentive
theory. Combined with the reverse census, the non-citation is a **community
boundary, not an indexing artifact**: the same prior art is reachable and
reached by neighboring CS communities.

`[tentative]` "Lineage capture" as a *process* — new papers building their
bibliographies from the reference lists of prior corpus papers, so an econ-free
base reproduces itself — is the natural reading of the high internal density
plus Mechanism 3's inheritance counts, but the composition snapshot does not
*observe* the copying process.

### What this does NOT license

- Do not quote 67.6% as "the internal-citation share" — it is a venue/arXiv
  proxy with resolution noise, stated as a lower bound on ML-share, and the
  post should present it as an order-of-magnitude composition fact
  (≈2/3 visibly ML, ≈0.3% econ, 0% incentive theory), not a precise statistic.
- Not "AI-safety researchers only read arXiv" — reference composition measures
  what survived into bibliographies, not reading habits.

---

## Mechanism 3 — Inherited pruned base

### Facts

**The anchors carried no econ/stats tier forward** (all previously verified):
- **B1 Amodei 2016** (~150 refs): PDF-grepped clean of **all** tiers except the
  `~ GMM/IV` body mention and Goodhart 1984 (`verification.md` §4, first row).
  Its only econ contacts are the eponym and an econometrics aside.
- **B4 Leike 2018** (~165 refs; seed-pass id B7): **all-absent confirmed** by PDF grep
  (`verification.md` §4) — not a single tier item, not even a Goodhart eponym ref.
- The most-cited survey rows are the same: **C24 Casper 2023** (227 refs)
  all-absent (cites Hoskin 1996 only, not scheme-listed); **H1 Zhong** and
  **H2 Kaufmann** all-absent with **no occurrence of "Goodhart" anywhere**;
  **B22 Wang 2026 reward-hacking survey** all-absent including no Goodhart
  eponym ref; **H7** all-absent (all `verification.md` §4).

**Inheritance counts (new, task 09):** title-string grep ("concrete problems in
ai safety"; "scalable agent alignment") over the 68 extracted texts
(`task09_greps.txt`). Method note: a bibliography title match = a citation; the
sample is the task-07 verification set (hit rows + big lists + sample), i.e.
biased toward exactly the papers with the *most* econ contact.
- **Amodei 2016 is cited by 22 of the 67 other texts**, including **12 of the 29
  core-cluster (B+C) papers in the sample** (B: 6/11 — B3, B7, B14, B16, B18,
  B19; C: 6/18 — C4, C6, C13, C15, C28, C33), plus A4, A5, A7, A8, A10, A14,
  D1, E1, H6, H7.
- **Leike 2018 is cited by 2 of 67** (E1, B22) — only 1 of 29 in the B+C core.
  In this sample the field has *one* bibliographic anchor, not two.

### Licensed interpretation

`[confident]` (bibliographic fact) The document that anchors the reward-hacking
literature's framing — Amodei 2016, cited by ~40% of the sampled core — itself
carried **zero** contract-theory/estimation references. A researcher who builds
their related-work section outward from Amodei 2016 (or from the surveys, which
are equally empty) inherits a bibliographic frame in which the only economics
that exists is Goodhart 1984.

`[tentative]` (mechanism) This *explains propagation*: downstream papers did not
prune the econ tier — there was nothing to prune, because the anchor and the
surveys never carried it. The gap reproduces by default rather than by repeated
decision.

### What this does NOT license

- **No causal claim** "papers B*/C* lack econ refs *because* Amodei lacked
  them." Every author had independent access to the same literature; the
  inheritance counts show who cites the anchor, not that bibliographies were
  built from it.
- Leike 2018 should not be called a field anchor on this evidence (2/67); the
  inherited-base story is Amodei-plus-surveys, not "the anchors" generally.

---

## Mechanism 4 — Camera-ready / revision pruning (the four documented cases)

All four version histories are read directly from the scratchpad artifacts
(`norm/`: v1/v2/v3/current arXiv extractions + `cirl_neurips.txt`,
`offswitch_ijcai.txt`, `miller20b.txt` [PMLR]; provenance `verification.md`
§§1–2). Per-case answers to (a) trim-vs-(b) selective, (c) prose coupling; (d)
at the end.

### Case D2 — CIRL (1606.03137, NeurIPS 2016)

- **(a) Reference counts:** v1 = **29** refs; NeurIPS record = **26** (both
  lists read in full and hand-diffed). The cut is **not across the board**: 3
  removals, everything else identical line-for-line.
- **(b) What was cut vs kept:** cut = **HM1987, HM1991, Smallwood–Sondik 1973**.
  The third is a POMDP classic whose citing proof moved to the (uncounted)
  supplementary material — the record still states the corollary ("Theorem
  proofs can be found in the supplementary material", `cirl_neurips.txt` l.270).
  So the substantive main-text cut is **exactly the two contract-math items**.
  Kept: **Gibbons 1998, Kerr 1975, and Jensen–Meckling 1976** — three econ
  references survived, all of the framing/survey/folklore tier. This is not a
  de-econ purge; it removes precisely the technical-import tier.
- **(c) Prose coupling:** the passage died with the citations. v1's
  principal-agent related work ran: "…Gibbons (1998) provides a useful survey…
  Holmstrom & Milgrom (1987) gives structural results on optimal incentive
  schemes… [new paragraph] From the perspective of AI research, one of the most
  interesting lines of research in this literature studies the impacts of
  distorted incentives. Holmstrom & Milgrom (1991) develop a multi-task model…
  incentives for the more precisely measured tasks should be reduced to avoid
  diverting too much effort from poorly measured tasks." (v1 ll.194–203). The
  record keeps the paragraph **verbatim up through the Gibbons sentence and cuts
  everything after** — the whole HM passage, which was the most Goodhart-adjacent
  economics ever written in the CHAI lineage, not just its brackets
  (`cirl_neurips.txt` ll.186–191; "distort"/"multi-task" have zero record hits).

### Case D3 — Off-Switch Game (1611.08219, IJCAI 2017)

- **Correction to the task premise first:** **Tirole 2009 is in v1** (v1 ref
  list read in full; also cited in v1 body l.710). The record did **not** "add"
  Tirole — there was no econ *swap*. `audit.md`'s D3 annotation ("+Tirole 2009
  non-scheme") should not be read as a record-stage addition.
- **(a) Reference counts:** v1 = **15**; IJCAI record = **13**. Cuts: **Baker
  2002** and **Dewey 2011** ("Learning what to value", an AI/AGI ref). One econ
  cut, one AI cut — consistent with plain compression.
- **(b) Cut vs kept:** the record keeps **all three** framing-tier econ refs
  (Kerr 1975, Gibbons 1998, Tirole 2009) and cuts the single
  performance-measurement-math item (Baker 2002).
- **(c) Prose coupling — the sharpest evidence in the set:** v1's related work
  gave Kerr, Gibbons, and Baker a sentence each; Baker's was the substantive
  one, actually stating the distortion result: "he describes a principal–agent
  game in which the agent's incentives depend on an inaccurate performance
  measure and shows that the strength of the incentives should be reduced in
  proportion to the misalignment between the performance measure and the
  principal's profit function" (v1 ll.713–717). The record compresses the whole
  paragraph: Kerr's and Gibbons's descriptive sentences are also gone, **but
  their citations were re-attached** to the topic sentence ("…cause the agent to
  act in the principal's interest [Kerr, 1975; Gibbons, 1998]",
  `offswitch_ijcai.txt` l.751); the Tirole sentence survives nearly verbatim
  (l.783); **Baker's citation was re-attached nowhere** — content and citation
  both gone. The Dewey sentence was cut the same way. Under compression, the
  authors chose which citations to save: the analogy tier, not the math tier.

### Case F3 — Miller/Milli/Hardt (1910.10362, ICML 2020 = PMLR miller20b)

- **This case runs in the OPPOSITE direction.** Name-level greps
  (v1 / PMLR record / current v3): Strathern 2/0/0; "Goodhart" 1/0/0;
  Holmström 0/**2**/2; Oates–Schwab 0/**2**/2; Rich–Larson 0/**1**/(0 in v3);
  Belot–Schröder 0/**2**/2; Ross 1973 and Grossman–Hart present in all versions.
- The record **dropped the folklore** (Strathern ref + the "Goodhart's law"
  framing sentence, v1 ll.36–37) and **added econ**: HM1991 with substantive
  body use ("This complementarity (Holmstrom & Milgrom, 1991) allows the
  decision-maker to incentivize improvement using only a non-causal feature",
  miller20b l.414) plus an empirical failed-incentives cluster in the intro
  ("(Oates & Schwab, 2015; Rich & Larson, 1984; Belot & Schroder, 2016)",
  miller20b ll.45–46). Both lists are ~2 dozen entries with cuts and additions
  on both sides (a restructure, not a trim; heuristic entry parse: 25 → 23).
- Note the community: this is the strategic-ML lineage (cluster F), not the
  safety core — the one camera-ready process in the set that *deepened* econ
  contact belongs to the community that reads econ.

### Case F5 — Sahoo–Wager (2204.01884, 5 arXiv revisions, journal-track)

- **(a) No page-squeeze story is available:** v2 (2022-12-26) is an
  **expansion** — extracted text grows 5,120 → 6,015 lines and the reference
  list **grows** — yet Chetty is dropped exactly there. This case cleanly
  discriminates (a) from (b): the cut cannot be a venue page-limit trim.
- **(b)+(c) What actually happened — a reframing rotation, not a de-econ trim:**
  v1's motivating sentence "estimation of the derivative of the policy loss, a
  method that is motivated by prior works [Chetty, 2009, Wager and Xu, 2021]"
  (v1 ll.817–818) was rewritten in v2 as "motivated by prior works that estimate
  policy effects or treatment effects at equilibrium [Heckman et al., 1998,
  Munro et al., 2021, Wager and Xu, 2021]" (v2 ll.66–68) — the sufficient-
  statistics framing was replaced by an equilibrium-treatment-effects framing
  built from references **already present in v1** (Heckman count 4 in both
  versions). Econ/econometrics refs (Heckman, Cournot, Newey–McFadden) remain
  throughout; and **Rockafellar's Convex Analysis was ADDED in v2** — it is
  **absent from v1's complete bibliography** (verified: v1 refs zone reaches
  W-entries; zero "Rockafellar"/"Princeton"/"volume 18" hits).
  ⟶ **Correction for the lead:** `verification.md` §3 F5 row says Rockafellar is
  "present v1–v5"; the fact is **v2–v5**. No cell impact (the `~` is coded on
  the current version), but the annex line and the "author named in PDF" upgrade
  note should say v2+.

### (d) Whodunit — and the answer to the owner's question

**Not determinable from bibliographic data, and we say so.** Nothing in any
version's text attributes the cuts to authors, reviewers, or space. Anything
about *intent* is `[guess]`.

What the four histories jointly license, tagged:

- `[confident]` (fact pattern) In the two safety-core cases (D2, D3), the
  version of record kept every **framing-tier** econ reference it had
  (Kerr, Gibbons, Tirole, Jensen–Meckling) and cut precisely the
  **technical-import-tier** items (HM1987, HM1991, Baker 2002) — in D2 together
  with the entire passage that carried the multitask-distortion content, in D3
  losing the one sentence that stated a distortion theorem. The field did not
  strip "econ"; it stripped the econ *math* it was not using.
- `[tentative]` (unifying description, n = 4) References survived revision **in
  proportion to their load-bearing role in the final paper**: none of the cut
  items (HM1987/HM1991 in D2, Baker 2002 in D3, Chetty in F5, Strathern in F3)
  was used in any theorem or method of its paper — they were related-work
  gestures; and the one case where econ math *became* load-bearing (F3's
  complementarity point) moved the opposite way and gained HM1991 at
  camera-ready. "Unused imports get pruned; used imports get added."
- **Owner's question — "did the authors just decide the econ contacts were not
  worthwhile?"** As far as the evidence goes: *someone* judged those specific
  passages expendable while equally-econ framing citations were deliberately
  preserved (D3's re-attached brackets prove the preservation was a choice, not
  an accident of deleting sentences), and in F5 the drop happened with no space
  pressure at all, in an authorial reframing. So "the econ-math contact was
  judged not worth its space in the final version" is supported as a
  *description of the revealed outcome* `[tentative]`; **whether the judgment
  was the authors' taste, reviewer pressure, or page budget is not recoverable**
  `[guess]` — except that F5 rules out page budget for its own case, and D3's
  selective re-attachment rules out indiscriminate trimming.

### The version-convention consequence (both readings, once)

The audit's cells follow **current version = version of record**; any-version
hits are annotations (`verification.md` §6). The two readings:

| quantity | current-version (audit cells) | any-version-ever |
|---|---|---|
| CONTRACT paper-level | 8 ✓ + 1 △ of 115 | **same** (D2/D3 keep ✓ via Gibbons) |
| HM1991 papers | 5 (A9, F3, F15, I1, I2) | 6 (+ D2 v1) |
| HM1987 papers | 1 (I2) | 2 (+ D2 v1) |
| Baker 2002 papers | 1 (I2) | 2 (+ D3 v1) |
| PUBFIN (Raj Chetty) | **0** of 115 | 1 (F5 v1) |
| MGMT | 20 | 21 (+ F3 v1 Strathern) |

Every headline (CONTRACT 0/60 in the B+C core; 2BEST/CORRECT 0; ESTIM never as
prior theory) is invariant across the two readings. The preprint-history reading
is not a robustness caveat but a *finding*: the exception floor was even thinner
in print than on arXiv, because the technical-tier contacts lived only in first
preprints. The post should state the convention once and tell the pruning story
here, with this table.

---

## Mechanism 5 — The 2026 nod: closing at the anchor, not at the tier

### Facts

Dated pm-branch (performance-measurement) contacts, versions of record
(`audit.md` totals; `bridges.md` §2-E/G):
- **Pre-2026:** F3 (ICML 2020; one-line body use of HM1991, strategic-ML
  community) and F15 (Dec 2024; Feltham–Xie + HM1991, **econ-authored**,
  "Goodhart" absent from its text). Within the AI-safety-authored corpus:
  nothing.
- **2026 (all within the frozen corpus, all preprints):** **I1** Wang–Huang
  (Mar 2026) — formal import: instantiates HM1991, derives a distortion index,
  cites Baker 1992; **I2** Haupt et al. — HM1987+HM1991+Baker 2002 for benchmark
  aggregation; **A9** Marklund et al. (Mar 2026) — HM1991 as a one-sentence
  related-work nod, math unused (`verification.md` §2.1); (+ I3, the
  access-limited Haupt workshop sibling).
- What none of them reach (`bridges.md`, primary-verified 2026-06-30):
  Feltham–Xie congruity (except econ-authored F15), Banker–Datar, DKL,
  Bénabou–Tirole, Chetty, Lipsey–Lancaster, Reynaert–Sallee, or any
  estimation/χ²-DRO item as prior theory.

### Licensed interpretation

`[tentative]` In 2026 the gap has begun to close **at the HM1991/Baker anchor**,
at both the nod tier (A9) and the import tier (I1/I2) — but **not at the
congruity/sufficiency/estimation tier**, which remains at zero AI-safety-authored
contact. The entry point is also telling: I1/I2 arrive through benchmark-design
economics, not through the reward-hacking lineage's own genealogy.

### What this does NOT license

- **No trend claim.** Three-to-four papers in one year, two of them siblings
  from one group, is a floor observation, not a time series. "The gap is
  closing" is the tempting overclaim; the licensed sentence is "the first
  in-corpus bridges to HM1991/Baker appeared in 2026 and stop at exactly the
  items the CHAI preprints had reached a decade earlier."
- These are all current-version preprints; per Mechanism 4, reference lists in
  this corpus are revision-unstable — the 2026 contacts could yet be pruned at
  their own camera-readies (flag for a post-publication re-check).

---

## Ranked summary

**Evidenced:**
1. **M1 Vocabulary divergence — `[confident]`**, two independent methods, clean
   negative. The strongest single mechanism claim available.
2. **M2 Reference-space composition / community boundary — `[confident]`** for
   the composition facts (≈0.3% econ venues, zero incentive theory; adjacent
   communities cite the same prior art heavily); the *capture process* reading
   is `[tentative]`.
3. **M4 Revision pruning — `[confident]`** per-case facts (four version
   histories read in full); the unifying "unused-import pruning" pattern
   `[tentative]` (n = 4); any attribution of intent `[guess]`.
4. **M3 Inherited pruned base — `[confident]`** as bibliographic fact (anchor
   and surveys carry nothing; Amodei cited by ~40% of the sampled core);
   inheritance **as mechanism** `[tentative]` (no causal identification).
5. **M5 2026 anchor-nod closing — `[tentative]`**, small-N by construction.

**Downgraded to conjecture:** nothing was asserted beyond the above; the two
candidate mechanisms that remain pure conjecture (and should be labeled as such
if mentioned at all) are *reviewer-driven de-econ pressure* (no version text
attributes any cut) and *bibliography-copying as the literal propagation channel*
(composition and inheritance counts are consistent with it but do not observe it).

**How they compose.** These are not rival explanations but one loop seen at four
stages. The anchor documents entered the field with no econ/stats base (M3), and
the corpus's native vocabulary shares no technical terms with the prior art
(M1), so a researcher who searches from inside finds nothing pointing out and a
researcher who builds references outward from the anchors inherits the same
emptiness — producing the measured composition (M2: two-thirds-plus ML,
~0.3% econ, dense internal citation). The few econ-math contacts that
individuals did make arrived as non-load-bearing related-work gestures in first
preprints, and revision pressure — whoever exercised it — removed exactly those
while keeping the folklore tier (M4), so even the exceptions never propagated
into the versions of record that downstream bibliographies are built from. When
bridges finally appear in 2026 (M5), they come from an adjacent community's
framing (benchmark-design economics) rather than from inside the loop, and they
re-reach only the two items (HM1991/Baker) the pruned preprints had already
touched — which is precisely what a field with no transmitted memory of its own
econ contacts would look like.

---

## Corrections handed back to the lead (bookkeeping)

1. **"Off-Switch record ADDS Tirole 2009" is refuted:** Tirole 2009 is in the v1
   reference list and v1 body (l.710). The record kept it; the only cuts were
   Baker 2002 + Dewey 2011. Affects: any "econ swap" phrasing; `audit.md` D3
   annotation reads ambiguously and could be tightened to "Tirole 2009 all
   versions, non-scheme".
2. **`verification.md` §3 F5 row, "Rockafellar … present v1–v5" → v2–v5:**
   absent from v1's complete, W-reaching bibliography; added in the same v2
   revision that dropped Chetty. No cell impact (current-version `~` stands).
3. Incidental: CIRL's record retains **Jensen–Meckling 1976** (agency-cost
   econ, not scheme-listed) — worth a D2 annotation if the post discusses what
   the CHAI lineage kept.
