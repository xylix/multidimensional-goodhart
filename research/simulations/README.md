# Research simulations

This directory holds lightweight executable checks for the research notes.
They are toy-model verifications, not empirical evidence.

Run all simulations with:

```sh
make run
```

Run individual passes with:

```sh
make iteration20
make iteration21
```

The Makefile uses `uv run --with ...` so the repo does not need a committed
virtual environment or dependency lock for these small checks. Plot artifacts
are written under `research/simulations/outputs/`.
