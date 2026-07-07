"""Programmable response-modeling contract: prototype static analyzer.

This module makes a small slice of the repo's response-modeling contract
(research/formalization.md, research/applications/application_template.md)
machine-checkable. The design rule is the one argued in the project notes:
the analyzer is a *type system, not a calculator*. Given a declared contract
it emits

  - Certificate: a quantitative statement licensed by a named result
    (T1/T2 selection bound, MDP value iteration, hitting-probability model),
    together with the conditions it is licensed under; or
  - Refusal: a named conclusion the declaration does NOT license, with the
    missing field. Refusals are first-class outputs, not errors.

Scope (deliberately narrow, matching the two toy examples):
  * Selection channel: T1/T2 chi^2 drift certificates for best-of-n style
    reweighting, plus tail-regime qualitative prediction gated on a declared
    coupling-tail field.
  * Fixed-type response channel (finite MDP): spec-level misalignment via
    value iteration (does the proxy-optimal policy lose true value?), plus a
    dynamics-level basin estimate gated on a declared exploration model.

Non-license (module level): nothing here is a welfare claim; certificates are
worst-case over couplings unless the contract declares more; the channel
typing is relative to the declared type space, exactly as in the repo caveat.

Run self-checks with:
    uv run --with numpy python contracts.py
"""

from __future__ import annotations

import math
from dataclasses import dataclass, field
from typing import Optional

import numpy as np


# ---------------------------------------------------------------------------
# Analyzer output types
# ---------------------------------------------------------------------------

@dataclass
class Certificate:
    name: str          # short identifier, e.g. "T1-drift-bound[V]"
    basis: str         # named result that licenses it, e.g. "T1 (core-math.md)"
    statement: str     # human-readable licensed claim
    value: Optional[float] = None   # the certified number, when scalar
    conditions: list[str] = field(default_factory=list)

    def render(self) -> str:
        cond = ("; conditions: " + "; ".join(self.conditions)) if self.conditions else ""
        val = f" = {self.value:.6g}" if self.value is not None else ""
        return f"CERTIFICATE {self.name}{val} [{self.basis}] {self.statement}{cond}"


@dataclass
class Refusal:
    question: str      # the conclusion that was requested / would be tempting
    reason: str        # why the declaration does not license it
    missing: str       # the contract field whose declaration would license it

    def render(self) -> str:
        return (f"REFUSAL    {self.question} -- {self.reason} "
                f"(missing declaration: {self.missing})")


Finding = "Certificate | Refusal"


# ---------------------------------------------------------------------------
# Selection channel (example 1 shape): best-of-n / declared divergence budget
# ---------------------------------------------------------------------------

def best_of_n_delta(n: int) -> float:
    """Selection intensity delta = ||L - 1||_{L^2(mu_0)} for best-of-n.

    Winner likelihood ratio L(u) = n F(u)^{n-1} for a continuous score, so
    E_0[L^2] = n^2 E[F^{2n-2}] = n^2 / (2n - 1) and
    delta^2 = chi^2 = n^2/(2n-1) - 1, independent of the score distribution.
    """
    if n < 1:
        raise ValueError("n >= 1 required")
    return math.sqrt(n * n / (2 * n - 1) - 1.0)


@dataclass
class SelectionContract:
    """Declared contract for a pure-selection channel (K_theta = K_0).

    Fields mirror the response-modeling contract; None means undeclared.
    """
    description: str
    # policy exposure / optimization pressure: exactly one of these
    best_of_n: Optional[int] = None       # selection by argmax over n iid draws
    delta: Optional[float] = None         # or a directly declared chi^2 budget
    # hidden coordinates: name -> declared baseline sd (None = undeclared,
    # math.inf = declared infinite/heavy second moment)
    hidden_sds: dict = field(default_factory=dict)
    # coupling-tail declaration: relation of proxy-noise tail to hidden tail;
    # one of None, "noise_lighter_than_hidden", "noise_heavier_than_hidden"
    coupling_tail: Optional[str] = None


def analyze_selection(c: SelectionContract) -> list:
    """Emit T1/T2 certificates and refusals for a declared selection contract."""
    out = []

    # -- resolve selection intensity ----------------------------------------
    if c.best_of_n is not None:
        delta = best_of_n_delta(c.best_of_n)
        out.append(Certificate(
            name=f"delta(best-of-{c.best_of_n})",
            basis="chi^2 of best-of-n reweighting (closed form)",
            statement=("selection intensity delta = sqrt(n^2/(2n-1) - 1); "
                       "distribution-free for continuous scores"),
            value=delta,
            conditions=["pure selection: K_theta = K_0",
                        "i.i.d. candidates, continuous score (no ties)"],
        ))
    elif c.delta is not None:
        delta = c.delta
    else:
        out.append(Refusal(
            question="any drift bound on hidden coordinates",
            reason="no optimization-pressure declaration (neither best_of_n "
                   "nor a divergence budget delta)",
            missing="policy exposure: best_of_n or chi^2 budget delta",
        ))
        return out

    # -- per-coordinate T1 certificates --------------------------------------
    for name, sd in c.hidden_sds.items():
        if sd is None:
            out.append(Refusal(
                question=f"drift bound for hidden coordinate '{name}'",
                reason="baseline second moment undeclared",
                missing=f"hidden_sds['{name}']",
            ))
        elif math.isinf(sd):
            out.append(Refusal(
                question=f"drift bound for hidden coordinate '{name}'",
                reason="declared infinite baseline variance; T1 hypothesis "
                       "fails and the conclusion genuinely fails (T1 "
                       "necessity witness), not merely the bound",
                missing=f"finite second moment for '{name}'",
            ))
        else:
            out.append(Certificate(
                name=f"T1-drift-bound[{name}]",
                basis="T1 (research/core-math.md)",
                statement=(f"|E_theta[{name}] - E_0[{name}]| <= delta * sd = "
                           f"{delta:.4g} * {sd:.4g}"),
                value=delta * sd,
                conditions=["worst case over all couplings of the hidden "
                            "coordinate with the selected score",
                            "valid at every n, but blind to coupling shape"],
            ))

    # -- tail-regime prediction: gated on the coupling-tail declaration ------
    if c.coupling_tail is None:
        out.append(Refusal(
            question="shape of the realized-value curve E[hidden | selected] "
                     "as pressure grows (monotone growth vs plateau/decline)",
            reason="the chi^2 certificate is tail-blind: identical declared "
                   "moments yield identical bounds for light- and heavy-"
                   "tailed noise while the true curves diverge",
            missing="coupling_tail (relation of noise tail to hidden tail)",
        ))
    elif c.coupling_tail == "noise_lighter_than_hidden":
        out.append(Certificate(
            name="tail-regime[favorable]",
            basis="regressional-Goodhart tail analysis (Thomas-Kwa regime "
                  "classification; qualitative)",
            statement="E[hidden | argmax proxy] is expected to keep growing "
                      "with pressure: extreme proxy values are explained by "
                      "the hidden coordinate, not the noise",
            conditions=["additive noise model U = V + eps",
                        "declared: eps tail lighter than V tail",
                        "qualitative regime claim, not a rate"],
        ))
    elif c.coupling_tail == "noise_heavier_than_hidden":
        out.append(Certificate(
            name="tail-regime[catastrophic]",
            basis="regressional-Goodhart tail analysis (Thomas-Kwa regime "
                  "classification; qualitative)",
            statement="E[hidden | argmax proxy] is expected to plateau and "
                      "fall back toward the baseline mean as pressure grows: "
                      "the argmax is eventually a pure noise outlier",
            conditions=["additive noise model U = V + eps",
                        "declared: eps tail heavier than V tail",
                        "qualitative regime claim, not a rate"],
        ))
    else:
        raise ValueError(f"unknown coupling_tail: {c.coupling_tail!r}")

    return out


# ---------------------------------------------------------------------------
# Fixed-type response channel (example 2 shape): finite MDP spec analysis
# ---------------------------------------------------------------------------

@dataclass
class MDPContract:
    """Declared contract for a finite MDP whose *proxy* reward is optimized.

    P: (S, A, S) transition tensor. R_proxy/R_true: (S, A) expected rewards.
    terminal: boolean (S,) absorbing-state mask (rows of P should self-loop).
    exploration_model: None or "uniform_random_walk" -- declaring one licenses
    a dynamics-level basin estimate; without it only spec-level analysis runs.
    """
    description: str
    P: np.ndarray
    R_proxy: np.ndarray
    R_true: np.ndarray
    gamma: float
    start: int
    terminal: Optional[np.ndarray] = None
    exploration_model: Optional[str] = None
    basin_states: Optional[dict] = None   # {"hack": state, "true": state}


def value_iteration(P: np.ndarray, R: np.ndarray, gamma: float,
                    tol: float = 1e-10, max_iter: int = 100_000):
    """Standard VI. Returns (V, greedy_policy)."""
    S, A, _ = P.shape
    V = np.zeros(S)
    for _ in range(max_iter):
        Q = R + gamma * P @ V          # (S, A)
        V_new = Q.max(axis=1)
        if np.max(np.abs(V_new - V)) < tol:
            V = V_new
            break
        V = V_new
    Q = R + gamma * P @ V
    return V, Q.argmax(axis=1)


def policy_value(P: np.ndarray, R: np.ndarray, gamma: float,
                 pi: np.ndarray) -> np.ndarray:
    """Exact value of a deterministic policy via linear solve."""
    S = P.shape[0]
    Ppi = P[np.arange(S), pi]          # (S, S)
    Rpi = R[np.arange(S), pi]          # (S,)
    return np.linalg.solve(np.eye(S) - gamma * Ppi, Rpi)


def hitting_before(P_walk: np.ndarray, target: int, other: int) -> np.ndarray:
    """h(s) = P(walk hits `target` before `other`), for a (S,S) walk kernel."""
    S = P_walk.shape[0]
    A_mat = np.eye(S) - P_walk
    b = np.zeros(S)
    # boundary conditions
    for s, val in ((target, 1.0), (other, 0.0)):
        A_mat[s] = 0.0
        A_mat[s, s] = 1.0
        b[s] = val
    return np.linalg.solve(A_mat, b)


def analyze_mdp(c: MDPContract) -> list:
    """Spec-level misalignment certificate + gated dynamics-level estimate."""
    out = []

    V_true_opt, pi_true = value_iteration(c.P, c.R_true, c.gamma)
    _, pi_proxy = value_iteration(c.P, c.R_proxy, c.gamma)
    V_true_of_proxy_pi = policy_value(c.P, c.R_true, c.gamma, pi_proxy)

    loss = V_true_opt[c.start] - V_true_of_proxy_pi[c.start]
    misaligned = loss > 1e-8
    out.append(Certificate(
        name="spec-misalignment",
        basis="value iteration on the declared MDP (residual-gap analysis, "
              "contract field 6)",
        statement=(f"true value at start: optimal = {V_true_opt[c.start]:.4g}, "
                   f"proxy-optimal policy = {V_true_of_proxy_pi[c.start]:.4g}; "
                   + ("MISALIGNED: the proxy asks for the hack"
                      if misaligned else
                      "ALIGNED: proxy-optimal policy is true-optimal at start")),
        value=loss,
        conditions=["exact for the declared P, R_proxy, R_true, gamma",
                    "says nothing about finite-training dynamics"],
    ))

    if c.exploration_model is None:
        out.append(Refusal(
            question="P(learner commits to the hack basin at finite training "
                     "budget T)",
            reason="dynamics-level probability needs a declared exploration/"
                   "learning model; the spec-level MDP does not contain one",
            missing="exploration_model",
        ))
    elif c.exploration_model == "uniform_random_walk":
        if not c.basin_states:
            out.append(Refusal(
                question="basin-commitment estimate",
                reason="exploration model declared but basin states are not",
                missing="basin_states={'hack': s, 'true': s}",
            ))
        else:
            # uniform-random-action walk kernel
            walk = c.P.mean(axis=1)      # (S, S)
            h = hitting_before(walk, c.basin_states["hack"],
                               c.basin_states["true"])
            out.append(Certificate(
                name="basin-discovery[hack-first]",
                basis="hitting probability of the declared uniform random "
                      "walk (coarse abstraction)",
                statement=("P(uniform explorer reaches the hack state before "
                           "the true goal from start) = "
                           f"{h[c.start]:.4g}; coarse proxy for early-"
                           "training commitment when the spec is misaligned"),
                value=float(h[c.start]),
                conditions=["abstraction: ignores that epsilon-greedy departs "
                            "from the uniform walk once Q-values form",
                            "prediction target: small-T commitment frequency, "
                            "not asymptotic behavior",
                            "asymptotics come from spec-misalignment instead: "
                            "converged Q-learning camps iff the spec is "
                            "misaligned"],
            ))
    else:
        raise ValueError(f"unknown exploration_model: {c.exploration_model!r}")

    return out


def render_findings(findings: list) -> str:
    return "\n".join(f.render() for f in findings)


# ---------------------------------------------------------------------------
# Self-checks
# ---------------------------------------------------------------------------

if __name__ == "__main__":
    # delta closed form vs direct Monte Carlo of E[L^2]
    rng = np.random.default_rng(0)
    for n in (2, 8, 64):
        x = rng.random(500_000)                   # baseline draws, F(x) = x
        chi2_mc = (n * x ** (n - 1)).var()        # Var_0(L) since E_0[L] = 1
        assert abs(chi2_mc - best_of_n_delta(n) ** 2) < 0.05 * (1 + n), (n, chi2_mc)

    # a tiny 2-state MDP where the proxy prefers the wrong absorbing state
    P = np.zeros((3, 2, 3)); P[0, 0, 1] = 1; P[0, 1, 2] = 1
    P[1, :, 1] = 1; P[2, :, 2] = 1
    R_true = np.zeros((3, 2)); R_true[0, 0] = 1.0
    R_proxy = np.zeros((3, 2)); R_proxy[0, 1] = 1.0
    findings = analyze_mdp(MDPContract("unit test", P, R_proxy, R_true,
                                       gamma=0.9, start=0))
    assert any(isinstance(f, Certificate) and "MISALIGNED" in f.statement
               for f in findings)
    assert any(isinstance(f, Refusal) for f in findings)

    # refusal wiring for the selection analyzer
    sel = analyze_selection(SelectionContract(
        "unit test", best_of_n=16,
        hidden_sds={"V": 1.0, "W": None, "X": math.inf}))
    kinds = [type(f).__name__ for f in sel]
    assert kinds.count("Refusal") == 3   # W undeclared, X infinite, tail undeclared
    assert kinds.count("Certificate") == 2  # delta + T1 bound for V

    print("contracts.py self-checks passed")
    print(render_findings(sel))
