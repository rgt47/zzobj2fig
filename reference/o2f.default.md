# Default method for o2f (data frames)

Default method for o2f (data frames)

o2f method for data.frame

## Usage

``` r
# Default S3 method
o2f(
  x,
  filename = NULL,
  sub_dir = get_default_figures_dir(),
  scolor = NULL,
  verbose = FALSE,
  extra_packages = NULL,
  document_class = NULL,
  caption = NULL,
  caption_short = NULL,
  label = NULL,
  align = NULL,
  longtable = FALSE,
  crop = TRUE,
  crop_margin = 10,
  theme = NULL,
  footnote = NULL,
  header_above = NULL,
  collapse_rows = NULL,
  ...
)

# S3 method for class 'data.frame'
o2f(x, ...)
```

## Arguments

- x:

  A data frame to convert to a LaTeX table.

- filename:

  Base name for output files.

- sub_dir:

  Output directory.

- scolor:

  Row shading color.

- verbose:

  Print progress messages.

- extra_packages:

  Additional LaTeX packages.

- document_class:

  LaTeX document class.

- caption:

  Table caption.

- caption_short:

  Short caption for List of Tables.

- label:

  LaTeX label for cross-referencing.

- align:

  Column alignment (can include o2f_siunitx for decimal align).

- longtable:

  Use longtable for multi-page tables.

- crop:

  Crop the PDF output.

- crop_margin:

  Crop margin size.

- theme:

  Theme name or o2f_theme object.

- footnote:

  A o2f_footnote object for table footnotes.

- header_above:

  A o2f_header object or list for spanning headers.

- collapse_rows:

  A o2f_collapse object for multi-row cells.

- ...:

  Additional arguments (ignored).

## Value

Invisibly returns the path to the generated PDF.
