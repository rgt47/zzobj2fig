# o2f method for linear models

o2f method for linear models

## Usage

``` r
# S3 method for class 'lm'
o2f(
  x,
  digits = 3,
  include = c("estimate", "std.error", "statistic", "p.value"),
  conf.level = 0.95,
  ...
)
```

## Arguments

- x:

  An lm object.

- digits:

  Number of decimal places for coefficients.

- include:

  Character vector of statistics to include. Options: "estimate",
  "std.error", "statistic", "p.value", "conf.int".

- conf.level:

  Confidence level for confidence intervals.

- ...:

  Additional arguments passed to o2f.default.

## Value

Invisibly returns the path to the generated PDF.

## Examples

``` r
if (FALSE) { # \dontrun{
model <- lm(mpg ~ cyl + hp + wt, data = mtcars)
o2f(model, filename = "regression_table")
} # }
```
