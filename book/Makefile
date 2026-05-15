.PHONY: all figures pdf abstract clean

all: figures pdf abstract

figures:
	uv run --with matplotlib --with numpy scripts/make_appendix_figures.py

pdf:
	typst compile multidimensional-goodhart.typ

abstract:
	typst compile multidimensional-goodhart-abstract.typ

clean:
	rm -f multidimensional-goodhart.pdf multidimensional-goodhart-abstract.pdf
