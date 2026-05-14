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
make iteration27
```

The Makefile uses `uv run --with ...` so the repo does not need a committed
virtual environment or dependency lock for these small checks. Plot artifacts
from Iteration 21 are written under `research/simulations/outputs/`. Iteration
27 is text-only and should not create plot artifacts.
