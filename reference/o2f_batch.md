# Process multiple tables in batch

Generate multiple LaTeX tables with consistent styling in a single
operation. Tables can be processed sequentially or in parallel.

## Usage

``` r
o2f_batch(
  data_list,
  sub_dir = get_default_figures_dir(),
  theme = NULL,
  parallel = FALSE,
  verbose = FALSE,
  ...
)
```

## Arguments

- data_list:

  A named list of data frames to process.

- sub_dir:

  Output directory for all tables. Defaults to "figures".

- theme:

  Theme name or o2f_theme object to apply to all tables.

- parallel:

  Logical. Use parallel processing if available.

- verbose:

  Logical. Print progress messages.

- ...:

  Additional arguments passed to all o2f() calls.

## Value

A named list of output file paths.

## Examples

``` r
if (FALSE) { # \dontrun{
tables <- list(
  mtcars_summary = head(mtcars),
  iris_summary = head(iris),
  airquality_summary = head(airquality)
)

results <- o2f_batch(tables, theme = "nejm")
} # }
```
