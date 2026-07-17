# o2f method for rms ordinal regression models

o2f method for rms ordinal regression models

## Usage

``` r
# S3 method for class 'orm'
o2f(
  x,
  digits = 3,
  exponentiate = TRUE,
  conf.int = TRUE,
  conf.level = 0.95,
  output = c("coef", "anova"),
  intercepts = FALSE,
  ...
)
```

## Arguments

- x:

  An orm object from the rms package.

- digits:

  Number of decimal places.

- exponentiate:

  Logical. If TRUE, exponentiate coefficients to get odds ratios.

- conf.int:

  Logical. Include confidence intervals.

- conf.level:

  Confidence level for intervals.

- output:

  Character. Type of output: "coef" for coefficient table, "anova" for
  ANOVA-style chunk tests.

- intercepts:

  Logical. If TRUE, include intercept terms in coefficient table.
  Default FALSE since ordinal models often have many intercepts.

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
mtcars$gear_ord <- ordered(mtcars$gear)
model <- orm(gear_ord ~ mpg + wt, data = mtcars)
o2f(model, exponentiate = TRUE, filename = "orm_odds_ratios")
} # }
```
