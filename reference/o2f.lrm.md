# o2f method for rms logistic regression models

o2f method for rms logistic regression models

## Usage

``` r
# S3 method for class 'lrm'
o2f(
  x,
  digits = 3,
  exponentiate = TRUE,
  conf.int = TRUE,
  conf.level = 0.95,
  output = c("coef", "anova"),
  ...
)
```

## Arguments

- x:

  An lrm object from the rms package.

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
model <- lrm(am ~ rcs(mpg, 4) + wt, data = mtcars)
o2f(model, exponentiate = TRUE, filename = "lrm_odds_ratios")
o2f(model, output = "anova", filename = "lrm_anova")
} # }
```
