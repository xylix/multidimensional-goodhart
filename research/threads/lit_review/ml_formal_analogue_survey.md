# Thread: ML formal analogue survey

Iteration type: `theorem-mapping`

## 1. Purpose

Iteration 22 asks which existing ML theorem families have the same primitive
shape as the current Goodhart framework. This is a mapping pass, not a claim
promotion pass. The question is:

- what formal object does the ML work actually define;
- which framework primitive it resembles;
- what theorem content is established rather than analogical;
- what observation would falsify the proposed mapping in a worked application.

This note should feed Iteration 23's worked ML benchmark contract. It should
not be imported into Chapter 5 until the primitive map and falsifiers are
explicit.

## 2. Source discipline

Primary sources checked:

- Dwork, Feldman, Hardt, Pitassi, Reingold, Roth, "Generalization in Adaptive
  Data Analysis and Holdout Reuse" / reusable holdout
  (`https://arxiv.org/abs/1506.02629`, Science/JMLR pages).
- Blum and Hardt, "The Ladder: A Reliable Leaderboard for Machine Learning
  Competitions" (`https://arxiv.org/abs/1502.04585`).
- Cawley and Talbot, "On Over-fitting in Model Selection and Subsequent
  Selection Bias in Performance Evaluation" (`https://www.jmlr.org/papers/v11/cawley10a.html`).
- Roelofs et al., "A Meta-Analysis of Overfitting in Machine Learning"
  (`https://papers.neurips.cc/paper/9117-a-meta-analysis-of-overfitting-in-machine-learning`).
- Recht, Roelofs, Schmidt, Shankar, "Do ImageNet Classifiers Generalize to
  ImageNet?" (`https://proceedings.mlr.press/v97/recht19a.html`).
- Hardt, Megiddo, Papadimitriou, Wootters, "Strategic Classification"
  (`https://arxiv.org/abs/1506.06980`).
- Perdomo, Zrnic, Mendler-Dunner, Hardt, "Performative Prediction"
  (`https://arxiv.org/abs/2002.06673`), and Mendler-Dunner et al.,
  "Stochastic Optimization for Performative Prediction"
  (`https://arxiv.org/abs/2006.06887`).
- Skalse, Howe, Krasheninnikov, Krueger, "Defining and Characterizing Reward
  Gaming/Hacking" (`https://papers.nips.cc/paper_files/paper/2022/hash/3d719fee332caa23d5038b8a90e81796-Abstract-Conference.html`,
  `https://arxiv.org/abs/2209.13085`).
- Pan, Bhatia, Steinhardt, "The Effects of Reward Misspecification"
  (`https://arxiv.org/abs/2201.03544`).
- Gao, Schulman, Hilton, "Scaling Laws for Reward Model Overoptimization"
  (`https://proceedings.mlr.press/v202/gao23h.html`).

## 3. Mapping table

| ML theorem family | Established content | Framework primitive map | Non-binding analogy boundary | Falsifier for a worked application |
| --- | --- | --- | --- | --- |
| Checkpoint/model selection and hyperparameter search | Cawley and Talbot show that optimizing a noisy model-selection criterion can overfit the criterion and bias performance evaluation; the effect is not limited to training parameters. | Pure selection over a fixed candidate set: candidate checkpoints/models are types, validation score is proxy `P`, held-out target metric is hidden outcome `H`, and the selection rule is threshold/top-k/argmax weighting. | This does not model finetuning, RLHF, prompt adaptation, or data contamination after benchmark exposure. It supplies selection-response and evidence-standard primitives, not action/cost geometry. | Same checkpoint evaluated before and after exposure changes behavior; action traces show post-score adaptation; or the selected candidate set was generated adaptively from leaderboard feedback rather than fixed before evaluation. |
| Adaptive holdout / reusable holdout | Dwork et al. formalize adaptive reuse of a holdout and give algorithms for many adaptively chosen validations while controlling overfitting. | Selection/evidence primitive for repeated benchmark querying: the public score is a feedback channel, the hidden object is performance on the still-private distribution, and the response channel is repeated adaptive query selection. | These results are about statistical validity under adaptive queries. They do not identify hidden welfare, agent costs, or whether a model changes at fixed type. | Benchmark submissions are not merely adaptively selected from a sequence but are trained using leaked examples or direct private-test feedback; then the mechanism is intervention/search rather than holdout reuse alone. |
| Leaderboard algorithms and empirical leaderboard overfitting | The Ladder gives a formal leaderboard-accuracy target for adaptive competitions; Roelofs et al. find little substantial Kaggle public/private overfitting in their meta-analysis; Recht et al. show new CIFAR/ImageNet test sets produce drops, but gains transfer and difficulty shift matters. | Evidence-standard primitive for benchmark claims: public/private splits and regenerated test sets distinguish selection overfitting, distribution shift, and benchmark difficulty changes. | These works do not imply "leaderboards are safe" in general, nor that Goodhart drift is absent. They show that adaptivity is only one possible cause of public/private gaps. | Public leaderboard progress fails to transfer to private or regenerated tests in a way correlated with number of adaptive submissions, or new-test drops are explained by dataset-difficulty shift rather than adaptivity. |
| Strategic classification | Hardt et al. model a sequential game: classifier chosen first, strategic individuals alter features at a cost to obtain favorable classification; robust classifiers can be learned for natural cost classes, while general cost cases can be hard. | Intervention/action-cost primitive: types are individuals' original features, policy exposure is the published classifier, actions are feature changes, costs govern feasible movement, and target accuracy is evaluated on original or true labels. | This is the closest formal analogue to the Stackelberg action-cost toy, but it still does not supply a hidden welfare functional unless one is declared. It also need not be quadratic, convex, or additive. | If individuals only choose whether to participate, not how to change features, the case is selection. If observed changes are real improvements rather than proxy-only movement, a gaming-harm mapping is false without a target/harm model. |
| Performative prediction | Perdomo et al. formalize predictors whose deployment changes the future data distribution and define performative stability; Mendler-Dunner et al. analyze stochastic optimization when deployment itself shifts the distribution. | Response-kernel primitive: policy `theta` changes `K_theta` or `mu_theta`; retraining/deployment dynamics are part of the response channel; endogenous-stakes questions belong here rather than inside the static Stackelberg wedge. | Performative stability is not a welfare theorem and does not by itself classify selection versus intervention at the type/action level. It also does not identify `V(H_obs)` for the project's endogenous-stakes open problem. | Deploying the predictor does not measurably change the data-generating distribution, or distribution shift occurs through exogenous drift rather than policy-caused response. |
| Formal reward gaming / unhackability | Skalse et al. define reward hacking as optimizing an imperfect proxy reward causing poor true-reward performance, and characterize strong unhackability conditions. | Proxy/target primitive: proxy reward is `P` or `tilde R`, true reward is protected target/harm functional, and policy optimization is pressure on the proxy. | This gives a clean proxy/target welfare object, but not the response cost/search geometry that determines which exploit is found. It should not be collapsed into the convex-cost budget. | Proxy reward increase is always accompanied by true reward increase over the relevant policy class; or the "true reward" is not separately declared, making reward hacking untestable. |
| Reward misspecification and reward-model overoptimization | Pan et al. empirically vary model capacity, action resolution, noise, and training time and observe capability thresholds and true-reward drops; Gao et al. measure proxy-reward optimization against a proxy reward model versus a gold reward model, finding method-dependent overoptimization curves. | Search/optimization-pressure primitive: capability, action resolution, KL penalty, model size, and best-of-n/RL optimization are candidate pieces of an ML response geometry. | These are empirical/theorem-adjacent anchors for future ML mappings, not a license to set `kappa = model size`, `kappa = gradient accessibility`, or `V = benchmark prize`. Those are candidate model choices requiring a separate contract. | Gold-standard reward does not decline under stronger proxy optimization, or the observed decline is caused by distribution shift/label noise unrelated to reward-model exploitation. |

## 4. Candidate worked example for Iteration 23

Best candidate: an ML benchmark used both for checkpoint selection and
finetuning/RLHF-style improvement.

Why: it cleanly contains both channels.

- Checkpoint selection can instantiate pure selection if candidate checkpoints
  are fixed before benchmark exposure.
- Finetuning or RLHF after benchmark feedback is intervention/search only after
  declaring the action/search geometry.
- Leaderboard/reusable-holdout work supplies evidence standards for public vs.
  private score gaps.
- Reward-overoptimization work supplies a proxy/target analogue when a proxy
  reward model and gold/human target are separately measured.

Minimum falsifiers for the worked example:

- If repeated benchmark exposure changes the same model/policy at fixed
  checkpoint identity, pure checkpoint selection is false.
- If public/private gaps do not correlate with adaptive submissions or feedback
  access, leaderboard-overfitting is not the main explanation.
- If optimizing the benchmark also improves the declared hidden target, the
  reward-gaming or hidden-harm mapping is false for that regime.
- If no action/search cost or accessibility primitive is declared, Proposition
  2 or 3 cannot be imported.

## 5. Takeaways

Claim [tentative]: ML has several strong formal analogues for pieces of the
framework, but no single theorem family supplies the whole response-modeling
contract. Adaptive data analysis and leaderboard work cover repeated selection
and evidence standards. Strategic classification covers costly fixed-type
feature changes. Performative prediction covers deployed-policy distribution
shift. Reward-gaming work covers proxy/target separation. Reward
overoptimization supplies empirical response curves for proxy optimization.

Counterexample attempt: one might claim reward-model overoptimization already
is the full ML version of multidimensional Goodhart. It is not. It has a proxy
reward and a target reward, but the response geometry depends on whether the
optimizer is best-of-n sampling, RL with KL penalty, finetuning, prompt search,
or benchmark contamination. The framework's contract remains needed.

Practical rule for the book: do not say "the Stackelberg wedge applies to
RLHF." Say: an ML application may import a selection bound, action-cost budget,
or aggregation result only after matching the response primitives above.
