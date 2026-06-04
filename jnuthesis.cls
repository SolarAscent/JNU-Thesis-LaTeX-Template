%%
%% jnuthesis.cls — Jinan University (暨南大学) Undergraduate Thesis
%% Version 1.0, 2026/06/04
%%
%% Based on official JNU Word thesis template (2026 edition).
%% https://github.com/SolarAscent/JNU-Thesis-LaTeX-Template
%%
%% Original LaTeX template: Jianrui Lyu (lvjr@163.com), 2018.
%% Legacy: SolarAscent/JNUThesisTemplate (2023).
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jnuthesis}[2026/06/04 v1.0 JNU Undergraduate Thesis]

%% ============================================================================
%%  Options (all \DeclareOption BEFORE \ProcessOptions)
%% ============================================================================

% --- heading numbering scheme ---
\newif\ifjnu@num@chinese
\jnu@num@chinesefalse  % default: arabic (matches Word template TOC)
\DeclareOption{numbering=chinese}{\jnu@num@chinesetrue}
\DeclareOption{numbering=arabic}{\jnu@num@chinesefalse}

% --- toc depth ---
\newif\ifjnu@toc@deep
\jnu@toc@deepfalse
\DeclareOption{toc-depth=4}{\jnu@toc@deeptrue}

% --- fontset: store choice, apply after LoadClass ---
\def\jnu@fontset@load{%
  % Default: fandol (bundled with TeX Live, cross-platform)
  \setCJKmainfont{FandolSong-Regular.otf}%
  \setCJKsansfont{FandolHei-Regular.otf}[AutoFakeBold=2.5]%
  \setCJKmonofont{FandolFang-Regular.otf}%
  \setCJKfamilyfont{zhsong}{FandolSong-Regular.otf}%
  \setCJKfamilyfont{zhhei}{FandolHei-Regular.otf}[AutoFakeBold=2.5]%
  \setCJKfamilyfont{zhkai}{FandolKai-Regular.otf}%
  \setCJKfamilyfont{zhfs}{FandolFang-Regular.otf}%
}

\DeclareOption{fontset=fandol}{%
  \def\jnu@fontset@load{%
    \setCJKmainfont{FandolSong-Regular.otf}[AutoFakeBold=2.5]%
    \setCJKsansfont{FandolHei-Regular.otf}[AutoFakeBold=2.5]%
    \setCJKmonofont{FandolFang-Regular.otf}%
    \setCJKfamilyfont{zhsong}{FandolSong-Regular.otf}[AutoFakeBold=2.5]%
    \setCJKfamilyfont{zhhei}{FandolHei-Regular.otf}[AutoFakeBold=2.5]%
    \setCJKfamilyfont{zhkai}{FandolKai-Regular.otf}%
    \setCJKfamilyfont{zhfs}{FandolFang-Regular.otf}%
  }%
}

\DeclareOption{fontset=windows}{%
  \def\jnu@fontset@load{%
    \setCJKmainfont{SimSun}[AutoFakeBold=2.5]%
    \setCJKsansfont{SimHei}%
    \setCJKmonofont{FangSong}%
    \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold=2.5]%
    \setCJKfamilyfont{zhhei}{SimHei}%
    \setCJKfamilyfont{zhkai}{KaiTi}%
    \setCJKfamilyfont{zhfs}{FangSong}%
  }%
}

\DeclareOption{fontset=mac}{%
  \def\jnu@fontset@load{%
    \setCJKmainfont{Songti SC}[BoldFont=Heiti SC]%
    \setCJKsansfont{Heiti SC}%
    \setCJKmonofont{STFangsong}%
    \setCJKfamilyfont{zhsong}{Songti SC}[BoldFont=Heiti SC]%
    \setCJKfamilyfont{zhhei}{Heiti SC}%
    \setCJKfamilyfont{zhkai}{Kaiti SC}%
    \setCJKfamilyfont{zhfs}{STFangsong}%
  }%
}

\DeclareOption{fontset=ubuntu}{%
  \def\jnu@fontset@load{%
    \setCJKmainfont{Noto Serif CJK SC}[BoldFont=Noto Sans CJK SC]%
    \setCJKsansfont{Noto Sans CJK SC}%
    \setCJKmonofont{Noto Sans CJK SC}%
    \setCJKfamilyfont{zhsong}{Noto Serif CJK SC}[BoldFont=Noto Sans CJK SC]%
    \setCJKfamilyfont{zhhei}{Noto Sans CJK SC}%
    \setCJKfamilyfont{zhkai}{Noto Serif CJK SC}%
    \setCJKfamilyfont{zhfs}{Noto Serif CJK SC}%
  }%
}

\DeclareOption{fontset=sourcehan}{%
  \def\jnu@fontset@load{%
    \setCJKmainfont{Source Han Serif SC}[BoldFont=Source Han Sans SC]%
    \setCJKsansfont{Source Han Sans SC}%
    \setCJKmonofont{Source Han Sans SC}%
    \setCJKfamilyfont{zhsong}{Source Han Serif SC}[BoldFont=Source Han Sans SC]%
    \setCJKfamilyfont{zhhei}{Source Han Sans SC}%
    \setCJKfamilyfont{zhkai}{Source Han Serif SC}%
    \setCJKfamilyfont{zhfs}{Source Han Serif SC}%
  }%
}

% Pass unknown options to ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

%% ============================================================================
%%  Base class: ctexbook handles Chinese typesetting
%% ============================================================================

\LoadClass[scheme=chinese,fontset=none,cs4size,openany,heading=true]{ctexbook}

%% ============================================================================
%%  Packages
%% ============================================================================

\RequirePackage{geometry}
\geometry{
  a4paper,
  left=31.75mm,
  right=31.75mm,
  top=25.4mm,
  bottom=25.4mm,
  headheight=14pt,
  headsep=8pt,
  footskip=18pt,
}

\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage[svgnames]{xcolor}
\RequirePackage{caption}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{amsmath,amssymb,bm}
\RequirePackage{enumitem}
\RequirePackage{titletoc}
\RequirePackage{lastpage}
\RequirePackage{tikz}
\RequirePackage{CJKfntef}
\RequirePackage{etoolbox}

\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=blue,
  filecolor=blue,
  urlcolor=black,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfstartview=FitH,
  unicode=true,
}

\RequirePackage[
  backend=biber,
  style=gb7714-2015,
  sorting=none,
  gbpub=false,
  gbnamefmt=lowercase,
]{biblatex}

%% ============================================================================
%%  Fonts
%% ============================================================================

\jnu@fontset@load
\setmainfont{Times New Roman}

\newcommand{\songti}{\CJKfamily{zhsong}}
\newcommand{\heiti}{\CJKfamily{zhhei}}
\newcommand{\kaishu}{\CJKfamily{zhkai}}
\newcommand{\fangsong}{\CJKfamily{zhfs}}

%% ============================================================================
%%  Font sizes (matching Word template exactly)
%% ============================================================================

% Word sz values → real points:
%   sz=72 → 36pt (小初号) : cover main title
%   sz=44 → 22pt (二号)   : 诚信声明 title
%   sz=36 → 18pt (小二号) : 论文题目
%   sz=30 → 15pt (小三号) : chapter titles
%   sz=28 → 14pt (四号)   : body text
%   sz=24 → 12pt (小四号) : TOC sections
%   sz=21 → 10.5pt (五号) : TOC subsections, captions
%   sz=18 → 9pt (小五号)  : header

\newcommand{\sizecover}{\fontsize{36pt}{48pt}\selectfont}     % 小初号
\newcommand{\sizestatement}{\fontsize{22pt}{28pt}\selectfont}  % 二号
\newcommand{\sizetitle}{\fontsize{18pt}{24pt}\selectfont}      % 小二号
\newcommand{\sizechap}{\fontsize{15pt}{22pt}\selectfont}       % 小三号
\newcommand{\sizebody}{\fontsize{14pt}{22pt}\selectfont}       % 四号
\newcommand{\sizetocsec}{\fontsize{12pt}{18pt}\selectfont}     % 小四号
\newcommand{\sizecaption}{\fontsize{10.5pt}{15pt}\selectfont}  % 五号
\newcommand{\sizeheader}{\fontsize{9pt}{12pt}\selectfont}      % 小五号

% Ensure body starts at 四号 (14pt) 宋体
\AtBeginDocument{\zihao{4}\songti\setstretch{1.15}}

%% ============================================================================
%%  Paragraph spacing
%% ============================================================================

\setlength{\parindent}{2em}
\setlength{\parskip}{0pt plus 0pt minus 0pt}

%% ============================================================================
%%  Page styles (headers and footers)
%% ============================================================================

\fancypagestyle{jnu-main}{%
  \fancyhf{}%
  \fancyhead[C]{\sizeheader\songti 暨南大学本科毕业论文（设计）}%
  \fancyfoot[C]{\sizetocsec\thepage}%
  \renewcommand{\headrulewidth}{0.4pt}%
}

\fancypagestyle{jnu-plain}{%
  \fancyhf{}%
  \fancyfoot[C]{\sizetocsec\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
}

\fancypagestyle{jnu-empty}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

\pagestyle{jnu-main}

% Chapter first page uses plain style
\ctexset{chapter/pagestyle=jnu-plain}

%% ============================================================================
%%  Heading formatting (matching Word template)
%% ============================================================================

% Common settings
\ctexset{
  chapter/name = {,},
  chapter/number = \arabic{chapter},
  chapter/format = \sizechap\songti\bfseries\centering,
  chapter/beforeskip = 6pt,
  chapter/afterskip = 6pt,
  chapter/aftername = \quad,
  %
  section/name = {,},
  section/format = \sizebody\songti\bfseries\raggedright,
  section/beforeskip = 3pt,
  section/afterskip = 3pt,
  section/aftername = \quad,
  section/indent = 0em,
  %
  subsection/name = {,},
  subsection/format = \sizebody\songti\bfseries\raggedright,
  subsection/beforeskip = 3pt,
  subsection/afterskip = 3pt,
  subsection/aftername = \quad,
  subsection/indent = 0em,
  %
  subsubsection/name = {,},
  subsubsection/format = \sizebody\songti\raggedright,
  subsubsection/beforeskip = 3pt,
  subsubsection/afterskip = 3pt,
  subsubsection/aftername = \quad,
  subsubsection/indent = 0em,
}

% Numbering scheme
\ifjnu@num@chinese
  \ctexset{
    chapter/number = \chinese{chapter},
    section/number = \chinese{section},
    section/name = {（,）},
    subsection/number = \arabic{subsection},
    subsubsection/number = \arabic{subsubsection},
    subsubsection/name = {（,）},
  }
\else
  \ctexset{
    chapter/number = \arabic{chapter},
    section/number = \arabic{chapter}.\arabic{section},
    subsection/number = \arabic{chapter}.\arabic{section}.\arabic{subsection},
    subsubsection/number = \arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection},
  }
\fi

%% ============================================================================
%%  Table of Contents
%% ============================================================================

\setcounter{tocdepth}{\ifjnu@toc@deep 3\else 2\fi}

\titlecontents{chapter}
  [0em]
  {\sizebody\songti\bfseries}
  {\contentslabel{1.2em}}
  {\hspace*{-1.2em}}
  {\titlerule*[5pt]{$\cdot$}\contentspage}
  [\addvspace{3pt}]

\titlecontents{section}
  [2.4em]
  {\sizetocsec\songti}
  {\contentslabel{2.0em}}
  {\hspace*{-2.0em}}
  {\titlerule*[5pt]{$\cdot$}\contentspage}

\titlecontents{subsection}
  [4.8em]
  {\sizecaption\songti}
  {\contentslabel{2.8em}}
  {\hspace*{-2.8em}}
  {\titlerule*[5pt]{$\cdot$}\contentspage}

%% ============================================================================
%%  Captions (table/figure)
%% ============================================================================

\captionsetup{
  font={small},
  labelfont={bf},
  labelsep=quad,
  justification=centering,
  format=plain,
}

\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
\numberwithin{equation}{chapter}

\ctexset{
  figurename = {图},
  tablename = {表},
}

%% ============================================================================
%%  User metadata commands
%% ============================================================================

\newcommand{\biaoti}[1]{\gdef\@biaoti{#1}}
\newcommand{\entitle}[1]{\gdef\@entitle{#1}}
\newcommand{\xueyuan}[1]{\gdef\@xueyuan{#1}}
\newcommand{\xuexi}[1]{\gdef\@xuexi{#1}}
\newcommand{\zhuanye}[1]{\gdef\@zhuanye{#1}}
\newcommand{\xingming}[1]{\gdef\@xingming{#1}}
\newcommand{\xuehao}[1]{\gdef\@xuehao{#1}}
\newcommand{\daoshi}[1]{\gdef\@daoshi{#1}}

\newcommand{\thesisyear}[1]{\gdef\@thesisyear{#1}}
\newcommand{\thesismonth}[1]{\gdef\@thesismonth{#1}}
\newcommand{\thesisday}[1]{\gdef\@thesisday{#1}}
\thesisyear{\the\year}
\thesismonth{\the\month}
\thesisday{\the\day}

\newcommand{\thesisdate}[3]{\thesisyear{#1}\thesismonth{#2}\thesisday{#3}}

% Default values
\biaoti{在此处键入论文题目}
\entitle{Type Your English Thesis Title Here}
\xueyuan{}
\xuexi{}
\zhuanye{}
\xingming{}
\xuehao{}
\daoshi{}

%% ============================================================================
%%  Cover page  (matching Word 本科毕业论文封面.docx)
%% ============================================================================

\newcommand{\makecover}{%
  \thispagestyle{jnu-empty}
  \begin{titlepage}
    \centering

    % University name in calligraphy (TOP — matches Word cover)
    \IfFileExists{figs/jnu-name.png}{%
      \includegraphics[width=7cm]{figs/jnu-name.png}
    }{}

    \vspace{1cm}

    % University logo (BELOW the name)
    \IfFileExists{figs/jnu-logo.png}{%
      \includegraphics[height=3cm]{figs/jnu-logo.png}
    }{%
      \fbox{\parbox{3cm}{\centering\vspace{1.5cm}校徽\\logo\vspace{1.5cm}}}
    }

    \vspace{1.5cm}

    % "本科生毕业论文" — 小初号(36pt) 黑体
    {\sizecover\heiti 本科生毕业论文}

    \vspace{2.5cm}

    % Thesis title field
    \begin{flushleft}
      \hspace{1.5em}%
      {\sizetitle\songti\bfseries 论文题目}%
      \hspace{0.5em}%
      {\sizetitle\songti\CJKunderline{\makebox[0.55\textwidth]{\hfill\@biaoti\hfill}}}
    \end{flushleft}

    \vspace{0.8cm}

    % Info fields — two-column layout matching Word cover
    \begin{flushleft}
      \sizebody\songti\bfseries
      \renewcommand{\arraystretch}{2.2}
      \begin{tabular}{@{}p{2.5cm}p{0.45\textwidth}p{2.5cm}p{0.35\textwidth}@{}}
        学\hfill 院 &
        \CJKunderline{\makebox[0.42\textwidth]{\hfill\@xueyuan\hfill}} &
        学\hfill 系 &
        \CJKunderline{\makebox[0.32\textwidth]{\hfill\@xuexi\hfill}} \\
        \\[-0.3cm]
        专\hfill 业 &
        \CJKunderline{\makebox[0.42\textwidth]{\hfill\@zhuanye\hfill}} & & \\
        \\[-0.3cm]
        姓\hfill 名 &
        \CJKunderline{\makebox[0.42\textwidth]{\hfill\@xingming\hfill}} &
        学\hfill 号 &
        \CJKunderline{\makebox[0.32\textwidth]{\hfill\@xuehao\hfill}} \\
        \\[-0.3cm]
        指导教师 &
        \CJKunderline{\makebox[0.42\textwidth]{\hfill\@daoshi\hfill}} & & \\
      \end{tabular}
    \end{flushleft}

    \vspace{2.5cm}

    % Date
    {\sizebody\songti\bfseries
     \@thesisyear \hspace{1.5em} 年
     \hspace{2em} \@thesismonth \hspace{1.5em} 月
     \hspace{2em} \@thesisday \hspace{1.5em} 日}

    \vfill

    {\sizebody JINAN UNIVERSITY}

    \vspace{0.3cm}
  \end{titlepage}
  \clearpage
}

%% ============================================================================
%%  Academic honesty statement (诚信声明)
%% ============================================================================

\newcommand{\makestatement}{%
  \thispagestyle{jnu-empty}
  \vspace*{2cm}
  \begin{center}
    {\sizestatement\songti\bfseries 诚信声明}
  \end{center}
  \vspace{2cm}
  \par
  {\sizechap\songti
    我声明，所呈交的毕业论文（设计）是本人在老师指导下进行的研究工作及取得的
    研究成果。除文中已经注明引用的内容外，本论文（设计）不包含任何其他个人或
    集体已经发表或撰写过的作品成果。在论文（设计）撰写过程中，本人严格遵守学
    术道德和学术规范，恪守学术诚信，对毕业论文（设计）的原创性、真实性负责。
  }
  \vspace{3cm}
  \par
  {\sizechap\songti
    签名：\hspace{4.5cm}
    日期：\hspace{1.5em}\hspace{0.5cm}年\hspace{1.5cm}月\hspace{1.5cm}日
  }
  \clearpage
}

%% ============================================================================
%%  Chinese abstract
%% ============================================================================

\newenvironment{zhabstract}{%
  \chapter*{摘\hspace{2em}要}
  \addcontentsline{toc}{chapter}{摘要}
  \thispagestyle{jnu-plain}
  \par
  \sizebody\songti
  \setlength{\parindent}{2em}
}{%
  \par\pagebreak[2]
}

\newcommand{\zhaiyao}[1]{%
  \vspace{0.5em}
  \par\noindent
  {\songti\bfseries [关键词]} \hspace{0.5em} #1
}

%% ============================================================================
%%  English abstract
%% ============================================================================

\newenvironment{enabstract}{%
  \chapter*{\textbf{Abstract}}
  \addcontentsline{toc}{chapter}{Abstract}
  \thispagestyle{jnu-plain}
  \par
  \sizebody
  \setlength{\parindent}{2em}
}{%
  \par\pagebreak[2]
}

\newcommand{\enkeywords}[1]{%
  \vspace{0.5em}
  \par\noindent
  {\bfseries Keywords:} \hspace{0.5em} #1
}

%% ============================================================================
%%  Bibliography
%% ============================================================================


%% ============================================================================
%%  Appendix
%% ============================================================================

\ctexset{
  appendix/name = {附录},
  appendix/number = \Alph{chapter},
}

%% ============================================================================
%%  Math utilities
%% ============================================================================

\DeclareMathOperator{\Corr}{Corr}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\grad}{grad}
\newcommand{\diff}{\mathop{}\!\mathrm{d}}

%% ============================================================================
%%  Local config
%% ============================================================================

\InputIfFileExists{jnuthesis.cfg}{%
  \typeout{Loading jnuthesis.cfg}%
}{}

\endinput
