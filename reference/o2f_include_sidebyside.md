# Include side-by-side o2f tables

Generate LaTeX code for two tables side by side using minipage
environments.

## Usage

``` r
o2f_include_sidebyside(
  path1,
  path2,
  caption1 = NULL,
  caption2 = NULL,
  label1 = NULL,
  label2 = NULL,
  width1 = "0.48\\textwidth",
  width2 = "0.48\\textwidth",
  position = "htbp",
  main_caption = NULL,
  main_label = NULL,
  cat = TRUE
)
```

## Arguments

- path1:

  Path to first PDF.

- path2:

  Path to second PDF.

- caption1:

  Caption for first table.

- caption2:

  Caption for second table.

- label1:

  Label for first table.

- label2:

  Label for second table.

- width1:

  Width of first minipage. Default "0.48\textwidth".

- width2:

  Width of second minipage. Default "0.48\textwidth".

- position:

  Float position specifier.

- main_caption:

  Overall figure caption (optional).

- main_label:

  Overall figure label (optional).

- cat:

  Logical. If TRUE (default), prints via cat().

## Value

LaTeX code (invisibly if cat=TRUE).

## Examples

``` r
if (FALSE) { # \dontrun{
o2f_include_sidebyside(
  "tables/model1", "tables/model2",
  caption1 = "(a) Model 1", caption2 = "(b) Model 2",
  main_caption = "Comparison of regression models"
)
} # }
```
