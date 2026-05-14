"""Iteration 20 simulation checks for selection and intervention claims.

Run with:
    uv run --with numpy --with scipy python iteration20_selection_intervention.py

The point is not empirical realism. Each check is a deterministic toy model
whose output names the proposition or open problem it exercises, plus the
condition that would narrow or kill the claim.
"""

from __future__ import annotations

from dataclasses import dataclass
from math import sqrt

import numpy as np
from scipy.optimize import minimize, minimize_scalar
from scipy.special import logsumexp
from scipy.stats import norm


SEED = 20260513
N = 300_000


@dataclass
class Check:
    name: str
    tests: str
    result: str
    kill_condition: str


def fmt_vec(x: np.ndarray) -> str:
    return "[" + ", ".join(f"{v:.4f}" for v in x) + "]"


def assert_checks_well_formed(checks: list[Check]) -> None:
    for check in checks:
        assert check.name.strip()
        assert check.tests.strip()
        assert check.result.strip()
        assert check.kill_condition.strip()


def linear_gaussian_threshold(rng: np.random.Generator) -> Check:
    z = rng.normal(size=N)
    noise = rng.normal(size=(N, 2))
    rho = np.array([0.75, -0.25, 0.0])
    h = np.column_stack(
        [
            rho[0] * z + sqrt(1 - rho[0] ** 2) * noise[:, 0],
            rho[1] * z + sqrt(1 - rho[1] ** 2) * noise[:, 1],
            rng.normal(size=N),
        ]
    )
    t = 1.0
    selected = h[z >= t].mean(axis=0) - h.mean(axis=0)
    expected = rho * norm.pdf(t) / (1 - norm.cdf(t))
    err = np.max(np.abs(selected - expected))
    assert err < 0.015
    return Check(
        name="linear_gaussian_threshold",
        tests="Layer-3 check for Q1-Q3 and Proposition 1: hidden drift follows declared coupling, not dimension count.",
        result=f"selected drift {fmt_vec(selected)} matches Gaussian prediction {fmt_vec(expected)}; max error {err:.4f}",
        kill_condition="Would fail if an uncoupled hidden coordinate acquired systematic threshold drift.",
    )


def zero_covariance_nonlinear_threshold(rng: np.random.Generator) -> Check:
    z = rng.normal(size=N)
    h = z**2 - 1.0
    cov = np.cov(z, h, bias=True)[0, 1]
    t = 1.0
    drift = h[z >= t].mean() - h.mean()
    expected = t * norm.pdf(t) / (1 - norm.cdf(t))
    assert abs(cov) < 0.02
    assert abs(drift - expected) < 0.03
    return Check(
        name="zero_covariance_nonlinear_threshold",
        tests="Selection-response primitive Q6-Q9: baseline covariance can vanish while threshold response is nonzero.",
        result=f"cov(P,H)={cov:.4f}, threshold drift={drift:.4f}, analytic drift={expected:.4f}",
        kill_condition="Would fail if zero covariance forced zero threshold response in this non-Gaussian hidden coordinate.",
    )


def boltzmann_finite_mgf_and_heavy_tail(rng: np.random.Generator) -> Check:
    z = rng.normal(size=N)
    h = z**2 - 1.0
    beta = 0.6
    weights = np.exp(beta * z)
    tilted = np.average(h, weights=weights)
    expected = beta**2
    assert abs(tilted - expected) < 0.02

    alpha = 2.5
    beta_heavy = 0.25
    quantile_sizes = np.array([1_000, 10_000, 100_000, 1_000_000], dtype=float)
    # Deterministic Pareto quantile grid, avoiding random max noise. For a
    # finite mgf proxy this sequence should stabilize; for Pareto it grows.
    log_growth = []
    tilted_expectations = []
    for n in quantile_sizes:
        u = (np.arange(1, int(n) + 1) - 0.5) / n
        pareto_quantiles = (1.0 - u) ** (-1.0 / alpha)
        log_weights = beta_heavy * pareto_quantiles
        log_normalizer = logsumexp(log_weights)
        log_growth.append(log_normalizer - np.log(n))
        tilted_expectations.append(float(np.sum(np.exp(log_weights - log_normalizer) * pareto_quantiles)))
    log_growth = np.array(log_growth)
    tilted_expectations = np.array(tilted_expectations)
    assert np.all(np.diff(log_growth) > 1.0)
    assert np.all(np.diff(tilted_expectations) > 0.0)
    assert tilted_expectations[-1] > 5.0 * tilted_expectations[0]
    return Check(
        name="boltzmann_finite_mgf_and_heavy_tail",
        tests="Weighted-response Q6-Q9: Boltzmann covariance velocity is usable on the finite-mgf domain only.",
        result=(
            f"normal tilt E_beta[Z^2-1]={tilted:.4f} vs beta^2={expected:.4f}; "
            f"Pareto log normalizers {fmt_vec(log_growth)}; tilted means {fmt_vec(tilted_expectations)}"
        ),
        kill_condition="Would fail if the heavy-tail proxy produced stable exponential normalizers under increasing truncation.",
    )


def value_weighted_selection(rng: np.random.Generator) -> Check:
    p = rng.normal(size=N)
    h = np.column_stack([0.7 * p + rng.normal(scale=0.7, size=N), -0.4 * p + rng.normal(scale=0.9, size=N)])
    selected_drift = h[p >= 1.0].mean(axis=0) - h.mean(axis=0)
    v_a = np.array([0.6, 0.8])
    v_b = np.array([-0.8, 0.6])
    scalar_a = float(v_a @ selected_drift)
    scalar_b = float(v_b @ selected_drift)
    reconstructed = scalar_a * v_a + scalar_b * v_b
    assert abs(np.linalg.norm(v_a) - 1.0) < 1e-12
    assert abs(np.linalg.norm(v_b) - 1.0) < 1e-12
    assert abs(float(v_a @ v_b)) < 1e-12
    assert np.allclose(reconstructed, selected_drift)
    assert scalar_a > 0.1
    assert scalar_b < -1.0
    return Check(
        name="value_weighted_selection",
        tests="Proposition 1': scalar value drift depends on declared value vector v, not on H coordinates alone.",
        result=f"B_H={fmt_vec(selected_drift)}, v_a.B_H={scalar_a:.4f}, v_b.B_H={scalar_b:.4f}",
        kill_condition="Would fail if changing the declared value vector left the scalar welfare reading invariant.",
    )


def single_channel_stackelberg_wedge() -> Check:
    kappa = 2.0
    value = 3.0
    delta = sqrt(2 * kappa * value)
    deficits = np.array([delta - 0.05, delta + 0.05])
    costs = deficits**2 / (2 * kappa)
    feasible = costs <= value
    assert feasible.tolist() == [True, False]
    return Check(
        name="single_channel_stackelberg_wedge",
        tests="Proposition 2: the quadratic Stackelberg gaming band has width Delta=sqrt(2 kappa V).",
        result=f"Delta={delta:.4f}; costs around boundary={fmt_vec(costs)}; feasible={feasible.tolist()}",
        kill_condition="Would fail if feasibility did not flip at the quadratic wedge boundary.",
    )


def multichannel_water_filling() -> Check:
    d = 2.4
    kappa = np.array([1.0, 2.0, 0.5])
    w = np.array([1.0, 0.5, 2.0])
    denom = float(np.sum(kappa * w**2))
    a_star = d * kappa * w / denom
    score = float(w @ a_star)
    cost = float(np.sum(a_star**2 / (2 * kappa)))
    m_d = d**2 / (2 * denom)
    assert abs(score - d) < 1e-10
    assert abs(cost - m_d) < 1e-10
    return Check(
        name="multichannel_water_filling",
        tests="Proposition 3 special case: separable quadratic costs allocate action as a_j=d kappa_j w_j/sum kappa_i w_i^2.",
        result=f"a*={fmt_vec(a_star)}, score={score:.4f}, cost={cost:.4f}, m(d)={m_d:.4f}",
        kill_condition="Would fail if the quadratic allocation missed the target or exceeded the dual cost formula.",
    )


def noisy_stackelberg_response() -> Check:
    q = 0.0
    t = 1.0
    sigmas = np.array([0.05, 0.15, 0.45, 1.0])
    kappa = 1.2
    value = 2.0
    deterministic_pass_action = t - q
    deterministic_delta = sqrt(2 * kappa * value)

    def utility(a: float, sigma: float) -> float:
        pass_prob = norm.cdf((q + a - t) / sigma)
        return value * pass_prob - a * a / (2 * kappa)

    actions = []
    utility_gains = []
    for sigma in sigmas:
        opt = minimize_scalar(lambda a: -utility(a, sigma), bounds=(0.0, 3.0), method="bounded")
        a_star = float(opt.x)
        assert opt.success
        assert 0.0 < a_star < deterministic_delta
        assert utility(a_star, sigma) > utility(0.0, sigma)
        actions.append(a_star)
        utility_gains.append(utility(a_star, sigma) - utility(0.0, sigma))
    actions = np.array(actions)
    utility_gains = np.array(utility_gains)
    assert abs(actions[0] - deterministic_pass_action) < 0.15
    assert np.ptp(actions) > 0.25
    return Check(
        name="noisy_stackelberg_response",
        tests="Open stochastic-response extension: smoothing the pass condition changes realized action but still uses declared cost/stakes/noise.",
        result=(
            f"sigmas={fmt_vec(sigmas)}, a*={fmt_vec(actions)}, "
            f"gains={fmt_vec(utility_gains)}, deterministic pass action={deterministic_pass_action:.4f}, Delta={deterministic_delta:.4f}"
        ),
        kill_condition="Would narrow the toy if noisy best response ignored the declared cost/stakes/noise geometry.",
    )


def convex_cost_vs_welfare_bound() -> Check:
    d = 1.0
    value = 1.0
    m_weight = 20.0
    a_cost_min = np.array([d / 2, d / 2])
    realized_harm = m_weight * a_cost_min[0]

    # Maximize ell(a)=M a_1 over ||a||^2/2 <= V and a_1+a_2 >= d.
    w = np.array([1.0, 1.0])
    closed_form = m_weight * sqrt(2 * value)
    opt = minimize(
        lambda a: -m_weight * a[0],
        x0=np.array([sqrt(2 * value), 0.0]),
        method="SLSQP",
        constraints=[
            {"type": "ineq", "fun": lambda a: value - 0.5 * float(a @ a)},
            {"type": "ineq", "fun": lambda a: float(w @ a) - d},
        ],
        options={"ftol": 1e-12, "maxiter": 200},
    )
    assert opt.success
    welfare_bound = -float(opt.fun)
    assert abs(welfare_bound - closed_form) < 1e-6
    assert realized_harm == m_weight * d / 2
    assert welfare_bound > realized_harm
    return Check(
        name="convex_cost_vs_welfare_bound",
        tests="Iteration 19/Q10: m(d), ell(a*(d)), and W_ell(d,V) are different objects.",
        result=f"ell(a*(d))={realized_harm:.4f}; solver W_ell(d,V)={welfare_bound:.4f}; closed form={closed_form:.4f}",
        kill_condition="Would fail if convex affordability alone bounded welfare independently of the declared ell weights.",
    )


def run_all() -> list[Check]:
    rng = np.random.default_rng(SEED)
    return [
        linear_gaussian_threshold(rng),
        zero_covariance_nonlinear_threshold(rng),
        boltzmann_finite_mgf_and_heavy_tail(rng),
        value_weighted_selection(rng),
        single_channel_stackelberg_wedge(),
        multichannel_water_filling(),
        noisy_stackelberg_response(),
        convex_cost_vs_welfare_bound(),
    ]


def main() -> None:
    checks = run_all()
    print(f"Iteration 20 simulations; seed={SEED}; sample_n={N}")
    for i, check in enumerate(checks, start=1):
        print(f"\n{i}. {check.name}")
        print(f"   tests: {check.tests}")
        print(f"   result: {check.result}")
        print(f"   kill/narrow condition: {check.kill_condition}")

    assert_checks_well_formed(checks)
    print(f"\nPASS: {len(checks)} simulation checks completed.")


if __name__ == "__main__":
    main()
