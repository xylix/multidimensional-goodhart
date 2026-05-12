# Capped fixed-charge response shapes

## Iteration 10: caps turn one-channel sparsity into lumpy spillover

This iteration develops the fixed activation / linear-cost row from the Iteration 9 response-shape audit. The target is not a new general Goodhart theorem. It is a sharper conditional shape prediction:

> Uncapped linear costs can produce one-channel drift. Caps turn that result into ordered spillover. Fixed activation costs add entry thresholds, so the full fixed-charge model is lumpy but not always simple cheapest-marginal filling.

Use the Iteration 7 notation. Channels `j = 1,...,k` have action `a_j`, score weight `w_j > 0`, linear marginal cost `q_j > 0`, fixed activation cost `F_j >= 0`, and cap `u_j in (0, infinity]`. For a score deficit `d > 0`, the agent solves

`min sum_j F_j 1{a_j > 0} + sum_j q_j a_j`

subject to

`sum_j w_j a_j >= d`, and `0 <= a_j <= u_j`.

The hidden drift shape is the support and allocation pattern of `a^*(d)`. The relevant marginal cost per score unit is

`r_j = q_j / w_j`.

The problem is infeasible iff `d > sum_j w_j u_j`.

## Case 1: uncapped linear or fixed-charge model

If all caps are infinite and the optimum must hit a one-shot target, the cost of using only channel `j` is

`F_j + r_j d`.

Thus a single-channel optimum exists:

`j^*(d) in argmin_j (F_j + r_j d)`.

If the minimizer is unique, the optimizer is one-channel:

`a_{j^*} = d / w_{j^*}`, and `a_i = 0` for `i != j^*`.

This recovers the Iteration 7 sparse-attractor toy. The important refinement is that the identity of the active channel can depend on `d` when fixed costs differ. Low fixed cost can win for small deficits; low marginal cost can win for large deficits.

Toy threshold. Channel A has `F_A = 0`, `r_A = 3`; channel B has `F_B = 10`, `r_B = 1`. A costs `3d`; B costs `10 + d`. A wins for `d < 5`, both tie at `d = 5`, and B wins for `d > 5`. The shape is still one-channel away from the tie, but the chosen channel switches as pressure increases.

Claim [tentative]: in the uncapped fixed-charge/linear model, one-channel sparsity is licensed, but the active channel can change with the deficit. "The cheapest exploit" is not necessarily a fixed channel across all optimization pressures.

Counterexample attempt: if there are exact ties in `F_j + r_j d`, multiple one-channel optima exist, and mixtures or conventions can realize different support patterns without changing cost.

## Case 2: capped linear model without activation thresholds

Set `F_j = 0` or treat activation costs as already paid. If the channels are sorted so

`r_1 < r_2 < ... < r_k`,

then an optimizer fills the cheapest score units first:

- choose `a_1 = min(u_1, d / w_1)`;
- if `w_1 u_1 < d`, set `a_2 = min(u_2, (d - w_1 u_1) / w_2)`;
- continue until the residual score deficit is zero.

Equivalently, define cumulative score capacities

`S_m = sum_{j <= m} w_j u_j`.

If `S_{m-1} < d <= S_m`, then channels `1,...,m-1` are full, channel `m` is partially used, and channels after `m` are unused:

`a_j = u_j` for `j < m`,

`a_m = (d - S_{m-1}) / w_m`,

`a_j = 0` for `j > m`.

This is the staircase shape prediction: support grows when the target crosses capacity thresholds. It is neither dense quadratic spreading nor permanent one-channel drift.

Toy spillover. Let `w_j = 1`, `u_1 = 2`, `u_2 = 3`, `u_3 = 10`, and `q = (1, 2, 5)`. For `d <= 2`, only channel 1 is used. For `2 < d <= 5`, channel 1 is capped and channel 2 receives the residual. For `5 < d <= 15`, channels 1 and 2 are capped and channel 3 receives the residual. At `d > 15`, the target is infeasible.

Claim [tentative]: capped linear response produces lumpy ordered spillover in a pre-specified channel basis. The support-size path is monotone in `d` under distinct marginal costs and fixed caps: new channels enter only when cheaper channels saturate.

Counterexample attempt: if marginal costs tie, any allocation among tied channels is optimal until their combined capacity is exhausted. The sorted-staircase claim should be stated for strict `r_j` order or for blocks of tied channels.

## Case 3: fixed activation plus caps

With positive fixed costs and finite caps, pure marginal sorting is no longer exact. The optimizer pays an entry cost for every channel with `a_j > 0`, so it can be cheaper to use a high-marginal-cost channel with low fixed cost at small `d`, then switch to a lower-marginal-cost high-fixed-cost channel at larger `d`.

The exact finite-dimensional problem can be characterized by candidate paid sets. For each set `M`, if `d <= sum_{j in M} w_j u_j`, the best allocation allowed to use only `M` fills channels in `M` by increasing `r_j` after paying `sum_{j in M} F_j`. The global optimizer is the cheapest such candidate:

`min_M [sum_{j in M} F_j + linear_fill_cost(M, d)]`.

Redundant paid-but-unused channels are dominated, so any minimizing candidate corresponds to a genuine support set after dropping unused channels. This is enough for the research claim. The shape is lumpy and low-support when fixed costs are large, but it is not guaranteed to be the global sorted fill over all channels.

Toy fixed-charge cap counterexample. Let `w_j = 1`. Channel A has `F_A = 0`, `q_A = 3`, `u_A = 4`; channel B has `F_B = 5`, `q_B = 1`, `u_B = 10`. For `d = 1`, A costs `3` and B costs `6`, so A wins. For `d = 4`, A costs `12` and B costs `9`, so B wins. If `d = 6`, A alone is infeasible, and B must enter; the optimizer uses B alone at cost `11`, not A capped plus B residual at cost `0 + 12 + 5 + 2 = 19`. Activation costs can make the optimizer skip a previously cheap small channel rather than fill it first.

Claim [tentative]: positive fixed costs plus caps license an entry-threshold or regime-switch prediction, not a universal sorted-filling theorem. The robust qualitative shape is lumpy support expansion and channel switching as `d` crosses cost/cap thresholds.

Counterexample attempt: with very small fixed costs, the model approaches capped linear filling; with very high fixed costs, it may stay one-channel until infeasible or until a large deficit justifies a new channel. Therefore "capped fixed-charge" is a family of support paths rather than a single path.

## Goodhart reading

This iteration refines the sparse-attractor story. If a proxy can be gamed through one cheap uncapped route, response may concentrate on that route. If the route has a cap, limited concealment budget, or detection threshold, pressure spills into the next available route. If each route has setup overhead, the spillover is discontinuous: failures can appear as thresholded regime changes rather than smooth substitution.

This is useful for recursive Goodhart because a regulator who closes or caps the visible exploit should not expect hidden drift to vanish. In this toy family, the next residual shape is predictable from channel caps, activation costs, and marginal score costs. But the prediction is conditional: it requires pre-specified channels and known cost/cap structure.

## Immediate takeaway

Claim [tentative]: the fixed activation / linear-cost row should now read: uncapped linear or fixed-charge costs can produce one-channel drift; caps convert this into lumpy spillover across channels; positive activation costs introduce entry thresholds and channel switching. This supports a concrete response-shape prediction for Q18 without upgrading it into a generic minimum-complexity law.

Future work should compare this support-size path to active-face quadratic models and to search-prior models under the same pre-specified hidden coordinate system.
