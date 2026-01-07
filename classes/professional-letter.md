# Professional Letter

LaTeX package for professional letters.

## Usage

```latex
\documentclass{professional-letter}

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

## Commands

### Required
- `\setsender{name}{address}{city}{email}{phone}` (5 params)
- `\setrecipient{name}{line1}{line2}{email}` (4 params)
- `\setsubject{subject}`

### Optional (with defaults)
- `\setlocation{city}` - Location (empty by default)
- `\setdate{date}` - Date (`\today` by default)
- `\setgreeting{formula}` - Greeting formula ("Dear Sir or Madam" by default)
- `\setclosing{formula}` - Closing formula (standard by default)

### Environment
- `\begin{myletter}...\end{myletter}` - Generates header, body and signature

## Colors
- `maincolor` : RGB(0,51,102)
- `accentcolor` : RGB(102,153,204)

