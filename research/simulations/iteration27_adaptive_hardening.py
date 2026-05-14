"""Iteration 27 simulation checks for adaptive hardening and measurement frontiers.

Run with:
    uv run --with numpy python iteration27_adaptive_hardening.py

These are deterministic toy-model checks. They classify small finite-channel
regimes for repeated regulator policies; they are not empirical evidence and
not theorem promotion.
"""

from __future__ import annotations

from dataclasses import dataclass

import numpy as np


DEFICITS = np.linspace(0.0, 2.0, 401)


@dataclass
class Check:
    name: str
    tests: str
    result: str
    kill_condition: str


@dataclass
class Scorecard:
    kappa: np.ndarray
    h: np.ndarray
    gamma: np.ndarray
    w: np.ndarray

    def copy(self) -> "Scorecard":
        return Scorecard(self.kappa.copy(), self.h.copy(), self.gamma.copy(), self.w.copy())


def fmt_vec(x: np.ndarray) -> str:
    return "[" + ", ".join(f"{v:.4f}" for v in x) + "]"


def fmt_set(mask: np.ndarray) -> str:
    return "{" + ", ".join(str(int(j + 1)) for j in np.flatnonzero(mask)) + "}"


def assert_checks_well_formed(checks: list[Check]) -> None:
    for check in checks:
        assert check.name.strip()
        assert check.tests.strip()
        assert check.result.strip()
        assert check.kill_condition.strip()


def score_capacity(model: Scorecard, measured: np.ndarray) -> float:
    return float(np.sum(model.kappa[measured] * model.w[measured] ** 2))


def min_cost(model: Scorecard, measured: np.ndarray, deficit: float) -> float:
    capacity = score_capacity(model, measured)
    if capacity <= 0.0:
        return np.inf
    return deficit**2 / (2.0 * capacity)


def gaming_feasible(model: Scorecard, measured: np.ndarray, deficit: float, value: float) -> bool:
    return bool(deficit > 0.0 and min_cost(model, measured, deficit) <= value)


def best_response(model: Scorecard, measured: np.ndarray, deficit: float) -> np.ndarray:
    action = np.zeros_like(model.kappa)
    capacity = score_capacity(model, measured)
    if deficit <= 0.0 or capacity <= 0.0:
        return action
    action[measured] = deficit * model.kappa[measured] * model.w[measured] / capacity
    return action


def harm_benefit_net(model: Scorecard, action: np.ndarray) -> tuple[float, float, float]:
    harm = float(model.h @ action)
    benefit = float(model.gamma @ action)
    return harm, benefit, harm - benefit


def per_gamer_values(model: Scorecard, measured: np.ndarray, deficit: float) -> tuple[float, float, float]:
    return harm_benefit_net(model, best_response(model, measured, deficit))


def population_harm(model: Scorecard, measured: np.ndarray, value: float, deficits: np.ndarray = DEFICITS) -> float:
    harms = []
    for deficit in deficits:
        if gaming_feasible(model, measured, float(deficit), value):
            harm, _, _ = per_gamer_values(model, measured, float(deficit))
            harms.append(harm)
        else:
            harms.append(0.0)
    return float(np.mean(harms))


def population_net_harm(model: Scorecard, measured: np.ndarray, value: float, deficits: np.ndarray = DEFICITS) -> float:
    nets = []
    for deficit in deficits:
        if gaming_feasible(model, measured, float(deficit), value):
            _, _, net = per_gamer_values(model, measured, float(deficit))
            nets.append(net)
        else:
            nets.append(0.0)
    return float(np.mean(nets))


def signal_gain(model: Scorecard, measured: np.ndarray) -> float:
    return float(np.sum(model.gamma[measured] * model.w[measured]))


def reactive_hardening(
    model: Scorecard,
    measured: np.ndarray,
    deficit: float,
    value: float,
    hardening_factor: float,
    floor: float,
    max_rounds: int = 100,
) -> tuple[Scorecard, list[int], list[float], list[float]]:
    current = model.copy()
    hardened: list[int] = []
    capacities: list[float] = [score_capacity(current, measured)]
    net_harms: list[float] = []
    for _ in range(max_rounds):
        if not gaming_feasible(current, measured, deficit, value):
            break
        action = best_response(current, measured, deficit)
        measured_indices = np.flatnonzero(measured)
        chosen = int(measured_indices[np.argmax(action[measured])])
        hardened.append(chosen)
        _, _, net = harm_benefit_net(current, action)
        net_harms.append(net)
        current.kappa[chosen] = max(floor, hardening_factor * current.kappa[chosen])
        capacities.append(score_capacity(current, measured))
    assert not gaming_feasible(current, measured, deficit, value)
    return current, hardened, capacities, net_harms


def add_dimension_policy(model: Scorecard, initial: np.ndarray, deficit: float, value: float) -> list[np.ndarray]:
    measured = initial.copy()
    path = [measured.copy()]
    while gaming_feasible(model, measured, deficit, value) and not np.all(measured):
        candidates = np.flatnonzero(~measured)
        increments = model.kappa[candidates] * model.w[candidates] ** 2
        ratios = model.gamma[candidates] / increments
        chosen = int(candidates[np.argmax(ratios)])
        measured[chosen] = True
        path.append(measured.copy())
    return path


def remove_channel_policy(model: Scorecard, initial: np.ndarray, deficit: float, value: float) -> list[np.ndarray]:
    measured = initial.copy()
    path = [measured.copy()]
    while gaming_feasible(model, measured, deficit, value) and np.sum(measured) > 1:
        action = best_response(model, measured, deficit)
        measured_indices = np.flatnonzero(measured)
        chosen = int(measured_indices[np.argmax(action[measured])])
        measured[chosen] = False
        path.append(measured.copy())
    return path


def reactive_hardening_converges() -> Check:
    model = Scorecard(
        kappa=np.array([5.0, 3.0, 1.0]),
        h=np.array([1.0, 1.0, 1.0]),
        gamma=np.array([0.0, 0.0, 0.0]),
        w=np.array([1.0, 1.0, 1.0]),
    )
    measured = np.array([True, True, True])
    deficit = 1.0
    value = 0.15
    threshold_capacity = deficit**2 / (2.0 * value)
    final, hardened, capacities, _ = reactive_hardening(model, measured, deficit, value, 0.50, 0.05)

    assert capacities[0] > threshold_capacity
    assert score_capacity(final, measured) < threshold_capacity
    assert 0 < len(hardened) < 20
    return Check(
        name="reactive_hardening_converges",
        tests="Q14 adaptive hardening: repeated hardening of the current largest-action channel can reach no-gaming.",
        result=(
            f"rounds_to_no_gaming={len(hardened)}, S0={capacities[0]:.4f}, "
            f"S_final={score_capacity(final, measured):.4f}, no-gaming threshold S<d^2/(2V)={threshold_capacity:.4f}"
        ),
        kill_condition="Would fail if finite repeated hardening could not push S(M) below the deterministic gaming threshold.",
    )


def route_switching_before_convergence() -> Check:
    model = Scorecard(
        kappa=np.array([5.00, 4.95, 4.90, 4.85]),
        h=np.ones(4),
        gamma=np.zeros(4),
        w=np.ones(4),
    )
    measured = np.array([True, True, True, True])
    deficit = 1.0
    value = 0.055
    final, hardened, capacities, _ = reactive_hardening(model, measured, deficit, value, 0.40, 0.02)
    distinct = sorted({j + 1 for j in hardened})
    threshold_capacity = deficit**2 / (2.0 * value)

    assert len(distinct) >= 3
    assert score_capacity(final, measured) < threshold_capacity
    return Check(
        name="route_switching_before_convergence",
        tests="Q14 adaptive hardening: near-symmetric measured channels induce route switching before no-gaming.",
        result=(
            f"hardened channel path={[j + 1 for j in hardened]}, distinct={distinct}, "
            f"S path={fmt_vec(np.array(capacities))}, no-gaming threshold={threshold_capacity:.4f}"
        ),
        kill_condition="Would fail if the active route did not switch across at least three channels before convergence.",
    )


def add_dimension_expands_attack_surface() -> Check:
    model = Scorecard(
        kappa=np.array([1.10, 1.50, 2.00]),
        h=np.array([1.0, 1.0, 1.0]),
        gamma=np.array([0.80, 1.80, 2.20]),
        w=np.array([1.0, 1.0, 1.0]),
    )
    initial = np.array([True, False, False])
    deficit = 1.0
    value = 0.55
    path = add_dimension_policy(model, initial, deficit, value)
    start = path[0]
    final = path[-1]
    start_s = score_capacity(model, start)
    final_s = score_capacity(model, final)
    start_hpop = population_harm(model, start, value)
    final_hpop = population_harm(model, final, value)

    assert len(path) >= 2
    assert final_s > start_s
    assert final_hpop > start_hpop
    return Check(
        name="add_dimension_expands_attack_surface",
        tests="Q15 measurement frontier: adding gameable dimensions can increase S(M) and population gaming harm.",
        result=(
            f"path={[fmt_set(mask) for mask in path]}, S {start_s:.4f}->{final_s:.4f}, "
            f"H_pop {start_hpop:.4f}->{final_hpop:.4f}"
        ),
        kill_condition="Would fail if adding declared-signal dimensions did not enlarge attack surface or deterministic H_pop in this regime.",
    )


def static_commitment_dominates() -> Check:
    model = Scorecard(
        kappa=np.array([0.15, 4.0, 3.0]),
        h=np.array([0.30, 2.00, 2.00]),
        gamma=np.array([0.25, 0.10, 0.05]),
        w=np.ones(3),
    )
    narrow = np.array([True, False, False])
    broad = np.array([True, True, True])
    deficit = 1.0
    value = 0.20
    adequacy_floor = 0.20
    rounds = 8

    _, hardened, _, reactive_net = reactive_hardening(model, broad, deficit, value, 0.55, 0.04, max_rounds=rounds)
    static_net = [population_net_harm(model, narrow, value)] * max(1, len(hardened))
    remove_path = remove_channel_policy(model, broad, deficit, value)

    assert signal_gain(model, narrow) >= adequacy_floor
    assert not gaming_feasible(model, narrow, deficit, value)
    assert sum(static_net) < sum(reactive_net)
    return Check(
        name="static_commitment_dominates",
        tests="Q14-Q15 policy contrast: a narrow hard-to-game commitment can dominate reactive broad measurement when signal is adequate.",
        result=(
            f"signal_narrow={signal_gain(model, narrow):.4f} >= adequacy_floor={adequacy_floor:.4f}; "
            f"cumulative net harm static={sum(static_net):.4f}, reactive={sum(reactive_net):.4f}; "
            f"reactive hardening path={[j + 1 for j in hardened]}, remove-channel path={[fmt_set(mask) for mask in remove_path]}"
        ),
        kill_condition="Would fail if broad reactive measurement had no extra cumulative net harm after narrow signal adequacy was already met.",
    )


def beneficial_high_signal_low_harm_addition() -> Check:
    model = Scorecard(
        kappa=np.array([0.20, 0.10]),
        h=np.array([0.40, 0.05]),
        gamma=np.array([0.10, 3.00]),
        w=np.array([1.0, 1.0]),
    )
    initial = np.array([True, False])
    expanded = np.array([True, True])
    deficit = 1.0
    value = 0.20
    initial_action = best_response(model, initial, deficit)
    expanded_action = best_response(model, expanded, deficit)
    _, _, initial_net = harm_benefit_net(model, initial_action)
    _, _, expanded_net = harm_benefit_net(model, expanded_action)

    assert signal_gain(model, expanded) > signal_gain(model, initial)
    assert not gaming_feasible(model, initial, deficit, value)
    assert not gaming_feasible(model, expanded, deficit, value)
    assert expanded_net < initial_net
    return Check(
        name="beneficial_high_signal_low_harm_addition",
        tests="Q15 measurement frontier: a high-signal, low-harm, low-kappa metric can improve the frontier without opening gaming.",
        result=(
            f"signal {signal_gain(model, initial):.4f}->{signal_gain(model, expanded):.4f}; "
            f"S {score_capacity(model, initial):.4f}->{score_capacity(model, expanded):.4f}; "
            f"forced-action net harm {initial_net:.4f}->{expanded_net:.4f}; gaming feasible={gaming_feasible(model, expanded, deficit, value)}"
        ),
        kill_condition="Would fail if every metric addition either opened gaming or worsened net harm despite high signal and low attack surface.",
    )


def conjunctive_gate_contrast() -> Check:
    measured_count = 3
    deficit = 0.30
    value = 0.18
    additive_s = float(measured_count)
    additive_cost = deficit**2 / (2.0 * additive_s)
    additive_action_harm = deficit
    additive_entry = np.sqrt(2.0 * additive_s * value)
    conjunctive_cost = measured_count * deficit**2 / 2.0
    conjunctive_action_harm = measured_count * deficit
    conjunctive_entry = np.sqrt(2.0 * value / measured_count)

    assert conjunctive_action_harm > additive_action_harm
    assert conjunctive_cost > additive_cost
    assert conjunctive_entry < additive_entry
    assert additive_cost <= value
    assert conjunctive_cost <= value
    return Check(
        name="conjunctive_gate_contrast",
        tests="Q13-Q17 aggregation contrast: conjunctive gates raise fixed-deficit burden while shrinking feasible entry.",
        result=(
            f"additive harm={additive_action_harm:.4f}, cost={additive_cost:.4f}, entry_band={additive_entry:.4f}; "
            f"conjunctive harm={conjunctive_action_harm:.4f}, cost={conjunctive_cost:.4f}, entry_band={conjunctive_entry:.4f}"
        ),
        kill_condition="Would fail if conjunctive aggregation did not increase per-gamer burden or did not reduce the entry band.",
    )


def run_all() -> list[Check]:
    return [
        reactive_hardening_converges(),
        route_switching_before_convergence(),
        add_dimension_expands_attack_surface(),
        static_commitment_dominates(),
        beneficial_high_signal_low_harm_addition(),
        conjunctive_gate_contrast(),
    ]


def main() -> None:
    checks = run_all()
    print("Iteration 27 simulations; deterministic finite-channel scorecards")
    for i, check in enumerate(checks, start=1):
        print(f"\n{i}. {check.name}")
        print(f"   tests: {check.tests}")
        print(f"   result: {check.result}")
        print(f"   kill/narrow condition: {check.kill_condition}")

    assert_checks_well_formed(checks)
    print(f"\nPASS: {len(checks)} simulation checks completed.")


if __name__ == "__main__":
    main()
