# Create footnote marker for table cells

Insert a footnote marker into a cell value. Use this to mark cells that
correspond to footnotes.

## Usage

``` r
o2f_mark(text, mark, type = c("symbol", "number", "alphabet"))
```

## Arguments

- text:

  The cell text to add a marker to.

- mark:

  The footnote marker (number, letter, or symbol index).

- type:

  Marker type: "number", "alphabet", or "symbol".

## Value

Character string with LaTeX footnote marker.

## Examples

``` r
if (FALSE) { # \dontrun{
df$value[1] <- o2f_mark("23.5", 1, "symbol")
# Produces: "23.5*" (with proper LaTeX superscript)
} # }
```
