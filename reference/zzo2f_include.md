# Include a rendered table as a Typst figure

Include a rendered table as a Typst figure

## Usage

``` r
zzo2f_include(
  path,
  caption = NULL,
  label = NULL,
  position = NULL,
  width = "\\textwidth",
  center = TRUE,
  short_caption = NULL,
  cat = TRUE
)
```

## Arguments

- path:

  Path to the image file (with or without extension).

- caption:

  Character or NULL.

- label:

  Character or NULL. Typst label (no angle brackets).

- position:

  Ignored; retained for API symmetry with
  [`o2f_include()`](https://rgt47.github.io/zzobj2fig/reference/o2f_include.md).

- width:

  Width spec; LaTeX `\textwidth` forms are translated to percentages.

- center:

  Logical. Emit inside an `#align(center)[...]` block.

- short_caption:

  Ignored; Typst has no short-caption concept in `#figure`.

- cat:

  Logical. Print with [`cat()`](https://rdrr.io/r/base/cat.html) if
  TRUE.

## Value

Character; printed when `cat = TRUE`.

## Examples

``` r
if (FALSE) { # \dontrun{
zzo2f_include("figures/mytab", caption = "Demo.", label = "tab-demo",
              cat = FALSE)
} # }
```
