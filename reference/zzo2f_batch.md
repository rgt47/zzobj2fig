# Batch-render tables with the Typst backend

Batch-render tables with the Typst backend

## Usage

``` r
zzo2f_batch(
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

  A (named) list of data frames.

- sub_dir:

  Output directory.

- theme:

  Theme name or object.

- parallel:

  Logical. Use `future.apply` if available.

- verbose:

  Logical.

- ...:

  Passed to
  [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md).

## Value

Named list of output file paths (invisible).

## Examples

``` r
if (FALSE) { # \dontrun{
zzo2f_batch(list(a = mtcars[1:5, 1:3], b = iris[1:5, 1:3]))
} # }
```
