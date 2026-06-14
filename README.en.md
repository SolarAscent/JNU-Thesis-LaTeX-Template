# Jinan University Undergraduate Thesis — LaTeX Template

<div align="center">

[中文](README.md) | **English**

[![Compile](https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template/actions/workflows/compile.yml/badge.svg)](https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template/actions/workflows/compile.yml)
[![XeLaTeX](https://img.shields.io/badge/compiler-XeLaTeX-126f9a)](#build-environments)
[![GB/T 7714](https://img.shields.io/badge/bibliography-GB%2FT%207714--2015-444)](#references)
[![Example PDF](https://img.shields.io/badge/example-PDF-0f766e)](examples/jnuthesis-example.pdf)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue)](LICENSE)

**A page-for-page LaTeX reproduction of the official Word template** — cover, integrity statement, Chinese/English abstracts, table of contents, body, tables, figures, equations, references, appendix and acknowledgements all match the official originals.

</div>

---

> [!IMPORTANT]
> **Verify before you submit.** This is an unofficial, community-maintained LaTeX port, calibrated page-for-page against the **2026‑04‑13** official Word files (`暨南大学本科毕业论文模板20260413.dot` and `本科毕业论文封面.docx`). However:
> 1. Your school/college may **update** the official template or impose extra rules at any time;
> 2. Chinese fonts **render slightly differently** across operating systems (see [Fonts](#fonts));
> 3. Some departments have **their own rules** for headers, page numbers, references, etc.
>
> Before final submission, compare the compiled PDF page-by-page against **the latest official template your department issues**, and confirm it conforms. The authors are not responsible for any consequences of formatting mismatches.

---

## What this template does for you

Cover pages, the table of contents, headers/footers, Chinese fonts and reference formatting are the most time-consuming "typesetting chores" of a thesis. This repo gets them all right so you can focus on the content:

- ✅ **Matches the official Word file page-for-page** — the cover seal/calligraphy images, the KaiTi `诚信声明`, the 18pt abstract titles, dotted TOC leaders, `图/表 X‑Y` captions and `（式 X‑Y）` equation tags all reproduce the originals.
- ✅ **Faithful fonts** — Song body, bold-Song headings, Hei cover title, KaiTi integrity statement, Times New Roman for Latin.
- ✅ **Faithful line spacing** — body text sits on the official 32.5pt document grid (Word's "1.5 lines + snap to grid").
- ✅ **GB/T 7714‑2015** references via `biblatex` + `biber`.
- ✅ **One-command build**, with GitHub Actions CI.

Open the [example PDF](examples/jnuthesis-example.pdf) to see the result.

## Quick start

```bash
git clone https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template.git
cd JNU-Thesis-LaTeX-Template
```

Edit the metadata in [`jnuthesis.tex`](jnuthesis.tex):

```latex
\biaoti{你的中文论文题目}        % also used for the abstract title and running header
\entitle{Your English Thesis Title}
\xueyuan{XX学院}\xuexi{XX学系}\zhuanye{XX专业}
\xingming{姓名}\xuehao{学号}\daoshi{指导教师}
\thesisdate{2026}{6}{14}
```

Switch the cover command from the placeholder `\makeblankcover` to `\makecover`, then build:

```bash
latexmk -xelatex jnuthesis.tex
```

You get `jnuthesis.pdf` (15 pages: cover + 14 body pages).

## Build environments

> Use **XeLaTeX** (required for Chinese), never pdfLaTeX.

| Environment | How |
| --- | --- |
| **Local** | Install MacTeX / TeX Live / MiKTeX, run `latexmk -xelatex jnuthesis.tex` |
| **Overleaf** | Upload the project, set Compiler to `XeLaTeX`; prefer `\documentclass[fontset=fandol]{jnuthesis}` |
| **TeXPage** | Upload the ZIP, choose `XeLaTeX` |
| **GitHub Actions** | Builds with XeLaTeX and uploads the PDF on every push (see [Actions](../../actions)) |

## Fonts

The look of a Chinese thesis is mostly down to the fonts. The template adapts via the `fontset` option, **defaulting to `fontset=auto`**:

| Option | Platform | Fonts |
| --- | --- | --- |
| `auto` (default) | any | Auto-detect: macOS → system Song/Hei/Kai, Windows → SimSun/SimHei/KaiTi, Linux → Noto/Fandol |
| `mac` | macOS | Songti SC / Heiti SC / Kaiti SC / STFangsong |
| `windows` | Windows | SimSun / SimHei / KaiTi_GB2312 / FangSong (identical to the official Word) |
| `bundled` | Overleaf / cross-platform final | loads fonts from `fonts/` (supply the files yourself) |
| `fandol` | zero-config / CI | TeX Live built-in; looks slightly different from SimSun |

> **Why system fonts on macOS?** Word itself substitutes SimSun/SimHei/KaiTi with Songti/Heiti/Kaiti when it opens the official file on a Mac — so compiling with those fonts looks **exactly like what you see in Word**. Switch to `fontset=windows` for the "standard" Windows glyphs in a final build.

## Repository layout

```text
jnuthesis.cls          The class: page geometry, fonts, cover, headings, TOC, captions, bibliography
jnuthesis.tex          Example main file — fill in metadata and write here
refs.bib               Example GB/T 7714‑2015 bibliography
figs/                  Cover seal and calligraphy images (from the official cover .docx)
fonts/                 Drop bundled fonts here (see fonts/README.md)
examples/              Example compiled PDF
official/              Official Word originals (.dot body + .docx cover)
latexmkrc              latexmk configuration
.github/workflows/     GitHub Actions auto-build
```

## Writing guide

```latex
\makecover                       % cover (\makeblankcover for a blank preview)
\makestatement                   % integrity statement

\begin{zhabstract}
Chinese abstract...
\zhkeywords{关键词1；关键词2；关键词3}
\end{zhabstract}

\begin{enabstract}
English abstract...
\enkeywords{Keyword1; Keyword2; Keyword3}
\end{enabstract}

\tableofcontents
\jnumainmatter                   % body starts here with arabic page numbers

\chapter{绪论}
\section{文献综述}
...

\jnucenterchapter{参考文献}       % or the automatic bibliography below
\jnuleftchapter{附录}
\jnucenterchapter{致谢}
```

- **Headings**: `\chapter` (level 1, 15pt bold Song), `\section`/`\subsection` (14pt bold Song), numbered `1`, `1.1`, `1.1.1`.
- **Figures/tables**: `\caption{}` auto-numbers `图 X‑Y` / `表 X‑Y` (10.5pt Song, centered).
- **Equations**: the `equation` environment auto-tags `（式 X‑Y）`, right-aligned.
- **Special chapters**: `参考文献` & `致谢` centered titles, `附录` left-aligned (matching the official template).

## References

Uses `biblatex` + `biblatex-gb7714-2015` (GB/T 7714‑2015 numeric scheme). Put entries in [`refs.bib`](refs.bib) and cite with `\supercite{key}` / `\upcite{key}`. When writing for real, remove the placeholder guidance text and uncomment `\printbibliography[heading=jnubib]`. `latexmk -xelatex` runs `biber` automatically.

## FAQ

| Problem | Fix |
| --- | --- |
| Chinese missing / "missing character" | Use `XeLaTeX`, not pdfLaTeX |
| Fonts don't match Word | macOS: keep `auto`; Windows final: `fontset=windows` |
| References don't appear | Use `latexmk -xelatex`, or run `biber jnuthesis` then compile twice |
| Missing fonts on Overleaf | Use `fontset=fandol`, or upload fonts to `fonts/` and use `fontset=bundled` |
| Cover fields blank | Change `\makeblankcover` to `\makecover` and fill the metadata |

## Acknowledgements

Thanks to Jinan University's official Word thesis template, and to prior work — [Latiyas/JNUThesis](https://github.com/Latiyas/JNUThesis) and the legacy `jnuthesis` — for experience with Chinese fonts, TOC, captions, lists and build configuration. This project is a fresh implementation calibrated against the latest official Word template.

## License

Released under [GPL‑3.0](LICENSE). The Jinan University seal, name and related marks are property of Jinan University and are intended solely for JNU students writing their theses.
