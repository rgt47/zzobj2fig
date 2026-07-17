# Default method for zzo2f (data frames)

Default method for zzo2f (data frames)

## Usage

``` r
# Default S3 method
zzo2f(
  x,
  filename = NULL,
  sub_dir = get_default_figures_dir(),
  verbose = FALSE,
  caption = NULL,
  align = NULL,
  theme = NULL,
  scolor = NULL,
  footnote = NULL,
  header_above = NULL,
  format = c("pdf", "png", "svg"),
  dpi = 300L,
  separator_row = NULL,
  formats = NULL,
  collapse_rows = NULL,
  compile = TRUE,
  ...
)

# S3 method for class 'data.frame'
zzo2f(x, ...)

# S3 method for class 'matrix'
zzo2f(x, ...)

# S3 method for class 'table'
zzo2f(x, ...)
```

## Arguments

- x:

  A data frame, matrix, or table object to render.

- filename:

  Base name for output file.

- sub_dir:

  Output directory.

- verbose:

  Print progress messages.

- caption:

  Table caption.

- align:

  Column alignment.

- theme:

  Theme name or object.

- scolor:

  Row stripe color override.

- footnote:

  A o2f_footnote object.

- header_above:

  A o2f_header object.

- format:

  Output format: "pdf", "png", or "svg".

- dpi:

  PNG resolution.

- ...:

  Additional arguments passed to tinytable::tt().

## Value

Invisibly returns the path to the output file.
