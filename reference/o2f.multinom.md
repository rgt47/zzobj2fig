# o2f method for multinomial logistic regression

o2f method for multinomial logistic regression

## Usage

``` r
# S3 method for class 'multinom'
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

  A multinom object from the nnet package.

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
