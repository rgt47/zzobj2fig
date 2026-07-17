# Advanced batch rendering with per-table overrides

Advanced batch rendering with per-table overrides

## Usage

``` r
zzo2f_batch_advanced(
  specs,
  sub_dir = get_default_figures_dir(),
  theme = NULL,
  parallel = FALSE,
  verbose = FALSE,
  ...
)
```

## Arguments

- specs:

  A list of `zzo2f_batch_spec` objects.

- sub_dir:

  Default output directory.

- theme:

  Default theme.

- parallel:

  Logical.

- verbose:

  Logical.

- ...:

  Default arguments passed to each
  [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md)
  call.

## Value

Named list of output file paths.
