# o2f method for ARIMA models

o2f method for ARIMA models

## Usage

``` r
# S3 method for class 'Arima'
o2f(x, digits = 3, conf.int = TRUE, conf.level = 0.95, ...)
```

## Arguments

- x:

  An Arima object from the stats or forecast package.

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
