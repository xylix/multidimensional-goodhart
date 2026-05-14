.PHONY: run iteration20 iteration21 iteration27

run: iteration20 iteration21 iteration27

iteration20:
	uv run --with numpy --with scipy python iteration20_selection_intervention.py

iteration21:
	uv run --with numpy --with scipy --with matplotlib python iteration21_population_active_sets.py

iteration27:
	uv run --with numpy python iteration27_adaptive_hardening.py
