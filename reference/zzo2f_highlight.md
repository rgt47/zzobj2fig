# Highlight cells by condition (Typst backend)

Highlight cells by condition (Typst backend)

## Usage

``` r
zzo2f_highlight(
  condition,
  background = "yellow!30",
  bold = FALSE,
  color = NULL
)
```

## Arguments

- condition:

  Function returning TRUE/FALSE for cell values.

- background:

  Character. Default LaTeX-style "yellow!30".

- bold:

  Logical.

- color:

  Character or NULL.

## Value

A `zzo2f_format` spec.

## Examples

``` r
if (FALSE) { # \dontrun{
zzo2f_highlight(function(x) as.numeric(x) < 0.05, bold = TRUE)
} # }
```
