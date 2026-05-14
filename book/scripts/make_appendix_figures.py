#!/usr/bin/env python3
"""Generate the retained visual appendix figures.

The suite is intentionally small. Each figure must carry a quantitative or
structural comparison that is clearer visually than in prose.
"""

from __future__ import annotations

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


ROOT = Path(__file__).resolve().parents[1]
FIG_DIR = ROOT / "figures"
SEED = 20260513
N = 400_000


FIGURE_RATIONALES = {
    "appendix-a-threshold-response.pdf": (
        "Foregrounds threshold response rather than covariance: three panels use "
        "the same proxy threshold and compare the hidden mean shift across "
        "linear coupling, independence, and nonlinear dependence. Points are "
        "lightweight and direct labels replace legends; boxes, fills, and heavy "
        "grids were removed. The tall small-multiple aspect keeps vertical mean "
        "shifts legible at appendix width."
    ),
    "appendix-b-selection-vs-intervention.pdf": (
        "Foregrounds mechanism: selection changes weights on existing support, "
        "while intervention transports fixed types to new states. Marker area is "
        "the only encoding of selection weight; intervention arrows encode "
        "movement. The wide two-panel aspect supports side-by-side comparison, "
        "with direct annotations and no decorative color."
    ),
    "appendix-c-welfare-objects.pdf": (
        "Foregrounds the Iteration 21 welfare distinction: fixed-deficit "
        "H_per(d) is invariant where gaming is feasible, while H_pop grows as "
        "aggregate gaming capacity K expands. Lines and bars encode different "
        "objects; the one accent marks the non-Gaussian stress distribution. "
        "The compact aspect keeps both panels readable without a legend box."
    ),
    "appendix-d-response-geometry.pdf": (
        "Foregrounds active-set regimes: quadratic response spreads on an "
        "interior face, linear/fixed-charge response selects one route, and "
        "fixed charges plus caps switch supports. Equal action axes make the "
        "geometric panels truthful; the path panel uses direct labels and faint "
        "regime dividers instead of stacked fills or ornamental regions."
    ),
}


def setup() -> None:
    FIG_DIR.mkdir(exist_ok=True)
    for old_pdf in FIG_DIR.glob("*.pdf"):
        old_pdf.unlink()

    plt.rcParams.update(
        {
            "font.family": "serif",
            "font.size": 9,
            "axes.spines.top": False,
            "axes.spines.right": False,
            "axes.grid": False,
            "axes.linewidth": 0.7,
            "xtick.major.width": 0.7,
            "ytick.major.width": 0.7,
            "savefig.bbox": "tight",
            "savefig.pad_inches": 0.035,
            "pdf.fonttype": 42,
            "ps.fonttype": 42,
        }
    )


def save(fig: plt.Figure, name: str) -> None:
    fig.savefig(FIG_DIR / name)
    plt.close(fig)


def draw_range_frame(ax: plt.Axes, xlim: tuple[float, float], ylim: tuple[float, float]) -> None:
    ax.set_xlim(*xlim)
    ax.set_ylim(*ylim)
    ax.plot([xlim[0], xlim[1]], [ylim[0], ylim[0]], color="0.15", lw=0.7, clip_on=False)
    ax.plot([xlim[0], xlim[0]], [ylim[0], ylim[1]], color="0.15", lw=0.7, clip_on=False)


def threshold_response() -> None:
    rng = np.random.default_rng(SEED)
    n = 520
    threshold = 1.0
    panels = []

    p = rng.normal(size=n)
    h = 0.65 * p + rng.normal(scale=0.70, size=n)
    panels.append(("linear coupling", p, h))

    p = rng.normal(size=n)
    h = rng.normal(size=n)
    panels.append(("independent", p, h))

    z = rng.normal(size=n)
    p = z
    h = z**2 - 1 + rng.normal(scale=0.22, size=n)
    panels.append(("nonlinear; cov ~ 0", p, h))

    fig, axes = plt.subplots(1, 3, figsize=(7.2, 2.55), sharex=True, sharey=True)
    for ax, (label, p, h) in zip(axes, panels):
        selected = p >= threshold
        base = float(np.mean(h))
        selected_mean = float(np.mean(h[selected]))
        cov = float(np.cov(p, h, ddof=1)[0, 1])

        ax.scatter(p[~selected], h[~selected], s=7, c="0.76", edgecolors="none", rasterized=True)
        ax.scatter(p[selected], h[selected], s=9, c="0.12", edgecolors="none", rasterized=True)
        ax.axvline(threshold, color="0.25", lw=0.75, ls=(0, (3, 2)))
        ax.axhline(base, color="0.55", lw=0.65)
        ax.axhline(selected_mean, color="0.05", lw=0.9)
        ax.text(-2.85, 3.45, label, ha="left", va="top", fontsize=9)
        ax.text(-2.85, 3.02, f"cov {cov:+.2f}", ha="left", va="top", fontsize=8, color="0.35")
        selected_label_y = selected_mean + (0.18 if selected_mean >= base else -0.25)
        ax.text(2.08, selected_label_y, "selected", fontsize=7.3, color="0.05", ha="left")
        ax.text(-2.85, base + 0.09, "baseline mean", fontsize=7.5, color="0.45")
        draw_range_frame(ax, (-3.0, 3.0), (-2.2, 3.6))

    axes[0].set_ylabel("hidden coordinate H")
    for ax in axes:
        ax.set_xlabel("proxy P")
    save(fig, "appendix-a-threshold-response.pdf")


def selection_vs_intervention() -> None:
    rng = np.random.default_rng(SEED + 1)
    fig, axes = plt.subplots(1, 2, figsize=(7.0, 2.7), sharex=True, sharey=True)

    p = rng.normal(size=340)
    h = 0.22 * p + rng.normal(scale=0.62, size=340)
    weight = 8 + 44 / (1 + np.exp(-2.8 * (p - 0.65)))
    axes[0].scatter(p, h, s=weight, c="0.24", alpha=0.52, edgecolors="none", rasterized=True)
    axes[0].axvline(0.8, color="0.2", lw=0.8, ls=(0, (3, 2)))
    axes[0].text(-2.82, 2.28, "selection", fontsize=10)
    axes[0].text(-2.82, 1.90, "same support;\nhigh-P states get more weight", fontsize=8.2, color="0.25")

    q = np.linspace(-2.25, 1.55, 36)
    p0 = q
    h0 = np.zeros_like(q)
    pass_score = 0.95
    active = (q > -0.82) & (q < pass_score)
    a = np.clip(pass_score - q, 0, 1.35) * active
    p1 = p0 + a
    h1 = h0 + a
    no_response = ~active
    axes[1].scatter(p0[no_response], h0[no_response], s=11, c="0.82", edgecolors="none")
    axes[1].scatter(p0[active], h0[active], s=13, c="0.58", edgecolors="none")
    for x0, y0, x1, y1 in zip(p0[active], h0[active], p1[active], h1[active]):
        axes[1].annotate(
            "",
            xy=(x1, y1),
            xytext=(x0, y0),
            arrowprops={"arrowstyle": "->", "color": "0.25", "lw": 0.65, "shrinkA": 0, "shrinkB": 0},
        )
    axes[1].scatter(p1[active], h1[active], s=16, c="0.08", edgecolors="none")
    axes[1].axhline(0, color="0.65", lw=0.6)
    axes[1].axvline(pass_score, color="0.35", lw=0.7, ls=(0, (3, 2)))
    axes[1].text(-2.82, 2.28, "intervention", fontsize=10)
    axes[1].text(-2.82, 1.90, "gaming band responds;\nothers stay put", fontsize=8.2, color="0.25")
    axes[1].text(-2.1, -0.24, "too costly", fontsize=7.5, color="0.50")
    axes[1].text(1.45, -0.33, "already pass", fontsize=7.5, color="0.50")
    axes[1].text(pass_score + 0.08, 1.18, "after response:\njust pass", fontsize=7.5, color="0.05")
    axes[1].text(pass_score + 0.05, 0.15, "passing score", fontsize=7.2, color="0.35", rotation=90)

    for ax in axes:
        ax.set_xlabel("proxy P")
        draw_range_frame(ax, (-3.0, 3.0), (-0.45, 2.45))
    axes[0].set_ylabel("hidden harm H")
    axes[1].set_ylabel("hidden harm H")
    save(fig, "appendix-b-selection-vs-intervention.pdf")


def welfare_objects() -> None:
    rng = np.random.default_rng(SEED + 2)
    value = 0.7
    threshold = 1.0
    k_values = np.array([0.35, 0.9, 1.8, 3.2])
    deltas = np.sqrt(2 * k_values * value)
    deficits = np.linspace(0.0, 2.5, 300)
    h_per = np.where(deficits[:, None] <= deltas[None, :], deficits[:, None], np.nan)

    q_normal = rng.normal(loc=0.0, scale=1.0, size=N)
    q_skew = 1.1 - rng.lognormal(mean=0.0, sigma=0.75, size=N)
    d_normal = threshold - q_normal
    d_skew = threshold - q_skew
    h_pop_normal = []
    h_pop_skew = []
    for delta in deltas:
        mask_normal = (d_normal > 0.0) & (d_normal <= delta)
        mask_skew = (d_skew > 0.0) & (d_skew <= delta)
        h_pop_normal.append(np.mean(np.where(mask_normal, d_normal, 0.0)))
        h_pop_skew.append(np.mean(np.where(mask_skew, d_skew, 0.0)))
    h_pop_normal = np.array(h_pop_normal)
    h_pop_skew = np.array(h_pop_skew)

    assert np.all(np.diff(h_pop_normal) > 0.0)
    assert np.all(np.diff(h_pop_skew) > 0.0)
    feasible = np.sum(np.isfinite(h_per), axis=1) >= 2
    assert all(np.ptp(row[np.isfinite(row)]) < 1e-12 for row in h_per[feasible])

    fig, axes = plt.subplots(1, 2, figsize=(7.1, 2.75))
    styles = ["-", (0, (5, 2)), (0, (2, 2)), (0, (1, 2))]
    for idx, k in enumerate(k_values):
        axes[0].plot(deficits, h_per[:, idx], color="0.12", lw=1.35, ls=styles[idx])
        last = np.nanmax(np.where(np.isfinite(h_per[:, idx]), deficits, np.nan))
        axes[0].text(last + 0.025, last, f"K={k:.2g}", fontsize=7.2, va="center", color="0.2")
    axes[0].text(0.05, 2.28, "fixed deficit: H_per(d)=d\nwhere gaming is feasible", fontsize=8.2)
    axes[0].set_xlabel("score deficit d")
    axes[0].set_ylabel("per-gamer harm")
    draw_range_frame(axes[0], (0.0, 2.55), (0.0, 2.5))

    x = np.arange(len(k_values))
    width = 0.32
    axes[1].bar(x - width / 2, h_pop_normal, width, color="0.22", linewidth=0)
    axes[1].bar(x + width / 2, h_pop_skew, width, color="#9b4d2e", linewidth=0)
    axes[1].text(2.45, max(h_pop_skew) * 1.10, "skewed Q", color="#7d3d24", fontsize=8)
    axes[1].text(2.45, max(h_pop_skew) * 0.99, "normal Q", color="0.18", fontsize=8)
    axes[1].set_xticks(x, [f"{k:.2g}" for k in k_values])
    axes[1].set_xlabel("aggregate gaming capacity K")
    axes[1].set_ylabel("population harm")
    draw_range_frame(axes[1], (-0.55, len(k_values) - 0.45), (0.0, max(h_pop_skew) * 1.32))

    save(fig, "appendix-c-welfare-objects.pdf")


def response_geometry() -> None:
    fig, axes = plt.subplots(1, 3, figsize=(7.4, 2.65))

    x = np.linspace(0, 1.25, 180)
    y = np.linspace(0, 1.25, 180)
    xx, yy = np.meshgrid(x, y)
    d = 1.0
    c = np.array([[1.0, 0.62], [0.62, 1.35]])
    w = np.array([1.0, 1.0])
    a_star = d * (c @ w) / float(w @ c @ w)
    inv_c = np.linalg.inv(c)
    cost = 0.5 * (inv_c[0, 0] * xx**2 + 2 * inv_c[0, 1] * xx * yy + inv_c[1, 1] * yy**2)
    axes[0].contour(xx, yy, cost, levels=[0.06, 0.12, 0.20, 0.31, 0.45], colors="0.68", linewidths=0.55)
    axes[0].plot(x, d - x, color="0.08", lw=1.45)
    axes[0].scatter([a_star[0]], [a_star[1]], c="0.08", s=24)
    axes[0].text(0.08, 1.13, "quadratic:\nspread along Cw", fontsize=8.1)
    axes[0].text(a_star[0] + 0.04, a_star[1] + 0.03, "a*", fontsize=7.5)

    axes[1].plot(x, d - x, color="0.08", lw=1.45)
    axes[1].scatter([1.0], [0.0], c="0.08", s=28, marker="s")
    axes[1].scatter([0.0], [1.0], c="0.64", s=22, marker="s")
    axes[1].text(0.08, 1.13, "linear / fixed charge:\none route wins", fontsize=8.1)
    axes[1].text(0.62, 0.10, "chosen", fontsize=7.5)

    deficits = np.linspace(0.5, 12.0, 24)
    fixed_cost = np.array([0.0, 5.0, 7.0])
    marginal_cost = np.array([3.0, 1.0, 1.4])
    caps = np.array([4.0, 7.0, 7.0])
    actions = np.array([solve_capped_fixed_charge(di, fixed_cost, marginal_cost, np.ones(3), caps)[1] for di in deficits])
    axes[2].plot(deficits, actions[:, 0], color="0.10", lw=1.35)
    axes[2].plot(deficits, actions[:, 1], color="0.42", lw=1.35, ls=(0, (4, 2)))
    axes[2].plot(deficits, actions[:, 2], color="0.64", lw=1.1, ls=(0, (1, 2)))
    supports = [tuple(np.flatnonzero(row > 1e-9) + 1) for row in actions]
    for i in range(1, len(deficits)):
        if supports[i] != supports[i - 1]:
            axes[2].axvline(deficits[i], color="0.82", lw=0.55)
    axes[2].text(0.8, 6.45, "active-set switches", fontsize=8.1)
    axes[2].text(2.25, 2.05, "ch. 1", fontsize=7.5, color="0.10")
    axes[2].text(6.1, 5.55, "ch. 2", fontsize=7.5, color="0.35")
    axes[2].text(9.85, 2.35, "ch. 1+2", fontsize=7.5, color="0.50")
    axes[2].set_xlabel("score deficit d")
    axes[2].set_ylabel("chosen action")
    draw_range_frame(axes[2], (0.5, 12.0), (0.0, 7.45))

    for ax in axes[:2]:
        ax.set_aspect("equal", adjustable="box")
        ax.set_xlabel("action a1")
        ax.set_ylabel("action a2")
        draw_range_frame(ax, (0.0, 1.2), (0.0, 1.2))
    save(fig, "appendix-d-response-geometry.pdf")


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


def powerset_indices(n: int):
    from itertools import combinations

    for r in range(1, n + 1):
        yield from combinations(range(n), r)


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


def write_rationales() -> None:
    lines = [
        "# Figure rationale audit",
        "",
        "Generated by `scripts/make_appendix_figures.py`. Each retained figure is a comparison figure, not decoration.",
        "",
    ]
    for name, rationale in FIGURE_RATIONALES.items():
        lines.extend([f"## {name}", "", rationale, ""])
    (FIG_DIR / "RATIONALES.md").write_text("\n".join(lines), encoding="utf-8")


def main() -> None:
    setup()
    threshold_response()
    selection_vs_intervention()
    welfare_objects()
    response_geometry()
    write_rationales()


if __name__ == "__main__":
    main()
