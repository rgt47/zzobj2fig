# Translate LaTeX color specification to hex

Converts LaTeX color specs (e.g., "blue!10", "nejmshade", "#FF0000") to
hex color strings suitable for Typst/tinytable.

## Usage

``` r
translate_latex_color(color)
```

## Arguments

- color:

  Character string. A LaTeX color specification.

## Value

Character string with hex color (e.g., "#E6E6FF").
