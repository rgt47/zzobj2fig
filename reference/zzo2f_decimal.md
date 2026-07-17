# Decimal-place formatting for numeric columns (Typst backend)

Produces a `zzo2f_format` spec that rounds and formats numeric columns
to a fixed number of decimals. Typst has no direct `siunitx` equivalent;
alignment is achieved via
[`tinytable::format_tt()`](https://vincentarelbundock.github.io/tinytable/man/format_tt.html)
padding.

## Usage

``` r
zzo2f_decimal(cols, digits = 3L)
```

## Arguments

- cols:

  Integer or character vector. Columns to format.

- digits:

  Integer. Decimal places (default 3).

## Value

A `zzo2f_format` spec with `digits` slot attached.

## Examples

``` r
if (FALSE) { # \dontrun{
zzo2f_decimal(c("estimate", "std.error"), digits = 2)
} # }
```
