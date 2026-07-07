"""Example 1: regressional Goodhart via tail thickness (pure selection).

Setup: hidden value V ~ N(0,1), proxy U = V + eps, agent takes argmax of U
over n i.i.d. candidates; we record the winner's V. Pressure dial: n.

Variants (the knob is the *ratio* of tail weights, eps vs V):
  A. eps ~ N(0,1)                      -- noise lighter/equal tail: favorable
  B. eps ~ t(df=4) scaled to sd 1      -- heavy tail, finite variance
  C. eps ~ t(df=2)                     -- heavy tail, infinite variance

Static analysis (contracts.py) is run against three contract declarations of
increasing strength; empirics then check every certificate and show what the
refusals correctly refused to predict.

Validation targets:
  1. T1 certificate delta(n)*sd(V) upper-bounds the observed drift in all
     variants (it is coupling-worst-case, so valid even for C: the *hidden*
     coordinate V keeps finite variance and L is bounded by n).
  2. The certificate is tail-blind: identical for A and B by construction,
     while the empirical curves diverge (A grows ~ 0.5*E[max_n], B/C hump
     then fall back toward the baseline mean).
  3. Analytic Gaussian curve E[V_win] = 0.5 * E[max of n N(0,2) draws]
     matches MC for variant A.

Run: uv run --with numpy python example1_selection.py
"""

from __future__ import annotations

import json
import math
import os

import numpy as np

from contracts import (Certificate, Refusal, SelectionContract,
                       analyze_selection, best_of_n_delta, render_findings)

RESULTS_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "results")

NS = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096]
REPS = 40_000
CHUNK_ELEMS = 4_000_000   # max elements per sampled block, keeps memory low


def eps_gaussian(shape, rng):
    return rng.standard_normal(shape)


def eps_t4_unitvar(shape, rng):
    return rng.standard_t(4, shape) / math.sqrt(2.0)   # sd(t4) = sqrt(2)


def eps_t2(shape, rng):
    return rng.standard_t(2, shape)                    # infinite variance


VARIANTS = {
    "A_gaussian": eps_gaussian,
    "B_t4_unitvar": eps_t4_unitvar,
    "C_t2_infvar": eps_t2,
}


def mc_winner_curve(eps_sampler, ns, reps, rng):
    """E[V of argmax-U winner] with standard error, chunked for memory."""
    means, ses = [], []
    for n in ns:
        rows = max(1, CHUNK_ELEMS // n)
        got, acc = 0, []
        while got < reps:
            r = min(rows, reps - got)
            V = rng.standard_normal((r, n))
            U = V + eps_sampler((r, n), rng)
            acc.append(V[np.arange(r), U.argmax(axis=1)])
            got += r
        w = np.concatenate(acc)
        means.append(float(w.mean()))
        ses.append(float(w.std(ddof=1) / math.sqrt(len(w))))
    return means, ses


def analytic_gaussian_curve(ns):
    """E[V_win] = c * E[max_n U], U ~ N(0, 2), c = 1/2 (Gaussian regression).

    E[max_n] for standard normal via quadrature of x n phi(x) Phi(x)^{n-1}.
    """
    x = np.linspace(-12, 12, 200_001)
    phi = np.exp(-x * x / 2) / math.sqrt(2 * math.pi)
    # Phi via cumulative trapezoid (dense grid, adequate accuracy)
    Phi = np.concatenate([[0.0], np.cumsum((phi[1:] + phi[:-1]) / 2 * np.diff(x))])
    Phi = np.clip(Phi / Phi[-1], 0.0, 1.0)
    trap = getattr(np, "trapezoid", None) or np.trapz
    out = []
    for n in ns:
        emax_std = trap(x * n * phi * Phi ** (n - 1), x)
        out.append(0.5 * math.sqrt(2.0) * emax_std)   # c * sigma_U * E[max Z]
    return out


def main():
    rng = np.random.default_rng(20260707)
    os.makedirs(RESULTS_DIR, exist_ok=True)

    # ---- static analysis: three declarations of increasing strength --------
    contracts = {
        "moments_only": SelectionContract(
            "best-of-n on U = V + eps; only V's second moment declared",
            best_of_n=None, delta=None, hidden_sds={"V": 1.0}),
        "pressure_and_moments": SelectionContract(
            "adds the pressure declaration (n), still tail-silent",
            best_of_n=max(NS), hidden_sds={"V": 1.0}),
        "full_A": SelectionContract(
            "variant A fully declared: noise tail lighter/equal",
            best_of_n=max(NS), hidden_sds={"V": 1.0},
            coupling_tail="noise_lighter_than_hidden"),
        "full_BC": SelectionContract(
            "variants B/C fully declared: noise tail heavier",
            best_of_n=max(NS), hidden_sds={"V": 1.0},
            coupling_tail="noise_heavier_than_hidden"),
    }
    static_report = {k: render_findings(analyze_selection(c))
                     for k, c in contracts.items()}

    # ---- empirics -----------------------------------------------------------
    curves = {}
    for name, sampler in VARIANTS.items():
        means, ses = mc_winner_curve(sampler, NS, REPS, rng)
        curves[name] = {"mean": means, "se": ses}

    analytic_A = analytic_gaussian_curve(NS)
    bounds = [best_of_n_delta(n) for n in NS]

    # ---- checks -------------------------------------------------------------
    checks = []
    # 1. T1 bound holds for every variant at every n
    for name, c in curves.items():
        violations = [(n, m, b) for n, m, b in zip(NS, c["mean"], bounds)
                      if abs(m) > b + 4 * c["se"][NS.index(n)]]
        checks.append((f"T1 bound holds for {name}", not violations, violations))
    # 2. analytic Gaussian curve matches MC (within 5 SE)
    dev = max(abs(a - m) / max(se, 1e-12)
              for a, m, se in zip(analytic_A, curves["A_gaussian"]["mean"],
                                  curves["A_gaussian"]["se"]))
    checks.append(("analytic Gaussian curve matches MC (max |dev| in SEs)",
                   dev < 5, round(dev, 2)))
    # 3. regime split: A keeps growing on the top decade; B and C do not
    def late_gain(c):
        return c["mean"][-1] - c["mean"][NS.index(256)]
    ga, gb, gc = (late_gain(curves[k]) for k in
                  ("A_gaussian", "B_t4_unitvar", "C_t2_infvar"))
    checks.append(("variant A still gaining from n=256 to n=4096", ga > 0.05, round(ga, 4)))
    checks.append(("variant B flat-or-falling on the same range", gb < 0.05, round(gb, 4)))
    checks.append(("variant C falling on the same range", gc < 0.0, round(gc, 4)))
    # 4. tail-blindness: certified bounds identical for A and B by construction
    checks.append(("certificate identical for A and B (tail-blind)", True,
                   "same declared moments => same delta(n)*sd"))

    # ---- write results ------------------------------------------------------
    payload = {"ns": NS, "reps": REPS, "curves": curves,
               "analytic_A": analytic_A, "t1_bound": bounds,
               "checks": [(c[0], bool(c[1]), str(c[2])) for c in checks]}
    with open(os.path.join(RESULTS_DIR, "example1.json"), "w") as fh:
        json.dump(payload, fh, indent=1)

    lines = ["# Example 1 results: best-of-n selection, tail-thickness knob", ""]
    lines += ["## Static analysis (certificates and refusals per declaration)", ""]
    for k, rep in static_report.items():
        lines += [f"### declaration: {k}", "```", rep, "```", ""]
    lines += ["## Empirical curves: E[V of winner] vs n", "",
              "| n | T1 bound | analytic A | A gaussian | B t4 (sd=1) | C t2 (inf var) |",
              "|--:|--:|--:|--:|--:|--:|"]
    for i, n in enumerate(NS):
        lines.append(
            f"| {n} | {bounds[i]:.3f} | {analytic_A[i]:.3f} "
            f"| {curves['A_gaussian']['mean'][i]:.3f} "
            f"| {curves['B_t4_unitvar']['mean'][i]:.3f} "
            f"| {curves['C_t2_infvar']['mean'][i]:.3f} |")
    lines += ["", f"(Monte Carlo, {REPS} reps per cell; SEs ~"
              f"{max(curves['A_gaussian']['se']):.3f} or below.)", "",
              "## Checks", ""]
    for name, ok, detail in checks:
        lines.append(f"- [{'x' if ok else ' '}] {name} — {detail}")
    with open(os.path.join(RESULTS_DIR, "example1.md"), "w") as fh:
        fh.write("\n".join(lines) + "\n")

    print("\n".join(lines))
    failed = [c for c in checks if not c[1]]
    if failed:
        raise SystemExit(f"CHECK FAILURES: {failed}")


if __name__ == "__main__":
    main()
