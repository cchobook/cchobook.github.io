\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{errata}

\LoadClass[10pt]{article}

\RequirePackage{fontspec}
\RequirePackage[CJKchecksingle, PunctStyle=kaiming]{xeCJK}
\RequirePackage{CJKnumb}

\RequirePackage[intlimits, leqno]{amsmath}
\RequirePackage{amssymb}
\input{font-setup.tex}

\RequirePackage[dvipsnames, svgnames]{xcolor}
\RequirePackage[many]{tcolorbox}
\RequirePackage{hyperref}

\hypersetup{
    linkcolor=BrickRed,
    citecolor=Blue,
    urlcolor=PineGreen,
    linktocpage=true,
    unicode, colorlinks, psdextra, bookmarksnumbered, pdfpagelabels=true
}

\RequirePackage{paralist}
\RequirePackage{siunitx}
\RequirePackage[version=4]{mhchem}
\RequirePackage{float}

\RequirePackage[iso, english]{isodate}

\setlength{\parindent}{2em}

\RequirePackage{zhlineskip}

\RequirePackage{tikz}
\usetikzlibrary{shapes.symbols, positioning, patterns, matrix, calc, math, arrows.meta, decorations.markings}

\newtcbox{\OriginalBox}{
    enhanced,
    nobeforeafter,
    tcbox raise base,
    boxrule=0.4pt,
    arc=0mm,
    top=0mm,
    bottom=0mm,
    right=0mm,
    left=0.5mm,
    right skip=4mm,
    boxsep=2pt,
    colframe=red!70!black,
    coltext=red!60!black,
    colback=yellow!10!white,
    fontupper=\sffamily,
    overlay={
        \coordinate (A) at (frame.north east);
        \coordinate (B) at (frame.south east);
        \coordinate (C) at ($(A)!.5!30:(B)$);
        \fill[color=red!70!black] (A) -- (B) -- (C) --cycle;
    }
}

\newtcbox{\CorrectionBox}{
    enhanced,
    nobeforeafter,
    tcbox raise base,
    boxrule=0.4pt,
    arc=0mm,
    top=0mm,
    bottom=0mm,
    right=0mm,
    left=0.5mm,
    right skip=4mm,
    boxsep=2pt,
    colframe=green!70!black,
    coltext=green!60!black,
    colback=green!10!white,
    fontupper=\sffamily,
    overlay={
        \coordinate (A) at (frame.north east);
        \coordinate (B) at (frame.south east);
        \coordinate (C) at ($(A)!.5!30:(B)$);
        \fill[color=green!70!black] (A) -- (B) -- (C) --cycle;
    }
}

\newcommand{\Orig}{\OriginalBox{原文}}
\newcommand{\Corr}{\;\CorrectionBox{更正}}
\newcommand{\Thx}[1]{\hspace{1em}\hfill\textsf{\footnotesize #1}}

\RequirePackage[backend=biber, style=alphabetic, defernumbers=true, hyperref=auto, backref=true, giveninits=true]{biblatex}

\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\DeclareFieldFormat{postnote}{#1}
\DefineBibliographyStrings{english}{%
    in={刊于},
    editor={主编},
    byeditor={编者为},
    backrefpage={引用于 p.\!},
    backrefpages={引用于 pp.\!},
}

\AtEndPreamble{
    \RequirePackage{microtype}
    \RequirePackage{geometry}
    \geometry{
        paper=b5paper,
        headheight=5ex,
        headsep=5ex,
        textwidth=132mm,
        textheight=198mm
    }

    \RequirePackage{xurl}
    \RequirePackage{lastpage}
    \RequirePackage{fancyhdr}
    \fancypagestyle{plain}{
        \fancyhf{}
        \renewcommand{\headrulewidth}{0pt}
        \cfoot{第 \thepage 页，共 \pageref*{LastPage} 页}
    }
    \pagestyle{plain}

    \renewcommand{\descriptionlabel}[1]{$\diamond$ {\bfseries #1}\hspace{1em}}
    \newcommand{\prob}[1]{\vskip \itemsep $\diamond$ {\bfseries #1}\hspace{1em}}
    \newenvironment{Errata}{%
        \begin{description}%
            }{%
        \end{description}
    }
}
