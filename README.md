# 暨南大学本科毕业论文（设计）LaTeX 模板

<div align="center">

**中文** | [English](README.en.md)

[![Compile](https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template/actions/workflows/compile.yml/badge.svg)](https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template/actions/workflows/compile.yml)
[![XeLaTeX](https://img.shields.io/badge/compiler-XeLaTeX-126f9a)](#编译环境)
[![GB/T 7714](https://img.shields.io/badge/bibliography-GB%2FT%207714--2015-444)](#参考文献)
[![Example PDF](https://img.shields.io/badge/示例-PDF-0f766e)](examples/jnuthesis-example.pdf)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue)](LICENSE)

**逐页复刻官方 Word 模板的 LaTeX 版本**——封面、诚信声明、中英文摘要、目录、正文、表格、插图、公式、参考文献、附录、致谢，与官方原件一一对应。

</div>

---

> [!IMPORTANT]
> **提交前请务必自行核对。** 本模板是社区整理的非官方 LaTeX 版本，按 **2026‑04‑13 版**官方 Word 文件（`暨南大学本科毕业论文模板20260413.dot` 与 `本科毕业论文封面.docx`）逐页排版校准。但是：
> 1. 学校/学院可能**随时更新**官方模板或提出额外要求；
> 2. 中文字体在不同系统上**渲染略有差异**（见[字体方案](#字体方案)）；
> 3. 个别学院对页眉、页码、参考文献等**另有规定**。
>
> 正式提交前，请把编译出的 PDF 与**学院当年下发的最新官方模板**逐页比对，确认无误后再使用。模板作者不对因格式不符导致的任何后果负责。

---

## 这个模板解决什么问题

写毕业论文时，封面、目录、页眉页脚、中文字体、参考文献格式这些"排版琐事"最耗时。这个仓库把它们全部调好，让你把精力放回论文内容本身：

- ✅ **逐页对齐官方 Word**——封面校徽/校名图、`诚信声明`（楷体）、摘要小二号标题、目录点线引导、`图/表 X‑Y` 题注、`（式 X‑Y）` 公式编号，均按官方原件复刻。
- ✅ **字体还原**——宋体正文、宋体加粗标题、黑体封面大标题、楷体诚信声明、Times New Roman 西文，与 Word 一致。
- ✅ **行距还原**——正文按官方文档网格的 32.5pt 行距排版（即 Word 的"1.5 倍行距 + 对齐网格"）。
- ✅ **GB/T 7714‑2015** 参考文献，`biblatex` + `biber` 自动生成。
- ✅ **一条命令编译**，附 GitHub Actions 自动构建。

先打开 [示例 PDF](examples/jnuthesis-example.pdf) 看整体效果。

## 快速开始

### 1. 获取项目

```bash
git clone https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template.git
cd JNU-Thesis-LaTeX-Template
```

### 2. 填写个人信息

打开 [`jnuthesis.tex`](jnuthesis.tex)，取消注释并填写：

```latex
\biaoti{你的中文论文题目}        % 同时用于摘要页标题与正文页眉
\entitle{Your English Thesis Title}
\xueyuan{XX学院}\xuexi{XX学系}\zhuanye{XX专业}
\xingming{姓名}\xuehao{学号}\daoshi{指导教师}
\thesisdate{2026}{6}{14}          % 封面日期
```

把封面命令从占位用的 `\makeblankcover` 改成 `\makecover`，上面填写的信息就会出现在封面横线上。

### 3. 编译

```bash
latexmk -xelatex jnuthesis.tex
```

得到 `jnuthesis.pdf`（共 15 页：封面 + 14 页正文）。

## 编译环境

> 必须使用 **XeLaTeX**（中文排版），不要用 pdfLaTeX。

| 环境 | 做法 |
| --- | --- |
| **本地** | 安装 MacTeX / TeX Live / MiKTeX，运行 `latexmk -xelatex jnuthesis.tex` |
| **Overleaf** | 上传整个项目，Menu → Compiler 选 `XeLaTeX`；建议 `\documentclass[fontset=fandol]{jnuthesis}` |
| **TeXPage** | 新建项目上传 ZIP，编译器选 `XeLaTeX` |
| **GitHub Actions** | 每次 push 自动用 XeLaTeX 构建并上传 PDF（见 [Actions](../../actions)） |

手动多轮编译顺序：`xelatex → biber → xelatex → xelatex`。

## 字体方案

中文论文的观感主要取决于字体。模板按 `fontset` 选项自动适配，**默认 `fontset=auto`**：

| 选项 | 适用平台 | 字体来源 |
| --- | --- | --- |
| `auto`（默认） | 任意 | 自动探测：macOS→系统宋黑楷，Windows→SimSun/SimHei/KaiTi，Linux→Noto/Fandol |
| `mac` | macOS | Songti SC / Heiti SC / Kaiti SC / STFangsong |
| `windows` | Windows | SimSun / SimHei / KaiTi_GB2312 / FangSong（与官方 Word 完全一致） |
| `bundled` | Overleaf / 跨平台终稿 | 从 `fonts/` 加载中易字体（需自备字体文件） |
| `fandol` | 零配置 / CI | TeX Live 自带，外观与宋体略有差异 |

```latex
\documentclass[fontset=windows]{jnuthesis}   % 最终在 Windows 上定稿时最贴近官方
```

> **为什么 macOS 默认用系统字体？** 官方 Word 在 macOS 上打开时本就把 SimSun/SimHei/KaiTi 替换为 Songti/Heiti/Kaiti，所以用这些字体编译，效果与你在 Word 里看到的**一模一样**。需要 Windows 上的"标准"字形时改用 `fontset=windows`。

## 仓库结构

```text
jnuthesis.cls          模板核心：页面/字体/封面/标题/目录/题注/参考文献
jnuthesis.tex          示例主文件：填信息、写正文都从这里开始
refs.bib               示例参考文献库（GB/T 7714‑2015）
figs/                  封面校徽与校名书法图（取自官方封面 .docx）
fonts/                 放置 bundled 字体（见 fonts/README.md）
examples/              示例编译效果 PDF
official/              学校官方 Word 原件（.dot 正文 + .docx 封面）
latexmkrc              latexmk 编译配置
.github/workflows/     GitHub Actions 自动编译
```

## 写作指引

主文件已经搭好毕业论文的标准结构，按需替换内容即可：

```latex
\makecover                       % 封面（占位预览用 \makeblankcover）
\makestatement                   % 诚信声明

\begin{zhabstract}
中文摘要正文……
\zhaiyao{关键词1；关键词2；关键词3}
\end{zhabstract}

\begin{enabstract}
English abstract……
\enkeywords{Keyword1; Keyword2; Keyword3}
\end{enabstract}

\tableofcontents                 % 目录
\jnumainmatter                   % 正文从此开始用阿拉伯数字页码

\chapter{绪论}
\section{文献综述}
……

\jnucenterchapter{参考文献}       % 或用下面的自动文献表
\jnuleftchapter{附录}
\jnucenterchapter{致谢}
```

- **章节标题**：`\chapter`（一级，小三号宋体加粗）、`\section`、`\subsection`（四号宋体加粗），自动编号 `1`、`1.1`、`1.1.1`。
- **图/表**：`\caption{}` 自动生成 `图 X‑Y` / `表 X‑Y`（五号宋体，居中）。
- **公式**：`equation` 环境自动生成 `（式 X‑Y）` 右对齐编号。
- **特殊章节**：`参考文献`、`致谢` 居中标题，`附录` 左对齐标题（与官方一致）。

## 参考文献

模板使用 `biblatex` + `biblatex-gb7714-2015`（GB/T 7714‑2015 顺序编码制）。把文献写入 [`refs.bib`](refs.bib)，正文中引用：

```latex
\supercite{key}      % 上标顺序编码 [1]
\upcite{key}         % 同上
```

正式写作时，删除示例中"参考文献规范"说明文字，解除主文件中 `\printbibliography[heading=jnubib]` 的注释即可自动生成文献表。使用 `latexmk -xelatex` 会自动处理 `biber` 多轮编译。

## 常见问题

| 问题 | 解决 |
| --- | --- |
| 中文不显示 / 报缺字 | 确认用 `XeLaTeX`，不要用 pdfLaTeX |
| 字体和 Word 不像 | macOS 用默认 `auto`；Windows 定稿用 `fontset=windows` |
| 参考文献不出现 | 用 `latexmk -xelatex`，或手动 `biber jnuthesis` 后再编译两遍 |
| Overleaf 缺字体 | 用 `fontset=fandol`，或上传字体到 `fonts/` 并用 `fontset=bundled` |
| 封面信息没显示 | 把 `\makeblankcover` 改成 `\makecover` 并填写元数据 |

## 致谢

感谢暨南大学官方 Word 毕业论文模板，以及 [Latiyas/JNUThesis](https://github.com/Latiyas/JNUThesis)、旧版 `jnuthesis` 等前人工作在中文字体、目录、题注、列表与编译配置上的经验。本项目以新版官方 Word 模板为格式校准基准重新实现。

## 许可

本项目以 [GPL‑3.0](LICENSE) 许可发布。校徽、校名等暨南大学相关标识版权归暨南大学所有，仅供本校学生撰写毕业论文使用。
