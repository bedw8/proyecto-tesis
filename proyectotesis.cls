\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{proyectotesis}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt]{article}

\RequirePackage[letterpaper, textheight=9.2in, textwidth=6.2in,bottom=1in]{geometry}
\RequirePackage{emptypage}
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{braket}
\RequirePackage{xcolor}
%\RequirePackage{enumerate}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{fancyhdr}
%\RequirePackage{titlesec}
\RequirePackage{afterpage}
\RequirePackage{palatino}
\RequirePackage[LabelsAligned,NoDate]{currvita}


\setlength{\headheight}{14.2pt}
\addtolength{\topmargin}{-2.2pt} \fancyfoot[L]{} % Empty left footer

\fancypagestyle{firstpage}{
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
\newgeometry{textheight=8.5in, textwidth=6.2in,bottom=1in}
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
\@directora
\@director
\@directores
\@codirector
\item {\bf\large Duración del proyecto:}  \@duracion
\item {\bf\large Lugar de Realización:} \@lugar 

\item {\bf\large Dirección postal y teléfono:} \@direccion

\item {\bf\large Compromiso de Director de Tesis y Director de Tesis Alternativo} 

``El Director de Tesis acepta la responsabilidad de supervisar científicamente el presente proyecto y de proveer información pertinente al avance de éste a petición del Comité de Postgrado. En caso de que el Director de Tesis se ausente del país, o por alguna otra razón de orden mayor, el Director de Tesis alternativo acepta las  mencionadas anteriormente''.
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

\def\@directora{}
\newcommand\directora[1]{%
\renewcommand\@directora{%
\item {\bf\large Directora de Tesis:} #1%
}}

\def\@director{}
\newcommand\director[1]{%
\renewcommand\@director{%
\item {\bf\large Director de Tesis:} #1%
}}

\def\@directores{}
\newcommand\directores[1]{%
\renewcommand\@directores{%
\item {\bf\large Directores de Tesis:} #1%
}}

\def\@codirector{}
\newcommand\codirector[1]{%
\renewcommand\@codirector{%
\item {\bf\large Co\,--Director de Tesis:} #1%
}}

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


