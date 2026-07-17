# Advanced batch processing with per-table options

Process multiple tables where each table can have different settings.

## Usage

``` r
o2f_batch_advanced(
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

  A list of o2f_batch_spec objects.

- sub_dir:

  Default output directory.

- theme:

  Default theme (can be overridden per table).

- parallel:

  Use parallel processing.

- verbose:

  Print progress messages.

- ...:

  Default arguments passed to all o2f() calls.

## Value

A named list of output file paths.
