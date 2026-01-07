% ============================================
% PROFESSIONAL-LETTER.CLS CLASS
% Class for professional letters
% ============================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{professional-letter}[2025/12/22 Professional Letter Class]


% Based on article
\LoadClass[11pt,a4paper]{article}

% Basic packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[french]{babel}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{graphicx}

% Load modules
\RequirePackage{perso/layout/small-margins}
\RequirePackage{perso/colors/sober-colors}
\RequirePackage{perso/utils/sober-links}

% Global variables to store information
\def\sender@name{}
\def\sender@address{}
\def\sender@city{}
\def\sender@email{}
\def\sender@phone{}

\def\recipient@name{}
\def\recipient@lineone{}
\def\recipient@linetwo{}
\def\recipient@email{}

\def\letter@location{}
\def\letter@date{\today}
\def\letter@subject{}
\def\letter@greeting{Dear Sir or Madam}
\def\letter@closing{Yours sincerely}

% Command to define the sender
\newcommand{\setsender}[5]{%
    \def\sender@name{#1}%
    \def\sender@address{#2}%
    \def\sender@city{#3}%
    \def\sender@email{#4}%
    \def\sender@phone{#5}%
}

% Command to define the recipient
\newcommand{\setrecipient}[4]{%
    \def\recipient@name{#1}%
    \def\recipient@lineone{#2}%
    \def\recipient@linetwo{#3}%
    \def\recipient@email{#4}%
}

% Command to define the location (optional)
\newcommand{\setlocation}[1]{%
    \def\letter@location{#1}%
}

% Command to define the date
\newcommand{\setdate}[1]{%
    \def\letter@date{#1}%
}

% Command to define the subject
\newcommand{\setsubject}[1]{%
    \def\letter@subject{#1}%
}

% Command to define the greeting formula
\newcommand{\setgreeting}[1]{%
    \def\letter@greeting{#1}%
}

% Command to define the closing formula
\newcommand{\setclosing}[1]{%
    \def\letter@closing{#1}%
}

% Display the header
\newcommand{\makeheader}{%
    % Sender
    \begin{minipage}[t]{0.45\textwidth}
        \textbf{\sender@name}\\
        \sender@address\\
        \sender@city\\
        \href{mailto:\sender@email}{\sender@email}\\
        \href{tel:\sender@phone}{\sender@phone}
    \end{minipage}%
    % Recipient
    \hfill
    \begin{minipage}[t]{0.45\textwidth}
        \raggedleft
        \textbf{\recipient@name}\\
        \recipient@lineone\\
        \recipient@linetwo\\
        \href{mailto:\recipient@email}{\recipient@email}
    \end{minipage}
    
    \vspace{1.5em}
    
    % Location and date (location optional)
    \noindent
    \ifx\letter@location\empty
        % No location, just the date
        \letter@date
    \else
        % Location and date
        \letter@location, \letter@date
    \fi
    
    \vspace{1.5em}
    
    % Subject
    \noindent\textbf{Subject:} \textbf{\letter@subject}
    
    \vspace{1em}
    
    % Greeting formula
    \noindent\letter@greeting,
    
    \vspace{0.5em}
}

% Closing formula
\newcommand{\makeclosing}{%
    \vspace{1em}
    \noindent\letter@closing
    
    \vspace{0.5em}
    
    % Signature
    \hfill
    \begin{minipage}{0.4\textwidth}
        \raggedleft
        \textbf{\sender@name}
    \end{minipage}
}

% Environment for the complete letter
\newenvironment{myletter}{%
    \makeheader%
}{%
    \makeclosing%
}

\endinput
