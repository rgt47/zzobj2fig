# o2f method for ordinal logistic regression (polr)

o2f method for ordinal logistic regression (polr)

## Usage

``` r
# S3 method for class 'polr'
o2f(
  x,
  digits = 3,
  exponentiate = FALSE,
  conf.int = TRUE,
  conf.level = 0.95,
  ...
)
```

## Arguments

- x:

  A polr object from the MASS package.

- digits:

  Number of decimal places.

- exponentiate:

  Logical. Exponentiate coefficients to get odds ratios.

- conf.int:

  Logical. Include confidence intervals.

- conf.level:

  Confidence level for intervals.

- ...:

  Additional arguments passed to o2f().

## Value

Invisibly returns the path to the generated PDF.
