# Create a Typst formatting specification

Define formatting rules for specific cells, rows, or columns. Consumed
by [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) via
its `formats` parameter.

## Usage

``` r
zzo2f_format(
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

  Integer vector or NULL. Row indices (1-based, data rows only; header
  is row 0 in tinytable conventions but is not targeted here).

- cols:

  Integer or character vector or NULL. Column indices or names.

- bold:

  Logical.

- italic:

  Logical.

- color:

  Character or NULL. LaTeX color name or hex string; translated via
  [`translate_latex_color()`](https://rgt47.github.io/zzobj2fig/reference/translate_latex_color.md).

- background:

  Character or NULL. LaTeX color name or hex string for cell background.

- condition:

  Function or NULL. Applied to cell values (coerced to character);
  formatting applies only where it returns TRUE.

## Value

An S3 object of class `"zzo2f_format"`.

## Examples

``` r
if (FALSE) { # \dontrun{
zzo2f_format(rows = 1:3, cols = 1, bold = TRUE)
zzo2f_format(cols = "p_value",
             condition = function(x) as.numeric(x) < 0.05,
             bold = TRUE, color = "red")
} # }
```
