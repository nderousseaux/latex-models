# Professional Letter

LaTeX package for professional letters.

## Usage

```latex
\documentclass[french,12pt]{professional-letter}

\begin{document}

\setsender{Name}{Address}{Postal code City}{email}{phone}
\setrecipient{Organization}{Department}{Line}{email}
\setdate{December 23, 2025}
\setsubject{Letter subject}

\begin{myletter}
    Content...
\end{myletter}

\end{document}
```

## Class Options

- `french` / `english` (default) - Language
- All standard article options: `10pt`, `11pt` (default), `12pt`, `a4paper` (default), `letterpaper`, etc.

## Commands

### Required
- `\setsender{name}{address}{city}{email}{phone}` (5 params)
- `\setrecipient{name}{line1}{line2}{email}` (4 params)
- `\setsubject{subject}`

### Optional (with defaults)
- `\setlocation{city}` - Location (empty by default)
- `\setdate{date}` - Date (`\today` by default)
- `\setgreeting{formula}` - Greeting formula ("Dear Sir or Madam" by default) (language dependent)
- `\setclosing{formula}` - Closing formula (standard by default) (language dependent)

### Environment
- `\begin{myletter}...\end{myletter}` - Generates header, body and signature

## Colors
- `maincolor` : RGB(0,51,102)
- `accentcolor` : RGB(102,153,204)

