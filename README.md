# 暨南大学本科毕业论文 LaTeX 模板

<div align="center">

**中文** | [English](README.en.md)

[![XeLaTeX](https://img.shields.io/badge/compiler-XeLaTeX-126f9a)](#本地编译)
[![GB/T 7714](https://img.shields.io/badge/bibliography-GB%2FT%207714--2015-444)](#参考文献)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue)](LICENSE)

</div>

这是基于暨南大学 2026 版官方 Word 毕业论文模板整理的本科毕业论文 LaTeX 模板。仓库同时提供官方 Word 模板、LaTeX 类文件、示例主文件和可直接查看的 PDF 范例，便于同学在 TeXPage、Overleaf 或本地环境中编译使用。

本模板以官方 Word 模板为基准持续校准。由于不同系统、字体和渲染器会影响最终观感，最终提交前请使用学校要求的字体方案重新编译，并对照官方 Word 模板和仓库 PDF 范例复核。

## 交付物

```text
official/
├── 暨南大学本科毕业论文模板20260413.dot   官方正文 Word 模板
└── 本科毕业论文封面.docx                  官方封面 Word 模板

examples/
└── jnuthesis-example.pdf                  LaTeX 编译 PDF 范例

jnuthesis.cls                              LaTeX 文档类
jnuthesis.tex                              示例主文件
refs.bib                                   示例参考文献库
figs/                                      官方封面校徽与校名字图
fonts/README.md                            字体配置说明
latexmkrc                                  latexmk 编译配置
```

## 快速开始

```bash
git clone https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template.git
cd JNU-Thesis-LaTeX-Template
latexmk -xelatex jnuthesis.tex
```

编译完成后会生成 `jnuthesis.pdf`。仓库中已提供一份示例输出：[examples/jnuthesis-example.pdf](examples/jnuthesis-example.pdf)。

## 填写论文信息

在 `jnuthesis.tex` 顶部修改元数据：

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

官方封面日期默认留空；如需在封面显示日期，取消 `\thesisdate` 前面的注释。

## 编译方式

### TeXPage

1. 打开 [TeXPage](https://www.texpage.com)。
2. 新建项目并上传本仓库 ZIP。
3. 编译器选择 `XeLaTeX`。
4. 如需接近官方 Word 字体效果，把 Windows 字体文件上传到 `fonts/`，并使用：

```latex
\documentclass[numbering=arabic,fontset=bundled]{jnuthesis}
```

### 本地编译

推荐安装 MacTeX、TeX Live 或 MiKTeX，然后运行：

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

### Overleaf

上传整个项目，菜单中将 Compiler 改为 `XeLaTeX`。如需更接近官方 Word 字体效果，请上传 `simsun.ttc`、`simhei.ttf`、`simkai.ttf`、`simfang.ttf` 到 `fonts/` 并使用 `fontset=bundled`。

## 字体方案

| 选项 | 适用场景 | 说明 |
| --- | --- | --- |
| `fontset=windows` | Windows 本地 | 使用系统 SimSun/SimHei，最接近官方 Word 常用字体 |
| `fontset=bundled` | TeXPage、Overleaf、任意系统 | 从 `fonts/` 加载中易字体，推荐最终稿 |
| `fontset=mac` | macOS 本地 | 使用 Songti SC/Heiti SC，适合本地草稿 |
| `fontset=auto` | 默认草稿 | 自动选择可用字体，优先保证能编译 |
| `fontset=fandol` | 纯 TeX Live 草稿 | 零配置，但外观与宋体/黑体不同 |

最终提交前，如果学院严格检查字体，请优先使用 `fontset=windows` 或 `fontset=bundled`。字体文件放置方法见 [fonts/README.md](fonts/README.md)。

## 常用结构

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

## 参考文献

模板使用 `biblatex` 与 `biblatex-gb7714-2015`。在 `jnuthesis.tex` 中加载：

```latex
\addbibresource{refs.bib}
```

正文引用：

```latex
\supercite{ref-example-1}
\upcite{ref-example-2}
```

## 导出 PDF 和 Word

PDF 是推荐的最终排版输出：

```bash
latexmk -xelatex jnuthesis.tex
```

如需导出 Word，可使用 Pandoc 生成近似 `.docx`：

```bash
pandoc jnuthesis.tex -o thesis.docx \
  --pdf-engine=xelatex \
  --bibliography=refs.bib \
  --citeproc
```

Pandoc 无法完整保留复杂 LaTeX 宏、封面布局和参考文献排版。若学院要求提交 Word，请以 PDF 为排版参照，对生成的 `.docx` 逐页复核。

## 常见问题

| 问题 | 处理 |
| --- | --- |
| 中文不显示 | 确认使用 `XeLaTeX`，不要使用 `pdfLaTeX` |
| 字体和 Word 不像 | 使用 `fontset=windows` 或 `fontset=bundled` |
| 参考文献不出现 | 运行 `biber jnuthesis`，或直接使用 `latexmk -xelatex` |
| TeXPage 找不到字体 | 上传字体文件到 `fonts/` 并使用 `fontset=bundled` |
| Word 导出格式漂移 | Pandoc 只能近似转换，最终请人工复核 |

## 致谢

- 暨南大学 2026 版官方 Word 毕业论文模板
- Jianrui Lyu 的旧版 `jnuthesis`
- SolarAscent/JNUThesisTemplate 旧仓库
