# Protect siunitx column headers with braces

For siunitx S columns, non-numeric content in the header must be wrapped
in braces to prevent siunitx from trying to parse it as a number. This
function post-processes the LaTeX table to add braces around headers in
S columns.

## Usage

``` r
protect_siunitx_headers(latex_table, siunitx_cols)
```

## Arguments

- latex_table:

  The LaTeX table string (or kable object).

- siunitx_cols:

  Integer vector of column indices with siunitx alignment.

## Value

Modified LaTeX table with protected headers.
