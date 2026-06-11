"""Identification toy for channel-level exchange rates (empirics track, step 1).

Run with:
    uv run --with numpy python identification_toy.py

Companion note: research/threads/exchange_rate_identification.md
Plan: plans/exchange-rate-empirics.md (agreed sequencing, step 1).

These are seeded linear-algebra toys inside the T5 model (additive score,
separable quadratic costs, linear hidden harm sum_j h_j a_j). They show when
the channel-level harm rates h_j are and are not recoverable from realized
harm observations: never from one regime's aggregate, exactly under full-rank
regime variation, directly from action traces with heterogeneous units, and
not under collinear regimes or selection contamination. They are exploratory
toys, not empirical evidence, and license no claim about HRRP or any real
scorecard.
"""

from __future__ import annotations

from dataclasses import dataclass

import numpy as np


SEED = 20260610


@dataclass
class Check:
    name: str
    tests: str
    result: str
    kill_condition: str


def fmt_vec(x: np.ndarray | list[float]) -> str:
    return "[" + ", ".join(f"{float(v):.4f}" for v in x) + "]"


def assert_checks_well_formed(checks: list[Check]) -> None:
    for check in checks:
        assert check.name.strip()
        assert check.tests.strip()
        assert check.result.strip()
        assert check.kill_condition.strip()


def capacity(kappa: np.ndarray, weights: np.ndarray) -> float:
    return float(np.sum(kappa * weights**2))


def best_response(kappa: np.ndarray, weights: np.ndarray, deficit: float) -> np.ndarray:
    return deficit * kappa * weights / capacity(kappa, weights)


def action_profile_matrix(
    kappa: np.ndarray, regimes: list[np.ndarray], deficit: float
) -> np.ndarray:
    return np.stack([best_response(kappa, w, deficit) for w in regimes])


KAPPA = np.array([1.0, 2.0, 0.5])
H_TRUE = np.array([0.5, 2.0, 0.0])
DEFICIT = 1.0


def realized_average_is_design_relative() -> Check:
    w_a = np.array([1.0, 0.2, 0.3])
    w_b = np.array([0.2, 1.0, 0.4])
    a_a = best_response(KAPPA, w_a, DEFICIT)
    a_b = best_response(KAPPA, w_b, DEFICIT)
    ratio_a = float(H_TRUE @ a_a) / DEFICIT
    ratio_b = float(H_TRUE @ a_b) / DEFICIT

    # Witness of one-equation non-identification: a different rate vector
    # consistent with the same single-regime observation (shift orthogonal
    # to the regime's action profile).
    shift = np.array([1.0, -1.0, 0.5])
    nu = shift - (float(shift @ a_a) / float(a_a @ a_a)) * a_a
    h_alt = H_TRUE + nu

    assert abs(ratio_a - ratio_b) > 0.25
    assert abs(float(h_alt @ a_a) - float(H_TRUE @ a_a)) < 1e-12
    assert not np.allclose(h_alt, H_TRUE)
    return Check(
        name="realized_average_is_design_relative",
        tests=(
            "T5's summary statistic H/d depends on the scorecard weights, so a realized average from "
            "one regime is the wrong number for another design (Lucas-critique form), and one regime's "
            "aggregate is one equation in n unknowns."
        ),
        result=(
            f"h={fmt_vec(H_TRUE)}, H/d under w_a={ratio_a:.4f}, under w_b={ratio_b:.4f}; "
            f"alternative rates {fmt_vec(h_alt)} match regime a's observed harm exactly"
        ),
        kill_condition=(
            "Would narrow this toy if two non-proportional weight vectors with these kappa produced "
            "equal H/d for generic h, or if the single-regime observation pinned down h up to a "
            "measure-zero set."
        ),
    )


def full_rank_regimes_identify_h() -> Check:
    regimes = [
        np.array([1.0, 0.2, 0.3]),
        np.array([0.2, 1.0, 0.4]),
        np.array([0.3, 0.3, 1.0]),
    ]
    profiles = action_profile_matrix(KAPPA, regimes, DEFICIT)
    rank = int(np.linalg.matrix_rank(profiles))
    harms = profiles @ H_TRUE
    h_hat = np.linalg.solve(profiles, harms)

    assert rank == 3
    assert np.allclose(h_hat, H_TRUE)
    return Check(
        name="full_rank_regimes_identify_h",
        tests=(
            "With one harm observation per regime and regime weight vectors whose induced action "
            "profiles a*_j(r) = d kappa_j w_j(r) / S(r) form a full-rank matrix, the channel-level "
            "h_j solve exactly — the policy-variation identification route."
        ),
        result=(
            f"action-profile matrix rank={rank}, recovered h_hat={fmt_vec(h_hat)}, "
            f"true h={fmt_vec(H_TRUE)} (includes a zero-harm channel recovered as zero)"
        ),
        kill_condition=(
            "Would kill this check if a full-rank action-profile system admitted a second solution, "
            "or if recovery failed at machine precision in the noiseless declared model."
        ),
    )


def collinear_regimes_leave_h_unidentified() -> Check:
    base = np.array([1.0, 0.2, 0.3])
    regimes = [base, 2.0 * base, 0.5 * base]
    profiles = action_profile_matrix(KAPPA, regimes, DEFICIT)
    rank = int(np.linalg.matrix_rank(profiles))
    harms = profiles @ H_TRUE

    _, _, vt = np.linalg.svd(profiles)
    null_direction = vt[rank]
    h_alt = H_TRUE + null_direction

    w_new = np.array([0.2, 1.0, 0.4])
    a_new = best_response(KAPPA, w_new, DEFICIT)
    gap = abs(float(h_alt @ a_new) - float(H_TRUE @ a_new))

    assert rank == 1
    assert np.allclose(profiles @ h_alt, harms)
    assert gap > 0.1
    return Check(
        name="collinear_regimes_leave_h_unidentified",
        tests=(
            "Proportional weight vectors induce proportional action profiles (rank 1), so the "
            "regime variation is fake: an alternative rate vector matches every observed harm yet "
            "predicts a different harm under a genuinely new design."
        ),
        result=(
            f"three regimes, action-profile rank={rank}; h_alt={fmt_vec(h_alt)} matches all observed "
            f"harms; held-out-design harm gap |h_alt.a_new - h.a_new|={gap:.4f}"
        ),
        kill_condition=(
            "Would narrow this toy if proportional weight vectors could induce non-proportional "
            "best-response profiles under the declared quadratic costs."
        ),
    )


def action_traces_regression_recovers_h() -> Check:
    rng = np.random.default_rng(SEED)
    w = np.array([1.0, 0.5, 0.8])
    n_units = 20
    unit_kappas = rng.uniform(0.3, 3.0, size=(n_units, 3))
    unit_deficits = rng.uniform(0.5, 2.0, size=n_units)
    traces = np.stack(
        [
            best_response(unit_kappas[i], w, float(unit_deficits[i]))
            for i in range(n_units)
        ]
    )
    rank = int(np.linalg.matrix_rank(traces))
    unit_harms = traces @ H_TRUE
    h_hat, *_ = np.linalg.lstsq(traces, unit_harms, rcond=None)

    assert rank == 3
    assert np.allclose(h_hat, H_TRUE)
    return Check(
        name="action_traces_regression_recovers_h",
        tests=(
            "When per-channel action traces are observed (the Zuckerman-style case), harm-on-actions "
            "is a regression: a single regime suffices because unit-level kappa heterogeneity varies "
            "the channel mix across units."
        ),
        result=(
            f"{n_units} units, one regime, trace matrix rank={rank}, "
            f"recovered h_hat={fmt_vec(h_hat)}, true h={fmt_vec(H_TRUE)}"
        ),
        kill_condition=(
            "Would narrow this toy if heterogeneous-kappa best responses under one weight vector "
            "were rank-deficient for generic draws, or if the regression failed in the noiseless "
            "declared model."
        ),
    )


def selection_contamination_biases_recovery() -> Check:
    regimes = [
        np.array([1.0, 0.2, 0.3]),
        np.array([0.2, 1.0, 0.4]),
        np.array([0.3, 0.3, 1.0]),
        np.array([0.8, 0.5, 0.2]),
        np.array([0.4, 0.9, 0.6]),
        np.array([0.6, 0.1, 0.9]),
    ]
    profiles = action_profile_matrix(KAPPA, regimes, DEFICIT)
    # Pool-composition drift in the first three regimes (no panel freeze):
    # harm moves with the design's weight on channel 1 without any action.
    gamma = 0.6
    selection = np.array([gamma * float(w[0]) for w in regimes[:3]] + [0.0, 0.0, 0.0])
    observed = profiles @ H_TRUE + selection

    h_naive, *_ = np.linalg.lstsq(profiles, observed, rcond=None)
    naive_error = float(np.max(np.abs(h_naive - H_TRUE)))

    frozen = slice(3, 6)
    frozen_rank = int(np.linalg.matrix_rank(profiles[frozen]))
    h_frozen = np.linalg.solve(profiles[frozen], observed[frozen])

    assert naive_error > 0.1
    assert frozen_rank == 3
    assert np.allclose(h_frozen, H_TRUE)
    return Check(
        name="selection_contamination_biases_recovery",
        tests=(
            "If realized harm includes a pool-composition term correlated with the design, every "
            "harm equation is biased and full-rank variation does not save the regression; "
            "restricting to panel-frozen regimes (the contract's response-channel field as an "
            "exclusion restriction) restores exact recovery."
        ),
        result=(
            f"naive h_hat={fmt_vec(h_naive)} (max error {naive_error:.4f}); "
            f"panel-frozen subset rank={frozen_rank}, recovered h={fmt_vec(h_frozen)}, "
            f"true h={fmt_vec(H_TRUE)}"
        ),
        kill_condition=(
            "Would narrow this toy if a design-correlated additive selection term left the "
            "least-squares estimate unbiased, or if the frozen-subset solve failed in the "
            "noiseless declared model."
        ),
    )


def run_all() -> list[Check]:
    return [
        realized_average_is_design_relative(),
        full_rank_regimes_identify_h(),
        collinear_regimes_leave_h_unidentified(),
        action_traces_regression_recovers_h(),
        selection_contamination_biases_recovery(),
    ]


def main() -> None:
    checks = run_all()
    print("Identification toy; seeded h_j recovery checks inside the T5 model")
    for i, check in enumerate(checks, start=1):
        print(f"\n{i}. {check.name}")
        print(f"   tests: {check.tests}")
        print(f"   result: {check.result}")
        print(f"   kill/narrow condition: {check.kill_condition}")

    assert_checks_well_formed(checks)
    print(f"\nPASS: {len(checks)} simulation checks completed.")


if __name__ == "__main__":
    main()
