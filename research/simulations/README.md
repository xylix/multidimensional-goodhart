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
make iteration36
make identification
```

The Makefile uses `uv run --with ...` so the repo does not need a committed
virtual environment or dependency lock for these small checks. Plot artifacts
from Iteration 21 are written under `research/simulations/outputs/`. Iteration
27, Iteration 36, and the identification toy are text-only and should not
create plot artifacts. The identification toy belongs to the empirics track
(`plans/exchange-rate-empirics.md`, step 1) with companion note
`research/threads/exchange_rate_identification.md`; it is an exploratory toy,
not theorem support.
