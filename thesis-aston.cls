%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                %
% Aston University Postgraduate Thesis Template  %
% Author:  Dr Chloe M. Barnes                    %
%          Department of Computer Science        %
%          Aston University                      %
% Version: v1.0                                  %
% Date:    4th May 2023                          %
%                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Start of file `thesis-aston.cls'.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis-aston}[2023/04/19 v1.0 Aston University PhD Thesis Template Class]

\newif\ifthesisdraft
\thesisdraftfalse
\DeclareOption{thesisdraft}{\thesisdrafttrue}
%\ProcessOptions\relax


\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{book}
}
\ProcessOptions\relax
\LoadClass[11pt,oneside]{book}

\RequirePackage{fancyhdr}
\RequirePackage[a4paper, total={6in, 9in}]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[pdftex]{graphicx}
\RequirePackage[table,xcdraw]{xcolor}
\RequirePackage{setspace}
\RequirePackage{url} 
\RequirePackage{booktabs}
\RequirePackage[titletoc]{appendix}
\RequirePackage{etoolbox}
\renewcommand{\baselinestretch}{1.5} % min 1.5, max 2.0
\RequirePackage{bibentry}
\newcommand{\thesistype}[1]{\def\@thesistype{#1}}
\newcommand{\fullname}[1]{\def\@fullname{#1}}
\newcommand{\initials}[1]{\def\@initials{#1}}
\newcommand{\thesisyear}[1]{\def\@thesisyear{#1}}
\newcommand{\thesismonth}[1]{\def\@thesismonth{#1}}
\newcommand{\thesistitle}[1]{\def\@thesistitle{#1}}
\newcommand{\thesissubtitle}[1]{\def\@thesissubtitle{#1}}
\newcommand{\thesisvolume}[1]{\def\@thesisvolume{#1}}

% Format quotes, footnotes etc.
\newcommand{\smallfont}{\fontsize{10pt}{1}\selectfont}
\newcommand{\smallfontspaced}{\smallfont\onehalfspacing\selectfont}
\newcommand{\bodyfont}{\fontsize{11pt}{1.5}\selectfont}
\AtBeginEnvironment{quote}{\smallfont}
\AtBeginEnvironment{quotation}{\smallfont}
\AtBeginEnvironment{tabular}{\smallfont}
\AtBeginEnvironment{equation}{\smallfont}
\AtBeginEnvironment{verbatim}{\smallfont}
\renewcommand{\footnotesize}{\smallfont}

\newcommand{\pageauthor}{\mbox{\@initials, \thesistypeshort, Aston University \@thesisyear}}
\newcommand{\printfullname}{\@fullname}
\newcommand{\thesistypeshort}{
    \ifnum\@thesistype=1
        \unskip MSc Thesis\unskip
    \else
        \ifnum\@thesistype=2
            \unskip MA Thesis\unskip
        \else
            \ifnum\@thesistype=3
                \unskip MPhil Thesis\unskip
            \else
                \ifnum\@thesistype=4
                    \unskip MD Thesis\unskip
                \else  
                    \ifnum\@thesistype=5
                        \unskip DBA Thesis\unskip
                    \else
                        \ifnum\@thesistype=6
                            \unskip DOptom Thesis\unskip
                        \else 
                            \unskip PhD Thesis\unskip
    \fi\fi\fi\fi\fi\fi}
\newcommand{\thesistypelong}{
    \ifnum\@thesistype=1
        \unskip Master of Science\unskip 
    \else
        \ifnum\@thesistype=2
            \unskip Master of Arts\unskip 
        \else
            \ifnum\@thesistype=3
                \unskip Master of Philosophy\unskip 
            \else
                \ifnum\@thesistype=4
                    \unskip Doctor of Medicine\unskip 
                \else  
                    \ifnum\@thesistype=5
                        \unskip Doctor of Business Administration\unskip 
                    \else
                        \ifnum\@thesistype=6
                            \unskip Doctor of Optometry\unskip 
                        \else
                            \unskip Doctor of Philosophy\unskip
    \fi\fi\fi\fi\fi\fi}


\newif\ifRomanNumerals


% Macros to include inline citations in word count
%TC:macro \cite [option:text,text]
%TC:macro \citep [option:text,text]
%TC:macro \citet [option:text,text]

\newcommand{\maketitlepage}{
\begin{center}
    \thispagestyle{titlepage}
    
    \vspace*{\fill}
    
    %capitals
    {\LARGE\setstretch{1.25}\MakeUppercase{\textbf{\@thesistitle\\}}}
    
    \vspace{1cm}

    \ifx\@thesissubtitle\empty
    %{\hfill }
    \else 
    {\Large\setstretch{1.25}\MakeUppercase{\@thesissubtitle\\}}
    \fi

    \vspace{1cm}
    
    \ifnum\@thesisvolume>0
        {\Large Volume \@thesisvolume}
    \else
        \hfill
    \fi

    \vspace{2cm}
    
    {\Large \uppercase{\@fullname}} % e.g. Firstname Middlename(s) Surname
    
    \vspace{1cm}
    
    {\large \mbox{\thesistypelong}}
    
    \vspace{1cm}%\vspace*{\fill}
    
    {\uppercase{Aston University}}
    
    {\@thesismonth~\@thesisyear}
    
    \vspace{1cm}
        
    {\copyright~\@fullname, \@thesisyear} 
    
    \vspace{0.5cm}
    
    {\@fullname~asserts their moral right to be identified as the author of this thesis}
    
    \vspace{0.5cm}
    
    {This copy of the thesis has been supplied on condition that anyone who consults it is understood to recognise that its copyright belongs to its author and that no quotation from the thesis and no information derived from it may be published without appropriate permission or acknowledgement.}
        
\end{center}
}




% Create an environment command that can be used to list publications at the start of a chapter. The environment takes one argument to customise whether the text is for plural publications or not -- or if the specified papers are under review and not published.

\newenvironment{chapter-publications}[1][0]{
    \hrule
    \vspace{0.5cm}
    \smallfontspaced
    \ifnum#1=0
    \itshape
    \else
        \ifnum#1=1
            \textit{The work presented in this chapter has been adapted from the following publication:}
            \nobibliography*
        \else
            \ifnum#1=2
                \textit{The work presented in this chapter has been adapted from the following publications:}
                \nobibliography*
    \fi\fi\fi
    }{
    \vspace{0.5cm}
    \hrule
}
\newcommand{\chappub}[1]{\noindent \cite{#1} \bibentry{#1}.\par}
\newcommand{\chapnotpub}[1]{\noindent #1\par}



\newenvironment{thesisabstract}[1][\relax]{%
    \newcommand{\keywords}{#1}
    
    \begin{singlespace}
    \chapter*{Abstract}
\thispagestyle{abstractpage}

    \begingroup
    
    \def\\{\relax\ifhmode\unskip\fi\space\ignorespaces}
    \textbf{\textit{\@thesistitle}} \par
    \ifx\@thesissubtitle\empty
    %{\hfill }
    \else 
    \def\\{\relax\ifhmode\unskip\fi\space\ignorespaces}
    \noindent \textit{\@thesissubtitle} \par
    \fi
    
    \noindent \@fullname \par
    \noindent \thesistypelong \par
    \noindent \@thesisyear \newline
    \endgroup

    \@afterindentfalse \@afterheading

    % \ifx\relax#1 \par
    % \else \noindent \textbf{Keywords:}\par
    % \noindent{#1}
    % \fi
}{

    \vspace*{\fill}
    \noindent\newline
    \textbf{Keywords:} \par
    {
    \setlength{\parindent}{0pt}
    \keywords
    }
    \end{singlespace}
}

\newenvironment{thesisappendices}{%
    \begin{singlespace}
    \begin{appendices}

}{
    \end{appendices}
    \end{singlespace}
}


\newenvironment{thesisdedication}{
\clearpage
    \thispagestyle{plain}
    \vspace*{\fill}
    %\textit{Dedication}
       \begin{center} 
       \begingroup 
       \itshape
}{
   \endgroup
   \end{center} 
    \vspace*{\fill}
\clearpage
}

% Takes one optional argument, default value is 0. If argument is 0, Personal Acknowledgements will be generated. Else, Collaborator Acknowledgements will be generated.
\newenvironment{thesisacknowledgements}[1][0]{%
    \ifnum#1=0
    \chapter*{Personal Acknowledgements} 
    \else
    \chapter*{Collaborator Acknowledgements} \fi
\thispagestyle{plain}
}{
}

% Create the bibliography and style within the Table of Contents
\newcommand{\thesisbibliography}[1]{%
    \addcontentsline{toc}{chapter}{List of References}
    \begin{singlespace}
        \renewcommand{\bibname}{List of References}
        %\renewcommand{\baselinestretch}{1}
        \thispagestyle{plain}
        \bibliography{#1}
    \end{singlespace}
}

% Generates a list of publications published during the degree.
\newenvironment{publications}{%
    \clearpage
    \chapter*{List of Publications}
    \thispagestyle{plain}
    \smallfontspaced
    \nobibliography*
}{}

% Generates a specific list for either publications submitted as part of the studies (specify 0 as an argument, default), or those that were published during the degree but unrelated to the thesis (specify 1 as an argument).
\newenvironment{publicationtype}[1][0]{
    \ifnum#1=0
    \noindent{\textbf{Publications Arising from this Thesis:}\par}
    \else
    \bigskip
    \noindent{\textbf{Additional Publications Completed During my Studies:}\par}
    \fi
}{}

%
\newcommand{\publication}[1]{\noindent \cite{#1} \bibentry{#1}.\par}


\newenvironment{thesisfrontmatter}{%
    \ifRomanNumerals
    \frontmatter
    \fi
    \maketitlepage
}{
    \ifRomanNumerals
    \mainmatter
    \fi
}

\newenvironment{commentstats}{%
}{}


\endinput