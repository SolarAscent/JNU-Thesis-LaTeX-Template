%%
%% This is file `jnuthesis.cls',
%% generated for Jinan University (暨南大学) Undergraduate Thesis.
%%
%% Copyright (C) 2026 by JNU Thesis Template Contributors
%%
%% This file may be distributed and/or modified under the conditions of
%% the GNU General Public License, version 3.
%%
%% Repository: https://github.com/SolarAscent/JNUThesisTemplate
%%
%% Based on the official JNU Word thesis template (2026).
%% Original LaTeX template by Jianrui Lyu (lvjr@163.com), 2018.
%% Rewritten and updated for the 2026 Word template specifications.
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jnuthesis}[2026/06/04 v1.0 Jinan University Undergraduate Thesis Template]

%% ============================================================================
%%  Class Options — must be declared BEFORE \ProcessOptions
%% ============================================================================

% --- numbering scheme ---
\newif\ifjnu@numbering@chinese
\jnu@numbering@chinesetrue
\DeclareOption{numbering=chinese}{\jnu@numbering@chinesetrue}
\DeclareOption{numbering=arabic}{\jnu@numbering@chinesefalse}

% --- toc depth ---
\newif\ifjnu@toc@four
\jnu@toc@fourfalse
\DeclareOption{toc-depth=4}{\jnu@toc@fourtrue}

% --- draft mode ---
\newif\ifjnu@draft
\jnu@draftfalse
\DeclareOption{draft}{\jnu@drafttrue}

% --- fontset options ---
\newif\ifjnu@fontset@set
\jnu@fontset@setfalse

\def\jnu@fontset@load{%
  % Default fallback: fandol (bundled with TeX Live)
  \setCJKmainfont{FandolSong-Regular.otf}[
    BoldFont=FandolHei-Regular.otf,
    ItalicFont=FandolKai-Regular.otf,
  ]
  \setCJKsansfont{FandolHei-Regular.otf}[AutoFakeBold=2.0]
  \setCJKmonofont{FandolFang-Regular.otf}
  \setCJKfamilyfont{zhsong}{FandolSong-Regular.otf}[
    BoldFont=FandolHei-Regular.otf,
    ItalicFont=FandolKai-Regular.otf,
  ]
  \setCJKfamilyfont{zhhei}{FandolHei-Regular.otf}[AutoFakeBold=2.0]
  \setCJKfamilyfont{zhkai}{FandolKai-Regular.otf}
  \setCJKfamilyfont{zhfs}{FandolFang-Regular.otf}
}

\DeclareOption{fontset=fandol}{%
  \jnu@fontset@settrue
  \def\jnu@fontset@load{%
    \setCJKmainfont{FandolSong-Regular.otf}[
      BoldFont=FandolHei-Regular.otf,
      ItalicFont=FandolKai-Regular.otf,
    ]
    \setCJKsansfont{FandolHei-Regular.otf}[AutoFakeBold=2.0]
    \setCJKmonofont{FandolFang-Regular.otf}
    \setCJKfamilyfont{zhsong}{FandolSong-Regular.otf}[
      BoldFont=FandolHei-Regular.otf,
      ItalicFont=FandolKai-Regular.otf,
    ]
    \setCJKfamilyfont{zhhei}{FandolHei-Regular.otf}[AutoFakeBold=2.0]
    \setCJKfamilyfont{zhkai}{FandolKai-Regular.otf}
    \setCJKfamilyfont{zhfs}{FandolFang-Regular.otf}
  }
}

\DeclareOption{fontset=windows}{%
  \jnu@fontset@settrue
  \def\jnu@fontset@load{%
    \setCJKmainfont{SimSun}[AutoFakeBold=2.5]
    \setCJKsansfont{SimHei}
    \setCJKmonofont{FangSong}
    \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold=2.5]
    \setCJKfamilyfont{zhhei}{SimHei}
    \setCJKfamilyfont{zhkai}{KaiTi}
    \setCJKfamilyfont{zhfs}{FangSong}
  }
}

\DeclareOption{fontset=mac}{%
  \jnu@fontset@settrue
  \def\jnu@fontset@load{%
    \setCJKmainfont{Songti SC}[BoldFont=Heiti SC]
    \setCJKsansfont{Heiti SC}
    \setCJKmonofont{STFangsong}
    \setCJKfamilyfont{zhsong}{Songti SC}[BoldFont=Heiti SC]
    \setCJKfamilyfont{zhhei}{Heiti SC}
    \setCJKfamilyfont{zhkai}{Kaiti SC}
    \setCJKfamilyfont{zhfs}{STFangsong}
  }
}

\DeclareOption{fontset=ubuntu}{%
  \jnu@fontset@settrue
  \def\jnu@fontset@load{%
    \setCJKmainfont{Noto Serif CJK SC}[BoldFont=Noto Sans CJK SC]
    \setCJKsansfont{Noto Sans CJK SC}
    \setCJKmonofont{Noto Sans CJK SC}
    \setCJKfamilyfont{zhsong}{Noto Serif CJK SC}[BoldFont=Noto Sans CJK SC]
    \setCJKfamilyfont{zhhei}{Noto Sans CJK SC}
    \setCJKfamilyfont{zhkai}{Noto Serif CJK SC}
    \setCJKfamilyfont{zhfs}{Noto Serif CJK SC}
  }
}

\DeclareOption{fontset=sourcehan}{%
  \jnu@fontset@settrue
  \def\jnu@fontset@load{%
    \setCJKmainfont{Source Han Serif SC}[BoldFont=Source Han Sans SC]
    \setCJKsansfont{Source Han Sans SC}
    \setCJKmonofont{Source Han Sans SC}
    \setCJKfamilyfont{zhsong}{Source Han Serif SC}[BoldFont=Source Han Sans SC]
    \setCJKfamilyfont{zhhei}{Source Han Sans SC}
    \setCJKfamilyfont{zhkai}{Source Han Serif SC}
    \setCJKfamilyfont{zhfs}{Source Han Serif SC}
  }
}

% --- Pass all remaining options to ctexbook ---
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

%% ============================================================================
%%  Load Base Class
%% ============================================================================

\LoadClass[scheme=chinese,fontset=none,zihao=4,openany]{ctexbook}

%% ============================================================================
%%  Required Packages
%% ============================================================================

\RequirePackage{geometry}
\geometry{
  a4paper,
  left=31.75mm,
  right=31.75mm,
  top=25.4mm,
  bottom=25.4mm,
  headheight=15pt,
  headsep=10pt,
  footskip=15pt,
}

\RequirePackage{setspace}
\setstretch{1.0}

\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage[svgnames]{xcolor}
\definecolor{jnu-blue}{RGB}{0,70,140}
\RequirePackage{caption}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{bm}
\RequirePackage{enumitem}
\RequirePackage{titletoc}

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

\RequirePackage{lastpage}
\RequirePackage{tikz}
\RequirePackage{CJKfntef}
\RequirePackage{etoolbox}

%% ============================================================================
%%  Font Configuration (runs after LoadClass, based on fontset option)
%% ============================================================================

\jnu@fontset@load

% Set English (Latin) main font
\setmainfont{Times New Roman}

% Shorthand font commands
\newcommand{\songti}{\CJKfamily{zhsong}}
\newcommand{\heiti}{\CJKfamily{zhhei}}
\newcommand{\kaishu}{\CJKfamily{zhkai}}
\newcommand{\fangsong}{\CJKfamily{zhfs}}

%% ============================================================================
%%  Font Sizes
%% ============================================================================

\AtBeginDocument{\zihao{4}\songti}

\newcommand{\chuhao}{\fontsize{42pt}{50pt}\selectfont}
\newcommand{\xiaochu}{\fontsize{36pt}{48pt}\selectfont}
\newcommand{\yihao}{\fontsize{27.5pt}{36pt}\selectfont}
\newcommand{\xiaoyi}{\fontsize{24pt}{32pt}\selectfont}
\newcommand{\erhao}{\fontsize{22pt}{28pt}\selectfont}
\newcommand{\xiaoer}{\fontsize{18pt}{24pt}\selectfont}
\newcommand{\xiaosan}{\fontsize{15pt}{22pt}\selectfont}

%% ============================================================================
%%  Paragraph & Line Settings
%% ============================================================================

\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\lineskiplimit=3pt
\lineskip=3pt

\abovedisplayskip=4pt minus 2pt
\belowdisplayskip=4pt minus 2pt
\abovedisplayshortskip=2pt minus 1pt
\belowdisplayshortskip=2pt minus 1pt
\setlength{\arraycolsep}{4pt}

%% ============================================================================
%%  Page Styles (Headers & Footers)
%% ============================================================================

\fancypagestyle{main}{
  \fancyhf{}
  \fancyhead[C]{\zihao{-5}\songti 暨南大学本科毕业论文（设计）}
  \fancyfoot[C]{\zihao{-4}\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\zihao{-4}\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

\fancypagestyle{empty}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\pagestyle{main}

%% ============================================================================
%%  Heading Formatting
%% ============================================================================

\ctexset{
  chapter/name = {,},
  chapter/number = \arabic{chapter},
  chapter/format = \xiaosan\heiti\bfseries\raggedright,
  chapter/beforeskip = 20pt,
  chapter/afterskip = 20pt,
  chapter/aftername = \quad,
  chapter/pagestyle = plain,
  %
  section/name = {,},
  section/format = \zihao{4}\heiti\bfseries\raggedright,
  section/beforeskip = 10pt,
  section/afterskip = 10pt,
  section/aftername = \quad,
  %
  subsection/name = {,},
  subsection/format = \zihao{4}\heiti\raggedright,
  subsection/beforeskip = 10pt,
  subsection/afterskip = 10pt,
  subsection/aftername = \quad,
  %
  subsubsection/name = {,},
  subsubsection/format = \zihao{4}\raggedright,
  subsubsection/beforeskip = 10pt,
  subsubsection/afterskip = 10pt,
  subsubsection/aftername = \quad,
}

\ifjnu@numbering@chinese
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
%%  Table of Contents Formatting
%% ============================================================================

\setcounter{tocdepth}{\ifjnu@toc@four 3\else 2\fi}

\titlecontents{chapter}
  [0em]
  {\zihao{4}\heiti\bfseries}
  {\contentslabel{1em}}
  {\hspace*{-1em}}
  {\titlerule*[5pt]{$\cdot$}\contentspage}
  [\addvspace{3pt}]

\titlecontents{section}
  [2.4em]
  {\zihao{-4}\songti}
  {\contentslabel{1.8em}}
  {\hspace*{-1.8em}}
  {\titlerule*[5pt]{$\cdot$}\contentspage}

\titlecontents{subsection}
  [4.6em]
  {\zihao{5}\songti}
  {\contentslabel{2.6em}}
  {\hspace*{-2.6em}}
  {\titlerule*[5pt]{$\cdot$}\contentspage}

\titlecontents{subsubsection}
  [6.4em]
  {\zihao{5}\songti}
  {\contentslabel{3.4em}}
  {\hspace*{-3.4em}}
  {\titlerule*[5pt]{$\cdot$}\contentspage}

%% ============================================================================
%%  Caption Configuration
%% ============================================================================

\captionsetup{
  font={small},
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
%%  Metadata Commands
%% ============================================================================

\newcommand{\biaoti}[1]{\gdef\@biaoti{#1}}
\biaoti{在此处键入论文题目}

\newcommand{\entitle}[1]{\gdef\@entitle{#1}}
\entitle{Type Your English Thesis Title Here}

\newcommand{\xueyuan}[1]{\gdef\@xueyuan{#1}}
\xueyuan{}

\newcommand{\xuexi}[1]{\gdef\@xuexi{#1}}
\xuexi{}

\newcommand{\zhuanye}[1]{\gdef\@zhuanye{#1}}
\zhuanye{}

\newcommand{\xingming}[1]{\gdef\@xingming{#1}}
\xingming{}

\newcommand{\xuehao}[1]{\gdef\@xuehao{#1}}
\xuehao{}

\newcommand{\daoshi}[1]{\gdef\@daoshi{#1}}
\daoshi{}

\newcommand{\thesisyear}[1]{\gdef\@thesisyear{#1}}
\newcommand{\thesismonth}[1]{\gdef\@thesismonth{#1}}
\newcommand{\thesisday}[1]{\gdef\@thesisday{#1}}
\thesisyear{\the\year}
\thesismonth{\the\month}
\thesisday{\the\day}

\newcommand{\thesisdate}[3]{%
  \thesisyear{#1}\thesismonth{#2}\thesisday{#3}%
}

%% ============================================================================
%%  Cover Page
%% ============================================================================

\newcommand{\makecover}{%
  \thispagestyle{empty}
  \begin{titlepage}
    \begin{center}
      \IfFileExists{figs/jnu-logo.png}{%
        \includegraphics[width=4cm]{figs/jnu-logo.png}
      }{%
        \vspace{2cm}
        \textbf{[University Logo -- Place figs/jnu-logo.png]}
      }

      \vspace{1.5cm}

      {\xiaochu\heiti 本科生毕业论文}

      \vspace{3cm}

      \begin{flushleft}
        \hspace{2em}%
        {\zihao{-2}\heiti\bfseries 论文题目}%
        \hspace{1em}%
        \CJKunderline{\hspace{8cm}}%
      \end{flushleft}

      \vspace{0.8cm}

      \begin{flushleft}
        \zihao{4}\songti\bfseries
        \begin{tabular}{@{}p{2cm}p{5cm}p{2cm}p{5cm}@{}}
          学\hfill 院 & \CJKunderline{\makebox[5cm]{\hfill\@xueyuan\hfill}} &
          学\hfill 系 & \CJKunderline{\makebox[5cm]{\hfill\@xuexi\hfill}} \\
          \\[0.5cm]
          专\hfill 业 & \CJKunderline{\makebox[5cm]{\hfill\@zhuanye\hfill}} & & \\
          \\[0.5cm]
          姓\hfill 名 & \CJKunderline{\makebox[5cm]{\hfill\@xingming\hfill}} &
          学\hfill 号 & \CJKunderline{\makebox[5cm]{\hfill\@xuehao\hfill}} \\
          \\[0.5cm]
          指导教师 & \CJKunderline{\makebox[5cm]{\hfill\@daoshi\hfill}} & & \\
        \end{tabular}
      \end{flushleft}

      \vspace{3cm}

      {\zihao{4}\songti\bfseries
       \@thesisyear \hspace{1em} 年
       \hspace{2em} \@thesismonth \hspace{1em} 月
       \hspace{2em} \@thesisday \hspace{1em} 日}

      \vspace{1cm}

      \IfFileExists{figs/jnu-name.png}{%
        \includegraphics[width=6cm]{figs/jnu-name.png}
      }{}

    \end{center}
  \end{titlepage}
  \clearpage
}

%% ============================================================================
%%  Academic Honesty Statement (诚信声明)
%% ============================================================================

\newcommand{\makestatement}{%
  \thispagestyle{empty}
  \vspace*{2cm}
  \begin{center}
    {\erhao\heiti 诚\hspace{2em}信\hspace{2em}声\hspace{2em}明}
  \end{center}
  \vspace{2cm}
  \par
  {\zihao{-3}\songti
    我声明，所呈交的毕业论文（设计）是本人在老师指导下进行的研究工作及取得的研究成果。除文中已经注明引用的内容外，本论文（设计）不包含任何其他个人或集体已经发表或撰写过的作品成果。在论文（设计）撰写过程中，本人严格遵守学术道德和学术规范，恪守学术诚信，对毕业论文（设计）的原创性、真实性负责。
  }
  \vspace{3cm}
  \par
  {\zihao{-3}\songti
    签名：\hspace{5cm}
    日期：\hspace{2em}\hspace{0.5cm}年\hspace{1.5cm}月\hspace{1.5cm}日
  }
  \clearpage
}

%% ============================================================================
%%  Chinese Abstract Environment
%% ============================================================================

\newenvironment{zhabstract}{%
  \chapter*{摘\hspace{2em}要}
  \addcontentsline{toc}{chapter}{摘要}
  \thispagestyle{plain}
  \vspace{1em}
  \par
  \setlength{\parindent}{2em}
  \zihao{4}\songti
}{%
  \par
}

\newcommand{\zhaiyao}[1]{%
  \vspace{1em}
  \par
  \noindent
  {\heiti\bfseries [关键词]} \hspace{0.5em} #1
}

%% ============================================================================
%%  English Abstract Environment
%% ============================================================================

\newenvironment{enabstract}{%
  \chapter*{\textbf{Abstract}}
  \addcontentsline{toc}{chapter}{Abstract}
  \thispagestyle{plain}
  \vspace{1em}
  \par
  \setlength{\parindent}{2em}
  \zihao{4}
}{%
  \par
}

\newcommand{\enkeywords}[1]{%
  \vspace{1em}
  \par
  \noindent
  {\textbf{Keywords:}} \hspace{0.5em} #1
}

%% ============================================================================
%%  Bibliography Configuration
%% ============================================================================

\IfFileExists{biblatex-gb7714-2015.bbx}{%
  \RequirePackage[backend=biber,style=gb7714-2015,sorting=none]{biblatex}
  \newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
}{%
  \IfFileExists{biblatex.sty}{%
    \RequirePackage[backend=biber,style=numeric,sorting=none]{biblatex}
    \newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
  }{%
    \RequirePackage[numbers,sort&compress]{natbib}
    \newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
    \bibliographystyle{unsrt}
  }
}

%% ============================================================================
%%  Appendix Configuration
%% ============================================================================

\ctexset{
  appendix/name = {附录},
  appendix/number = \Alph{chapter},
}

%% ============================================================================
%%  Other Utility Commands
%% ============================================================================

\DeclareMathOperator{\Corr}{Corr}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\grad}{grad}

\newcommand{\diff}{\mathop{}\!\mathrm{d}}

%% ============================================================================
%%  Load Local Configuration (if exists)
%% ============================================================================

\InputIfFileExists{jnuthesis.cfg}{%
  \typeout{Loading local jnuthesis.cfg configuration}%
}{}

\endinput
