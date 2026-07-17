# Bold specific columns

Convenience function to bold entire columns.

## Usage

``` r
o2f_bold_col(cols)
```

## Arguments

- cols:

  Integer vector or character vector of column indices or names.

## Value

A o2f_format object with bold=TRUE for specified columns.

## Examples

``` r
if (FALSE) { # \dontrun{
o2f_bold_col(c("estimate", "p_value"))
o2f_bold_col(1:2)
} # }
```
