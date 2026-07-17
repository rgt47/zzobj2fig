# o2f method for principal component analysis

o2f method for principal component analysis

## Usage

``` r
# S3 method for class 'prcomp'
o2f(x, matrix = "rotation", digits = 3, ...)
```

## Arguments

- x:

  A prcomp object.

- matrix:

  Character. Which matrix to display: "rotation" (loadings), "x"
  (scores), or "summary" (variance explained).

- digits:

  Number of decimal places.

- ...:

  Additional arguments passed to o2f().

## Value

Invisibly returns the path to the generated PDF.
