% ============================================
% CLASSE PROFESSIONNEL-LETTER.CLS
% Classe pour lettres professionnelles
% ============================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{professionnal-letter}[2025/12/22 Professional Letter Class]


% Basée sur article
\LoadClass[11pt,a4paper]{article}

% Packages de base
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[french]{babel}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{graphicx}

% Chargement des modules
\RequirePackage{perso/layout/small-margins}
\RequirePackage{perso/colors/sober-colors}
\RequirePackage{perso/utils/sober-links}

% Variables globales pour stocker les infos
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
\def\letter@greeting{Madame, Monsieur}
\def\letter@closing{Je vous prie d'agréer, Madame, Monsieur, l'expression de mes salutations distinguées.}

% Commande pour définir l'expéditeur
\newcommand{\setsender}[5]{%
    \def\sender@name{#1}%
    \def\sender@address{#2}%
    \def\sender@city{#3}%
    \def\sender@email{#4}%
    \def\sender@phone{#5}%
}

% Commande pour définir le destinataire
\newcommand{\setrecipient}[4]{%
    \def\recipient@name{#1}%
    \def\recipient@lineone{#2}%
    \def\recipient@linetwo{#3}%
    \def\recipient@email{#4}%
}

% Commande pour définir le lieu (optionnel)
\newcommand{\setlocation}[1]{%
    \def\letter@location{#1}%
}

% Commande pour définir la date
\newcommand{\setdate}[1]{%
    \def\letter@date{#1}%
}

% Commande pour définir l'objet
\newcommand{\setsubject}[1]{%
    \def\letter@subject{#1}%
}

% Commande pour définir la formule d'appel
\newcommand{\setgreeting}[1]{%
    \def\letter@greeting{#1}%
}

% Commande pour définir la formule de politesse
\newcommand{\setclosing}[1]{%
    \def\letter@closing{#1}%
}

% Affichage de l'en-tête
\newcommand{\makeheader}{%
    % Expéditeur
    \begin{minipage}[t]{0.45\textwidth}
        \textbf{\sender@name}\\
        \sender@address\\
        \sender@city\\
        \href{mailto:\sender@email}{\sender@email}\\
        \href{tel:\sender@phone}{\sender@phone}
    \end{minipage}%
    % Destinataire
    \hfill
    \begin{minipage}[t]{0.45\textwidth}
        \raggedleft
        \textbf{\recipient@name}\\
        \recipient@lineone\\
        \recipient@linetwo\\
        \href{mailto:\recipient@email}{\recipient@email}
    \end{minipage}
    
    \vspace{1.5em}
    
    % Lieu et date (lieu optionnel)
    \noindent
    \ifx\letter@location\empty
        % Pas de lieu, juste la date
        Le \letter@date
    \else
        % Lieu et date
        \letter@location, le \letter@date
    \fi
    
    \vspace{1.5em}
    
    % Objet
    \noindent\textbf{Objet~:} \textbf{\letter@subject}
    
    \vspace{1em}
    
    % Formule d'appel
    \noindent\letter@greeting,
    
    \vspace{0.5em}
}

% Formule de politesse
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

% Environnement pour la lettre complète
\newenvironment{myletter}{%
    \makeheader%
}{%
    \makeclosing%
}

\endinput
