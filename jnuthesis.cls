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
%
% Priority of font matching quality for Word template:
%   1. fontset=windows → uses system SimSun/SimHei (Word-identical on Windows)
%   2. fontset=bundled → uses fonts/ directory files (Word-identical on any OS)
%   3. fontset=mac     → uses Songti SC/Heiti SC (close macOS approximation)
%   4. fontset=fandol  → cross-platform fallback (different look, always works)
%
% NOTE: Word "宋体加粗" = SimSun with fake bold (NOT SimHei).
%       Word "黑体" = SimHei (a different font, used for headings).
%       ctex default maps SimSun BoldFont→SimHei which is WRONG for body text.
%       We use AutoFakeBold for SimSun to match Word behavior exactly.

\def\jnu@fontset@load{\jnu@fontset@auto}

% --- Auto: choose the closest locally available Word-compatible font set ---
\newcommand{\jnu@fontset@auto}{%
  \IfFontExistsTF{Songti SC}{%
    \setCJKmainfont{Songti SC}[AutoFakeBold=2.5]%
    \setCJKsansfont{Heiti SC}[AutoFakeBold=2.5]%
    \setCJKmonofont{STFangsong}%
    \setCJKfamilyfont{zhsong}{Songti SC}[AutoFakeBold=2.5]%
    \setCJKfamilyfont{zhhei}{Heiti SC}[AutoFakeBold=2.5]%
    \setCJKfamilyfont{zhkai}{Kaiti SC}%
    \setCJKfamilyfont{zhfs}{STFangsong}%
  }{%
    \IfFontExistsTF{Noto Serif CJK SC}{%
      \setCJKmainfont{Noto Serif CJK SC}[AutoFakeBold=2.5]%
      \setCJKsansfont{Noto Sans CJK SC}%
      \setCJKmonofont{Noto Sans CJK SC}%
      \setCJKfamilyfont{zhsong}{Noto Serif CJK SC}[AutoFakeBold=2.5]%
      \setCJKfamilyfont{zhhei}{Noto Sans CJK SC}%
      \setCJKfamilyfont{zhkai}{Noto Serif CJK SC}%
      \setCJKfamilyfont{zhfs}{Noto Serif CJK SC}%
    }{%
      \setCJKmainfont{FandolSong-Regular.otf}[AutoFakeBold=2.5]%
      \setCJKsansfont{FandolHei-Regular.otf}[AutoFakeBold=2.5]%
      \setCJKmonofont{FandolFang-Regular.otf}%
      \setCJKfamilyfont{zhsong}{FandolSong-Regular.otf}[AutoFakeBold=2.5]%
      \setCJKfamilyfont{zhhei}{FandolHei-Regular.otf}[AutoFakeBold=2.5]%
      \setCJKfamilyfont{zhkai}{FandolKai-Regular.otf}%
      \setCJKfamilyfont{zhfs}{FandolFang-Regular.otf}%
    }%
  }%
}

\DeclareOption{fontset=auto}{\def\jnu@fontset@load{\jnu@fontset@auto}}

% --- Fandol: TeX Live default (works everywhere, looks different from Word) ---
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

% --- Windows: uses actual SimSun/SimHei (Word-identical) ---
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

% --- macOS: uses Songti SC/Heiti SC (close approximation) ---
\DeclareOption{fontset=mac}{%
  \def\jnu@fontset@load{%
    \setCJKmainfont{Songti SC}[AutoFakeBold=2.5]%
    \setCJKsansfont{Heiti SC}[AutoFakeBold=2.5]%
    \setCJKmonofont{STFangsong}%
    \setCJKfamilyfont{zhsong}{Songti SC}[AutoFakeBold=2.5]%
    \setCJKfamilyfont{zhhei}{Heiti SC}[AutoFakeBold=2.5]%
    \setCJKfamilyfont{zhkai}{Kaiti SC}%
    \setCJKfamilyfont{zhfs}{STFangsong}%
  }%
}

% --- Bundled: loads fonts from fonts/ dir by FILENAME (Overleaf/portable) ---
% Place simsun.ttc, simhei.ttf, simkai.ttf, simfang.ttf in fonts/ directory.
% This gives Word-identical output on ANY platform, including Overleaf.
\DeclareOption{fontset=bundled}{%
  \def\jnu@fontset@load{%
    \setCJKmainfont{simsun.ttc}[AutoFakeBold=2.5,Path=fonts/]%
    \setCJKsansfont{simhei.ttf}[Path=fonts/]%
    \setCJKmonofont{simfang.ttf}[Path=fonts/]%
    \setCJKfamilyfont{zhsong}{simsun.ttc}[AutoFakeBold=2.5,Path=fonts/]%
    \setCJKfamilyfont{zhhei}{simhei.ttf}[Path=fonts/]%
    \setCJKfamilyfont{zhkai}{simkai.ttf}[Path=fonts/]%
    \setCJKfamilyfont{zhfs}{simfang.ttf}[Path=fonts/]%
  }%
}

% --- Ubuntu/Debian: Noto CJK fonts ---
\DeclareOption{fontset=ubuntu}{%
  \def\jnu@fontset@load{%
    \setCJKmainfont{Noto Serif CJK SC}[AutoFakeBold=2.5,BoldFont=Noto Sans CJK SC]%
    \setCJKsansfont{Noto Sans CJK SC}%
    \setCJKmonofont{Noto Sans CJK SC}%
    \setCJKfamilyfont{zhsong}{Noto Serif CJK SC}[AutoFakeBold=2.5]%
    \setCJKfamilyfont{zhhei}{Noto Sans CJK SC}%
    \setCJKfamilyfont{zhkai}{Noto Serif CJK SC}%
    \setCJKfamilyfont{zhfs}{Noto Serif CJK SC}%
  }%
}

% --- Source Han: cross-platform open source alternative ---
\DeclareOption{fontset=sourcehan}{%
  \def\jnu@fontset@load{%
    \setCJKmainfont{Source Han Serif SC}[AutoFakeBold=2.5,BoldFont=Source Han Sans SC]%
    \setCJKsansfont{Source Han Sans SC}%
    \setCJKmonofont{Source Han Sans SC}%
    \setCJKfamilyfont{zhsong}{Source Han Serif SC}[AutoFakeBold=2.5]%
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
  hidelinks,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfstartview=FitH,
  unicode=true,
  breaklinks=true,
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

\newcommand{\sizecover}{\fontsize{36pt}{44pt}\selectfont}     % 小初号
\newcommand{\sizestatement}{\fontsize{22pt}{28pt}\selectfont}  % 二号
\newcommand{\sizetitle}{\fontsize{18pt}{24pt}\selectfont}      % 小二号
\newcommand{\sizechap}{\fontsize{15pt}{20pt}\selectfont}       % 小三号
\newcommand{\sizefront}{\fontsize{15pt}{21pt}\selectfont}      % 小三号正文
\newcommand{\sizebody}{\fontsize{14pt}{20pt}\selectfont}       % 四号
\newcommand{\sizetocsec}{\fontsize{12pt}{18pt}\selectfont}     % 小四号
\newcommand{\sizecaption}{\fontsize{10.5pt}{15pt}\selectfont}  % 五号
\newcommand{\sizeheader}{\fontsize{9pt}{12pt}\selectfont}      % 小五号

% Ensure body starts at 四号 (14pt) 宋体
\AtBeginDocument{\zihao{4}\songti\setstretch{1}}

% Keep displayed equations close to the surrounding body text.
\AtBeginDocument{%
  \setlength{\abovedisplayskip}{4pt plus 1pt minus 2pt}%
  \setlength{\belowdisplayskip}{4pt plus 1pt minus 2pt}%
  \setlength{\abovedisplayshortskip}{2pt plus 1pt minus 1pt}%
  \setlength{\belowdisplayshortskip}{2pt plus 1pt minus 1pt}%
}

%% ============================================================================
%%  Paragraph spacing
%% ============================================================================

\setlength{\parindent}{2em}
\setlength{\parskip}{0pt plus 0pt minus 0pt}

% Compact list spacing follows the older JNU templates while preserving
% local overrides such as publication lists with [1], [2], ...
\setlist{nosep}
\setlist[enumerate,1]{label={（\arabic*）},left=2em,labelsep=0.5em}
\setlist[itemize]{left=2em,labelsep=0.5em}

%% ============================================================================
%%  Page styles (headers and footers)
%% ============================================================================

\fancypagestyle{jnu-main}{%
  \fancyhf{}%
  \fancyhead[C]{\sizeheader\songti \@biaoti}%
  \fancyfoot[C]{\sizetocsec\thepage}%
  \renewcommand{\headrulewidth}{0.4pt}%
}

\fancypagestyle{jnu-front}{%
  \fancyhf{}%
  \fancyhead[C]{\sizeheader\songti 暨南大学本科毕业论文（设计）}%
  \renewcommand{\headrulewidth}{0.4pt}%
  \renewcommand{\footrulewidth}{0pt}%
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

\pagestyle{jnu-empty}

% Official Word pages keep the running header on chapter-opening pages.
\ctexset{chapter/pagestyle=jnu-main}

%% ============================================================================
%%  Heading formatting (matching Word template)
%% ============================================================================

% Common settings
\ctexset{
  chapter/name = {,},
  chapter/number = \arabic{chapter},
  chapter/format = \sizechap\heiti\bfseries\raggedright,
  chapter/beforeskip = 6pt,
  chapter/afterskip = 6pt,
  chapter/aftername = \quad,
  %
  section/name = {,},
  section/format = \sizebody\heiti\bfseries\raggedright,
  section/beforeskip = 3pt,
  section/afterskip = 3pt,
  section/aftername = \quad,
  section/indent = 0em,
  %
  subsection/name = {,},
  subsection/format = \sizebody\heiti\bfseries\raggedright,
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

\setcounter{secnumdepth}{3}
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

\renewcommand{\tableofcontents}{%
  \clearpage
  \thispagestyle{jnu-empty}%
  \begin{center}
    {\sizetitle\songti\bfseries 目\hspace{2em}录}
  \end{center}
  \vspace{1em}
  \@starttoc{toc}%
  \clearpage
}

%% ============================================================================
%%  Captions (table/figure)
%% ============================================================================

\DeclareCaptionFont{jnucaption}{\sizecaption\songti}
\captionsetup{
  font=jnucaption,
  labelfont=jnucaption,
  labelsep=space,
  justification=centering,
  format=plain,
  skip=6pt,
}

\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
\numberwithin{equation}{chapter}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

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
\thesisyear{}
\thesismonth{}
\thesisday{}

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

\newcommand{\jnu@coverfield}[3]{%
  {\sizebody\songti\bfseries\makebox[22mm][s]{#1}}%
  \hspace{2mm}%
  {\sizebody\songti\CJKunderline{\makebox[#2][c]{#3}}}%
}

\newcommand{\jnu@rendercover}{%
  \thispagestyle{jnu-empty}
  \begin{titlepage}
    \begin{tikzpicture}[remember picture,overlay]
      \node at ([yshift=-48mm]current page.north) {%
        \IfFileExists{figs/jnu-logo.png}{\includegraphics[width=35mm]{figs/jnu-logo.png}}{}%
      };
      \node at ([yshift=-88mm]current page.north) {%
        \IfFileExists{figs/jnu-name.png}{\includegraphics[width=116mm]{figs/jnu-name.png}}{}%
      };
      \node at ([yshift=-113mm]current page.north) {{\sizecover\heiti 本科生毕业论文}};

      \node[anchor=west] at ([xshift=31.75mm,yshift=-151mm]current page.north west)
        {\jnu@coverfield{论文题目}{121mm}{\jnu@cover@biaoti}};
      \node[anchor=west] at ([xshift=31.75mm,yshift=-178mm]current page.north west)
        {\jnu@coverfield{学\hfill 院}{121mm}{\jnu@cover@xueyuan}};
      \node[anchor=west] at ([xshift=31.75mm,yshift=-191mm]current page.north west)
        {\jnu@coverfield{学\hfill 系}{121mm}{\jnu@cover@xuexi}};
      \node[anchor=west] at ([xshift=31.75mm,yshift=-204mm]current page.north west)
        {\jnu@coverfield{专\hfill 业}{121mm}{\jnu@cover@zhuanye}};
      \node[anchor=west] at ([xshift=31.75mm,yshift=-218mm]current page.north west)
        {\jnu@coverfield{姓\hfill 名}{121mm}{\jnu@cover@xingming}};
      \node[anchor=west] at ([xshift=31.75mm,yshift=-231mm]current page.north west)
        {\jnu@coverfield{学\hfill 号}{121mm}{\jnu@cover@xuehao}};
      \node[anchor=west] at ([xshift=31.75mm,yshift=-244mm]current page.north west)
        {\jnu@coverfield{指导教师}{121mm}{\jnu@cover@daoshi}};
      \node at ([yshift=-257mm]current page.north)
        {{\sizebody\songti\bfseries \jnu@cover@year \hspace{1.8em} 年\hspace{2.4em} \jnu@cover@month \hspace{1.8em} 月\hspace{2.4em} \jnu@cover@day \hspace{1.8em} 日}};
    \end{tikzpicture}%
    \vspace*{\fill}
  \end{titlepage}
}

\newcommand{\makecover}{%
  \begingroup
    \let\jnu@cover@biaoti\@biaoti
    \let\jnu@cover@xueyuan\@xueyuan
    \let\jnu@cover@xuexi\@xuexi
    \let\jnu@cover@zhuanye\@zhuanye
    \let\jnu@cover@xingming\@xingming
    \let\jnu@cover@xuehao\@xuehao
    \let\jnu@cover@daoshi\@daoshi
    \let\jnu@cover@year\@thesisyear
    \let\jnu@cover@month\@thesismonth
    \let\jnu@cover@day\@thesisday
    \jnu@rendercover
  \endgroup
  \clearpage
}

\newcommand{\makeblankcover}{%
  \begingroup
    \def\jnu@cover@biaoti{}%
    \def\jnu@cover@xueyuan{}%
    \def\jnu@cover@xuexi{}%
    \def\jnu@cover@zhuanye{}%
    \def\jnu@cover@xingming{}%
    \def\jnu@cover@xuehao{}%
    \def\jnu@cover@daoshi{}%
    \def\jnu@cover@year{}%
    \def\jnu@cover@month{}%
    \def\jnu@cover@day{}%
    \jnu@rendercover
  \endgroup
  \clearpage
}

%% ============================================================================
%%  Academic honesty statement (诚信声明)
%% ============================================================================

\newcommand{\makestatement}{%
  \thispagestyle{jnu-front}
  \vspace*{20mm}
  \begin{center}
    {\sizestatement\songti\bfseries 诚\hspace{1em}信\hspace{1em}声\hspace{1em}明}
  \end{center}
  \vspace{25mm}
  \par
  {\sizefront\songti\setstretch{1.65}
    我声明，所呈交的毕业论文（设计）是本人在老师指导下进行的研究工作及取得的
    研究成果。除文中已经注明引用的内容外，本论文（设计）不包含任何其他个人或
    集体已经发表或撰写过的作品成果。在论文（设计）撰写过程中，本人严格遵守学
    术道德和学术规范，恪守学术诚信，坚决杜绝任何形式的抄袭、剽窃、伪造、篡改、
    买卖、代写毕业论文等学术不端行为，本人自愿承担因违反上述承诺而产生的后果和责任。
  }
  \vspace{45mm}
  \par
  {\sizefront\songti
    签名：\hspace{38mm}
    日期：\hspace{1.2em}年\hspace{1.2em}月\hspace{1.2em}日
  }
  \clearpage
}

%% ============================================================================
%%  Chinese abstract
%% ============================================================================

\newenvironment{zhabstract}{%
  \thispagestyle{jnu-front}
  \vspace*{8mm}
  \begin{center}
    {\sizetitle\songti\bfseries [\@biaoti]}
  \end{center}
  \vspace{18mm}
  \par
  \sizebody\songti
  \setlength{\parindent}{2em}
  \setstretch{1.65}
  \noindent{\songti\bfseries [摘\hspace{1em}要]}\hspace{0.5em}
}{%
  \par
  \clearpage
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
  \thispagestyle{jnu-front}
  \vspace*{8mm}
  \begin{center}
    {\sizetitle\bfseries [\@entitle]}
  \end{center}
  \vspace{18mm}
  \par
  \sizebody
  \setlength{\parindent}{2em}
  \setstretch{1.65}
  \noindent{\bfseries Abstract:}\hspace{0.5em}
}{%
  \par
  \clearpage
}

\newcommand{\enkeywords}[1]{%
  \vspace{0.5em}
  \par\noindent
  {\bfseries Keywords:} \hspace{0.5em} #1
}

%% ============================================================================
%%  Bibliography
%% ============================================================================

\providecommand{\upcite}[1]{\supercite{#1}}
\defbibheading{bibliography}[\bibname]{%
  \chapter*{#1}%
  \addcontentsline{toc}{chapter}{#1}%
}

\newif\ifjnu@mainmatter
\jnu@mainmatterfalse
\pretocmd{\chapter}{%
  \ifjnu@mainmatter\else
    \clearpage
    \pagenumbering{arabic}%
    \setcounter{page}{1}%
    \pagestyle{jnu-main}%
    \jnu@mainmattertrue
  \fi
}{}{}


%% ============================================================================
%%  Appendix
%% ============================================================================

\ctexset{
  appendix/name = {附录},
  appendix/number = \Alph{chapter},
}

%% ============================================================================
%%  Math utilities (from SolarAscent/JNUThesisTemplate)
%% ============================================================================

% --- Math operators ---
\DeclareMathOperator{\Corr}{\rho}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\grad}{grad}
\DeclareMathOperator{\Prj}{Prj}

% --- Upright differential d ---
\newcommand{\diff}{\mathop{}\!\mathrm{d}}
\newcommand{\dx}{\diff x}
\newcommand{\dy}{\diff y}
\newcommand{\du}{\diff u}
\newcommand{\dv}{\diff v}
\newcommand{\dr}{\diff r}
\newcommand{\ds}{\diff s}
\newcommand{\dt}{\diff t}
\newcommand{\dS}{\diff S}

% --- Smart \d: math mode = differential, text mode = underdot ---
\AtBeginDocument{%
  \let\oldd=\d
  \renewrobustcmd{\d}{\ifbool{mmode}{\diff}{\oldd}}%
}

% --- Mathematical constants ---
\newcommand{\e}{\mathrm{e}}
\newcommand{\im}{\mathrm{i}}
\newcommand{\R}{\mathbb{R}}

% --- Vector shortcuts (with \vphantom for consistent arrow height) ---
\newcommand{\va}{\vec{a\vphantom{b}}}
\newcommand{\vb}{\vec{b}}
\newcommand{\vc}{\vec{c\vphantom{b}}}
\newcommand{\vv}{\vec{v\vphantom{b}}}

% --- Limits and integrals ---
\newcommand{\limit}{\lim\limits}
\let\ov=\overrightarrow

% --- Transpose ---
\def\T{\mathrm{T}\kern-.5pt}

% --- Wide fraction (extra horizontal padding) ---
\newrobustcmd{\wfrac}[3][2pt]{%
  {\begingroup\hspace{#1}#2\hspace{#1}\endgroup\over\hspace{#1}#3\hspace{#1}}%
}

% --- Absorb stray paragraph breaks (from SolarAscent) ---
\newcommand\ignorepars{\@ifnextchar\par{\expandafter\ignorepars\@gobble}{}}

%% ============================================================================
%%  Local config
%% ============================================================================

\InputIfFileExists{jnuthesis.cfg}{%
  \typeout{Loading jnuthesis.cfg}%
}{}

\endinput
