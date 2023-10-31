% For making resumes and CVs.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wfs-cv}[2019/04/24 v1.0]

\LoadClass[11pt]{article} % base class

% no options yet
\DeclareOption*{\OptionNotUsed}
\ProcessOptions\relax

% page setup
\RequirePackage[
    paper=letterpaper,
    margin=0.5in, top=0.75in, bottom=0.75in,
    nomarginpar,
    headheight=14pt,
    headsep=0.25in, footskip=0.4in,
]{geometry}
\setlength{\parskip}{-0.5pt}
\setlength{\parindent}{0.25in}
\newlength{\titlepadtop}
\setlength{\titlepadtop}{-30pt}
\newlength{\titlesep}
\setlength{\titlesep}{20pt}
\newlength{\secsep}
\setlength{\secsep}{11pt}
\newlength{\subsecsep}
\setlength{\subsecsep}{6pt}

% font
\RequirePackage{newtxtext, newtxmath} % Times Roman font clone
\newcommand\newfontsize[1]{\fontsize{#1}{\dimexpr#1pt*6/5}}
\newcommand\namefont{\newfontsize{30}\bfseries}
\newcommand\contactfont{\newfontsize{13}\selectfont}
\newcommand\sectionfont{\newfontsize{13}\bfseries}
\newcommand\subsectionfont{\newfontsize{12}\bfseries}
\newcommand\subsubsectionfont{\newfontsize{12}\itshape}

% bulleted lists
\newcommand\bullettype{\makebox[0pt]{\large\textbullet}}
\newlength{\bulletwidth}
\settowidth{\bulletwidth}{\bullettype}
\RequirePackage{enumitem}
\setlist{nosep, label=\bullettype, leftmargin=\parindent, labelsep=\dimexpr\leftmargin/2}

% personal details
\newcommand\name[1]{\gdef \@name {#1}}
\newcommand\website[1]{\gdef \@website {#1}}
\newcommand\email[1]{\gdef \@email {#1}}
\newcommand\phone[1]{\gdef \@phone {#1}}

% header
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\renewcommand\headrulewidth{0pt}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\@name}
\fancyhf[R]{Page \thepage\ / \pageref{LastPage}}
\fancypagestyle{firstpagestyle}{
    \fancyhead[CR]{}
}

\RequirePackage{etoolbox} % for conditional statements
\newcommand\condvspace[2]{\ifnumcomp{#1}{>}{1}{\vspace{#2}}{}}

% maketitle, section, subsection, subsubsection
\renewcommand\maketitle{
    \vspace*{\titlepadtop}
    \noindent\begin{minipage}{4in}
		\begingroup\namefont\@name\endgroup
    \end{minipage}\hfill\begin{minipage}{3.5in}\begin{flushright}
			\begingroup\contactfont\@website\\\@email\\\@phone\endgroup
	\end{flushright}\end{minipage}
    \vspace{\titlesep}
}
\renewcommand\section[1]{%
	\stepcounter{section}\setcounter{subsection}{0}%
	\condvspace{\thesection}{\secsep}%
	\noindent\begingroup%
		\sectionfont\underline{%
			\makebox[\linewidth][l]{\smash{#1}}%
		}%
	\endgroup%
}
\renewcommand\subsection[1]{%
	\stepcounter{subsection}%
	\condvspace{\value{subsection}}{\subsecsep}%
	\noindent\begingroup\subsectionfont#1\endgroup%
}
\renewcommand\subsubsection[1]{%
	\noindent\begingroup\subsubsectionfont#1\endgroup%
}
