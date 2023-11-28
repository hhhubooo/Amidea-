\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{amidea}




\LoadClass{ctexbook}


% \RequirePackage{ctex}
\RequirePackage{eso-pic}
\RequirePackage{datetime2}
\RequirePackage{mathrsfs}
% \RequirePackage{fourier}%使用数学字体是fourier
% \RequirePackage{xeCJK}
% \RequirePackage{xeCJKfntef}
% \RequirePackage{fontspec}
\RequirePackage{fontawesome5}
\RequirePackage{tikz}
\RequirePackage[hidelinks]{hyperref}
% \RequirePackage{cleveref}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage{caption}
\RequirePackage{mathtools}
\RequirePackage{adjustbox}
\RequirePackage{bm}
\RequirePackage{changepage}
\RequirePackage{tasks}





\RequirePackage[a4paper,margin=2.5cm]{geometry}

\RequirePackage{xcolor}
\DeclareOption{black}{
    \definecolor{maincolor}{RGB}{0,0,0}
    \definecolor{definecolor}{RGB}{0,0,0}
    \definecolor{theoremcolor}{RGB}{0,0,0}
    \definecolor{propositioncolor}{RGB}{0,0,0}
    \definecolor{proofcolor}{RGB}{0,0,0}
}
\DeclareOption{blue}{
    \definecolor{maincolor}{RGB}{0,90,255}
    \definecolor{definecolor}{RGB}{17, 153, 88}
    \definecolor{theoremcolor}{RGB}{255,0,0}
    \definecolor{propositioncolor}{RGB}{16, 145, 238}
    \definecolor{proofcolor}{RGB}{255, 119, 0}
}
\DeclareOption{red}{
    \definecolor{maincolor}{RGB}{255,0,0}
    \definecolor{definecolor}{RGB}{17, 153, 88}
    \definecolor{theoremcolor}{RGB}{255,0,0}
    \definecolor{propositioncolor}{RGB}{16, 145, 238}
    \definecolor{proofcolor}{RGB}{255, 119, 0}
}
\DeclareOption{orange}{
    \definecolor{maincolor}{RGB}{255,102,0}
    \definecolor{definecolor}{RGB}{17, 153, 88}
    \definecolor{theoremcolor}{RGB}{255,0,0}
    \definecolor{propositioncolor}{RGB}{16, 145, 238}
    \definecolor{proofcolor}{RGB}{255, 119, 0}
}
\ProcessOptions\relax



\makeatletter
\renewcommand\tableofcontents{
    \pagestyle{empty}
    \section*{\contentsname
        \@mkboth{
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
    \@starttoc{toc}
    \newpage
    \pagestyle{plain}
    }
\makeatother

%%调整行间公式上下间距
\AtBeginDocument{
\setlength{\abovedisplayskip}{6pt}
\setlength{\belowdisplayskip}{6pt}
}

%%自定义封面
\renewcommand{\title}[1]{\def\title{#1}}
\renewcommand{\author}[1]{
    \ifstrempty{#1}{
        \def\authorname{}
    }{
        \def\authorname{{\large\textcolor{maincolor}{\raisebox{-1pt}{\faBuffer}}\hspace{7pt}{\bf Author}\::\ \;}\textsf{#1}}
        }
}
\renewcommand{\date}[1]{
    \ifstrempty{#1}{
        \def\datename{}
    }{
        \def\datename{{\large\textcolor{maincolor}{\raisebox{0pt}{\faCalendar*[regular]}}\hspace{7pt}{\bf Date}\::\ \;}\textsf{#1}}
        }
}
\newcommand{\subtitle}[1]{
    \ifstrempty{#1}{
        \def\subtitle{}
    }{
        \def\subtitle{#1}}
}

\renewcommand{\maketitle}{
    \pagecolor{maincolor!0}
    \thispagestyle{empty}
    \vspace*{100pt}

    \hspace*{9pt}{\Huge\bf\textcolor{maincolor}{\raisebox{-5pt}{\rule{7pt}{26pt}}}\;\title}\par
    \vspace*{30pt}
    \hspace*{\fill}\hspace*{42pt}{\large\it\color{gray}\subtitle}\par
    \vspace*{15pt}
    \hspace*{4pt}{\large\fangsong\;{\authorname}}\par
    \vspace*{15pt}
    \hspace*{4pt}{\large\fangsong\;{\datename}}\par
    \vfill
    \thispagestyle{empty}
    \newpage
    \nopagecolor
}

%%自定义页眉格式
\fancypagestyle{mystyle}{
    \fancyhf{} %清空页眉和页脚的设置
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrule}{\color{maincolor!70}\hrule width\headwidth height 0pt}
    \raggedbottom
}
\pagestyle{mystyle}



%%%自定义章节
\RequirePackage{titlesec}
%%自定义chapter
\titleformat{\chapter}[hang]
    {\LARGE\filcenter\bf\color{maincolor}}
    {第\chinese{chapter} 章}
    {15pt}
    {}
    []

%%自定义section
\titleformat{\section}[block]
    {\Large\bfseries\color{maincolor}}
    {\S\,\thesection}
    {8pt}
    {}
    []

%%自定义subsection
\titleformat{\subsection}[block]
    {\large\bfseries\color{maincolor}}
    {\thesubsection}
    {8pt}
    {}
    []

%%自定义subsubsection
\titleformat{\subsubsection}[block]
    {\large\bfseries\color{maincolor}}
    {\thesubsubsection}
    {5pt}
    {}
    []

%%自定义paragraph
\titleformat{\paragraph}[runin]
{\bfseries\color{maincolor}}
    {}
    {5pt}
    {}
    []

%%%自定义定理样式
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{tcolorbox}


%% 定理样式环境
\declaretheoremstyle[
    spaceabove=0pt,
    spacebelow=0pt,
    headfont=\color{theoremcolor}\bfseries,
    notefont=\color{theoremcolor},
    bodyfont=\normalfont,
    notebraces={\color{theoremcolor}(}{\color{theoremcolor})},
    postheadspace=5pt,
    headpunct= ,
    headindent=0pt
]{thmsty}

\declaretheorem[
    within=chapter,
    style=thmsty,
    preheadhook={\begin{tcolorbox}
    [toprule=0pt,%设置上边框粗细
    leftrule=1.5pt,%设置左边框粗细
    rightrule=0pt,%设置右边框粗细
    bottomrule=0pt,%设置下边框粗细
    arc=0pt,%设置角度
    colback=theoremcolor!2,%背景颜色
    colframe=theoremcolor,%边框颜色
    left=3pt,%内部文本到左侧边框距离
    top=3pt,%内部文本到上侧边框距离
    bottom=5pt,%内部文本到下侧边框距离
    right=3pt%内部文本到右侧边框距离
    ]},
    postfoothook={\end{tcolorbox}}
]{theorem,lemma,corollary,axiom}

%% 定义样式环境
\declaretheoremstyle[
    spaceabove=0pt,
    spacebelow=0pt,
    headfont=\color{definecolor}\bfseries,
    notefont=\color{definecolor},
    bodyfont=\normalfont,
    notebraces={\color{definecolor}(}{\color{definecolor})},
    postheadspace=5pt,
    headpunct= ,
    headindent=0pt
]{defsty}

\declaretheorem[
    within=chapter,
    style=defsty,
    preheadhook={\begin{tcolorbox}
    [toprule=0pt,%设置上边框粗细
    leftrule=1.5pt,%设置左边框粗细
    rightrule=0pt,%设置右边框粗细
    bottomrule=0pt,%设置下边框粗细
    arc=0pt,%设置角度
    colback=definecolor!2,%背景颜色
    colframe=definecolor,%边框颜色
    left=3pt,%内部文本到左侧边框距离
    top=3pt,%内部文本到上侧边框距离
    bottom=5pt,%内部文本到下侧边框距离
    right=3pt%内部文本到右侧边框距离
    ]},
    postfoothook={\end{tcolorbox}}
]{definition}

%% 命题样式环境
\declaretheoremstyle[
    within=chapter,
    spaceabove=0pt,
    spacebelow=0pt,
    headfont=\color{propositioncolor}\bfseries,
    notefont=\color{propositioncolor},
    bodyfont=\normalfont,
    notebraces={\color{propositioncolor}(}{\color{propositioncolor})},
    postheadspace=5pt,
    headpunct= ,
    headindent=0pt
]{prosty}

\declaretheorem[
    % within=chapter,
    style=prosty,
    preheadhook={\begin{tcolorbox}
    [toprule=0pt,%设置上边框粗细
    leftrule=1.5pt,%设置左边框粗细
    rightrule=0pt,%设置右边框粗细
    bottomrule=0pt,%设置下边框粗细
    arc=0pt,%设置角度
    colback=propositioncolor!2,%背景颜色
    colframe=propositioncolor,%边框颜色
    left=3pt,%内部文本到左侧边框距离
    top=3pt,%内部文本到上侧边框距离
    bottom=5pt,%内部文本到下侧边框距离
    right=3pt%内部文本到右侧边框距离
    ]},
    postfoothook={\end{tcolorbox}}
]{proposition,property}

%% 问题样式环境
\newtheoremstyle{defsty}
  {0pt}
  {0pt}
  {\normalfont}
  {}
  {\bfseries\color{definecolor}}
  {}
  {.5em}
  {\noindent\thmname{#1}\thmnumber{#2}\thmnote{ (#3)}}
  
\theoremstyle{defsty}
\newtheorem{example}{Example}[chapter]
\newtheorem{question}{Question}

%% 定义样无序号环境
\newtheoremstyle{nonumsty}
  {0pt}
  {0pt}
  {\normalfont}
  {}
  {\bfseries\color{definecolor}}
  {}
  {.5em}
  {\noindent\heiti\thmname{#1}\thmnote{ (#3)}}



%%解环境
\newenvironment{solution}{
    \par\noindent
    \textbf{\textcolor{white}{\colorbox{proofcolor}{Solution}}}
    \fangsong
}
{
    \mbox{}\hspace*{\fill}\(\textcolor{proofcolor}{\square}\)
    \vspace{0pt}
    \par
}
%%证明环境
\renewenvironment{proof}{
    \par\noindent
    \textbf{\textcolor{white}{\colorbox{proofcolor}{Proof}}}
    \fangsong
}
{
    \hspace*{\fill}\(\textcolor{proofcolor}{\blacksquare}\)
    \vspace{0pt}
    \par
}
%%注环境
\newenvironment{remark}{
    \par\noindent
    \textit{\textcolor{maincolor}{{\small\faReact}\;\normalfont{Remark}}}
    \it
}{
    \par
}
%%笔记环境
\newenvironment{note}{
    \par\noindent
    \textit{\textcolor{proofcolor}{{\small\faPencil*}\;\normalfont{Notes}}}\ 
    \it
}{
    \par
}
%%技巧环境
\newenvironment{tips}{
    \par\noindent
    \textit{\textcolor{theoremcolor}{{\small\faMagic}\;\normalfont{Tips}}}\ 
    \it
}{
    \par
}

%%%定义列表
\RequirePackage{enumerate}
\RequirePackage{enumitem}

%自定义enumerate
\setlist[enumerate,1]{
    label=\color{maincolor}\arabic*.,
    itemsep=-4pt,
    topsep=0pt
}
\setlist[enumerate,2]{
    label=\color{maincolor}(\alph*).,
    itemsep=-4pt
}
\setlist[enumerate,3]{
    label=\color{maincolor}\Roman*.,
    itemsep=-4pt
}
\setlist[enumerate,4]{
    label=\color{maincolor}\Alph*.,
    itemsep=-4pt
}
\setlist[itemize,1]{
    label=\color{maincolor}$\bullet$,
    itemsep=-4pt,
    topsep=0pt
}
\setlist[itemize,2]{
    label=\color{maincolor}$\circ$,
    itemsep=-4pt
}
\setlist[itemize,3]{
    label=\color{maincolor}$\ast$,
    itemsep=-4pt
}
%%步骤enum环境
\newlist{step}{enumerate}{1}
\setlist[step,1]{
    label=\textcolor{maincolor}{\bf\textcolor{maincolor}{Step\arabic*}},
    left=0pt,
    topsep=0pt,
    itemsep=-4pt
}


%%%定制code
\RequirePackage{listings}
\setmonofont{Fira Code}
\lstset{
	basicstyle=\small\ttfamily,
		keywordstyle=\color{blue},
		commentstyle=\color{gray!50!black!50},
		stringstyle=\rmfamily\slshape\color{red},
	backgroundcolor=\color{maincolor!5},
	frame=single,
	framerule=0pt,
		rulecolor=\color{maincolor!50},
	numbers=left,
		numberstyle=\sf\footnotesize\color{maincolor},
		firstnumber=1,
		stepnumber=1,
		numbersep=7pt,
	aboveskip=1em,
	showspaces=false,
	showstringspaces=false,
	keepspaces=true, 					
	showtabs=false,
	tabsize=4,
	captionpos=b,
	flexiblecolumns=true,%
	breaklines=true,
	breakatwhitespace=false,
	breakautoindent=true,
	breakindent=1em,
	title=\lstname,
	escapeinside=``,
	xleftmargin=3em,  xrightmargin=3em,
	aboveskip=1ex, belowskip=-25pt,
	framextopmargin=1pt, framexbottommargin=1pt,
        abovecaptionskip=-2pt,belowcaptionskip=3pt,
	extendedchars=false, columns=flexible, mathescape=true,
	texcl=true,
	fontadjust
}%

% \AtBeginDocument{\setcounter{page}{0}}



%%自己的符号
\newcommand{\dd}{\mathrm{d}}
\newcommand{\ee}{\mathrm{e}}
\newcommand{\ii}{\mathrm{i}}
\newcommand{\Le}{\leqslant}
\newcommand{\Ge}{\geqslant}
\newcommand{\dps}{\displaystyle}
\newcommand{\abv}[1]{\left|#1\right|}


%%自己的小样式
\renewcommand{\cal}[1]{\mathcal{#1}}
\newcommand{\bb}[1]{\mathbb{#1}}
\newcommand{\bfh}[1]{\textcolor{maincolor}{\textbf{#1}}}%粗体强调

% \definecolor{Yellow}{RGB}{255,255,0}
% \newcommand{\hly}[1]{
%     \CJKsout*[thickness=2.5ex, format=\color{yellow}]{#1}
% }%底色黄色高亮
% \newcommand{\hlb}[1]{
    % \CJKunderanyline*{0.5ex}{\color{blue}\rule{2pt}{2.5ex}}{#1}
% }%底色蓝色高亮



\newcommand{\bs}[1]{\boldsymbol{#1}}
\newcommand{\Step}{\hspace*{\fill}}
\newcommand{\defequ}{\overset{\rm def}{=}}

\endinput