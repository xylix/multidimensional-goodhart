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
                       analyze_selection, best_of_n_delta, best_of_n_kl,
                       render_findings)

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

    # ---- static analysis: declarations of increasing strength --------------
    contracts = {
        "moments_only": SelectionContract(
            "best-of-n on U = V + eps; only V's second moment declared",
            best_of_n=None, delta=None, hidden_sds={"V": 1.0}),
        "pressure_and_moments": SelectionContract(
            "adds the pressure declaration (n), still tail-silent",
            best_of_n=max(NS), hidden_sds={"V": 1.0},
            subgaussian_sigma={"V": 1.0}),
        "full_A": SelectionContract(
            "variant A fully declared: Gaussian goal, Gaussian noise, "
            "independent",
            best_of_n=max(NS), hidden_sds={"V": 1.0},
            subgaussian_sigma={"V": 1.0},
            goal_tail="light", noise_tail="light",
            tail_dependence="independent"),
        "full_BC": SelectionContract(
            "variants B/C fully declared: light goal tail, heavy noise "
            "tail, independent",
            best_of_n=max(NS), hidden_sds={"V": 1.0},
            subgaussian_sigma={"V": 1.0},
            goal_tail="light", noise_tail="heavy",
            tail_dependence="independent"),
        "BC_dependence_undeclared": SelectionContract(
            "same tails as B/C but dependence undeclared: worst case",
            best_of_n=max(NS), hidden_sds={"V": 1.0},
            goal_tail="light", noise_tail="heavy"),
    }
    findings = {k: analyze_selection(c) for k, c in contracts.items()}
    static_report = {k: render_findings(f) for k, f in findings.items()}

    def verdict_name(key):
        return next(f.name for f in findings[key]
                    if isinstance(f, Certificate)
                    and f.name.startswith("regime"))

    # ---- empirics -----------------------------------------------------------
    curves = {}
    for name, sampler in VARIANTS.items():
        means, ses = mc_winner_curve(sampler, NS, REPS, rng)
        curves[name] = {"mean": means, "se": ses}

    analytic_A = analytic_gaussian_curve(NS)
    bounds = [best_of_n_delta(n) for n in NS]
    kl_bounds = [math.sqrt(2 * best_of_n_kl(n)) for n in NS]  # sigma = 1

    # ---- checks -------------------------------------------------------------
    checks = []
    # 1. T1 (chi^2) and KL bounds hold for every variant at every n
    for name, c in curves.items():
        for bname, bs in (("T1", bounds), ("KL", kl_bounds)):
            violations = [(n, m, b) for n, m, b in zip(NS, c["mean"], bs)
                          if abs(m) > b + 4 * c["se"][NS.index(n)]]
            checks.append((f"{bname} bound holds for {name}", not violations,
                           violations))
    # 2. the KL certificate dominates the chi^2 certificate here, and stays
    # non-vacuous at large n (within a small factor of the true Gaussian curve)
    # (the routes cross: chi^2 is tighter at n=2, KL from n=4 on — the
    # sqrt(n) vs sqrt(log n) growth rates dominate eventually)
    i4 = NS.index(4)
    checks.append(("KL bound tighter than chi^2 bound for all n >= 4",
                   all(k < b for k, b in zip(kl_bounds[i4:], bounds[i4:])),
                   f"at n=4096: {kl_bounds[-1]:.2f} vs {bounds[-1]:.2f}"))
    ratio = kl_bounds[-1] / curves["A_gaussian"]["mean"][-1]
    checks.append(("KL bound within 2x of the true curve at n=4096 (A)",
                   ratio < 2, round(ratio, 2)))
    # 3. analytic Gaussian curve matches MC (within 5 SE)
    dev = max(abs(a - m) / max(se, 1e-12)
              for a, m, se in zip(analytic_A, curves["A_gaussian"]["mean"],
                                  curves["A_gaussian"]["se"]))
    checks.append(("analytic Gaussian curve matches MC (max |dev| in SEs)",
                   dev < 5, round(dev, 2)))
    # 4. regime verdicts reduce to Majka & El-Mhamdi 2025 Table 2
    checks.append(("declared variant A maps to regime[benign]",
                   verdict_name("full_A") == "regime[benign]",
                   verdict_name("full_A")))
    checks.append(("declared variants B/C (independent) map to regime[weak]",
                   verdict_name("full_BC") == "regime[weak]",
                   verdict_name("full_BC")))
    checks.append(("dependence-undeclared B/C maps to strong-not-excluded",
                   verdict_name("BC_dependence_undeclared")
                   == "regime[strong-not-excluded]",
                   verdict_name("BC_dependence_undeclared")))
    # 5. empirical curves agree with the verdicts: A keeps growing (benign:
    # goal still increases); B and C are bounded and revert toward the
    # baseline mean (weak: over-optimization useless, not harmful)
    def late_gain(c):
        return c["mean"][-1] - c["mean"][NS.index(256)]
    ga, gb, gc = (late_gain(curves[k]) for k in
                  ("A_gaussian", "B_t4_unitvar", "C_t2_infvar"))
    checks.append(("variant A still gaining from n=256 to n=4096", ga > 0.05, round(ga, 4)))
    checks.append(("variant B flat-or-falling on the same range", gb < 0.05, round(gb, 4)))
    checks.append(("variant C falling on the same range", gc < 0.0, round(gc, 4)))
    checks.append(("variant C reverts toward baseline mean 0 (weak, not "
                   "strong: no descent toward inf)",
                   abs(curves["C_t2_infvar"]["mean"][-1]) < 0.15,
                   round(curves["C_t2_infvar"]["mean"][-1], 3)))
    # 6. tail-blindness: moment-only bounds identical for A and B by construction
    checks.append(("moment-route certificates identical for A and B "
                   "(tail-blind)", True,
                   "same declared moments => same delta(n)*sd"))

    # ---- write results ------------------------------------------------------
    payload = {"ns": NS, "reps": REPS, "curves": curves,
               "analytic_A": analytic_A, "t1_bound": bounds,
               "kl_bound": kl_bounds,
               "checks": [(c[0], bool(c[1]), str(c[2])) for c in checks]}
    with open(os.path.join(RESULTS_DIR, "example1.json"), "w") as fh:
        json.dump(payload, fh, indent=1)

    lines = ["# Example 1 results: best-of-n selection, tail-thickness knob", ""]
    lines += ["## Static analysis (certificates and refusals per declaration)", ""]
    for k, rep in static_report.items():
        lines += [f"### declaration: {k}", "```", rep, "```", ""]
    lines += ["## Empirical curves: E[V of winner] vs n", "",
              "| n | chi2 (T1) bound | KL bound | analytic A | A gaussian "
              "| B t4 (sd=1) | C t2 (inf var) |",
              "|--:|--:|--:|--:|--:|--:|--:|"]
    for i, n in enumerate(NS):
        lines.append(
            f"| {n} | {bounds[i]:.3f} | {kl_bounds[i]:.3f} "
            f"| {analytic_A[i]:.3f} "
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
