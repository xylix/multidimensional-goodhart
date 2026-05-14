"""Iteration 36 checks for response dynamics beyond the static scorecard toy.

Run with:
    uv run --with numpy python iteration36_response_dynamics.py

These are seeded dynamic toy checks. They show that stochastic observation and
endogenous stakes can alter the static capacity story under declared update
rules. They are not a convergence theorem, a performative fixed-point theorem,
or empirical evidence.
"""

from __future__ import annotations

from dataclasses import dataclass

import numpy as np


SEED = 20260514


@dataclass
class Check:
    name: str
    tests: str
    result: str
    kill_condition: str


@dataclass
class DynamicPath:
    chosen_channels: list[int]
    capacities: list[float]
    observed_actions: list[np.ndarray]


@dataclass
class StakesPath:
    values: list[float]
    gaming: list[bool]
    observed_harm: list[float]
    hidden_harm: list[float]


def fmt_vec(x: np.ndarray | list[float]) -> str:
    return "[" + ", ".join(f"{float(v):.4f}" for v in x) + "]"


def assert_checks_well_formed(checks: list[Check]) -> None:
    for check in checks:
        assert check.name.strip()
        assert check.tests.strip()
        assert check.result.strip()
        assert check.kill_condition.strip()


def score_capacity(kappa: np.ndarray, weights: np.ndarray) -> float:
    return float(np.sum(kappa * weights**2))


def best_response(kappa: np.ndarray, weights: np.ndarray, deficit: float) -> np.ndarray:
    capacity = score_capacity(kappa, weights)
    if capacity <= 0.0:
        return np.zeros_like(kappa)
    return deficit * kappa * weights / capacity


def gaming_feasible(kappa: np.ndarray, weights: np.ndarray, deficit: float, value: float) -> bool:
    capacity = score_capacity(kappa, weights)
    if capacity <= 0.0:
        return False
    return bool(deficit**2 / (2.0 * capacity) <= value)


def noisy_largest_action_hardening(
    rng: np.random.Generator,
    kappa: np.ndarray,
    weights: np.ndarray,
    deficit: float,
    alpha: float,
    floor: float,
    observation_sigma: float,
    rounds: int,
) -> DynamicPath:
    current = kappa.astype(float).copy()
    chosen_channels: list[int] = []
    capacities = [score_capacity(current, weights)]
    observed_actions: list[np.ndarray] = []
    for _ in range(rounds):
        true_action = best_response(current, weights, deficit)
        observed = true_action + rng.normal(0.0, observation_sigma, size=true_action.shape)
        chosen = int(np.argmax(observed))
        current[chosen] = max(floor, alpha * current[chosen])
        chosen_channels.append(chosen)
        observed_actions.append(observed)
        capacities.append(score_capacity(current, weights))
    return DynamicPath(chosen_channels, capacities, observed_actions)


def stochastic_observation_can_miss_repair_budget() -> Check:
    rng = np.random.default_rng(SEED)
    kappa = np.array([1.0, 1.0, 1.0])
    weights = np.array([2.0, 0.2, 0.2])
    deficit = 1.0
    value = 0.25
    threshold = deficit**2 / (2.0 * value)
    alpha = 0.40
    floor = 0.05
    budget = 1

    path = noisy_largest_action_hardening(
        rng,
        kappa,
        weights,
        deficit,
        alpha,
        floor,
        observation_sigma=0.70,
        rounds=budget,
    )
    true_action = best_response(kappa, weights, deficit)
    oracle = int(np.argmax(true_action))
    oracle_kappa = kappa.copy()
    oracle_kappa[oracle] = max(floor, alpha * oracle_kappa[oracle])
    oracle_capacity = score_capacity(oracle_kappa, weights)

    chosen = path.chosen_channels[0]
    assert oracle == 0
    assert chosen != oracle
    assert path.capacities[-1] >= threshold
    assert oracle_capacity < threshold
    return Check(
        name="stochastic_observation_can_miss_repair_budget",
        tests=(
            "Q14 dynamic extension: noisy observation of current best-response actions can harden the wrong "
            "channel and miss the static no-gaming capacity threshold within a fixed repair budget."
        ),
        result=(
            f"true_action={fmt_vec(true_action)}, observed_action={fmt_vec(path.observed_actions[0])}, "
            f"chosen_channel={chosen + 1}, oracle_channel={oracle + 1}, "
            f"S path={fmt_vec(path.capacities)}, oracle_S_after_one={oracle_capacity:.4f}, "
            f"no-gaming threshold={threshold:.4f}"
        ),
        kill_condition=(
            "Would narrow this toy if the declared observation noise could not select a low-capacity channel, "
            "or if the missed update still crossed S(M) < d^2/(2V) within the fixed repair budget."
        ),
    )


def endogenous_stakes_path(
    kappa: np.ndarray,
    weights: np.ndarray,
    hidden_harm_weights: np.ndarray,
    observed_harm_weights: np.ndarray,
    deficit: float,
    initial_value: float,
    trust_lambda: float,
    trust_rho: float,
    rounds: int,
) -> StakesPath:
    value = float(initial_value)
    values = [value]
    gaming: list[bool] = []
    observed_harm: list[float] = []
    hidden_harm: list[float] = []
    for _ in range(rounds):
        if gaming_feasible(kappa, weights, deficit, value):
            action = best_response(kappa, weights, deficit)
            is_gaming = True
        else:
            action = np.zeros_like(kappa)
            is_gaming = False
        h_obs = float(observed_harm_weights @ action)
        h_hidden = float(hidden_harm_weights @ action)
        value = (1.0 - trust_lambda) * value + trust_lambda * initial_value * np.exp(-trust_rho * h_obs)
        gaming.append(is_gaming)
        observed_harm.append(h_obs)
        hidden_harm.append(h_hidden)
        values.append(value)
    return StakesPath(values, gaming, observed_harm, hidden_harm)


def endogenous_stakes_depend_on_observable_harm() -> Check:
    kappa = np.array([1.0, 1.0])
    weights = np.array([1.0, 1.0])
    hidden_harm = np.array([3.0, 3.0])
    deficit = 1.0
    initial_value = 1.0
    rounds = 8
    trust_lambda = 0.70
    trust_rho = 1.0
    cost_threshold_value = deficit**2 / (2.0 * score_capacity(kappa, weights))

    visible = endogenous_stakes_path(
        kappa,
        weights,
        hidden_harm,
        observed_harm_weights=hidden_harm,
        deficit=deficit,
        initial_value=initial_value,
        trust_lambda=trust_lambda,
        trust_rho=trust_rho,
        rounds=rounds,
    )
    invisible = endogenous_stakes_path(
        kappa,
        weights,
        hidden_harm,
        observed_harm_weights=np.zeros_like(hidden_harm),
        deficit=deficit,
        initial_value=initial_value,
        trust_lambda=trust_lambda,
        trust_rho=trust_rho,
        rounds=rounds,
    )

    visible_rounds = sum(visible.gaming)
    invisible_rounds = sum(invisible.gaming)
    visible_hidden = sum(visible.hidden_harm)
    invisible_hidden = sum(invisible.hidden_harm)

    assert visible_rounds < invisible_rounds
    assert min(visible.values) < cost_threshold_value
    assert invisible.gaming == [True] * rounds
    assert invisible_hidden > visible_hidden
    return Check(
        name="endogenous_stakes_depend_on_observable_harm",
        tests=(
            "Q11 endogenous-stakes closure: with V_{t+1}=(1-lambda)V_t+lambda V0 exp(-rho H_obs_t), "
            "trust/stakes dynamics depend on what harm is observable under the declared update rule."
        ),
        result=(
            f"visible V={fmt_vec(visible.values)}, visible gaming={visible.gaming}, "
            f"invisible V={fmt_vec(invisible.values)}, invisible gaming={invisible.gaming}, "
            f"hidden_harm visible={visible_hidden:.4f}, invisible={invisible_hidden:.4f}, "
            f"current-value gaming cutoff V>={cost_threshold_value:.4f}"
        ),
        kill_condition=(
            "Would narrow this toy if changing only the observed-harm channel left the stakes path and "
            "gaming incidence unchanged under the declared recurrence."
        ),
    )


def run_all() -> list[Check]:
    return [
        stochastic_observation_can_miss_repair_budget(),
        endogenous_stakes_depend_on_observable_harm(),
    ]


def main() -> None:
    checks = run_all()
    print("Iteration 36 simulations; seeded response-dynamics toys")
    for i, check in enumerate(checks, start=1):
        print(f"\n{i}. {check.name}")
        print(f"   tests: {check.tests}")
        print(f"   result: {check.result}")
        print(f"   kill/narrow condition: {check.kill_condition}")

    assert_checks_well_formed(checks)
    print(f"\nPASS: {len(checks)} simulation checks completed.")


if __name__ == "__main__":
    main()
