# Thesis

This repository contains the LaTeX source for the thesis.

## Structure

- `main.tex`: root document
- `bibliography.bib`: bibliography entries
- `chapters/`: chapter content
- `frontmatter/`: abstract, title page, acknowledgments
- `macros/`: macros and notation
- `.vscode/`: project settings for LaTeX Workshop
- `build/`: generated output (ignored by git)

## Build

Use one of these commands:

```bash
make
# or
latexmk -pvc -pdf main.tex
```

## GitHub

- remote: `https://github.com/goelshivam1210/thesis`

## Overleaf sync (optional)

1. In Overleaf, create a new project from GitHub and select this repo.
2. Use Overleaf Git or the GitHub sync integration to keep in sync.

## Ignore

`build/` and LaTeX auxiliary files are ignored via `.gitignore`.
