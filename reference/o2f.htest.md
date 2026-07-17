# o2f method for hypothesis tests

o2f method for hypothesis tests

## Usage

``` r
# S3 method for class 'htest'
o2f(x, digits = 3, ...)
```

## Arguments

- x:

  An htest object (from t.test, chisq.test, etc.).

- digits:

  Number of decimal places.

- ...:

  Additional arguments passed to o2f.default.

## Value

Invisibly returns the path to the generated PDF.

## Examples

``` r
if (FALSE) { # \dontrun{
test <- t.test(mtcars$mpg, mu = 20)
o2f(test, filename = "ttest_result")
} # }
```
