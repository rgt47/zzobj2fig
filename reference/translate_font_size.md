# Translate LaTeX font size commands to numeric points

Maps LaTeX font size commands to approximate point sizes for use with
Typst.

## Usage

``` r
translate_font_size(latex_size)
```

## Arguments

- latex_size:

  Character string or NULL. A LaTeX size command name (e.g.,
  "footnotesize", "small").

## Value

Numeric point size, or NULL if input is NULL.
