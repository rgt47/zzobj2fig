# Convert objects to LaTeX tables

Generic function for converting R objects to LaTeX tables and generating
PDF output.

## Usage

``` r
o2f(x, ...)
```

## Arguments

- x:

  An object to convert to a LaTeX table.

- ...:

  Additional arguments passed to methods.

## Value

Invisibly returns the path to the generated PDF file.

## Examples

``` r
if (FALSE) { # \dontrun{
# Data frame
o2f(mtcars)

# Linear model
model <- lm(mpg ~ cyl + hp, data = mtcars)
o2f(model)

# t-test
o2f(t.test(mtcars$mpg, mu = 20))
} # }
```
