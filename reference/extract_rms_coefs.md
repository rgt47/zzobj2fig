# Extract coefficient table from rms objects

Internal helper to extract and format coefficients from

rms model objects using their native summary methods.

## Usage

``` r
extract_rms_coefs(
  x,
  digits = 3,
  conf.int = TRUE,
  conf.level = 0.95,
  exponentiate = FALSE
)
```

## Arguments

- x:

  An rms model object.

- digits:

  Number of decimal places.

- conf.int:

  Logical. Include confidence intervals.

- conf.level:

  Confidence level for intervals.

- exponentiate:

  Logical. Exponentiate coefficients.

## Value

A data frame with formatted coefficients.
