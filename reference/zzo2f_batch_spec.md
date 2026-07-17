# Spec constructor for zzo2f advanced batch processing

Spec constructor for zzo2f advanced batch processing

## Usage

``` r
zzo2f_batch_spec(df, filename, ...)
```

## Arguments

- df:

  A data frame.

- filename:

  Base filename (no extension).

- ...:

  Per-table overrides passed to
  [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md).

## Value

A `zzo2f_batch_spec` object.

## Examples

``` r
if (FALSE) { # \dontrun{
specs <- list(
  zzo2f_batch_spec(mtcars, "mt", caption = "MT"),
  zzo2f_batch_spec(iris,   "ir", theme = "nejm")
)
zzo2f_batch_advanced(specs)
} # }
```
