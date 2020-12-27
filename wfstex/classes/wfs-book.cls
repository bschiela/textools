% For large compilations of notes.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wfs-book}[2020/12/26 v0.0]

\LoadClass[11pt]{book} % base class

%%%%%%%%%%%
% options %
%%%%%%%%%%%
\DeclareOption*{\OptionNotUsed}
\ProcessOptions\relax

% page setup
\RequirePackage[
	paper=letterpaper,
	margin=1in,
]{geometry}
\RequirePackage{parskip}

% additional document info used in maketitle
\newcommand\affiliation[1]{\gdef \@affiliation {#1}}
\newcommand\emailcorrections[1]{\gdef \@emailcorrections {#1}}
\newcommand\dateupdated[1]{\gdef \@dateupdated {#1}}
\newcommand\abstract[1]{\gdef \@abstract {#1}}

% date formatting
\RequirePackage[english]{babel}
\RequirePackage[useregional]{datetime2}
\DTMnewdatestyle{versiondate}{%
	\renewcommand{\DTMdisplaydate}[4]{\number##1.\number##2.\number##3 }%
	\renewcommand{\DTMDisplaydate}{\DTMdisplaydate}%
}

% maketitle (cover page)
\RequirePackage{etoolbox} % conditional statements
\renewcommand\maketitle{%
    \thispagestyle{empty}%
    \vspace*{\fill}
	\begin{center}
    {\Huge\@title}\\[5ex]
	{\Large\@author%
	\ifdefvoid{\@emailcorrections}{}{%
		\footnote{Email corrections to \@emailcorrections\ with the subject
			line: ``\@title\ {\DTMsetdatestyle{versiondate}\@dateupdated}''%
		}%
    }}\\[5ex]
    \ifdefvoid{\@affiliation}{}{\textit{\@affiliation}\\[5ex]}
    {\large\@date

    \ifdefvoid{\@dateupdated}{}{(Updated: \@dateupdated)}}\\[5ex]

	\ifdefvoid{\@abstract}{}{%
		\vspace{5ex}%
		\begin{minipage}{0.8\textwidth}
			\setlength{\parindent}{1.5em}
			\@abstract
		\end{minipage}%
	}
	\end{center}	
    \vspace*{\fill}
}

% headers and footers
\RequirePackage{fancyhdr}
\setlength{\headheight}{13.6pt}
\pagestyle{fancy}
\fancyhf{} % clear defaults
\renewcommand\chaptermark[1]{\markboth{\scshape \thechapter~#1}{}}
\renewcommand\sectionmark[1]{\markright{\S\thesection~#1}}
\fancyhead[LE,RO]{\leftmark}
\fancyhead[RE,LO]{\rightmark}
\fancyfoot[LE,RO]{\thepage}

% section fonts
\RequirePackage{titlesec}
\titleformat*{\section}{\LARGE\bfseries}
\titleformat*{\subsection}{\Large\bfseries}
\titleformat*{\subsubsection}{\large\bfseries}

% tables
\renewcommand\arraystretch{1.3}

% appendices
\RequirePackage[toc, page]{appendix}
\BeforeBeginEnvironment{appendices}{\clearpage\newpage}

% bibliography
\RequirePackage[numbers, square]{natbib}
\bibliographystyle{unsrtnat}
\RequirePackage{xpatch} % extends etoolbox's patching commands
\xpretocmd{\bibliography}{\pagebreak\thispagestyle{plain}}{}{}

% captions
\RequirePackage{caption}
\captionsetup{margin=0.05\textwidth, font=small, labelfont=bf}
%\RequirePackage{subcaption}
