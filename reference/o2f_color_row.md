# Color specific rows

Convenience function to apply background color to rows.

## Usage

``` r
o2f_color_row(rows, background)
```

## Arguments

- rows:

  Integer vector of row indices (1-based, excluding header).

- background:

  LaTeX color for row background.

## Value

A o2f_format object with specified background for rows.

## Examples

``` r
if (FALSE) { # \dontrun{
o2f_color_row(1, "gray!20")
o2f_color_row(c(1, 3, 5), "blue!10")
} # }
```
