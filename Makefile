# Requires TeXLive 2012

.PRECIOUS: %.aux %.bbl
.PHONY: check dev view-log clean cleangen clean-bak clean-th
.SUFFIXES: .dvi .pdf .tex

TARGET_FILE=document
EDITOR=geany
SHELL=/bin/sh
LATEX=latex
PDFLATEX=pdflatex

%.pdf : %.tex
	$(PDFLATEX) -halt-on-error $<

all:  pdf

view:
	evince $(SRCDIR)$(TARGET_FILE).pdf --page-index 8 &

pdf: #$(SRCDIR)$(TARGET_FILE).pdf
	$(PDFLATEX) $(TARGET_FILE).tex
	$(PDFLATEX) $(TARGET_FILE).tex
	bibtex $(TARGET_FILE)
	makeindex $(TARGET_FILE)
	$(PDFLATEX) $(TARGET_FILE).tex
	$(PDFLATEX) $(TARGET_FILE).tex
	@printf "\nFile generated.\n"

clean:
	rm -vf $(SRCDIR)$(TARGET_FILE).dvi $(SRCDIR)$(TARGET_FILE).log $(SRCDIR)$(TARGET_FILE).aux $(SRCDIR)$(TARGET_FILE).bbl $(SRCDIR)$(TARGET_FILE).blg $(SRCDIR)$(TARGET_FILE).ilg $(SRCDIR)$(TARGET_FILE).toc $(SRCDIR)$(TARGET_FILE).lof $(SRCDIR)$(TARGET_FILE).lot $(SRCDIR)$(TARGET_FILE).idx $(SRCDIR)$(TARGET_FILE).ind $(SRCDIR)$(TARGET_FILE).out $(SRCDIR)$(TARGET_FILE).fff $(SRCDIR)$(TARGET_FILE).ttt $(SRCDIR)texput.log

dev:
	$(EDITOR) ${TEX_SOURCE_BASE}.tex & 

publish:
	
