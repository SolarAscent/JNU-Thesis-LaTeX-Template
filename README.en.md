# Jinan University Undergraduate Thesis LaTeX Template

<div align="center">

[中文](README.md) | **English**

[![XeLaTeX](https://img.shields.io/badge/compiler-XeLaTeX-126f9a)](#local-build)
[![GB/T 7714](https://img.shields.io/badge/bibliography-GB%2FT%207714--2015-444)](#bibliography)
[![Example PDF](https://img.shields.io/badge/example-PDF-0f766e)](examples/jnuthesis-example.pdf)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue)](LICENSE)

A LaTeX template for Jinan University undergraduate theses, based on the 2026 official Word templates.

</div>

---

## Start Here

This repository is designed to take care of the fussy parts of thesis formatting: cover layout, table of contents, headers and footers, Chinese fonts, captions, and GB/T 7714 references.

The official Word files and a compiled LaTeX PDF example are included. Open the [PDF example](examples/jnuthesis-example.pdf) first if you want a quick sense of the current output.

| I want to | Open |
| --- | --- |
| Preview the compiled result | [examples/jnuthesis-example.pdf](examples/jnuthesis-example.pdf) |
| Check the official Word templates | [official/](official/) |
| Start writing my thesis | [jnuthesis.tex](jnuthesis.tex) |
| Configure Chinese fonts | [fonts/README.md](fonts/README.md) |

## Repository Contents

```text
official/
├── 暨南大学本科毕业论文模板20260413.dot
└── 本科毕业论文封面.docx

examples/
└── jnuthesis-example.pdf

jnuthesis.cls       Template class: pages, cover, headings, TOC, captions, bibliography
jnuthesis.tex       Example main file
refs.bib            Example bibliography database
figs/               Cover logo and university name images
fonts/README.md     Font setup guide
latexmkrc           latexmk configuration
```

## Three-Step Start

### 1. Clone

```bash
git clone https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template.git
cd JNU-Thesis-LaTeX-Template
```

### 2. Fill in metadata

Edit the metadata at the top of `jnuthesis.tex`:

```latex
\biaoti{Chinese thesis title}
\entitle{English Thesis Title}
\xueyuan{College}
\xuexi{Department}
\zhuanye{Major}
\xingming{Name}
\xuehao{Student ID}
\daoshi{Advisor}
% \thesisdate{2026}{6}{4}
```

The cover date is blank by default, matching the official placeholder style. Uncomment `\thesisdate` if you want the date to appear.

### 3. Build PDF

```bash
latexmk -xelatex jnuthesis.tex
```

The output will be `jnuthesis.pdf`.

## Build Environments

### TeXPage

1. Create a project on TeXPage and upload this repository as a ZIP.
2. Set the compiler to `XeLaTeX`.
3. For closer official Word font rendering, upload the Windows font files into `fonts/` and use:

```latex
\documentclass[numbering=arabic,fontset=bundled]{jnuthesis}
```

### Overleaf

Upload the full project and set Compiler to `XeLaTeX`. If you use `fontset=bundled`, also upload `simsun.ttc`, `simhei.ttf`, `simkai.ttf`, and `simfang.ttf` into `fonts/`.

### Local Build

Install MacTeX, TeX Live, or MiKTeX, then run:

```bash
latexmk -xelatex jnuthesis.tex
```

Manual build order:

```bash
xelatex jnuthesis
biber jnuthesis
xelatex jnuthesis
xelatex jnuthesis
```

## Font Choices

For a Chinese thesis template, the font setup has a large impact on the final appearance. The class provides several font modes:

| Option | Best for | Notes |
| --- | --- | --- |
| `fontset=windows` | Windows final drafts | Uses system SimSun/SimHei |
| `fontset=bundled` | TeXPage, Overleaf, cross-platform final drafts | Loads Zhongyi fonts from `fonts/`; recommended for final checks |
| `fontset=mac` | macOS local drafts | Uses Songti SC/Heiti SC |
| `fontset=auto` | Default drafts | Chooses available fonts and prioritizes successful builds |
| `fontset=fandol` | Zero-config drafts | Uses TeX Live fonts; visually different from SimSun/SimHei |

If your department checks fonts strictly, use `fontset=windows` or `fontset=bundled`. See [fonts/README.md](fonts/README.md) for font file placement.

## Writing Structure

The example main file already contains the usual thesis structure:

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

\chapter{Introduction}
...

\printbibliography[title={参考文献}]
```

## Bibliography

The template uses `biblatex` with `biblatex-gb7714-2015`. Add entries to `refs.bib`, then cite them in the document:

```latex
\supercite{ref-example-1}
\upcite{ref-example-2}
```

`latexmk -xelatex` will handle repeated compilation and `biber`.

## Word Export

PDF is the primary output of this template. If you need a Word file, Pandoc can produce an approximate `.docx`:

```bash
pandoc jnuthesis.tex -o thesis.docx \
  --pdf-engine=xelatex \
  --bibliography=refs.bib \
  --citeproc
```

Pandoc cannot fully preserve complex LaTeX macros, cover layout, or bibliography formatting. If your department requires Word submission, use the PDF as the layout reference and review the generated `.docx` page by page.

## Troubleshooting

| Problem | Suggestion |
| --- | --- |
| Chinese text is missing | Use `XeLaTeX`, not `pdfLaTeX` |
| Fonts do not look like Word | Use `fontset=windows` or `fontset=bundled` |
| Bibliography is missing | Use `latexmk -xelatex`, or run `biber jnuthesis` manually |
| TeXPage cannot find fonts | Upload font files into `fonts/` and use `fontset=bundled` |
| Word export drifts | Pandoc is approximate; review the output manually |

## Credits

Thanks to Jinan University's 2026 official Word thesis templates, the original `jnuthesis`, and the legacy SolarAscent/JNUThesisTemplate project. This repository continues the work by collecting, calibrating, and maintaining a current undergraduate thesis template.
