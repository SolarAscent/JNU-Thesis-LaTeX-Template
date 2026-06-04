# Font Setup Guide / 字体配置指南

This template supports **6 font configurations** via the `fontset` class option.

For **Word-identical output**, use `fontset=windows` (on Windows) or `fontset=bundled` (any platform, including Overleaf).

---

## Quick Reference / 快速参考

| fontset | Word Match | Requires | Platform |
|---------|-----------|----------|----------|
| `windows` | ⭐⭐⭐ Perfect | SimSun/SimHei in system | Windows only |
| `bundled` | ⭐⭐⭐ Perfect | Font files in `fonts/` dir | Any (incl. Overleaf) |
| `mac` | ⭐⭐ Close | System fonts (preinstalled) | macOS |
| `ubuntu` | ⭐⭐ Close | `fonts-noto-cjk` | Linux |
| `sourcehan` | ⭐⭐ Close | Source Han fonts | Cross-platform |
| `fandol` | ⭐ Works | None (TeX Live default) | Cross-platform |

---

## 🥇 Best: Word-Identical Fonts (SimSun / 宋体 + SimHei / 黑体)

Word uses the **中易字库 (Zhongyi Font Library)** for Chinese text. To get identical output in LaTeX, you must use the same fonts.

### On Windows (fontset=windows)

SimSun and SimHei are pre-installed. Use:

```latex
\documentclass[fontset=windows]{jnuthesis}
```

### On macOS / Linux / Overleaf (fontset=bundled)

1. **Obtain the font files** from a Windows system (`C:\Windows\Fonts\`):

| Font | Windows Filename |
|------|-----------------|
| 宋体 (SimSun) | `simsun.ttc` |
| 黑体 (SimHei) | `simhei.ttf` |
| 楷体 (KaiTi) | `simkai.ttf` |
| 仿宋 (FangSong) | `simfang.ttf` |

2. **Copy the files** to the `fonts/` directory in this project:

```
fonts/
├── README.md
├── simsun.ttc      ← you add these
├── simhei.ttf
├── simkai.ttf
└── simfang.ttf
```

3. **Use in your document**:

```latex
\documentclass[fontset=bundled]{jnuthesis}
```

> ⚠️ **For Overleaf**: Upload the font files alongside `jnuthesis.tex` and use `fontset=bundled`. The template loads fonts by **filename** from the project directory, which works on Overleaf's server.

> 💡 **On macOS**: You can also find SimSun in `/Applications/Microsoft Word.app/Contents/Resources/DFonts/` if you have Word installed.

---

## 🥈 macOS: System Songti/Heiti (fontset=mac)

macOS includes high-quality Chinese fonts that are close to SimSun/SimHei:

```latex
\documentclass[fontset=mac]{jnuthesis}
```

| Role | macOS Font |
|------|-----------|
| Body (宋体) | Songti SC |
| Heading (黑体) | Heiti SC |
| Statement (楷体) | Kaiti SC |

---

## 🥉 Cross-platform Fallbacks

### Fandol (fontset=fandol) — Zero-config

Fandol fonts are bundled with **all TeX Live installations**. Use when you just need to compile and don't care about exact font matching:

```latex
\documentclass[fontset=fandol]{jnuthesis}
```

> ⚠️ Fandol's stroke weight and style differ noticeably from SimSun. Use only for drafting.

### Ubuntu/Debian (fontset=ubuntu)

```bash
sudo apt-get install fonts-noto-cjk
```

```latex
\documentclass[fontset=ubuntu]{jnuthesis}
```

### Source Han (fontset=sourcehan)

Install [Source Han Serif](https://github.com/adobe-fonts/source-han-serif) and [Source Han Sans](https://github.com/adobe-fonts/source-han-sans) from Adobe.

```latex
\documentclass[fontset=sourcehan]{jnuthesis}
```

---

## 🔍 Verifying Available Fonts / 检查可用字体

```bash
# List all Chinese fonts on your system
fc-list :lang=zh family | sort -u

# Check for specific fonts
fc-list | grep -i "simsun\|simhei\|songti\|heiti"
```

---

## 📐 Important: 宋体 Bold ≠ 黑体 / Songti Bold ≠ Heiti

In the Word template:
- **宋体加粗** = SimSun with artificial bold (AutoFakeBold) 
- **黑体** = SimHei (a completely different font)

All `fontset` options in this template use `AutoFakeBold` for the body font (songti/宋体). This means `\textbf{text}` in body text produces **faux-bold 宋体**, not 黑体 — matching Word behavior exactly.

To use 黑体 (for headings), use the `\heiti` command explicitly:

```latex
这是宋体正文。\textbf{这是宋体加粗（AutoFakeBold）。}
{\heiti 这是黑体（用于标题）。}
```
