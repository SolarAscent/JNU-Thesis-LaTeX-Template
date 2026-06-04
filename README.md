# 暨南大学本科毕业论文 LaTeX 模板

<div align="center">

**中文** | [English](README.en.md)

[![XeLaTeX](https://img.shields.io/badge/compiler-XeLaTeX-126f9a)](#本地编译)
[![GB/T 7714](https://img.shields.io/badge/bibliography-GB%2FT%207714--2015-444)](#参考文献)
[![Example PDF](https://img.shields.io/badge/example-PDF-0f766e)](examples/jnuthesis-example.pdf)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue)](LICENSE)

基于暨南大学 2026 版官方 Word 模板整理，面向本科毕业论文写作的 LaTeX 模板。

</div>

---

## 先看这里

这个仓库想解决一件事：让你不用从零调封面、目录、页眉页脚、中文字体和参考文献格式，直接把精力放回论文内容本身。

模板随仓库提供官方 Word 原件和一份 LaTeX 编译范例。你可以先打开 [PDF 范例](examples/jnuthesis-example.pdf) 看整体效果，再决定是在 TeXPage、Overleaf 还是本地编译。

| 我想做什么 | 去哪里 |
| --- | --- |
| 直接看排版效果 | [examples/jnuthesis-example.pdf](examples/jnuthesis-example.pdf) |
| 查看学校官方 Word 模板 | [official/](official/) |
| 开始写自己的论文 | 编辑 [jnuthesis.tex](jnuthesis.tex) |
| 配置宋体、黑体等字体 | [fonts/README.md](fonts/README.md) |

## 仓库里有什么

```text
official/
├── 暨南大学本科毕业论文模板20260413.dot
└── 本科毕业论文封面.docx

examples/
└── jnuthesis-example.pdf

jnuthesis.cls       模板核心：页面、封面、标题、目录、题注、参考文献
jnuthesis.tex       示例主文件：从这里填写信息和写正文
refs.bib            示例参考文献库
figs/               封面使用的校徽和校名字图
fonts/README.md     字体配置说明
latexmkrc           latexmk 编译配置
```

## 三步开始

### 1. 克隆项目

```bash
git clone https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template.git
cd JNU-Thesis-LaTeX-Template
```

### 2. 填写个人信息

打开 `jnuthesis.tex`，修改开头的元数据：

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

封面日期默认留空，和官方封面占位效果一致。需要显示日期时，再取消 `\thesisdate` 的注释。

示例文件默认使用 `\makeblankcover`，打开 PDF 时会先看到官方空白封面表单。正式写论文时，把 [jnuthesis.tex](jnuthesis.tex) 里的 `\makeblankcover` 改成 `\makecover`，上方填写的学院、学系、专业、姓名、学号和导师就会出现在封面横线上。

### 3. 编译 PDF

```bash
latexmk -xelatex jnuthesis.tex
```

编译完成后会得到 `jnuthesis.pdf`。

## 选择编译环境

### TeXPage

1. 在 TeXPage 新建项目，并上传本仓库 ZIP。
2. 编译器选择 `XeLaTeX`。
3. 如需更接近官方 Word 字体，把 Windows 字体文件放入 `fonts/`，并在主文件中使用：

```latex
\documentclass[numbering=arabic,fontset=bundled]{jnuthesis}
```

### Overleaf

上传整个项目，Menu 中将 Compiler 改为 `XeLaTeX`。如果要使用 `fontset=bundled`，请同时上传 `simsun.ttc`、`simhei.ttf`、`simkai.ttf`、`simfang.ttf` 到 `fonts/`。

### 本地编译

推荐安装 MacTeX、TeX Live 或 MiKTeX，然后运行：

```bash
latexmk -xelatex jnuthesis.tex
```

手动编译顺序如下：

```bash
xelatex jnuthesis
biber jnuthesis
xelatex jnuthesis
xelatex jnuthesis
```

## 字体怎么选

中文论文模板的观感，很大一部分取决于字体。为了稳定编译和接近官方 Word 效果，模板提供了几组字体方案：

| 选项 | 适合 | 说明 |
| --- | --- | --- |
| `fontset=windows` | Windows 本地最终稿 | 使用系统 SimSun/SimHei |
| `fontset=bundled` | TeXPage、Overleaf、跨平台最终稿 | 从 `fonts/` 加载中易字体，推荐用于最终检查 |
| `fontset=mac` | macOS 本地草稿 | 使用 Songti SC/Heiti SC |
| `fontset=auto` | 默认草稿 | 自动选择可用字体，优先保证能编译 |
| `fontset=fandol` | 零配置草稿 | TeX Live 自带字体，外观会和宋体/黑体有差异 |

如果学院对字体检查严格，建议使用 `fontset=windows` 或 `fontset=bundled`。字体文件放置方式见 [fonts/README.md](fonts/README.md)。

## 写作结构

主文件已经包含毕业论文常见结构。你只需要替换示例内容：

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

\chapter{绪论}
...

\printbibliography[title={参考文献}]
```

## 参考文献

模板使用 `biblatex` 和 `biblatex-gb7714-2015`。把文献写入 `refs.bib`，然后在正文中引用：

```latex
\supercite{ref-example-1}
\upcite{ref-example-2}
```

使用 `latexmk -xelatex` 时会自动处理多轮编译和 `biber`。

## 导出 Word

PDF 是这个模板的主要输出。如果你需要 Word 文件，可以用 Pandoc 做近似转换：

```bash
pandoc jnuthesis.tex -o thesis.docx \
  --pdf-engine=xelatex \
  --bibliography=refs.bib \
  --citeproc
```

需要注意的是，Pandoc 不能完整保留复杂 LaTeX 宏、封面布局和参考文献排版。若学院要求提交 Word，请把 PDF 作为排版参照，对生成的 `.docx` 逐页复核。

## 常见问题

| 问题 | 建议 |
| --- | --- |
| 中文不显示 | 确认使用 `XeLaTeX`，不要使用 `pdfLaTeX` |
| 字体和 Word 不像 | 使用 `fontset=windows` 或 `fontset=bundled` |
| 参考文献不出现 | 使用 `latexmk -xelatex`，或手动运行 `biber jnuthesis` |
| TeXPage 找不到字体 | 上传字体文件到 `fonts/`，并使用 `fontset=bundled` |
| Word 导出格式漂移 | Pandoc 只能近似转换，需要人工复核 |

## 致谢

感谢暨南大学 2026 版官方 Word 毕业论文模板，以及旧版 `jnuthesis`、[Latiyas/JNUThesis](https://github.com/Latiyas/JNUThesis) 和 [SolarAscent/JNUThesisTemplate](https://github.com/SolarAscent/JNUThesisTemplate) 的早期工作。本项目参考了这些模板在中文字体、目录、题注、列表和编译配置上的经验，同时以新版官方 Word 模板作为格式校准基准。
