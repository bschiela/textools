.PHONY: all clean watch

BASENAME = main

all: $(BASENAME).pdf

$(BASENAME).pdf: $(BASENAME).tex
	latexmk -pdf -silent -file-line-error -synctex=0 $(BASENAME)

clean:
	latexmk -c -bibtex-cond1
	rm -f *.loc *.soc *.tdo *.thm

watch:
	latexmk -silent -pvc $(BASENAME) > /dev/null &
