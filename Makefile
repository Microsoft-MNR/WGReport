PAPER_MAIN_SRC=rwg.tex
PAPER_AUX_SRCS=./texfiles/rwg_testing.tex
PAPER_SRCS=$(PAPER_MAIN_SRC) $(PAPER_AUX_SRCS)
PAPER_PDF=rwg.pdf
PAPER_BIB=bibs/paper.bib
PAPER_BBL=$(PAPER_MAIN_SRC:.tex=)

LATEX=pdflatex
BIB=bibtex

all:	$(PAPER_PDF)

$(PAPER_PDF):  $(PAPER_SRCS) $(PAPER_BIB)
	$(LATEX) $(PAPER_MAIN_SRC)
	$(BIB) $(PAPER_BBL) $(XTX_FLAGS)
	$(LATEX) $(PAPER_MAIN_SRC)
	$(BIB) $(PAPER_BBL) $(XTX_FLAGS)
	$(LATEX) $(PAPER_MAIN_SRC)
	$(LATEX) $(PAPER_MAIN_SRC)

spell:
	detex $(PAPER_SRCS) | spell | sort | uniq

macspell:
	detex $(PAPER_SRCS) | aspell -a | sort -u

clean:
	rm -f *~ 
	rm -f *.aux
	rm -f *.log
	rm -f *.bbl

clobber: clean
	rm -f $(PAPER_PDF)
