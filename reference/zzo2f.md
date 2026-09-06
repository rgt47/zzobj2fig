# Typst Backend for Table-to-Figure Conversion

Convert data frames to publication-quality table images using tinytable
and the Typst CLI. This provides a lightweight alternative to the
LaTeX-based [`o2f`](https://rgt47.github.io/zzobj2fig/reference/o2f.md)
pipeline, requiring only Typst (~40 MB binary) instead of a full LaTeX
distribution.

Generates PDF, PNG, or SVG table images from data frames using the
tinytable package and Typst CLI. Typst auto-sizes pages, so no cropping
step is needed.

## Usage

``` r
zzo2f(x, ...)
```

## Arguments

- x:

  A data frame, matrix, or table object to render.

- ...:

  Arguments passed to the method, and onward to
  [`tinytable::tt()`](https://vincentarelbundock.github.io/tinytable/man/tt.html).
  See
  [`zzo2f.default()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.default.md)
  for the full set accepted by the data frame method.

## Value

Invisibly returns the path to the output file.

## Details

The pipeline:

1.  Validate inputs and coerce to data.frame

2.  Resolve theme via existing o2f theme system, translate to Typst

3.  Build tinytable object with `tt()` / `style_tt()` / `group_tt()`

4.  Save to `.typ` via `save_tt()`

5.  Compile via `typst compile`

Parameters from
[`o2f()`](https://rgt47.github.io/zzobj2fig/reference/o2f.md) that are
dropped (LaTeX-specific): `extra_packages`, `document_class`,
`caption_short`, `label`, `longtable`, `crop`, `crop_margin`,
`collapse_rows`.

## Examples

``` r
if (FALSE) { # \dontrun{
zzo2f(mtcars[1:6, 1:4], filename = "mtcars_sample")
zzo2f(mtcars[1:6, 1:4], filename = "nejm_table",
      theme = "nejm", format = "png")
} # }
```
