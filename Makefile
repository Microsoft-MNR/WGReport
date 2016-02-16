PAPER_SRC=rwg.tex
PAPER_PDF=rwg.pdf
PAPER_BIB=bibs/paper.bib
PAPER_BBL=$(PAPER_SRC:.tex=)

LATEX=pdflatex
BIB=bibtex

all:	$(PAPER_PDF)

$(PAPER_PDF): $(PAPER_SRC) $(PAPER_BIB)
	$(BIB) $(PAPER_BBL) $(XTX_FLAGS)
	$(LATEX) $(PAPER_SRC)
	$(BIB) $(PAPER_BBL) $(XTX_FLAGS)
	$(LATEX) $(PAPER_SRC)
	$(LATEX) $(PAPER_SRC)

spell:
	detex $(PAPER_SRC) | spell | sort | uniq

macspell:
	detex $(PAPER_SRC) | aspell -a | sort -u

clean:
	rm -f *~ 
	rm -f *.aux
	rm -f *.log
	rm -f *.bbl

clobber: clean
	rm -f $(PAPER_PDF)
