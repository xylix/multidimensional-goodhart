---
title: Deep Goodhart
tagline: 'Claim: As you try to control for Goodhart, it becomes more complex'
tags: ['research', 'cognitech']
---


outline:


- Goodhart 101
- The multi-dimensional error
- Trying to control for error
- => Error changes shape
    - Less (measurable) magnitude, more informational complexity (on average)
- 


## Goodhart's law

> When a measure becomes a target, it ceases to be a good measure

Or, literally

> Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes.


### Multi-dimensional error

disclaimer: Everyone I've discussed this with thought that it ~makes sense. some posts ([^1], Categorizing Variants of Goodhart’s Law[^2], ) touch the concept, but I haven't seen it explicitly defined - if you know a full mathematical definition with the implications calculated out please link it!

- Notation: Let's start from the notation introduced in Categorizing Goodhart's Law[^2]:
TODO: insert latex here

But make it multidimensional.

Let's define an agents goal as $G(x) \in R^m$

And a proxy as $P(x) \in R^k$

TODO: invent notation
Let's define proxy P that is trying to approximate goal G as $P $
Math: The proxy includes some subset of dimensions of G, and tries to control their error to some pareto optimality frontier, e.g. the proxy is doing TODO math out the minimization operation.
(NOTE: integrate below intutition stuff here)

Intuition: If we're talking of human goals or multi-human-agent goals (corporations, countries, coalitions), then the real goal has more dimensions than the formal proxy.
    Basis: I have not seen a formal description of an individuals goals (for example, an utility function), that would actually capture all of the dimensions in their 
    e.g. without actually doing the math I'm claiming that $\forall G $
Note: Lets say a company has goal G, and sets proxy goal P for a quarter. The implementations of proxy goal P, $P_i$ that the actual teams and individuals will try to follow can have an arbitrary number of dimensions; because the implemented proxy includes the individual goals of the implementers of that proxy, it's dimensionality will be $max dim P_i, i \in N$
Corollary: When a simpler agent (one whose goals have less dimensions) tries to set goals for agents whose goals have less dimensions, 
    - Consequence: If a human tries to define a proxy that will succesfully align a superintelligence whose goals have more dimensions than the humans, the proxy must be more complicated than the humans own goals, and therefore it will contain error in dimensions that the humans G cannot be compared against. _Incomputable noise._
        - TODO: can we use partial hypotheses (ala infra bayesianism) to fix some of this?
        - TODO: Argue that a superintelligence may have more or less goal dimensions than a human, but it is not clear that it should have less.



Let's define the claim of Goodhart's law in this notation:

> Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes.












Intuition: one cannot do hyperparameter optimization algorithms and approaches without understanding the part of this phenomena that is ML relevant. Therefore existing machine learning literature should include theorems and algorithms that implement a part of what we're talking about here.
(TODO: clarify this after I have defined my own math - and double check with someone who understands.)
    (I'm drawing some parallels to common machine learning math here - 
    ChatGPT:
    > Yes. The ML-native version is:
    > 
    > Goodhart = optimizing an empirical/scalar proxy selects for large residual generalization error.
Vector Goodhart = this residual is not one scalar gap but a vector/subspace of gaps, some visible and some unmeasured.






NOTE: is this a good idea?
- Also let's assume a simple model where many forms of error are normally distributed
    - Real errors should be distributed in various ways, but due to Central Limit Theorem as we describe enough dimensions as normally distributed the amount of error this model has should approach normal distribution => it should be informative, if not correct, in most cases.
        - TODO: better math



## Recursive goodhart



- The problem identified by Goodhart's law has two attack surfaces here:
        - TODO: define a term for this
            - It's not Goodhart that is attacking the system - it's the phenomena that the law observes
    1. It can attack the Goal
    2. Or the Proxy
- The literally usually talks about 2. Let's go in-depth to it:
    - Let's assume agent A defined some proxy goals, then observed how they are performing within a team in their corporation.
    - The teams measured performance by these goals is then going to be P+e, where error describes the error term.
    - 


- Aside: Attacking the goal:
    - Let's take an agent A who is setting up some measures to try and optimize the system they are working with.
    - A's stated goal is 'make a good product which will attract customers and therefore generate money'. 
    - A's internal goal is more complicated and more closely modeled by variables such as 'receive prestige from being the CEO of a succesful startup', 'make a lot of money', 'enjoy the time spent on the project', etc.
    - In theory A's current utility function perfectly describes the sum of these variables.
    - But when A investigates the difference between their current measure and their imagined optima (e.g. team\_1 is optimizing too hard to look good on the metrics, and the real project isn't advancing as fast as the metrics claim), the perceived difference is not going to be the real difference between the companys utility function and team\_1's performance, or the CEO's utility function and the teams performance. It's going to be the difference between the felt proxy that the CEO is using to notice that a mistake is happening, and the teams actual performance.
    - => The point: If the CEO notices that team\_1 is drifting to error in dimensions d\_1 and d\_2, and performs a correction, the correction is between the team working towards their internal proxy P\_team, that was derived from P\_strategy, which was a proxy of the companys goals, which are a proxy of the leadership's and ownership's real utility function.
        - When working with one dimension of error, and if the levels of the hierarchy are reasonably aligned, the process should manage to correct that dimension of error to some degree, because each layers perception error is to some degree independent of the other layers, and therefore 
            - If the layers perception errors are heavily correlated then we are in a fragile situation, like a centrally planned organization.
                - TODO: elaborate fragility
        - TODO: do some math




## Footnotes

[^1]: https://medium.com/@johnwentworth/constructing-goodhart-b4964932213
[^2]: https://arxiv.org/pdf/1803.04585

