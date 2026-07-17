# o2f method for survreg (parametric survival models)

o2f method for survreg (parametric survival models)

## Usage

``` r
# S3 method for class 'survreg'
o2f(x, digits = 3, conf.int = TRUE, conf.level = 0.95, ...)
```

## Arguments

- x:

  A survreg object from the survival package.

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
