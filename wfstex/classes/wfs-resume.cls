% For making resumes and CVs.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wfs-resume}[2019/04/24 v1.0]

\LoadClass[12pt]{article} % base class

% no options yet
\DeclareOption*{\OptionNotUsed}
\ProcessOptions\relax

% page setup
\pagestyle{empty}
\RequirePackage[
	paper=letterpaper,
	margin=0.5in,
	nomarginpar,
    headheight=14pt, headsep=5pt,
    footskip=20pt,
]{geometry}
\setlength{\parskip}{-0.5pt}
\setlength{\parindent}{0.25in}
\newlength{\titlesep}
\setlength{\titlesep}{40pt}
\newlength{\secsep}
\setlength{\secsep}{11pt}
\newlength{\subsecsep}
\setlength{\subsecsep}{5pt}

% font
\RequirePackage{newtxtext, newtxmath} % Times Roman font clone
\newcommand\newfontsize[1]{\fontsize{#1}{\dimexpr#1pt*6/5}}
\newcommand\namefont{\newfontsize{30}\bfseries}
\newcommand\contactfont{\newfontsize{12}\selectfont}
\newcommand\sectionfont{\newfontsize{12}\bfseries}
\newcommand\subsectionfont{\newfontsize{11}\bfseries}
\newcommand\subsubsectionfont{\newfontsize{11}\itshape}

% bulleted lists
\newcommand\bullettype{\makebox[0pt]{\large\textbullet}}
\newlength{\bulletwidth}
\settowidth{\bulletwidth}{\bullettype}
\RequirePackage{enumitem}
\setlist{nosep, label=\bullettype, leftmargin=\parindent, labelsep=\dimexpr\leftmargin/2}

% personal details
\newcommand\name[1]{\gdef \@name {#1}}
\newcommand\address[1]{\gdef \@address {#1}}
\newcommand\email[1]{\gdef \@email {#1}}
\newcommand\phone[1]{\gdef \@phone {#1}}

\RequirePackage{etoolbox} % for conditional statements
\newcommand\condvspace[2]{\ifnumcomp{#1}{>}{1}{\vspace{#2}}{}}

% maketitle, section, subsection, subsubsection
\renewcommand\maketitle{
	\noindent\begin{minipage}{4in}
		\begingroup\namefont\@name\endgroup
	\end{minipage}\hfill\begin{minipage}{3.5in}\begin{flushright}
			\begingroup\contactfont\@address\\\@email\\\@phone\endgroup
	\end{flushright}\end{minipage}%
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
