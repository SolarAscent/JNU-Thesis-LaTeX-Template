# JNU Thesis LaTeX Template

<div align="center">

暨南大学本科毕业论文 LaTeX 模板

[中文](#中文) · [English](#english)

[![XeLaTeX](https://img.shields.io/badge/compiler-XeLaTeX-126f9a)](#本地编译)
[![GB/T 7714](https://img.shields.io/badge/bibliography-GB%2FT%207714--2015-444)](#参考文献)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue)](LICENSE)

</div>

---

## 中文

这是基于暨南大学 2026 版官方 Word 毕业论文模板重做的本科毕业论文 LaTeX 模板。模板把官方封面 `.docx` 与正文 `.dot` 的要求合并到 `jnuthesis.cls`，重点修正封面、前置页、字体、页边距、行距、目录、参考文献和附录结构。

### 快速开始

```bash
git clone https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template.git
cd JNU-Thesis-LaTeX-Template
latexmk -xelatex jnuthesis.tex
```

生成文件在 `jnuthesis.pdf`。如果你在 macOS、Windows 或 TeXPage 上使用，建议先阅读下面的字体说明。

### 文件结构

```text
jnuthesis.cls       文档类：封面、页面、标题、目录、参考文献格式
jnuthesis.tex       示例主文件：填写个人信息并写正文
refs.bib           BibLaTeX 参考文献数据库
figs/              官方封面校徽与校名字图
fonts/README.md    宋体/黑体等字体配置说明
latexmkrc          本地 latexmk 配置
.github/workflows  GitHub Actions 编译检查
```

### 填写信息

在 `jnuthesis.tex` 顶部修改：

```latex
\biaoti{你的中文论文题目}
\entitle{Your English Thesis Title}
\xueyuan{学院名称}
\xuexi{学系名称}
\zhuanye{专业名称}
\xingming{姓名}
\xuehao{学号}
\daoshi{指导教师}
% \thesisdate{2026}{6}{4}
```

官方封面日期默认留空；如果需要自动填入日期，取消 `\thesisdate` 前面的注释。

### 编译方式

#### TeXPage

1. 打开 [TeXPage](https://www.texpage.com)。
2. 新建项目并上传本仓库 ZIP。
3. 编译器选择 `XeLaTeX`。
4. 若要获得最接近 Word 的字体效果，把 Windows 字体文件放入 `fonts/`，并将主文件改为：

```latex
\documentclass[numbering=arabic,fontset=bundled]{jnuthesis}
```

#### 本地编译

推荐安装完整 TeX Live 或 MacTeX：

```bash
latexmk -xelatex jnuthesis.tex
```

手动编译：

```bash
xelatex jnuthesis
biber jnuthesis
xelatex jnuthesis
xelatex jnuthesis
```

#### Overleaf

上传整个项目，菜单中把 Compiler 改为 `XeLaTeX`。如需官方字体效果，请上传 `simsun.ttc`、`simhei.ttf`、`simkai.ttf`、`simfang.ttf` 到 `fonts/` 并使用 `fontset=bundled`。

### 字体选择

| 选项 | 适用场景 | 说明 |
| --- | --- | --- |
| `fontset=windows` | Windows 本地 | 使用系统自带 SimSun/SimHei，最接近官方 Word |
| `fontset=bundled` | TeXPage/Overleaf/任意系统 | 从 `fonts/` 加载中易字体，推荐最终稿 |
| `fontset=mac` | macOS 本地 | 使用 Songti SC/Heiti SC，接近但不完全相同 |
| `fontset=auto` | 默认草稿 | 自动选择可用字体，优先保证能编译 |
| `fontset=fandol` | 纯 TeX Live 草稿 | 零配置，但外观和宋体/黑体有差异 |

最终提交前，如果学校严格检查字体，建议使用 `fontset=windows` 或 `fontset=bundled`。字体文件放置方法见 [fonts/README.md](fonts/README.md)。

### 常用命令

```latex
\makecover
\makestatement

\begin{zhabstract}
中文摘要正文。
\zhaiyao{关键词1；关键词2；关键词3}
\end{zhabstract}

\begin{enabstract}
English abstract.
\enkeywords{Keyword1; Keyword2; Keyword3}
\end{enabstract}

\tableofcontents
\printbibliography[title={参考文献}]
```

### 参考文献

模板使用 `biblatex` 与 `biblatex-gb7714-2015`：

```latex
\addbibresource{refs.bib}
```

正文引用：

```latex
\supercite{ref-example-1}
\upcite{ref-example-2}
```

### 导出 PDF 和 Word

PDF 是推荐的最终提交格式：

```bash
latexmk -xelatex jnuthesis.tex
```

导出 Word 可以使用 Pandoc，但复杂 LaTeX 宏、封面和参考文献格式不一定能 100% 保留：

```bash
pandoc jnuthesis.tex -o thesis.docx \
  --pdf-engine=xelatex \
  --bibliography=refs.bib \
  --citeproc
```

如果学院要求提交 Word，建议把 LaTeX 生成的 PDF 作为最终排版依据，再对 Pandoc 生成的 Word 逐页复核。

### 常见问题

| 问题 | 处理 |
| --- | --- |
| 中文不显示 | 确认使用 `XeLaTeX`，不要用 `pdfLaTeX` |
| 字体和 Word 不像 | 使用 `fontset=windows` 或 `fontset=bundled` |
| 参考文献不出现 | 运行 `biber jnuthesis`，或直接用 `latexmk -xelatex` |
| TeXPage 找不到字体 | 上传字体文件到 `fonts/` 并使用 `fontset=bundled` |
| Word 导出格式漂移 | Pandoc 无法完全复刻 LaTeX 排版，最终以 PDF 为准 |

### 致谢

本项目继承并重写了旧版暨南大学论文 LaTeX 模板的思路，感谢早期模板作者与维护者：

- Jianrui Lyu 的旧版 `jnuthesis`
- SolarAscent/JNUThesisTemplate 旧仓库
- 暨南大学 2026 版官方 Word 模板

---

## English

This repository provides a LaTeX template for Jinan University undergraduate theses, rebuilt from the 2026 official Word templates. It merges the official cover `.docx` and body `.dot` requirements into `jnuthesis.cls`, with corrected cover layout, front matter, fonts, page margins, line spacing, table of contents, bibliography, and appendix handling.

### Quick Start

```bash
git clone https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template.git
cd JNU-Thesis-LaTeX-Template
latexmk -xelatex jnuthesis.tex
```

The output is `jnuthesis.pdf`.

### Project Layout

```text
jnuthesis.cls       Document class
jnuthesis.tex       Example main file
refs.bib           BibLaTeX bibliography database
figs/              Official cover logo/name images
fonts/README.md    Font setup guide
latexmkrc          latexmk configuration
.github/workflows  GitHub Actions build check
```

### Metadata

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

The official cover leaves the date blank by default. Uncomment `\thesisdate` if you want numbers on the cover.

### Build Options

#### TeXPage

1. Open [TeXPage](https://www.texpage.com).
2. Create a project and upload this repository as a ZIP.
3. Set the compiler to `XeLaTeX`.
4. For Word-like fonts, upload the Windows font files into `fonts/` and use:

```latex
\documentclass[numbering=arabic,fontset=bundled]{jnuthesis}
```

#### Local Build

Install TeX Live or MacTeX, then run:

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

#### Overleaf

Upload the full project and set Compiler to `XeLaTeX`. For the closest official font match, upload `simsun.ttc`, `simhei.ttf`, `simkai.ttf`, and `simfang.ttf` into `fonts/`, then use `fontset=bundled`.

### Font Sets

| Option | Best for | Notes |
| --- | --- | --- |
| `fontset=windows` | Windows local builds | Uses system SimSun/SimHei |
| `fontset=bundled` | TeXPage/Overleaf/any OS | Loads Zhongyi fonts from `fonts/`; recommended for final drafts |
| `fontset=mac` | macOS local builds | Uses Songti SC/Heiti SC; close but not identical |
| `fontset=auto` | Drafting | Chooses available fonts and prioritizes successful builds |
| `fontset=fandol` | TeX Live fallback | Zero setup, but visually different |

For strict formatting checks, use `fontset=windows` or `fontset=bundled`.

### PDF and Word Export

PDF is the recommended final output:

```bash
latexmk -xelatex jnuthesis.tex
```

Word export is possible with Pandoc, but complex LaTeX layout may not survive perfectly:

```bash
pandoc jnuthesis.tex -o thesis.docx \
  --pdf-engine=xelatex \
  --bibliography=refs.bib \
  --citeproc
```

If your department requires Word, use the PDF as the formatting reference and manually review the generated `.docx`.

### Troubleshooting

| Problem | Fix |
| --- | --- |
| Chinese text missing | Use `XeLaTeX`, not `pdfLaTeX` |
| Font does not match Word | Use `fontset=windows` or `fontset=bundled` |
| Bibliography missing | Run `biber`, or use `latexmk -xelatex` |
| TeXPage cannot find fonts | Upload fonts into `fonts/` and use `fontset=bundled` |
| Word export drifts | Pandoc cannot fully preserve all LaTeX layout; verify manually |

### Credits

- Jianrui Lyu's original `jnuthesis`
- The legacy SolarAscent/JNUThesisTemplate repository
- Jinan University's 2026 official Word thesis templates
