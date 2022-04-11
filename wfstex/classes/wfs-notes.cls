% For taking short-form notes.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wfs-notes}[2019/04/24 v1.0]

\LoadClass[11pt]{article} % base class

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
\renewcommand\abstract[1]{\gdef \@abstract {#1}}

% date formatting
\RequirePackage[english]{babel}
\RequirePackage[useregional]{datetime2}
\DTMnewdatestyle{versiondate}{%
	\renewcommand{\DTMdisplaydate}[4]{\number##1.\number##2.\number##3 }%
	\renewcommand{\DTMDisplaydate}{\DTMdisplaydate}%
}

% maketitle
\RequirePackage{etoolbox} % conditional statements
\renewcommand\maketitle{%
	\thispagestyle{plain}%
	\begin{center}
	\LARGE\@title
	
	\large\@author%
	\ifdefvoid{\@emailcorrections}{}{%
		\footnote{Email corrections to \@emailcorrections\ with the subject
			line: ``\@title\ {\DTMsetdatestyle{versiondate}\@dateupdated}''%
		}%
	}
	
	\ifdefvoid{\@affiliation}{}{\textit{\@affiliation}}
	
	\normalsize\@date
	
	\ifdefvoid{\@dateupdated}{}{(Updated: \@dateupdated)}
	
	\ifdefvoid{\@abstract}{}{%
		\vspace{3ex}%
		\begin{minipage}{0.8\textwidth}
			\setlength{\parindent}{1.5em}
			\small\@abstract
		\end{minipage}%
	}
	
	\end{center}	
}

% headers and footers
\RequirePackage{fancyhdr}
\setlength{\headheight}{13.6pt}
\pagestyle{fancy}
\fancyhf{} % clear defaults
\renewcommand\sectionmark[1]{\markboth{\S\thesection\hspace{1em}#1}{}}
\fancyhead[L]{\leftmark}
\fancyhead[R]{\@title}
\fancyfoot[C]{\thepage}

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

% bibliography and citations
\RequirePackage[numbers, square]{natbib}
\bibliographystyle{unsrtnat}
\RequirePackage{xpatch} % extends etoolbox's patching commands
\xpretocmd{\bibliography}{\pagebreak\thispagestyle{plain}}{}{}
% cite author (year)
\newcommand{\citeay}[1]{{\citeauthor{#1} \protect\NoHyper(\citeyear{#1})\protect\endNoHyper}}
% cite author (year) [num]
\newcommand{\citeayn}[1]{{\citeauthor{#1} \protect\NoHyper(\citeyear{#1}) [\citenum{#1}]\protect\endNoHyper}}

% captions
\RequirePackage{caption,subcaption}
\captionsetup{margin=0.05\textwidth, font=small, labelfont=bf}
