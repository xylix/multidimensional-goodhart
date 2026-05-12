.PHONY: all figures pdf clean

all: figures pdf

figures:
	uv run --with matplotlib --with numpy scripts/make_appendix_figures.py

pdf:
	typst compile multidimensional-goodhart.typ

clean:
	rm -f multidimensional-goodhart.pdf
