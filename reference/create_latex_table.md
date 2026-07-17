# Create a LaTeX table with alternating row colors using kableExtra

Create a LaTeX table with alternating row colors using kableExtra

## Usage

``` r
create_latex_table(
  df,
  tex_file,
  scolor,
  extra_packages = NULL,
  document_class = "article",
  caption = NULL,
  caption_short = NULL,
  label = NULL,
  align = NULL,
  longtable = FALSE,
  striped = TRUE,
  footnote = NULL,
  header_above = NULL,
  collapse_rows = NULL
)
```

## Arguments

- df:

  A dataframe to convert to a LaTeX table.

- tex_file:

  Path to the output LaTeX file.

- scolor:

  A LaTeX color name for alternating row shading.

- extra_packages:

  A list of LaTeX package specifications. Defaults to NULL.

- document_class:

  LaTeX document class to use. Defaults to "article".

- caption:

  Table caption. Defaults to NULL.

- caption_short:

  Short caption for List of Tables. Defaults to NULL.

- label:

  LaTeX label for cross-referencing. Defaults to NULL.

- align:

  Column alignment vector or string. Defaults to NULL (auto).

- longtable:

  Logical. Use longtable for multi-page tables.

- striped:

  Logical. Apply alternating row colors.

- footnote:

  A o2f_footnote object for table footnotes.

- header_above:

  A o2f_header object or list for spanning headers.

- collapse_rows:

  A o2f_collapse object for multi-row cells.
