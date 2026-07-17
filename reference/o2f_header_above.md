# Create spanning header specification

Create a spanning header row for grouped columns. Headers span multiple
columns with appropriate rules (cmidrule).

## Usage

``` r
o2f_header_above(
  ...,
  bold = TRUE,
  italic = FALSE,
  align = "c",
  line = TRUE,
  line_sep = 3
)
```

## Arguments

- ...:

  Named arguments where names are header labels and values are the
  number of columns to span. Use " " (space) for columns without a
  spanning header.

- bold:

  Logical. Bold header text.

- italic:

  Logical. Italic header text.

- align:

  Alignment for header cells ("c", "l", or "r").

- line:

  Logical. Add horizontal line below spanning header.

- line_sep:

  Numeric. Space between line and header text (pts).

## Value

A o2f_header object (list with class "o2f_header").

## Details

The sum of column spans must equal the number of columns in the table
(including row names if present).

## Examples

``` r
if (FALSE) { # \dontrun{
# Table with 5 columns: one label column, two "Treatment", two "Control"
hdr <- o2f_header_above(
  " " = 1,
  "Treatment" = 2,
  "Control" = 2
)

o2f(df, header_above = hdr)

# Multiple header rows
o2f(df, header_above = list(
  o2f_header_above(" " = 1, "Group A" = 2, "Group B" = 2),
  o2f_header_above(" " = 1, "T1" = 1, "T2" = 1, "C1" = 1, "C2" = 1)
))
} # }
```
