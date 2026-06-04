# Jinan University Undergraduate Thesis LaTeX Template

<div align="center">

[中文](README.md) | **English**

[![XeLaTeX](https://img.shields.io/badge/compiler-XeLaTeX-126f9a)](#local-build)
[![GB/T 7714](https://img.shields.io/badge/bibliography-GB%2FT%207714--2015-444)](#bibliography)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue)](LICENSE)

</div>

This repository provides a LaTeX template for Jinan University undergraduate theses based on the 2026 official Word templates. It includes the official Word template files, the LaTeX class, an example main file, and a compiled PDF example for quick inspection.

The template is calibrated against the official Word files. Because operating systems, fonts, and renderers can affect the final appearance, please compile with the required font setup and compare your final output against the official Word templates and the provided PDF example before submission.

## Deliverables

```text
official/
├── 暨南大学本科毕业论文模板20260413.dot   Official body Word template
└── 本科毕业论文封面.docx                  Official cover Word template

examples/
└── jnuthesis-example.pdf                  Compiled LaTeX PDF example

jnuthesis.cls                              LaTeX document class
jnuthesis.tex                              Example main file
refs.bib                                   Example bibliography database
figs/                                      Official cover logo/name images
fonts/README.md                            Font setup guide
latexmkrc                                  latexmk configuration
```

## Quick Start

```bash
git clone https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template.git
cd JNU-Thesis-LaTeX-Template
latexmk -xelatex jnuthesis.tex
```

The generated PDF is `jnuthesis.pdf`. A compiled example is available at [examples/jnuthesis-example.pdf](examples/jnuthesis-example.pdf).

## Metadata

Edit the metadata near the top of `jnuthesis.tex`:

```latex
\biaoti{Chinese thesis title}
\entitle{English thesis title}
\xueyuan{College}
\xuexi{Department}
\zhuanye{Major}
\xingming{Name}
\xuehao{Student ID}
\daoshi{Advisor}
% \thesisdate{2026}{6}{4}
```

The official cover leaves the date blank by default. Uncomment `\thesisdate` if you want the date to appear on the cover.

## Build Options

### TeXPage

1. Open [TeXPage](https://www.texpage.com).
2. Create a project and upload this repository as a ZIP.
3. Set the compiler to `XeLaTeX`.
4. For closer Word-like fonts, upload the Windows font files into `fonts/` and use:

```latex
\documentclass[numbering=arabic,fontset=bundled]{jnuthesis}
```

### Local Build

Install MacTeX, TeX Live, or MiKTeX, then run:

```bash
latexmk -xelatex jnuthesis.tex
```

Manual build:

```bash
xelatex jnuthesis
biber jnuthesis
xelatex jnuthesis
xelatex jnuthesis
```

### Overleaf

Upload the full project and set Compiler to `XeLaTeX`. For closer official Word font rendering, upload `simsun.ttc`, `simhei.ttf`, `simkai.ttf`, and `simfang.ttf` into `fonts/`, then use `fontset=bundled`.

## Font Sets

| Option | Best for | Notes |
| --- | --- | --- |
| `fontset=windows` | Windows local builds | Uses system SimSun/SimHei |
| `fontset=bundled` | TeXPage, Overleaf, any OS | Loads Zhongyi fonts from `fonts/`; recommended for final drafts |
| `fontset=mac` | macOS local drafts | Uses Songti SC/Heiti SC |
| `fontset=auto` | Drafting | Chooses available fonts and prioritizes successful builds |
| `fontset=fandol` | TeX Live fallback | Zero setup, but visually different from SimSun/SimHei |

For strict formatting checks, use `fontset=windows` or `fontset=bundled`. See [fonts/README.md](fonts/README.md) for font file placement.

## Common Structure

```latex
\makecover
\makestatement

\begin{zhabstract}
Chinese abstract text.
\zhaiyao{Keyword 1; Keyword 2; Keyword 3}
\end{zhabstract}

\begin{enabstract}
English abstract text.
\enkeywords{Keyword1; Keyword2; Keyword3}
\end{enabstract}

\tableofcontents
\printbibliography[title={参考文献}]
```

## Bibliography

The template uses `biblatex` with `biblatex-gb7714-2015`:

```latex
\addbibresource{refs.bib}
```

Citations:

```latex
\supercite{ref-example-1}
\upcite{ref-example-2}
```

## PDF and Word Export

PDF is the recommended final layout output:

```bash
latexmk -xelatex jnuthesis.tex
```

Word export can be approximated with Pandoc:

```bash
pandoc jnuthesis.tex -o thesis.docx \
  --pdf-engine=xelatex \
  --bibliography=refs.bib \
  --citeproc
```

Pandoc cannot fully preserve complex LaTeX macros, cover layout, or bibliography formatting. If your department requires Word submission, use the PDF as the layout reference and manually review the generated `.docx`.

## Troubleshooting

| Problem | Fix |
| --- | --- |
| Chinese text missing | Use `XeLaTeX`, not `pdfLaTeX` |
| Font does not match Word | Use `fontset=windows` or `fontset=bundled` |
| Bibliography missing | Run `biber jnuthesis`, or use `latexmk -xelatex` |
| TeXPage cannot find fonts | Upload fonts into `fonts/` and use `fontset=bundled` |
| Word export drifts | Pandoc is approximate; review the result manually |

## Credits

- Jinan University's 2026 official Word thesis templates
- Jianrui Lyu's original `jnuthesis`
- The legacy SolarAscent/JNUThesisTemplate repository
