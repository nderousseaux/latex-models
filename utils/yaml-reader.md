# yaml-reader

YAML file reader for LuaLaTeX using tinyyaml.

## Requirements

- **LuaLaTeX** (won't work with pdfLaTeX or XeLaTeX)

## Usage

```latex
\usepackage{yaml-reader}

\LoadYAML{data.yaml}
\yaml{name}           % Simple key
\yaml{address.city}   % Nested key (dot notation)
```

## Example

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

Compile with: `lualatex document.tex`
