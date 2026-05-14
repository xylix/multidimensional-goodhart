.PHONY: run iteration20 iteration21 iteration27 iteration36

run: iteration20 iteration21 iteration27 iteration36

iteration20:
	uv run --with numpy --with scipy python iteration20_selection_intervention.py

iteration21:
	uv run --with numpy --with scipy --with matplotlib python iteration21_population_active_sets.py

iteration27:
	uv run --with numpy python iteration27_adaptive_hardening.py

iteration36:
	uv run --with numpy python iteration36_response_dynamics.py
