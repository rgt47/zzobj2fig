# Include a o2f table in a wraptable environment

Generate LaTeX code to include a table with text wrapping around it.
Requires the wrapfig package.

## Usage

``` r
o2f_include_wrap(
  path,
  placement = "r",
  wrap_width = "0.5\\textwidth",
  width = NULL,
  caption = NULL,
  label = NULL,
  cat = TRUE
)
```

## Arguments

- path:

  Path to the PDF file.

- placement:

  Placement: "r", "R", "l", "L", "i", "I", "o", "O". Lowercase allows
  float, uppercase forces position.

- wrap_width:

  Width of the wrapped area (e.g., "0.5\textwidth").

- width:

  Width of the graphic within wrap area.

- caption:

  Optional caption.

- label:

  Optional label.

- cat:

  Logical. If TRUE (default), prints via cat().

## Value

LaTeX code (invisibly if cat=TRUE).

## Details

Placement options:

- r/R: right side of text

- l/L: left side of text

- i/I: inside margin (near binding)

- o/O: outside margin

Requires `\\usepackage{wrapfig}` in LaTeX preamble.

## Examples

``` r
if (FALSE) { # \dontrun{
o2f_include_wrap("tables/cars",
                 placement = "r",
                 wrap_width = "0.5\\textwidth",
                 caption = "Car data")
} # }
```
