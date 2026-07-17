# Create table footnotes

Create footnote specifications for use with o2f(). Supports multiple
notation styles following academic conventions.

## Usage

``` r
o2f_footnote(
  general = NULL,
  number = NULL,
  alphabet = NULL,
  symbol = NULL,
  title_general = NULL,
  title_number = NULL,
  title_alphabet = NULL,
  title_symbol = NULL,
  footnote_as_chunk = FALSE,
  threeparttable = TRUE
)
```

## Arguments

- general:

  Character vector. General footnotes (unlabeled).

- number:

  Character vector. Footnotes with numeric labels (1, 2, 3).

- alphabet:

  Character vector. Footnotes with alphabetic labels (a, b, c).

- symbol:

  Character vector. Footnotes with symbol labels (\*, †, ‡).

- title_general:

  Character. Header for general footnotes section.

- title_number:

  Character. Header for numbered footnotes section.

- title_alphabet:

  Character. Header for alphabetic footnotes section.

- title_symbol:

  Character. Header for symbol footnotes section.

- footnote_as_chunk:

  Logical. If TRUE, print footnotes as a text chunk rather than a list.

- threeparttable:

  Logical. If TRUE (default), wrap table in threeparttable environment
  for proper footnote placement.

## Value

A o2f_footnote object (list with class "o2f_footnote").

## Details

Table footnotes in LaTeX require special handling. This function creates
a specification that o2f() uses to apply kableExtra's footnote()
function.

The threeparttable option (default TRUE) ensures footnotes appear
directly below the table rather than at the page bottom.

## Examples

``` r
if (FALSE) { # \dontrun{
# Simple general footnote
fn <- o2f_footnote(general = "Data from 2024 survey.")

# Multiple notation styles (APA format)
fn <- o2f_footnote(
  general = "CI = confidence interval.",
  symbol = c("p < 0.05", "p < 0.01", "p < 0.001")
)

# Use with o2f()
o2f(df, footnote = fn)
} # }
```
