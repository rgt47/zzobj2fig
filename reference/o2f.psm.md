# o2f method for rms parametric survival models

o2f method for rms parametric survival models

## Usage

``` r
# S3 method for class 'psm'
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

  A psm object from the rms package.

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
library(survival)
dd <- datadist(lung)
options(datadist = "dd")
model <- psm(Surv(time, status) ~ age + sex, data = lung, dist = "weibull")
o2f(model, filename = "psm_results")
} # }
```
