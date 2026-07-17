# Include a o2f table in the margin

Generate LaTeX code to place a table in the right margin. Multiple
methods supported depending on document class.

## Usage

``` r
o2f_include_margin(
  path,
  caption = NULL,
  label = NULL,
  width = "\\marginparwidth",
  offset = "0pt",
  method = c("sidenotes", "marginpar", "tufte", "marginnote"),
  cat = TRUE
)
```

## Arguments

- path:

  Path to the PDF file.

- caption:

  Optional caption.

- label:

  Optional label.

- width:

  Width of graphic. Default "\marginparwidth".

- offset:

  Vertical offset (e.g., "-2em", "0pt"). Default "0pt".

- method:

  Method for margin placement: "sidenotes", "marginpar", "tufte", or
  "marginnote".

- cat:

  Logical. If TRUE (default), prints via cat().

## Value

LaTeX code (invisibly if cat=TRUE).

## Details

Methods and their requirements:

- **sidenotes**: Uses `marginfigure` environment. Requires
  `\\usepackage{sidenotes}`. Best for standard document classes.

- **marginpar**: Basic LaTeX `\\marginpar{}`. No extra packages needed
  but limited functionality (no captions).

- **tufte**: Uses `marginfigure` from tufte-latex classes. Only works
  with tufte-book or tufte-handout document classes.

- **marginnote**: Uses `\\marginnote{}` from marginnote package. Better
  positioning than marginpar. Requires `\\usepackage{marginnote}`.

## Examples

``` r
if (FALSE) { # \dontrun{
# With sidenotes package (recommended)
o2f_include_margin("tables/summary",
                   caption = "Summary statistics",
                   method = "sidenotes")

# Simple marginpar (no packages needed)
o2f_include_margin("tables/summary", method = "marginpar")

# For tufte document classes
o2f_include_margin("tables/summary",
                   caption = "Summary",
                   method = "tufte")
} # }
```
