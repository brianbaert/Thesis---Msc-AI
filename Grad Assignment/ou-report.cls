\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ou-report}[2014/04/02 v0.1 Open Universiteit report class]

\newif\if@dutch
\newif\if@english
\DeclareOption{dutch}{\@dutchtrue\@englishfalse}
\DeclareOption{english}{\@dutchfalse\@englishtrue}
\newif\if@nativefonts
\DeclareOption{nativefonts}{\@nativefontstrue}
\newif\if@print
\DeclareOption{print}{\@printtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{english}
\ProcessOptions\relax

\LoadClass[12pt]{book}
\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{5}

\RequirePackage{amsmath}
\RequirePackage{amssymb}

\if@dutch
    \RequirePackage[dutch]{babel}
\else
    \RequirePackage[dutch,english]{babel}
\fi
\RequirePackage[nooneline,footnotesize]{caption}
\RequirePackage{fancyhdr}
\RequirePackage[flushmargin,hang]{footmisc}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\RequirePackage{metalogo}
\RequirePackage[sort&compress]{natbib}
\RequirePackage{tikz}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{titletoc}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{xcolor}
\RequirePackage{xkeyval}
\RequirePackage{listings}
\RequirePackage[titletoc]{appendix}
\RequirePackage[T1]{fontenc}    % Necessary for pipe symbol  | |  |
\RequirePackage{subfigure}
\RequirePackage{graphics}
\RequirePackage{geometry}
\RequirePackage{adjustbox}
\RequirePackage{wrapfig}
\RequirePackage{tabularx}
\RequirePackage{mdframed}
\RequirePackage{pgfgantt}
\RequirePackage{subcaption}
\usetikzlibrary{decorations,decorations.pathmorphing,arrows,arrows.meta,automata,trees,backgrounds,petri,shapes,shapes.geometric,quotes,fit,positioning,calc}

\ifxetex
    %\RequirePackage[xetex,plainpages=false]{hyperref}
    %\RequirePackage{fontspec}
    \RequirePackage{xltxtra}
    \defaultfontfeatures{Ligatures=TeX}
\else
    \ifpdf
        %\RequirePackage[pdftex,plainpages=false]{hyperref}
    \else
        %\RequirePackage[hypertex,plainpages=false]{hyperref}
    \fi
\fi
\RequirePackage[pagebackref=true,plainpages=false]{hyperref}
\RequirePackage[justification=centering]{caption}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage{fourier}
\RequirePackage{csquotes}
\RequirePackage[acronym]{glossaries}
\ifxetex
    %% If the document is compiled with XeLaTeX, we load the OU house
    %% style fonts: Bookman Old Style (serif) for titles and Tahoma (sans-serif)
    %% for text. Even if the nativefonts option was specified, we need these
    %% fonts for the cover.
    \newfontfamily\ourmfamily[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]{BookmanOldStyle}
    \newfontfamily\ousffamily[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        BoldItalicFont = *-Bold,
        BoldItalicFeatures = FakeSlant
    ]{Tahoma}
\else
    %% If the document is not compiled with XeLaTeX, we need to use the native
    %% fonts.
    \@nativefontstrue
    \newcommand*\ourmfamily{\rmfamily}
    \newcommand*\ousffamily{\sffamily}
\fi



\if@nativefonts
    %% The native font is Utopia Regular with Fourier math. We use Latin Modern
    %% as a fallback, since Utopia lacks support for sans-serif and monospace.
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    \RequirePackage{lmodern}
    \RequirePackage{fourier}
    %% The style for titles is small caps.
    \def\titlefont{\rmfamily}
    \def\titleshape{\scshape}
    \def\titlestyle{\titlefont\titleshape\bfseries}
    \if@print
        \def\headerstyle{\titlefont\titleshape\bfseries}
    \else
        \def\headerstyle{\titlefont\titleshape}
    \fi
\else
    %% Apart from Bookman Old Style and Tahoma, we use Courier New for monospace
    %% and Cambria for math.
    \RequirePackage{unicode-math}
    \setmainfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]{BookmanOldStyle}
    \setsansfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        BoldItalicFont = *-Bold,
        BoldItalicFeatures = FakeSlant
    ]{Tahoma}
    \setmonofont[
        Path = fonts/,
        Extension = .ttf,
        UprightFont = *MT,
        BoldFont = *-BoldMT,
        ItalicFont = *-ItalicMT,
        BoldItalicFont = *-BoldItalicMT
    ]{CourierNewPS}
    \setmathfont[
        Path = fonts/,
        Extension = .ttf
    ]{CambriaMath}
    %% The default style for text is Tahoma (sans-serif).
    \renewcommand*\familydefault{\sfdefault}
    %% The default style for titles is Bookman Old Style (serif).
    \def\titlefont{\rmfamily}
    \def\titleshape{}
    \if@print
        \def\titlestyle{\titlefont\titleshape\bfseries}
    \else
        \def\titlestyle{\titlefont\titleshape}
    \fi
    \def\headerstyle{\titlestyle}
\fi

%% Define the OU house style colors.
\definecolor{ou-cyan}{cmyk}{1,0,0,0}
\definecolor{ou-black}{cmyk}{0,0,0,1}
\definecolor{ou-white}{cmyk}{0,0,0,0}
\definecolor{ou-sea-green}{cmyk}{0.54,0,0.32,0}
\definecolor{ou-green}{cmyk}{1,0.15,0.4,0}
\definecolor{ou-dark-blue}{cmyk}{1,0.66,0,0.4}
\definecolor{ou-purple}{cmyk}{0.98,1,0,0.35}
\definecolor{ou-turquoise}{cmyk}{0.82,0,0.21,0.08}
\definecolor{ou-sky-blue}{cmyk}{0.45,0,0.06,0.06}
\definecolor{ou-lavendel}{cmyk}{0.45,0.2,0,0.07}
\definecolor{ou-orange}{cmyk}{0.02,0.56,0.84,0}
\definecolor{ou-warm-purple}{cmyk}{0.58,1,0,0.02}
\definecolor{ou-fuchsia}{cmyk}{0.19,1,0,0.19}
\definecolor{ou-bright-green}{cmyk}{0.36,0,1,0}
\definecolor{ou-yellow}{cmyk}{0.02,0,0.54,0}

%% Use OU red as the color for titles, unless the 'print' option is
%% specified.
\if@print
    \colorlet{title}{black}
\else
%    \colorlet{title}{ou-cyan}
    \colorlet{title}{red}
\fi

%% We use A4 paper with slightly smaller margins than the default (scale = 0.7).
\geometry{a4paper,hscale=0.75,vscale=0.8}

%% Redefine the title command to accept an optional subtitle.
\renewcommand*\title[2][]{%
    \def\@subtitle{#1}%
    \def\@title{#2}%
    %% Add the title to the PDF meta data.
    \hypersetup{pdftitle=#2}%
}
%% Redefine the author command to add the name to the PDF meta data.
\renewcommand*\author[1]{%
    \def\@author{#1}%
    \hypersetup{pdfauthor=#1}%
}
%% The affiliation is shown in the blue box on the front cover.
\newcommand*\affiliation[1]{\def\@affiliation{#1}}
%% The cover command is used to specify the filename of the optional cover
%% image.
\newcommand*\coverimage[1]{\def\@cover@image{#1}}
%% The covertext command can be used to specify the text printed on the back
%% cover. This text is inserted in a minipage environment and can therefore
%% include line breaks.
\newcommand\covertext[1]{\def\@cover@text{#1}}

%% The cover image is scaled to fill the width of the front cover.
\newlength\@cover@imagewidth
%% The width of the spine if a back cover is present.
\newlength\@cover@spinewidth
\setlength\@cover@spinewidth{0.375in}
%% Width and height of the boxes on the front and back cover.
\newlength\@cover@frontboxwidth
\setlength\@cover@frontboxwidth{4.375in}
\newlength\@cover@frontboxheight
\setlength\@cover@frontboxheight{2.1875in}
\newlength\@cover@fronttextwidth
\newlength\@cover@fronttextheight
\newlength\@cover@backboxwidth
\setlength\@cover@backboxwidth{4.375in}
\newlength\@cover@backboxheight
\setlength\@cover@backboxheight{2.1875in}
\newlength\@cover@backtextwidth
\newlength\@cover@backtextheight
%% Position on the front cover where the corner of both boxes meet.
\newlength\@cover@x
\setlength\@cover@x{0.8125in}
\newlength\@cover@y
\setlength\@cover@y{3in}
%% The margin around text boxes.
\newlength\@cover@margin
\setlength\@cover@margin{12pt}

%% Define the options for the makecover command.
\define@boolkey{cover}{back}[true]{}
\define@boolkey{cover}{nospine}[true]{}
\define@boolkey{cover}{frontbottom}[true]{}
\define@key{cover}{spinewidth}{\setlength\@cover@spinewidth{#1}}
\define@key{cover}{frontboxwidth}{\setlength\@cover@frontboxwidth{#1}}
\define@key{cover}{frontboxheight}{\setlength\@cover@frontboxheight{#1}}
\define@key{cover}{backboxwidth}{\setlength\@cover@backboxwidth{#1}}
\define@key{cover}{backboxheight}{\setlength\@cover@backboxheight{#1}}
\define@key{cover}{x}{\setlength\@cover@x{#1}}
\define@key{cover}{y}{\setlength\@cover@y{#1}}
\define@key{cover}{margin}{\setlength\@cover@margin{#1}}

\newcommand*\makecover[1][]{%
    \setkeys{cover}{#1}%
    %% Create an empty page without margins.
    \clearpage%
    \newgeometry{margin=0pt}%
    \pagecolor{ou-white}%
%    \pagecolor{ou-purple}%
    \thispagestyle{empty}%
    %% We need the this to perform coordinate calculations in TikZ.
    \usetikzlibrary{calc}%
    \begin{tikzpicture}[remember picture,overlay]
        \ifKV@cover@nospine
            \setlength\@cover@spinewidth{0pt}
        \fi
        %% If a back cover is present, stretch the cover image to extend onto
        %% the spine.
        \ifKV@cover@back
            \setlength\@cover@imagewidth{0.5\paperwidth}
            \addtolength\@cover@imagewidth{0.5\@cover@spinewidth}
        \else
            \setlength\@cover@imagewidth{\paperwidth}
        \fi
        %% If a cover image was specified, attach it to the top right of the
        %% front cover.
        \ifx\@cover@image\undefined\else
            \node at (current page.north east)[anchor=north east,inner sep=0pt]{
                \includegraphics[width=\@cover@imagewidth]{\@cover@image}
            };
        \fi
        %% The 'bies' with the Open Universiteit logo is inserted on top of the over
        %% image. If a back cover is present, insert the appropriate image there
        %% as well. To ensure the full bies is visible, we anchor the images to
        %% the bottom of the page.
        \ifKV@cover@back
            \node at (current page.south west)[anchor=south west,inner sep=0pt]{
                %\includegraphics{cover/back}
                \includegraphics[scale=0.7]{cover/OU_Logo_R}
            };
            \node at (current page.south east) [anchor=south east,inner sep=0pt]  {
                %\includegraphics{cover/front}
                \includegraphics[scale=0.7]{cover/OU_Logo_L}
            };
        \else
            \node at (current page.south east)[anchor=south east,inner sep=0pt]{
                \includegraphics[scale=0.7]{cover/OU_Logo_L}
%                \includegraphics{cover/front}
            };
        \fi
        %% Calculate the coordinate of the top left corner of the front cover.
        \ifKV@cover@back
            \coordinate (top left) at ($(current page.north)+(0.5\@cover@spinewidth,0pt)$);
        \else
            \coordinate (top left) at (current page.north west);
        \fi
        \ifKV@cover@back\ifKV@cover@nospine\else
            %% If a back cover is present, calculate the coordinates of the
            %% spine box.
            \coordinate (spine top left) at ($(top left)-(\@cover@spinewidth,0pt)$);
            \coordinate (spine bottom right) at ($(top left)+(0pt,-\@cover@y)$);
            \ifKV@cover@frontbottom
                \coordinate (spine bottom right) at ($(spine bottom right)+(0pt,\@cover@backboxheight)$);
            \fi
            \coordinate (spine bottom center) at ($(spine bottom right)+(-0.5\@cover@spinewidth,0pt)$);
            %% Extend the spine box by 1pt to the left to ensure it completely
            %% covers the cover image.
            \coordinate (spine top left) at ($(spine top left)-(1pt,0pt)$);
            %% Draw a black box on the spine.
            \fill[fill=ou-black](spine top left) rectangle (spine bottom right);
            %% Print the title on the center right of the spine box.
            \node at (spine bottom center)[rotate=-90,anchor=east,inner sep=\@cover@margin]{
                \ourmfamily\color{ou-white}\LARGE\@title
            };
        \fi\fi
        %% Calculate the coordinate of the corner where the front and back boxes
        %% meet.
        \coordinate (corner) at ($(top left)+(\@cover@x,-\@cover@y)$);
        %% Calculate the top left and bottom right coordinates of the front and
        %% back boxes.
        \ifKV@cover@frontbottom
            \coordinate (front top left) at (corner);
            \coordinate (back top left) at ($(corner)+(-\@cover@backboxwidth,\@cover@backboxheight)$);
        \else
            \coordinate (front top left) at ($(corner)+(0pt,\@cover@frontboxheight)$);
            \coordinate (back top left) at ($(corner)+(-\@cover@backboxwidth,0pt)$);
        \fi
        \coordinate (front bottom right) at ($(front top left)+(\@cover@frontboxwidth,-\@cover@frontboxheight)$);
        \coordinate (back bottom right) at ($(back top left)+(\@cover@backboxwidth,-\@cover@backboxheight)$);
        %% Draw the front box in black.
        \fill[fill=ou-black](front top left) rectangle (front bottom right);
        %% Calculate the width and height of the front text box.
        \setlength\@cover@fronttextwidth{\@cover@frontboxwidth}
        \addtolength\@cover@fronttextwidth{-2\@cover@margin}
        \setlength\@cover@fronttextheight{\@cover@frontboxheight}
        \addtolength\@cover@fronttextheight{-2\@cover@margin}
        %% Create the front text box.
        \node at (front top left)[anchor=north west,inner sep=\@cover@margin]{
            \begin{minipage}[t][\@cover@fronttextheight]{\@cover@fronttextwidth}
                %% Print the title and optional subtitle at the top in white.
                \ourmfamily\color{ou-white}\Huge\@title
                \ifx\@subtitle\undefined\else
                    \\
                    \Large\@subtitle
                \fi
                %% Print the author at the bottom in red.
                \vfill
                \color{red}\LARGE\@author
%                \color{ou-cyan}\LARGE\@author
            \end{minipage}
        };
        %% Draw the back box in red.
%        \fill[fill=ou-cyan](back top left) rectangle (back bottom right);
        \fill[fill=red](back top left) rectangle (back bottom right);
        %% Print the affiliation.
        \ifx\@affiliation\undefined\else
            \node at (back bottom right)[rotate=90,anchor=south west,inner sep=\@cover@margin]{
            \begin{minipage}[t]{\@cover@backboxwidth}
                \ousffamily\color{ou-white}\@affiliation
            \end{minipage}
            };
        \fi
        \ifKV@cover@back\ifx\@cover@text\undefined\else
            %% Calculate the width and height of the back text box.
            \setlength\@cover@backtextwidth{\@cover@backboxwidth}
            \addtolength\@cover@backtextwidth{-2\@cover@margin}
            \setlength\@cover@backtextheight{\@cover@backboxheight}
            \addtolength\@cover@backtextheight{-2\@cover@margin}
            %% Create the back text box.
            \node at (back top left)[anchor=north west,inner sep=\@cover@margin]{
                \begin{minipage}[t][\@cover@backtextheight]{\@cover@backtextwidth}
                    \ousffamily\color{ou-white}\@cover@text
                \end{minipage}
            };
        \fi\fi
    \end{tikzpicture}%
    %% Restore the margins and turn the page white again.
    \restoregeometry%
    \pagecolor{white}%
}

%% Remove the header and page number on empty pages.
\def\cleardoublepage{%
    \clearpage%
    \if@twoside%
        \ifodd\c@page%
        \else%
            \thispagestyle{empty}%
            \vspace*{\fill}%
            \newpage%
        \fi%
    \fi%
}

%% Page style for title pages.
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyfoot[C]{\titlefont\thepage}
}

%% Fancy style for the main matter.
\fancypagestyle{mainmatter}{%
    \fancyhf{}
    %% Page numbers on the top left and top right.
    \fancyhead[LE,RO]{\titlefont\thepage}
    %% Chapter name on the left (even) page.
    \fancyhead[RE]{\titlefont\titleshape\nouppercase{\leftmark}}
    %% Section name on the right (odd) page.
    \fancyhead[LO]{\titlefont\titleshape\nouppercase{\rightmark}}
}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}

%% Print the current chapter and section at the top of the page in title color.
\renewcommand*\chaptermark[1]{\markboth{\thechapter.\ \color{title}#1}{}}
\renewcommand*\sectionmark[1]{\markright{\thesection.\ \color{title}#1}}

%% The setheader command can be used to print the title of unnumbered chapters
%% in the page header.
\newcommand*\setheader[1]{\markboth{\color{title}#1}{\color{title}#1}}

\setlength{\headheight}{15pt}

%% Change the headrule command (from fancyhdr.sty) to draw the line below the
%% header in the title color.
\renewcommand*\headrule{%
    \if@fancyplain%
        \let\headrulewidth\plainheadrulewidth%
    \fi%
    {\color{title}\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth%
}

%% Draw the line above a footnote in the title color as well.
\renewcommand*\footnoterule{%
    \vspace*{-3pt}%
    {\color{title}\hrule width 0.5\textwidth height 0.4pt}%
    \vspace*{2.6pt}%
}

%% A part title starts with a huge (96pt) bold black number, flushed to the
%% right, followed by the part name on the next line in the title color.
\titleformat{\part}[display]
    {\flushright\titlestyle}
    {\fontsize{96pt}{96pt}\selectfont\bfseries\thepart}
    {0pt}
    {\Huge\color{title}}
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line, printed
%% in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}[display]
    {\flushright\titlestyle}
    {\fontsize{96pt}{96pt}\selectfont\bfseries\thechapter}
    {0pt}
    {\Huge\color{title}}
\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, a chapter is similar to a part, except that it is
%% preceded by half an empty line.
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Section titles start with the number in bold, followed by the name printed
%% in the title color.
\titleformat{\section}
    {\Large\headerstyle}
    {\bfseries\thesection.\ }
    {0pt}
    {\color{title}}
%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{\baselineskip}{0pt}
%% In the table of contents, section names are followed by a line of dots 8pt
%% apart.
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller font.
\titleformat{\subsection}
    {\large\headerstyle}
    {\bfseries\thesubsection.\ }
    {0pt}
    {\color{title}}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt}

%% Subsubsections have the same font and color as sections and subsections, but
%% are not preceded by a number.
\titleformat{\subsubsection}
    {\headerstyle}
    {\bfseries\thesubsubsection.\ }
    {0pt}
    {\color{title}}
%% Subsubsections are preceded by an empty line and do not appear in the table
%% of contents.
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}
\dottedcontents{subsubsection}[10.8em]{\titlefont}{3.8em}{8pt}

%% Color the bullets of the itemize environment and make the symbol of the third
%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{title}\textbullet}
\renewcommand*\labelitemii{\color{title}--}
\renewcommand*\labelitemiii{\color{title}$\diamond$}
\renewcommand*\labelitemiv{\color{title}\textperiodcentered}

%% Use a custom bibliography style based on apsrev4-1.
%\bibliographystyle{ou-report}
%\bibliographystyle{alpha}
% styles: apacite, abbrv, acm, alpha, apalike, ieeetr, plain, siam and unsrt.

%% Hyperlinks are title color, except in print mode, when they are all black.
\hypersetup{
    colorlinks = true,
    citecolor = title,
    linkcolor = title,
    urlcolor = title
}

\RequirePackage{csquotes}

\DeclareRobustCommand{\bbone}{\text{\usefont{U}{bbold}{m}{n}1}}

\DeclareMathOperator{\EX}{\mathbb{E}}% expected value



