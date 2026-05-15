.PHONY: all figures pdf abstract clean

SOURCE_DATE_EPOCH := 1778803200

all: figures pdf abstract

figures:
	uv run --with matplotlib --with numpy scripts/make_appendix_figures.py

pdf:
	typst compile --creation-timestamp $(SOURCE_DATE_EPOCH) multidimensional-goodhart.typ

abstract:
	typst compile --creation-timestamp $(SOURCE_DATE_EPOCH) multidimensional-goodhart-abstract.typ

clean:
	rm -f multidimensional-goodhart.pdf multidimensional-goodhart-abstract.pdf
