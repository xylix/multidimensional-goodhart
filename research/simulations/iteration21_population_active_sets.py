"""Iteration 21 simulation checks for welfare objects and active-set paths.

Run with:
    uv run --with numpy --with scipy --with matplotlib python iteration21_population_active_sets.py

These are toy-model checks. They test whether the notes keep separate:
- fixed-deficit per-agent harm H_per(d);
- population harm H_pop(M; F_Q, V);
- capped fixed-charge active-set paths;
- active-face quadratic response under sign constraints.
"""

from __future__ import annotations

from dataclasses import dataclass
from itertools import combinations
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import minimize


SEED = 20260513
N = 400_000
OUT_DIR = Path(__file__).parent / "outputs"


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


def powerset_indices(n: int):
    for r in range(1, n + 1):
        yield from combinations(range(n), r)


def linear_fill_cost_for_set(
    d: float,
    active: tuple[int, ...],
    fixed_cost: np.ndarray,
    marginal_cost: np.ndarray,
    weights: np.ndarray,
    caps: np.ndarray,
) -> tuple[float, np.ndarray] | None:
    capacity = float(np.sum(weights[list(active)] * caps[list(active)]))
    if d > capacity + 1e-12:
        return None

    a = np.zeros_like(weights)
    residual = d
    ordered = sorted(active, key=lambda j: marginal_cost[j] / weights[j])
    for j in ordered:
        if residual <= 1e-12:
            break
        take = min(caps[j], residual / weights[j])
        a[j] = take
        residual -= weights[j] * take

    used = tuple(int(j) for j in np.flatnonzero(a > 1e-10))
    if not used:
        return None
    cost = float(np.sum(fixed_cost[list(used)]) + np.sum(marginal_cost * a))
    return cost, a


def solve_capped_fixed_charge(
    d: float,
    fixed_cost: np.ndarray,
    marginal_cost: np.ndarray,
    weights: np.ndarray,
    caps: np.ndarray,
) -> tuple[float, np.ndarray]:
    best_cost = np.inf
    best_action: np.ndarray | None = None
    for active in powerset_indices(len(weights)):
        candidate = linear_fill_cost_for_set(d, active, fixed_cost, marginal_cost, weights, caps)
        if candidate is None:
            continue
        cost, action = candidate
        if cost < best_cost - 1e-10:
            best_cost = cost
            best_action = action
    if best_action is None:
        raise ValueError(f"infeasible deficit {d}")
    return best_cost, best_action


def capped_fixed_charge_active_sets() -> Check:
    fixed_cost = np.array([0.0, 5.0, 7.0])
    marginal_cost = np.array([3.0, 1.0, 1.4])
    weights = np.ones(3)
    caps = np.array([4.0, 7.0, 7.0])
    deficits = np.linspace(0.5, 12.0, 24)

    actions = []
    supports = []
    costs = []
    for d in deficits:
        cost, action = solve_capped_fixed_charge(d, fixed_cost, marginal_cost, weights, caps)
        actions.append(action)
        supports.append(tuple(int(i + 1) for i in np.flatnonzero(action > 1e-9)))
        costs.append(cost)
    actions = np.array(actions)
    costs = np.array(costs)

    # The point of this example: fixed costs can skip the early cheap-small
    # channel instead of filling it first.
    assert supports[0] == (1,)
    assert (2,) in supports
    first_channel_two = supports.index((2,))
    assert deficits[first_channel_two] < caps[0]
    assert actions[first_channel_two, 0] == 0.0

    OUT_DIR.mkdir(exist_ok=True)
    fig, ax = plt.subplots(figsize=(7, 4))
    for j in range(actions.shape[1]):
        ax.plot(deficits, actions[:, j], marker="o", label=f"channel {j + 1}")
    ax.set_title("Capped fixed-charge active-set path")
    ax.set_xlabel("score deficit d")
    ax.set_ylabel("action a_j")
    ax.legend()
    ax.grid(alpha=0.25)
    fig.tight_layout()
    fig.savefig(OUT_DIR / "iteration21_active_sets.png", dpi=160)
    plt.close(fig)

    support_changes = sum(1 for a, b in zip(supports, supports[1:]) if a != b)
    return Check(
        name="capped_fixed_charge_active_sets",
        tests="Iteration 10/Q18: fixed activation plus caps create lumpy active-set switches, not universal sorted filling.",
        result=(
            f"support path begins {supports[:8]} with {support_changes} support changes; "
            f"channel 2 is chosen alone at d={deficits[first_channel_two]:.2f} before channel 1's cap {caps[0]:.1f}"
        ),
        kill_condition="Would fail if positive fixed costs still forced global cheapest-marginal fill of channel 1 before switching.",
    )


def active_face_quadratic_response() -> Check:
    d = 1.7
    c = np.eye(2)

    def solve_nonnegative_quadratic(w: np.ndarray) -> np.ndarray:
        opt = minimize(
            lambda a: 0.5 * float(a @ a),
            x0=np.full_like(w, d / len(w)),
            method="SLSQP",
            bounds=[(0.0, None)] * len(w),
            constraints=[{"type": "eq", "fun": lambda a: float(w @ a) - d}],
            options={"ftol": 1e-12, "maxiter": 200},
        )
        assert opt.success
        return np.asarray(opt.x)

    w_bad = np.array([1.0, -1.0])
    unconstrained = d * c @ w_bad / float(w_bad @ c @ w_bad)
    active_face = solve_nonnegative_quadratic(w_bad)
    expected_active_face = np.array([d, 0.0])
    assert unconstrained[1] < 0.0
    assert np.all(active_face >= 0.0)
    assert abs(float(w_bad @ active_face) - d) < 1e-12
    assert np.allclose(active_face, expected_active_face, atol=1e-8)

    w_good = np.array([1.0, 2.0])
    interior = d * c @ w_good / float(w_good @ c @ w_good)
    solved_interior = solve_nonnegative_quadratic(w_good)
    assert np.all(interior >= 0.0)
    assert abs(float(w_good @ interior) - d) < 1e-12
    assert np.allclose(solved_interior, interior, atol=1e-8)
    return Check(
        name="active_face_quadratic_response",
        tests="Iteration 18/Q18: the quadratic Cw formula is interior only when sign constraints do not bind.",
        result=f"invalid unconstrained action {fmt_vec(unconstrained)} solved to active-face {fmt_vec(active_face)}; valid interior solve {fmt_vec(solved_interior)}",
        kill_condition="Would fail if the full-space Cw direction were valid despite a negative action component under a >= 0.",
    )


def population_harm_objects(rng: np.random.Generator) -> Check:
    value = 0.7
    threshold = 1.0
    k_values = np.array([0.35, 0.9, 1.8, 3.2])
    deltas = np.sqrt(2 * k_values * value)
    deficits = np.linspace(0.0, 2.5, 300)

    h_per = np.where(deficits[:, None] <= deltas[None, :], deficits[:, None], np.nan)
    positive_mask = deficits[:, None] <= deltas[None, :]
    for col in range(h_per.shape[1]):
        assert np.allclose(h_per[positive_mask[:, col], col], deficits[positive_mask[:, col]])

    q_normal = rng.normal(loc=0.0, scale=1.0, size=N)
    q_skew = 1.1 - rng.lognormal(mean=0.0, sigma=0.75, size=N)
    h_pop_normal = []
    h_pop_skew = []
    d_normal = threshold - q_normal
    d_skew = threshold - q_skew
    for delta in deltas:
        mask_normal = (d_normal > 0.0) & (d_normal <= delta)
        mask_skew = (d_skew > 0.0) & (d_skew <= delta)
        h_pop_normal.append(np.mean(np.where(mask_normal, d_normal, 0.0)))
        h_pop_skew.append(np.mean(np.where(mask_skew, d_skew, 0.0)))
    h_pop_normal = np.array(h_pop_normal)
    h_pop_skew = np.array(h_pop_skew)

    assert np.all(np.diff(h_pop_normal) > 0.0)
    assert np.all(np.diff(h_pop_skew) > 0.0)
    rows_with_multiple_feasible_curves = np.sum(positive_mask, axis=1) >= 2
    for row in h_per[rows_with_multiple_feasible_curves]:
        feasible_values = row[np.isfinite(row)]
        assert np.ptp(feasible_values) < 1e-12

    OUT_DIR.mkdir(exist_ok=True)
    fig, axes = plt.subplots(1, 2, figsize=(10, 4))
    for idx, k in enumerate(k_values):
        axes[0].plot(deficits, h_per[:, idx], label=f"K={k:.2f}")
    axes[0].set_title("H_per(d): fixed-deficit harm")
    axes[0].set_xlabel("deficit d")
    axes[0].set_ylabel("H_per")
    axes[0].legend()
    axes[0].grid(alpha=0.25)

    x = np.arange(len(k_values))
    width = 0.36
    axes[1].bar(x - width / 2, h_pop_normal, width, label="normal Q")
    axes[1].bar(x + width / 2, h_pop_skew, width, label="skewed Q")
    axes[1].set_title("H_pop grows as gaming band expands")
    axes[1].set_xlabel("aggregate gaming capacity K")
    axes[1].set_ylabel("H_pop")
    axes[1].set_xticks(x, [f"{k:.2f}" for k in k_values])
    axes[1].legend()
    axes[1].grid(axis="y", alpha=0.25)
    fig.tight_layout()
    fig.savefig(OUT_DIR / "iteration21_welfare_objects.png", dpi=160)
    plt.close(fig)

    return Check(
        name="population_harm_objects",
        tests="Iteration 17/Q17: H_per(d) and H_pop(M; F_Q,V) are distinct welfare objects; non-Gaussian Q stress included.",
        result=(
            f"H_pop normal={fmt_vec(h_pop_normal)}; H_pop skewed={fmt_vec(h_pop_skew)}; "
            "H_per curves coincide where gaming is feasible"
        ),
        kill_condition="Would fail if fixed-deficit H_per changed with K in the equal-harm model, or if H_pop did not expand with the profitable deficit band.",
    )


def conjunctive_aggregation_population(rng: np.random.Generator) -> Check:
    value = 0.7
    kappa = 1.0
    threshold = 1.0
    measured_counts = np.array([1, 2, 3])
    fixed_deficit = 0.4
    per_gamer_harm = measured_counts * fixed_deficit
    entry_cutoffs = np.sqrt(2 * kappa * value / measured_counts)
    q_normal = rng.normal(loc=0.0, scale=1.0, size=N)
    d_normal = threshold - q_normal
    h_pop = []
    gamer_rates = []
    for m, cutoff in zip(measured_counts, entry_cutoffs):
        mask = (d_normal > 0.0) & (d_normal <= cutoff)
        h_pop.append(np.mean(np.where(mask, m * d_normal, 0.0)))
        gamer_rates.append(float(np.mean(mask)))
    h_pop = np.array(h_pop)
    gamer_rates = np.array(gamer_rates)

    assert np.allclose(per_gamer_harm, np.array([0.4, 0.8, 1.2]))
    assert np.all(np.diff(entry_cutoffs) < 0.0)
    assert np.all(np.diff(gamer_rates) < 0.0)
    return Check(
        name="conjunctive_aggregation_population",
        tests="Iteration 5/Q13-Q17: conjunctive aggregation multiplies fixed-deficit per-gamer harm while shrinking entry under equal costs.",
        result=(
            f"m={measured_counts.tolist()}, fixed-deficit harms={fmt_vec(per_gamer_harm)}, "
            f"entry cutoffs={fmt_vec(entry_cutoffs)}, gamer rates={fmt_vec(gamer_rates)}, H_pop={fmt_vec(h_pop)}"
        ),
        kill_condition="Would fail if a conjunctive metric did not raise fixed-deficit per-gamer harm or did not shrink the equal-cost entry band.",
    )


def run_all() -> list[Check]:
    rng = np.random.default_rng(SEED)
    return [
        capped_fixed_charge_active_sets(),
        active_face_quadratic_response(),
        population_harm_objects(rng),
        conjunctive_aggregation_population(rng),
    ]


def main() -> None:
    checks = run_all()
    print(f"Iteration 21 simulations; seed={SEED}; sample_n={N}")
    for i, check in enumerate(checks, start=1):
        print(f"\n{i}. {check.name}")
        print(f"   tests: {check.tests}")
        print(f"   result: {check.result}")
        print(f"   kill/narrow condition: {check.kill_condition}")
    print(f"\nArtifacts:")
    print(f"   {OUT_DIR / 'iteration21_active_sets.png'}")
    print(f"   {OUT_DIR / 'iteration21_welfare_objects.png'}")
    assert_checks_well_formed(checks)
    print(f"\nPASS: {len(checks)} simulation checks completed.")


if __name__ == "__main__":
    main()
