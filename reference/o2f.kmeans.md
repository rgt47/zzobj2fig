# o2f method for k-means clustering

o2f method for k-means clustering

## Usage

``` r
# S3 method for class 'kmeans'
o2f(x, matrix = "centers", digits = 3, ...)
```

## Arguments

- x:

  A kmeans object.

- matrix:

  Character. Which results to display: "centers" (cluster centers) or
  "summary" (cluster sizes and SS).

- digits:

  Number of decimal places.

- ...:

  Additional arguments passed to o2f().

## Value

Invisibly returns the path to the generated PDF.
