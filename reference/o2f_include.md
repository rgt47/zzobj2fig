# Include a o2f table as a LaTeX figure

Generate LaTeX code to include a cropped PDF table in a figure
environment with caption, label, and positioning control.

## Usage

``` r
o2f_include(
  path,
  caption = NULL,
  label = NULL,
  position = "htbp",
  width = "\\textwidth",
  center = TRUE,
  short_caption = NULL,
  cat = TRUE
)
```

## Arguments

- path:

  Path to the PDF file (with or without \_cropped suffix and .pdf
  extension).

- caption:

  Figure caption text.

- label:

  LaTeX label for cross-referencing (e.g., "fig:results").

- position:

  Float position specifier: "htbp", "H", "t", "b", "p", or combinations.

- width:

  Width specification for includegraphics. Default "\textwidth".

- center:

  Logical. Center the figure. Default TRUE.

- short_caption:

  Short caption for List of Figures.

- cat:

  Logical. If TRUE (default), prints the LaTeX code via cat(). If FALSE,
  returns the code as a character string.

## Value

If cat=TRUE, invisibly returns the LaTeX code after printing. If
cat=FALSE, returns the LaTeX code as a character string.

## Details

Use this function in R Markdown code chunks with `results='asis'` to
include o2f-generated tables as properly formatted LaTeX figures.

The function automatically handles path resolution:

- Adds "\_cropped.pdf" suffix if not present

- Works with or without file extension

## Examples

``` r
if (FALSE) { # \dontrun{
# In R Markdown chunk with results='asis':
o2f(mtcars[1:5,], filename = "cars", sub_dir = "tables")
o2f_include("tables/cars",
            caption = "Motor Trend Car Data",
            label = "fig:cars")

# With positioning control
o2f_include("tables/cars",
            caption = "Motor Trend Car Data",
            label = "fig:cars",
            position = "H",
            width = "0.8\\textwidth")
} # }
```
