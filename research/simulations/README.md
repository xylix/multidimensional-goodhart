# Research simulations

This directory holds lightweight executable checks for the research notes.
They are toy-model verifications, not empirical evidence.

Run Iteration 20 with:

```sh
make run
```

The Makefile uses `uv run --with numpy --with scipy` so the repo does not need
a committed virtual environment or dependency lock for these small checks.
