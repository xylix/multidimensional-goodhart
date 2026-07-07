"""Example 1b: the KL-route certificate and its tightness witness.

Baseline V ~ N(0,1); exponential tilting by e^{tV} gives mu_theta = N(t, 1),
with KL(mu_theta || mu_0) = t^2/2 and drift E_theta[V] - E_0[V] = t. Since V
is 1-subgaussian, the transportation-lemma certificate reads

    |drift| <= sigma * sqrt(2 KL) = 1 * sqrt(2 * t^2/2) = t,

i.e. the bound holds WITH EQUALITY: exponential tilting is the attainment
witness for the KL route (the same role the two-point tilt plays for T1).

The chi^2 route on the same shift: chi^2(N(t,1) || N(0,1)) = e^{t^2} - 1, so
the T1 bound is sqrt(e^{t^2} - 1) — correct but exponentially vacuous in t,
while the KL bound stays exactly tight. This is the cleanest side-by-side of
"declaration strength trades against conclusion strength": subgaussianity
buys the tight route; finite variance alone leaves only the vacuous one.

Run: uv run --with numpy python example1b_kl.py
"""

from __future__ import annotations

import json
import math
import os

import numpy as np

from contracts import (Certificate, Refusal, SelectionContract,
                       analyze_selection, render_findings)

RESULTS_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "results")

TILTS = [0.25, 0.5, 1.0, 1.5, 2.0, 3.0]
REPS = 400_000


def main():
    rng = np.random.default_rng(20260709)
    os.makedirs(RESULTS_DIR, exist_ok=True)

    rows, checks = [], []
    sample_findings = None
    for t in TILTS:
        kl = t * t / 2
        contract = SelectionContract(
            f"exponential tilt e^(tV), t={t}: KL budget declared, V "
            "declared 1-subgaussian",
            kl_budget=kl, hidden_sds={"V": 1.0}, subgaussian_sigma={"V": 1.0})
        findings = analyze_selection(contract)
        if sample_findings is None:
            sample_findings = findings
        kl_cert = next(f for f in findings
                       if isinstance(f, Certificate)
                       and f.name.startswith("KL-drift"))
        # ground truth: mu_theta = N(t, 1)
        drift_mc = float(rng.standard_normal(REPS).mean() + t)
        se = 1.0 / math.sqrt(REPS)
        chi2_bound = math.sqrt(math.expm1(t * t))   # T1 with delta=sqrt(e^{t^2}-1)
        rows.append((t, kl, kl_cert.value, drift_mc, chi2_bound))
        checks.append((f"t={t}: KL certificate = true drift (equality witness)",
                       abs(kl_cert.value - t) < 1e-12 and
                       abs(drift_mc - t) < 5 * se,
                       f"cert={kl_cert.value:.4f}, MC drift={drift_mc:.4f}"))
        checks.append((f"t={t}: chi^2 route valid but looser (>= KL route)",
                       chi2_bound >= kl_cert.value,
                       f"chi2 bound={chi2_bound:.3f}"))

    # vacuousness comparison at the largest tilt
    t_last, _, klb, _, chb = rows[-1]
    checks.append((f"chi^2 bound exponentially vacuous at t={t_last} "
                   "(ratio > 20x) while KL stays tight",
                   chb / klb > 20, f"ratio={chb / klb:.0f}x"))

    # refusal path: same KL budget, finite variance only
    bare = analyze_selection(SelectionContract(
        "same tilt, subgaussianity undeclared", kl_budget=TILTS[-1] ** 2 / 2,
        hidden_sds={"V": 1.0}))
    checks.append(("sd-only declaration refuses the KL route",
                   any(isinstance(f, Refusal) and "KL-route" in f.question
                       for f in bare), "refusal emitted"))

    lines = ["# Example 1b results: KL-route certificate, tightness witness",
             "",
             "Exponential tilt of N(0,1) by e^{tV}: mu_theta = N(t,1), "
             "KL = t^2/2, true drift = t.", "",
             "| t | KL | KL cert (sigma*sqrt(2KL)) | MC drift | chi^2 (T1) bound |",
             "|--:|--:|--:|--:|--:|"]
    for t, kl, klb, mc, chb in rows:
        lines.append(f"| {t} | {kl:.3f} | {klb:.4f} | {mc:.4f} | {chb:.3f} |")
    lines += ["", "## Sample analyzer output (t=0.25)", "```",
              render_findings(sample_findings), "```", "",
              "Refusal path (KL budget, finite variance only):", "```",
              render_findings(bare), "```", "", "## Checks", ""]
    for name, ok, detail in checks:
        lines.append(f"- [{'x' if ok else ' '}] {name} — {detail}")

    with open(os.path.join(RESULTS_DIR, "example1b.json"), "w") as fh:
        json.dump({"rows": rows,
                   "checks": [(c[0], bool(c[1]), str(c[2])) for c in checks]},
                  fh, indent=1)
    with open(os.path.join(RESULTS_DIR, "example1b.md"), "w") as fh:
        fh.write("\n".join(lines) + "\n")

    print("\n".join(lines))
    failed = [c for c in checks if not c[1]]
    if failed:
        raise SystemExit(f"CHECK FAILURES: {failed}")


if __name__ == "__main__":
    main()
