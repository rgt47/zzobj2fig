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

  Additional arguments passed to
  [`tinytable::tt()`](https://vincentarelbundock.github.io/tinytable/man/tt.html).

- filename:

  Character string. Base name for output file (without extension).
  Defaults to the deparsed name of `x`.

- sub_dir:

  Character string. Output directory. Defaults to "analysis/figures" in
  zzcollab projects, "figures" otherwise.

- verbose:

  Logical. Print progress messages. Default FALSE.

- caption:

  Character string or NULL. Table caption.

- align:

  Character vector or NULL. Column alignments ("l", "c", "r"). Length 1
  (applied to all columns) or one per column. NULL for auto-detect.

- theme:

  Character string, o2f_theme object, or NULL. Theme name (e.g., "nejm",
  "apa") or custom theme. Uses the existing o2f theme system.

- scolor:

  Character string or NULL. LaTeX color spec for row striping,
  translated to hex. Overrides theme setting.

- footnote:

  A o2f_footnote object or NULL. Table footnotes.

- header_above:

  A o2f_header object, list of o2f_header objects, or NULL. Spanning
  column headers.

- format:

  Character string. Output format: "pdf" (default), "png", or "svg".

- dpi:

  Integer. PNG resolution in dots per inch. Default 300.

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
