# zzo2f method for linear models

zzo2f method for linear models

## Usage

``` r
# S3 method for class 'lm'
zzo2f(
  x,
  digits = 3,
  include = c("estimate", "std.error", "statistic", "p.value"),
  conf.level = 0.95,
  ...
)
```

## Arguments

- x:

  An lm object.

- digits:

  Number of decimal places.

- include:

  Character vector of statistics to include.

- conf.level:

  Confidence level for confidence intervals.

- ...:

  Additional arguments passed to zzo2f.default.

## Value

Invisibly returns the path to the output file.
