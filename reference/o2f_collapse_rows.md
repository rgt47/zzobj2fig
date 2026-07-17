# Create collapse rows specification

Specify columns to collapse into multi-row cells. Consecutive identical
values are merged using LaTeX multirow.

## Usage

``` r
o2f_collapse_rows(
  columns = NULL,
  valign = c("middle", "top", "bottom"),
  latex_hline = c("full", "major", "none", "custom"),
  custom_latex_hline = NULL,
  row_group_label_fonts = NULL
)
```

## Arguments

- columns:

  Integer vector or column names. Columns to collapse.

- valign:

  Vertical alignment: "top", "middle", or "bottom".

- latex_hline:

  Horizontal line style: "full", "major", "none", or "custom".

- custom_latex_hline:

  Integer vector. Row indices for custom hlines (when latex_hline =
  "custom").

- row_group_label_fonts:

  List of font specifications for group labels.

## Value

A o2f_collapse object (list with class "o2f_collapse").

## Examples

``` r
if (FALSE) { # \dontrun{
# Collapse first column
o2f(df, collapse_rows = o2f_collapse_rows(1))

# Collapse by column name with top alignment
o2f(df, collapse_rows = o2f_collapse_rows("group", valign = "top"))
} # }
```
