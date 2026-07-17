# o2f method for lme4 generalized linear mixed models

o2f method for lme4 generalized linear mixed models

## Usage

``` r
# S3 method for class 'glmerMod'
o2f(
  x,
  effects = "fixed",
  digits = 3,
  exponentiate = FALSE,
  conf.int = TRUE,
  conf.level = 0.95,
  ...
)
```

## Arguments

- x:

  A lmerMod object from lme4.

- effects:

  Character. Which effects to show: "fixed", "ran_pars", or "ran_vals".

- digits:

  Number of decimal places.

- exponentiate:

  Logical. Exponentiate coefficients.

- conf.int:

  Logical. Include confidence intervals.

- conf.level:

  Confidence level for intervals.

- ...:

  Additional arguments passed to o2f().

## Value

Invisibly returns the path to the generated PDF.
