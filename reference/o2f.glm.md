# o2f method for generalized linear models

o2f method for generalized linear models

## Usage

``` r
# S3 method for class 'glm'
o2f(
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

  Logical. Exponentiate coefficients (for logistic/Poisson regression).

- conf.level:

  Confidence level for confidence intervals.

- ...:

  Additional arguments passed to o2f.default.

## Value

Invisibly returns the path to the generated PDF.

## Examples

``` r
if (FALSE) { # \dontrun{
model <- glm(am ~ mpg + hp, data = mtcars, family = binomial)
o2f(model, exponentiate = TRUE)
} # }
```
