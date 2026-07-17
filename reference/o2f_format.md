# Create a formatting specification

Define formatting rules for specific cells in a table. Formatting can
target specific rows, columns, or both, and can include bold, italic,
colors, or conditional highlighting.

## Usage

``` r
o2f_format(
  rows = NULL,
  cols = NULL,
  bold = FALSE,
  italic = FALSE,
  color = NULL,
  background = NULL,
  condition = NULL
)
```

## Arguments

- rows:

  Integer vector. Row indices to format (1-based, excluding header).
  NULL to apply to all rows.

- cols:

  Integer vector or character vector. Column indices or names to format.
  NULL to apply to all columns.

- bold:

  Logical. If TRUE, apply bold formatting.

- italic:

  Logical. If TRUE, apply italic formatting.

- color:

  Character. LaTeX color name for text (e.g., "red", "blue").

- background:

  Character. LaTeX color name for cell background.

- condition:

  A function that takes a cell value and returns TRUE/FALSE. Formatting
  is applied only to cells where condition returns TRUE.

## Value

A o2f_format object (list with class "o2f_format").

## Examples

``` r
if (FALSE) { # \dontrun{
# Bold specific cells
o2f_format(rows = 1:3, cols = 1, bold = TRUE)

# Highlight a column
o2f_format(cols = "p_value", background = "yellow!30")

# Conditional formatting
o2f_format(cols = "p_value",
           condition = function(x) as.numeric(x) < 0.05,
           bold = TRUE, color = "red")
} # }
```
