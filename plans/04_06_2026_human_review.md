
Human review notes on the book .pdf

Status: active work in progress. Some actionable items have been distilled into
`plans/polish.md`, but this raw review file is still open for continued review
notes.

Distillation note (June 9, 2026): the notes below through "Next: Figure 4"
have been cross-referenced against `polish.md` — comprehension/exposition
items live in its Phase 2/3 sections 1–10; synthesis points that combine
these notes with the June 9 consistency review live in its section 12.
Notes added below this point are not yet distilled.

- > The dimension gap is the part of target variation the proxy map cannot see, represented by directions such as ker 𝜑
    - I don't understand why a kernel represents the dimensional gap (like I know too little linear algebra notation - need this explained in an ELI 5 style, not in the paper). Also is the 'such as' the most precise / best wording for what we mean here?

- Also don't follow the definition of a response kernel A response kernel 𝐾𝜃(𝑑𝑠 | 𝑢) is the conditional law
    - Nor the 𝜇𝜃(𝐴)= formula definition
4:
- > Figure 1: Dimension and observation gaps are different contract fields. The schematic licenses the split in vocabulary, not a quantitative conclusion.
    - I think we are using 'licenses' very autistically here. A problem with the prompt?
    - Also the initial picture doesn't make sense. I understand the right side picture, but the left side picture is what - describing the target space, which is represented by the square (i follow) and then it has a dotted line in the middle splitting the directions seen by phi and not seen by phi
        - If we're trying to describe the space of dimensions phi maps then I would use a radar graph with a line in the middle, not a square? A square (without dimension arrows, and we don't want to do n dimension arrows) intuitively feels like it's representing a 2d-space, which is not at all whats going on here.

        - I might be uderstanding phi a bit better after looking at the graph though.

- > The negative results are not housekeeping; they are the reason the framework has its current shape.
    - This is again imprecise / bad language for what we mean. What do we mean?
    - The negative results are one core pillar of what was produced during the 46 iterations of math.
    - -> They are a research result, henceforth we want to present them.
    - But the formulation here is bad.
    - "List of observed and proven negative results; these failures block a single “n-dimensional Goodhart law.” What survives is a set
of conditional calculations plus a discipline for saying when each calculation applies."
        - should we separate the negative results we managed to prove and the ones where we didn't go that deep? Or is each one proven?

5. 
- > The contract below is not a theorem about what proxy pressure will do. It is a methodological definition: the minimum declaration needed before a proposed Goodhart calculation can be evaluated.
    - Why (from the readers perspective; from my perspective this makes sense) would the contract be a theorem about what proxy pressure will do?
        - We should present what it does first, and caveats as a footnote / last part.
- "1.4 The response modelling contract. \n The paper defines a contract on what needs to be declared to perform a rigorous Goodhart evaluation."
    - (Todo: What does rigorous here mean - how rigorous is it? How does it improve on existing work? (This could go on a footnote, or be left out, but I have to understand this part.)
- > Its source is the negative result from the previous section.
    - Could make clearer, for example: The contract's shape was determined after multiple more minimal definitions ended up as dead-ends.
        - Could include the more minimal definitions as an appendix? Because what we are receiving here are sort of ... axioms for the rest of the work? Motivating axiom sets well is important in math.
- > Marginal score movement does not identify hidden welfare, the type weights 𝑊𝜃, the response kernels 𝐾𝜃, the action costs, or the aggregation rule.
    - This seems good!
    - Could perhaps justify why the reader should _want_ the response kernels, the type wieghts, action costs, agg. rule, and the hidden welfare.
        - Hidden welfare should be obvious from the definition of a goal, but is it clear at this point in the paper?
        - NOTE: Are these standard language in the domain or did we invent them?
- > Start with a school score. The district announces that funding will depend on a test-score metric. Next year the average score rises. That one fact is compatible with several different stories:
    - This example is good!
    - Could consider: What kind of explanations existing goodhart models would give, how does the multidimensional model outperform them?
- > The response kernel 𝐾𝜃(𝑑𝑠 | 𝑢) is the conditional law of the observed state for a fixed type 𝑢 after policy exposure 𝜃.

- TODO: I would be interested in seeing (not in the book - as a file in the repo) a machine learning example as well.
    - Or a python implementation or lean implementation of the contract you can plug inputs into.

6.

- The contract
    - Reads a bit noisy?
    - It's both mathy and trying to be plain-language at the same time.
- > The type representation is part of the empirical claim, not notation to hide inside
the model. If 𝑈 includes each school’s whole future response plan, it can make
every intervention look like selection over richer types. If 𝑈 is too coarse, stable
heterogeneity can look like a kernel change. The contract therefore has to defend why
the chosen 𝑢 is fixed for the comparison and why omitted variation belongs in 𝐾𝜃,
𝑊𝜃, or the action model. The induced marginal law 𝜇𝜃 usually cannot distinguish
those choices by itself.
    - This is relevant if true. Unsure of polish. Could maybe use some justifications, or perhaps they are not necessary since they'll be later in the paper?
- After the output is named, the contract should pass a small information accounting check:
    - > Contract adequacy.
        - TODO: This is good to have but I'm too lazy to review it right now.
    - In shorthand, a contract is adequate only if
        - `true input information = raw variables − constraints − redundancies`
        - is enough to identify the claimed output up to the intended invariances.
        - This is good.

8.
- 2 Licensed Calculations
- This section covers T1 and T2 in research/core-math.md.
    - Contextualization could be better? Why are T1 and T2 the first ones? (Or just remove this line from the polished book .pdf)
- I was going to say these look familiar but > These are Hilbert-space Cauchy–Schwarz bounds. makes sense of it.
    - Why are they hilbert-space cauchy-schwarz bounds?A
- > Covariance belongs here only as a local velocity. Along a valid exponential tilt, the derivative at zero pressure is a covariance. At finite pressure, the path response, tail shape, and moment-generating domain matter. That is why the zero-covariance example 𝐻 = 𝑍2 − 1 survives as a warning.
    - I haven o idea what this means.
    - What is valid exponential tilt?
    - Why is derivative at 0 pressure a covariance?
    - That is why the zero-covariance example 𝐻 = 𝑍2 − 1 survives as a warning.
        - This seems like a weird sentence? Like the voice / tone is weird.
9.
- Figure 2:
    - Why are we mapping two hidden coordinates specifically? Why is there a stretched circle?
    - > Boltzmann-style pressure
paths are trajectories inside that declared geometry, not replacements for the finite-
pressure bound.
    - What does this mean? Why would they be replacements for the finite-pressure bound? What do trajectories inside that declared geometry imply?
- 2.2 Intervention channel
    - (NOTE taking a break now after approx 20 minutes of reading)
    - I don't understand.
    > Before an intervention calculation can be used, the contract must supply a fixed-type action model: actions 𝑎, private cost 𝑐(𝑎), proxy gain 𝑤 ⋅ 𝑎, score deficit 𝑑, and stakes 𝑉 . The calculation measures the affordability of proxy movement under that model
        - This seems clear-ish, but it probably could be a bit more clearer.
    - > In the one-dimensional noiseless threshold toy with quality 𝑄, action 𝑎 ≥ 0, private cost 𝑎2 2𝜅, threshold 𝑡, and stakes 𝑉 , gaming by a below-threshold unit is privately worthwhile exactly when 𝑡 − 𝑄 ≤ √2𝜅𝑉.
        - Why so?
        - What does this mean / imply?
    - The wedge √2𝜅𝑉 is a signature of this quadratic toy. It is not a universal intervention law and should not be read as an RLHF, benchmark, or organizational theorem unless the action, cost, stakes, and pass condition have been declared
        - Why is a random quadratic toy deserving the name of our Theorem 3?
    - T4: I get the idea but not the implementation.
        - >  Gaming under stakes 𝑉 is feasible exactly when 𝑚(𝑑) ≤ 𝑉 in this declared private-cost model.
            - Why?
        - 𝑚(𝑑) = sup [𝜆𝑑 − 𝑐∗(𝜆𝑤)] 𝜆≥0
            - What is c\*?
            - Why are the lambdas on both terms inside the brackets?
    - > Cost minimization and hidden-welfare assessment answer different questions. For example, if two proxy channels have equal private cost and equal score weight but hidden harm vector (𝑀, 0), cost minimization splits effort while hidden harm grows with 𝑀. The budget licenses private affordability; welfare requires a hidden harm functional.
        - Not quite getting it.
10.
- Figure 3:
    - I'm not getting the graying out on the left-hand side.
    - Nor the barely not-linear line
    - I'm not getting the right hand side either (but t5 is only introduced at the end of the page.
    > Figure 3: T4 locates the private cost-minimizing action for a score deficit. T5 then requires hidden harm exchange rates before that action can be interpreted as welfare movement.
        - Requires hidden harm exchange rates? Can these even be defined? The harm is hidden..
- 2.3
    - T5:
        - The sum should be able to be simplified, no?
        - Theres a shared 𝜅\_j and 𝑤\_j on both the dividee and divider.
        - > Fixed-deficit harm is conserved across compared active measured sets exactly when ℎ𝑗= 𝑐𝑤𝑗 on those active channels.
            - Hmm?
        - > This is the most exportable scorecard result. It says what must be checked before saying whether adding or removing a measured channel helped, hurt, or only re- routed harm: the hidden harm per score unit has to be declared or estimated. Holmstrom–Milgrom multitasking is the closest economics precedent, but the contract here makes the hidden-harm exchange rate explicit.
            - Why is this a scorecard result?
            - The economics multitasking reference sounds promising.
                - But where's the grounding? I couldn't find anything substantive in the repo, only vague mentions of Holmstrom-Milgrom. It should be in one of the lit review files if it's relevant?
        - > The result is fixed-deficit and per-agent. Population entry is separate: lowering the private cost of reaching the score can recruit more units into gaming even when each fixed-deficit gamer has conserved harm. Conjunctive aggregation is separate too; requiring every measured component to clear a bar can make harm grow with the number of components.
            - Here I feel like I'm almost getting it but not quite.
- (another break)
    - Next: Figure 4

- note: almost feels like the paper's talking past itself a bunch of times. There's hardly a coherent main thread that's making a point.
