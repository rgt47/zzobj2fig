# o2f method for rms Cox proportional hazards models

o2f method for rms Cox proportional hazards models

## Usage

``` r
# S3 method for class 'cph'
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

  A cph object from the rms package.

- digits:

  Number of decimal places.

- exponentiate:

  Logical. If TRUE, exponentiate coefficients to get hazard ratios.

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
model <- cph(Surv(time, status) ~ age + rcs(meal.cal, 4) + sex, data = lung)
o2f(model, exponentiate = TRUE, filename = "cox_hazard_ratios")
o2f(model, output = "anova", filename = "cox_anova")
} # }
```
