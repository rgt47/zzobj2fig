# o2f method for rms ordinary least squares models

o2f method for rms ordinary least squares models

## Usage

``` r
# S3 method for class 'ols'
o2f(
  x,
  digits = 3,
  conf.int = TRUE,
  conf.level = 0.95,
  output = c("coef", "anova"),
  ...
)
```

## Arguments

- x:

  An ols object from the rms package.

- digits:

  Number of decimal places.

- conf.int:

  Logical. Include confidence intervals.

- conf.level:

  Confidence level for intervals.

- output:

  Character. Type of output: "coef" for coefficient table, "anova" for
  ANOVA-style chunk tests.

- ...:

  Additional arguments passed to o2f().

## Value

Invisibly returns the path to the generated PDF.

## Examples

``` r
if (FALSE) { # \dontrun{
library(rms)
dd <- datadist(mtcars)
options(datadist = "dd")
model <- ols(mpg ~ rcs(wt, 4) + cyl, data = mtcars)
o2f(model, filename = "ols_results")
o2f(model, output = "anova", filename = "ols_anova")
} # }
```
