\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{proyectotesis}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt]{article}

\RequirePackage[letterpaper, textheight=9.2in, hmargin=2cm,bottom=1in]{geometry}
\RequirePackage{emptypage}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{braket}
\RequirePackage{xcolor}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{afterpage}
\RequirePackage{palatino}
\RequirePackage[LabelsAligned,NoDate]{currvita}
\RequirePackage{microtype}
\RequirePackage[backend=biber,natbib=true,sorting=none,style=numeric-comp, maxcitenames=2, url=false, isbn=false]{biblatex}
\RequirePackage[autostyle]{csquotes}

\urlstyle{rm}
\DeclareBoolOption{hyperref}

\ProcessKeyvalOptions*
\ifproyectotesis@hyperref
    \RequirePackage{hyperref}
	% Corrección Hyperref + eqref
	\renewcommand*{\eqref}[1]{%
	  \hyperref[{#1}]{\textup{\tagform@{\ref*{#1}}}}%
	}
\fi

% Correciones bibliografía
\DefineBibliographyStrings{spanish}{andothers={et al.}}
\AtEveryBibitem{\clearfield{note}}

% Formato primera pagina
\fancypagestyle{firstpage}{
%\setlength{\topmargin}{0cm}
%\setlength{\textheight}{\textheight-a\topmargindefault}
\fancyfoot[C]{} % Empty center footer
\fancyfoot[R]{\thepage}
\fancyhead[L]{Facultad de Ciencias}
\fancyhead[R]{Universidad de Chile}
}

\fancypagestyle{everypage}{
\fancyfoot[L]{} % Empty left footer
\fancyfoot[C]{} % Empty center footer
\fancyfoot[R]{\thepage}
}

\decimalpoint

\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\thesection.\Alph{subsection}}

\setlist[itemize]{label=\textbullet}

\def\maketitle{
\thispagestyle{firstpage}
\newgeometry{letterpaper, textheight=8.5in, hmargin=2cm,bottom=1in}
\afterpage{\aftergroup\restoregeometry}
\begin{center}
    \vspace{5mm}\bf \huge  Formulario de Proyecto de Tesis para \@postgrado \\
    \vspace{5mm}\large {\sc \@author}
	\vspace{1.5cm}
\end{center}
}

\pagestyle{everypage}

\newcommand{\firmas}{
\vspace{1cm}

\begin{center}
\begin{minipage}{5cm}
\centering
\rule{5cm}{0.1mm} \\
 \bf  Director(a) de Tesis
\end{minipage}
\hfill
\begin{minipage}{5cm}
\centering
\rule{5cm}{0.1mm} \\
 \bf  Director(a) de Postgrado
\end{minipage}
\end{center}
}

\newlist{info}{enumerate}{1}
\setlist[info,1]{
  label={\bf\large \thesection.\Roman*.},
  leftmargin=*,
  align=left,
  labelsep=-6mm,
}


\def\makegeneralinfo{
\begin{info}
\item {\bf\large Título del proyecto:} \@title
\item {\bf\large Nombre~\@pronde~tesista:} \@author
\item {\bf\large Proyecto de Tesis de:} \@programa 
\@direcciontesis
\item {\bf\large Duración del proyecto:}  \@duracion
\item {\bf\large Lugar de Realización:} \@lugar 

\item {\bf\large Dirección postal y teléfono:} \@direccion

\item {\bf\large Compromiso de Director de Tesis y Director de Tesis Alternativo} 

``El Director de Tesis acepta la responsabilidad de supervisar científicamente el presente proyecto y de proveer información pertinente al avance de éste a petición del Comité de Postgrado. En caso de que el Director de Tesis se ausente del país, o por alguna otra razón de orden mayor, el Director de Tesis alternativo acepta las mencionadas anteriormente''.
\end{info}
%\vspace{-3mm}
\firmas
}

\newcommand\pronom[1]{%
\def\@pronom{#1}%
\pronde%
}

\newcommand{\pronde}{
\ifthenelse{\equal{\@pronom}{el}}%
{\def\@pronde{del}}%
{\def\@pronde{de \@pronom}}%
}

\renewcommand{\author}[2][el]{
	\renewcommand\@author{#2}
	\pronom{#1}
}

\newcommand\postgrado[2][Postgrado]{
\def\@postgrado{#1}
\def\@programa{\@postgrado~#2}
}


\def\@duracion{Tal y tal semestre}
\newcommand\duracion[1]{\renewcommand\@duracion{#1}}

\def\@lugar{Grupo Tanto, Facultad X, Universidad de Chile}
\newcommand\lugar[1]{\renewcommand\@lugar{#1}}

\def\@direccion{221B Baker Street St, Londres, Inglaterra}
\newcommand\direccion[1]{\renewcommand\@direccion{#1}}

\newcommand\@direcciontesis{}
\newcommand\anadirdireccion[2][Directora]{\appto\@direcciontesis{
\item {\bf \large #1 de Tesis:} #2%
}}

\newcommand\directora[1]{%
\anadirdirector[Directora]{#1}
}

\newcommand\director[1]{%
\anadirdirector[Director]{#1}
}

\newcommand\directores[1]{%
\anadirdirector[Directores]{#1}
}

\newcommand\codirector[1]{%
\anadirdirector[Co\,--Director]{#1}
}

\def\maketitlepage{
\maketitle
\section{Información General}
\makegeneralinfo
\newpage
}

\newcommand\makepersonalinfo{
\section{Reseña biográfica~\@pronde~tesista}

\subsection{Información Personal:}
\begin{cvlist}{}
\item[\bf Nombre:] {\bf \@author}
  \item[\bf Nacimiento:] \@nacimiento
  \item[\bf R.U.N.:] \@RUN 
  \item[\bf Teléfono:] \@telefono 
  \item[\bf E-mail:] \@email
\end{cvlist}
}

\def\@nacimiento{}
\newcommand\nacimiento[1]{\renewcommand\@nacimiento{#1}}

\def\@RUN{}
\newcommand\RUN[1]{\renewcommand\@RUN{#1}}

\def\@telefono{}
\newcommand\telefono[1]{\renewcommand\@telefono{#1}}

\def\@email{}
\newcommand\email[1]{\renewcommand\@email{#1}}


