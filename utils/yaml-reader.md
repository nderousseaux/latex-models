# yaml-reader

YAML file reader for LuaLaTeX using tinyyaml.

## Requirements

- **LuaLaTeX** (won't work with pdfLaTeX or XeLaTeX)

## Modes d'utilisation

Le module propose deux modes de fonctionnement :

### Mode simple (un seul fichier YAML)

Idéal quand vous n'avez qu'un seul fichier de données.

```latex
\usepackage{yaml-reader}

\LoadYAML{data.yaml}
\yaml{name}           % Clé simple
\yaml{address.city}   % Clé imbriquée (notation pointée)
```

### Mode multi-fichiers (avec préfixes)

Permet de charger plusieurs fichiers YAML en les distinguant par un préfixe.

```latex
\usepackage{yaml-reader}

\LoadYAMLAs{me.yaml}{me}
\LoadYAMLAs{company.yaml}{company}

\yaml{me.name}              % Accès aux données de me.yaml
\yaml{company.name}         % Accès aux données de company.yaml
\yaml{me.address.city}      % Clés imbriquées avec préfixe
```

## Exemples

### Exemple mode simple

**data.yaml:**
```yaml
name: John Doe
address:
  city: Paris
  zip: 75001
```

**document.tex:**
```latex
\documentclass{article}
\usepackage{yaml-reader}

\begin{document}
\LoadYAML{data.yaml}
Hello \yaml{name} from \yaml{address.city}!
\end{document}
```

### Exemple mode multi-fichiers

**me.yaml:**
```yaml
name: John Doe
email: john@example.com
```

**company.yaml:**
```yaml
name: ACME Corp
address:
  city: Lyon
```

**document.tex:**
```latex
\documentclass{article}
\usepackage{yaml-reader}

\begin{document}
\LoadYAMLAs{me.yaml}{me}
\LoadYAMLAs{company.yaml}{company}

\yaml{me.name} travaille chez \yaml{company.name} à \yaml{company.address.city}.
\end{document}
```

## Compilation

```bash
lualatex document.tex
```
