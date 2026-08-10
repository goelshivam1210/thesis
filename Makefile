# LaTeX Thesis Build System
# Usage:
#   make          - Compile thesis (latexmk handles incremental builds)
#   make watch    - Auto-compile on file changes (continuous preview)
#   make clean    - Remove auxiliary files
#   make bib      - Process bibliography only

.PHONY: all prepare clean watch bib cleanall
.DEFAULT_GOAL := all

MAIN = main
OUTDIR = build
LATEXMK = latexmk -pdf -interaction=nonstopmode -bibtex -outdir=$(OUTDIR)
SOURCE_DIRS = $(shell find chapters frontmatter figures macros tables -type d)
OUTPUT_DIRS = $(addprefix $(OUTDIR)/,$(SOURCE_DIRS))

# LaTeX does not create the nested output directories needed by \include.
prepare:
	mkdir -p $(OUTDIR) $(OUTPUT_DIRS)

# Main target — latexmk only re-runs pdflatex/bibtex when sources change
all: prepare
	$(LATEXMK) $(MAIN).tex
	cp $(OUTDIR)/$(MAIN).pdf $(MAIN).pdf

# Auto-compile on save (continuous preview mode)
watch: prepare
	$(LATEXMK) -pvc $(MAIN).tex

# Process bibliography only
bib:
	bibtex $(OUTDIR)/$(MAIN)

# Clean auxiliary files
clean:
	latexmk -c -outdir=$(OUTDIR) $(MAIN).tex
	rm -f *.bbl *.blg *.aux *.log *.out *.toc *.lof *.lot *.fdb_latexmk *.fls

# Clean everything including PDF
cleanall:
	latexmk -C -outdir=$(OUTDIR) $(MAIN).tex
	rm -f *.bbl *.blg *.aux *.log *.out *.toc *.lof *.lot *.fdb_latexmk *.fls $(MAIN).pdf
