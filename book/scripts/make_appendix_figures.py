#!/usr/bin/env python3
"""Generate visual appendix figures for the Multidimensional Goodhart draft."""

from __future__ import annotations

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


ROOT = Path(__file__).resolve().parents[1]
FIG_DIR = ROOT / "figures"


def setup() -> None:
    FIG_DIR.mkdir(exist_ok=True)
    plt.rcParams.update(
        {
            "font.family": "serif",
            "font.size": 10,
            "axes.spines.top": False,
            "axes.spines.right": False,
            "axes.grid": True,
            "grid.alpha": 0.20,
            "grid.linewidth": 0.6,
            "savefig.bbox": "tight",
            "savefig.pad_inches": 0.05,
            "pdf.fonttype": 42,
            "ps.fonttype": 42,
        }
    )


def save(fig: plt.Figure, name: str) -> None:
    fig.savefig(FIG_DIR / name)
    plt.close(fig)


def appendix_c_selection_thresholds() -> None:
    rng = np.random.default_rng(20260512)
    n = 360
    t = 1.0

    panels = []
    p = rng.normal(size=n)
    h = 0.6 * p + rng.normal(scale=0.72, size=n)
    panels.append(("A. positive linear coupling", p, h))

    p = rng.normal(size=n)
    h = rng.normal(size=n)
    panels.append(("B. independent hidden coordinate", p, h))

    z = rng.normal(size=n)
    p = z
    h = z**2 - 1 + rng.normal(scale=0.22, size=n)
    panels.append(("C. nonlinear dependence; covariance near zero", p, h))

    fig, axes = plt.subplots(3, 1, figsize=(6.0, 7.25), sharex=True, sharey=True)
    for ax, (title, p, h) in zip(axes, panels):
        selected = p >= t
        before = float(np.mean(h))
        after = float(np.mean(h[selected]))
        cov = float(np.cov(p, h, ddof=1)[0, 1])

        ax.scatter(p[~selected], h[~selected], s=16, c="0.78", edgecolors="none")
        ax.scatter(p[selected], h[selected], s=22, c="0.12", edgecolors="none")
        ax.axvline(t, color="0.2", linestyle="--", linewidth=1.1)
        ax.axhline(before, color="0.35", linewidth=1.0)
        ax.axhline(after, color="0.05", linewidth=1.3, linestyle=":")
        ax.annotate(
            "",
            xy=(2.72, after),
            xytext=(2.72, before),
            arrowprops={"arrowstyle": "<->", "color": "0.05", "lw": 1.2},
        )
        ax.text(
            0.02,
            0.95,
            f"mean shift: {after - before:+.2f}    cov(P,H): {cov:+.2f}",
            transform=ax.transAxes,
            ha="left",
            va="top",
            fontsize=9,
            bbox={"boxstyle": "round,pad=0.25", "facecolor": "white", "edgecolor": "0.82"},
        )
        ax.text(1.05, before, "baseline mean", fontsize=8, va="center", color="0.35")
        ax.text(1.05, after, "selected mean", fontsize=8, va="center", color="0.05")
        ax.set_title(title, fontsize=11, loc="left")
        ax.set_xlim(-3.2, 3.2)
        ax.set_ylim(-2.4, 4.0)
        ax.set_ylabel("hidden H")
    axes[-1].set_xlabel("proxy P")
    axes[0].text(0.78, 0.09, "selected region", transform=axes[0].transAxes, fontsize=9)
    fig.tight_layout()
    save(fig, "appendix-c-selection-thresholds.pdf")


def appendix_c_dimensional_scaling() -> None:
    d = np.arange(1, 101)
    fixed_per_dim = np.sqrt(d)
    fixed_budget = np.ones_like(d, dtype=float)
    independent = np.zeros_like(d, dtype=float)

    fig, ax = plt.subplots(figsize=(5.8, 3.8))
    ax.plot(d, fixed_per_dim, color="0.1", linewidth=2.4)
    ax.plot(d, fixed_budget, color="0.35", linestyle="--", linewidth=2.2)
    ax.plot(d, independent, color="0.55", linestyle=":", linewidth=2.6)
    label_box = {"boxstyle": "round,pad=0.25", "facecolor": "white", "edgecolor": "0.85"}
    ax.text(57, 8.15, "new dimensions add\nnew coupling\n||r||2 ∝ sqrt(d)", fontsize=9, bbox=label_box)
    ax.annotate(
        "fixed total coupling budget\n||r||2 = constant",
        xy=(72, 1.0),
        xytext=(36, 2.45),
        arrowprops={"arrowstyle": "->", "color": "0.35", "lw": 0.9},
        fontsize=9,
        bbox=label_box,
    )
    ax.annotate(
        "independent hidden dimensions\n||r||2 = 0",
        xy=(72, 0.0),
        xytext=(20, 0.55),
        arrowprops={"arrowstyle": "->", "color": "0.55", "lw": 0.9},
        fontsize=9,
        bbox=label_box,
    )
    ax.set_xlabel("number of hidden dimensions d")
    ax.set_ylabel("hidden drift norm, normalized")
    ax.set_xlim(1, 100)
    ax.set_ylim(-0.2, 10.5)
    save(fig, "appendix-c-dimensional-scaling.pdf")


def appendix_d_selection_vs_intervention() -> None:
    rng = np.random.default_rng(20260513)
    fig, axes = plt.subplots(1, 2, figsize=(7.4, 3.35), sharex=True, sharey=True)

    p = rng.normal(size=260)
    h = 0.25 * p + rng.normal(scale=0.65, size=260)
    weights = 10 + 38 / (1 + np.exp(-2.5 * (p - 0.65)))
    axes[0].scatter(p, h, s=weights, c="0.35", alpha=0.72, edgecolors="none")
    axes[0].axvline(0.8, color="0.2", linestyle="--", linewidth=1)
    axes[0].set_title("A. selection: reweight existing states")
    axes[0].text(-2.8, 2.35, "same support;\nhigh-P states get more weight", fontsize=9)

    q = rng.normal(size=170)
    p0 = q + rng.normal(scale=0.15, size=170)
    h0 = np.zeros_like(q)
    near = (q > -0.75) & (q < 0.8)
    a = np.clip(0.95 - q, 0, 1.35) * near
    p1 = p0 + a
    h1 = h0 + a
    axes[1].scatter(p0, h0, s=16, c="0.72", edgecolors="none", label="baseline")
    for x0, y0, x1, y1 in zip(p0[near][::3], h0[near][::3], p1[near][::3], h1[near][::3]):
        axes[1].annotate(
            "",
            xy=(x1, y1),
            xytext=(x0, y0),
            arrowprops={"arrowstyle": "->", "color": "0.25", "lw": 0.8, "shrinkA": 0, "shrinkB": 0},
        )
    axes[1].scatter(p1[near], h1[near], s=18, c="0.15", edgecolors="none", label="after response")
    axes[1].axhline(0, color="0.45", linewidth=1)
    axes[1].set_title("B. intervention: transport to new states")

    for ax in axes:
        ax.set_xlabel("proxy P")
        ax.set_xlim(-3.1, 3.1)
        ax.set_ylim(-0.65, 2.65)
    axes[0].set_ylabel("hidden harm H")
    axes[1].legend(frameon=False, loc="upper left", fontsize=9)
    save(fig, "appendix-d-selection-vs-intervention.pdf")


def appendix_e_additive_substitution() -> None:
    t = 1.0
    k1, k2 = 1.0, 2.0
    a1 = np.linspace(0, 1.25, 220)
    a2 = np.linspace(0, 1.25, 220)
    x, y = np.meshgrid(a1, a2)
    cost_two = x**2 / (2 * k1) + y**2 / (2 * k2)
    opt_two = np.array([t * k1 / (k1 + k2), t * k2 / (k1 + k2)])

    fig, ax = plt.subplots(figsize=(5.2, 4.2))
    ax.contour(x, y, cost_two, levels=[0.08, 0.16, 0.25, 0.38, 0.55, 0.75], colors="0.62", linewidths=0.8)
    ax.plot(a1, t - a1, color="0.1", linewidth=2.4)
    ax.scatter([1.0], [0.0], c="0.05", s=65, marker="s")
    ax.scatter([opt_two[0]], [opt_two[1]], c="0.05", s=75, marker="o")
    ax.annotate("score line\na1 + a2 = t", xy=(0.18, 0.82), xytext=(0.1, 1.07), arrowprops={"arrowstyle": "->"})
    ax.annotate("only channel 1\ncost = t^2/(2k1)", xy=(1.0, 0.0), xytext=(0.62, 0.15), arrowprops={"arrowstyle": "->"})
    ax.annotate("with channel 2:\nlower cost bundle", xy=opt_two, xytext=(0.54, 0.87), arrowprops={"arrowstyle": "->"})
    ax.text(0.62, 1.13, "gray curves: equal-cost contours", fontsize=9)
    ax.set_xlim(0, 1.2)
    ax.set_ylim(0, 1.2)
    ax.set_aspect("equal", adjustable="box")
    ax.set_xlabel("effort a1")
    ax.set_ylabel("effort a2")
    save(fig, "appendix-e-additive-substitution.pdf")


def appendix_e_additive_vs_conjunctive() -> None:
    t = 1.0
    a = np.linspace(0, 1.5, 200)
    x, y = np.meshgrid(a, a)
    additive = x + y >= t
    conjunctive = (x >= t) & (y >= t)

    fig, axes = plt.subplots(1, 2, figsize=(7.0, 3.4), sharex=True, sharey=True)
    for ax, region, title in [
        (axes[0], additive, "A. additive: a1 + a2 >= t"),
        (axes[1], conjunctive, "B. conjunctive: a1 >= t and a2 >= t"),
    ]:
        ax.contourf(x, y, region.astype(float), levels=[-0.1, 0.5, 1.1], colors=["white", "0.86"])
        if ax is axes[0]:
            ax.plot(a, t - a, color="0.1", linewidth=2)
            ax.text(0.20, 1.18, "substitution allowed", fontsize=9)
        else:
            ax.axvline(t, color="0.1", linewidth=2)
            ax.axhline(t, color="0.1", linewidth=2)
            ax.text(0.16, 1.18, "must clear both bars", fontsize=9)
        ax.set_title(title)
        ax.set_xlabel("effort a1")
        ax.set_xlim(0, 1.5)
        ax.set_ylim(0, 1.5)
        ax.set_aspect("equal", adjustable="box")
    axes[0].set_ylabel("effort a2")
    save(fig, "appendix-e-additive-vs-conjunctive.pdf")


def appendix_f_exchange_rate_condition() -> None:
    rows = [
        ("measure channel 1 only", "M={1}", "d/2"),
        ("measure channel 2 only", "M={2}", "d"),
        ("measure both channels", "M={1,2}", "3d/5"),
    ]

    fig, ax = plt.subplots(figsize=(6.2, 2.8))
    ax.axis("off")
    ax.text(0.02, 0.92, "k1 = k2 = 1,  h1 = h2 = 1,  w1 = 2,  w2 = 1", fontsize=11, weight="bold")
    x = [0.04, 0.48, 0.72]
    y0 = 0.70
    ax.text(x[0], y0, "measured set", weight="bold", fontsize=10)
    ax.text(x[1], y0, "M", weight="bold", fontsize=10)
    ax.text(x[2], y0, "harm for deficit d", weight="bold", fontsize=10)
    for i, row in enumerate(rows):
        y = y0 - 0.18 * (i + 1)
        ax.text(x[0], y, row[0], fontsize=10)
        ax.text(x[1], y, row[1], fontsize=10)
        ax.text(x[2], y, row[2], fontsize=10)
        ax.plot([0.035, 0.95], [y - 0.055, y - 0.055], color="0.85", lw=0.8)
    ax.text(0.04, 0.08, "Conservation fails because score weight and social harm use different exchange rates.", fontsize=10)
    save(fig, "appendix-f-exchange-rate-condition.pdf")


def appendix_g_recursive_goodhart_cartoon() -> None:
    labels = [
        "programming\ncorrectness",
        "benchmark\ngeneralization",
        "distributional\nrobustness",
        "helpfulness",
        "truthfulness",
        "refusal\ncalibration",
        "transparency /\nfaithful reasoning",
        "non-manipulation",
        "hidden h1:\nlong-horizon effects",
        "hidden h2:\nstrategic pressure",
        "hidden h3:\nrare-context behavior",
        "hidden h4:\nobjective stability",
        "hidden h5:\ninstitutional fit",
    ]
    # Synthetic scores. The first eight axes are explicitly proxied or audited.
    # The hidden axes represent outcome-relevant dimensions not fully captured by
    # the proxy stack; they move unevenly because their correlations with the
    # monitored axes are unspecified.
    values = np.array(
        [
            [0.82, 0.72, 0.55, 0.38, 0.30, 0.24, 0.18, 0.18, 0.44, 0.52, 0.36, 0.48, 0.40],
            [0.90, 0.80, 0.58, 0.72, 0.42, 0.58, 0.20, 0.20, 0.34, 0.56, 0.30, 0.42, 0.46],
            [0.93, 0.84, 0.68, 0.78, 0.72, 0.74, 0.34, 0.30, 0.40, 0.38, 0.34, 0.50, 0.32],
            [0.95, 0.88, 0.74, 0.82, 0.78, 0.80, 0.54, 0.48, 0.36, 0.44, 0.28, 0.46, 0.38],
        ]
    )
    stage_labels = ["capability", "+ preference", "+ truth/safety", "audited stack"]
    theta = np.linspace(0, 2 * np.pi, len(labels), endpoint=False)
    theta = np.r_[theta, theta[0]]

    fig = plt.figure(figsize=(8.4, 7.6))
    ax = fig.add_subplot(111, polar=True)
    for vals, name, ls, color in zip(values, stage_labels, ["-", "--", "-.", ":"], ["0.08", "0.28", "0.48", "0.0"]):
        vals = np.r_[vals, vals[0]]
        ax.plot(theta, vals, color=color, linestyle=ls, linewidth=2.1, label=name)
        ax.fill(theta, vals, color=color, alpha=0.022)

    hidden_start = 8
    ax.set_xticks(theta[:-1])
    ax.set_xticklabels(labels, fontsize=8)
    for idx, tick in enumerate(ax.get_xticklabels()):
        if idx >= hidden_start:
            tick.set_fontstyle("italic")
            tick.set_color("0.2")
    ax.set_ylim(0, 1.0)
    ax.set_yticks([0.25, 0.5, 0.75, 1.0])
    ax.set_yticklabels(["", "0.5", "", "1.0"], fontsize=8)
    ax.grid(True, alpha=0.28)
    ax.legend(loc="lower center", bbox_to_anchor=(0.5, -0.18), ncol=4, frameon=False, fontsize=9)
    ax.set_title("synthetic proxied axes plus unproxied hidden axes", y=1.08, fontsize=11)
    save(fig, "appendix-g-recursive-goodhart-cartoon.pdf")


def main() -> None:
    setup()
    appendix_c_selection_thresholds()
    appendix_c_dimensional_scaling()
    appendix_d_selection_vs_intervention()
    appendix_e_additive_substitution()
    appendix_e_additive_vs_conjunctive()
    appendix_f_exchange_rate_condition()
    appendix_g_recursive_goodhart_cartoon()


if __name__ == "__main__":
    main()
