# o2f method for nlme linear mixed models

o2f method for nlme linear mixed models

## Usage

``` r
# S3 method for class 'lme'
o2f(x, effects = "fixed", digits = 3, conf.int = TRUE, conf.level = 0.95, ...)
```

## Arguments

- x:

  An lme object from nlme.

- effects:

  Character. Which effects to show: "fixed" or "ran_pars".

- digits:

  Number of decimal places.

- conf.int:

  Logical. Include confidence intervals.

- conf.level:

  Confidence level for intervals.

- ...:

  Additional arguments passed to o2f().

## Value

Invisibly returns the path to the generated PDF.
