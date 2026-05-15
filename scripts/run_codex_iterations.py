#!/usr/bin/env python3
"""Run roadmap iterations as separate Codex exec sessions.

The controller intentionally gives each iteration a fresh Codex process, then
uses a small commit-only Codex process as the checkpoint before continuing.
This keeps review gates in `plans/next-steps.md` from being blurred by one
long agent context.
"""

from __future__ import annotations

import argparse
import datetime as dt
import os
import re
import shlex
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Sequence


ROOT = Path(__file__).resolve().parents[1]
ROADMAP = ROOT / "plans" / "next-steps.md"
LOG_DIR = ROOT / ".codex-runs"
ITERATION_RE = re.compile(
    r"^## Iteration (?P<number>\d+): (?P<title>.+)$", re.MULTILINE
)


@dataclass(frozen=True)
class Iteration:
    number: int
    title: str
    body: str


def run(
    args: Sequence[str],
    *,
    cwd: Path = ROOT,
    input_text: str | None = None,
    stdout_path: Path | None = None,
    stderr_path: Path | None = None,
    check: bool = True,
) -> subprocess.CompletedProcess[str]:
    stdout_file = stdout_path.open("w", encoding="utf-8") if stdout_path else None
    stderr_file = stderr_path.open("w", encoding="utf-8") if stderr_path else None
    try:
        result = subprocess.run(
            args,
            cwd=cwd,
            input=input_text,
            text=True,
            stdout=stdout_file if stdout_file else subprocess.PIPE,
            stderr=stderr_file if stderr_file else subprocess.PIPE,
            check=False,
        )
    finally:
        if stdout_file:
            stdout_file.close()
        if stderr_file:
            stderr_file.close()

    if check and result.returncode != 0:
        command = " ".join(args)
        raise RuntimeError(f"command failed ({result.returncode}): {command}")
    return result


def git_output(*args: str) -> str:
    result = run(["git", *args])
    return result.stdout.strip()


def git_status() -> str:
    return git_output("status", "--short")


def require_clean_tree(allow_dirty: bool) -> None:
    status = git_status()
    if status and not allow_dirty:
        raise RuntimeError(
            "working tree is dirty; commit, stash, or rerun with --allow-dirty\n"
            f"{status}"
        )


def parse_iterations(text: str) -> list[Iteration]:
    matches = list(ITERATION_RE.finditer(text))
    iterations: list[Iteration] = []
    for index, match in enumerate(matches):
        start = match.start()
        end = matches[index + 1].start() if index + 1 < len(matches) else len(text)
        iterations.append(
            Iteration(
                number=int(match.group("number")),
                title=match.group("title").strip(),
                body=text[start:end].strip(),
            )
        )
    return iterations


def read_iterations() -> list[Iteration]:
    return parse_iterations(ROADMAP.read_text(encoding="utf-8"))


def select_iteration(start_at: int | None) -> Iteration | None:
    iterations = read_iterations()
    if start_at is None:
        return iterations[0] if iterations else None
    for iteration in iterations:
        if iteration.number == start_at:
            return iteration
    raise RuntimeError(f"Iteration {start_at} not found in {ROADMAP}")


def roadmap_contains(number: int) -> bool:
    return any(iteration.number == number for iteration in read_iterations())


def is_conditional_integration(iteration: Iteration) -> bool:
    text = f"{iteration.title}\n{iteration.body}".lower()
    return (
        "only if licensed" in text
        or "if licensed" in text
        or "scoped book/paper integration" in text
    )


def make_prompt(iteration: Iteration) -> str:
    return f"""Execute exactly Iteration {iteration.number} from plans/next-steps.md.

This is an unattended single-iteration run. Treat this invocation as a fresh
context. Read AGENT.md, plans/next-steps.md, and the files needed for this
iteration, but do not execute later iterations.

Iteration section to execute:

{iteration.body}

Required behavior:
- Follow AGENT.md and the current roadmap constraints.
- Preserve the licensing gates in plans/next-steps.md.
- Do not edit book or paper files unless this exact iteration explicitly
  licenses that work.
- When complete, remove only the completed Iteration {iteration.number} section
  from plans/next-steps.md while preserving later roadmap content.
- Run the iteration-specific checks from plans/next-steps.md when applicable,
  plus `git diff --check` and `git status --short`.
- Do not make a git commit. The outer controller will run a separate
  commit-only pass after this iteration finishes.
- Stop without removing the roadmap section if the success condition is not
  met.

Final response should state the files changed and the checks run. If blocked,
state the blocker and leave the roadmap section in place.
"""


def timestamp() -> str:
    return dt.datetime.now(dt.timezone.utc).strftime("%Y%m%dT%H%M%SZ")


def codex_command(args: argparse.Namespace, last_message: Path) -> list[str]:
    command = [
        args.codex_bin,
        "exec",
        "--cd",
        str(ROOT),
        "--sandbox",
        args.sandbox,
        "--output-last-message",
        str(last_message),
    ]
    if args.json:
        command.append("--json")
    if args.model:
        command.extend(["--model", args.model])
    for extra in args.codex_arg:
        command.extend(shlex.split(extra))
    command.append("-")
    return command


def make_commit_prompt(iteration: Iteration) -> str:
    default_subject = f"Complete iteration {iteration.number}: {iteration.title}"
    return f"""Commit the completed work for Iteration {iteration.number}: {iteration.title}.

This is a commit-only follow-up after a separate Codex run completed the
iteration work. Do not perform substantive research, prose, roadmap, or code
changes now.

Required behavior:
- Inspect `git status --short` and the current diff.
- If there are no uncommitted changes and HEAD already contains an iteration
  commit, report that and stop.
- If the current changes look like completed Iteration {iteration.number} work,
  stage and commit all of them.
- Use a concise commit message whose subject starts from this iteration name,
  for example: `{default_subject}`. Add a short body only if it helps summarize
  the specific work.
- Run `git diff --check` before committing.
- After committing, report the commit hash and `git status --short`.
- If the diff is unrelated to Iteration {iteration.number}, the roadmap section
  was not removed, or checks fail, do not commit; report the blocker.
"""


def run_commit_step(
    iteration: Iteration,
    args: argparse.Namespace,
    run_dir: Path,
) -> None:
    status = git_status()
    if not status:
        return

    prompt = make_commit_prompt(iteration)
    (run_dir / "commit-prompt.md").write_text(prompt, encoding="utf-8")
    command = codex_command(args, run_dir / "commit-last-message.md")

    print(f"    committing Iteration {iteration.number} changes")
    result = run(
        command,
        input_text=prompt,
        stdout_path=run_dir / "commit-stdout.log",
        stderr_path=run_dir / "commit-stderr.log",
        check=False,
    )
    if result.returncode != 0:
        raise RuntimeError(
            f"Commit pass failed for Iteration {iteration.number} with exit "
            f"{result.returncode}; see {run_dir.relative_to(ROOT)}"
        )


def verify_iteration(
    iteration: Iteration,
    before_head: str,
    *,
    allow_dirty_after: bool,
) -> str:
    after_head = git_output("rev-parse", "HEAD")
    if before_head == after_head:
        raise RuntimeError(f"Iteration {iteration.number} did not create a commit")
    if roadmap_contains(iteration.number):
        raise RuntimeError(
            f"Iteration {iteration.number} still appears in {ROADMAP}; "
            "the roadmap was not advanced"
        )
    run(["git", "diff", "--check"])
    status = git_status()
    if status and not allow_dirty_after:
        raise RuntimeError(
            f"working tree is dirty after Iteration {iteration.number}\n{status}"
        )
    return after_head


def run_one_iteration(iteration: Iteration, args: argparse.Namespace) -> str:
    run_id = f"iteration-{iteration.number}-{timestamp()}"
    run_dir = LOG_DIR / run_id
    run_dir.mkdir(parents=True, exist_ok=False)

    prompt = make_prompt(iteration)
    (run_dir / "prompt.md").write_text(prompt, encoding="utf-8")

    before_head = git_output("rev-parse", "HEAD")
    command = codex_command(args, run_dir / "last-message.md")

    print(f"==> Iteration {iteration.number}: {iteration.title}")
    print(f"    logs: {run_dir.relative_to(ROOT)}")
    result = run(
        command,
        input_text=prompt,
        stdout_path=run_dir / "stdout.log",
        stderr_path=run_dir / "stderr.log",
        check=False,
    )
    if result.returncode != 0:
        raise RuntimeError(
            f"Codex failed for Iteration {iteration.number} with exit "
            f"{result.returncode}; see {run_dir.relative_to(ROOT)}"
        )

    run_commit_step(iteration, args, run_dir)
    commit = verify_iteration(
        iteration,
        before_head,
        allow_dirty_after=args.allow_dirty_after,
    )
    print(f"    committed: {commit[:12]}")
    return commit


def main(argv: Sequence[str]) -> int:
    parser = argparse.ArgumentParser(
        description="Run active next-step iterations as separate Codex sessions."
    )
    parser.add_argument(
        "-n",
        "--max-iterations",
        type=int,
        default=1,
        help="maximum iterations to run in this invocation (default: 1)",
    )
    parser.add_argument(
        "--start-at",
        type=int,
        help="start at a specific iteration number instead of the first active one",
    )
    parser.add_argument(
        "--stop-before-conditional-integration",
        action="store_true",
        help="stop before conditional book/paper integration iterations",
    )
    parser.add_argument(
        "--allow-dirty",
        action="store_true",
        help="allow starting with a dirty working tree",
    )
    parser.add_argument(
        "--allow-dirty-after",
        action="store_true",
        help="allow uncommitted changes after an iteration commit",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="print the iterations that would run without invoking Codex",
    )
    parser.add_argument(
        "--codex-bin",
        default=os.environ.get("CODEX_BIN", "npx @openai/codex"),
        help="Codex executable to run (default: codex or CODEX_BIN)",
    )
    parser.add_argument(
        "--sandbox",
        default="workspace-write",
        choices=("read-only", "workspace-write", "danger-full-access"),
        help="sandbox mode passed to codex exec",
    )
    parser.add_argument("--model", help="optional model passed to codex exec")
    parser.add_argument(
        "--json",
        action="store_true",
        help="ask codex exec to emit JSONL events into the run log",
    )
    parser.add_argument(
        "--codex-arg",
        action="append",
        default=[],
        help="extra argument string appended to codex exec; repeatable",
    )
    args = parser.parse_args(argv)

    if args.max_iterations < 1:
        parser.error("--max-iterations must be at least 1")

    try:
        require_clean_tree(args.allow_dirty or args.dry_run)

        if args.dry_run:
            iterations = read_iterations()
            if args.start_at is not None:
                start_index = next(
                    (
                        index
                        for index, iteration in enumerate(iterations)
                        if iteration.number == args.start_at
                    ),
                    None,
                )
                if start_index is None:
                    raise RuntimeError(
                        f"Iteration {args.start_at} not found in {ROADMAP}"
                    )
                iterations = iterations[start_index:]
            for iteration in iterations[: args.max_iterations]:
                if (
                    args.stop_before_conditional_integration
                    and is_conditional_integration(iteration)
                ):
                    print(
                        "Would stop before conditional integration iteration "
                        f"{iteration.number}: {iteration.title}"
                    )
                    break
                print(f"Would run Iteration {iteration.number}: {iteration.title}")
            return 0

        completed: list[tuple[int, str]] = []
        start_at = args.start_at
        for _ in range(args.max_iterations):
            iteration = select_iteration(start_at)
            start_at = None
            if iteration is None:
                print("No active iterations remain.")
                break
            if (
                args.stop_before_conditional_integration
                and is_conditional_integration(iteration)
            ):
                print(
                    "Stopping before conditional integration iteration "
                    f"{iteration.number}: {iteration.title}"
                )
                break
            commit = run_one_iteration(iteration, args)
            completed.append((iteration.number, commit))

        if completed:
            print("\nCompleted iterations:")
            for number, commit in completed:
                print(f"- Iteration {number}: {commit[:12]}")
        return 0
    except Exception as exc:  # noqa: BLE001 - CLI should print a concise error.
        print(f"error: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
