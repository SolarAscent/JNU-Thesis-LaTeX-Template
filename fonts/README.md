# Font Setup Guide / 字体配置指南

This template requires Chinese fonts for full functionality. The specific fonts needed depend on your operating system.

## Required Fonts

| Role | Windows | macOS | Ubuntu/Debian | Fandol (fallback) |
|------|---------|-------|---------------|-------------------|
| Body (宋体) | SimSun | Songti SC | fonts-noto-cjk | FandolSong |
| Title (黑体) | SimHei | Heiti SC | fonts-noto-cjk | FandolHei |
| Statement (楷体) | KaiTi | Kaiti SC | fonts-noto-cjk | FandolKai |
| English | Times New Roman | Times New Roman | fonts-urw-base35 | TeX Gyre Termes |

## Windows

Fonts are pre-installed. Use class option `fontset=windows`:

```latex
\documentclass[fontset=windows]{jnuthesis}
```

## macOS

Fonts are pre-installed. Use class option `fontset=mac`:

```latex
\documentclass[fontset=mac]{jnuthesis}
```

## Ubuntu / Debian

Install required packages:

```bash
sudo apt-get install texlive-full fonts-noto-cjk
```

Use class option `fontset=ubuntu`:

```latex
\documentclass[fontset=ubuntu]{jnuthesis}
```

## Cross-platform (Source Han)

Install Source Han Serif and Source Han Sans from Google Fonts, then use:

```latex
\documentclass[fontset=sourcehan]{jnuthesis}
```

## Fandol Fallback

The Fandol fonts are bundled with TeX Live and work everywhere:

```latex
\documentclass[fontset=fandol]{jnuthesis}
```

## Checking Available Fonts

To see what Chinese fonts are available on your system:

```bash
# Linux/macOS
fc-list :lang=zh | grep -i "song\|hei\|kai"

# macOS
fc-list :lang=zh family | sort -u
```
