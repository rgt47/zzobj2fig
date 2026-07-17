# Render a table inline for R Markdown / Quarto (Typst backend)

Generates a PDF or PNG via
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) and,
when running inside a knitr document, emits the appropriate markdown
image reference so the image is embedded.

## Usage

``` r
zzo2f_inline(
  x,
  width = NULL,
  align = c("center", "left", "right"),
  filename = NULL,
  format = c("auto", "pdf", "png"),
  dpi = 150L,
  sub_dir = NULL,
  caption = NULL,
  label = NULL,
  ...
)
```

## Arguments

- x:

  A data frame, matrix, or table.

- width:

  Character or NULL. Passed through to later include helpers;
  [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md)
  itself does not consume it.

- align:

  One of `"center"`, `"left"`, `"right"`.

- filename:

  Output base filename; generated if NULL.

- format:

  One of `"auto"`, `"pdf"`, `"png"`. `"auto"` picks `"pdf"` for LaTeX
  knitr output and `"png"` otherwise.

- dpi:

  PNG resolution.

- sub_dir:

  Output directory; [`tempdir()`](https://rdrr.io/r/base/tempfile.html)
  if NULL.

- caption:

  Character or NULL. Passed to
  [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md).

- label:

  Character or NULL. Typst label (no angle brackets); appended to the
  emitted image reference when running under knitr.

- ...:

  Additional arguments forwarded to
  [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md).

## Value

Character path to the rendered file (invisible when used inside knitr).

## Examples

``` r
if (FALSE) { # \dontrun{
zzo2f_inline(mtcars[1:5, 1:3], caption = "Demo")
} # }
```
