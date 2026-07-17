# Create a batch specification

Create a specification object for batch processing with per-table
overrides.

## Usage

``` r
o2f_batch_spec(df, filename, ...)
```

## Arguments

- df:

  Data frame for this table.

- filename:

  Output filename.

- ...:

  Additional arguments specific to this table (override batch defaults).

## Value

A o2f_batch_spec object.

## Examples

``` r
if (FALSE) { # \dontrun{
specs <- list(
  o2f_batch_spec(mtcars, "mtcars_table", caption = "Motor Trend Data"),
  o2f_batch_spec(iris, "iris_table", caption = "Iris Data", theme = "apa")
)
o2f_batch_advanced(specs)
} # }
```
