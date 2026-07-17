# Build a Typst `siunitx`-analog specification

Build a Typst `siunitx`-analog specification

## Usage

``` r
zzo2f_siunitx(
  table_format = "3.2",
  round_mode = c("none", "places", "figures"),
  round_precision = NULL,
  group_separator = NULL
)
```

## Arguments

- table_format:

  Character. Analogous to siunitx `table-format` (e.g., `"3.2"`). Used
  to compute integer-side and decimal-side padding widths.

- round_mode:

  One of `"none"`, `"places"`, `"figures"`.

- round_precision:

  Integer or NULL.

- group_separator:

  Character or NULL.

## Value

A `zzo2f_siunitx` object (character directive lines with a
`table_format` attribute).

## Examples

``` r
if (FALSE) { # \dontrun{
spec <- zzo2f_siunitx(table_format = "2.3", round_mode = "places",
                       round_precision = 3)
cat(unclass(spec), sep = "\n")
} # }
```
