.PHONY: all figures pdf paper clean

all: figures pdf paper

figures:
	uv run --with matplotlib --with numpy scripts/make_appendix_figures.py

pdf:
	typst compile multidimensional-goodhart.typ

paper:
	typst compile multidimensional-goodhart-paper.typ

clean:
	rm -f multidimensional-goodhart.pdf multidimensional-goodhart-paper.pdf
