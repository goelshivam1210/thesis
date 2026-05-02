# LaTeX Thesis Build System
# Usage:
#   make          - Compile thesis (latexmk handles incremental builds)
#   make watch    - Auto-compile on file changes (continuous preview)
#   make clean    - Remove auxiliary files
#   make bib      - Process bibliography only

.PHONY: all clean watch bib cleanall

LATEXMK = latexmk -pdf -interaction=nonstopmode -outdir=build -bibtex

# Main target — latexmk only re-runs pdflatex/bibtex when sources change
all:
	$(LATEXMK) main.tex

# Auto-compile on save (continuous preview mode)
watch:
	$(LATEXMK) -pvc main.tex

# Process bibliography only
bib:
	bibtex build/main

# Clean auxiliary files
clean:
	latexmk -c -outdir=build
	rm -f *.bbl *.blg *.aux *.log *.out *.toc *.lof *.lot *.fdb_latexmk *.fls

# Clean everything including PDF
cleanall: clean
	rm -f build/main.pdf main.pdf
