# o2f knitr engine

Process a o2f code chunk in R Markdown. The chunk should contain R code
that evaluates to a data frame.

## Usage

``` r
o2f_engine(options)
```

## Arguments

- options:

  Chunk options passed by knitr.

## Value

Engine output for knitr.

## Details

Supported chunk options (prefix with `o2f.`):

- `o2f.scolor`: Row shading color

- `o2f.caption`: Table caption

- `o2f.label`: LaTeX label

- `o2f.theme`: Theme name

- `o2f.align`: Column alignment

- `o2f.crop_margin`: Crop margin

- `o2f.output_format`: Output format (pdf, png, svg)

## Examples

``` r
if (FALSE) { # \dontrun{
# In R Markdown:
# ```{o2f, o2f.caption="My Table", o2f.theme="nejm"}
# mtcars[1:5, 1:4]
# ```
} # }
```
