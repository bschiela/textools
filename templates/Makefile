.PHONY: all clean

all: main.pdf

main.pdf: main.tex
	latexmk -pdf -silent -file-line-error -synctex=0 main

clean:
	latexmk -c -bibtex-cond1
	rm -f *.loc *.soc *.tdo *.thm

