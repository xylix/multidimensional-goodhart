.PHONY: all figures pdf paper abstract clean

all: figures pdf paper abstract

figures:
	uv run --with matplotlib --with numpy scripts/make_appendix_figures.py

pdf:
	typst compile multidimensional-goodhart.typ

paper:
	typst compile multidimensional-goodhart-paper.typ

abstract:
	typst compile multidimensional-goodhart-abstract.typ

clean:
	rm -f multidimensional-goodhart.pdf multidimensional-goodhart-paper.pdf multidimensional-goodhart-abstract.pdf
