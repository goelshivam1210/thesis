Makefile

# LaTeX Thesis Build System
# Usage:
#   make          - Compile thesis
#   make clean    - Remove auxiliary files
#   make watch    - Auto-compile on changes
#   make bib      - Process bibliography only

.PHONY: all clean watch bib

# Main target
all: main.pdf

# Compile PDF
main.pdf: main.tex bibliography.bib $(wildcard chapters/**/*.tex) $(wildcard frontmatter/*.tex) $(wildcard macros/*.tex)
	pdflatex -interaction=nonstopmode main.tex
	bibtex main
	pdflatex -interaction=nonstopmode main.tex
	pdflatex -interaction=nonstopmode main.tex

# Process bibliography only
bib:
	bibtex main

# Auto-compile with latexmk
watch:
	latexmk -pvc -pdf main.tex

# Clean auxiliary files
clean:
	latexmk -c
	rm -f *.bbl *.blg *.aux *.log *.out *.toc *.lof *.lot *.fdb_latexmk *.fls

# Clean everything including PDF
cleanall: clean
	rm -f main.pdf