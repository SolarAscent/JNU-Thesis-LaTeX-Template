# 🎓 暨南大学本科毕业论文 LaTeX 模板

# Jinan University Undergraduate Thesis LaTeX Template

<div align="center">

**[English](#english)** | **[中文](#chinese)**

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)]()
[![LaTeX](https://img.shields.io/badge/LaTeX-XeLaTeX%20%7C%20LuaLaTeX-blue)]()
[![License](https://img.shields.io/badge/license-GPL--3.0-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-v1.0-brightgreen)]()
[![JNU](https://img.shields.io/badge/JNU-Undergraduate%20Thesis-important)]()

**The official LaTeX template for Jinan University undergraduate theses — matching the 2026 Word template specifications exactly.**

</div>

---

## 📖 English

### ⚡ Quick Start

```bash
# 1. Clone this repository
git clone https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template.git
cd JNUThesisTemplate

# 2. Edit your metadata in jnuthesis.tex
#    - Title, name, student ID, advisor, etc.

# 3. Compile
latexmk -pdf -xelatex jnuthesis
```

That's it! Your PDF is ready at `jnuthesis.pdf`.

### 🚀 Usage Options

#### Option 1: ☁️ TeXPage (Zero Installation)

1. Go to [TeXPage](https://www.texpage.com)
2. Create a new project → Upload from ZIP
3. Upload this entire template folder as a ZIP
4. Set compiler to **XeLaTeX**
5. Click **Compile** — done!

#### Option 2: 📦 Overleaf

1. Go to [Overleaf](https://www.overleaf.com)
2. New Project → Upload Project
3. Upload this entire folder as a ZIP
4. Set Menu → Compiler → **XeLaTeX**
5. Click **Recompile**

#### Option 3: 💻 Local Compilation

**Prerequisites:**

| OS | Required Packages |
|----|------------------|
| macOS | MacTeX ([tug.org/mactex](https://tug.org/mactex)) |
| Windows | TeX Live or MiKTeX + [fonts](fonts/README.md) |
| Ubuntu/Debian | `sudo apt-get install texlive-full fonts-noto-cjk` |
| Arch | `sudo pacman -S texlive-most noto-fonts-cjk` |

**Compile:**

```bash
# Single-pass (recommended)
latexmk -pdf -xelatex jnuthesis

# Or manual:
xelatex jnuthesis
biber jnuthesis
xelatex jnuthesis
xelatex jnuthesis
```

### 📝 Document Structure

```
jnuthesis.tex          ← Main file (edit your metadata here)
├── Chapters/
│   ├── 01-Introduction.tex
│   ├── 02-Chapter.tex
│   ├── 03-Methodology.tex
│   ├── 04-Experiments.tex
│   ├── 05-Conclusion.tex
│   ├── Appendix-A.tex
│   ├── Appendix-B.tex
│   └── Acknowledgments.tex
├── figs/
│   ├── jnu-logo.png   ← University logo
│   └── jnu-name.png   ← University name calligraphy
├── fonts/
│   └── README.md      ← Font installation guide
└── refs.bib           ← Bibliography file
```

### ⚙️ Class Options

| Option | Values | Default | Description |
|--------|--------|---------|-------------|
| `numbering` | `chinese`, `arabic` | `chinese` | Heading numbering: 一/(一)/1… or 1/1.1/1.1.1 |
| `fontset` | `mac`, `windows`, `ubuntu`, `fandol`, `sourcehan` | `fandol` | CJK font configuration (auto-detected per OS) |
| `toc-depth` | `3`, `4` | `3` | Table of contents depth |
| `draft` | — | — | Fast draft mode |

**Example:**

```latex
\documentclass[numbering=arabic,fontset=mac]{jnuthesis}
```

### 📋 Available Commands

#### Metadata

```latex
\biaoti{中文论文题目}        % Chinese thesis title
\entitle{English Title}       % English thesis title
\xueyuan{XX学院}              % College/School
\xuexi{XX学系}               % Department
\zhuanye{XX专业}             % Major
\xingming{姓名}               % Student name
\xuehao{2024000000}           % Student ID
\daoshi{指导教师}             % Advisor
\thesisdate{2026}{6}{4}       % Defense date
```

#### Front Matter

```latex
\makecover                    % Generate cover page
\makestatement                % Generate academic honesty statement
\begin{zhabstract}...\end{zhabstract}   % Chinese abstract
\begin{enabstract}...\end{enabstract}   % English abstract
\tableofcontents              % Table of contents
```

#### Abstracts

```latex
\begin{zhabstract}
  摘要内容...

  \zhaiyao{关键词1；关键词2；关键词3}
\end{zhabstract}

\begin{enabstract}
  Abstract content...

  \enkeywords{Keyword1; Keyword2; Keyword3}
\end{enabstract}
```

#### Citations

```latex
\upcite{ref-key}              % Superscript citation [1]
```

### 📚 Bibliography

Uses **biblatex** with GB/T 7714-2015 (Chinese national standard for bibliographic references).

Add references to `refs.bib`:

```bibtex
@article{example,
  author  = {作者1 and 作者2},
  title   = {论文题目},
  journal = {期刊名},
  year    = {2025},
  volume  = {45},
  number  = {3},
  pages   = {100--110},
}
```

### 📄 Exporting

#### Export to PDF (Built-in)

```bash
latexmk -pdf -xelatex jnuthesis
```

#### Export to Word (.docx)

Using [pandoc](https://pandoc.org):

```bash
# Install pandoc first: brew install pandoc (macOS) / apt-get install pandoc (Linux)

# Basic conversion
pandoc jnuthesis.tex -o thesis.docx --pdf-engine=xelatex

# With bibliography
pandoc jnuthesis.tex -o thesis.docx \
  --pdf-engine=xelatex \
  --bibliography=refs.bib \
  --citeproc \
  --reference-doc=reference.docx
```

> ⚠️ **Note:** Pandoc conversion may not perfectly preserve all LaTeX formatting. For final submission, please verify the output against the Word template.

### 🔧 Troubleshooting

| Problem | Solution |
|---------|----------|
| **Font not found** | Install fonts per [fonts/README.md](fonts/README.md) or use `fontset=fandol` |
| **"biblatex.sty not found"** | Install TeX Live full: `sudo apt-get install texlive-full` |
| **Chinese characters not showing** | Ensure compiler is **XeLaTeX** (not pdfLaTeX) |
| **Page margins wrong** | Check your TeX distribution is up to date |

### 📄 License

This template is licensed under the [GNU General Public License v3.0](LICENSE).

### 🙏 Credits

- Original LaTeX template (2018) by **Jianrui Lyu** (lvjr@163.com) — [lvjr.bitbucket.io/jnuthesis.html](https://lvjr.bitbucket.io/jnuthesis.html)
- Legacy template maintained by **SolarAscent** (2023) — [github.com/SolarAscent/JNUThesisTemplate](https://github.com/SolarAscent/JNUThesisTemplate) *(superseded by this template)*
- This v1.0 template: rewritten from scratch based on the 2026 official JNU Word thesis template, with significant architectural improvements including biblatex/GB7714 support, build automation, cross-platform font configuration, and CI/CD

---

## 📖 中文

### ⚡ 快速开始

```bash
# 1. 克隆本仓库
git clone https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template.git
cd JNUThesisTemplate

# 2. 在 jnuthesis.tex 中填写你的信息
#    - 论文题目、姓名、学号、指导教师等

# 3. 编译
latexmk -pdf -xelatex jnuthesis
```

完成！你的 PDF 已生成在 `jnuthesis.pdf`。

### 🚀 使用方式

#### 方式一：☁️ TeXPage（无需安装）

1. 访问 [TeXPage](https://www.texpage.com)
2. 创建新项目 → 上传 ZIP
3. 将整个模板文件夹打包为 ZIP 上传
4. 编译器选择 **XeLaTeX**
5. 点击 **编译** — 完成！

#### 方式二：📦 Overleaf

1. 访问 [Overleaf](https://www.overleaf.com)
2. 新建项目 → 上传项目
3. 将整个文件夹打包为 ZIP 上传
4. 菜单 → 编译器 → 选择 **XeLaTeX**
5. 点击 **重新编译**

#### 方式三：💻 本地编译

**环境准备：**

| 操作系统 | 所需安装 |
|---------|---------|
| macOS | MacTeX ([tug.org/mactex](https://tug.org/mactex)) |
| Windows | TeX Live 或 MiKTeX + [字体配置](fonts/README.md) |
| Ubuntu/Debian | `sudo apt-get install texlive-full fonts-noto-cjk` |
| Arch Linux | `sudo pacman -S texlive-most noto-fonts-cjk` |

**编译命令：**

```bash
# 一键编译（推荐）
latexmk -pdf -xelatex jnuthesis

# 或分步编译：
xelatex jnuthesis
biber jnuthesis
xelatex jnuthesis
xelatex jnuthesis
```

### 📝 文档结构

```
jnuthesis.tex          ← 主文件（在此填写元数据）
├── Chapters/
│   ├── 01-Introduction.tex   ← 绪论
│   ├── 02-Chapter.tex        ← 正文示例
│   ├── 03-Methodology.tex    ← 方法设计
│   ├── 04-Experiments.tex    ← 实验与评估
│   ├── 05-Conclusion.tex     ← 结论与展望
│   ├── Appendix-A.tex        ← 附录A
│   ├── Appendix-B.tex        ← 附录B
│   └── Acknowledgments.tex   ← 致谢
├── figs/
│   ├── jnu-logo.png   ← 暨南大学校徽
│   └── jnu-name.png   ← 暨南大学校名
├── fonts/
│   └── README.md      ← 字体安装指南
└── refs.bib           ← 参考文献文件
```

### ⚙️ 文档类选项

| 选项 | 可选值 | 默认值 | 说明 |
|------|--------|--------|------|
| `numbering` | `chinese`, `arabic` | `chinese` | 章节编号方案：一/(一)/1… 或 1/1.1/1.1.1 |
| `fontset` | `mac`, `windows`, `ubuntu`, `fandol`, `sourcehan` | `fandol` | 中文字体配置 |
| `toc-depth` | `3`, `4` | `3` | 目录深度 |
| `draft` | — | — | 草稿模式（快速编译） |

**示例：**

```latex
\documentclass[numbering=chinese,fontset=windows]{jnuthesis}
```

### 📋 可用命令

#### 元数据

```latex
\biaoti{中文论文题目}        % 中文论文标题
\entitle{English Title}       % 英文论文标题
\xueyuan{XX学院}              % 学院
\xuexi{XX学系}               % 学系
\zhuanye{XX专业}             % 专业
\xingming{姓名}               % 姓名
\xuehao{2024000000}           % 学号
\daoshi{指导教师}             % 指导教师
\thesisdate{2026}{6}{4}       % 答辩日期
```

#### 前置部分

```latex
\makecover                    % 生成封面
\makestatement                % 生成诚信声明
\begin{zhabstract}...\end{zhabstract}   % 中文摘要
\begin{enabstract}...\end{enabstract}   % 英文摘要
\tableofcontents              % 目录
```

#### 摘要

```latex
\begin{zhabstract}
  摘要内容（一般不超过300字）...

  \zhaiyao{关键词1；关键词2；关键词3}
\end{zhabstract}

\begin{enabstract}
  Abstract content...

  \enkeywords{Keyword1; Keyword2; Keyword3}
\end{enabstract}
```

#### 引用

```latex
\upcite{ref-key}              % 上标引用 [1]
```

### 📚 参考文献

使用 **biblatex** 配合 GB/T 7714-2015 国家标准。

在 `refs.bib` 中添加参考文献条目：

```bibtex
@article{example,
  author  = {作者1 and 作者2},
  title   = {论文题目},
  journal = {期刊名},
  year    = {2025},
  volume  = {45},
  number  = {3},
  pages   = {100--110},
}
```

### 📄 格式转换

#### 导出为 PDF（内置）

```bash
latexmk -pdf -xelatex jnuthesis
```

#### 导出为 Word (.docx)

使用 [pandoc](https://pandoc.org)：

```bash
# 安装 pandoc：
# macOS: brew install pandoc
# Ubuntu: sudo apt-get install pandoc

# 基本转换
pandoc jnuthesis.tex -o thesis.docx --pdf-engine=xelatex

# 包含参考文献
pandoc jnuthesis.tex -o thesis.docx \
  --pdf-engine=xelatex \
  --bibliography=refs.bib \
  --citeproc \
  --reference-doc=reference.docx
```

> ⚠️ **注意：** Pandoc 转换可能无法完全保留所有 LaTeX 格式。最终提交前请仔细核对输出是否符合学校 Word 模板要求。

### 🔧 常见问题

| 问题 | 解决方法 |
|------|---------|
| **找不到字体** | 按 [fonts/README.md](fonts/README.md) 安装字体，或使用 `fontset=fandol` |
| **找不到 biblatex.sty** | 安装完整 TeX Live：`sudo apt-get install texlive-full` |
| **中文不显示** | 确保编译器为 **XeLaTeX**（而非 pdfLaTeX） |
| **页边距不对** | 确保 TeX 发行版为最新版本 |
| **参考文献不显示** | 确保运行了 biber：`biber jnuthesis` 后重新编译 |

### 🎯 格式对照

本模板严格按照暨南大学2026版Word毕业论文模板制作，确保以下格式完全一致：

| 项目 | 规格 |
|------|------|
| 纸张 | A4 (210mm × 297mm) |
| 页边距 | 上/下 25.4mm，左/右 31.75mm |
| 正文字体 | 宋体，四号 (14pt) |
| 标题字体 | 黑体 |
| 英文字体 | Times New Roman |
| 一级标题 | 小三号 (15pt) 黑体加粗 |
| 二级标题 | 四号 (14pt) 黑体加粗 |
| 三级标题 | 四号 (14pt) 黑体 |
| 页眉 | 小五号 (9pt) 宋体 |
| 页码 | 小四号 (12pt) |
| 行距 | 单倍行距 |
| 首行缩进 | 2字符 |
| 参考文献格式 | GB/T 7714-2015 |

### 📄 许可证

本模板基于 [GNU General Public License v3.0](LICENSE) 协议发布。

### 🙏 致谢

- 原始 LaTeX 模板 (2018) 由 **吕荐瑞** 老师制作 — [lvjr.bitbucket.io/jnuthesis.html](https://lvjr.bitbucket.io/jnuthesis.html)
- 旧版模板由 **SolarAscent** (2023) 维护 — [github.com/SolarAscent/JNUThesisTemplate](https://github.com/SolarAscent/JNUThesisTemplate) *（已由本模板取代）*
- 本 v1.0 模板：基于2026版暨南大学官方Word毕业论文模板从零重新开发，在架构上进行了重大改进，包括 biblatex/GB7714 支持、自动化构建、跨平台字体配置和 CI/CD

---

<div align="center">

**⭐ If this template helps you, please give it a star!**

**如果本模板对你有帮助，请点个 Star ⭐**

*Made with ❤️ for JNU students*

</div>
