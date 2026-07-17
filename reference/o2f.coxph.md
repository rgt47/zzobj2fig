# o2f method for Cox proportional hazards models

o2f method for Cox proportional hazards models

## Usage

``` r
# S3 method for class 'coxph'
o2f(
  x,
  digits = 3,
  exponentiate = TRUE,
  conf.int = TRUE,
  conf.level = 0.95,
  ...
)
```

## Arguments

- x:

  A coxph object from the survival package.

- digits:

  Number of decimal places.

- exponentiate:

  Logical. If TRUE, exponentiate coefficients to get hazard ratios.

- conf.int:

  Logical. Include confidence intervals.

- conf.level:

  Confidence level for intervals.

- ...:

  Additional arguments passed to o2f().

## Value

Invisibly returns the path to the generated PDF.

## Examples

``` r
if (FALSE) { # \dontrun{
library(survival)
model <- coxph(Surv(time, status) ~ age + sex + ph.ecog, data = lung)
o2f(model, exponentiate = TRUE, filename = "cox_hazard_ratios")
} # }
```
