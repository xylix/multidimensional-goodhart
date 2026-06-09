#!/usr/bin/env python3
"""Generate the retained manuscript figures.

The suite is intentionally small. Each figure must carry a quantitative or
structural comparison that is clearer visually than in prose.
"""

from __future__ import annotations

import math
from datetime import datetime, timezone
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


ROOT = Path(__file__).resolve().parents[1]
FIG_DIR = ROOT / "figures"
SEED = 20260513
N = 400_000
PDF_METADATA = {
    "Creator": "book/scripts/make_appendix_figures.py",
    "Producer": "matplotlib",
    "CreationDate": datetime(2026, 5, 15, tzinfo=timezone.utc),
    "ModDate": datetime(2026, 5, 15, tzinfo=timezone.utc),
}


FIGURE_RATIONALES = {
    "part-i-dimension-observation-gap.pdf": (
        "Promoted for the contract notation (Part 3). The block diagram "
        "separates measured target components, which phi carries into the "
        "proxy, from unmeasured components with no path into the proxy (the "
        "dimension gap), and shows residual artifact epsilon entering the "
        "proxy from outside the target (the observation gap). It fixes "
        "vocabulary; it makes no quantitative claim."
    ),
    "part-ii-t1-t2-drift-envelope.pdf": (
        "Promoted for T1/T2. The ellipse shows the declared selection-drift "
        "envelope in hidden space, while Boltzmann-style paths show finite "
        "pressure trajectories that can occupy different parts of the same "
        "envelope. It keeps covariance as a local path fact rather than a "
        "finite-pressure replacement for the bound."
    ),
    "part-ii-t4-t5-cost-ellipse.pdf": (
        "Promoted for T4/T5. The figure puts the convex score-deficit budget "
        "on the same action-space page as hidden-harm exchange rates: the "
        "tangent solves private affordability, while the harm arrows show why "
        "welfare is a separate declared primitive."
    ),
    "part-ii-population-gaming-band.pdf": (
        "Promoted for the H_per/H_pop distinction. The quality CDF and gaming "
        "band show that fixed-deficit per-gamer harm and population harm are "
        "different objects; widening capacity can recruit more gamers without "
        "changing the per-gamer harm formula."
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
    fig.savefig(FIG_DIR / name, metadata=PDF_METADATA)
    plt.close(fig)


def draw_range_frame(ax: plt.Axes, xlim: tuple[float, float], ylim: tuple[float, float]) -> None:
    ax.set_xlim(*xlim)
    ax.set_ylim(*ylim)
    ax.plot([xlim[0], xlim[1]], [ylim[0], ylim[0]], color="0.15", lw=0.7, clip_on=False)
    ax.plot([xlim[0], xlim[0]], [ylim[0], ylim[1]], color="0.15", lw=0.7, clip_on=False)


def dimension_observation_gap() -> None:
    fig, ax = plt.subplots(figsize=(7.2, 2.95))
    ax.axis("off")
    ax.set_xlim(0, 10)
    ax.set_ylim(0, 4.35)

    def block(x: float, y: float, w: float, h: float, label: str, fc: str = "white") -> None:
        ax.add_patch(plt.Rectangle((x, y), w, h, fill=True, fc=fc, ec="0.15", lw=1.0))
        ax.text(x + w / 2, y + h / 2, label, ha="center", va="center", fontsize=8.3, color="0.1")

    ax.text(2.0, 4.08, "target components", fontsize=10, ha="center")
    block(0.55, 3.0, 2.9, 0.78, "measured component\nof G")
    block(0.55, 1.95, 2.9, 0.78, "unmeasured component\nof G", fc="0.93")
    block(0.55, 0.9, 2.9, 0.78, "unmeasured component\nof G", fc="0.93")

    ax.text(8.0, 4.08, "proxy", fontsize=10, ha="center")
    block(6.7, 2.5, 2.6, 0.95, "proxy score\ncomponents P")

    ax.annotate(
        "",
        xy=(6.65, 3.18),
        xytext=(3.35, 3.39),
        arrowprops={"arrowstyle": "->", "lw": 1.1, "color": "0.12"},
    )
    ax.text(5.0, 3.55, "phi carries only the\nmeasured component", fontsize=8.0, ha="center")

    ax.text(
        3.75,
        1.62,
        "dimension gap:\nno path into the proxy",
        fontsize=8.2,
        color="0.3",
        ha="left",
    )

    ax.annotate(
        "",
        xy=(7.6, 2.45),
        xytext=(7.6, 0.95),
        arrowprops={"arrowstyle": "->", "lw": 1.0, "color": "0.4", "ls": (0, (3, 2))},
    )
    ax.text(
        7.78,
        1.42,
        "observation gap:\nresidual artifact epsilon enters\nfrom outside the target",
        fontsize=8.0,
        color="0.25",
    )
    save(fig, "part-i-dimension-observation-gap.pdf")


def drift_envelope() -> None:
    rng = np.random.default_rng(SEED)
    fig, ax = plt.subplots(figsize=(5.6, 3.25))
    sigma = np.array([[1.0, 0.42], [0.42, 0.72]])
    inv_sigma = np.linalg.inv(sigma)
    delta = 1.0
    theta = np.linspace(0, 2 * np.pi, 300)
    unit = np.vstack([np.cos(theta), np.sin(theta)])
    ellipse = np.linalg.cholesky(sigma) @ unit * delta
    ax.plot(ellipse[0], ellipse[1], color="0.12", lw=1.25)
    ax.fill(ellipse[0], ellipse[1], color="0.92", zorder=0)

    h = rng.multivariate_normal([0.0, 0.0], sigma, size=120_000)
    proxies = [
        ("P1", h @ np.array([0.95, 0.25]) + 0.35 * rng.normal(size=len(h)), "0.10"),
        ("P2", h @ np.array([-0.25, 1.10]) + 0.45 * rng.normal(size=len(h)), "0.42"),
    ]
    betas = np.linspace(0, 0.85, 38)
    for label, p, color in proxies:
        path = []
        for beta in betas:
            raw = np.exp(beta * p)
            weights = raw / np.mean(raw)
            drift = np.average(h, axis=0, weights=weights)
            norm = float(drift @ inv_sigma @ drift)
            if norm > delta**2:
                drift = drift / np.sqrt(norm)
            path.append(drift)
        path = np.array(path)
        ax.plot(path[:, 0], path[:, 1], color=color, lw=1.35)
        ax.scatter(path[-1, 0], path[-1, 1], color=color, s=22)
        ax.text(path[-1, 0] + 0.04, path[-1, 1] + 0.03, label, fontsize=8, color=color)

    ax.axhline(0, color="0.75", lw=0.6)
    ax.axvline(0, color="0.75", lw=0.6)
    ax.text(-1.25, 0.92, "T1/T2 drift envelope", fontsize=9.3)
    ax.text(-1.25, 0.76, "declared hidden covariance and value metric", fontsize=7.7, color="0.35")
    ax.text(-1.25, -0.95, "two hidden coordinates drawn\nfor visualization only", fontsize=7.7, color="0.35")
    ax.text(0.12, -0.95, "Boltzmann-style finite-pressure paths", fontsize=7.8, color="0.25")
    ax.set_xlabel("hidden coordinate H1")
    ax.set_ylabel("hidden coordinate H2")
    draw_range_frame(ax, (-1.35, 1.35), (-1.1, 1.1))
    save(fig, "part-ii-t1-t2-drift-envelope.pdf")


def cost_ellipse() -> None:
    fig, axes = plt.subplots(1, 2, figsize=(7.2, 3.05))
    x = np.linspace(0, 1.35, 220)
    y = np.linspace(0, 1.35, 220)
    xx, yy = np.meshgrid(x, y)
    w = np.array([1.0, 1.0])
    c_inv = np.diag([1 / 1.45, 1 / 0.62])
    cost = 0.5 * (c_inv[0, 0] * xx**2 + c_inv[1, 1] * yy**2)
    d = 1.0
    a_star = np.array([1.45, 0.62]) * w * d / float(np.array([1.45, 0.62]) @ (w**2))

    axes[0].contour(xx, yy, cost, levels=[0.08, 0.16, 0.28, 0.42], colors="0.65", linewidths=0.7)
    axes[0].plot(x, d - x, color="0.10", lw=1.4)
    axes[0].fill_between(x, np.maximum(d - x, 0), 1.35, where=x <= d, color="0.86", alpha=0.45)
    axes[0].scatter([a_star[0]], [a_star[1]], c="0.08", s=24)
    axes[0].text(0.07, 1.22, "T4: m(d) <= V", fontsize=9.2)
    axes[0].text(a_star[0] + 0.035, a_star[1] + 0.03, "cost-minimizing action", fontsize=7.5)
    axes[0].text(0.58, 0.44, "score-clearing half-plane\nw . a >= d", fontsize=7.7, color="0.24")
    axes[0].text(0.06, 0.5, "private-cost\ncontours", fontsize=7.5, color="0.45")

    axes[1].plot(x, d - x, color="0.10", lw=1.4)
    axes[1].scatter([0.5], [0.5], c="0.08", s=24)
    axes[1].arrow(0.5, 0.5, 0.45, 0.0, head_width=0.035, head_length=0.045, color="#8a3f2a", lw=1.0)
    axes[1].arrow(0.5, 0.5, 0.0, 0.16, head_width=0.035, head_length=0.045, color="0.45", lw=1.0)
    axes[1].text(0.07, 1.22, "T5: harm needs h", fontsize=9.2)
    axes[1].text(0.64, 0.56, "hidden-harm direction:\nlarge h1", fontsize=7.5, color="#7d3d24")
    axes[1].text(0.53, 0.71, "small h2", fontsize=7.7, color="0.35")
    axes[1].text(0.25, 0.28, "same private score cost;\ndifferent hidden harm", fontsize=7.8, color="0.24")

    for ax in axes:
        ax.set_aspect("equal", adjustable="box")
        ax.set_xlabel("action a1")
        ax.set_ylabel("action a2")
        draw_range_frame(ax, (0.0, 1.28), (0.0, 1.28))
    save(fig, "part-ii-t4-t5-cost-ellipse.pdf")


def population_gaming_band() -> None:
    rng = np.random.default_rng(SEED + 2)
    value = 0.7
    threshold = 1.0
    k_values = np.array([0.25, 0.7, 1.45, 2.8])
    deltas = np.sqrt(2 * k_values * value)

    q_normal = rng.normal(loc=0.0, scale=1.0, size=N)
    d_normal = threshold - q_normal
    h_pop_normal = []
    for delta in deltas:
        mask_normal = (d_normal > 0.0) & (d_normal <= delta)
        h_pop_normal.append(np.mean(np.where(mask_normal, d_normal, 0.0)))
    h_pop_normal = np.array(h_pop_normal)

    assert np.all(np.diff(h_pop_normal) > 0.0)
    q_grid = np.linspace(-2.7, 2.3, 500)
    cdf = 0.5 * (1 + np.vectorize(math.erf)(q_grid / np.sqrt(2)))
    delta = deltas[2]

    fig, axes = plt.subplots(1, 2, figsize=(7.2, 2.9))
    axes[0].plot(q_grid, cdf, color="0.12", lw=1.25)
    axes[0].fill_between(
        q_grid,
        0,
        cdf,
        where=(q_grid >= threshold - delta) & (q_grid < threshold),
        color="#9b4d2e",
        alpha=0.32,
    )
    axes[0].axvline(threshold, color="0.28", lw=0.8, ls=(0, (3, 2)))
    axes[0].axvline(threshold - delta, color="0.45", lw=0.7, ls=(0, (3, 2)))
    axes[0].text(threshold + 0.06, 0.18, "threshold t", fontsize=7.6, rotation=90, color="0.28")
    axes[0].text(threshold - delta + 0.05, 0.52, "gaming band", fontsize=8.2, color="#7d3d24")
    axes[0].text(-2.48, 0.90, "0 < t - Q <= sqrt(2 κ V)", fontsize=8.2)
    axes[0].set_xlabel("quality Q")
    axes[0].set_ylabel("F_Q(Q)")
    draw_range_frame(axes[0], (-2.6, 2.2), (0.0, 1.02))

    x = np.arange(len(k_values))
    axes[1].bar(x, h_pop_normal, 0.46, color="0.22", linewidth=0)
    axes[1].set_xticks(x, [f"{k:.2g}" for k in k_values])
    axes[1].set_xlabel("aggregate gaming capacity κ")
    axes[1].set_ylabel("H_pop: population harm")
    axes[1].text(
        -0.35,
        max(h_pop_normal) * 1.12,
        "larger κ widens the entry band, so H_pop grows;\nH_per stays the deficit d for every gamer in the band",
        fontsize=7.7,
        color="0.22",
    )
    draw_range_frame(axes[1], (-0.55, len(k_values) - 0.45), (0.0, max(h_pop_normal) * 1.32))

    save(fig, "part-ii-population-gaming-band.pdf")


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
        "Generated by `scripts/make_appendix_figures.py`. Each retained figure is promoted because it clarifies a proposition, contract field, or distinction better than prose alone.",
        "",
    ]
    for name, rationale in FIGURE_RATIONALES.items():
        lines.extend([f"## {name}", "", rationale, ""])
    (FIG_DIR / "RATIONALES.md").write_text("\n".join(lines), encoding="utf-8")


def main() -> None:
    setup()
    dimension_observation_gap()
    drift_envelope()
    cost_ellipse()
    population_gaming_band()
    write_rationales()


if __name__ == "__main__":
    main()
