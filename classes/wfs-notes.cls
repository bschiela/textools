\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wfs-notes}[2019/03/14 Initial class declaration]

\LoadClass[11pt]{article} % base class

% no options yet
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

\RequirePackage{etoolbox} % conditional statements

% maketitle
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
\pagestyle{fancy}
\fancyhf{} % clear defaults
\renewcommand\sectionmark[1]{\markboth{\S\thesection\hspace{1em}#1}{}}
\fancyhead[L]{\leftmark}
\fancyhead[R]{\@title}
\fancyfoot[C]{\thepage}

\RequirePackage{xpatch} % extends etoolbox's patching commands

% bibliography
\RequirePackage[numbers, square]{natbib}
\bibliographystyle{unsrtnat}
\xpretocmd{\bibliography}{\pagebreak\thispagestyle{plain}}{}{}