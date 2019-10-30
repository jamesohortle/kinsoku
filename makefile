COMPILE = xelatex
BIB = bibtex
DEL = rm
DELOPT = -rf
VIEW = open

MAIN = main.tex
AUX = main.aux
PDF = main.pdf

make:
	make build

see:
	make build && make view

build:
	make compile && make reference && make compile && make compile

compile: $(MAIN)
	$(COMPILE) $(MAIN)

reference: $(MAIN)
	-$(BIB) $(AUX)

clean:
	$(DEL) $(DELOPT) *.aux
	$(DEL) $(DELOPT) *.bbl
	$(DEL) $(DELOPT) *.blg
	$(DEL) $(DELOPT) *.fdb_latexmk
	$(DEL) $(DELOPT) *.fls
	$(DEL) $(DELOPT) *.log
	$(DEL) $(DELOPT) *.out

view: $(PDF)
	$(VIEW) $(PDF)