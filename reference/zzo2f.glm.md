# zzo2f method for generalized linear models

zzo2f method for generalized linear models

## Usage

``` r
# S3 method for class 'glm'
zzo2f(
  x,
  digits = 3,
  include = c("estimate", "std.error", "statistic", "p.value"),
  exponentiate = FALSE,
  conf.level = 0.95,
  ...
)
```

## Arguments

- x:

  A glm object.

- digits:

  Number of decimal places.

- include:

  Character vector of statistics to include.

- exponentiate:

  Logical. Exponentiate coefficients.

- conf.level:

  Confidence level for confidence intervals.

- ...:

  Additional arguments passed to zzo2f.default.

## Value

Invisibly returns the path to the output file.
