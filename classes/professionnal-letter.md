# Professional Letter

Package LaTeX pour lettres professionnelles.

## Utilisation

```latex
\documentclass{perso/classes/professionnal-letter}

\begin{document}

\setsender{Nom}{Adresse}{Code postal Ville}{email}{téléphone}
\setrecipient{Organisation}{Service}{Ligne}{email}
\setdate{23 décembre 2025}
\setsubject{Objet de la lettre}

\begin{myletter}
    Contenu...
\end{myletter}

\end{document}
```

## Commandes

### Obligatoires
- `\setsender{nom}{adresse}{ville}{email}{téléphone}` (5 params)
- `\setrecipient{nom}{ligne1}{ligne2}{email}` (4 params)
- `\setsubject{objet}`

### Optionnelles (avec défauts)
- `\setlocation{ville}` - Lieu (vide par défaut)
- `\setdate{date}` - Date (`\today` par défaut)
- `\setgreeting{formule}` - Formule d'appel ("Madame, Monsieur" par défaut)
- `\setclosing{formule}` - Formule de politesse (standard par défaut)

### Environnement
- `\begin{myletter}...\end{myletter}` - Génère en-tête, corps et signature

## Couleurs
- `maincolor` : RGB(0,51,102)
- `accentcolor` : RGB(102,153,204)

