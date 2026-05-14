# Application: scientific metrics scorecard

Iteration type: `application-mapping`

## Purpose

This application fills the response-modeling contract for a scientific
evaluation scorecard. The target claim is not "research metrics are bad."
Responsible-metrics work already gives the broad warning: publication counts,
citations, journal impact factor, grants, and rankings can distort science
when they are overused as narrow proxies.
[DORA](https://sfdora.org/read/), the
[Leiden Manifesto](https://www.nature.com/articles/520429a),
Campbell/Goodhart, and work such as
[de Rijcke et al. on indicator-use effects](https://ideas.repec.org/a/oup/rseval/v25y2016i2p161-169..html)
are background anchors for that warning.

The narrower framework contribution to test is whether the contract names
observations that distinguish mechanisms: selection over researchers, labs,
fields, and institutions; fixed-researcher response; proxy artifact
production; and genuine research-quality improvement. If the application only
repeats responsible-assessment advice that metrics can be gamed, it fails.

Target case: an institution uses a composite scorecard

`score = w_p publications + w_c citations + w_g grants + w_v venue/prestige`

for hiring, tenure, funding, rankings, departmental review, or internal
resource allocation.

## Known background vs. framework contribution

Known background: metric pressure can distort research. Responsible assessment
should avoid substituting journal impact factor, raw citation counts, crude
publication counts, short-window rankings, or other narrow proxies for expert
judgment about research quality and contribution. This application does not
claim novelty for that warning.

Framework contribution to test: the response-modeling contract should change
the evidence question. Instead of asking only whether the score rose after
metric pressure, it asks which response channel produced the movement and what
would distinguish harmless proxy repair, harmful proxy manufacture, selection,
and genuine improvement in long-run research value.

## 1. Type space

Let researcher, lab, or field type be

`u = (a, r, f, n, c, tau, rho, q, m)`,

where `a` is baseline ability or craft, `r` is resources and institutional
support, `f` is field, `n` is network position, `c` is career stage, `tau` is
risk tolerance, `rho` is topic area, `q` is baseline methodological style, and
`m` is baseline collaboration or publication practice. Let `nu(du)` be the
pre-scorecard type distribution.

The modeling choice is that these features are fixed only at baseline. If the
scorecard induces the same researcher or lab to salami-slice, pursue fashionable
topics, change citation strategy, inflate collaborations, shift venue targets,
repair metadata, improve open data, or strengthen methods, that belongs in
`K_theta(ds | u)` rather than being absorbed into type. [tentative]

Counterexample attempt: one could define `u` to include each researcher's full
future response plan to every possible evaluation regime. That representation
would turn all adaptation into selection over richer types, but it would not
answer the evaluation question because it removes observable behavior change
from the response channel.

## 2. State and baseline behavior

Let observed state be

`s = (P, H, A, C)`,

where `P` is the observed proxy vector, `H` is hidden research value or harm,
`A` is a project and behavior trace, and `C` is composition of evaluated
researchers, labs, fields, departments, applicants, or funded populations.
Baseline behavior is `K_0(ds | u)`, allowing ordinary stochastic variation in
ideas, reviewer decisions, citation accumulation, grant success, collaboration,
and publication timing.

`A` should include, when observable: manuscript splitting or bundling, project
risk, topic shifts, method choices, replication activity, data and code
release, citation practices, authorship and collaboration patterns, venue
targeting, grant tailoring, preprints, metadata repair, and discoverability
work.

## 3. Policy exposure

The policy `theta` is a visible scorecard, threshold, ranking, hiring filter,
tenure rule, funding formula, departmental review, or prestige comparison. It
uses publications, citations, grants, venue prestige, or a composite score.
Let `V` be the private value of clearing the relevant hiring, tenure, funding,
salary, reputation, lab-survival, or institutional-ranking threshold.

The exposure is a Goodhart application only after the observer states whether
`theta` changes `W_theta`, `K_theta`, or both.

## 4. Selection versus fixed-type response channel

The induced law is

`mu_theta(B) = int W_theta(u) K_theta(B | u) nu(du) / int W_theta(u) nu(du)`.

### Pure selection through `W_theta`

Pure selection says `K_theta = K_0` while `W_theta(u)` changes. Examples
include who applies, who is hired, who leaves, who stays, which fields expand,
which institutions gain researchers, which labs receive funding, and which
career stages survive the filter. Score movement then reflects changed
composition rather than changed fixed-researcher behavior.

Discriminator: applicant, funded, employed, or evaluated populations shift in
field, career stage, institution, network position, topic, or baseline
productivity, while continuing researchers show no policy-timed shift in
project or publication traces.

### Harmful fixed-type response through `K_theta`

Harmful fixed-type response says the same researcher or lab changes behavior
after exposure, and the score-improving action lowers hidden research value.
Examples include salami slicing, citation clubs, strategic self-citation,
honorary authorship, short-window topic chasing, venue gaming, grant tailoring
that displaces better projects, safer incremental work, and suppression of
negative or slow-value results.

Discriminator: continuing researchers or labs show policy-timed shifts in
project traces, and the largest shifts occur in high score-per-cost channels
without corresponding gains in robustness, originality, replication value, or
long-run uptake.

### Harmless proxy artifact or repair

Harmless proxy movement also changes `K_theta`, but it mainly improves proxy
measurement or discoverability rather than hidden research value. Examples
include correcting affiliations, adding ORCID identifiers, improving metadata,
posting preprints, indexing datasets, standardizing references, or making work
more discoverable. These can raise citations or counts without being either
scientific harm or deep quality improvement.

Discriminator: proxy movement is explained by metadata, indexing,
discoverability, or reporting repairs, while project content and hidden-quality
proxies are stable.

### Genuine research-quality improvement

Real improvement changes `K_theta` through actions that plausibly raise hidden
research value: stronger methods, better-powered studies where applicable,
reusable data and code, careful replication, theory-building, more robust
measurement, useful synthesis, or work that supports later research.

Discriminator: score movement is accompanied by project-level evidence of
stronger methods, reusable artifacts, replication, downstream uptake, or
long-run usefulness, and cannot be explained by composition or proxy artifacts
alone.

### Mixtures

Scientific evaluation systems are likely mixtures. A ranking can change who
applies, which departments invest, what projects are attempted, and how
outputs are packaged. A single classification is not licensed unless the
application can bound mixture shares or show which channel dominates the
design decision at hand. [tentative]

## 5. Action/search geometry

For fixed-type response, use action vector

`a = (a_pub, a_cite, a_grant, a_venue, a_topic, a_method, a_open)`,

where:

- `a_pub`: publication packaging, salami slicing, timing, or count production;
- `a_cite`: citation strategy, visibility work, clubs, or self-citation;
- `a_grant`: tailoring proposals toward fundable themes or grant volume;
- `a_venue`: venue targeting, prestige chasing, or journal strategy;
- `a_topic`: topic choice, novelty/risk, fashion following, or field movement;
- `a_method`: methodological improvement, robustness, validation, replication;
- `a_open`: metadata, open data/code, indexing, and discoverability repair.

A local additive proxy-gain approximation is

`p(a) = w_pub a_pub + w_cite a_cite + w_grant a_grant + w_venue a_venue`.

A qualitative hidden-value model is

`v(a) = h_pub a_pub + h_cite a_cite + h_grant a_grant + h_venue a_venue
        + h_topic a_topic + h_method a_method + h_open a_open`.

Here positive `h_j` means the channel raises hidden research value, negative
`h_j` means it lowers hidden research value, and near-zero `h_j` means mainly
proxy or measurement movement. The signs and magnitudes must be defended from
field-level and project-level evidence, not inferred from score movement.

## 6. Proxy/target relation

`P` includes publications, citation counts, h-index, grants, impact factor,
venue rank, altmetrics, and the composite score. `H` is hidden research value:
originality, robustness, replication value, long-run usefulness, epistemic
diversity, field health, training value, and negative externalities such as
herding, brittle literatures, distorted authorship, or neglected slow work.

The intended relation is `P approx phi(H)` only after field normalization,
career-stage adjustment, time lags, authorship conventions, and output types
are declared. The dimension gap is that long-run scientific value is not the
same object as near-term counts. The observation gap is noise, delay,
field-composition bias, database coverage, and attribution error inside the
measured proxies.

## 7. Aggregation rule

The target scorecard is additive:

`score = w_p publications + w_c citations + w_g grants + w_v venue/prestige`.

If the real institution uses a threshold, lexicographic gate, field quota,
portfolio review, tenure dossier, or committee override, the application must
replace the additive calculation with that rule. Weight units matter:
increasing `w_p` for publication counts or `w_c` for short-window citations
changes behavior even if the institution says the scorecard is only
"informational."

## 8. Hidden harm/value model

This application uses declared hidden research value `v(a)`, not score
movement, as the evaluation object. `h_j > 0` means the response channel raises
hidden value per unit action; `h_j < 0` means it lowers hidden value; and
`h_j approx 0` means it mostly affects proxy measurement, visibility, or
classification. [tentative]

Toy examples: stronger methods may raise citations and hidden value. Salami
slicing may raise publication counts while lowering interpretability or wasting
review attention. Metadata repair may raise discoverability without changing
the research contribution. A slow foundational project may have low short-run
citations and high delayed value.

## 9. Qualitative frontier primitives

These primitives must be declared before the recommendation:

- `kappa`: ease of moving each response channel. Publication packaging,
  citation tactics, and venue targeting may have high short-run `kappa`;
  topic chasing may have medium `kappa`; genuine method improvement,
  replication, and long-run theory work may have lower short-run `kappa`.
  These are field-specific and often unavailable without project traces.
- `h`: hidden research-value exchange rates. Citation clubs, salami slicing,
  and strategic authorship are candidates for negative `h`; metadata repair
  may be near zero or mildly positive; stronger methods, reusable artifacts,
  replication, and durable synthesis are candidates for positive `h`.
- `gamma`: signal adequacy or information value of each proxy component for
  the target. Raw short-window counts often have weak `gamma` for long-run
  value unless field, lag, authorship, and output-type corrections are
  predeclared. If `gamma` cannot be defended before deployment, it is
  unavailable.
- `w`: score weights, threshold leverage, field-normalization choices, and
  committee override rules.
- `V`: private value of hiring, tenure, grant, salary, lab survival, prestige,
  ranking, or departmental resource thresholds.

Claim [tentative]: the contract changes the decision from "which metrics
predict prestige?" to "which high `kappa_j w_j` channels can move the score,
what are their predeclared `h_j`, and does `gamma_j` justify giving the channel
more leverage?" This is not a claim that the institution can estimate all
primitives precisely.

## 10. Evidence standard

Evidence for pure selection:

- applicant, funded, hired, retained, or evaluated populations change by
  field, topic, career stage, institution, network position, or baseline style;
- continuing researchers show no policy-timed shift in project traces;
- baseline type distributions predict the apparent score movement.

Evidence for fixed-type response:

- same-researcher or same-lab panel data show changes in publication packaging,
  citation behavior, grant strategy, venue targeting, topic choice, open
  artifacts, methods, or replication after exposure;
- staggered scorecard adoption, threshold discontinuities, or weight changes
  shift the predicted action traces;
- exogenous variation in `V`, `w`, audit intensity, caps, or reporting costs
  changes behavior as the action model predicts.

Evidence for harmful gaming:

- score gains concentrate in negative-`h` channels such as salami slicing,
  citation inflation, authorship inflation, or short-window topic herding;
- hidden-quality proxies do not improve, or field health worsens;
- gains are strongest where the private threshold value `V` is highest.

Evidence for harmless proxy repair:

- score movement is explained by metadata correction, indexing, open
  availability, affiliation cleanup, or discoverability work;
- project content, methodological quality, and long-run uptake are stable.

Evidence for real improvement:

- project traces show stronger methods, reusable artifacts, replication,
  durable synthesis, or improved measurement;
- downstream use persists beyond short citation windows;
- composition changes, citation tactics, and output packaging cannot explain
  the score movement.

## 11. Licensed calculation

The licensed calculation is conditional and diagnostic. For a researcher or lab
with score deficit `d > 0`, separable quadratic local costs

`c(a) = sum_j a_j^2 / (2 kappa_j)`

and additive proxy gain `w . a`, the minimum private cost of buying enough
score is

`m(d) = d^2 / (2 sum_j kappa_j w_j^2)`,

and the cost-minimizing action allocation is

`a_j^*(d) = d kappa_j w_j / sum_i kappa_i w_i^2`.

This is not an empirical estimate of scientific behavior. It is an audit
diagnostic: high `kappa_j w_j` channels are where score pressure is expected
to show up first, and `v(a^*(d))` is not a welfare or research-value conclusion
unless `h` was declared separately. If response costs are lumpy, career-stage
dependent, field-constrained, reputation-mediated, or detection-penalized, the
quadratic calculation should be replaced or left unused.

## 12. Changed design or audit decision

Changed design: do not increase weight on fast-moving scalar metrics, such as
short-window citations or publication counts, unless signal adequacy `gamma`
is predeclared and there is an audit plan for topic herding, salami slicing,
citation clubs, field-composition shifts, and delayed-value suppression.

Operationally:

- prefer field-normalized, lag-aware, portfolio-level, and
  qualitative-review-backed evidence when the target is long-run research
  value;
- rank candidate proxy components by `kappa_j w_j` and audit high-leverage
  channels before interpreting score gains as quality gains;
- treat raw publication and citation gains near high-`V` thresholds as
  mechanism-ambiguous until same-researcher traces and composition shifts are
  checked;
- add a proxy component only when predeclared `gamma_j` justifies the extra
  attack surface through `kappa_j`, `h_j`, `w_j`, and `V`;
- mark primitives unavailable rather than importing the quadratic diagnostic
  when field-level evidence cannot support them.

This differs from the hospital case because the central design warning is
about fast scalar research proxies and delayed value: a short-window metric may
be easy to move and weakly informative even when no immediate welfare harm is
visible.

## 13. Discriminator observation

Primary discriminator: after a staggered change in a hiring, funding, or
departmental scorecard, continuing researchers just below a threshold show
disproportionate movement in the channels predicted by `kappa_j w_j`. If the
movement is mostly salami slicing, citation tactics, strategic authorship, or
short-window topic chasing while robustness and long-run uptake are flat, the
harmful fixed-type response contract is favored. If the movement is mostly
metadata and discoverability repair with stable hidden-quality proxies, the
proxy-repair contract is favored. If the movement is mostly stronger methods,
replication, reusable artifacts, and later durable uptake, the real-improvement
contract is favored. If continuing researchers do not move but the applicant,
field, institutional, or funded population changes, the pure-selection
contract is favored.

Secondary discriminator: changes in weights, citation windows, field
normalization, audit intensity, or private threshold value `V` should move the
specific response channels predicted by the declared action geometry. Failure
of these comparative statics weakens the fixed-type response model.

## 14. contract-failure condition

The scientific-metrics contract fails as a framework application if:

- the qualitative `kappa`, `h`, `gamma`, `w`, or `V` primitives are assigned
  only after observing which metric moved;
- there is no same-researcher or same-lab panel data and composition changes
  can fully explain the score movement;
- exposure timing, thresholds, weights, or audit changes are unobserved;
- project-level traces are unavailable, making salami slicing, citation
  tactics, metadata repair, method improvement, and topic change
  indistinguishable;
- no hidden-quality proxies or defended qualitative review process can
  distinguish proxy movement from long-run research value;
- the declared additive score differs from the aggregation rule actually used
  by committees, funders, or ranking systems.

## Local verification-stack pass

Idea: the scientific-metrics contract licenses a design and evidence decision:
do not add weight to fast scalar research metrics unless their signal adequacy
and response channels have been predeclared and audited.

Layer 1: thought experiments

- Selection mistaken for intervention: a citation-heavy funding rule attracts
  senior network-central applicants and deters early-career or slower-field
  applicants. Aggregate scores rise, but continuing researchers do not change
  behavior. This kills a fixed-type response claim unless panel traces move.
- Harmful gaming mistaken for real improvement: publication counts rise
  through salami slicing and honorary authorship, while replication,
  robustness, and long-run use do not improve. This kills quality credit from
  `P` alone.
- Harmless proxy repair mistaken for harm: ORCID cleanup, preprint posting,
  and better dataset indexing raise citations or altmetrics without changing
  project content. This kills the claim that every metric response is harmful.
- Real improvement mistaken for gaming: a lab improves methods, releases
  reusable artifacts, supports replication, and later receives durable uptake.
  This kills a harmful-Goodhart label for that response channel.
- Delayed value suppressed by short windows: a foundational project loses
  score share to faster citation-producing work. This exposes the need for
  predeclared `gamma` for short citation windows.

Layer 2: real-world correspondence

Required observable data before the recommendation is licensed:

- repeated researcher, lab, project, department, and field identifiers before
  and after policy exposure;
- scorecard rules, weights, thresholds, citation windows, field normalization,
  committee overrides, audit rules, and timing;
- applicant, hiring, retention, funding, and field-composition data;
- project traces for packaging, authorship, citations, venues, topics,
  methods, replication, open artifacts, and metadata repair;
- hidden-quality evidence such as expert portfolio review, replication and
  robustness indicators, reuse of data/code, durable downstream uptake, and
  field-health indicators;
- variation in exposure, `V`, weights, audit pressure, citation windows, or
  normalization rules.

Passed: the recommendation is observable in principle because it asks for
evaluation-system objects that institutions may already track: panel records,
score rules, applicant and funding composition, project traces, and qualitative
review evidence.

Survived only barely: `h` and `gamma` are field-specific and may be contested.
The application can license a conservative design rule for fast scalar metrics
and an evidence-collection plan, but it cannot claim a universal research
value ordering.

Killed: if no panel traces, exposure timing, project-level records, or
hidden-quality evidence are available, the application cannot do more than
repeat the responsible-metrics background warning.

Verdict: the narrow surviving claim is a novelty-bound design/evidence claim.
For scientific evaluation, the framework does not add the generic warning that
metrics distort science. It adds a discriminator contract: separate selection,
fixed-researcher response, proxy artifact repair, and genuine research-quality
improvement before increasing the leverage of fast scalar metrics or crediting
score movement as long-run research value.
