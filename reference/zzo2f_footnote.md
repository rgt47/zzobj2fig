# Table footnotes (Typst backend)

Thin constructor that delegates to
[`o2f_footnote()`](https://rgt47.github.io/zzobj2fig/reference/o2f_footnote.md).
The resulting `o2f_footnote` object is already consumed by
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) via
the internal
[`translate_footnote()`](https://rgt47.github.io/zzobj2fig/reference/translate_footnote.md)
helper, which emits Typst notes.

## Usage

``` r
zzo2f_footnote(
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

A `o2f_footnote` object.

## Examples

``` r
if (FALSE) { # \dontrun{
fn <- zzo2f_footnote(
  general = "Data from 2024 survey.",
  symbol = c("p < 0.05", "p < 0.01")
)
zzo2f(df, footnote = fn)
} # }
```
