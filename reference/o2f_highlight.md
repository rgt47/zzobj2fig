# Highlight cells based on a condition

Convenience function for conditional cell highlighting.

## Usage

``` r
o2f_highlight(condition, background = "yellow!30", bold = FALSE, color = NULL)
```

## Arguments

- condition:

  A function that takes a cell value and returns TRUE/FALSE.

- background:

  LaTeX color for highlighted cells. Defaults to "yellow!30".

- bold:

  Logical. Also apply bold to highlighted cells.

- color:

  LaTeX text color for highlighted cells.

## Value

A o2f_format object with the condition and styling specified.

## Examples

``` r
if (FALSE) { # \dontrun{
# Highlight significant p-values
o2f_highlight(function(x) as.numeric(x) < 0.05)

# Highlight large values in red
o2f_highlight(function(x) x > 100, background = "red!20", bold = TRUE)
} # }
```
