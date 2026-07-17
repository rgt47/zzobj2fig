# Include a o2f table inline (no float)

Generate LaTeX code to include a cropped PDF table without a float
environment. Useful when exact placement is required.

## Usage

``` r
o2f_include_inline(
  path,
  width = "\\textwidth",
  center = TRUE,
  vspace = NULL,
  cat = TRUE
)
```

## Arguments

- path:

  Path to the PDF file.

- width:

  Width specification. Default "\textwidth".

- center:

  Logical. Center the graphic. Default TRUE.

- vspace:

  Vertical space before/after (e.g., "1em"). Default NULL.

- cat:

  Logical. If TRUE (default), prints via cat().

## Value

LaTeX code (invisibly if cat=TRUE).

## Examples

``` r
if (FALSE) { # \dontrun{
o2f_include_inline("tables/cars", width = "0.9\\textwidth")
} # }
```
